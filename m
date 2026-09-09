Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CCD2E7397
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788918899; cv=none; b=H7/XJZC2Ni2b6O2Oh26kYgc93LfT9W11/gPEtyV9Fvb/hxEPaCMhNzkuYbxuopJP4qWEWsMvhB7o7EjYGBtV5TN0fr+BFJuSMOiN24uk60WZFeuHgLWjN2MmUxXfMqnanmyp7aO3Qcn91JNj2XRaoFTwteSQr25t2k1CF75+/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788918899; c=relaxed/simple;
	bh=MW5aXg0bNsXR/6JL+IyLG4eQSYFFUF3T+l3vgA1VUqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8YPnFUVyacpa/WduZdZmgrHGLWJwtiGD+GZxuPLmcOWkJRW0P9PGUSZyAjGVkaEbCLjNTqYaW5xxZQCoEdqp7fE34U3807mHB9w3NJaSZEMUvZehS3vvnF68mi7I6iL/4ugYt4jO6wXoPhztJqYyEfyQOG7p8qe+JGHvrQy2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4izJVQC; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4izJVQC"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9399c77e2ebso320869785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788918896; x=1789523696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbQfObsn6XH/MZ0+tYnQiVEKUPLLfnz1L22a+l00z/Y=;
        b=s4izJVQCrUYCW9D/IN83uCvzmDnfuHVJBqfwsiWrYnjZYuyEfcAPvAikBTmIjtv91o
         Ew4FJYsERwF7oylHMxIDjqYXxNUkHwLJIIdKue6n6imKCh28iw6bwGgTT9GWR+CMAFzp
         8lZkAlhohsOyjldsj2y38xj0INAEDk/4gYkEYfjftzhIrPkbVR/WyY+fYBH3ee0JSfVC
         RuLSmSkzmhB46KsVdP3LQLipdSzSHcdtcdAjtAUeJtd4xcSg/pI+VapXli87m1N9b74V
         Xah70aeWUCDKZYhWLVmxZ0v4PKKtMbd5c5xEQ25wgQ7iyoqQHB6Kp5jGMGkGx+KSnFWK
         yHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788918896; x=1789523696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbQfObsn6XH/MZ0+tYnQiVEKUPLLfnz1L22a+l00z/Y=;
        b=ChcNVjMBnZ5FblMdXeCVRN9gkFsBQV7OASKFjXq1UIie99D5XIo0crk2ALDN1RmWFU
         X0TSyuawJv4WLg2ACl3Vo6C8hDtIhA2q0jIGP8s2Nu5JTkKKcWCoVpGi+VEoBLJABPi5
         rE2FfnS36hyYm28TNvI5VvmxAO/+ftQF0urUMj5/Nj+WIA50Yb/bGmsQIGypasePq1Xv
         tp6YwbeTJIO27jU3DWl21Xv9BW3BDswF5gkBvG4IrmGHhXpZZRquwxJBuUX7XeGUyEPW
         9LrlPqOrOYUmfUiCWTGRYKWPpT6pGUUhI/Wu+nzuSWSRDk0bqLne/0pxGk4BWPX5pstE
         EnXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbyKsDvmdlg2ARHdXgSAExi+Vwz2tb9voi7Qhn7jaNnJSc5gl9y/zk0YYYcudsVrU86jBZ402cJ1yOXWI=@vger.kernel.org
X-Gm-Message-State: AFuF++kPxymygmFkZf9ge36qvb8NU3Q3Jd8MxuiceXipbumbTjs7yhDh
	eMhxnAQGy6hB6aHkktFIPcXLYP57mmS+yn7V8FMda3pe7bgXpjnqKbI6YlW42MyY+6A=
