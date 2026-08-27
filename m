Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D31B4223
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810614; cv=none; b=S5HE/y49W01ahb+e+10dEiYkH1EBwIkXgf122IH80ttwHYpWqkI7AvqLIlrpq9j5rR7BhEQzSkWoP6HJqaS70cgZ/uzFMiRp6kRLrR0YUys5UL5u19p4MFJldG74xcGoYDhUWYK5DH6pa+TzSN9KhxviuFsEC1CW3gumt6RQO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810614; c=relaxed/simple;
	bh=wpjCM66ZGIpHBFMrmaVY3TR2/A1C97cAeq8B+JJexBk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pzB9SIkAhW9cwB6dLMq18+19we6ZG144GodYN3ddnU/hZ8fDxh0kOsjuf5OZCvFUPtjUaxSQT0MRyJ3gKfZZY1z2yPiND8MDQJkDdsvLXWl9QH4rYh/DWqU08CUaeo7yuJS0V6baWMJumUDRj+Zt0XDWC1ex2hcuD7x6mPoaiow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f11.google.com with SMTP id 46e09a7af769-7e9df14804fso664904a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810612; x=1788415412;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5PG8cCF0wqj61zkbF+HJXBoqreydbADpLDFmxQ+CIcg=;
        b=W4SGzjlMER/vY7ak5Y+/14hq46b9q50QQt18CCVFOCmQZax+YAveVvFLYDTsPlMLbL
         GhnLnfxOfN7k7ufbif4Lkla1gmX4lShLboZBpLQx14G5qxSxdjYumnei4/X5KalJF1Ch
         7V8RaGpAJhNRycBB4TVUD1svRaNrMcacCSpXtj2QVpWEcx80SkBlNkETtdDh1RlOH1st
         1oIWaby+2ma/JG+d6fZB7FP74ePfGoszl19aMOEQMv3ZWyPt67CSRcX+MN3VHOcHa8Wi
         /LaQYF7tiV/qD83+j1DnZGLMb/2OAehQeErmzsVVACDcfT1uMIgkA5fGFK3GbqhmaxAj
         VCOA==
X-Gm-Message-State: AFuF++nw8naIpsxNHLCG0RfejpEbmne7g+VLcsCYiQhns12ZYveJ/PUh
	rVEyaH5hbAKgG8wFnU3vnDNy6WiFl7k3fzj7X/+3quuRsUhhRwe/3mvcHmVR7YZOdw3ihPxlmiO
	J/CN4TDkmF9UiG8McqElKca/JaxdEIRMQpIctTh2ISf2HCzNm5m9mj2CWyD//fQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:214:b0:6b1:a11a:eeaf with SMTP id
 006d021491bc7-6b1a11b04b5mr12309138eaf.13.1787810612253; Wed, 26 Aug 2026
 23:03:32 -0700 (PDT)
Date: Wed, 26 Aug 2026 23:03:32 -0700
In-Reply-To: <6a8f0de8.1d9ded08.62e62.00b5.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fd334.27659fcc.2ceef7.000e.GAE@google.com>
Subject: Re: [syzbot] [sound?] WARNING: ODEBUG bug in dummy_pcm_close
From: syzbot <syzbot+225231fce6755d40d078@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13f58579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=225231fce6755d40d078
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12315625580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a84579580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-818bebeb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6e4100526b12/vmlinux-818bebeb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/723c4783ee96/bzImage-818bebeb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+225231fce6755d40d078@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888034a07520 object type: hrtimer hint: dummy_hrtimer_callback+0x0/0x160 sound/drivers/dummy.c:325
WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0 lib/debugobjects.c:629, CPU#3: syz.0.149/6362
Modules linked in:
CPU: 3 UID: 0 PID: 6362 Comm: syz.0.149 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:debug_print_object+0x1a5/0x2b0 lib/debugobjects.c:629
Code: b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 4f 48 8d 3d d8 e1 1f 0c 41 56 48 8b 14 ed 40 71 61 8c 4c 89 e6 <67> 48 0f b9 3a 58 83 05 22 4e 15 0c 01 48 83 c4 18 5b 5d 41 5c 41
RSP: 0018:ffffc9000520fb48 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffc9000520fc30 RCX: 0000000000000000
RDX: ffffffff8c617080 RSI: ffffffff8c616c20 RDI: ffffffff914e1e30
RBP: 0000000000000003 R08: ffff888034a07520 R09: ffffffff8bf30280
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff8c616c20
R13: ffffffff8bf302c0 R14: ffffffff8962d870 R15: ffffc9000520fc48
FS:  0000555580a4f500(0000) GS:ffff8880d5ea2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7df3feb7c0 CR3: 00000000556d2000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1171 [inline]
 debug_check_no_obj_freed+0x4da/0x630 lib/debugobjects.c:1201
 slab_free_hook mm/slub.c:2609 [inline]
 slab_free mm/slub.c:6372 [inline]
 kfree+0x3d6/0x6c0 mm/slub.c:6687
 dummy_pcm_close+0x9a/0xd0 sound/drivers/dummy.c:609
 snd_pcm_release_substream.part.0+0x114/0x340 sound/core/pcm_native.c:2793
 snd_pcm_release_substream sound/core/pcm_native.c:2786 [inline]
 snd_pcm_release+0x10f/0x230 sound/core/pcm_native.c:2983
 __fput+0x3ff/0xb50 fs/file_table.c:512
 task_work_run+0x150/0x240 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x1d8/0x700 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
 do_syscall_64+0x661/0x790 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7df3f9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdeaf84e28 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f7df4227da0 RCX: 00007f7df3f9e0d9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f7df4227da0 R08: 00007f7df4226038 R09: 0000000000000000
R10: 000000000003fda4 R11: 0000000000000246 R12: 0000000000010a73
R13: 00007f7df422609c R14: 0000000000010769 R15: 00007f7df4226090
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	lcall  (bad)
   8:	df 48 89             	fisttps -0x77(%rax)
   b:	fa                   	cli
   c:	48 c1 ea 03          	shr    $0x3,%rdx
  10:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  14:	75 4f                	jne    0x65
  16:	48 8d 3d d8 e1 1f 0c 	lea    0xc1fe1d8(%rip),%rdi        # 0xc1fe1f5
  1d:	41 56                	push   %r14
  1f:	48 8b 14 ed 40 71 61 	mov    -0x739e8ec0(,%rbp,8),%rdx
  26:	8c
  27:	4c 89 e6             	mov    %r12,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	58                   	pop    %rax
  30:	83 05 22 4e 15 0c 01 	addl   $0x1,0xc154e22(%rip)        # 0xc154e59
  37:	48 83 c4 18          	add    $0x18,%rsp
  3b:	5b                   	pop    %rbx
  3c:	5d                   	pop    %rbp
  3d:	41 5c                	pop    %r12
  3f:	41                   	rex.B


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
