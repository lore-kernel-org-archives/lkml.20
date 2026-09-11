Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA0490BE8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141900; cv=pass; b=lUW58LuCYYpzgY1RSZZLzc5/1TvpSnGPweGYSdXzJiJ8pdOeA1x/eqF7efumoaSQh+kvGDiHaw/htNqq57or7cmCkbahmKAFKi+7EqzR7TvYALRZvK/P8EcXmxgjg8aQi9wEQqYCyEFfwuxC/7R7yuMHlqbLsR2GQfePOJZbkvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141900; c=relaxed/simple;
	bh=lnoFnSUg4XhHgwIwRRh0evPZGEBDZe40rq46R9uUe7Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mzZUaf0URmWROxqazEt9tnoMcDScaoTDb2nBfovpabtzdcaU3yM/jENcQIFX8lGuO1fnGQJPuJrhDe1I+qxk9Edt1OW1nSEzyAsPZMOOHwmNGlKSbthL8YOvY87yqiaWXTcmAFouD07PiaPrYipUtVdT3Cn5vIP0cmtqdfcaFQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=eM3gfYog; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="eM3gfYog"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1290403a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141898; cv=none;
        d=google.com; s=arc-20260327;
        b=Yp4+GYZW6ecuFdNiaufSbqwCwMzRamLKdoDm9yPBmhKPtTieKlG3FEJKtzLH88MI7T
         kysJ44X0DDbdwfDNgmTNzGHnFF+7zO50xDkwUUlUyTg9c5gKykBVMolzmT/mmiJ/dO1g
         FlYnkHcheNnnI9rG8IT2aTkGWwzkdtC8yO1RuIaY4LoWghy/nfovenO6bch+SSyQZ+uX
         GHYlF1msKfu/bGLOmlT8ljqgmoVNNrz/CBbHlUDtgz5bchjxDH+rqd2uRW1xMuCopKy5
         xHNm/2DZwF1OZYHYVS4QsPDnm6xUH2eEQ8l5U14/07434MwVWNMIn2odH2prIfZ3eYO6
         ieuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zbSeo6CIdzS1t5Q3OPCYj0CPSvDQpaUOQ1GJQh/BXe0=;
        fh=cQJSW+5+dCMHSm/lfKfd2hY0iflFn0mfbtkyQ+HJKjY=;
        b=e9Hqfzsn8DbMxbNS6v5y/cSRTflb+/aU/KHYWOkp6+CFxaqz27uJyzqEQ3PMTSWF0a
         T4T9z5ryD3REiMi8BkzzKiL//Heo6aX/3UzFX0whoZZ3wsp5sRNRhZojxszfeC6JnJIO
         KJdvwMH2yUlxRwWfE7/SP6dHpi14NXoc5bjmPAodg66V2qAd43lQHcDE2QcDtshYgMM2
         PmZ25dlkcJb6reKUxHUuO8YG9DgJJEnWVfNE3uwigs+4jk6qp7ovw6jthl/3fmE/o74Y
         pUUNrX1LpOPYiwnrq0dIK1Z3cuagLHcdL91imkBKSZvP+wrNbfsEGNF4uXVictKVEsSG
         zW9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789141898; x=1789746698; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zbSeo6CIdzS1t5Q3OPCYj0CPSvDQpaUOQ1GJQh/BXe0=;
        b=eM3gfYogaC5KH5WTWilSroTvFYZsMPj7H5GRtaAzNU+XjVB5f55Wkv58HrZRU2IGE+
         Vu5blc+q73gg0usnlzlfmUNoxKhrUwcPc+iYXv7Du24s3DEwX6Er45asy+w/H8z+KSbr
         4p+jFxq/ImLT/5Ox8xh7MCNUtLNTruWjszx2XLiRy0JHvGiifG5oCEGve7KLiCyvT5XJ
         Em8lt8JfiML5qIHKPSF4FHqUMdyHgOf0Crf6TdGlJ/ZmmgxdKzTf0CK1T4Rmv/ktiw0R
         3wj6Pktc6CehYfGJLm4TIgdb8ZlevthS/VI3nW0ps94eNhQHFMhhSytdde1PZTh6E5js
         zl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141898; x=1789746698;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbSeo6CIdzS1t5Q3OPCYj0CPSvDQpaUOQ1GJQh/BXe0=;
        b=Vztq0MLuEPQAyIRhSr28U3tOgm8piqvYhy/lBDukYcSU1e5fGpChX31sWpzWS/ZxzV
         OZZghahMSc/0dVg4YgeiaJRUDzI+u+Tet1rMH7QAjfrmyn6B+ocDGlCFx1ADPbZo2Jqh
         nph7J2FNGWDk/2NAPCdUkE8kK+/nxdD2Bncc+QM7ul2nQxqNxyM9dPCaj+ogNF05v6u5
         xPt8Xii3velToEX8TLTFQWgejnhluxLWWF7R9rEJfZo0VPS3UOoUu1PiVWrGy0AlgA7Z
         bLJWZVDS+YO1Jfjq8f1SXIoQp/vYOwqBbq+GIZA7pgEQJnPOBJzWfkKysZPY3nQsjTvf
         H6ng==
