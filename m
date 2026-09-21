Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0B3496D39
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994585; cv=none; b=TQrxJblpbpj4Qz8b//ltwkYLAoBnFjumNaqByIquOK7beKIClfV4nX1BbgpEVhgVhCS3dt3dEm3EcD7U7vj9KvahZkUD5X9MLp9cAwoa+keUkHMWLIvDNXBuyS2rzsICmkUH0mnazDGmdcQ1qbVFX/eQ+60cf9ufd3OZT823Y4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994585; c=relaxed/simple;
	bh=t8+PdfneDu1hxHC8QDP5ldRMtCmeAtS8ppcZKVYE45U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DT1+bK8TGujJ+f0FgYgc0wulhuNelvTLeHpKmWljhMBcaQT3IexwSITS07XmsOqhTS0qLaWYT4J6cxF5SyQqPsKU9HNmtVt5b2VbTehtc0cpq9lkeLUhy6Dgi1IUlxW/qDXyVzgF3C6/iE1bZbCCiUsoDjZ7QdcBHFcBNdR46yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bc8f608979so2329442eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994583; x=1790599383;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nlciio7ok7KxUJezaVMgg7fHEPOABsp4fse8OC9WpMA=;
        b=Gia/9GTjcEIPSNb7JkaA91vaaJwngGF/NU2G4nvGkCN3Y90xsUHELwyhM+WytVoBY7
         9028U9bOUefR2NhJAPWRgGsip23y9GpMGM0lNH5bMM74ByUjaDU9Dy9W/tHTgKsmr0yD
         zvSrQgyvEY9bbaHB4ydrwxsTLb1uHT8gcq4+nMQMFv4lcbD3qBuQgaGxmQOZ38bRzhSI
         L0z4lxiWnUyOsii4Ik0nujFs5wYooHRUhxdV0ur2B6QhspKonOsWqvt3mNzaIKkNLKnK
         v7nKDOFOHC4JPLUpxWFpVfFDVv4QNr/EV1N3qwPVcXBy6PGTKv6mchdJl6eHkzvJzk6i
         b/AQ==
X-Gm-Message-State: AFuF++nJ2EsDTUNXQhzRIJBsifBTCl8qzm9y39ayjLFjVZbQXMR7SJxO
	+opJXCWfeGoIkjKXkLvDZ/qTNzZZi4FGXe3ypa3V1AAPbQaPnvE8MOOlMNyqPfAYrnb8WXIf7Ns
	312IMLzMd6X7xmLYO6kPOKrZZC1yZExzkfMCRypYUnj6T7hW8Ipid2zSIk+Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198e:b0:6bd:d2ad:55a1 with SMTP id
 006d021491bc7-6ca9a1343b2mr9098950eaf.9.1789994583010; Mon, 21 Sep 2026
 05:43:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 05:43:02 -0700
In-Reply-To: <20260921122100.6242-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab12656.e548f532.1ca396.0013.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in iounmap
From: syzbot <syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in drm_mm_takedown

Console: switching to colour dummy device 80x25
------------[ cut here ]------------
Memory manager not clean during takedown.
WARNING: drivers/gpu/drm/drm_mm.c:965 at drm_mm_takedown+0x62/0x280 drivers/gpu/drm/drm_mm.c:965, CPU#3: syz.0.17/6259
Modules linked in:
CPU: 3 UID: 0 PID: 6259 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:drm_mm_takedown+0x62/0x280 drivers/gpu/drm/drm_mm.c:965
Code: 8b 43 38 48 39 c5 75 16 e8 8b b6 38 fc 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e e9 4a b0 00 06 e8 75 b6 38 fc 48 8d 3d fe 27 7d 0b <67> 48 0f b9 3a 48 c7 c0 00 84 65 8e 48 ba 00 00 00 00 00 fc ff df
RSP: 0018:ffffc90003b77860 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888026e90068 RCX: 0000000000000000
RDX: ffff8880334a4b00 RSI: ffffffff85d3669b RDI: ffffffff91508ea0
RBP: ffff888026e900a0 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff888027ef2e80
R13: ffff888027ef2e98 R14: ffffffff85d238e0 R15: 0000000000000000
FS:  00007ff311d0f6c0(0000) GS:ffff8880d5e59000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff310deb840 CR3: 000000003497d000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 drm_managed_release+0x1bb/0x540 drivers/gpu/drm/drm_managed.c:75
 drm_dev_release drivers/gpu/drm/drm_drv.c:924 [inline]
 kref_put include/linux/kref.h:65 [inline]
 drm_dev_put.part.0+0xca/0x140 drivers/gpu/drm/drm_drv.c:958
 drm_dev_put+0x1f/0x30 drivers/gpu/drm/drm_drv.c:957
 virtio_dev_remove+0xb8/0x170 drivers/virtio/virtio.c:375
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 device_unregister+0x1d/0xe0 drivers/base/core.c:4006
 unregister_virtio_device+0x39/0x60 drivers/virtio/virtio.c:608
 virtio_pci_remove+0x7c/0x110 drivers/virtio/virtio_pci_common.c:760
 pci_device_remove+0xb2/0x1d0 drivers/pci/pci-driver.c:535
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff310d9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff311d0f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007ff311025fa0 RCX: 00007ff310d9e159
RDX: 000000000000000d RSI: 0000200000000300 RDI: 0000000000000004
RBP: 00007ff310e3503b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff311026038 R14: 00007ff311025fa0 R15: 00007ffca5d5c2c8
 </TASK>
----------------
Code disassembly (best guess):
   0:	8b 43 38             	mov    0x38(%rbx),%eax
   3:	48 39 c5             	cmp    %rax,%rbp
   6:	75 16                	jne    0x1e
   8:	e8 8b b6 38 fc       	call   0xfc38b698
   d:	48 83 c4 08          	add    $0x8,%rsp
  11:	5b                   	pop    %rbx
  12:	5d                   	pop    %rbp
  13:	41 5c                	pop    %r12
  15:	41 5d                	pop    %r13
  17:	41 5e                	pop    %r14
  19:	e9 4a b0 00 06       	jmp    0x600b068
  1e:	e8 75 b6 38 fc       	call   0xfc38b698
  23:	48 8d 3d fe 27 7d 0b 	lea    0xb7d27fe(%rip),%rdi        # 0xb7d2828
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 c7 c0 00 84 65 8e 	mov    $0xffffffff8e658400,%rax
  36:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  3d:	fc ff df


Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=177894c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=ca1ef9e2e234b8d3599b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11bc9005580000

