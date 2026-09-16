Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD6A440629
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543154; cv=none; b=ZWxhIWHwH4NqASysBHSqwWzkiRePES4LaOy801R3LkqRtygAOctgguzzj8iruHT51G9PbTjzMwFIuqdLYUlLjfy66KRmGHQiCcKzhVsqCwptViDQQZ6biDpdTdH/bWEOZOb3MQskzf3BdBeduvNA+qVYAmK0cOzv2PfWbbaTmDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543154; c=relaxed/simple;
	bh=N7PrNTzy/vsNmBL45c5uKyZrOKn/qnoIUzh9V/rVCbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=X6R97FwzODiyPklQv7UptIUJXxO24yjTxTOLRjjpaJ59z7DUiQhpCygAvBbcJQYiMpIx5O08uRL7OTjBbJdO9x0hCjDEQLQKlqy5ybWOh/M6r3biz8wevj55mRoRh2uiJt/FMXLd7Dj2+7YYn5FAprQKk1f1dm5B7OwffiU3MdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6c2d5235ac3so2300710eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543144; x=1790147944;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:in-reply-to:date:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=N7PrNTzy/vsNmBL45c5uKyZrOKn/qnoIUzh9V/rVCbE=;
        b=sUrjRz6YJZLJkbXQrFO7IM/s50CVoyhfflrPKksxkprWzzJgG8qPmhuafPN8Q0z4su
         rvmianoPironMmifeBEF77LbJ5Mp6suxrmyIL0KX6eSwUQTgiyVjpIU9ZEwKjpZz66am
         s7w56/iSgf8FuJaaRUKfxXWIrsTbph/v8X7NQyxpXf3GPZSVXXC6bCC8kZEdModnAqxx
         +rC9FyjHQluk3pth0r7THff31I2COd5j2vq03JeH553MGWYmMWn5Zkdy0Z4b5do6fJux
         b1AXsiVP4E9HCuX1pyUn//tGNDH1fFmU0wRMmw6C1mNXylHWoK4PbepZZCybENMJmc92
         WjQA==
X-Forwarded-Encrypted: i=1; AKwUvBxjcGHaOIYKl2bkTq7k1fpz3JiA54iTi4kySj9MfzbZVPff3ImfLtlGj+MhFQBUI1JJkJu6gFJVSUrxFbE=@vger.kernel.org
X-Gm-Message-State: AFuF++l5nND8sesaqe8EMn3Tr5yj1p2bnQakqTSR97IgIdV3Nsfvj2B0
	J+x1rK9MUQnUO1iuZjPQvdCURAO1GguGHc/wZ44cp1090NrgxNNGfR+w6+EyTQlsTHH5xTpQTtQ
	ZQ0df+P6+716Y2az91RNA+jeYrokBVOFdCzSAO9QYaQaZ4prXesdK0ozFWZM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc9:b0:6aa:e367:a3e2 with SMTP id
 006d021491bc7-6c6383ceff2mr4593368eaf.19.1789543144670; Wed, 16 Sep 2026
 00:19:04 -0700 (PDT)
Date: Wed, 16 Sep 2026 00:19:04 -0700
In-Reply-To: <29630655-c3f4-4958-b22b-f1bfd8e76419n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaa42e8.a211d2ce.1a5198.02b8.GAE@google.com>
Subject: Re: [syzbot] [dri?] [virt?] WARNING in virtio_gpu_free_object
From: syzbot <syzbot+3590d97d8a586fa955c2@syzkaller.appspotmail.com>
To: tao1.yu@intel.com
Cc: syzkaller-bugs@googlegroups.com, tao1.yu@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> #syz test: https://github.com/yutao-intel/linux.git=20

This crash does not have a reproducer. I cannot test it.

