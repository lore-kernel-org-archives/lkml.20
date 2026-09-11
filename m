Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32137D118
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157650; cv=pass; b=oG3qp00ikupDoFoLLzrWBVKahjf2er560AtiTKjNMveJ616dLCXn+/9ZrHM01H9cksiJarlJnnKm1gL3j6roi2hjeuIrSoapY25MMqRT+0ieJxJv3qvEFTVQPV5yK0Mx61FSlfbByuEr0Ryc0ULopS2x1zYS/NAz1VsOr737jDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157650; c=relaxed/simple;
	bh=fhebCn6/msxu92JDNxfb8pH+KGYDDQvvoKVZMgmAsqQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VEhccSDSuzNzoTryHZzFbsoJTcXFNlAIqPw0qVM6cFpwQoGBG7HygcpE1zE4KeT4hgbOs3Drs6inC6HeTAzIKPR4xzkOwflK75XYHENHkziNObpb0RUH+QAI4U3SBxKn+1FWFm3EJkKpRoNCKdnilSBWaQAN3YTiIHSWpwIoAZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=nBDZMW10; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="nBDZMW10"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so223308a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789157648; cv=none;
        d=google.com; s=arc-20260327;
        b=cF0uWkN7dp3jxNA0yawbgjkMRaXJFQ9jr7LK/qYiNTB1L07rcurWTjBup3nu+H+JWH
         6THujC88TKOHlLv3a8NNIDkZpF+5pBxNi4oxCfAnRviMY5TtGQmPjsUGes+ELIvDje/y
         7PR1jS4SNKqkP6lCqMRMcyYZfOzZcaAVqZxFe1mofawft6qoZfIQynnEMMdhpGg9RYyw
         gg4CPGsaXwC/w6cBBzvrAYL6TqS9s5dFKgqiQNDoFO+32l2gWRvMhp6o2NnQhy+1aD0y
         zv6w+LF7yhrx0Xa4MIvy96nN2tCRryqEf9CM1ggvqLAq0Rj2ElmtF3g+hDEa4ydXWhbR
         pvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wSdIJUer+N8ZqCUrXaXBAMjqM0wHRinQ473Hy1FtMNA=;
        fh=nP400w0fVWEsiMs0dSdyP0zpb5wUYaUcGH82GyPnL7I=;
        b=T+GzyEnKK7E4BADc5w+IQaaidX/eqc6zLDI/tbrYuXEjuuvaMaYfYcA2eeca2gcpbr
         3vYcT0OWy3PIWGkIz1D2pJCgDj1AXIKqpp2vHs/9qjy0/b5UJ4dpAr82a4kcg+RjK0vj
         9QgYWPAjdBqQtZJHtkmlVcCTHTmQnWWTcQd6UtFT9NeFOVYUuGTYHx5FQLTL5KS5w6q1
         yhBJresPaPt1/qnmqkNq/fQ8B35LIT7DGr6BC/VYAKJHuZLVs5HbxMtNr+rciP8YZJWM
         IzBSo40KaDVAlwIytpdSpAzyUQ3qQQgwGjKGasx5zuacJopLvhcRGAxyS33yCQGBbR6+
         c6bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789157648; x=1789762448; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSdIJUer+N8ZqCUrXaXBAMjqM0wHRinQ473Hy1FtMNA=;
        b=nBDZMW10OspHHQNFk157vCQm/enMBbYpZxGf605sJepyN/jXvwsYrGhGyPGm7glN+L
         51+15NIPtgxrvsDg65+glO/Njr3h2UKnAOBBnNHK5VGmEN5suIYDourJfxDVp1TayRzp
         nMebncSZRoazJVWlVIXg1Zt7O077gzb3XGC3VI5p3HahiJ0gYc2Y979/9xmhuLvt4J74
         yJdmcDAgi/8fb+3pvqsmnVd84gl31VBJOwmlv/r0wsSB9JryqzgI0Fp4JjWpwsq3z/Mt
         yfAoIVsxN4D9dADhBmvbzhVATf/rcMcpbmWScGl1WM0boYMoEexBYto9M1lQKHLlO1p7
         jyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157648; x=1789762448;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wSdIJUer+N8ZqCUrXaXBAMjqM0wHRinQ473Hy1FtMNA=;
        b=K/Jl0uGLRui3sfVdBv3A0NyVwhyWzOHSyjAP2f2N4pSOgVLTl3ezaFJn0YKjrLxCTu
         tyvZNZSfQFdCa4/jM2nEmcAEbKDKqk+sfwgXdfbo+/8t+3uIO6tCuqI3g5Fhudswd6Pd
         rlJZWTW31BDH6ybKcewZer4DWcro4uNUUzgvaYiHHgu0P5WEBHiO2O1HV3uSq9+eN/sl
         j4UpcKPSZ2zMuDQzPruWAsuJGxSMmiOiuXyqUJpvGGMRJu8iPHQoy7+UZSFHMTy28alF
         8P+v69uynukVvB/t2kNvegiA3sRHDxUEaYWUIhehxj/jFVD5mcLrRm4N+RCRf5pNms74
         0WmA==
X-Forwarded-Encrypted: i=1; AKwUvBwE628ECF7mVgs0FCaxHoVQtyO9Reyfk3b5aJ92Xnu0EoaDu7g32TI1k8WGtet0M8ClbuydXOfy/FiMx4A=@vger.kernel.org
X-Gm-Message-State: AFuF++khCH6HMLt87vwf23iki+XB3kry5YLg/fThr4icXjVayfdEQkjG
	VjVguxY1jVplPeUez/j6HdRVT6GyzqxHpEJbLsYgkEyqGIWaDM7JTooBjfJtlwAOHYZtr/16jxC
	71ew4kvN/tR+JN+WwRTZMd3v3Tbv1Wr4sZsa/Y5gy
