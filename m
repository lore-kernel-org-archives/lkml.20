Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319B1C75F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368485; cv=none; b=eQsqsV1Da2n1Da3BIYLPg6SityW8UX4aZW4p1g8PS2GcvwyKZn4XQWcAuTOULTkAJUiVgU7rm5Fca3jVJlU+j/l633Ro1sm0+o//G+hPyoOkexKxXuTWYElihTthDYN1Qgu2L+umb6hIBJoS8x2Ri4LkXLzVNTSFXzpJ8c6FIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368485; c=relaxed/simple;
	bh=fCzJRQDlQec3ZO95Jgd692HJEdGWz0yiLLboHFZP2qA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Qx07x+2D64U13/65nhO+Nv/jfHLigTrP/Iud1CU6ouTNeyJbLIpGqDPsmPYwhAabN3peB5dy3XpC4RhViUVuP4TcxuCRinWOJiWV1nJUUw0oUgTqdfnpp3ntEMzfYVXBOnZb7yX3KbQX5S2k3SMmZ4At/o2KehhRMW5qO0+sq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f8931a803cso2500262a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368482; x=1789973282;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7TZM8vCTTsKN+JdjDStcZ3+QEfgdpWl690wZbOyNjRs=;
        b=psCmpgeE0hXON85jyIJoS75bnOmVw+E8h+Z2+gGRK1lmGJ6+fiYfhn5EiWRzi7DT9e
         8ZR5HsrWRQELWu14fUcYteIF4wLz6fOUDj0nIBzuomyKr7rPIbSPDj4oIyhAtAZODKJM
         9peRHbtBGnO53ftRPdG5jSr8CkCuv8wyyQh5RiQbXXuZAsuxI8qx0gje+9cJB2mf/ISw
         OAnIaO1VDVmzp9KhAm9EO2RUjhvaA0ybbfxfP8HSnOFGWBPXiPFS8mZij+Ur9vYonZUF
         d5ZWuofGpuBMEcZrxhT5SIdNx9PDxTZl2+oLFqzKzfWFnBDbc0iL+GJYCvqIhEVLavv7
         /mVg==
X-Forwarded-Encrypted: i=1; AKwUvBxzQrpjXf2oQj/NMnfd01/hfB5pJjcs7emEQvn+v9DdsO8zuLiQo67sp3Bne57x+Jl8K5rV6du5MrJT8ZI=@vger.kernel.org
X-Gm-Message-State: AFuF++nosQod7z0sI/gUgYxsuip3pyrtXt7sPTgyav5JZi8mlcbW9iqb
	RyJB++1VaTuiwo/6W3hVSy+nT0+4kK3o2KV4B36xF72ns3sl6geFcDg5wiGim4cpaTDS4h+Ui8f
	NpdQMXOa4DNtblSll6FW8HAeBxnJxcYlVJLTneogboizhqhendfh31t0d0lY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1993:b0:6b7:46e9:9713 with SMTP id
 006d021491bc7-6c541f412abmr534020eaf.67.1789368482498; Sun, 13 Sep 2026
 23:48:02 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:48:02 -0700
In-Reply-To: <6aa7950c.728c0331.7916.0c71SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa798a2.f670cee1.72fc4.0018.GAE@google.com>
Subject: Re: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in uea_bind
From: syzbot <syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in uea_bind

usb 5-1: device descriptor read/64, error -71
usb 5-1: reset high-speed USB device number 6 using dummy_hcd
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in drivers/usb/atm/ueagle-atm.c:2466:28
index 4 is out of range for type 'bool [4]'
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xcc/0xf0 lib/ubsan.c:455
 uea_bind+0x1014/0x1380 drivers/usb/atm/ueagle-atm.c:2466
 usbatm_usb_probe+0x378/0x1b50 drivers/usb/atm/usbatm.c:1058
 uea_probe+0x194/0x570 drivers/usb/atm/ueagle-atm.c:2597
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
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
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
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
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x30a3/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


Tested on:

commit:         762137ff ptp: fc3: register PTP clock after initializa..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=121fc471580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d652488f63e96fd
dashboard link: https://syzkaller.appspot.com/bug?extid=92f5bf49bf4ac75223ca
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