> fix-virtio_gpu_free_object
>
> On Wednesday, September 2, 2026 at 9:38:26=E2=80=AFPM UTC+8 syzbot wrote:
>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit: 786262be6048 Merge tag 'edac_updates_for_v7.3_rc2' of git:.=
.
>> git tree: upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D160c01255800=
00
>> kernel config: https://syzkaller.appspot.com/x/.config?x=3D8c5c3949d762a=
91f
>> dashboard link:=20
>> https://syzkaller.appspot.com/bug?extid=3D3590d97d8a586fa955c2
>> compiler: gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian=
)=20
>> 2.44
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image (non-bootable):=20
>> https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_d=
isk-786262be.raw.xz
>> vmlinux:=20
>> https://storage.googleapis.com/syzbot-assets/1729d9f9738d/vmlinux-786262=
be.xz
>> kernel image:=20
>> https://storage.googleapis.com/syzbot-assets/ce8b90b3526c/bzImage-786262=
be.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the=20
>> commit:
>> Reported-by: syzbot+3590d9...@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
>> WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common=20
>> kernel/locking/mutex.c:625 [inline], CPU#0: syz.2.124/6285
>> WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x944/0x1bd0=20
>> kernel/locking/mutex.c:821, CPU#0: syz.2.124/6285
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 6285 Comm: syz.2.124 Not tainted syzkaller #0=20
>> PREEMPT(full)=20
>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=20
>> 1.16.3-debian-1.16.3-2 04/01/2014
>> RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
>> RIP: 0010:__mutex_lock+0x94b/0x1bd0 kernel/locking/mutex.c:821
>> Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 c0 10 00 00 44 8b 05 e8 16 74 =
05=20
>> 45 85 c0 75 13 48 8d 3d ac 21 77 05 48 c7 c6 e0 f3 ef 8b <67> 48 0f b9 3=
a=20
>> 90 e9 1b f8 ff ff 4d 8d a7 f0 0a 00 00 4c 89 e7 e8
>> RSP: 0018:ffffc90006017b30 EFLAGS: 00010246
>> RAX: 0000000000000003 RBX: ffff8880281551c0 RCX: 1ffffffff228a580
>> RDX: 0000000000000000 RSI: ffffffff8beff3e0 RDI: ffffffff914836d0
>> RBP: ffffc90006017ca0 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
>> R13: 0000000000000000 R14: dffffc0000000000 R15: ffff888027efeb60
>> FS: 00007f5302d486c0(0000) GS:ffff8880d5b64000(0000) knlGS:0000000000000=
000
>> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 000055619ef79490 CR3: 000000005c38c000 CR4: 0000000000352ef0
>> Call Trace:
>> <TASK>
>> virtio_gpu_remove_from_restore_list=20
>> drivers/gpu/drm/virtio/virtgpu_object.c:70 [inline]
>> virtio_gpu_free_object+0xec/0x280=20
>> drivers/gpu/drm/virtio/virtgpu_object.c:106
>> drm_gem_object_free+0x60/0xa0 drivers/gpu/drm/drm_gem.c:1164
>> kref_put include/linux/kref.h:65 [inline]
>> __drm_gem_object_put include/drm/drm_gem.h:562 [inline]
>> drm_gem_object_put include/drm/drm_gem.h:575 [inline]
>> drm_gem_object_put include/drm/drm_gem.h:572 [inline]
>> drm_client_buffer_delete drivers/gpu/drm/drm_client.c:201 [inline]
>> drm_client_buffer_delete+0x1d8/0x270 drivers/gpu/drm/drm_client.c:185
>> drm_fbdev_shmem_fb_destroy+0xc5/0x110 drivers/gpu/drm/drm_fbdev_shmem.c:=
67
>> put_fb_info drivers/video/fbdev/core/fbmem.c:61 [inline]
>> put_fb_info+0xb8/0xf0 drivers/video/fbdev/core/fbmem.c:56
>> fb_release+0x13e/0x190 drivers/video/fbdev/core/fb_chrdev.c:381
>> __fput+0x3ff/0xb50 fs/file_table.c:512
>> task_work_run+0x150/0x240 kernel/task_work.c:233
>> resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>> __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
>> exit_to_user_mode_loop+0x1d8/0x700 kernel/entry/common.c:101
>> __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline=
]
>> syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230=
=20
>> [inline]
>> syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
>> do_syscall_64+0x661/0x790 arch/x86/entry/syscall_64.c:89
>> entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7f5301d9e159
>> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 =
f7=20
>> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 f=
f=20
>> ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007f5302d48028 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
>> RAX: 0000000000000000 RBX: 00007f5302025fa0 RCX: 00007f5301d9e159
>> RDX: 0000000000000000 RSI: ffffffffffffffff RDI: 0000000000000000
>> RBP: 00007f5301e35024 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 00007f5302026038 R14: 00007f5302025fa0 R15: 00007fffc5d9f388
>> </TASK>
>> ----------------
>> Code disassembly (best guess):
>> 0: 0f b6 14 11 movzbl (%rcx,%rdx,1),%edx
>> 4: 38 d0 cmp %dl,%al
>> 6: 7c 08 jl 0x10
>> 8: 84 d2 test %dl,%dl
>> a: 0f 85 c0 10 00 00 jne 0x10d0
>> 10: 44 8b 05 e8 16 74 05 mov 0x57416e8(%rip),%r8d # 0x57416ff
>> 17: 45 85 c0 test %r8d,%r8d
>> 1a: 75 13 jne 0x2f
>> 1c: 48 8d 3d ac 21 77 05 lea 0x57721ac(%rip),%rdi # 0x57721cf
>> 23: 48 c7 c6 e0 f3 ef 8b mov $0xffffffff8beff3e0,%rsi
>> * 2a: 67 48 0f b9 3a ud1 (%edx),%rdi <-- trapping instruction
>> 2f: 90 nop
>> 30: e9 1b f8 ff ff jmp 0xfffff850
>> 35: 4d 8d a7 f0 0a 00 00 lea 0xaf0(%r15),%r12
>> 3c: 4c 89 e7 mov %r12,%rdi
>> 3f: e8 .byte 0xe8
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzk...@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup
>>
>
> --=20
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/29630655-c3f4-4958-b22b-f1bfd8e76419n%40googlegroups.com.