X-Forwarded-Encrypted: i=1; AKwUvBzT6LjAu5l/8K/QKcdNXhMOVvQujbEqSthvxCT9ayl8Zx4VCoYDiuCaz7wpmbXzOCPYOsb9wYAZimKOs2M=@vger.kernel.org
X-Gm-Message-State: AFuF++kKn4J2cAwQSmQrXo+WhtviImWeJtyw9NCG8umPlBJ+0GzBDZ7A
	8UgMWrYhNL6Ci7BzTTMfMmZG+V5x3g1SlFOI/hufVgOFox9e9+8TnIJVJgvKiCYVrU5TgsJYSgi
	YO2imTe1lArzve1RC8oNFDQk9XeyeFv6m6ioHlWUO
X-Gm-Gg: AYBFou0R0FpxlYziSQRJ+b2/F2dYJxlakPNVDpOSXOrrxO9F9OOD07V+pEZVJDQ4Z94
	Rapa1ylSAdPdY82yLJTi93OxWt7hIOf5jELHPL2Ju8BtjNTpUcm3/LYZsc9Q2fS7o8UNBQwqOkQ
	pOJODbA0soI1Hi+8uncsqaDV6lLjly4HXdzA0iouitEOiJdscQ7V6EaCrlkru7DGTv/e9/g0Lzd
	z4pEQtd5s+Br0om/j4CCqLXOPcmutwN2od5gFpO6CztrM+qEZI/a2+PVoPOgFk5MGHCq1SLBD96
	fpS86CYUnkOLy9Rrh6VZTu5JKAp+Flo5m6jvBraKRP6bRqLO04lPPcXIhYH2SXB7ZkACn3/WQzc
	3hGxKCeBBnaZf3en3PYMRK8uY0ta8dIyCcbvbvwvh25Zmg1oHYoHofmLwRQkVla5HKQz2ELjeV6
	0=
X-Received: by 2002:a05:6a21:6803:b0:3c4:2cd3:f0bb with SMTP id
 adf61e73a8af0-3dad272064amr11450396637.10.1789141896604; Fri, 11 Sep 2026
 08:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:51:25 -0700
X-Gm-Features: AcwNN1WQCI8_33oS5pPimYF054_tctSGmM79AD1885EJXsgw10bbv5_XNqOt5vU
Message-ID: <CA+0ovChM9=2RkQngMbBhyqiHn-f6bECUvocDvzbZm8AohRiVYg@mail.gmail.com>
Subject: [BUG] WARNING in thaw_super_locked
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000033d95b065b370f39"

