Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033786;
	b=q9+R/5etVnquR/R0ubIq9I0DcPRTbn0G9H4sKIhFjjf3m+u36TuEzZPDYoCNC3MnUs2f
	 IFncH/SGnI8e2zMOrdRnuQz48OEieQxqMkhx8gZ2EQDfVZsWCr1NH50xxobpIMxO0xqo3
	 sJW6+6I3Xc+qKeVJsndPKk25NIvG0yX04GYx4YMPqndU/ZDYWjh7NzVR7mENn8gELOPpx
	 QXTTz6m4nvlA94kHGooO4OPjudPdzzUvEWMeZicI8lwNGPrUh/ox8u74I5dxfiMHoGMnz
	 WfmVq7ni/aaYnTZFjbL6WHeX0nhnZ+qwNMd0G/kdcsKFr5lOQBFTJFLQcRVQD5XJb/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033786;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=/s6ZjhWdP/bczllJbLNED9RNYOw1tnjtoYg4kZ2AVto=;
	b=JeCADz6QGz3VGQ9GnbfY//dWN1gkfoi6Qpzzyq0BEjn1imEOVI/UpkWRrphd3rKpYvYl
	 iR5BEuQFi9hJeH+7S7bJxjSON7ImsRvz+iun1GL3euzmD29qHT3BXo95qKbqzaFnJX67+
	 rDwPCm7DFpoEqUvEsyhpmEdmdIQs3zgiyWBYkqJhwpNtCt9I+bbx1y4HHCePe1OXm7hSf
	 ex/8E4IN86BnKxPZya847AyV1NN4ApWSgQhtrgxyBYrLqPJrk9pZSsNGWCbI/VdOq9Dzc
	 wUpkgZy3ZWwGEN+7mdIVoywJPjWGhmbCkZ/Acc+PKtvp32jCOQeiaupBLa73Cw6KsyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stu.shzu.edu.cn;
	spf=none smtp.mailfrom=stu.shzu.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F93606A31E;
	Mon, 26 Oct 2026 16:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F93606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:MIME-Version:
	Content-Transfer-Encoding; bh=/s6ZjhWdP/bczllJbLNED9RNYOw1tnjtoY
	g4kZ2AVto=; b=bqrHMJJwEQUfSdU12v+FE0XZ+QOTpwqgoDIYdzHS0VF+vC4M/Q
	36wleYe0KdEqeWDUi+OhB63bUg14xKXlOFk7y7pDLaf202cj+XLm5kf2Vw0J95FY
	cmnVNgklz89EQ2qG2NcTiVvjpoJnFmHRnlcY7BBtd3e0N3+znJTiq2Es4=
Received: from localhost.localdomain (unknown [124.119.50.14])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkCmqfwtht9qkXvqAA--.49382S2;
	Tue, 27 Oct 2026 00:56:14 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: gspca: use vb2_video_unregister_device() on disconnect
Date: Tue, 27 Oct 2026 00:55:57 +0800
Message-ID: <179303318780.49224.6784495871522364753.bug006-gspca-read-start@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20260813031235.2468144-1-shuangpeng.kernel@gmail.com>
References: <20260813031235.2468144-1-shuangpeng.kernel@gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:BbQMCkCmqfwtht9qkXvqAA--.49382S2
X-Coremail-Antispam: 1UD129KBjvAXoW3urWxGw1rtrWUCr4xtFWUurg_yoW8Jr4UCo
	WfZr1FvF48Gry5GFWFyr1xJFyfWFn7XFnxJ3yrCayYgFy7Zr4kZ347Ka43XrWUtF40k3W3
	Aw1jqr1rJw43Jr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYy7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r1j6r4UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l
	c7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYx
	BIdaVFxhVjvjDU0xZFpf9x07bIrchUUUUU=
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAgUSCWrfb0EObQAAsk

Hello Hans, Mauro and Shuangpeng,=0D
=0D
Could you help check whether this gspca read/start use-after-free is the=0D
same issue as the disconnect lifetime problem discussed in this thread,=0D
and whether the v2 queue-unregister change covers this access path?=0D
=0D
The archived reports from runs 8, 20 and 73 show a KASAN read inside=0D
usb_ifnum_to_if(), reached through:=0D
=0D
  read -> v4l2_read -> vb2_fop_read -> vb2 file-I/O stream start=0D
       -> gspca_start_streaming -> gspca_init_transfer=0D
       -> usb_ifnum_to_if=0D
