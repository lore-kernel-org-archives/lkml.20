Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839CE4BE459
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150643; cv=pass; b=T8osIWRr7qBDC2C9AAS5wXRfjyqTx9PJNXrNzFQHN4npkgPtRIuvexZqgmU+bwEScPI9bEjop7KC2BbwjsiwOsYiFODwX0kmjPEUQI5oKly1Zn03GpnjvnqOw2zKADUsMKS9o5eXNkz/3sZNmJ2yCM/TmkWgFzR8WrNvWsMrXiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150643; c=relaxed/simple;
	bh=mVXUcg7C0Xk1HOSa688IK/9Fp1xj/2Z05EBjPh4yjiU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WvbT2eJHpbBbtIczTi8WvU6A4s7pz3jBlyPHXoW52G8YdCiBofHHG2IayglAoZ1P/R7h+HakHyAfkUPLx9sH1UkXu6TURMiGcgLw73RPY0cFlXE+ybo0SXIz0r5g+o0wEAEZDJ68VnoTX2ZUux6f3XXaQa+G0sl3H16r/hTtMHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=kqk94nZO; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="kqk94nZO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86a46577018so1743887b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150635; cv=none;
        d=google.com; s=arc-20260327;
        b=MbcHUJOYEHWJxYl5ZWfeXyY/LDKIE5kikIb9Ak4eU68Y5BCNLYHPdks/OngXvfoSTC
         mb0hSA8IxCXoqpv/QZgl3oxPv0xnQL2M5PqF9+S+gxxNo4XDpjzFO7bgt1dFefWn/U5X
         +rSbjhVT9OygNA9OXq49Bleu2gkpGLZom2GQ4rLYGgV+rOBckW8zatAkRXfaLk473l5l
         Uc2vY3ZzergSqtdAC5G6VpVtI0Eb/XCjbmFbEURdMhe6iv0Fl3BfTUMB/g+BIfkKNnl0
         d2jkbvy31+occ+gNhLoRoXxY2mmMM+GitMu1rBCueMhA5c2oYGJ5gThUzW27tlXA2YuZ
         +hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yfcWeY5ru5f5Abx5JmRki0yzQVeUxZvAjTkZevgHXNo=;
        fh=h5CkzSosCQoRGoiRHZgVkTlodf7s56igIJEMINS8Ncw=;
        b=o90JogbIDW723+6I53UREUWuzZDY3FwbDTUk40yFPl4ZzscjSdOQFTXcXvt+vlzG/A
         wdulA5k5W9YSEVNRGak7+dBIEO/OA6BzAd944pXF+Gc7s9KzxJP9Yne8L6kTstbQ1wCV
         3+WU7JIWOWGSYa/I5piC5jCfku5W0sqZz35MZ90Wn3+1KTDsgAI2MjvEy7U6s56UVlUF
         M7Uym8P1SFxZB2eOfma8WLCsaZjDrtBYAeoedtKTxCF/ublp0w+JhpCeTajI4eb4OEyg
         CAkRGxDuVwEsld0U1QX32dAck2PoByUqIUOmhrdSTlWvxUW7VWunDNTD8UrrlYtiwGTc
         UWkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789150635; x=1789755435; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfcWeY5ru5f5Abx5JmRki0yzQVeUxZvAjTkZevgHXNo=;
        b=kqk94nZOAJcqOaq+ENpjOY1SIrwndcsulCQeSX0w8VZVq9oBfHJN7cStxc29/pFgQa
         1PoY0NXgybpADYGjopxfy9CA/9wyLyyw0d2TsBPq+Hj40fcBU6WhwWudAiAefMMsrNWA
         skf8dbGP2eWx/XvjZnCRo68Z2k57P2v0awCddF9h5gZ89M3FBrEyWhgEpGkdgn1r/S7C
         Xxd2ASqGWnYHCbAa9Cu4I/2UawnuLouRtpWvygfE50ciuQOSBcnxsEGIBFa/5dILMA8I
         SbM1zupPpgGo/GaUD2My9Eu8KoQfMuOJftjEFEvUsDjWhVIWV+g0KeSSQyacIh6o3kQm
         9Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150635; x=1789755435;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yfcWeY5ru5f5Abx5JmRki0yzQVeUxZvAjTkZevgHXNo=;
        b=GO5HQw4i4mYEjig+270fCIrJQHNNACGI5D+hjVBjlukFHgmOKEyJN41XkL81/+Dzzy
         /FuVFsKCmI95BGyCJ6ibv6YjtO24Q1hhIqtdgKr5eq2xLwFvM807wpu8Ee9lMZShBFlo
         T07zxxxh25rl5mrcHeBi1SoOAVn5dbdU0jwOCDdv4ysvkkQ1sMKvPvCB3etWaQcd9cEo
         FQvN1EIaLU4HdFOGvOlh6dCYCCcwh5208I7q34k0e4AmKu02wbHz/8EbHX79sNZS1A7n
         n/J1JG8U2xoK5C0dG9QMo2WnOtewV8cmvDfmmAJM+7wH+3cq0AWLfo33it0uLzbITv6G
         ZOFA==