X-Gm-Gg: AYBFou0ms1fFRWvEEqnadtl/CWou4oDvNr/GfjwSnm4LVRN25HBQGh3L5FrQ9wzefGP
	6bKujJiUUvow4vATLHb/LqRy59fzZbkHeTTZZax6Z31neEryBK0DIWmDKrj3UaX3HC18vobBlKS
	F0rdJRRDFmwkVhwegtPBvHteUq7zFrYSrtbzlTLicoSvIHGHw6mUtTXNh6m+NanOqsLRpjvxe8O
	nUC4HEPc4KJOZ7ZOmLJlVaNLHErD6C/i8oZ/HWNpaTTP3ts4mFzUBXMXu5DBcM2lRlhTC4JY8sz
	zhdD23Fu+TvoVrWEoVBy4TTN6ZW0145BKtUeKxD3PhoHH4e1jPh98V9gWKzCwNA70CSiML5Pgtq
	rbi9qD5kphLc15lRA1ndasHe/tQrVN3bmEFExgHjkb5r1FafPSqeFgjgDCdlAjY6+Aq23oTrmms
	izF+V1iEWQDd2FgJWqVioM+T6O8+7SZEhGzbV8+2LLJL0pP+SYdJCPhd9Dy4RpJ+L19n0nZ7369
	1U4LednteCcpVqgUr++l9sIQMPW8uV/KAhbBG/c
X-Received: by 2002:a05:620a:164b:b0:936:af34:468e with SMTP id af79cd13be357-9396dead470mr2333006285a.4.1788918896064;
        Tue, 08 Sep 2026 18:54:56 -0700 (PDT)
