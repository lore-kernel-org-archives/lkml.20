Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B916298CC4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981316; cv=none; b=hAQKVWaHefCjW3hDFzSRwH7EVV03Fb5yok3lXJOh43lGgpYPPaL8dUvdhrWip4tcLhPQ7mjlL5ICUf/oDWQ1HxZQ+W0/Fa0Fs3p4790gahl2Pyv6uIjd9avzpJA+PbpnpQZrsSResdIk8kFusMkfstrjYZkBV8T865p0oLzL9Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981316; c=relaxed/simple;
	bh=KRc9qyuFWFm2b6xa/PBwfZWdCOb8+f/ZEHB88nfl5dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8vGyAN/oZ1uHONRKAt5ps3kdQs79U2b1dKaYtXmZA8yZ8mXnBD3BrFRJRVmGnkDnJK6qfLWwBn45hlzcRv04SNbe8cI96gBIRWWmL6icecxjxTndXNVnH8aHU+x2z5m9Y1osOXTAaH7f00wTiE8NEcHNdxe0xUDN6e53kdf6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/6PuX8O; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/6PuX8O"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so14475245ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787981314; x=1788586114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nDR1cAc1qp81BSF1PrPq02zwDhN5A+sV31uJ637JL0=;
        b=q/6PuX8OX6dwm3PpiB/fBUhqMtRsLrFikr2pc2AI7eg3q/FmGpN53nZFMNIz0cl5VW
         sMyZvDAEI0bqeg3sagONaZ/OvnYbLF6xnWre+mgpGqX7Su9KDDEJwbG/AXiVd4WRSNDn
         YYleDqcm5MBloT/+8EOA/Ud9Flgm8ZU6yNvPy+cdp4def5LDj8S0/ZQK4L8da3H8hDDr
         jFebKQyCIGnEJiy8tkH7B5paG0lrnHUiXusYOt7K6thOHyBpuVYO0PSPmFIqBlzlXnb/
         B7EvNG5UxEY42K3ISmWtGxn+hYSdYwZaNOHczUuLWLcAX1QSWItInXD6lDxKUvlcgcz5
         P+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981314; x=1788586114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nDR1cAc1qp81BSF1PrPq02zwDhN5A+sV31uJ637JL0=;
        b=jUm4Ywy6S0EEcPecBOJO3IpsYwyGLDTFO94Ct2pogMPS5J7ujYDIUKtwsjaYhHDvfd
         GdtEjWgmfFzNOYDODhp3Q9yA4N4ZGmm05E9dlSlU4wmdzO+rbA+3nwycCMxW3VVUP/pa
         bVYw20VnuKeuw/QXE87Y6tcABQHXMAROeRi2A5tfjYBxbCLU5OqsgHxo6AOugD+k429/
         3dwvG0TeQ47JneOPDMeutdNwCmHOmgUTYMSoko2aymyhl7TNRVhaI3I727OtUzq0Xro1
         frn2TqJqLlPrSY6SWTou2R/3dc4v3DgezcbsrLiw5WC4itpzjMHmb8uK9GPFtDlE6LT4
         nb6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2QBuBTfLgwm1zMwzGVIVDq4Y6r0qBx3BpOQNpYMGEGSebzLU1yUwe34J1rdfmlSla7deHrp0WA7qXDIE=@vger.kernel.org
X-Gm-Message-State: AFuF++nLr32JCeHMc4OEhWJZ/0hzrqRnQR8ZrdIXSNLmAr9N2TWAkZCr
	yidBpdFhIO0x1X+wxjS79S4yXDMRF94yoSd6bbGBZbauKzVe+M8C5PqU
X-Gm-Gg: AYBFou3V9HhDyvDzzqltDvW5+P28PSJUKWUOcwqKpWgfL8EEmEDhbtKUrg2dSRZuNAk
	8jU3z/FjlcIEMCwguaO/0kyiSqwclbDTjfOR4EkSWzRn4Y8YkFhm0K6Fy+exHzplDxfveCHWRAg
	nD0TDBTYXoYl8//bNepuNXj7aGngIPpI1h9UMvreXW2zH1ijIA9fWNkZf+Ehi1vlKxF1tUysqra
	ZaqvxyJwLDzUFtdUTdXfhrYEKqbMnhndQZi56DvF0EYSq428HEsvDSSYthVGcci6uflwlOlt4MQ
	pp6gjAyO/Tk0vpPoFUu31qP5a1DdJUa7U+ubFM3QM4vVaE+4+FQuxBQxDYxgjRdcTdm4HNrlwai
	Ds8ZieszezW97jkxbkWs5I7FYJnWpMNJ5qVLzKS1miFbJu9pY1XrgBWyjQKi2jRhciAFqNkXZm7
	kQGyhpO1xBtUF3KL540lTKYgO0SkHJN17uZjlD/FJK/B6GUdVRWD2EeowDwx0pn3Q=
X-Received: by 2002:a17:90b:2783:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-3989beb6352mr6712139a91.20.1787981314230;
        Fri, 28 Aug 2026 22:28:34 -0700 (PDT)
