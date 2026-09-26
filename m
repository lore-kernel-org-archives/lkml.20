Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1BB4399E5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420799; cv=none; b=dACNNwOx8OM+uqBw3Mg0WmGOwPlSFZKJe6Gt0lnAVQzw8zUJ2ZVzqV8hUlMoAGbZI7E0gMhgLsKnALovX8/Mo5vqWa7hIwA3AqIKaXR8fLJzplVRDjjmEj0fIBxbbO8JgTf5A3+h3IeQ76cFYUPmPWttv68asfh10YzlNwgiQwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420799; c=relaxed/simple;
	bh=1msmKYuNovKJCEu2Eg9jzolVXqozK1HaBSjClyN0HFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLMV+khcKXO3gCEWU3Ibb1xph29D1aeIVvou+NppTDC3nPxUIXLFa0n6+qLqpu/BXgb7jEieWczLqQ9C0fA4trUshdG+4OXa7OBFAV/ww5N8CSCnQzvXT306TrUMdD4k9FmOPXESgrifKt0vUoJMK+FnRF0/Tlu2SD8yDkqdjTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtvJZ+++; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtvJZ+++"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so885825e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420794; x=1791025594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DETyHTH+1SFUdbDpZ6PXLVMzsHnJRWHB9+9aLI0a21o=;
        b=UtvJZ+++sc0ySKv7KKyG+NaiFLQs5G0D7UWrtBm2+VaDK3zG2sTKX0L8EtupswKtu0
         P8OI7uMcPByVvCPiDdUgdQw1f0ppn9hby6ZDbvHErUZYT1T36UMBA/Z5BB4syGC9eONY
         HHO6CA8n3d6hxUxVU9rEsuBFGtoxsa947+E2pne6xv9vZCeBjAs/NKuwGh3AH93cO6Ny
         IC/Nm6/ndHFeibhREawIBDTTgpZ8Drjnk61xPAz9T2NfpUZdB+9mB7M6dAJlEWlYlMW2
         4l4ExzOXVkHwGpFYPvDbeIWrrC/JBMUTmxbTLSsLVrWg/+zPmVO8RwKdTiHbKYqhjmQ8
         rc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420794; x=1791025594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DETyHTH+1SFUdbDpZ6PXLVMzsHnJRWHB9+9aLI0a21o=;
        b=ByURPaD4W9JZEELppOoNjzcmFK00SD5tRwoIXhaTvTWR9w9OzbU37d/RUOxE0Q6fxW
         AKuFPtAFpBGP+4EwTx1RNyxh98Gnb2TOy/xbXDdnQSw81EQzKt1slvXyl/fUMBnVGmLM
         aHQ9UtxIs+joV58l4CksUXTz54iQHj83zUcJ8kp0J8qw9Y+PT6+maDBptuONqmQlWEoq
         CdmAA6orwq1a8eip3DI3LJCX/TYK3ouU8MQBDbEhpGqI+u2hQSGXQsdsiaq4EM6abcy2
         wLS1ZPwNyW/YJPqZ0dheXmOlIqr095fABRxd77afH4L8ZbkeVPF3WmUVuWWFb48MkYE+
         R4Og==
X-Forwarded-Encrypted: i=1; AKwUvBzCL/xb3VPhgDyvuaZLuO7F5HCqtr4Rp/EuemUS8QMSwR47T3+YgyDmYyUKdqc/fbBw+znYrHyA7ttkrlM=@vger.kernel.org
X-Gm-Message-State: AFuF++m5/jOXn0Y8SZL+c0oGc+XEqUqTBakkj53U2eZHtTuU49lai3mt
	N25PyrvuaSCc5NXLzwxJ3fjtTpmiHF98ttqOlPZXtPZQ/rOySEjGjdiU