X-Forwarded-Encrypted: i=1; AKwUvBxyhaNIhxsNFLx2H1U7Wjez2H4e+Z9fLFpqKSXvq/zPn4ZbAPDjkdZOlkKODIhf0uqM3Z+u2Y5HNIu6N+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mxvkISumrQqKouq4u1TnyF7MYViGfjKQQBzT0rafh095SI5c8P
	vIgZgWj6U6q6B/OrGO34YEzl3jbJ4KZcQPBjOu0Zpb210t0UZdKhyfAjY5gMcZ/iLu8IO8BOdlW
	uCGPFz4Sqhhl4pMcmFXNdal4rCXb15Sj97DkG47WD
X-Gm-Gg: AYBFou0Bw3ZNIeBv1GFCjMVI2pEa2dCEx/9BcMtCAfgVaYGfPxUsX1ryloiKDlOmPaf
	oN6iHwYdarUu14Z6qftFJ4GokC+5KTXr+OALHoPluc6P//lr4MnFwpvcPGWfValtARcKf7LsPLt
	6moqloOuCaReBuhCjd5xLQJvQweZh22ZI00tjNwbLvhh54NZsZXl7FvNCB/EUvWIonc5h/0RUtR
	xGK+zIwsuuj2KrYIPYE+ZA4tvKdJWnF7NtRuInT3IeL+Iv02qwxx2e+52LpOZp8yxMi/tEYdNLk
	mzOI24kDYMdrma79NEV1U7F7/BRxNvbcsg9G5ulJCmAxUar3s5zot3+Exy4lc2LCrsRRjQ/XRY2
	1u9RNlEhb7y2zj+jHZfWglre0mqloWhTXIVm5QR5BXXgx75vFOeuygDGUPQo/7/pX9CSaBHtTV6
	A=
X-Received: by 2002:a05:6a20:9147:b0:3d3:ae50:97cd with SMTP id
 adf61e73a8af0-3daed880077mr8971547637.26.1789150634506; Fri, 11 Sep 2026
 11:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 11:17:02 -0700
X-Gm-Features: AcwNN1XAlHuZOJUyS9feRe2yL7DG1h-DclmQjdQKkC7-TJ3vPUY3P0CaiKFjPvU
Message-ID: <CA+0ovChxdK1Bupd7H3Ks3L-oPBoLPBweSM91z6OW5ABkBPCD_A@mail.gmail.com>
Subject: [BUG] general protection fault in opera1_xilinx_rw
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000005fc5c065b391813"

