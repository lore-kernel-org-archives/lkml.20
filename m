Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D72E8DEC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527261; cv=none; b=tVrr/1O+RC7Hyv4c0qRU6/0+5tJnFfDO9WjoIxcNHpWuwuAXyLFCmvqp2l/lZ+b/WgVc+xEzvZMyISS5nwhGG+G9pYWBOQsoCYZgJYVCM4JgpCfaCdxfVm4emldA/6OfD7k7mBtdayjhHpr2U3W/hqTX8YaQN4VmIeVIYgNoG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527261; c=relaxed/simple;
	bh=Ozfy9lFyB8tifz3y3TriGEUfFP2na9pX1tPK8w8VsZw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t3cOVGvymopq8lsxnF4+/Fv79bAv4L5NYof5iLLqJKd5rg1XFW1GMyDqdZA8sVlTpYf7vPCYjn9PtgozUnA8uLPfd5wm6jTjni9cMLF2tA/S8BdNZ0moFQhHHVQKRdaeqJTZ3xyb3uV87jyYHgTS2lEO8SJDebdxd2l5NZc5whk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1bf511988so1243622eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527259; x=1789132059;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ENZTYQ0HGy3+FSmfPdjCu9Za6MUoaMvB0s1C8b2taM8=;
        b=nW8e9Opp26v65PlRElUPa2mYlcOoAGT0euL8PO0WgvhgWt2TzdMC/UkSEDdSL9PKX/
         TUMe5aZ3AClIcn94C0FrusWZk/zqbJAK8LLxsy1d9+DaXzlDChMf5OaJ5IPt9i9hsc3s
         pNiUR6GLFb9E99xu9Z7KZOZCKZrzgF9fS00GNMVgHTzML7LrvLUaLC/2ugjS6xTl3hzW
         Dd4KihGcdLZFoajIaSKmvveq0+WrtLIZoiSV50eT+/NjvaiYhyZch8ukWE7xZa9jGvSt
         XKfyEHKXYfbDQpSl08DkxmWu3vDyjs7qBzWUGoeLBV1Z4Mt6gV+iiDSMrxJ4dn3Rf59d
         pIqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLfOWSsYjzeyIob07YS+Q+i2kDPsGS+jCv87ZIZB5gqSIskdG1cFmJ2214xMGo0yeQwDj+RteFtKR4rxc=@vger.kernel.org
X-Gm-Message-State: AFuF++kDPO4+O2EkfvDHhnCO4Q1OPe2jKmRr/kXuMMSIgtYXh8SOBXDN
	TlrsJ8uXt8ahb9H7s8IimRR6kPWIh8yN8mF6spK8snjwwG6rX7o38f0i6ejr4Dxn6j6R9gAiLq6
	q0KRHTEZISGPdn8y2WpDgTQUKV/d7wioLV1n657bqKzjEs/ODm075Z9XHvos=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c09:b0:6b7:83c5:fdf4 with SMTP id
 006d021491bc7-6b783c603ccmr1554482eaf.53.1788527259249; Fri, 04 Sep 2026
 06:07:39 -0700 (PDT)
Date: Fri, 04 Sep 2026 06:07:39 -0700
In-Reply-To: <000000000000bce370061f4207cf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ac29b.04649fcc.10325f.0000.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in firmware_fallback_sysfs (2)
From: syzbot <syzbot+8f06445357a052a92657@syzkaller.appspotmail.com>
To: dakr@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	mcgrof@kernel.org, rafael@kernel.org, russ.weight@linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    bc35965f6940 Merge tag 'mm-hotfixes-stable-2026-09-03-17-4..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=123d08f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=8f06445357a052a92657
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=125c6125580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f06445357a052a92657@syzkaller.appspotmail.com

usb 7-1: Falling back to sysfs fallback for: v4l-pvrusb2-160xxx-01.fw
------------[ cut here ]------------
ret
WARNING: drivers/base/firmware_loader/fallback.c:158 at fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:158 [inline], CPU#0: pvrusb2-context/2510
WARNING: drivers/base/firmware_loader/fallback.c:158 at firmware_fallback_sysfs+0x6ef/0xc60 drivers/base/firmware_loader/fallback.c:248, CPU#0: pvrusb2-context/2510
Modules linked in:
CPU: 0 UID: 0 PID: 2510 Comm: pvrusb2-context Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:158 [inline]
RIP: 0010:firmware_fallback_sysfs+0x6ef/0xc60 drivers/base/firmware_loader/fallback.c:248
Code: ff ff e9 2f 42 d0 fa e8 af ab 9b fb e8 6a 31 5f fb 31 ff 89 c3 89 c6 e8 0f a6 9b fb 85 db 0f 84 f5 fa ff ff e8 92 ab 9b fb 90 <0f> 0b 90 48 8b 3c 24 4c 89 e2 48 c7 c6 20 f2 93 8c e8 6b 11 d0 fa
RSP: 0018:ffffc90007d1f8d0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000fffffff5 RCX: 0000000000000000
RDX: ffff88802e7e2580 RSI: ffffffff8670447e RDI: ffff88802e7e2580
RBP: 0000000000000001 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000fffffff5 R11: 000000000000761b R12: ffffffff8cff0200
R13: ffff888027cff200 R14: 0000000000001770 R15: ffff888027cff210
FS:  0000000000000000(0000) GS:ffff8880d5b60000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f735b1f0980 CR3: 0000000035e42000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 _request_firmware+0xfd7/0x13c0 drivers/base/firmware_loader/main.c:898
 request_firmware+0x35/0x50 drivers/base/firmware_loader/main.c:948
 pvr2_locate_firmware+0x8f/0x330 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1359
 pvr2_upload_firmware1+0x1ca/0x920 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1426
 pvr2_hdw_setup_low drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2107 [inline]
 pvr2_hdw_setup drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2261 [inline]
 pvr2_hdw_initialize+0x3e6/0x3710 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2338
 pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:111 [inline]
 pvr2_context_thread_func+0x253/0x920 drivers/media/usb/pvrusb2/pvrusb2-context.c:158
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