X-Gm-Gg: AYBFou0Tw+cnjOR8iLgu/jo2on9ZUB6N1ImyvcW1bqeOkHbkosOghOT+2BBFJdtR+yk
	8Gg8dP2vM2/ZlSx6DG1yC/ktPBQYn9RM1+Od37oS3maPhCNxFIyCktu6TDGvF6y8zTJSvRJVxNp
	xFT0xOcB8a/YcoxdaUBLLH4kcxIydwQEMvJrnAKVezl6IizR4InQDkeSfkirxNXMF7yVYsy6bAV
	VDQ5KIJ+EZRAhEeEeAxx7g5GnF9eytlNQgf++/gefqW7s071mHDGT1iwUkkL4ZbFowa0S4QM+4m
	2Ch66VNOU5UXQLiF/XyluRMYmTPsYdwbxuFZVemvG1OCyr5ShS0VyJlnkcv4NJi5mf+OA5Y5OJV
	kdOFkI5TJdCXzOG1VBv0S74tcYJ48D57toz0K73cyds4oTfZ+yNZRDLw+onQn4CHw53rDHHNGl1
	kL2m80rauM98v16Q0XfbERInDKksFhcG5UbSN1nuTCVoIeDF5WNa8x/xRsxmVA0INTGXrSmPTgq
	+rRub0db245s6/AvKUtXkcWTbTvCdtGv9d+h3fHMgP+I/OKSQ==