--00000000000033d95b065b370f39
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   50.331769][ T9500] sb->s_writers.freeze_kcount == 0
[   50.331782][ T9500] WARNING: fs/super.c:2172 at
thaw_super_locked+0x437/0x960, CPU#1: repro/9500
[   50.337664][ T9500] Modules linked in:
[   50.338411][ T9500] CPU: 1 UID: 0 PID: 9500 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   50.340359][ T9500] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   50.342404][ T9500] RIP: 0010:thaw_super_locked+0x437/0x960
[   50.342962][ T9500] Code: ff 90 0f 0b 90 41 bf ea ff ff ff e9 7f 02
00 00 e8 be 5c 7b ff 90 0f 0b 90 41 bf ea ff ff ff e9 6b 02 00 00 e8
aa 5c 7b ff 90 <0f> 0b 90 41 bf ea ff ff ff e9 57 02 00 00 e8 96 5c 7b
ff 90 0f 0b
[   50.344752][ T9500] RSP: 0018:ffffc90008eafa68 EFLAGS: 00010293
[   50.345341][ T9500] RAX: ffffffff824c3fd6 RBX: ffff88810a876000
RCX: ffff88802a25cc80
[   50.346063][ T9500] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   50.346777][ T9500] RBP: ffff88810a876378 R08: ffff88810a87608f
R09: 1ffff1102150ec11
[   50.347500][ T9500] R10: dffffc0000000000 R11: ffffed102150ec12
R12: 0000000000000001
[   50.348223][ T9500] R13: 0000000000000000 R14: ffff88810a87637c
R15: 0000000000000001
[   50.348941][ T9500] FS:  00000000028c2400(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   50.349778][ T9500] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   50.350384][ T9500] CR2: 000055c32878aae0 CR3: 000000010adda000
CR4: 0000000000752ef0
[   50.351219][ T9500] PKRU: 55555554
[   50.351570][ T9500] Call Trace:
[   50.351913][ T9500]  <TASK>
[   50.352195][ T9500]  filesystems_thaw_callback+0x1b8/0x2f0
[   50.352713][ T9500]  __iterate_supers+0x2ce/0x420
[   50.353193][ T9500]  ? __pfx_filesystems_thaw_callback+0x10/0x10
[   50.353784][ T9500]  ? __pfx___iterate_supers+0x10/0x10
[   50.354334][ T9500]  ? schedule+0x16e/0x2b0
[   50.354806][ T9500]  pm_suspend+0x58c/0x760
[   50.355245][ T9500]  state_store+0x206/0x290
[   50.355693][ T9500]  ? __pfx_sysfs_kf_write+0x10/0x10
[   50.356209][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   50.356698][ T9500]  vfs_write+0x61d/0xb90
[   50.357098][ T9500]  ? __pfx_vfs_write+0x10/0x10
[   50.357544][ T9500]  ? do_sys_openat2+0x14e/0x200
[   50.357997][ T9500]  ? kmem_cache_free+0x182/0x650
[   50.358460][ T9500]  ksys_write+0x150/0x270
[   50.358866][ T9500]  ? __pfx_ksys_write+0x10/0x10
[   50.359604][ T9500]  do_syscall_64+0x155/0x510
[   50.360070][ T9500]  ? trace_irq_disable+0x3b/0x140
[   50.360560][ T9500]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   50.361196][ T9500]  ? clear_bhb_loop+0x30/0x80
[   50.361655][ T9500]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   50.362218][ T9500] RIP: 0033:0x42e806
[   50.362588][ T9500] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   50.364338][ T9500] RSP: 002b:00007ffec5fbaa00 EFLAGS: 00000202
ORIG_RAX: 0000000000000001
[   50.365096][ T9500] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000042e806
[   50.365817][ T9500] RDX: 0000000000000003 RSI: 00000000004880f9
RDI: 0000000000000004
[   50.366529][ T9500] RBP: 00007ffec5fbaa10 R08: 0000000000000000
R09: 0000000000000000
[   50.367283][ T9500] R10: 0000000000000000 R11: 0000000000000202
R12: 00007ffec5fbaba8
[   50.368042][ T9500] R13: 00007ffec5fbabb8 R14: 0000000000000002
R15: 00000000004af120
[   50.368775][ T9500]  </TASK>
[   50.369071][ T9500] Kernel panic - not syncing: kernel: panic_on_warn set ...
[   50.369727][ T9500] CPU: 1 UID: 0 PID: 9500 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   50.370770][ T9500] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   50.371772][ T9500] Call Trace:
[   50.372100][ T9500]  <TASK>
[   50.372373][ T9500]  vpanic+0x56d/0xa60
[   50.372745][ T9500]  ? __pfx__printk+0x10/0x10
[   50.373177][ T9500]  ? __pfx_vpanic+0x10/0x10
[   50.373593][ T9500]  ? is_bpf_text_address+0x292/0x2b0
[   50.374086][ T9500]  ? is_bpf_text_address+0x26/0x2b0
[   50.374586][ T9500]  panic+0xc5/0xd0
[   50.374938][ T9500]  ? __pfx_panic+0x10/0x10
[   50.375357][ T9500]  __warn+0x315/0x4c0
[   50.375725][ T9500]  ? thaw_super_locked+0x437/0x960
[   50.376198][ T9500]  ? thaw_super_locked+0x437/0x960
[   50.376687][ T9500]  __report_bug+0x273/0x580
[   50.377135][ T9500]  ? thaw_super_locked+0x437/0x960
[   50.377628][ T9500]  ? __pfx___report_bug+0x10/0x10
[   50.378137][ T9500]  ? thaw_super_locked+0x437/0x960
[   50.378604][ T9500]  report_bug+0x16b/0x220
[   50.379010][ T9500]  ? thaw_super_locked+0x437/0x960
[   50.379479][ T9500]  ? thaw_super_locked+0x439/0x960
[   50.379951][ T9500]  handle_bug+0x9c/0x200
[   50.380350][ T9500]  exc_invalid_op+0x1a/0x50
[   50.380870][ T9500]  asm_exc_invalid_op+0x1a/0x20
[   50.381338][ T9500] RIP: 0010:thaw_super_locked+0x437/0x960
[   50.381890][ T9500] Code: ff 90 0f 0b 90 41 bf ea ff ff ff e9 7f 02
00 00 e8 be 5c 7b ff 90 0f 0b 90 41 bf ea ff ff ff e9 6b 02 00 00 e8
aa 5c 7b ff 90 <0f> 0b 90 41 bf ea ff ff ff e9 57 02 00 00 e8 96 5c 7b
ff 90 0f 0b
[   50.383638][ T9500] RSP: 0018:ffffc90008eafa68 EFLAGS: 00010293
[   50.384194][ T9500] RAX: ffffffff824c3fd6 RBX: ffff88810a876000
RCX: ffff88802a25cc80
[   50.384929][ T9500] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   50.385692][ T9500] RBP: ffff88810a876378 R08: ffff88810a87608f
R09: 1ffff1102150ec11
[   50.386447][ T9500] R10: dffffc0000000000 R11: ffffed102150ec12
R12: 0000000000000001
[   50.387164][ T9500] R13: 0000000000000000 R14: ffff88810a87637c
R15: 0000000000000001
[   50.387916][ T9500]  ? thaw_super_locked+0x436/0x960
[   50.388413][ T9500]  ? thaw_super_locked+0x436/0x960
[   50.388920][ T9500]  filesystems_thaw_callback+0x1b8/0x2f0
[   50.389463][ T9500]  __iterate_supers+0x2ce/0x420
[   50.389916][ T9500]  ? __pfx_filesystems_thaw_callback+0x10/0x10
[   50.390474][ T9500]  ? __pfx___iterate_supers+0x10/0x10
[   50.391077][ T9500]  ? schedule+0x16e/0x2b0
[   50.391503][ T9500]  pm_suspend+0x58c/0x760
[   50.391933][ T9500]  state_store+0x206/0x290
[   50.392346][ T9500]  ? __pfx_sysfs_kf_write+0x10/0x10
[   50.393100][ T9500]  kernfs_fop_write_iter+0x3af/0x540
[   50.393612][ T9500]  vfs_write+0x61d/0xb90
[   50.394039][ T9500]  ? __pfx_vfs_write+0x10/0x10
[   50.394494][ T9500]  ? do_sys_openat2+0x14e/0x200
[   50.394946][ T9500]  ? kmem_cache_free+0x182/0x650
[   50.395406][ T9500]  ksys_write+0x150/0x270
[   50.395808][ T9500]  ? __pfx_ksys_write+0x10/0x10
[   50.396264][ T9500]  do_syscall_64+0x155/0x510
[   50.396691][ T9500]  ? trace_irq_disable+0x3b/0x140
[   50.397157][ T9500]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   50.397706][ T9500]  ? clear_bhb_loop+0x30/0x80
[   50.398141][ T9500]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   50.398702][ T9500] RIP: 0033:0x42e806
[   50.399085][ T9500] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   50.400946][ T9500] RSP: 002b:00007ffec5fbaa00 EFLAGS: 00000202
ORIG_RAX: 0000000000000001
[   50.401732][ T9500] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000042e806
[   50.402465][ T9500] RDX: 0000000000000003 RSI: 00000000004880f9
RDI: 0000000000000004
[   50.403178][ T9500] RBP: 00007ffec5fbaa10 R08: 0000000000000000
R09: 0000000000000000
[   50.403894][ T9500] R10: 0000000000000000 R11: 0000000000000202
R12: 00007ffec5fbaba8
[   50.404618][ T9500] R13: 00007ffec5fbabb8 R14: 0000000000000002
R15: 00000000004af120
[   50.405337][ T9500]  </TASK>
[   50.405933][ T9500] Kernel Offset: disabled
[   50.406477][ T9500] Rebooting in 86400 seconds..