=0D
The affected storage was allocated by usb_alloc_dev() and freed through=0D
device_release()/put_device() in the USB hub disconnect path. Thus the=0D
first reported access concerns the parent usb_device, rather than an=0D
input URB or a NULL interface returned by usb_ifnum_to_if(). The device=0D
labels in these runs are stv0680, spca506 and finepix.=0D
=0D
The recorded kernels identify themselves as 7.1.2-dirty (#70, #81 and=0D
#83). The exact tested source commit and dirty diff, and their association=
=0D
with the saved configurations, have not been established. The test setup=0D
used custom QEMU USB devices. These reports have not been retested on an=0D
unmodified current kernel, and I have not verified the runtime effect of=0D
your patch on this read/start case. No standalone reproducer is included.=0D
=0D
Your v1 describes the parent USB reference lifetime gap, while v2 stops=0D
the queue during disconnect and describes a late-close/stop access. I do=0D
not want to assume that the different access phase either proves or=0D
rules out a common cause.=0D
=0D
Could you point me to the original public report if this particular=0D
read/start access is already known? If v2 does not cover it, is an=0D
additional start/disconnect synchronization fix required?=0D
=0D
Related original messages:=0D
https://lore.kernel.org/r/20260718025434.2259756-1-shuangpeng.kernel@gmail.=
com/=0D
https://lore.kernel.org/r/20260813031235.2468144-1-shuangpeng.kernel@gmail.=
com/=0D
=0D
Below is the complete first KASAN event from run 8, quoted without edits.=0D
Boot output before it and subsequent cascading faults are omitted. The=0D
full archived reports for all three runs are retained separately.=0D
=0D
I used an AI assistant to organize the archived evidence and draft this=0D
inquiry; the quoted KASAN output is from the original saved report.=0D
=0D
Thank you,=0D
Wang Xiong=0D
=0D
----- first KASAN event: archived run 8 -----=0D
BUG: KASAN: slab-use-after-free in usb_ifnum_to_if+0x1cb/0x1d0 drivers/usb/=
core/usb.c:352=0D
Read of size 8 at addr ffff88802d00e2a8 by task syz.0.12542/30330=0D
=0D
CPU: 0 UID: 0 PID: 30330 Comm: syz.0.12542 Not tainted 7.1.2-dirty #70 PREE=
MPTLAZY =0D
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb=
52ca86e094d-prebuilt.qemu.org 04/01/2014=0D
Call Trace:=0D
 <TASK>=0D
 __dump_stack lib/dump_stack.c:94 [inline]=0D
 dump_stack_lvl+0xa7/0xd0 lib/dump_stack.c:120=0D
 print_address_description mm/kasan/report.c:378 [inline]=0D
 print_report+0xcb/0x5d0 mm/kasan/report.c:482=0D
 ? _raw_write_unlock_irq+0x60/0x60=0D
 ? usb_ifnum_to_if+0x1cb/0x1d0 drivers/usb/core/usb.c:352=0D
 kasan_report+0xaf/0xe0 mm/kasan/report.c:595=0D
 ? usb_ifnum_to_if+0x1cb/0x1d0 drivers/usb/core/usb.c:352=0D
 usb_ifnum_to_if+0x1cb/0x1d0 drivers/usb/core/usb.c:352=0D
 ? vb2_vmalloc_alloc+0x136/0x3c0 drivers/media/common/videobuf2/videobuf2-v=
malloc.c:47=0D
 gspca_init_transfer.constprop.0+0x193/0x1ff0 drivers/media/usb/gspca/gspca=
.c:772=0D
 ? vb2_vmalloc_alloc+0x297/0x3c0 drivers/media/common/videobuf2/videobuf2-v=
malloc.c:60=0D
 ? kasan_save_track+0x10/0x30 mm/kasan/common.c:78=0D
 ? dma_unmap_sgtable include/linux/dma-mapping.h:565 [inline]=0D
 ? vb2_vmalloc_dmabuf_ops_detach+0x190/0x190 drivers/media/common/videobuf2=
/videobuf2-vmalloc.c:264=0D
 ? __vb2_queue_alloc+0xdae/0x1240 drivers/media/common/videobuf2/videobuf2-=
core.c:495=0D
 ? gspca_stop_streaming+0x50/0x50 include/media/videobuf2-core.h:1200=0D
 ? instrument_read_write include/linux/instrumented.h:55 [inline]=0D
 ? atomic_long_try_cmpxchg_release include/linux/atomic/atomic-instrumented=
.h:4480 [inline]=0D
 ? __mutex_unlock_fast kernel/locking/mutex.c:172 [inline]=0D
 ? mutex_unlock+0x6a/0xa0 kernel/locking/mutex.c:579=0D
 ? __mutex_unlock_slowpath.constprop.0+0x360/0x360 arch/x86/include/asm/ato=
mic64_64.h:15=0D
 ? instrument_read_write include/linux/instrumented.h:55 [inline]=0D
 ? atomic_try_cmpxchg_acquire include/linux/atomic/atomic-instrumented.h:13=
01 [inline]=0D
 ? queued_spin_lock include/asm-generic/qspinlock.h:111 [inline]=0D
 ? do_raw_spin_lock include/linux/spinlock.h:187 [inline]=0D
 ? __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:133 [inline]=0D
 ? _raw_spin_lock_irqsave+0x72/0xb0 kernel/locking/spinlock.c:166=0D
 ? _raw_write_unlock_irq+0x60/0x60=0D
 ? __fill_vb2_buffer+0x32c/0x420 drivers/media/common/videobuf2/videobuf2-v=
4l2.c:604=0D
 gspca_start_streaming+0x62/0xb0 drivers/media/usb/gspca/gspca.c:1360=0D
 ? gspca_init_transfer.constprop.0+0x1ff0/0x1ff0 drivers/media/usb/gspca/gs=
pca.c:851=0D
 vb2_start_streaming+0x211/0x680 drivers/media/common/videobuf2/videobuf2-c=
ore.c:1783=0D
 ? __bitmap_weight+0xd4/0x100 lib/bitmap.c:341=0D
 vb2_core_streamon+0x285/0x470 drivers/media/common/videobuf2/videobuf2-cor=
e.c:2336=0D
 __vb2_init_fileio+0xdc1/0x1120 drivers/media/common/videobuf2/videobuf2-co=
re.c:2949=0D
 ? vb2_vmalloc_dmabuf_ops_vmap+0xb0/0xb0 drivers/media/common/videobuf2/vid=
eobuf2-vmalloc.c:313=0D
 __vb2_perform_fileio+0x981/0x15e0 drivers/media/common/videobuf2/videobuf2=
-core.c:3025=0D
 ? vb2_thread_start+0x380/0x380 drivers/media/common/videobuf2/videobuf2-co=
re.c:3273=0D
 ? __mutex_lock_interruptible_slowpath+0x10/0x10 kernel/locking/mutex.c:112=
9=0D
 ? instrument_atomic_read_write include/linux/instrumented.h:112 [inline]=0D
 ? atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 =
[inline]=0D
 ? __refcount_sub_and_test include/linux/refcount.h:389 [inline]=0D
 ? __refcount_dec_and_test include/linux/refcount.h:432 [inline]=0D
 ? refcount_dec_and_test include/linux/refcount.h:450 [inline]=0D
 ? put_task_struct include/linux/sched/task.h:130 [inline]=0D
 ? wake_up_q+0xaf/0x130 kernel/sched/core.c:1159=0D
 vb2_fop_read+0x219/0x3e0 drivers/media/common/videobuf2/videobuf2-v4l2.c:1=
215=0D
 v4l2_read+0x1fc/0x320 drivers/media/v4l2-core/v4l2-dev.c:316=0D
 ? v4l2_write+0x320/0x320 include/linux/kobject.h:89=0D
 vfs_read+0x1d9/0x980 fs/read_write.c:572=0D
 ? kernel_read+0x220/0x220 fs/read_write.c:41=0D
 ? _copy_to_user+0x80/0xa0 lib/usercopy.c:26=0D
 ? __fget_files+0x1a0/0x250 fs/file.c:1103=0D
 ksys_read+0x111/0x210 fs/read_write.c:717=0D
 ? vfs_write+0xcb0/0xcb0 include/linux/fsnotify.h:88=0D
 ? __x64_sys_clock_settime+0x250/0x250 kernel/time/posix-timers.c:1538=0D
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]=0D
 do_syscall_64+0xad/0x480 arch/x86/entry/syscall_64.c:94=0D
 entry_SYSCALL_64_after_hwframe+0x4b/0x53=0D
