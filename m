Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369547;
	b=UaOq4cuCJljS5RSpYty+fStEXmxBq493fvHhff0ca5UQSEUif7Zy3EaRKI77Tw+u9Hv2
	 D1j2sUl0W5MoZznel8pU/3MIovu1TAvuOQayqbh8nklPJ8MJ5jiapFSCU6OH1vxW1HjXN
	 ZjU846H1F1A8vlTeL0ALR94enUhFi2G+Pzg6q+pPoqD+e36KYgIiSmnoXqILYdypQ+2nv
	 MPV3Res7niIq0Tzc4UbrKZ4f1Kdwg6dw/RnIPZUz/KEU8qjoVG8zxyF9xR8fQaWFYeQ5v
	 SV+28F2Gj6vLxJ3fmE9tTGNVwLnO6qqCXoA/5thWLxcekt3NzHgEqwU904XzX0t0oMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369547;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VJCeOh5b6JgpUubVuQHRCU0HfFrMWXIlXDQA1Oylnd0=;
	b=4B8xHIPvBPg8MI6mieF74YvQSMRkum8aoztQ2XD5zHl2WZ2z2ivYGpT2tCBy8lxwhCwQ
	 Pj6hQ5NM/ElBBsTcFLZTNMsROl2n0U7vBIk0KmpYKQbL0EbPG0L3W7eAV6nih0qBVJnj/
	 88+RrPViYTRrBXAKD4/j88d3iAvQLPGUwVzLlZX1kMz9bOf141UnYYZaBx6srUfvHZgQg
	 frPt+C6/zILyFI7QGGuYXCYfkfgRMWVzUC3e1V5cbGPJ8eGseyDJkZ/cX5RqTTz4fhBx6
	 +q/EjeGYVYukyhrOPHA4cPpp1CFPJPqsTCro2eJdLrce1X4xJeX+9/BAm/P4KNXGzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FiKjd7IF;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6BD606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6BD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FiKjd7IF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794369547; x=1825905547;
  h=date:from:to:cc:subject:message-id;
  bh=xfZBUQRbdG1TTTJ1L2g/3dCQQJSe0Dn6x4S+qTqaloo=;
  b=FiKjd7IFsVieV0SJvd3g+jpnaYVMZg3q+UTg4hZjQC1R4aB+njy6kN0R
   2kNpa0YuU+DcbqESYdBI9AeETTPOIChnmhawnMv59EdIGLDrlGt7cU5yP
   GXzpZPEo0KSWy0R5fyK8mvaDK9CF0B3I1Qt6FOaUlWQnVQ5a02UFlbtYw
   9QYruktl+41e98TRieApoo5OSaOKp1S1NTjFCq0gi/FTZyNpdU5mJOe7B
   AN8KIRYM7v3LS6CESFiUQ+N61eHkebDGbMz7aq1bWZAC2Sj67vf/zuY7x
   XrgwJcgyr/f4O8yE3Usa5DJBTtF5FHgDoFQYPP+DMvMD9p6vNqkBx3am8
   g==;
X-CSE-ConnectionGUID: nKo6aAytQjeQ32oDBs44Lw==
X-CSE-MsgGUID: LehJK2JoQJCc8JbKnEkhgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3054145"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3054145"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 19:59:06 -0800
X-CSE-ConnectionGUID: 7e2Pu2rzQAa3MBfkYHYKtA==
X-CSE-MsgGUID: MXmfCGVaQPywKiBNN58ZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="10055360"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 10 Nov 2026 19:59:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQzUE-000000000Vj-2nle;
	Wed, 11 Nov 2026 03:59:02 +0000
Date: Wed, 11 Nov 2026 04:58:49 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: vmlinux: local symbol 'inc_ucount' was
 exported
