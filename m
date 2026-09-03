Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1D3655EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424448; cv=none; b=UfxpovxQkleT8/nto7jYg05/sSxLPSEPNucohOSkZYb7aE+n3fcC5vqlyCWqXFyAzDOq1UyeuRuKfnyWzFMt3uGh1r1FoVvY+ett7mHW8s4KsLwN1F+dKHip7uR8LmXcPtBwI07nI9fEY7czM4hISq6CKZ18GzIZqYCsZKpc4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424448; c=relaxed/simple;
	bh=IlLxJb6GL7PfjaveLvsDRODuBDC9KnK9zOO6l8x+rAg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rD6ctkD+FA5pyYSNrE8zPX5Y+uwlfI53Zitk+qh2FlnL1bVMEfrLmCFrB86CUY4VzB3PjJbIPDSIbULITS0axatG1t/iFv7m+3qaQlnClXLDmZIkh8pONKHf2buesd9QasialhSZxbzwYSlwIDK0BXR59pNvUpPA5ZSIt4nCcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab260600easo994461b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424445; x=1789029245;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=viGOS+P6Odypp8+i4ycwr/lY/oGZw9QBQqF49wPd7hk=;
        b=HG2fVIe5VT+KL2W1PAxlgu9NVJ1R84fmsBFadmH1Xklyg3Vuei/n5Hls0Pjl4v0TOD
         mtYpiJIAkmlmPhRiKZHtC991Qalk8HbMT6WV51UrjBv0CqF/yq+Kx8TuXCYqHGB9SFht
         iY/lKihcoub5BLvUTiw8IuCXDd1rPE9CRjWkdIxP+tIzNQNIFpx1lLuQ4r576MoOzbUb
         izcxj3UDg+TZVOYIWbRJkxkmyqPs+lde673Sq3s6OVmUQF1HfVUpzLHUYbnKx9xwyy/R
         SBnQDtKhKHo5bMjtlrgOgSu3sZ4uICaEe0S6kl3bviKCoFxEVZ/Apq4RBUpNrQY4t2ru
         A26g==
X-Forwarded-Encrypted: i=1; AKwUvBzvNjBfHp+9n3w1gKllE74GKkxeOLZ3jd9iNEPrbuQtRVsNmzSCrcm7Mxo/2f3tUrfZHlhCRuxKjcESOlU=@vger.kernel.org
X-Gm-Message-State: AFuF++lUNPDseyIacsw0pBOz7p8VsUuRiFiMrbKZnB/g2FPTxcUKwqE6
	wF3AZS+4B0Qtw2jVRvJpLRuB73CupkfgnAkvyvam523SQirPTUMSdOtcS8RZTouAm+/JrtOFB9v
	WYzoovBO0NlIuRcIEw4lGf3BsAThwlhWr6BU8/VY01rSK4oyLjV6WujsIyl8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1789:b0:6aa:e367:a3e2 with SMTP id
 006d021491bc7-6b585dada5dmr2529237eaf.19.1788424445319; Thu, 03 Sep 2026
 01:34:05 -0700 (PDT)
Date: Thu, 03 Sep 2026 01:34:05 -0700
In-Reply-To: <20260903061045.525053-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9930fd.9266084e.bf0d7.016a.GAE@google.com>
Subject: Re: [syzbot] [autofs?] memory leak in autofs_new_ino
From: syzbot <syzbot+df1db6e034b3953e19f5@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in prepare_creds