Received: from reolab.localdomain ([146.70.168.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ad19dc90sm624164785a.41.2026.09.08.18.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:54:54 -0700 (PDT)
From: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com,
	Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>,
	Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Subject: [BUG] KASAN: slab-use-after-free in usb_control_msg / kobject_put (vhci_hcd)
Date: Wed,  9 Sep 2026 05:24:38 +0330
Message-ID: <20260909015438.274093-1-a.jahangirzad@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have found two related KASAN slab-use-after-free bugs in the USB
subsystem (specifically involving vhci_hcd and usbip) using syzkaller.

Exact kernel branch and revision: upstream torvalds/linux master tree,
commit 893e11787f78e43b534e252249ac3fff4d1333f8.
Kernel config: https://gist.github.com/Reodus/dd06d0efddc483bc5f6e17dd392376d8

Note: Because this bug relies on a race condition, it may not trigger on the
very first run. The reproducer needs to be executed concurrently in a loop.
For example, using syzkaller's syz-execprog utility inside a QEMU VM, we
run it with multiple processes:

./syz-execprog -executor=./syz-executor -os=linux -arch=amd64 \  -threaded=true -repeat=0 -procs=16 -sandbox=none \
  -enable=usb,net_dev,net_reset,cgroups,binfmt_misc,close_fds,sysctl,swap \
  ./repro.prog

Alternatively, you can compile the provided syz programs into C reproducers
and run them in a loop with multiple threads.


Crash 1:

[   98.877298] BUG: KASAN: slab-use-after-free in usb_control_msg+0x417/0x490
[   98.877321] Read of size 4 at addr ffff8881082bc51c by task kworker/0:4/8296
[   98.877333] 
[   98.877342] CPU: 0 UID: 0 PID: 8296 Comm: kworker/0:4 Not tainted 7.3.0-rc2-g893e11787f78 #7 PREEMPT(lazy) 
[   98.877360] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS Arch Linux 1.17.0-2-2 04/01/2014
[   98.877371] Workqueue: usb_hub_wq hub_event
[   98.877392] Call Trace:
[   98.877398]  <TASK>
[   98.877427]  dump_stack_lvl+0x70/0xa0
[   98.877450]  print_report+0x14b/0x4b0
[   98.877471]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[   98.877493]  kasan_report+0xfa/0x120
[   98.877513]  ? usb_control_msg+0x417/0x490
[   98.877528]  ? usb_control_msg+0x417/0x490
[   98.877546]  usb_control_msg+0x417/0x490
[   98.877560]  ? __pfx_usb_control_msg+0x10/0x10
[   98.877575]  ? __pfx__dev_info+0x10/0x10
[   98.877591]  ? __pfx_hub_port_reset+0x10/0x10
[   98.877608]  get_bMaxPacketSize0+0xef/0x260
[   98.877624]  hub_port_init+0x5b9/0x3200
[   98.877641]  ? device_set_wakeup_capable+0x11c/0x170
[   98.877662]  hub_event+0x24c0/0x39f0
[   98.877684]  ? __pfx_hub_event+0x10/0x10
[   98.877701]  ? pwq_dec_nr_in_flight+0x157/0xd30
[   98.877720]  ? remove_waiter+0x571/0xd40
[   98.877733]  ? _raw_spin_lock_irqsave+0x85/0xe0
[   98.877752]  ? mutex_unlock+0x7f/0xd0
[   98.877771]  ? __pfx_pwq_dec_nr_in_flight+0x10/0x10
[   98.877789]  ? _raw_spin_lock_irq+0x80/0xe0
[   98.877806]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   98.877824]  ? kick_pool_pick+0x208/0x660
[   98.877840]  ? __pm_runtime_suspend+0xae/0x260
[   98.877860]  process_one_work+0x6fc/0x1110
[   98.877879]  ? __pfx___schedule+0x10/0x10
[   98.877896]  ? move_linked_works+0x1af/0x290
[   98.877918]  ? __pfx_process_one_work+0x10/0x10
[   98.877936]  ? __pfx_hub_event+0x10/0x10
[   98.877953]  worker_thread+0x49a/0xb80
[   98.877972]  ? __kthread_parkme+0x113/0x190
[   98.877994]  ? __pfx_worker_thread+0x10/0x10
[   98.878011]  kthread+0x361/0x460
[   98.878025]  ? __pfx_kthread+0x10/0x10
[   98.878040]  ret_from_fork+0x3e6/0x670
[   98.878058]  ? __pfx_ret_from_fork+0x10/0x10
[   98.878075]  ? __switch_to+0x74b/0xf90
[   98.878089]  ? __pfx_kthread+0x10/0x10
[   98.878104]  ret_from_fork_asm+0x1a/0x30
[   98.878127]  </TASK>
[   98.878133] 
[   98.878136] Allocated by task 8296:
[   98.878145]  kasan_save_stack+0x2f/0x50
[   98.878166]  kasan_save_track+0x14/0x30
[   98.878182]  __kasan_kmalloc+0x7f/0x90
[   98.878197]  __kmalloc_cache_noprof+0x181/0x3b0
[   98.878210]  usb_alloc_dev+0x5f/0xef0
[   98.878221]  hub_event+0x21e0/0x39f0
[   98.878237]  process_one_work+0x6fc/0x1110
[   98.878252]  worker_thread+0x49a/0xb80
[   98.878268]  kthread+0x361/0x460
[   98.878280]  ret_from_fork+0x3e6/0x670
[   98.878294]  ret_from_fork_asm+0x1a/0x30
[   98.878313] 
[   98.878316] Freed by task 72:
[   98.878323]  kasan_save_stack+0x2f/0x50
[   98.878338]  kasan_save_track+0x14/0x30
[   98.878353]  kasan_save_free_info+0x3b/0x70
[   98.878366]  __kasan_slab_free+0x47/0x70
[   98.878382]  kfree+0x216/0x450
[   98.878393]  device_release+0xd6/0x3b0
[   98.878417]  kobject_put+0x1a6/0x360
[   98.878435]  put_device+0x1f/0x30
[   98.878448]  usb_put_dev+0x23/0x30
[   98.878469]  vhci_device_reset+0xd6/0x220
[   98.878487]  event_handler+0x1f4/0x3f0
[   98.878502]  process_one_work+0x6fc/0x1110
[   98.878518]  worker_thread+0x49a/0xb80
[   98.878533]  kthread+0x361/0x460
[   98.878545]  ret_from_fork+0x3e6/0x670
[   98.878560]  ret_from_fork_asm+0x1a/0x30
[   98.878579] 
[   98.878582] The buggy address belongs to the object at ffff8881082bc000
[   98.878582]  which belongs to the cache kmalloc-2k of size 2048
[   98.878594] The buggy address is located 1308 bytes inside of
[   98.878594]  freed 2048-byte region [ffff8881082bc000, ffff8881082bc800)
[   98.878609] 
[   98.878612] The buggy address belongs to the physical page:
[   98.878619] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1082b8
[   98.878633] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[   98.878644] flags: 0x200000000000040(head|node=0|zone=2)
[   98.878657] page_type: f5(slab)
[   98.878671] raw: 0200000000000040 ffff888100042000 dead000000000100 dead000000000122
[   98.878684] raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
[   98.878697] head: 0200000000000040 ffff888100042000 dead000000000100 dead000000000122
[   98.878709] head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
[   98.878721] head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
[   98.878733] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[   98.878741] page dumped because: kasan: bad access detected
[   98.878746] 
[   98.878749] Memory state around the buggy address:
[   98.878756]  ffff8881082bc400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   98.878765]  ffff8881082bc480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   98.878775] >ffff8881082bc500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   98.878782]                             ^
[   98.878789]  ffff8881082bc580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   98.878798]  ffff8881082bc600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   98.878806] ==================================================================