Regards,

--00000000000033d95b065b370f39
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx4uqx20>
X-Attachment-Id: f_mtx4uqx20

LyoKICogMjQ1LXdhcm5pbmctaW4tdGhhdy1zdXBlci1sb2NrZWQKICovCiNkZWZpbmUgX0dOVV9T
T1VSQ0UKI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0
cmluZy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCiNpZm5k
ZWYgRklGUkVFWkUKI2RlZmluZSBGSUZSRUVaRSAweEMwMDQ1ODc3CiNlbmRpZgoKc3RhdGljIHZv
aWQgd3JpdGVfcG93ZXJfYXR0cmlidXRlKGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnZh
bHVlKQp7CglpbnQgYXR0cmlidXRlX2ZkID0gb3BlbihwYXRoLCBPX1dST05MWSk7CgoJaWYgKGF0
dHJpYnV0ZV9mZCA8IDApCgkJZXhpdCgxKTsKCWlmICh3cml0ZShhdHRyaWJ1dGVfZmQsIHZhbHVl
LCBzdHJsZW4odmFsdWUpKSA8IDApCgkJZXhpdCgxKTsKCWNsb3NlKGF0dHJpYnV0ZV9mZCk7Cn0K
CmludCBtYWluKHZvaWQpCnsKCWludCB2aWN0aW1fbW91bnRfZmQ7CgoJaWYgKHN5c3RlbSgiZGQg
aWY9L2Rldi96ZXJvIG9mPS92YXIvdG1wL3ZpY3RpbS5pbWcgYnM9MU0gY291bnQ9NjQgc3RhdHVz
PW5vbmUgJiYgIgoJCSAgICJta2ZzLmV4dDQgLXEgLUYgLU8gXmhhc19qb3VybmFsIC92YXIvdG1w
L3ZpY3RpbS5pbWcgJiYgIgoJCSAgICJta2RpciAtcCAvbW50L3ZpY3RpbSAmJiAiCgkJICAgIm1v
dW50IC1vIGxvb3AgL3Zhci90bXAvdmljdGltLmltZyAvbW50L3ZpY3RpbSIpICE9IDApCgkJcmV0
dXJuIDE7CgoJdmljdGltX21vdW50X2ZkID0gb3BlbigiL21udC92aWN0aW0iLCBPX1JET05MWSB8
IE9fRElSRUNUT1JZKTsKCWlmICh2aWN0aW1fbW91bnRfZmQgPCAwKQoJCXJldHVybiAxOwoKCWlm
IChpb2N0bCh2aWN0aW1fbW91bnRfZmQsIEZJRlJFRVpFLCAwKSA8IDApCgkJcmV0dXJuIDE7CgoJ
d3JpdGVfcG93ZXJfYXR0cmlidXRlKCIvc3lzL3Bvd2VyL3BtX3Rlc3QiLCAiZnJlZXplciIpOwoK
CXdyaXRlX3Bvd2VyX2F0dHJpYnV0ZSgiL3N5cy9wb3dlci9zdGF0ZSIsICJtZW0iKTsKCXJldHVy
biAwOwp9Cg==
--00000000000033d95b065b370f39--