Message-ID: <202611110401.EVdRdo6b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   067c5c24cef23d913b67eaaf71ae67e7169a6620
commit: b604897764047229c6a931e1980cac1b2197d9d2 binfmt_misc: correctly account pre-opened interpreters
date:   3 months ago
config: loongarch-randconfig-r2301-20261110 (https://download.01.org/0day-ci/archive/20261111/202611110401.EVdRdo6b-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110401.EVdRdo6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b60489776404 ("binfmt_misc: correctly account pre-opened interpreters")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110401.EVdRdo6b-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: local symbol 'param_set_bint' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_bint' was exported
ERROR: modpost: vmlinux: local symbol 'param_array_ops' was exported
ERROR: modpost: vmlinux: local symbol 'param_set_copystring' was exported
ERROR: modpost: vmlinux: local symbol 'param_get_string' was exported
ERROR: modpost: vmlinux: local symbol 'param_ops_string' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_param_lock' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_param_unlock' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_should_stop' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_should_park' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_freezable_should_stop' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_func' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_data' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_parkme' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_complete_and_exit' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_on_node' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_bind' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_on_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_unpark' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_park' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_stop' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_stop_put' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_affine_preferred' was exported
ERROR: modpost: vmlinux: local symbol '__kthread_init_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_worker_fn' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_worker_on_node' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_create_worker_on_cpu' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_queue_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_delayed_work_timer_fn' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_queue_delayed_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_flush_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_mod_delayed_work' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_cancel_work_sync' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_cancel_delayed_work_sync' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_flush_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_destroy_worker' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_use_mm' was exported
ERROR: modpost: vmlinux: local symbol 'kthread_unuse_mm' was exported
ERROR: modpost: vmlinux: local symbol 'net_ns_tree' was exported
ERROR: modpost: vmlinux: local symbol '__ns_tree_remove' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_chain_register_unique_prio' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'atomic_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_chain_register_unique_prio' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_call_chain_robust' was exported
ERROR: modpost: vmlinux: local symbol 'blocking_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_call_chain_robust' was exported
ERROR: modpost: vmlinux: local symbol 'raw_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_notifier_chain_register' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_notifier_chain_unregister' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_notifier_call_chain' was exported
ERROR: modpost: vmlinux: local symbol 'srcu_init_notifier_head' was exported
ERROR: modpost: vmlinux: local symbol 'register_die_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_die_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_kobj' was exported
ERROR: modpost: vmlinux: local symbol '__put_cred' was exported
ERROR: modpost: vmlinux: local symbol 'get_task_cred' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_creds' was exported
ERROR: modpost: vmlinux: local symbol 'commit_creds' was exported
ERROR: modpost: vmlinux: local symbol 'abort_creds' was exported
ERROR: modpost: vmlinux: local symbol 'cred_fscmp' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_kernel_cred' was exported
ERROR: modpost: vmlinux: local symbol 'set_security_override' was exported
ERROR: modpost: vmlinux: local symbol 'set_create_files_as' was exported
ERROR: modpost: vmlinux: local symbol 'cad_pid' was exported
ERROR: modpost: vmlinux: local symbol 'reboot_mode' was exported
ERROR: modpost: vmlinux: local symbol 'emergency_restart' was exported
ERROR: modpost: vmlinux: local symbol 'register_reboot_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_reboot_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_reboot_notifier' was exported
ERROR: modpost: vmlinux: local symbol 'register_restart_handler' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_restart_handler' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_restart' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_halt' was exported
ERROR: modpost: vmlinux: local symbol 'register_sys_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_sys_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_sys_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_power_off_handler' was exported
ERROR: modpost: vmlinux: local symbol 'devm_register_restart_handler' was exported
ERROR: modpost: vmlinux: local symbol 'register_platform_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'unregister_platform_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_can_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_power_off' was exported
ERROR: modpost: vmlinux: local symbol 'orderly_poweroff' was exported
ERROR: modpost: vmlinux: local symbol 'orderly_reboot' was exported
ERROR: modpost: vmlinux: local symbol '__hw_protection_trigger' was exported
ERROR: modpost: vmlinux: local symbol 'async_schedule_node_domain' was exported
ERROR: modpost: vmlinux: local symbol 'async_schedule_node' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_full' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_full_domain' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_cookie_domain' was exported
ERROR: modpost: vmlinux: local symbol 'async_synchronize_cookie' was exported
ERROR: modpost: vmlinux: local symbol 'current_is_async' was exported
ERROR: modpost: vmlinux: local symbol 'smpboot_register_percpu_thread' was exported
ERROR: modpost: vmlinux: local symbol 'smpboot_unregister_percpu_thread' was exported
>> ERROR: modpost: vmlinux: local symbol 'inc_ucount' was exported
>> ERROR: modpost: vmlinux: local symbol 'dec_ucount' was exported
ERROR: modpost: vmlinux: local symbol 'regset_get' was exported
ERROR: modpost: vmlinux: local symbol 'regset_get_alloc' was exported
ERROR: modpost: vmlinux: local symbol 'groups_alloc' was exported
ERROR: modpost: vmlinux: local symbol 'groups_free' was exported
ERROR: modpost: vmlinux: local symbol 'groups_sort' was exported
ERROR: modpost: vmlinux: local symbol 'set_groups' was exported
ERROR: modpost: vmlinux: local symbol 'set_current_groups' was exported
ERROR: modpost: vmlinux: local symbol 'in_group_p' was exported
ERROR: modpost: vmlinux: local symbol 'in_egroup_p' was exported
ERROR: modpost: vmlinux: local symbol '__trace_set_current_state' was exported
ERROR: modpost: vmlinux: local symbol '__trace_set_need_resched' was exported
ERROR: modpost: vmlinux: local symbol '___migrate_enable' was exported
ERROR: modpost: vmlinux: local symbol 'migrate_disable' was exported
ERROR: modpost: vmlinux: local symbol 'migrate_enable' was exported
ERROR: modpost: vmlinux: local symbol 'set_cpus_allowed_ptr' was exported
ERROR: modpost: vmlinux: local symbol 'kick_process' was exported
ERROR: modpost: vmlinux: local symbol 'wake_up_process' was exported
ERROR: modpost: vmlinux: local symbol 'single_task_running' was exported
ERROR: modpost: vmlinux: local symbol 'kstat' was exported
ERROR: modpost: vmlinux: local symbol 'kernel_cpustat' was exported
ERROR: modpost: vmlinux: local symbol 'preempt_count_add' was exported
ERROR: modpost: vmlinux: local symbol 'preempt_count_sub' was exported
ERROR: modpost: vmlinux: local symbol 'schedule' was exported
ERROR: modpost: vmlinux: local symbol 'preempt_schedule' was exported
ERROR: modpost: vmlinux: local symbol 'preempt_schedule_notrace' was exported
ERROR: modpost: vmlinux: local symbol 'default_wake_function' was exported
ERROR: modpost: vmlinux: local symbol '__cond_resched_lock' was exported
ERROR: modpost: vmlinux: local symbol '__cond_resched_rwlock_read' was exported
ERROR: modpost: vmlinux: local symbol '__cond_resched_rwlock_write' was exported
ERROR: modpost: vmlinux: local symbol 'io_schedule_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'io_schedule' was exported
ERROR: modpost: vmlinux: local symbol 'sched_show_task' was exported
ERROR: modpost: vmlinux: local symbol '__might_sleep' was exported
ERROR: modpost: vmlinux: local symbol '__might_resched' was exported
ERROR: modpost: vmlinux: local symbol '__cant_sleep' was exported
ERROR: modpost: vmlinux: local symbol 'sched_smt_present' was exported
ERROR: modpost: vmlinux: local symbol 'play_idle_precise' was exported
ERROR: modpost: vmlinux: local symbol 'get_cpu_idle_time_us' was exported
ERROR: modpost: vmlinux: local symbol 'get_cpu_iowait_time_us' was exported
ERROR: modpost: vmlinux: local symbol 'task_cputime_adjusted' was exported
ERROR: modpost: vmlinux: local symbol 'set_user_nice' was exported
ERROR: modpost: vmlinux: local symbol 'sched_setattr_nocheck' was exported
ERROR: modpost: vmlinux: local symbol 'sched_set_fifo' was exported
ERROR: modpost: vmlinux: local symbol 'sched_set_fifo_low' was exported
ERROR: modpost: vmlinux: local symbol 'sched_set_normal' was exported
ERROR: modpost: vmlinux: local symbol 'yield' was exported
ERROR: modpost: vmlinux: local symbol 'yield_to' was exported
ERROR: modpost: vmlinux: local symbol 'sched_clock' was exported
ERROR: modpost: vmlinux: local symbol 'cpufreq_add_update_util_hook' was exported
ERROR: modpost: vmlinux: local symbol 'cpufreq_remove_update_util_hook' was exported
ERROR: modpost: vmlinux: local symbol 'avenrun' was exported
ERROR: modpost: vmlinux: local symbol 'complete' was exported
ERROR: modpost: vmlinux: local symbol 'complete_all' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_io' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_io_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_interruptible' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_interruptible_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_killable' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_state' was exported
ERROR: modpost: vmlinux: local symbol 'wait_for_completion_killable_timeout' was exported
ERROR: modpost: vmlinux: local symbol 'try_wait_for_completion' was exported
ERROR: modpost: vmlinux: local symbol 'completion_done' was exported
ERROR: modpost: vmlinux: local symbol '__init_swait_queue_head' was exported
ERROR: modpost: vmlinux: local symbol 'swake_up_locked' was exported
ERROR: modpost: vmlinux: local symbol 'swake_up_one' was exported
ERROR: modpost: vmlinux: local symbol 'swake_up_all' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_to_swait_exclusive' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_to_swait_event' was exported
ERROR: modpost: vmlinux: local symbol 'finish_swait' was exported
ERROR: modpost: vmlinux: local symbol 'bit_waitqueue' was exported
ERROR: modpost: vmlinux: local symbol 'wake_bit_function' was exported
ERROR: modpost: vmlinux: local symbol '__wait_on_bit' was exported
ERROR: modpost: vmlinux: local symbol 'out_of_line_wait_on_bit' was exported
ERROR: modpost: vmlinux: local symbol 'out_of_line_wait_on_bit_timeout' was exported
ERROR: modpost: vmlinux: local symbol '__wait_on_bit_lock' was exported
ERROR: modpost: vmlinux: local symbol 'out_of_line_wait_on_bit_lock' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up_bit' was exported
ERROR: modpost: vmlinux: local symbol 'wake_up_bit' was exported
ERROR: modpost: vmlinux: local symbol '__var_waitqueue' was exported
ERROR: modpost: vmlinux: local symbol 'init_wait_var_entry' was exported
ERROR: modpost: vmlinux: local symbol 'wake_up_var' was exported
ERROR: modpost: vmlinux: local symbol 'bit_wait' was exported
ERROR: modpost: vmlinux: local symbol 'bit_wait_io' was exported
ERROR: modpost: vmlinux: local symbol 'bit_wait_timeout' was exported
ERROR: modpost: vmlinux: local symbol '__init_waitqueue_head' was exported
ERROR: modpost: vmlinux: local symbol 'add_wait_queue' was exported
ERROR: modpost: vmlinux: local symbol 'add_wait_queue_exclusive' was exported
ERROR: modpost: vmlinux: local symbol 'add_wait_queue_priority' was exported
ERROR: modpost: vmlinux: local symbol 'add_wait_queue_priority_exclusive' was exported
ERROR: modpost: vmlinux: local symbol 'remove_wait_queue' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up_locked' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up_locked_key' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up_sync_key' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up_locked_sync_key' was exported
ERROR: modpost: vmlinux: local symbol '__wake_up_sync' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_to_wait' was exported
ERROR: modpost: vmlinux: local symbol 'prepare_to_wait_exclusive' was exported

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