X-Gm-Gg: AYBFou2OWWE3lSIWup6Aan+G1xioZXm2nhG4uCb//UIJLO6+4dNGndC8DKR+sumwBfj
	2plpnI+c/Dtb2INGmMP9B9EPJPxbFzf2+QqfjLc5ZivdQS8Ku9z88JQFrW1OesTGE64UCEjVeNS
	9UF+7mH32Bah1qV6JcEHq67/cO98ORFWTaJlABzt8jXmqLtpL/6Jg71ig4W6EB+xkSnF/Ywz4Sy
	qYNKVYyFFhoKkvbKd2fxhD0Jd6O7nGKNmYBg2sjP120guuUrH9r9guEASTkZTWje5tQ8kVsq3N0
	XrFS1XX5PnmrJzhskm8sErvmIVjMnxEAOF5sLzk/JqDA0M6xE6rDvlPFioV0PHC54H2/KoArO5v
	LIqs1Dr4nxbomzrZyPFUbhNutnK6utPkFfnPDMCuMRyr/EMHiLQ8mU5mW+O0xS+Ry6YAlVnXlTZ
	pLX9ZRm2/6bw==
X-Received: by 2002:a17:90b:3844:b0:398:e969:87ef with SMTP id
 98e67ed59e1d1-39d9c3f8c2dmr9326907a91.24.1789157646819; Fri, 11 Sep 2026
 13:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 13:13:55 -0700
X-Gm-Features: AcwNN1Vao5cnuQGYX9jcWh8-2l9gV1Z5fsxfBfuzrFuKXG3ZK9gEsXYK95FCk8k
Message-ID: <CA+0ovCgtHp-xadKFjptEwPQJECbks0oSv3TTOUn9q3uptKkcdg@mail.gmail.com>
Subject: [BUG] WARNING: refcount bug in em28xx_uninit_usb_xfer
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fd8421065b3ab910"