X-Received: by 2002:a05:600c:a418:b0:49f:e4ca:e1d with SMTP id 5b1f17b1804b1-49fe66fa070mr120630635e9.27.1790420793656;
        Sat, 26 Sep 2026 04:06:33 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.esi-lan.dz ([154.121.80.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbd2dsm122149255e9.12.2026.09.26.04.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:06:33 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	syzbot+d4c69e884538d43cc946785d621314039a1ed491@syzkaller.appspotmail.com
Subject: [PATCH] usb: raw-gadget: fix UAF in raw_process_ep_io
Date: Sat, 26 Sep 2026 12:06:24 +0100
Message-ID: <20260926110624.1419-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported

BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88802c217340 by task syz-executor384/5947

CPU: 1 UID: 0 PID: 5947 Comm: syz-executor384 Not tainted syzkaller #0 PREEMPT(full)
Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
<TASK>
__dump_stack lib/dump_stack.c:94 [inline]
dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
print_address_description mm/kasan/report.c:378 [inline]
print_report+0x13d/0x4b0 mm/kasan/report.c:482
kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
string_nocheck lib/vsprintf.c:648 [inline]
string+0x471/0x4d0 lib/vsprintf.c:730
vsnprintf+0x422/0x1300 lib/vsprintf.c:2945
snprintf+0xc7/0x100 lib/vsprintf.c:3043
set_dev_info drivers/base/core.c:4984 [inline]
dev_vprintk_emit+0x375/0x3e0 drivers/base/core.c:4994
dev_printk_emit+0xd2/0x10d drivers/base/core.c:5007
__dev_printk+0xcb/0x100 drivers/base/core.c:5019
_dev_err+0xef/0x127 drivers/base/core.c:5062
raw_process_ep_io.cold+0x43/0x83 drivers/usb/gadget/legacy/raw_gadget.c:1116
raw_ioctl_ep_write drivers/usb/gadget/legacy/raw_gadget.c:1153 [inline]
raw_ioctl+0x25a/0x2b80 drivers/usb/gadget/legacy/raw_gadget.c:1325
vfs_ioctl fs/ioctl.c:51 [inline]
__do_sys_ioctl fs/ioctl.c:597 [inline]
__se_sys_ioctl fs/ioctl.c:583 [inline]
__x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc86effa5eb
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48
Code: 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05
Code: <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00
RSP: 002b:00007ffcab99fea0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc86effa5eb
RDX: 00007ffcab99ff14 RSI: 0000000040085507 RDI: 0000000000000003
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 00007ffcab99fec0 R11: 0000000000000246 R12: 0000000000000003
R13: 00007ffcab99ff08 R14: 00007fc86f07dcc0 R15: 0000000000000002
</TASK>

Allocated by task 1:
kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
kasan_save_track+0x14/0x30 mm/kasan/common.c:78
poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
__kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
kasan_kmalloc include/linux/kasan.h:263 [inline]
__do_kmalloc_node mm/slub.c:5334 [inline]
__kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5471
kvasprintf+0xbc/0x150 lib/kasprintf.c:25
kvasprintf_const+0x66/0x1a0 lib/kasprintf.c:49
kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
dev_set_name+0xc7/0x100 drivers/base/core.c:3560
usb_add_gadget+0x520/0x920 drivers/usb/gadget/udc/core.c:1459
usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
usb_add_gadget_udc+0x26/0x70 drivers/usb/gadget/udc/core.c:1564
dummy_udc_probe+0x69e/0x960 drivers/usb/gadget/udc/dummy_hcd.c:1121
platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
call_driver_probe drivers/base/dd.c:628 [inline]
really_probe+0x241/0xa60 drivers/base/dd.c:706
__driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
__device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
__device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
bus_probe_device+0x64/0x160 drivers/base/bus.c:620
device_add+0x121d/0x1970 drivers/base/core.c:3772
platform_device_add+0x35a/0x800 drivers/base/platform.c:762
dummy_hcd_init+0x803/xc00 drivers/usb/gadget/udc/dummy_hcd.c:2894
do_one_initcall+0x11d/0x700 init/main.c:1347
do_initcall_level init/main.c:1409 [inline]
do_initcalls init/main.c:1425 [inline]
do_basic_setup init/main.c:1445 [inline]
kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
kernel_init+0x1f/0x1e0 init/main.c:1548
ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5947:
kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
kasan_save_track+0x14/0x30 mm/kasan/common.c:78
kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
poison_slab_object mm/kasan/common.c:253 [inline]
__kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
kasan_slab_free include/linux/kasan.h:235 [inline]
slab_free_hook mm/slub.c:2677 [inline]
slab_free mm/slub.c:6377 [inline]
kfree+0x22b/0x6c0 mm/slub.c:6692
kfree_const+0x5a/0x70 mm/util.c:46
kobject_cleanup lib/kobject.c:695 [inline]
kobject_release lib/kobject.c:720 [inline]
kref_put include/linux/kref.h:65 [inline]
kobject_put+0x218/0x640 lib/kobject.c:737
put_device+0x1f/0x30 drivers/base/core.c:3880
platform_remove+0x5f/0x80 drivers/base/platform.c:1456
device_remove+0xcb/0x180 drivers/base/dd.c:616
__device_release_driver drivers/base/dd.c:1349 [inline]
device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
unbind_store+0xf8/0x110 drivers/base/bus.c:244
drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
new_sync_write fs/read_write.c:595 [inline]
vfs_write+0x6ac/0x1050 fs/read_write.c:687
ksys_write+0x12a/0x250 fs/read_write.c:739
do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
entry_SYSCALL_64_after_hwframe+0x77/0x7f

When the UDC backing a raw-gadget instance is unbound, the UDC core
unregisters the gadget and frees the struct usb_gadget. gadget_unbind is
eventually called but there still remains a dangling pointer for the
gadget in raw_dev. Because the fd for raw_gadget is still open, a
reference to it remains. Following calls from ioctl would pass the
checks. When usb_ep_queue fails, it calls dev_err with dev->gadget->dev.
Since gadget is freed, this causes a UAF.

To fix it, we simply nullify dev->gadget in gadget_unbind. This requires
a spinlock.

Reported-by: syzbot+d4c69e884538d43cc946785d621314039a1ed491@syzkaller.appspotmail.com
Tested-by: syzbot+d4c69e884538d43cc946785d621314039a1ed491@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d4c69e884538d43cc946785d621314039a1ed491
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..9c263950f609 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -327,9 +327,16 @@ static int gadget_bind(struct usb_gadget *gadget,
 
 static void gadget_unbind(struct usb_gadget *gadget)
 {
+	unsigned long flags;
 	struct raw_dev *dev = get_gadget_data(gadget);
 
 	set_gadget_data(gadget, NULL);
+
+	/*Avoid dangling pointer in case it remaining references*/
+	spin_lock_irqsave(&dev->lock, flags);
+	dev->gadget = NULL;
+	spin_unlock_irqrestore(&dev->lock, flags);
+
 	/* Matches kref_get() in gadget_bind(). */
 	kref_put(&dev->count, dev_free);
 }
-- 
2.43.0