BUG: memory leak
unreferenced object 0xffff888109c2f180 (size 184):
  comm "syz-executor", pid 6487, jiffies 4294948020
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 1a243f47):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    kmem_cache_alloc_noprof+0x34f/0x440 mm/slub.c:4931
    prepare_creds+0x22/0x570 kernel/cred.c:185
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x988/0x2d70 kernel/fork.c:2153
    kernel_clone+0x101/0x710 kernel/fork.c:2748
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2889
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881019c8600 (size 176):
  comm "syz.0.18", pid 6603, jiffies 4294948020
  hex dump (first 32 bytes):
    00 00 00 00 02 00 2c 0c 60 a4 87 85 ff ff ff ff  ......,.`.......
    d0 b9 e9 0c 81 88 ff ff 00 e3 06 01 81 88 ff ff  ................
  backtrace (crc d2f375e0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    kmem_cache_alloc_noprof+0x34f/0x440 mm/slub.c:4931
    alloc_empty_file+0x57/0x180 fs/file_table.c:262
    alloc_file fs/file_table.c:396 [inline]
    alloc_file_pseudo+0xd3/0x180 fs/file_table.c:427
    create_pipe_files+0x106/0x2f0 fs/pipe.c:1042
    __do_pipe_flags fs/pipe.c:1088 [inline]
    do_pipe2+0x6c/0x160 fs/pipe.c:1136
    __do_sys_pipe fs/pipe.c:1159 [inline]
    __se_sys_pipe fs/pipe.c:1157 [inline]
    __x64_sys_pipe+0x18/0x20 fs/pipe.c:1157
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810d168f18 (size 56):
  comm "syz.0.18", pid 6603, jiffies 4294948020
  hex dump (first 32 bytes):
    ff ff 01 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 2672a0c6):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    kmem_cache_alloc_noprof+0x34f/0x440 mm/slub.c:4931
    lsm_file_alloc security/security.c:171 [inline]
    security_file_alloc+0x30/0x250 security/security.c:2406
    init_file+0x3e/0x160 fs/file_table.c:184
    alloc_empty_file+0x75/0x180 fs/file_table.c:266
    alloc_file fs/file_table.c:396 [inline]
    alloc_file_pseudo+0xd3/0x180 fs/file_table.c:427
    create_pipe_files+0x106/0x2f0 fs/pipe.c:1042
    __do_pipe_flags fs/pipe.c:1088 [inline]
    do_pipe2+0x6c/0x160 fs/pipe.c:1136
    __do_sys_pipe fs/pipe.c:1159 [inline]
    __se_sys_pipe fs/pipe.c:1157 [inline]
    __x64_sys_pipe+0x18/0x20 fs/pipe.c:1157
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888102dc7300 (size 184):
  comm "syz-executor", pid 6487, jiffies 4294948082
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 7611ee4d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    kmem_cache_alloc_noprof+0x34f/0x440 mm/slub.c:4931
    prepare_creds+0x22/0x570 kernel/cred.c:185
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x988/0x2d70 kernel/fork.c:2153
    kernel_clone+0x101/0x710 kernel/fork.c:2748
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2889
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881027737e0 (size 32):
  comm "syz-executor", pid 6487, jiffies 4294948082
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    f8 52 0a 00 81 88 ff ff 00 00 00 00 00 00 00 00  .R..............
  backtrace (crc 9ae86290):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5359
    _kmalloc_noprof include/linux/slab.h:992 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    lsm_blob_alloc+0x4d/0x80 security/security.c:218
    lsm_cred_alloc security/security.c:235 [inline]
    security_prepare_creds+0x2d/0x290 security/security.c:2866
    prepare_creds+0x317/0x570 kernel/cred.c:215
    copy_creds+0x44/0x290 kernel/cred.c:286
    copy_process+0x988/0x2d70 kernel/fork.c:2153
    kernel_clone+0x101/0x710 kernel/fork.c:2748
    __do_sys_clone+0x7f/0xb0 kernel/fork.c:2889
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810d41acc0 (size 176):
  comm "syz.0.19", pid 6624, jiffies 4294948082
  hex dump (first 32 bytes):
    00 00 00 00 02 00 2c 0c 60 a4 87 85 ff ff ff ff  ......,.`.......
    28 f3 f5 0c 81 88 ff ff c0 26 2b 16 81 88 ff ff  (........&+.....
  backtrace (crc fec2fe67):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    kmem_cache_alloc_noprof+0x34f/0x440 mm/slub.c:4931
    alloc_empty_file+0x57/0x180 fs/file_table.c:262
    alloc_file fs/file_table.c:396 [inline]
    alloc_file_pseudo+0xd3/0x180 fs/file_table.c:427
    create_pipe_files+0x106/0x2f0 fs/pipe.c:1042
    __do_pipe_flags fs/pipe.c:1088 [inline]
    do_pipe2+0x6c/0x160 fs/pipe.c:1136
    __do_sys_pipe fs/pipe.c:1159 [inline]
    __se_sys_pipe fs/pipe.c:1157 [inline]
    __x64_sys_pipe+0x18/0x20 fs/pipe.c:1157
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         8d3ae592 Linux 7.2
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17fb1f79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=11ad91fcc8fa7933
dashboard link: https://syzkaller.appspot.com/bug?extid=df1db6e034b3953e19f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17a870f9580000

