import React from 'react';
import { storiesOf } from '@storybook/react';
import { Button } from '@storybook/react/demo';

export default { title: 'Button' };

export const WithText = () => <Button>Hello Button</Button>;

export const WithEmoji = () => (
  <Button>
    <span role="img" aria-label="so cool">
      😀 😎 👍 💯
    </span>
  </Button>
);

storiesOf('Buttons', module).add('With Text', () => <WithText />);
storiesOf('Buttons', module).add('With emoji', () => <WithEmoji />);