Received: from Default ([2409:40f4:101c:2e82:3697:838b:5d1b:b1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm12043695eec.13.2026.08.28.22.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:28:33 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+3157015c6bd85395cddc@syzkaller.appspotmail.com
Cc: dwlsalmeida@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] WARNING in vidtv_stop_feed
Date: Sat, 29 Aug 2026 10:58:16 +0530
Message-ID: <20260829052816.23479-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a90f648.1d9ded08.62e62.00e2.GAE@google.com>
References: <6a90f648.1d9ded08.62e62.00e2.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28 2026, syzbot wrote:

>------------[ cut here ]------------
>DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>WARNING: kernel/locking/mutex.c:625 at __mutex_lock_common kernel/locking/mutex.c:625 [inline], CPU>3: syz.3.334/7114
>WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x944/0x1bc0 kernel/locking/mutex.c:821, CPU>3: syz.3.334/7114
>Modules linked in:
>CPU: 3 UID: 0 PID: 7114 Comm: syz.3.334 Tainted: G             L      syzkaller >0 PREEMPT(full) 
>Tainted: [L]=SOFTLOCKUP
>Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:625 [inline]
>RIP: 0010:__mutex_lock+0x94b/0x1bc0 kernel/locking/mutex.c:821
>Code: 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 b4 10 00 00 44 8b 05 b8 11 7a 05 45 85 c0 75 13 48 8d 3d 9c 16 7d 05 48 c7 c6 80 d3 ef 8b <67> 48 0f b9 3a 90 e9 1b f8 ff ff 4d 8d a7 f0 0a 00 00 4c 89 e7 e8
>RSP: 0000:ffffc90025f2fae0 EFLAGS: 00010246
>RAX: 0000000000000003 RBX: ffff888029f2d128 RCX: 1ffffffff22898cc
>RDX: 0000000000000000 RSI: ffffffff8befd380 RDI: ffffffff9147cb50
>RBP: ffffc90025f2fc50 R08: 0000000000000000 R09: 0000000000000000
>R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>R13: 0000000000000000 R14: dffffc0000000000 R15: 0000000000000000
>FS:  0000000000000000(0000) GS:ffff888096c84000(0063) knlGS:0000000057892480
>CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
>CR2: 00000000f544aff4 CR3: 00000000577a8000 CR4: 0000000000352ef0
>Call Trace:
> <TASK>
> vidtv_stop_feed+0x75/0x2a0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:256
> dmx_ts_feed_stop_filtering+0xe9/0x1d0 drivers/media/dvb-core/dvb_demux.c:780
> dvb_dmxdev_feed_stop.isra.0+0x162/0x270 drivers/media/dvb-core/dmxdev.c:494
> dvb_dmxdev_filter_stop+0x1d0/0x390 drivers/media/dvb-core/dmxdev.c:572
> dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:856 [inline]
> dvb_demux_release+0x92/0x560 drivers/media/dvb-core/dmxdev.c:1256
> __fput+0x3ff/0xb50 fs/file_table.c:512
> task_work_run+0x150/0x240 kernel/task_work.c:233
> resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
> __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
> exit_to_user_mode_loop+0x1d8/0x700 kernel/entry/common.c:101
> __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
> syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
> syscall_exit_to_user_mode include/linux/entry-common.h:336 [inline]
> __do_fast_syscall_32+0x59f/0x8b0 arch/x86/entry/syscall_32.c:294
> do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
> entry_SYSENTER_compat_after_hwframe+0x84/0x8e
>RIP: 0023:0xf6ffefec
>Code: Unable to access opcode bytes at 0xf6ffefc2.
>RSP: 002b:00000000ffb45dfc EFLAGS: 00000202 ORIG_RAX: 00000000000001b4
>RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000000000001e
>RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
>R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> </TASK>
>----------------
>Code disassembly (best guess):
>   0:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
>   4:	38 d0                	cmp    %dl,%al
>   6:	7c 08                	jl     0x10
>   8:	84 d2                	test   %dl,%dl
>   a:	0f 85 b4 10 00 00    	jne    0x10c4
>  10:	44 8b 05 b8 11 7a 05 	mov    0x57a11b8(%rip),%r8d        > 0x57a11cf
>  17:	45 85 c0             	test   %r8d,%r8d
>  1a:	75 13                	jne    0x2f
>  1c:	48 8d 3d 9c 16 7d 05 	lea    0x57d169c(%rip),%rdi        > 0x57d16bf
>  23:	48 c7 c6 80 d3 ef 8b 	mov    $0xffffffff8befd380,%rsi
>* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
>  2f:	90                   	nop
>  30:	e9 1b f8 ff ff       	jmp    0xfffff850
>  35:	4d 8d a7 f0 0a 00 00 	lea    0xaf0(%r15),%r12
>  3c:	4c 89 e7             	mov    %r12,%rdi
>  3f:	e8                   	.byte 0xe8

I believe this is a extension of this crash[1]. Would consider marking it as invalid
as it is a user-unreachable path said by Greg KH here[2]

[1]: https://lore.kernel.org/all/6a8c451c.dbb3a75c.7844.0004.GAE@google.com/T/
[2]: https://lore.kernel.org/all/2026082737-traitor-shorter-a4cc@gregkh/

Thanks,
Jeffin.