--00000000000005fc5c065b391813
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.243595][ T9493] Oops: general protection fault, probably for
non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
[   44.247392][ T9493] KASAN: null-ptr-deref in range
[0x0000000000000010-0x0000000000000017]
[   44.248988][ T9493] CPU: 0 UID: 0 PID: 9493 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.250992][ T9493] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.252986][ T9493] RIP: 0010:opera1_xilinx_rw+0x138/0x2f0
[   44.254082][ T9493] Code: bf b1 00 00 00 89 de e8 b6 0e b1 f9 80 fb
b1 0f 85 e8 00 00 00 89 6c 24 04 4d 89 f5 49 c1 ed 03 48 bd 00 00 00
00 00 fc ff df <41> 0f b6 44 2d 00 84 c0 0f 85 28 01 00 00 41 0f b6 06
88 04 24 48
[   44.257084][ T9493] RSP: 0018:ffffc90007faf8d8 EFLAGS: 00010202
[   44.257640][ T9493] RAX: ffffffff8816914a RBX: 00000000000000b1
RCX: ffff88802936cc80
[   44.258349][ T9493] RDX: 0000000000000000 RSI: 00000000000000b1
RDI: 00000000000000b1
[   44.259089][ T9493] RBP: dffffc0000000000 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   44.259801][ T9493] R10: dffffc0000000000 R11: fffffbfff20ac7b0
R12: 0000000000000000
[   44.260513][ T9493] R13: 0000000000000002 R14: 0000000000000010
R15: 0000000000000001
[   44.261223][ T9493] FS:  000000001cc7a400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   44.262018][ T9493] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.262610][ T9493] CR2: 0000559e493b0b00 CR3: 000000010bb36000
CR4: 0000000000752ef0
[   44.263322][ T9493] PKRU: 55555554
[   44.263652][ T9493] Call Trace:
[   44.263962][ T9493]  <TASK>
[   44.264247][ T9493]  opera1_i2c_xfer+0x23e/0x3b0
[   44.264692][ T9493]  __i2c_transfer+0x7a3/0x1f80
[   44.265137][ T9493]  ? __lock_acquire+0x25db/0x2db0
[   44.265603][ T9493]  __i2c_smbus_xfer+0x105c/0x1f70
[   44.266082][ T9493]  ? __pfx___i2c_smbus_xfer+0x10/0x10
[   44.266581][ T9493]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
[   44.267184][ T9493]  ? rt_mutex_lock_nested+0x15c/0x1d0
[   44.267677][ T9493]  i2c_smbus_xfer+0x1f5/0x310
[   44.268112][ T9493]  i2cdev_ioctl_smbus+0x1e7/0x730
[   44.268578][ T9493]  ? __pfx_i2cdev_ioctl_smbus+0x10/0x10
[   44.269084][ T9493]  i2cdev_ioctl+0x615/0x880
[   44.269504][ T9493]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   44.269964][ T9493]  ? __fget_files+0x2a/0x420
[   44.270392][ T9493]  ? __fget_files+0x3a0/0x420
[   44.270822][ T9493]  ? bpf_lsm_file_ioctl+0x9/0x20
[   44.271275][ T9493]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   44.271737][ T9493]  __se_sys_ioctl+0xfc/0x170
[   44.272161][ T9493]  do_syscall_64+0x155/0x510
[   44.272591][ T9493]  ? trace_irq_disable+0x3b/0x140
[   44.273053][ T9493]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.273605][ T9493]  ? clear_bhb_loop+0x30/0x80
[   44.274036][ T9493]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.274576][ T9493] RIP: 0033:0x42709d
[   44.274940][ T9493] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.276834][ T9493] RSP: 002b:00007fff29c1b880 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.277587][ T9493] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 000000000042709d
[   44.278298][ T9493] RDX: 00007fff29c1b900 RSI: 0000000000000720
RDI: 0000000000000005
[   44.279011][ T9493] RBP: 00007fff29c1b8d0 R08: 0000000000000001
R09: 0000000000000000
[   44.279727][ T9493] R10: 0000000000008040 R11: 0000000000000246
R12: 00007fff29c1bb98
[   44.280440][ T9493] R13: 00007fff29c1bba8 R14: 0000000000000002
R15: 00000000004caa40
[   44.281230][ T9493]  </TASK>
[   44.281542][ T9493] Modules linked in:
[   44.282087][ T9493] ---[ end trace 0000000000000000 ]---
[   44.284444][ T9493] RIP: 0010:opera1_xilinx_rw+0x138/0x2f0
[   44.284459][ T9493] Code: bf b1 00 00 00 89 de e8 b6 0e b1 f9 80 fb
b1 0f 85 e8 00 00 00 89 6c 24 04 4d 89 f5 49 c1 ed 03 48 bd 00 00 00
00 00 fc ff df <41> 0f b6 44 2d 00 84 c0 0f 85 28 01 00 00 41 0f b6 06
88 04 24 48
[   44.284465][ T9493] RSP: 0018:ffffc90007faf8d8 EFLAGS: 00010202
[   44.284472][ T9493] RAX: ffffffff8816914a RBX: 00000000000000b1
RCX: ffff88802936cc80
[   44.284478][ T9493] RDX: 0000000000000000 RSI: 00000000000000b1
RDI: 00000000000000b1
[   44.284482][ T9493] RBP: dffffc0000000000 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   44.284487][ T9493] R10: dffffc0000000000 R11: fffffbfff20ac7b0
R12: 0000000000000000
[   44.284492][ T9493] R13: 0000000000000002 R14: 0000000000000010
R15: 0000000000000001
[   44.284496][ T9493] FS:  000000001cc7a400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   44.284502][ T9493] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.284507][ T9493] CR2: 00007f50595301e0 CR3: 000000010bb36000
CR4: 0000000000752ef0
[   44.284513][ T9493] PKRU: 55555554
[   44.284520][ T9493] Kernel panic - not syncing: Fatal exception
[   44.294754][ T9493] Kernel Offset: disabled
[   44.295298][ T9493] Rebooting in 86400 seconds..