RIP: 0033:0x7fcc4f2e283d=0D
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48=0D
RSP: 002b:00007fcc4dd05f98 EFLAGS: 00000246 ORIG_RAX: 0000000000000000=0D
RAX: ffffffffffffffda RBX: 00007fcc4f576090 RCX: 00007fcc4f2e283d=0D
RDX: 00000000000000e1 RSI: 00002000000006c0 RDI: 0000000000000003=0D
RBP: 00007fcc4f3800b7 R08: 0000000000000000 R09: 0000000000000000=0D
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000=0D
R13: 00007fcc4f576128 R14: 00007fcc4f576090 R15: 00007fcc4dce6000=0D
 </TASK>=0D
=0D
Allocated by task 70:=0D
 kasan_save_stack+0x20/0x40 mm/kasan/common.c:57=0D
 kasan_save_track+0x10/0x30 mm/kasan/common.c:78=0D
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]=0D
 __kasan_kmalloc+0x77/0x90 mm/kasan/common.c:415=0D
 kmalloc_noprof include/linux/slab.h:950 [inline]=0D
 kzalloc_noprof include/linux/slab.h:1188 [inline]=0D
 usb_alloc_dev+0x50/0xdc0 drivers/usb/core/usb.c:651=0D
 hub_port_connect drivers/usb/core/hub.c:5470 [inline]=0D
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]=0D
 port_event drivers/usb/core/hub.c:5871 [inline]=0D
 hub_event+0x1c82/0x4050 drivers/usb/core/hub.c:5953=0D
 process_one_work+0x662/0xdb0 kernel/workqueue.c:3314=0D
 process_scheduled_works kernel/workqueue.c:3397 [inline]=0D
 worker_thread+0x58b/0xc70 kernel/workqueue.c:3478=0D
 kthread+0x394/0x4b0 kernel/kthread.c:436=0D
 ret_from_fork+0x37f/0x7b0 arch/x86/kernel/process.c:158=0D
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245=0D
=0D
Freed by task 30325:=0D
 kasan_save_stack+0x20/0x40 mm/kasan/common.c:57=0D
 kasan_save_track+0x10/0x30 mm/kasan/common.c:78=0D
 kasan_save_free_info+0x37/0x50 mm/kasan/generic.c:584=0D
 poison_slab_object mm/kasan/common.c:253 [inline]=0D
 __kasan_slab_free+0x3b/0x60 mm/kasan/common.c:285=0D
 kasan_slab_free include/linux/kasan.h:235 [inline]=0D
 slab_free_hook mm/slub.c:2689 [inline]=0D
 slab_free mm/slub.c:6251 [inline]=0D
 kfree+0xf8/0x390 mm/slub.c:6566=0D
 device_release+0xcd/0x270 drivers/base/core.c:2566=0D
 kobject_cleanup lib/kobject.c:689 [inline]=0D
 kobject_release lib/kobject.c:720 [inline]=0D
 kref_put include/linux/kref.h:65 [inline]=0D
 kobject_put+0x15b/0x260 lib/kobject.c:737=0D
 put_device+0x1b/0x30 drivers/base/core.c:3814=0D
 hub_quiesce+0x159/0x310 drivers/usb/core/hub.c:1405=0D
 hub_disconnect+0xd1/0x460 drivers/usb/core/hub.c:1811=0D
 usb_unbind_interface+0x188/0x770 drivers/usb/core/driver.c:458=0D
 device_remove drivers/base/dd.c:621 [inline]=0D
 device_remove+0x11f/0x170 drivers/base/dd.c:613=0D
 __device_release_driver drivers/base/dd.c:1352 [inline]=0D
 device_release_driver_internal+0x4b6/0x660 drivers/base/dd.c:1375=0D
 usb_driver_release_interface+0x105/0x180 drivers/usb/core/driver.c:640=0D
 proc_ioctl drivers/usb/core/devio.c:2359 [inline]=0D
 proc_ioctl_default drivers/usb/core/devio.c:2402 [inline]=0D
 usbdev_do_ioctl drivers/usb/core/devio.c:2766 [inline]=0D
 usbdev_ioctl+0x6f05/0x86d0 drivers/usb/core/devio.c:2826=0D
 vfs_ioctl fs/ioctl.c:51 [inline]=0D
 __do_sys_ioctl fs/ioctl.c:597 [inline]=0D
 __se_sys_ioctl fs/ioctl.c:583 [inline]=0D
 __x64_sys_ioctl+0x877/0x1640 fs/ioctl.c:583=0D
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]=0D
 do_syscall_64+0xad/0x480 arch/x86/entry/syscall_64.c:94=0D
 entry_SYSCALL_64_after_hwframe+0x4b/0x53=0D
=0D
The buggy address belongs to the object at ffff88802d00e000=0D
 which belongs to the cache kmalloc-2k of size 2048=0D
The buggy address is located 680 bytes inside of=0D
 freed 2048-byte region [ffff88802d00e000, ffff88802d00e800)=0D
=0D
The buggy address belongs to the physical page:=0D
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2d008=
=0D
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0=0D
flags: 0x4000000000000040(head|zone=3D1)=0D
page_type: f5(slab)=0D
raw: 4000000000000040 ffff888003842000 dead000000000100 dead000000000122=0D
raw: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000=0D
head: 4000000000000040 ffff888003842000 dead000000000100 dead000000000122=0D
head: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000=0D
head: 4000000000000003 ffffea0000b40201 00000000ffffffff 00000000ffffffff=0D
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008=0D
page dumped because: kasan: bad access detected=0D
=0D
Memory state around the buggy address:=0D
 ffff88802d00e180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0D
 ffff88802d00e200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0D
>ffff88802d00e280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0D
                                  ^=0D
 ffff88802d00e300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0D
 ffff88802d00e380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0D