The syz reproducer:


# {Threaded:true Repeat:true RepeatTimes:0 Procs:16 Slowdown:1 Sandbox:none SandboxArg:0 Leak:false NetInjection:false NetDevices:true NetReset:true Cgroups:true BinfmtMisc:true CloseFDs:true KCSAN:false DevlinkPCI:false NicVF:false USB:true VhciInjection:false Wifi:false IEEE802154:false Sysctl:true Swap:true UseTmpDir:true HandleSegv:true Trace:false CallComments:true LegacyOptions:{Collide:false Fault:false FaultCall:0 FaultNth:0}}
syz_usb_connect$midi(0x0, 0x24, &(0x7f0000000300)={{0x12, 0x1, 0x300, 0x0, 0x0, 0x0, 0x20, 0x194f, 0x10c, 0x40, 0x1, 0x2, 0x3, 0x1, [{{0x9, 0x2, 0x12, 0x1, 0x1, 0x4, 0x80, 0xe, "", {{{0x9, 0x4, 0x0, 0x0, 0x0, 0x1, 0x3, 0x0, 0x4}}}}}]}}, 0x0)
syz_open_dev$usbfs(&(0x7f0000000380), 0x1ff, 0x2)
syz_usbip_server_init(0x1)



Crash 2:

[   96.159481] BUG: KASAN: slab-use-after-free in kobject_put+0x2da/0x360
[   96.159490] Read of size 1 at addr ffff888102e160ec by task kworker/0:11/8637
[   96.159494] 
[   96.159498] CPU: 0 UID: 0 PID: 8637 Comm: kworker/0:11 Not tainted 7.3.0-rc2-g893e11787f78 #7 PREEMPT(lazy) 
[   96.159503] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS Arch Linux 1.17.0-2-2 04/01/2014
[   96.159507] Workqueue: usb_hub_wq hub_event
[   96.159516] Call Trace:
[   96.159518]  <TASK>
[   96.159519]  dump_stack_lvl+0x70/0xa0
[   96.159527]  print_report+0x14b/0x4b0
[   96.159534]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[   96.159541]  kasan_report+0xfa/0x120
[   96.159548]  ? kobject_put+0x2da/0x360
[   96.159554]  ? kobject_put+0x2da/0x360
[   96.159559]  kobject_put+0x2da/0x360
[   96.159565]  ? get_device+0x2a/0x40
[   96.159569]  put_device+0x1f/0x30
[   96.159573]  usb_put_dev+0x23/0x30
[   96.159579]  vhci_urb_enqueue+0x42e/0x9b0
[   96.159586]  usb_hcd_submit_urb+0x24b/0x1e00
[   96.159593]  usb_submit_urb+0x71f/0x1550
[   96.159598]  usb_start_wait_urb+0x138/0x340
[   96.159602]  ? __pfx_usb_start_wait_urb+0x10/0x10
[   96.159606]  ? kasan_save_track+0x14/0x30
[   96.159612]  ? __kmalloc_noprof+0x1cc/0x480
[   96.159616]  ? usb_alloc_urb+0x53/0x180
[   96.159620]  ? __asan_memset+0x27/0x50
[   96.159624]  usb_control_msg+0x321/0x490
[   96.159628]  ? __pfx_usb_control_msg+0x10/0x10
[   96.159632]  ? __pfx__dev_info+0x10/0x10
[   96.159637]  ? __pfx_hub_port_reset+0x10/0x10
[   96.159642]  get_bMaxPacketSize0+0xef/0x260
[   96.159647]  hub_port_init+0x5b9/0x3200
[   96.159652]  ? device_set_wakeup_capable+0x11c/0x170
[   96.159658]  hub_event+0x24c0/0x39f0
[   96.159664]  ? __pfx_hub_event+0x10/0x10
[   96.159669]  ? pwq_dec_nr_in_flight+0x157/0xd30
[   96.159675]  ? remove_waiter+0x371/0xd40
[   96.159679]  ? _raw_spin_lock_irqsave+0x85/0xe0
[   96.159684]  ? mutex_unlock+0x7f/0xd0
[   96.159690]  ? __pfx_pwq_dec_nr_in_flight+0x10/0x10
[   96.159695]  ? _raw_spin_lock_irq+0x80/0xe0
[   96.159700]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   96.159705]  ? kick_pool_pick+0x208/0x660
[   96.159710]  ? __pm_runtime_suspend+0xae/0x260
[   96.159716]  process_one_work+0x6fc/0x1110
[   96.159721]  ? __pfx___schedule+0x10/0x10
[   96.159726]  ? move_linked_works+0x1af/0x290
[   96.159732]  ? __pfx_process_one_work+0x10/0x10
[   96.159738]  ? __pfx_hub_event+0x10/0x10
[   96.159743]  worker_thread+0x49a/0xb80
[   96.159748]  ? __kthread_parkme+0x113/0x190
[   96.159755]  ? __pfx_worker_thread+0x10/0x10
[   96.159760]  kthread+0x361/0x460
[   96.159765]  ? __pfx_kthread+0x10/0x10
[   96.159769]  ret_from_fork+0x3e6/0x670
[   96.159776]  ? __pfx_ret_from_fork+0x10/0x10
[   96.159780]  ? __switch_to+0x74b/0xf90
[   96.159785]  ? __pfx_kthread+0x10/0x10
[   96.159789]  ret_from_fork_asm+0x1a/0x30
[   96.159796]  </TASK>
[   96.159797] 
[   96.159798] Allocated by task 8287:
[   96.159801]  kasan_save_stack+0x2f/0x50
[   96.159806]  kasan_save_track+0x14/0x30
[   96.159810]  __kasan_kmalloc+0x7f/0x90
[   96.159815]  __kmalloc_cache_noprof+0x181/0x3b0
[   96.159818]  usb_alloc_dev+0x5f/0xef0
[   96.159821]  hub_event+0x21e0/0x39f0
[   96.159826]  process_one_work+0x6fc/0x1110
[   96.159830]  worker_thread+0x49a/0xb80
[   96.159835]  kthread+0x361/0x460
[   96.159838]  ret_from_fork+0x3e6/0x670
[   96.159842]  ret_from_fork_asm+0x1a/0x30
[   96.159848] 
[   96.159849] Freed by task 8287:
[   96.159851]  kasan_save_stack+0x2f/0x50
[   96.159855]  kasan_save_track+0x14/0x30
[   96.159860]  kasan_save_free_info+0x3b/0x70
[   96.159867]  __kasan_slab_free+0x47/0x70
[   96.159872]  kfree+0x216/0x450
[   96.159875]  device_release+0xd6/0x3b0
[   96.159880]  kobject_put+0x1a6/0x360
[   96.159885]  put_device+0x1f/0x30
[   96.159888]  usb_put_dev+0x23/0x30
[   96.159893]  hub_event+0x288c/0x39f0
[   96.159898]  process_one_work+0x6fc/0x1110
[   96.159902]  worker_thread+0x49a/0xb80
[   96.159907]  kthread+0x361/0x460
[   96.159911]  ret_from_fork+0x3e6/0x670
[   96.159916]  ret_from_fork_asm+0x1a/0x30
[   96.159921] 
[   96.159922] The buggy address belongs to the object at ffff888102e16000
[   96.159922]  which belongs to the cache kmalloc-2k of size 2048
[   96.159933] The buggy address is located 236 bytes inside of
[   96.159933]  freed 2048-byte region [ffff888102e16000, ffff888102e16800)
[   96.159937] 
[   96.159938] The buggy address belongs to the physical page:
[   96.159941] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x102e10
[   96.159945] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[   96.159948] flags: 0x200000000000040(head|node=0|zone=2)
[   96.159952] page_type: f5(slab)
[   96.159966] raw: 0200000000000040 ffff888100042000 dead000000000100 dead000000000122
[   96.159970] raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
[   96.159974] head: 0200000000000040 ffff888100042000 dead000000000100 dead000000000122
[   96.159977] head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
[   96.159981] head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
[   96.159985] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[   96.159987] page dumped because: kasan: bad access detected
[   96.159988] 
[   96.159989] Memory state around the buggy address:
[   96.159991]  ffff888102e15f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   96.159994]  ffff888102e16000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   96.159997] >ffff888102e16080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   96.159999]                                                           ^
[   96.160002]  ffff888102e16100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   96.160004]  ffff888102e16180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb



The syz reproducer:

# {Threaded:true Repeat:true RepeatTimes:0 Procs:16 Slowdown:1 Sandbox:none SandboxArg:0 Leak:false NetInjection:false NetDevices:true NetReset:true Cgroups:true BinfmtMisc:true CloseFDs:true KCSAN:false DevlinkPCI:false NicVF:false USB:true VhciInjection:false Wifi:false IEEE802154:false Sysctl:true Swap:true UseTmpDir:true HandleSegv:true Trace:false CallComments:true LegacyOptions:{Collide:false Fault:false FaultCall:0 FaultNth:0}}
r0 = syz_open_dev$usbfs(&(0x7f0000000000), 0xffffffffffffffff, 0x0)
read$usbfs(r0, 0x0, 0x0)
syz_usbip_server_init(0x2)
r1 = syz_open_dev$usbmon(0x0, 0x6, 0x21c101)
ioctl$MON_IOCX_MFETCH(r1, 0xc0109207, 0x0)
read$usbmon(r1, &(0x7f00000000c0)=""/46, 0x2e)
ioctl$MON_IOCH_MFLUSH(r1, 0x9208, 0xfffffffffffffffb)
r2 = syz_open_dev$evdev(&(0x7f00000000c0), 0x1, 0x20202)
ioctl$EVIOCGKEYCODE_V2(r2, 0x80284504, 0x0)
ioctl$EVIOCSKEYCODE_V2(r2, 0x40284504, &(0x7f0000000940)={0x5b, 0x1b, 0x9, 0x2, "1db770ad90b40f4c0ec86113b4925fb80fe792c1e3c6484977b162a138445e84"})
r3 = syz_usbip_server_init(0x3)
write$usbip_server(r3, 0x0, 0x41)
mmap$usbmon(&(0x7f0000ffd000/0x3000)=nil, 0x3000, 0x2, 0x11, 0xffffffffffffffff, 0x8000000000000000)
syz_open_dev$evdev(&(0x7f0000001340), 0xfffffffffffffbff, 0x440)
syz_open_dev$evdev(&(0x7f0000000300), 0x83, 0x0)
r4 = syz_usb_connect$sierra_net(0x0, 0x3f, &(0x7f0000000080)={{0x12, 0x1, 0x200, 0xff, 0xff, 0xff, 0x40, 0x1199, 0x68a3, 0x0, 0x1, 0x2, 0x3, 0x1, [{{0x9, 0x2, 0x2d, 0x1, 0x1, 0x0, 0x80, 0xfa, "", {{0x9, 0x4, 0x7, 0x0, 0x3, 0xff, 0x0, 0x0, 0x0, "", {{0x9, 0x5, 0x43978451d8f6fedb, 0x2, 0x40, 0x2, 0x1b, 0xfe}, {0x9, 0x5, 0x7, 0x2, 0x200, 0xc, 0x77, 0x3}, {0x9, 0x5, 0x81, 0x3, 0x20, 0x0, 0xfd, 0x32}}}}}}]}}, 0x0)
syz_usb_control_io$sierra_net(r4, 0x0, 0x0)
r5 = syz_usb_connect$cdc_ncm(0x0, 0x0, 0x0, 0x0)
syz_usb_control_io$cdc_ncm(r5, 0x0, 0x0)
syz_usb_control_io$cdc_ncm(r5, 0x0, 0x0)
syz_usb_control_io$cdc_ncm(r5, 0x0, 0x0)
syz_open_dev$usbmon(&(0x7f0000000100), 0x6, 0x2)
ioctl$MON_IOCQ_URB_LEN(r1, 0x9201)
read$usbmon(r1, &(0x7f0000000100)=""/231, 0xe7)


Reported-by: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Reported-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