Regards,

--00000000000005fc5c065b391813
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxa2ghs0>
X-Attachment-Id: f_mtxa2ghs0

LyoKICogMjc0LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1vcGVyYTEteGlsaW54LXJ3CiAq
LwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2luY2x1ZGUgPGVycm5v
Lmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8cHRocmVhZC5oPgojaW5jbHVkZSA8c3Rk
aW50Lmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxz
eXMvaW9jdGwuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8bGludXgvdXNiL2NoOS5o
PgojaW5jbHVkZSA8bGludXgvdXNiL3Jhd19nYWRnZXQuaD4KI2luY2x1ZGUgPGxpbnV4L2kyYy5o
PgojaW5jbHVkZSA8bGludXgvaTJjLWRldi5oPgoKI2RlZmluZSBFUDBfTUFYX1RSQU5TRkVSIDQw
OTYKI2RlZmluZSBMRTE2KHZhbHVlKSAoKHZhbHVlKSAmIDB4ZmYpLCAoKCh2YWx1ZSkgPj4gOCkg
JiAweGZmKQoKc3RhdGljIGludCByYXdfZ2FkZ2V0X2ZkID0gLTE7CgpzdGF0aWMgY29uc3Qgc3Ry
dWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciBkZXZpY2VfZGVzY3JpcHRvciA9IHsKCS5iTGVuZ3Ro
ID0gc2l6ZW9mKHN0cnVjdCB1c2JfZGV2aWNlX2Rlc2NyaXB0b3IpLAoJLmJEZXNjcmlwdG9yVHlw
ZSA9IFVTQl9EVF9ERVZJQ0UsCgkuYmNkVVNCID0gMHgwMjAwLAoJLmJNYXhQYWNrZXRTaXplMCA9
IDY0LAoJLmlkVmVuZG9yID0gMHg2OTVjLAoJLmlkUHJvZHVjdCA9IDB4MzgyOSwKCS5iY2REZXZp
Y2UgPSAweDAxMDAsCgkuYk51bUNvbmZpZ3VyYXRpb25zID0gMSwKfTsKCnN0YXRpYyBjb25zdCB1
aW50OF90IGNvbmZpZ3VyYXRpb25fZGVzY3JpcHRvcltdID0gewoJOSwgVVNCX0RUX0NPTkZJRywg
TEUxNig5ICsgOSArIDcpLCAxLCAxLCAwLCAweGEwLCAweGZhLAoJOSwgVVNCX0RUX0lOVEVSRkFD
RSwgMCwgMCwgMSwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCTcsIFVTQl9EVF9FTkRQT0lOVCwgMHg4
MiwgVVNCX0VORFBPSU5UX1hGRVJfQlVMSywgTEUxNig1MTIpLCAwLAp9OwoKc3RhdGljIHZvaWQg
ZXAwX3dyaXRlKGNvbnN0IHZvaWQgKnBheWxvYWQsIHVpbnQzMl90IGxlbmd0aCkKewoJdWludDhf
dCBiYWNraW5nW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyBFUDBfTUFYX1RSQU5TRkVS
XTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICp0cmFuc2ZlciA9ICh2b2lkICopYmFja2luZzsKCgl0
cmFuc2Zlci0+ZXAgPSAwOwoJdHJhbnNmZXItPmZsYWdzID0gMDsKCXRyYW5zZmVyLT5sZW5ndGgg
PSBsZW5ndGg7CglpZiAobGVuZ3RoKQoJCW1lbWNweSh0cmFuc2Zlci0+ZGF0YSwgcGF5bG9hZCwg
bGVuZ3RoKTsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1dSSVRFLCB0
cmFuc2Zlcik7Cn0KCnN0YXRpYyB2b2lkIGVwMF9yZWFkKHVpbnQzMl90IGxlbmd0aCkKewoJdWlu
dDhfdCBiYWNraW5nW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyBFUDBfTUFYX1RSQU5T
RkVSXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICp0cmFuc2ZlciA9ICh2b2lkICopYmFja2luZzsK
Cgl0cmFuc2Zlci0+ZXAgPSAwOwoJdHJhbnNmZXItPmZsYWdzID0gMDsKCXRyYW5zZmVyLT5sZW5n
dGggPSBsZW5ndGggPiBFUDBfTUFYX1RSQU5TRkVSID8gRVAwX01BWF9UUkFOU0ZFUiA6IGxlbmd0
aDsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsIHRyYW5zZmVy
KTsKfQoKc3RhdGljIHZvaWQgaGFuZGxlX2NvbnRyb2xfcmVxdWVzdChjb25zdCBzdHJ1Y3QgdXNi
X2N0cmxyZXF1ZXN0ICpzZXR1cCkKewoJdWludDhfdCByZXNwb25zZVtFUDBfTUFYX1RSQU5TRkVS
XTsKCWludCByZXNwb25zZV9sZW5ndGggPSAtMTsKCgltZW1zZXQocmVzcG9uc2UsIDAsIHNpemVv
ZihyZXNwb25zZSkpOwoJaWYgKChzZXR1cC0+YlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFTSykg
PT0gVVNCX1RZUEVfU1RBTkRBUkQpIHsKCQlzd2l0Y2ggKHNldHVwLT5iUmVxdWVzdCkgewoJCWNh
c2UgVVNCX1JFUV9HRVRfREVTQ1JJUFRPUjoKCQkJaWYgKChzZXR1cC0+d1ZhbHVlID4+IDgpID09
IFVTQl9EVF9ERVZJQ0UpIHsKCQkJCXJlc3BvbnNlX2xlbmd0aCA9IHNpemVvZihkZXZpY2VfZGVz
Y3JpcHRvcik7CgkJCQltZW1jcHkocmVzcG9uc2UsICZkZXZpY2VfZGVzY3JpcHRvciwKCQkJCSAg
ICAgICByZXNwb25zZV9sZW5ndGgpOwoJCQl9IGVsc2UgaWYgKChzZXR1cC0+d1ZhbHVlID4+IDgp
ID09IFVTQl9EVF9DT05GSUcpIHsKCQkJCXJlc3BvbnNlX2xlbmd0aCA9IHNpemVvZihjb25maWd1
cmF0aW9uX2Rlc2NyaXB0b3IpOwoJCQkJbWVtY3B5KHJlc3BvbnNlLCBjb25maWd1cmF0aW9uX2Rl
c2NyaXB0b3IsCgkJCQkgICAgICAgcmVzcG9uc2VfbGVuZ3RoKTsKCQkJfQoJCQlicmVhazsKCQlj
YXNlIFVTQl9SRVFfU0VUX0NPTkZJR1VSQVRJT046CgkJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVT
Ql9SQVdfSU9DVExfQ09ORklHVVJFLCAwKTsKCQkJcmVzcG9uc2VfbGVuZ3RoID0gMDsKCQkJYnJl
YWs7CgkJfQoJfSBlbHNlIHsKCgkJaWYgKHNldHVwLT5iUmVxdWVzdCA9PSAweGJjKQoJCQlyZXNw
b25zZVswXSA9IDB4Njc7CgkJcmVzcG9uc2VfbGVuZ3RoID0gKHNldHVwLT5iUmVxdWVzdFR5cGUg
JiBVU0JfRElSX0lOKSA/CgkJCXNldHVwLT53TGVuZ3RoIDogMDsKCQlpZiAocmVzcG9uc2VfbGVu
Z3RoID4gKGludClzaXplb2YocmVzcG9uc2UpKQoJCQlyZXNwb25zZV9sZW5ndGggPSBzaXplb2Yo
cmVzcG9uc2UpOwoJfQoKCWlmIChyZXNwb25zZV9sZW5ndGggPCAwKSB7CgkJaW9jdGwocmF3X2dh
ZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfU1RBTEwsIDApOwoJCXJldHVybjsKCX0KCWlmIChz
ZXR1cC0+YlJlcXVlc3RUeXBlICYgVVNCX0RJUl9JTikgewoJCWlmIChyZXNwb25zZV9sZW5ndGgg
PiAoaW50KXNldHVwLT53TGVuZ3RoKQoJCQlyZXNwb25zZV9sZW5ndGggPSBzZXR1cC0+d0xlbmd0
aDsKCQllcDBfd3JpdGUocmVzcG9uc2UsICh1aW50MzJfdClyZXNwb25zZV9sZW5ndGgpOwoJfSBl
bHNlIHsKCQllcDBfcmVhZChzZXR1cC0+d0xlbmd0aCk7Cgl9Cn0KCnN0YXRpYyB2b2lkICpnYWRn
ZXRfZXZlbnRfbG9vcCh2b2lkICp1bnVzZWQpCnsKCXVpbnQ4X3QgYmFja2luZ1tzaXplb2Yoc3Ry
dWN0IHVzYl9yYXdfZXZlbnQpICsgRVAwX01BWF9UUkFOU0ZFUl07CglzdHJ1Y3QgdXNiX3Jhd19l
dmVudCAqZXZlbnQgPSAodm9pZCAqKWJhY2tpbmc7CgoJZm9yICg7OykgewoJCWV2ZW50LT50eXBl
ID0gMDsKCQlldmVudC0+bGVuZ3RoID0gRVAwX01BWF9UUkFOU0ZFUjsKCQlpZiAoaW9jdGwocmF3
X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FVkVOVF9GRVRDSCwgZXZlbnQpIDwgMCkgewoJCQlp
ZiAoZXJybm8gIT0gRUlOVFIpCgkJCQl1c2xlZXAoMTAwMCk7CgkJCWNvbnRpbnVlOwoJCX0KCQlp
ZiAoZXZlbnQtPnR5cGUgPT0gVVNCX1JBV19FVkVOVF9DT05UUk9MKQoJCQloYW5kbGVfY29udHJv
bF9yZXF1ZXN0KAoJCQkJKHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKilldmVudC0+ZGF0YSk7Cgl9
CglyZXR1cm4gTlVMTDsKfQoKc3RhdGljIGludCBvcGVuX29wZXJhMV9pMmNfZGV2aWNlKHZvaWQp
CnsKCURJUiAqaTJjX2NsYXNzX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xhc3MvaTJjLWRldiIpOwoJ
c3RydWN0IGRpcmVudCAqaTJjX2NsYXNzX2VudHJ5OwoJaW50IGkyY19mZCA9IC0xOwoKCWlmICgh
aTJjX2NsYXNzX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKGkyY19jbGFzc19lbnRyeSA9IHJl
YWRkaXIoaTJjX2NsYXNzX2RpcikpKSB7CgkJY2hhciBzeXNmc19wYXRoWzUxMl0sIGFkYXB0ZXJf
bmFtZVsxMjhdOwoJCWludCBuYW1lX2ZkLCBuYW1lX2xlbmd0aDsKCgkJaWYgKGkyY19jbGFzc19l
bnRyeS0+ZF9uYW1lWzBdID09ICcuJykKCQkJY29udGludWU7CgkJc25wcmludGYoc3lzZnNfcGF0
aCwgc2l6ZW9mKHN5c2ZzX3BhdGgpLAoJCQkgIi9zeXMvY2xhc3MvaTJjLWRldi8lcy9uYW1lIiwg
aTJjX2NsYXNzX2VudHJ5LT5kX25hbWUpOwoJCW5hbWVfZmQgPSBvcGVuKHN5c2ZzX3BhdGgsIE9f
UkRPTkxZKTsKCQlpZiAobmFtZV9mZCA8IDApCgkJCWNvbnRpbnVlOwoJCW5hbWVfbGVuZ3RoID0g
cmVhZChuYW1lX2ZkLCBhZGFwdGVyX25hbWUsCgkJCQkgICBzaXplb2YoYWRhcHRlcl9uYW1lKSAt
IDEpOwoJCWNsb3NlKG5hbWVfZmQpOwoJCWlmIChuYW1lX2xlbmd0aCA8PSAwKQoJCQljb250aW51
ZTsKCQlhZGFwdGVyX25hbWVbbmFtZV9sZW5ndGhdID0gMDsKCQlpZiAoIXN0cnN0cihhZGFwdGVy
X25hbWUsICJPcGVyYSIpKQoJCQljb250aW51ZTsKCQlzbnByaW50ZihzeXNmc19wYXRoLCBzaXpl
b2Yoc3lzZnNfcGF0aCksICIvZGV2LyVzIiwKCQkJIGkyY19jbGFzc19lbnRyeS0+ZF9uYW1lKTsK
CQlpMmNfZmQgPSBvcGVuKHN5c2ZzX3BhdGgsIE9fUkRXUik7CgkJaWYgKGkyY19mZCA+PSAwKQoJ
CQlicmVhazsKCX0KCWNsb3NlZGlyKGkyY19jbGFzc19kaXIpOwoJcmV0dXJuIGkyY19mZDsKfQoK
aW50IG1haW4odm9pZCkKewoJc3RydWN0IHVzYl9yYXdfaW5pdCByYXdfZ2FkZ2V0X2luaXQ7Cglz
dHJ1Y3QgaTJjX3NtYnVzX2lvY3RsX2RhdGEgc21idXNfcmVxdWVzdDsKCXB0aHJlYWRfdCBnYWRn
ZXRfdGhyZWFkOwoJaW50IGkyY19mZCwgZmlybXdhcmVfZmQsIGF0dGVtcHQ7Cgl1aW50OF90IGZp
cm13YXJlX2Jsb2JbNjRdOwoKCW1lbXNldChmaXJtd2FyZV9ibG9iLCAweGE1LCBzaXplb2YoZmly
bXdhcmVfYmxvYikpOwoJZmlybXdhcmVfZmQgPSBvcGVuKCIvbGliL2Zpcm13YXJlL2R2Yi11c2It
b3BlcmExLWZwZ2EtMDEuZnciLAoJCQkgICBPX1dST05MWSB8IE9fQ1JFQVQgfCBPX1RSVU5DLCAw
NjQ0KTsKCWlmIChmaXJtd2FyZV9mZCA8IDApIHsKCQlmcHJpbnRmKHN0ZGVyciwgIm9wZW4oL2xp
Yi9maXJtd2FyZS8uLi4pOiAlc1xuIiwKCQkJc3RyZXJyb3IoZXJybm8pKTsKCQlyZXR1cm4gMTsK
CX0KCXdyaXRlKGZpcm13YXJlX2ZkLCBmaXJtd2FyZV9ibG9iLCBzaXplb2YoZmlybXdhcmVfYmxv
YikpOwoJY2xvc2UoZmlybXdhcmVfZmQpOwoKCXJhd19nYWRnZXRfZmQgPSBvcGVuKCIvZGV2L3Jh
dy1nYWRnZXQiLCBPX1JEV1IpOwoJaWYgKHJhd19nYWRnZXRfZmQgPCAwKSB7CgkJZnByaW50Zihz
dGRlcnIsICJvcGVuKC9kZXYvcmF3LWdhZGdldCk6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOwoJ
CXJldHVybiAxOwoJfQoJbWVtc2V0KCZyYXdfZ2FkZ2V0X2luaXQsIDAsIHNpemVvZihyYXdfZ2Fk
Z2V0X2luaXQpKTsKCXN0cmNweSgoY2hhciAqKXJhd19nYWRnZXRfaW5pdC5kcml2ZXJfbmFtZSwg
ImR1bW15X3VkYyIpOwoJc3RyY3B5KChjaGFyICopcmF3X2dhZGdldF9pbml0LmRldmljZV9uYW1l
LCAiZHVtbXlfdWRjLjAiKTsKCXJhd19nYWRnZXRfaW5pdC5zcGVlZCA9IFVTQl9TUEVFRF9ISUdI
OwoJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfSU5JVCwgJnJhd19nYWRn
ZXRfaW5pdCkgPCAwKSB7CgkJZnByaW50ZihzdGRlcnIsICJVU0JfUkFXX0lPQ1RMX0lOSVQ6ICVz
XG4iLCBzdHJlcnJvcihlcnJubykpOwoJCXJldHVybiAxOwoJfQoJaWYgKGlvY3RsKHJhd19nYWRn
ZXRfZmQsIFVTQl9SQVdfSU9DVExfUlVOLCAwKSA8IDApIHsKCQlmcHJpbnRmKHN0ZGVyciwgIlVT
Ql9SQVdfSU9DVExfUlVOOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCQlyZXR1cm4gMTsKCX0K
CXB0aHJlYWRfY3JlYXRlKCZnYWRnZXRfdGhyZWFkLCBOVUxMLCBnYWRnZXRfZXZlbnRfbG9vcCwg
TlVMTCk7CgoJZm9yIChhdHRlbXB0ID0gMDsgYXR0ZW1wdCA8IDE1MDsgYXR0ZW1wdCsrKSB7CgkJ
aTJjX2ZkID0gb3Blbl9vcGVyYTFfaTJjX2RldmljZSgpOwoJCWlmIChpMmNfZmQgPj0gMCkKCQkJ
YnJlYWs7CgkJdXNsZWVwKDEwMDAwMCk7Cgl9CglpZiAoaTJjX2ZkIDwgMCkgewoJCWZwcmludGYo
c3RkZXJyLCAib3BlcmExIGkyYyBhZGFwdGVyIG5ldmVyIGFwcGVhcmVkXG4iKTsKCQlyZXR1cm4g
MTsKCX0KCglpb2N0bChpMmNfZmQsIEkyQ19TTEFWRV9GT1JDRSwgMHgxMCk7CgoJbWVtc2V0KCZz
bWJ1c19yZXF1ZXN0LCAwLCBzaXplb2Yoc21idXNfcmVxdWVzdCkpOwoJc21idXNfcmVxdWVzdC5y
ZWFkX3dyaXRlID0gSTJDX1NNQlVTX1dSSVRFOwoJc21idXNfcmVxdWVzdC5jb21tYW5kID0gMDsK
CXNtYnVzX3JlcXVlc3Quc2l6ZSA9IEkyQ19TTUJVU19RVUlDSzsKCXNtYnVzX3JlcXVlc3QuZGF0
YSA9IE5VTEw7Cglpb2N0bChpMmNfZmQsIEkyQ19TTUJVUywgJnNtYnVzX3JlcXVlc3QpOwoKCWZw
cmludGYoc3RkZXJyLCAiZG9uZSAobm8gY3Jhc2gpXG4iKTsKCXJldHVybiAwOwp9Cg==
--00000000000005fc5c065b391813--
