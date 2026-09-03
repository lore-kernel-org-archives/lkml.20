Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C73F39FF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423364; cv=none; b=JbrI9y2ACjAnyb1CwkA5WtCyUUTcCVlbmCe0bV6WaHnIEyX045vaDbbuoZcvRWP4uT8GDPISoSyco83FvtxbvoZTOqMeiBioTT54F6UkCHtB3tEQV7CHy8YCsmlflHmglr39+ySVr02n3Hax4TpbPlZ1Se0zqkmTtIqCL6DkVSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423364; c=relaxed/simple;
	bh=xKl8zdXZA8MMkoRIVmIje/2ob+QEUAoRC41sjFvuE/I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lT0AL/cnuyExuwwHzpxWmxK8RJZne+s/YqACXDWLmEXUWqk/nxTHwjgZOYalEFZpq95e9FgIR2rNjXN7+YvBvLqCu7rPtVdX8e6h0jFh8UJRoEyAn9W69QA9b4dYcmDEj8NC70wIhhfkiQgNgEsgCasnw5RmS6QyqJge7D8cr2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12abf0e49so2880880eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423362; x=1789028162;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fk3dOFeTDQ3UwbqQJMafBAVcPkOJiJcXyMlw1Bm3F/g=;
        b=pcJ8blhOuV0Ui17WJLGLFIrbCiNMy2Zw6RoQ5G1/NKWFNQmrLxc3Letp8xk3DJqJ/c
         uzAh8y4QVBLyl4STmEge+cwZ4OgFe2EaeyucGKJan1qYGDaMkKO0VZoLEIr9lvYALrvd
         slJhFrGY/qBbu14+l6Ef/A6BvERJ6PSP8r7nKQd5nj4NtlJ+GPpVsoG6KI2tlgrgVuUI
         Od+U6at9MYloAo2GWMD8Ldfil19mB5KfyyHhaTL7zw5X3t/jvrPVWyrXmSW8X0bAFFK5
         Mx2NvQWHlyhI/qAM4dpR5lYe2DjknY5iJDdOJV5Zv9axs7xnRrEoc6SVh/Ua5w+Zw90M
         GACA==
X-Forwarded-Encrypted: i=1; AKwUvBwg7Lph3P+2myqrxx36wAih5w0ias0jfii5L6PEadvcinimiVeqgwV1DsBSrV7URHUvJeRSTYWHDmDiTuk=@vger.kernel.org
X-Gm-Message-State: AFuF++mCUxTw3v9C4g/0KsSBHtck/3WzPZbbeT9z6VqWRYHc6OQDs++h
	2bxfdfkq3M+ycWC/Sf6KmKo6O6kORhmR1eolkwkBakMATlOw6IuTeY0OsQg7HqK9PExHgWzUYQ+
	0FFUMvM6mT6qI64KfiO36yRusEPOPsBPn4gf8j3YQ4+7fRosLJvXzx/h8qKU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b92:b0:6b1:9ffe:a71c with SMTP id
 006d021491bc7-6b47bad3ff7mr8467655eaf.0.1788423362108; Thu, 03 Sep 2026
 01:16:02 -0700 (PDT)
Date: Thu, 03 Sep 2026 01:16:02 -0700
In-Reply-To: <20260903055751.10197-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a992cc2.0b659fcc.16ebfd.0002.GAE@google.com>
Subject: Re: [syzbot] [autofs?] memory leak in autofs_new_ino
From: syzbot <syzbot+df1db6e034b3953e19f5@syzkaller.appspotmail.com>
To: autofs@vger.kernel.org, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, raven@themaw.net, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in create_pipe_files

BUG: memory leak
unreferenced object 0xffff88810ceec180 (size 176):
  comm "syz.0.17", pid 6581, jiffies 4294948258
  hex dump (first 32 bytes):
    00 00 00 00 02 00 2c 0c 60 a4 87 85 ff ff ff ff  ......,.`.......
    d8 a5 46 0d 81 88 ff ff c0 36 91 00 81 88 ff ff  ..F......6......
  backtrace (crc ec35cd54):
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
unreferenced object 0xffff88810d8431c0 (size 56):
  comm "syz.0.17", pid 6581, jiffies 4294948258
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
unreferenced object 0xffff888102f619c0 (size 184):
  comm "syz-executor", pid 6483, jiffies 4294948379
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 4a068722):
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
unreferenced object 0xffff888102e91600 (size 32):
  comm "syz-executor", pid 6483, jiffies 4294948379
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
unreferenced object 0xffff88810d015000 (size 176):
  comm "syz.0.19", pid 6612, jiffies 4294948379
  hex dump (first 32 bytes):
    00 00 00 00 02 00 2c 0c 60 a4 87 85 ff ff ff ff  ......,.`.......
    80 8c 9c 11 81 88 ff ff c0 3c 91 00 81 88 ff ff  .........<......
  backtrace (crc 95068e96):
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
unreferenced object 0xffff888127a600e0 (size 56):
  comm "syz.0.19", pid 6612, jiffies 4294948379
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

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         8d3ae592 Linux 7.2
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=173850f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=11ad91fcc8fa7933
dashboard link: https://syzkaller.appspot.com/bug?extid=df1db6e034b3953e19f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17eb8b49580000

