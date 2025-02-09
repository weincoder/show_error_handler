import type { ReactNode } from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: ReactNode;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Easy to Use',
    Svg: require('@site/static/img/easy_to_use.png').default,
    description: (
      <>
        show_error_handler was designed from the ground up to be easily installed and used to quickly get error handling up and running in your application.
      </>
    ),
  },
  {
    title: 'Focus on What Matters',
    Svg: require('@site/static/img/focus_matters.png').default,
    description: (
      <>
        show_error_handler lets you focus on the errors, and we'll take care of the repetitive tasks. Go ahead, define your errors with our base class and we'll display them in the best way.
      </>
    ),
  },
  {
    title: 'Powered by Flutter',
    Svg: require('@site/static/img/powerd_by_dart.png').default,
    description: (
      <>
        Extend or customize how errors are displayed by reusing Flutter widgets. show_error_handler can be extended while reusing your application's styles and themes.
      </>
    ),
  },
];

function Feature({ title, Svg, description }: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <img className={styles.featureSvg} role="img"  src={Svg}/>
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
