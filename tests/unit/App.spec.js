import { shallowMount } from '@vue/test-utils';
import app from '@/App.vue';

describe('App.vue', () => {
  it('renders props.msg when passed', () => {
    const msg = 'baki was here !...';
    const wrapper = shallowMount(app, {
      propsData: { msg },
    });
    expect(wrapper.vm.msg).toMatch(msg);
  });
});

test('number of projects listed', () => {
  const wrapper = shallowMount(app);
  //wrapper.vm.data();
  expect(wrapper.vm.projects.length).toBe(3);
});