--000000000000fd8421065b3ab910
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   47.694214][ T9838] refcount_t: underflow; use-after-free.
[   47.694228][ T9838] WARNING: lib/refcount.c:28 at
refcount_warn_saturate+0xb2/0x110, CPU#1: repro/9838
[   47.698307][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.704251][ T9838] Modules linked in:
[   47.704265][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.706171][ T9838] CPU: 1 UID: 0 PID: 9838 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.707259][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.708241][ T9838] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.709292][ T9838] RIP: 0010:refcount_warn_saturate+0xb2/0x110
[   47.709877][ T9838] Code: 44 00 9b 0b 67 48 0f b9 3a eb 4a e8 a8 75
01 fd 48 8d 3d 41 00 9b 0b 67 48 0f b9 3a eb 37 e8 95 75 01 fd 48 8d
3d 3e 00 9b 0b <67> 48 0f b9 3a eb 24 e8 82 75 01 fd 48 8d 3d 3b 00 9b
0b 67 48 0f
[   47.711239][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.712631][ T9838] RSP: 0018:ffffc90006747878 EFLAGS: 00010293
[   47.713221][ T9838] RAX: ffffffff84c626eb RBX: 0000000000000003
RCX: ffff88802758a640
[   47.713978][ T9838] RDX: 0000000000000000 RSI: ffffffff8f347580
RDI: ffffffff90612730
[   47.714691][ T9838] RBP: 0000000000000002 R08: ffff88802758a640
R09: 0000000000000005
[   47.715400][ T9838] R10: 0000000000000004 R11: 0000000000000000
R12: ffff888109299e88
[   47.716228][ T9838] R13: ffff88802933d000 R14: ffff88802933d000
R15: 0000000000000008
[   47.716848][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.717851][ T9838] FS:  00007fdfcd7da6c0(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   47.718670][ T9838] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   47.719280][ T9838] CR2: 00007fdfcdfdafe0 CR3: 000000001f3b6000
CR4: 0000000000752ef0
[   47.721985][ T9838] PKRU: 55555554
[   47.722334][ T9838] Call Trace:
[   47.723521][ T9838]  <TASK>
[   47.723823][ T9838]  em28xx_uninit_usb_xfer+0x157/0x320
[   47.725229][ T9838]  em28xx_init_usb_xfer+0x454/0x4a0
[   47.725357][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.726698][ T9838]  em28xx_start_analog_streaming+0xf19/0x1960
[   47.727285][ T9838]  ? __pfx_em28xx_urb_data_copy+0x10/0x10
[   47.727840][ T9838]  ? __pfx_em28xx_start_analog_streaming+0x10/0x10
[   47.728457][ T9838]  ? __lock_acquire+0x74c/0x2db0
[   47.728939][ T9838]  ? __video_do_ioctl+0x473/0xca0
[   47.730362][ T9838]  ? __pfx___mutex_lock+0x10/0x10
[   47.730852][ T9838]  ? __pfx_em28xx_start_analog_streaming+0x10/0x10
[   47.731444][ T9838]  vb2_start_streaming+0x128/0x460
[   47.731920][ T9838]  vb2_core_streamon+0x2e0/0x4f0
[   47.732376][ T9838]  __video_do_ioctl+0xadb/0xca0
[   47.732855][ T9838]  ? __pfx___video_do_ioctl+0x10/0x10
[   47.733374][ T9838]  video_usercopy+0x876/0x1450
[   47.733843][ T9838]  ? __pfx___video_do_ioctl+0x10/0x10
[   47.734350][ T9838]  ? __pfx_video_usercopy+0x10/0x10
[   47.734831][ T9838]  ? __fget_files+0x2a/0x420
[   47.735260][ T9838]  ? __fget_files+0x2a/0x420
[   47.735806][ T9838]  ? __fget_files+0x3a0/0x420
[   47.736261][ T9838]  v4l2_ioctl+0x18d/0x1e0
[   47.736682][ T9838]  ? __pfx_v4l2_ioctl+0x10/0x10
[   47.737149][ T9838]  __se_sys_ioctl+0xfc/0x170
[   47.737597][ T9838]  do_syscall_64+0x155/0x510
[   47.738053][ T9838]  ? trace_irq_disable+0x3b/0x140
[   47.738523][ T9838]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.739079][ T9838]  ? clear_bhb_loop+0x30/0x80
[   47.739549][ T9838]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.740095][ T9838] RIP: 0033:0x42d07d
[   47.740463][ T9838] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   47.742283][ T9838] RSP: 002b:00007fdfcd7da0c0 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   47.743037][ T9838] RAX: ffffffffffffffda RBX: 00007fdfcd7da6c0
RCX: 000000000042d07d
[   47.743086][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.744673][ T9838] RDX: 00007fdfcd7da13c RSI: 0000000040045612
RDI: 0000000000000005
[   47.745423][ T9838] RBP: 00007fdfcd7da110 R08: 0000000000000000
R09: 0000000000000001
[   47.746234][ T9838] R10: 0000000000000008 R11: 0000000000000246
R12: 00007fdfcd7da6c0
[   47.746982][ T9838] R13: 00007ffc73885280 R14: 00007fdfcd7dace4
R15: 00007ffc73885377
[   47.747257][ T9837] em28xx 3-1:1.0: failed to clear USB bulk
endpoint stall/halt condition (error=-32)
[   47.748529][ T9838]  </TASK>
[   47.748851][ T9838] Kernel panic - not syncing: kernel: panic_on_warn set ...
[   47.749555][ T9838] CPU: 1 UID: 0 PID: 9838 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   47.750531][ T9838] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   47.751514][ T9838] Call Trace:
[   47.751841][ T9838]  <TASK>
[   47.752128][ T9838]  vpanic+0x56d/0xa60
[   47.752518][ T9838]  ? __pfx__printk+0x10/0x10
[   47.752968][ T9838]  ? __pfx_vpanic+0x10/0x10
[   47.753405][ T9838]  ? is_bpf_text_address+0x292/0x2b0
[   47.753927][ T9838]  ? is_bpf_text_address+0x26/0x2b0
[   47.754405][ T9838]  panic+0xc5/0xd0
[   47.754755][ T9838]  ? __pfx_panic+0x10/0x10
[   47.755169][ T9838]  __warn+0x315/0x4c0
[   47.755624][ T9838]  ? refcount_warn_saturate+0xb2/0x110
[   47.756151][ T9838]  ? refcount_warn_saturate+0xb2/0x110
[   47.756693][ T9838]  __report_bug+0x273/0x580
[   47.757147][ T9838]  ? refcount_warn_saturate+0xb2/0x110
[   47.757673][ T9838]  ? __pfx___report_bug+0x10/0x10
[   47.758165][ T9838]  report_bug_entry+0x19b/0x290
[   47.758613][ T9838]  ? refcount_warn_saturate+0xb2/0x110
[   47.759111][ T9838]  ? refcount_warn_saturate+0xb7/0x110
[   47.759621][ T9838]  handle_bug+0xce/0x200
[   47.760049][ T9838]  exc_invalid_op+0x1a/0x50
[   47.760488][ T9838]  asm_exc_invalid_op+0x1a/0x20
[   47.760957][ T9838] RIP: 0010:refcount_warn_saturate+0xb2/0x110
[   47.761537][ T9838] Code: 44 00 9b 0b 67 48 0f b9 3a eb 4a e8 a8 75
01 fd 48 8d 3d 41 00 9b 0b 67 48 0f b9 3a eb 37 e8 95 75 01 fd 48 8d
3d 3e 00 9b 0b <67> 48 0f b9 3a eb 24 e8 82 75 01 fd 48 8d 3d 3b 00 9b
0b 67 48 0f
[   47.763279][ T9838] RSP: 0018:ffffc90006747878 EFLAGS: 00010293
[   47.763830][ T9838] RAX: ffffffff84c626eb RBX: 0000000000000003
RCX: ffff88802758a640
[   47.764542][ T9838] RDX: 0000000000000000 RSI: ffffffff8f347580
RDI: ffffffff90612730
[   47.765302][ T9838] RBP: 0000000000000002 R08: ffff88802758a640
R09: 0000000000000005
[   47.766110][ T9838] R10: 0000000000000004 R11: 0000000000000000
R12: ffff888109299e88
[   47.766862][ T9838] R13: ffff88802933d000 R14: ffff88802933d000
R15: 0000000000000008
[   47.767572][ T9838]  ? refcount_warn_saturate+0xab/0x110
[   47.768111][ T9838]  ? refcount_warn_saturate+0xab/0x110
[   47.768636][ T9838]  em28xx_uninit_usb_xfer+0x157/0x320
[   47.769173][ T9838]  em28xx_init_usb_xfer+0x454/0x4a0
[   47.769677][ T9838]  em28xx_start_analog_streaming+0xf19/0x1960
[   47.770248][ T9838]  ? __pfx_em28xx_urb_data_copy+0x10/0x10
[   47.770772][ T9838]  ? __pfx_em28xx_start_analog_streaming+0x10/0x10
[   47.771364][ T9838]  ? __lock_acquire+0x74c/0x2db0
[   47.771820][ T9838]  ? __video_do_ioctl+0x473/0xca0
[   47.772278][ T9838]  ? __pfx___mutex_lock+0x10/0x10
[   47.772760][ T9838]  ? __pfx_em28xx_start_analog_streaming+0x10/0x10
[   47.773384][ T9838]  vb2_start_streaming+0x128/0x460
[   47.773880][ T9838]  vb2_core_streamon+0x2e0/0x4f0
[   47.774347][ T9838]  __video_do_ioctl+0xadb/0xca0
[   47.774797][ T9838]  ? __pfx___video_do_ioctl+0x10/0x10
[   47.775287][ T9838]  video_usercopy+0x876/0x1450
[   47.775822][ T9838]  ? __pfx___video_do_ioctl+0x10/0x10
[   47.776334][ T9838]  ? __pfx_video_usercopy+0x10/0x10
[   47.776838][ T9838]  ? __fget_files+0x2a/0x420
[   47.777284][ T9838]  ? __fget_files+0x2a/0x420
[   47.777731][ T9838]  ? __fget_files+0x3a0/0x420
[   47.778184][ T9838]  v4l2_ioctl+0x18d/0x1e0
[   47.778611][ T9838]  ? __pfx_v4l2_ioctl+0x10/0x10
[   47.779095][ T9838]  __se_sys_ioctl+0xfc/0x170
[   47.779559][ T9838]  do_syscall_64+0x155/0x510
[   47.780009][ T9838]  ? trace_irq_disable+0x3b/0x140
[   47.780495][ T9838]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.781076][ T9838]  ? clear_bhb_loop+0x30/0x80
[   47.781531][ T9838]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   47.782101][ T9838] RIP: 0033:0x42d07d
[   47.782459][ T9838] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   47.784211][ T9838] RSP: 002b:00007fdfcd7da0c0 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   47.785003][ T9838] RAX: ffffffffffffffda RBX: 00007fdfcd7da6c0
RCX: 000000000042d07d
[   47.785810][ T9838] RDX: 00007fdfcd7da13c RSI: 0000000040045612
RDI: 0000000000000005
[   47.786553][ T9838] RBP: 00007fdfcd7da110 R08: 0000000000000000
R09: 0000000000000001
[   47.787283][ T9838] R10: 0000000000000008 R11: 0000000000000246
R12: 00007fdfcd7da6c0
[   47.787991][ T9838] R13: 00007ffc73885280 R14: 00007fdfcd7dace4
R15: 00007ffc73885377
[   47.788725][ T9838]  </TASK>
[   47.789338][ T9838] Kernel Offset: disabled
[   47.789890][ T9838] Rebooting in 86400 seconds..

Regards,

--000000000000fd8421065b3ab910
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxe9bpe0>
X-Attachment-Id: f_mtxe9bpe0

LyoKICogMjc4LXdhcm5pbmctcmVmY291bnQtYnVnLWluLWVtMjh4eC11bmluaXQtdXNiLXhmZXIK
ICovCiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5jbHVkZSA8ZXJy
bm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxwdGhyZWFkLmg+CiNpbmNsdWRlIDxz
Y2hlZC5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8
c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5j
bHVkZSA8dW5pc3RkLmg+CgojaW5jbHVkZSA8bGludXgvdXNiL2NoOS5oPgojaW5jbHVkZSA8bGlu
dXgvdXNiL3Jhd19nYWRnZXQuaD4KI2luY2x1ZGUgPGxpbnV4L3ZpZGVvZGV2Mi5oPgoKI2RlZmlu
ZSBFUDBfTUFYX1BBQ0tFVAkJMTAyNAojZGVmaW5lIERFVklDRV9OT0RFX1BBVEhfTUFYCTY0CiNk
ZWZpbmUgUkFDRV9TRUNPTkRTCQk2MAoKc3RhdGljIGludCByYXdfZ2FkZ2V0X2ZkID0gLTE7Cgpz
dGF0aWMgc3RydWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciBkZXZpY2VfZGVzY3JpcHRvciA9IHsK
CS5iTGVuZ3RoICAgICAgICAgICAgPSBVU0JfRFRfREVWSUNFX1NJWkUsCgkuYkRlc2NyaXB0b3JU
eXBlICAgID0gVVNCX0RUX0RFVklDRSwKCS5iY2RVU0IgICAgICAgICAgICAgPSAweDAyMDAsCgku
YkRldmljZUNsYXNzICAgICAgID0gMHhmZiwKCS5iTWF4UGFja2V0U2l6ZTAgICAgPSA2NCwKCS5p
ZFZlbmRvciAgICAgICAgICAgPSAweGViMWEsCgkuaWRQcm9kdWN0ICAgICAgICAgID0gMHg4Mjg2
LAoJLmJjZERldmljZSAgICAgICAgICA9IDB4MDEwMCwKCS5iTnVtQ29uZmlndXJhdGlvbnMgPSAx
LAp9OwoKc3RhdGljIGNvbnN0IHVpbnQ4X3QgY29uZmlndXJhdGlvbl9kZXNjcmlwdG9yW10gPSB7
Cgk5LCBVU0JfRFRfQ09ORklHLCAyNSwgMCwgMSwgMSwgMCwgMHg4MCwgMHgzMiwKCTksIFVTQl9E
VF9JTlRFUkZBQ0UsIDAsIDAsIDEsIDB4ZmYsIDB4MDAsIDB4MDAsIDAsCgk3LCBVU0JfRFRfRU5E
UE9JTlQsIDB4ODIsIFVTQl9FTkRQT0lOVF9YRkVSX0JVTEssIDB4MDAsIDB4MDIsIDAsCn07Cgpz
dGF0aWMgdm9pZCBlcDBfdHJhbnNmZXIodW5zaWduZWQgbG9uZyBlcDBfcmVhZF9vcl93cml0ZV9p
b2N0bCwKCQkJIGNvbnN0IHZvaWQgKnBheWxvYWQsIHVpbnQzMl90IG5ieXRlcykKewoJdWludDhf
dCByYXdfaW9fYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyBFUDBfTUFYX1BB
Q0tFVF07CglzdHJ1Y3QgdXNiX3Jhd19lcF9pbyAqZXAwX2lvID0gKHZvaWQgKilyYXdfaW9fYnVm
ZmVyOwoKCWlmIChuYnl0ZXMgPiBFUDBfTUFYX1BBQ0tFVCkKCQluYnl0ZXMgPSBFUDBfTUFYX1BB
Q0tFVDsKCWVwMF9pby0+ZXAgPSAwOwoJZXAwX2lvLT5mbGFncyA9IDA7CgllcDBfaW8tPmxlbmd0
aCA9IG5ieXRlczsKCWlmIChwYXlsb2FkICYmIG5ieXRlcykKCQltZW1jcHkoZXAwX2lvLT5kYXRh
LCBwYXlsb2FkLCBuYnl0ZXMpOwoJaW9jdGwocmF3X2dhZGdldF9mZCwgZXAwX3JlYWRfb3Jfd3Jp
dGVfaW9jdGwsIGVwMF9pbyk7Cn0KCnN0YXRpYyB2b2lkIGFuc3dlcl9jb250cm9sX3JlcXVlc3Qo
Y29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqY3RybCkKewoJdWludDhfdCByZXBseVtFUDBf
TUFYX1BBQ0tFVF07Cgl1aW50MTZfdCB3TGVuZ3RoID0gY3RybC0+d0xlbmd0aDsKCWludCByZXBs
eV9sZW4gPSAwOwoKCW1lbXNldChyZXBseSwgMCwgc2l6ZW9mKHJlcGx5KSk7CgoJaWYgKChjdHJs
LT5iUmVxdWVzdFR5cGUgJiBVU0JfVFlQRV9NQVNLKSA9PSBVU0JfVFlQRV9TVEFOREFSRCkgewoJ
CWlmIChjdHJsLT5iUmVxdWVzdCA9PSBVU0JfUkVRX0dFVF9ERVNDUklQVE9SKSB7CgkJCXN3aXRj
aCAoY3RybC0+d1ZhbHVlID4+IDgpIHsKCQkJY2FzZSBVU0JfRFRfREVWSUNFOgoJCQkJcmVwbHlf
bGVuID0gc2l6ZW9mKGRldmljZV9kZXNjcmlwdG9yKTsKCQkJCW1lbWNweShyZXBseSwgJmRldmlj
ZV9kZXNjcmlwdG9yLCByZXBseV9sZW4pOwoJCQkJYnJlYWs7CgkJCWNhc2UgVVNCX0RUX0NPTkZJ
RzoKCQkJCXJlcGx5X2xlbiA9IHNpemVvZihjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3IpOwoJCQkJ
bWVtY3B5KHJlcGx5LCBjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3IsIHJlcGx5X2xlbik7CgkJCQli
cmVhazsKCQkJZGVmYXVsdDoKCQkJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExf
RVAwX1NUQUxMLCAwKTsKCQkJCXJldHVybjsKCQkJfQoJCX0gZWxzZSBpZiAoY3RybC0+YlJlcXVl
c3QgPT0gVVNCX1JFUV9TRVRfQ09ORklHVVJBVElPTikgewoJCQlpb2N0bChyYXdfZ2FkZ2V0X2Zk
LCBVU0JfUkFXX0lPQ1RMX0NPTkZJR1VSRSwgMCk7CgkJfQoKCX0gZWxzZSBpZiAoY3RybC0+YlJl
cXVlc3RUeXBlICYgVVNCX0RJUl9JTikgewoKCQlyZXBseV9sZW4gPSB3TGVuZ3RoID4gc2l6ZW9m
KHJlcGx5KSA/IChpbnQpc2l6ZW9mKHJlcGx5KSA6IHdMZW5ndGg7CgkJaWYgKChjdHJsLT53SW5k
ZXggJiAweGZmKSA9PSAweDBhICYmIHJlcGx5X2xlbiA+PSAxKQoJCQlyZXBseVswXSA9IDE0NTsK
CX0KCglpZiAoKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pICYmIHdMZW5ndGgpIHsK
CQlpZiAocmVwbHlfbGVuID4gd0xlbmd0aCkKCQkJcmVwbHlfbGVuID0gd0xlbmd0aDsKCQllcDBf
dHJhbnNmZXIoVVNCX1JBV19JT0NUTF9FUDBfV1JJVEUsIHJlcGx5LCByZXBseV9sZW4pOwoJfSBl
bHNlIHsKCQllcDBfdHJhbnNmZXIoVVNCX1JBV19JT0NUTF9FUDBfUkVBRCwgTlVMTCwgd0xlbmd0
aCk7Cgl9Cn0KCnN0YXRpYyB2b2lkICp1c2JfZ2FkZ2V0X2V2ZW50X2xvb3Aodm9pZCAqdW51c2Vk
KQp7Cgl1aW50OF90IHJhd19ldmVudF9idWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2V2ZW50
KSArIEVQMF9NQVhfUEFDS0VUXTsKCXN0cnVjdCB1c2JfcmF3X2V2ZW50ICpldmVudCA9ICh2b2lk
ICopcmF3X2V2ZW50X2J1ZmZlcjsKCglmb3IgKDs7KSB7CgkJZXZlbnQtPnR5cGUgPSAwOwoJCWV2
ZW50LT5sZW5ndGggPSBFUDBfTUFYX1BBQ0tFVDsKCQlpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwg
VVNCX1JBV19JT0NUTF9FVkVOVF9GRVRDSCwgZXZlbnQpIDwgMCkgewoJCQlpZiAoZXJybm8gIT0g
RUlOVFIpCgkJCQl1c2xlZXAoMTAwMCk7CgkJCWNvbnRpbnVlOwoJCX0KCQlpZiAoZXZlbnQtPnR5
cGUgPT0gVVNCX1JBV19FVkVOVF9DT05UUk9MKQoJCQlhbnN3ZXJfY29udHJvbF9yZXF1ZXN0KChz
dHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICopZXZlbnQtPmRhdGEpOwoJfQoJcmV0dXJuIE5VTEw7Cn0K
CnN0YXRpYyBpbnQgZmluZF9maXJzdF91ZGMoY2hhciAqdWRjX2RyaXZlcl9uYW1lLCBjaGFyICp1
ZGNfZGV2aWNlX25hbWUpCnsKCURJUiAqdWRjX2NsYXNzX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xh
c3MvdWRjIik7CglzdHJ1Y3QgZGlyZW50ICp1ZGNfZW50cnk7CgljaGFyICppbnN0YW5jZV9zdWZm
aXg7CgoJaWYgKCF1ZGNfY2xhc3NfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgodWRjX2VudHJ5
ID0gcmVhZGRpcih1ZGNfY2xhc3NfZGlyKSkpIHsKCQlpZiAodWRjX2VudHJ5LT5kX25hbWVbMF0g
PT0gJy4nKQoJCQljb250aW51ZTsKCgkJc25wcmludGYodWRjX2RldmljZV9uYW1lLCBVRENfTkFN
RV9MRU5HVEhfTUFYLCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7CgkJc25wcmludGYodWRjX2Ry
aXZlcl9uYW1lLCBVRENfTkFNRV9MRU5HVEhfTUFYLCAiJXMiLCB1ZGNfZW50cnktPmRfbmFtZSk7
CgkJaW5zdGFuY2Vfc3VmZml4ID0gc3RycmNocih1ZGNfZHJpdmVyX25hbWUsICcuJyk7CgkJaWYg
KGluc3RhbmNlX3N1ZmZpeCkKCQkJKmluc3RhbmNlX3N1ZmZpeCA9IDA7CgkJY2xvc2VkaXIodWRj
X2NsYXNzX2Rpcik7CgkJcmV0dXJuIDA7Cgl9CgljbG9zZWRpcih1ZGNfY2xhc3NfZGlyKTsKCXJl
dHVybiAtMTsKfQoKc3RhdGljIHZvaWQgdW5iaW5kX3ZpdmlkX3RvX2ZyZWVfdjRsMl9taW5vcnMo
dm9pZCkKewoJRElSICp2aXZpZF9kcml2ZXJfZGlyID0gb3BlbmRpcigiL3N5cy9idXMvcGxhdGZv
cm0vZHJpdmVycy92aXZpZCIpOwoJc3RydWN0IGRpcmVudCAqdml2aWRfaW5zdGFuY2U7CgoJaWYg
KCF2aXZpZF9kcml2ZXJfZGlyKQoJCXJldHVybjsKCXdoaWxlICgodml2aWRfaW5zdGFuY2UgPSBy
ZWFkZGlyKHZpdmlkX2RyaXZlcl9kaXIpKSkgewoJCWludCB1bmJpbmRfZmQ7CgoJCWlmIChzdHJu
Y21wKHZpdmlkX2luc3RhbmNlLT5kX25hbWUsICJ2aXZpZCIsIDUpKQoJCQljb250aW51ZTsKCQl1
bmJpbmRfZmQgPSBvcGVuKCIvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL3ZpdmlkL3VuYmluZCIs
IE9fV1JPTkxZKTsKCQlpZiAodW5iaW5kX2ZkIDwgMCkKCQkJYnJlYWs7CgkJd3JpdGUodW5iaW5k
X2ZkLCB2aXZpZF9pbnN0YW5jZS0+ZF9uYW1lLCBzdHJsZW4odml2aWRfaW5zdGFuY2UtPmRfbmFt
ZSkpOwoJCWNsb3NlKHVuYmluZF9mZCk7Cgl9CgljbG9zZWRpcih2aXZpZF9kcml2ZXJfZGlyKTsK
fQoKc3RhdGljIGludCBmaW5kX2VtMjh4eF9ub2RlcyhjaGFyICp2aWRlb19ub2RlX3BhdGgsIGNo
YXIgKnZiaV9ub2RlX3BhdGgpCnsKCURJUiAqdjRsX2NsYXNzX2RpciA9IG9wZW5kaXIoIi9zeXMv
Y2xhc3MvdmlkZW80bGludXgiKTsKCXN0cnVjdCBkaXJlbnQgKm5vZGVfZW50cnk7CglpbnQgbm9k
ZXNfZm91bmQgPSAwOwoKCWlmICghdjRsX2NsYXNzX2RpcikKCQlyZXR1cm4gMDsKCXZpZGVvX25v
ZGVfcGF0aFswXSA9IHZiaV9ub2RlX3BhdGhbMF0gPSAwOwoJd2hpbGUgKChub2RlX2VudHJ5ID0g
cmVhZGRpcih2NGxfY2xhc3NfZGlyKSkpIHsKCQljaGFyIGRyaXZlcl9saW5rX3BhdGhbMjU2XSwg
ZHJpdmVyX2xpbmtfdGFyZ2V0WzI1Nl07CgkJaW50IGxpbmtfbGVuOwoKCQlzbnByaW50Zihkcml2
ZXJfbGlua19wYXRoLCBzaXplb2YoZHJpdmVyX2xpbmtfcGF0aCksCgkJCSAiL3N5cy9jbGFzcy92
aWRlbzRsaW51eC8lcy9kZXZpY2UvZHJpdmVyIiwgbm9kZV9lbnRyeS0+ZF9uYW1lKTsKCQlsaW5r
X2xlbiA9IHJlYWRsaW5rKGRyaXZlcl9saW5rX3BhdGgsIGRyaXZlcl9saW5rX3RhcmdldCwKCQkJ
CSAgICBzaXplb2YoZHJpdmVyX2xpbmtfdGFyZ2V0KSAtIDEpOwoJCWlmIChsaW5rX2xlbiA8PSAw
KQoJCQljb250aW51ZTsKCQlkcml2ZXJfbGlua190YXJnZXRbbGlua19sZW5dID0gMDsKCQlpZiAo
IXN0cnN0cihkcml2ZXJfbGlua190YXJnZXQsICJlbTI4eHgiKSkKCQkJY29udGludWU7CgkJaWYg
KCFzdHJuY21wKG5vZGVfZW50cnktPmRfbmFtZSwgInZpZGVvIiwgNSkgJiYgIXZpZGVvX25vZGVf
cGF0aFswXSkgewoJCQlzbnByaW50Zih2aWRlb19ub2RlX3BhdGgsIERFVklDRV9OT0RFX1BBVEhf
TUFYLCAiL2Rldi8lcyIsCgkJCQkgbm9kZV9lbnRyeS0+ZF9uYW1lKTsKCQkJbm9kZXNfZm91bmQr
KzsKCQl9IGVsc2UgaWYgKCFzdHJuY21wKG5vZGVfZW50cnktPmRfbmFtZSwgInZiaSIsIDMpICYm
ICF2Ymlfbm9kZV9wYXRoWzBdKSB7CgkJCXNucHJpbnRmKHZiaV9ub2RlX3BhdGgsIERFVklDRV9O
T0RFX1BBVEhfTUFYLCAiL2Rldi8lcyIsCgkJCQkgbm9kZV9lbnRyeS0+ZF9uYW1lKTsKCQkJbm9k
ZXNfZm91bmQrKzsKCQl9Cgl9CgljbG9zZWRpcih2NGxfY2xhc3NfZGlyKTsKCXJldHVybiBub2Rl
c19mb3VuZDsKfQoKc3RhdGljIHZvaWQgcmVxdWVzdF9idWZmZXJzKGludCBub2RlX2ZkLCBpbnQg
YnVmZmVyX3R5cGUpCnsKCXN0cnVjdCB2NGwyX3JlcXVlc3RidWZmZXJzIHJlcXVlc3RfYnVmZmVy
c19hcmc7CgoJbWVtc2V0KCZyZXF1ZXN0X2J1ZmZlcnNfYXJnLCAwLCBzaXplb2YocmVxdWVzdF9i
dWZmZXJzX2FyZykpOwoJcmVxdWVzdF9idWZmZXJzX2FyZy5jb3VudCA9IDI7CglyZXF1ZXN0X2J1
ZmZlcnNfYXJnLnR5cGUgPSBidWZmZXJfdHlwZTsKCXJlcXVlc3RfYnVmZmVyc19hcmcubWVtb3J5
ID0gVjRMMl9NRU1PUllfTU1BUDsKCWlvY3RsKG5vZGVfZmQsIFZJRElPQ19SRVFCVUZTLCAmcmVx
dWVzdF9idWZmZXJzX2FyZyk7Cn0KCnN0cnVjdCBzdHJlYW1fcmFjZXIgewoJaW50IG5vZGVfZmQ7
CglpbnQgYnVmZmVyX3R5cGU7CglpbnQgY3B1X3RvX3Bpbl90bzsKfTsKCnN0YXRpYyB2b2lkICpz
dHJlYW1vbl9zdHJlYW1vZmZfbG9vcCh2b2lkICpyYWNlcl9hcmcpCnsKCXN0cnVjdCBzdHJlYW1f
cmFjZXIgKnJhY2VyID0gcmFjZXJfYXJnOwoJaW50IGJ1ZmZlcl90eXBlID0gcmFjZXItPmJ1ZmZl
cl90eXBlOwoJY3B1X3NldF90IGNwdV9tYXNrOwoKCUNQVV9aRVJPKCZjcHVfbWFzayk7CglDUFVf
U0VUKHJhY2VyLT5jcHVfdG9fcGluX3RvLCAmY3B1X21hc2spOwoJc2NoZWRfc2V0YWZmaW5pdHko
MCwgc2l6ZW9mKGNwdV9tYXNrKSwgJmNwdV9tYXNrKTsKCglmb3IgKDs7KSB7CgkJaW9jdGwocmFj
ZXItPm5vZGVfZmQsIFZJRElPQ19TVFJFQU1PTiwgJmJ1ZmZlcl90eXBlKTsKCQlpb2N0bChyYWNl
ci0+bm9kZV9mZCwgVklESU9DX1NUUkVBTU9GRiwgJmJ1ZmZlcl90eXBlKTsKCX0KCXJldHVybiBO
VUxMOwp9CgppbnQgbWFpbih2b2lkKQp7CglzdHJ1Y3QgdXNiX3Jhd19pbml0IHJhd19nYWRnZXRf
aW5pdDsKCWNoYXIgdWRjX2RyaXZlcl9uYW1lW1VEQ19OQU1FX0xFTkdUSF9NQVhdLCB1ZGNfZGV2
aWNlX25hbWVbVURDX05BTUVfTEVOR1RIX01BWF07CgljaGFyIHZpZGVvX25vZGVfcGF0aFtERVZJ
Q0VfTk9ERV9QQVRIX01BWF0sIHZiaV9ub2RlX3BhdGhbREVWSUNFX05PREVfUEFUSF9NQVhdOwoJ
c3RydWN0IHN0cmVhbV9yYWNlciB2aWRlb19yYWNlciwgdmJpX3JhY2VyOwoJcHRocmVhZF90IGdh
ZGdldF90aHJlYWQsIHZpZGVvX3JhY2VyX3RocmVhZCwgdmJpX3JhY2VyX3RocmVhZDsKCWludCB3
YWl0X3RlbnRoczsKCglzeXN0ZW0oInN5c3RlbWN0bCBzdG9wIHN5c3RlbWQtdWRldmQuc29ja2V0
IHN5c3RlbWQtdWRldmQta2VybmVsLnNvY2tldCAiCgkgICAgICAgInN5c3RlbWQtdWRldmQtY29u
dHJvbC5zb2NrZXQgc3lzdGVtZC11ZGV2ZC5zZXJ2aWNlIDI+L2Rldi9udWxsIik7CglzeXN0ZW0o
InBraWxsIC05IC1mIHVkZXZkIDI+L2Rldi9udWxsIik7CgoJdW5iaW5kX3ZpdmlkX3RvX2ZyZWVf
djRsMl9taW5vcnMoKTsKCglzeXN0ZW0oIm1vZHByb2JlIGR1bW15X2hjZCAyPi9kZXYvbnVsbCIp
OwoJc3lzdGVtKCJtb2Rwcm9iZSByYXdfZ2FkZ2V0IDI+L2Rldi9udWxsIik7CgoJaWYgKGZpbmRf
Zmlyc3RfdWRjKHVkY19kcml2ZXJfbmFtZSwgdWRjX2RldmljZV9uYW1lKSA8IDApIHsKCQlmcHJp
bnRmKHN0ZGVyciwgIm5vIFVEQyBpbiAvc3lzL2NsYXNzL3VkY1xuIik7CgkJcmV0dXJuIDE7Cgl9
CglyYXdfZ2FkZ2V0X2ZkID0gb3BlbigiL2Rldi9yYXctZ2FkZ2V0IiwgT19SRFdSKTsKCWlmIChy
YXdfZ2FkZ2V0X2ZkIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAib3BlbigvZGV2L3Jhdy1nYWRn
ZXQpOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCQlyZXR1cm4gMTsKCX0KCW1lbXNldCgmcmF3
X2dhZGdldF9pbml0LCAwLCBzaXplb2YocmF3X2dhZGdldF9pbml0KSk7CglzbnByaW50ZigoY2hh
ciAqKXJhd19nYWRnZXRfaW5pdC5kcml2ZXJfbmFtZSwKCQkgc2l6ZW9mKHJhd19nYWRnZXRfaW5p
dC5kcml2ZXJfbmFtZSksICIlcyIsIHVkY19kcml2ZXJfbmFtZSk7CglzbnByaW50ZigoY2hhciAq
KXJhd19nYWRnZXRfaW5pdC5kZXZpY2VfbmFtZSwKCQkgc2l6ZW9mKHJhd19nYWRnZXRfaW5pdC5k
ZXZpY2VfbmFtZSksICIlcyIsIHVkY19kZXZpY2VfbmFtZSk7CglyYXdfZ2FkZ2V0X2luaXQuc3Bl
ZWQgPSBVU0JfU1BFRURfSElHSDsKCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lP
Q1RMX0lOSVQsICZyYXdfZ2FkZ2V0X2luaXQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiVVNC
X1JBV19JT0NUTF9JTklUOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCQlyZXR1cm4gMTsKCX0K
CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9SVU4sIDApIDwgMCkgewoJ
CWZwcmludGYoc3RkZXJyLCAiVVNCX1JBV19JT0NUTF9SVU46ICVzXG4iLCBzdHJlcnJvcihlcnJu
bykpOwoJCXJldHVybiAxOwoJfQoJcHRocmVhZF9jcmVhdGUoJmdhZGdldF90aHJlYWQsIE5VTEws
IHVzYl9nYWRnZXRfZXZlbnRfbG9vcCwgTlVMTCk7CgoJZm9yICh3YWl0X3RlbnRocyA9IDA7IHdh
aXRfdGVudGhzIDwgMjAwOyB3YWl0X3RlbnRocysrKSB7CgkJaWYgKGZpbmRfZW0yOHh4X25vZGVz
KHZpZGVvX25vZGVfcGF0aCwgdmJpX25vZGVfcGF0aCkgPT0gMikKCQkJYnJlYWs7CgkJdXNsZWVw
KDEwMDAwMCk7Cgl9CglpZiAod2FpdF90ZW50aHMgPT0gMjAwKSB7CgkJZnByaW50ZihzdGRlcnIs
ICJlbTI4eHggdmlkZW8rdmJpIG5vZGVzIGRpZCBub3QgYm90aCBhcHBlYXJcbiIpOwoJCXJldHVy
biAxOwoJfQoKCXZpZGVvX3JhY2VyLm5vZGVfZmQgPSBvcGVuKHZpZGVvX25vZGVfcGF0aCwgT19S
RFdSKTsKCXZiaV9yYWNlci5ub2RlX2ZkID0gb3Blbih2Ymlfbm9kZV9wYXRoLCBPX1JEV1IpOwoJ
aWYgKHZpZGVvX3JhY2VyLm5vZGVfZmQgPCAwIHx8IHZiaV9yYWNlci5ub2RlX2ZkIDwgMCkKCQly
ZXR1cm4gMTsKCXZpZGVvX3JhY2VyLmJ1ZmZlcl90eXBlID0gVjRMMl9CVUZfVFlQRV9WSURFT19D
QVBUVVJFOwoJdmJpX3JhY2VyLmJ1ZmZlcl90eXBlID0gVjRMMl9CVUZfVFlQRV9WQklfQ0FQVFVS
RTsKCXZpZGVvX3JhY2VyLmNwdV90b19waW5fdG8gPSAwOwoJdmJpX3JhY2VyLmNwdV90b19waW5f
dG8gPSAxOwoJcmVxdWVzdF9idWZmZXJzKHZpZGVvX3JhY2VyLm5vZGVfZmQsIHZpZGVvX3JhY2Vy
LmJ1ZmZlcl90eXBlKTsKCXJlcXVlc3RfYnVmZmVycyh2YmlfcmFjZXIubm9kZV9mZCwgdmJpX3Jh
Y2VyLmJ1ZmZlcl90eXBlKTsKCglwdGhyZWFkX2NyZWF0ZSgmdmlkZW9fcmFjZXJfdGhyZWFkLCBO
VUxMLCBzdHJlYW1vbl9zdHJlYW1vZmZfbG9vcCwgJnZpZGVvX3JhY2VyKTsKCXB0aHJlYWRfY3Jl
YXRlKCZ2YmlfcmFjZXJfdGhyZWFkLCBOVUxMLCBzdHJlYW1vbl9zdHJlYW1vZmZfbG9vcCwgJnZi
aV9yYWNlcik7CgoJc2xlZXAoUkFDRV9TRUNPTkRTKTsKCXJldHVybiAwOwp9Cg==
--000000000000fd8421065b3ab910--
