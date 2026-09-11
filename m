Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7423A1E81
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147876; cv=pass; b=TnifF6t+gBDFVDAMJljHn2TBoYXUH/P16dhJEaoTIeKBeQVOySL1NOZfTbagnPN6PgIOAfQG77Xc4b8FVsHmV0tht+hEY6mo3gE03bQHQh/jGnZ6d5hzHnfcgTesX+RuLOQsSOmAxKvc65+z3CnyqmpMf4+dA1kzUlTydafXtRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147876; c=relaxed/simple;
	bh=zup9Mlecb1aPrMe/9OiTQaypnPj4YpnGfex42UevKO4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eNVMKZI18SH8Jstm4/gS9GO9Y36hSGKlLaJhIV4nnpVALk08V9lyQxUvcRpOWG4o3tV6pIJCfAwokOj5XcoAcIokxn/m3bV/Wnq1bFAlBcFJPLlce0q78VzB2rC6JNanmnyzcyDhvsvX0AmqXvPuDj8cwPA/RNgp2qUqC3RLzXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=BacUTLTQ; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="BacUTLTQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so11388825ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789147874; cv=none;
        d=google.com; s=arc-20260327;
        b=n47Z61tOzMx5lLhApluwIdxv534oP3J28b3DwOBgm12blEPoKJkXmdc3hCnCg9c7JY
         DM3P+yT9Jr76Os1/JFY28b7q0CXqMNxvIqz1qYIiIt9qY6DxvlYVEt0GiBGRlnT6/MI4
         uMmPr6hks0koy4IsmHzK68rGqMRfctZbq0huUGXvQ6HTa/RfuB2fTkTl+k2lkWtYgLvO
         Hb3/jWZpbyH37mVhbfNGrMzj9nf9wqYjWwJS4w+3h6SoSlqhu8gpzIw7ZvGPfy7Mg9DF
         pvT92umRGWRTxxTDJADI69CCUe+v8A1zABD+uacgwV9DKAibs2tybZxhinOMEtkDpWBu
         2oMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xJid1TWXBRf5bcu6ytSaovuT3mIis9thlZ+OGSO3YgM=;
        fh=CMdg6Y59StqVkoCaYtoUqL/Ab6034vQpUxTDAL4sHmQ=;
        b=sTQJTj3E+Z58oLEYNB79HGf4arGP0eE+AvoBHhSvwukDVZtbb9sfEpbh8uRfewlidO
         XJ8OndeqCGMKs3zBdPnAdxKafXtD3v7YPloexgmYB0dNuVKDETHpeZNG17YWkqri4/ZN
         1pRcH8zCFHpBDdTGNcLs+9vmeMEuMPfa7jHodalbyeS/ZHW/qOEoKghVsPGr1zuoKY0x
         9erJ+r6wdidC0tJ94F0e6F8fldYbFIyTZ/NAFwMl88V468NVaOPJAYBd8FRLTI39dsA+
         4VsO9YsCOTPCepdDKg4CDOhxR2VQ1ydqxIz0dRo7wbTbFeM21/AQmiPWq6wn0kuVNieB
         wLQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789147874; x=1789752674; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJid1TWXBRf5bcu6ytSaovuT3mIis9thlZ+OGSO3YgM=;
        b=BacUTLTQNX33I0UFNjd6H0chHzLMrs2S/XjWmK+VafByOauCgP41QDQ6GCZq/BpG4L
         bwbnSV6OG4VsF45+W4mzOtkrup7EqO65zGX4jF5GcElqpVsmGYQTWNvbgw54lS3C7f8+
         dO9M3bt6Yh1nagE1ArVK/NhRTsPiDh19f9CQF5jikbL2I9XmXjkiFwBG8l6cvHEpODyQ
         nyC+WqCc5yNFttN0HdI7amGeWUug7c/H5BIWEvy+4Qp3u3V+zF66FJGIJJAYS1kYvrYP
         n27SC+oosJ1ItCZNu2mC7W8pZ4I/FS2SInBRbkKRJ5wJBGC98TQ3igAJGT0KISWcVRdy
         D1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147874; x=1789752674;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xJid1TWXBRf5bcu6ytSaovuT3mIis9thlZ+OGSO3YgM=;
        b=BnYst0Z0DBbShkj33ilL7nI77JtBcUZPOXkN5NjOxr7SeEyzZBrysVNJWL/6hqyrQl
         DBl4YdhK2D+E6ss2WVjYG3kTuDwxJaDgKWFryfuZK9ZZQUBq/zgF9GkSBytr9jEIgWfI
         Etc0Ai+MJhMP/S8D/+cBn4e60DKI/1iD1RaYjt4mFaAc0IkUZwi9tajP4nN+FeZ9PIVA
         KDJ+kT7h5QDEcWFBN4K31V8Mk9M73gID+6sB5U9NRBBNZyT3ZPnkDfezdqTj6Kc/yi1m
         +juHbDKZIB26WzeJowddbug9V6dYrKy35PMM8qusGEjjd7gCRbObgWhQq43fMD66d1d+
         Z2gw==
X-Forwarded-Encrypted: i=1; AKwUvBxlNE2J9JDz2qd1lepZtLjtaj6DM6nMOgyh1t6OPLROy9Oi+5SdqdEht4a9//hKzD57rr8ilW6SDZxotd0=@vger.kernel.org
X-Gm-Message-State: AFuF++lYfZtrCcBM6lRgx4Xr+N6M+uz31Jhd2I98snA/KdxrWPOlLLTc
	jwMZz/4NExggnlJtdEwJcUGumiIKv1g9AyBrBJRv6Ifcm8AhRtmjZwnY9wwXKWr0tbGCAIyEyHS
	GRXIh7IcvlpwuLTVd25e4AMHocDcwxjDsQXDjySH4
X-Gm-Gg: AYBFou1cirUyNeWHRI9zYmcHWw28nABCZf+QVnWkTCrQdJYDbxP8Ig5/tMJrfZCr869
	RtE0FvLW4Efj7gM3lXMS5VQt3ibjhq2MtcpyEEGkdBlVZHZnZOvXzED1QwbhtU1S0+H8j8/OLHV
	pnFgjUGV+174b+oml0+9TzQqr5sAwVA9wlFqLkpTRpDYUpKklqd2tMqpgqcolTBl44XW0wFpWgh
	mps0g14seQW6bpHkvIZvoZbefzIvFd52sR5cCWR/I888kiA0s23sT67fzt52CcQ4cMCX+qB60dz
	dAS6TYB6XsxYpuLf29E0pVg4ND116z6j/9u5mIDhSzw/qSf3R+VeF16EwMCUXInuJSFfSUrIflW
	hL5QLL9//jG9Jt6ymeC3z2vdfEkmQSvQapFoNq64B/sPLd3bhhmvCSWlOmyQGrolWC7wWrDHFBx
	6S8J/Y2bz2aw==
X-Received: by 2002:a17:902:ea06:b0:2db:eb5:47ea with SMTP id
 d9443c01a7336-2dd29e0cb5bmr89835025ad.0.1789147873372; Fri, 11 Sep 2026
 10:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 10:31:02 -0700
X-Gm-Features: AcwNN1X3ELvj7q2gj-KPFnqAQYG4ll0ladTRQLc_s4XypwIWkCUdTE-2yoJ0ZUc
Message-ID: <CA+0ovCjFQHYuUkNLFRu4hUigBQvHP4-rWT-51uUFQBo6ypHPqw@mail.gmail.com>
Subject: [BUG] general protection fault in si4713_transfer
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000072b130065b3873c2"

--00000000000072b130065b3873c2
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.353189][ T9493] Oops: general protection fault, probably for
non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
[   44.355892][ T9493] KASAN: null-ptr-deref in range
[0x0000000000000010-0x0000000000000017]
[   44.357779][ T9493] CPU: 1 UID: 0 PID: 9493 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.360129][ T9493] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.361627][ T9493] RIP: 0010:si4713_transfer+0x185/0x6b0
[   44.362172][ T9493] Code: 65 f9 48 8b 6c 24 38 4d 89 fd 4c 8b 7c 24
40 49 81 ff 90 00 00 00 0f 84 16 04 00 00 e8 e4 6c 65 f9 49 83 c7 0c
48 8b 44 24 58 <42> 0f b6 04 28 84 c0 0f 85 ab 01 00 00 0f b6 5d 00 49
8d bf 80 ba
[   44.363966][ T9493] RSP: 0018:ffffc90021e0fbd0 EFLAGS: 00010246
[   44.364550][ T9493] RAX: 0000000000000002 RBX: 0000000000000000
RCX: ffff888023c78000
[   44.365285][ T9493] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 000000000000003b
[   44.365996][ T9493] RBP: 0000000000000010 R08: ffff888111062df7
R09: 1ffff1102220c5be
[   44.366739][ T9493] R10: dffffc0000000000 R11: ffffffff88622e20
R12: ffff888111062f58
[   44.367491][ T9493] R13: dffffc0000000000 R14: 00000000ffffffea
R15: 0000000000000000
[   44.368239][ T9493] FS:  000000001cfe7400(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   44.369055][ T9493] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.369649][ T9493] CR2: 00007feaba8e0000 CR3: 0000000111292000
CR4: 0000000000752ef0
[   44.370365][ T9493] PKRU: 55555554
[   44.370830][ T9493] Call Trace:
[   44.371165][ T9493]  <TASK>
[   44.371470][ T9493]  __i2c_transfer+0x7a3/0x1f80
[   44.371946][ T9493]  ? i2c_transfer+0xc7/0x2d0
[   44.372408][ T9493]  i2c_transfer+0x1cb/0x2d0
[   44.372826][ T9493]  i2cdev_ioctl_rdwr+0x460/0x740
[   44.373280][ T9493]  i2cdev_ioctl+0x6a5/0x880
[   44.373698][ T9493]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   44.374160][ T9493]  ? __pfx_fput_close_sync+0x10/0x10
[   44.374648][ T9493]  ? bpf_lsm_file_ioctl+0x9/0x20
[   44.375101][ T9493]  ? __pfx_i2cdev_ioctl+0x10/0x10
[   44.375563][ T9493]  __se_sys_ioctl+0xfc/0x170
[   44.375989][ T9493]  do_syscall_64+0x155/0x510
[   44.376425][ T9493]  ? trace_irq_disable+0x3b/0x140
[   44.376888][ T9493]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.377436][ T9493]  ? clear_bhb_loop+0x30/0x80
[   44.377871][ T9493]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.378405][ T9493] RIP: 0033:0x422cdd
[   44.378770][ T9493] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.380587][ T9493] RSP: 002b:00007ffc38d6e780 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.381373][ T9493] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000422cdd
[   44.382117][ T9493] RDX: 00007ffc38d6e810 RSI: 0000000000000707
RDI: 0000000000000004
[   44.382850][ T9493] RBP: 00007ffc38d6e7d0 R08: 0000000000000000
R09: 0000000000000000
[   44.383596][ T9493] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffc38d6ec18
[   44.384330][ T9493] R13: 00007ffc38d6ec28 R14: 0000000000000002
R15: 00000000004bca00
[   44.385078][ T9493]  </TASK>
[   44.385380][ T9493] Modules linked in:
[   44.385816][ T9493] ---[ end trace 0000000000000000 ]---
[   44.386558][ T9493] RIP: 0010:si4713_transfer+0x185/0x6b0
[   44.386573][ T9493] Code: 65 f9 48 8b 6c 24 38 4d 89 fd 4c 8b 7c 24
40 49 81 ff 90 00 00 00 0f 84 16 04 00 00 e8 e4 6c 65 f9 49 83 c7 0c
48 8b 44 24 58 <42> 0f b6 04 28 84 c0 0f 85 ab 01 00 00 0f b6 5d 00 49
8d bf 80 ba
[   44.386579][ T9493] RSP: 0018:ffffc90021e0fbd0 EFLAGS: 00010246
[   44.386585][ T9493] RAX: 0000000000000002 RBX: 0000000000000000
RCX: ffff888023c78000
[   44.386590][ T9493] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 000000000000003b
[   44.386594][ T9493] RBP: 0000000000000010 R08: ffff888111062df7
R09: 1ffff1102220c5be
[   44.386599][ T9493] R10: dffffc0000000000 R11: ffffffff88622e20
R12: ffff888111062f58
[   44.386603][ T9493] R13: dffffc0000000000 R14: 00000000ffffffea
R15: 0000000000000000
[   44.386608][ T9493] FS:  000000001cfe7400(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   44.386614][ T9493] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.386619][ T9493] CR2: 0000565274948878 CR3: 0000000111292000
CR4: 0000000000752ef0
[   44.386625][ T9493] PKRU: 55555554
[   44.386631][ T9493] Kernel panic - not syncing: Fatal exception
[   44.396726][ T9493] Kernel Offset: disabled
[   44.397270][ T9493] Rebooting in 86400 seconds..

Regards,

--00000000000072b130065b3873c2
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx8c7450>
X-Attachment-Id: f_mtx8c7450

LyoKICogMjY2LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1zaTQ3MTMtdHJhbnNmZXIKICov
CiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5jbHVkZSA8ZXJybm8u
aD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGli
Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8c3Rk
aW50Lmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHN5cy93YWl0Lmg+CiNpbmNs
dWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxsaW51eC91c2IvcmF3X2dhZGdldC5oPgoj
aW5jbHVkZSA8bGludXgvaTJjLmg+CiNpbmNsdWRlIDxsaW51eC9pMmMtZGV2Lmg+CgojZGVmaW5l
IEVQMF9NQVhfVFJBTlNGRVIgNDA5NgojZGVmaW5lIFNJNDcxM19VU0JfVkVORE9SX0lEIDB4MTBj
NAojZGVmaW5lIFNJNDcxM19VU0JfUFJPRFVDVF9JRCAweDgyNDQKCiNkZWZpbmUgU0k0NzEzX1JF
UE9SVF9MRU5HVEggNjQKCiNkZWZpbmUgU0k0NzEzX0kyQ19BRERSRVNTIDB4NjMKCnN0YXRpYyBp
bnQgcmF3X2dhZGdldF9mZCA9IC0xOwoKc3RhdGljIHN0cnVjdCB1c2JfZGV2aWNlX2Rlc2NyaXB0
b3Igc2k0NzEzX2RldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGggPSBzaXplb2Yoc3RydWN0
IHVzYl9kZXZpY2VfZGVzY3JpcHRvciksCgkuYkRlc2NyaXB0b3JUeXBlID0gVVNCX0RUX0RFVklD
RSwKCS5iY2RVU0IgPSAweDAyMDAsCgkuYk1heFBhY2tldFNpemUwID0gNjQsCgkuaWRWZW5kb3Ig
PSBTSTQ3MTNfVVNCX1ZFTkRPUl9JRCwKCS5pZFByb2R1Y3QgPSBTSTQ3MTNfVVNCX1BST0RVQ1Rf
SUQsCgkuYk51bUNvbmZpZ3VyYXRpb25zID0gMSwKfTsKCnN0YXRpYyB1aW50OF90IGNvbmZpZ19h
bmRfaGlkX2ludGVyZmFjZV9kZXNjcmlwdG9yc1tdID0gewoJOSwgVVNCX0RUX0NPTkZJRywgMTgs
IDAsIDEsIDEsIDAsIDB4ODAsIDB4MzIsCgk5LCBVU0JfRFRfSU5URVJGQUNFLCAwLCAwLCAwLCBV
U0JfQ0xBU1NfSElELCAwLCAwLCAwLAp9OwoKc3RhdGljIHZvaWQgZXAwX3RyYW5zZmVyKHVuc2ln
bmVkIGxvbmcgZGlyZWN0aW9uX2lvY3RsLCBjb25zdCB2b2lkICpwYXlsb2FkLAoJCQkgdWludDMy
X3QgbGVuZ3RoKQp7Cgl1aW50OF90IHJhd1tzaXplb2Yoc3RydWN0IHVzYl9yYXdfZXBfaW8pICsg
RVAwX01BWF9UUkFOU0ZFUl07CglzdHJ1Y3QgdXNiX3Jhd19lcF9pbyAqZXBfaW8gPSAodm9pZCAq
KXJhdzsKCglpZiAobGVuZ3RoID4gRVAwX01BWF9UUkFOU0ZFUikKCQlsZW5ndGggPSBFUDBfTUFY
X1RSQU5TRkVSOwoJZXBfaW8tPmVwID0gMDsKCWVwX2lvLT5mbGFncyA9IDA7CgllcF9pby0+bGVu
Z3RoID0gbGVuZ3RoOwoJaWYgKHBheWxvYWQgJiYgbGVuZ3RoKQoJCW1lbWNweShlcF9pby0+ZGF0
YSwgcGF5bG9hZCwgbGVuZ3RoKTsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIGRpcmVjdGlvbl9pb2N0
bCwgZXBfaW8pOwp9CgpzdGF0aWMgdm9pZCBoYW5kbGVfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0
cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0cmwpCnsKCXVpbnQ4X3QgcmVwbHlbU0k0NzEzX1JFUE9S
VF9MRU5HVEhdOwoJaW50IHJlcGx5X2xlbmd0aCA9IC0xOwoKCW1lbXNldChyZXBseSwgMCwgc2l6
ZW9mKHJlcGx5KSk7CgoJaWYgKChjdHJsLT5iUmVxdWVzdFR5cGUgJiBVU0JfVFlQRV9NQVNLKSA9
PSBVU0JfVFlQRV9TVEFOREFSRCkgewoJCXN3aXRjaCAoY3RybC0+YlJlcXVlc3QpIHsKCQljYXNl
IFVTQl9SRVFfR0VUX0RFU0NSSVBUT1I6CgkJCXN3aXRjaCAoY3RybC0+d1ZhbHVlID4+IDgpIHsK
CQkJY2FzZSBVU0JfRFRfREVWSUNFOgoJCQkJcmVwbHlfbGVuZ3RoID0gc2l6ZW9mKHNpNDcxM19k
ZXZpY2VfZGVzY3JpcHRvcik7CgkJCQltZW1jcHkocmVwbHksICZzaTQ3MTNfZGV2aWNlX2Rlc2Ny
aXB0b3IsIHJlcGx5X2xlbmd0aCk7CgkJCQlicmVhazsKCQkJY2FzZSBVU0JfRFRfQ09ORklHOgoJ
CQkJcmVwbHlfbGVuZ3RoID0gc2l6ZW9mKGNvbmZpZ19hbmRfaGlkX2ludGVyZmFjZV9kZXNjcmlw
dG9ycyk7CgkJCQltZW1jcHkocmVwbHksIGNvbmZpZ19hbmRfaGlkX2ludGVyZmFjZV9kZXNjcmlw
dG9ycywgcmVwbHlfbGVuZ3RoKTsKCQkJCWJyZWFrOwoJCQl9CgkJCWJyZWFrOwoJCWNhc2UgVVNC
X1JFUV9TRVRfQ09ORklHVVJBVElPTjoKCQkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19J
T0NUTF9DT05GSUdVUkUsIDApOwoJCQlyZXBseV9sZW5ndGggPSAwOwoJCQlicmVhazsKCQl9Cgl9
IGVsc2UgewoKCQlpZiAoY3RybC0+YlJlcXVlc3QgPT0gMHgwMSAmJiAoY3RybC0+YlJlcXVlc3RU
eXBlICYgVVNCX0RJUl9JTikpCgkJCXJlcGx5X2xlbmd0aCA9IFNJNDcxM19SRVBPUlRfTEVOR1RI
OwoJCWVsc2UgaWYgKGN0cmwtPmJSZXF1ZXN0ID09IDB4MDkpCgkJCXJlcGx5X2xlbmd0aCA9IDA7
Cgl9CgoJaWYgKHJlcGx5X2xlbmd0aCA8IDApIHsKCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0Jf
UkFXX0lPQ1RMX0VQMF9TVEFMTCwgMCk7CgkJcmV0dXJuOwoJfQoJaWYgKGN0cmwtPmJSZXF1ZXN0
VHlwZSAmIFVTQl9ESVJfSU4pIHsKCQlpZiAocmVwbHlfbGVuZ3RoID4gY3RybC0+d0xlbmd0aCkK
CQkJcmVwbHlfbGVuZ3RoID0gY3RybC0+d0xlbmd0aDsKCQllcDBfdHJhbnNmZXIoVVNCX1JBV19J
T0NUTF9FUDBfV1JJVEUsIHJlcGx5LCAodWludDMyX3QpcmVwbHlfbGVuZ3RoKTsKCX0gZWxzZSB7
CgkJZXAwX3RyYW5zZmVyKFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsIE5VTEwsIGN0cmwtPndMZW5n
dGgpOwoJfQp9CgpzdGF0aWMgdm9pZCBzZXJ2ZV9nYWRnZXRfY29udHJvbF9yZXF1ZXN0cyh2b2lk
KQp7Cgl1aW50OF90IHJhd1tzaXplb2Yoc3RydWN0IHVzYl9yYXdfZXZlbnQpICsgRVAwX01BWF9U
UkFOU0ZFUl07CglzdHJ1Y3QgdXNiX3Jhd19ldmVudCAqZXZlbnQgPSAodm9pZCAqKXJhdzsKCglm
b3IgKDs7KSB7CgkJZXZlbnQtPmxlbmd0aCA9IEVQMF9NQVhfVFJBTlNGRVI7CgkJaWYgKGlvY3Rs
KHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVZFTlRfRkVUQ0gsIGV2ZW50KSA8IDApIHsK
CQkJaWYgKGVycm5vID09IEVJTlRSKQoJCQkJY29udGludWU7CgkJCXJldHVybjsKCQl9CgkJaWYg
KGV2ZW50LT50eXBlID09IFVTQl9SQVdfRVZFTlRfQ09OVFJPTCkKCQkJaGFuZGxlX2NvbnRyb2xf
cmVxdWVzdCgoc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqKWV2ZW50LT5kYXRhKTsKCQllbHNlIGlm
IChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0RJU0NPTk5FQ1QpCgkJCXJldHVybjsKCX0K
fQoKc3RhdGljIGludCBmaW5kX2ZyZWVfdWRjKGNoYXIgKmRyaXZlcl9uYW1lX291dCwgY2hhciAq
ZGV2aWNlX25hbWVfb3V0KQp7CglESVIgKnVkY19kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL3Vk
YyIpOwoJc3RydWN0IGRpcmVudCAqdWRjX2VudHJ5OwoJY2hhciAqaW5zdGFuY2Vfc3VmZml4OwoK
CWlmICghdWRjX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKHVkY19lbnRyeSA9IHJlYWRkaXIo
dWRjX2RpcikpKSB7CgkJaWYgKHVkY19lbnRyeS0+ZF9uYW1lWzBdID09ICcuJykKCQkJY29udGlu
dWU7CgkJc3RyY3B5KGRldmljZV9uYW1lX291dCwgdWRjX2VudHJ5LT5kX25hbWUpOwoJCXN0cmNw
eShkcml2ZXJfbmFtZV9vdXQsIHVkY19lbnRyeS0+ZF9uYW1lKTsKCQlpbnN0YW5jZV9zdWZmaXgg
PSBzdHJyY2hyKGRyaXZlcl9uYW1lX291dCwgJy4nKTsKCQlpZiAoaW5zdGFuY2Vfc3VmZml4KQoJ
CQkqaW5zdGFuY2Vfc3VmZml4ID0gMDsKCQljbG9zZWRpcih1ZGNfZGlyKTsKCQlyZXR1cm4gMDsK
CX0KCWNsb3NlZGlyKHVkY19kaXIpOwoJcmV0dXJuIC0xOwp9CgpzdGF0aWMgaW50IGZpbmRfc2k0
NzEzX2kyY19kZXZfbm9kZShjaGFyICpub2RlX291dCwgc2l6ZV90IG5vZGVfb3V0X3NpemUpCnsK
CURJUiAqaTJjX2Rldl9kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL2kyYy1kZXYiKTsKCXN0cnVj
dCBkaXJlbnQgKmkyY19kZXZfZW50cnk7CglpbnQgZm91bmQgPSAwOwoKCWlmICghaTJjX2Rldl9k
aXIpCgkJcmV0dXJuIC0xOwoJd2hpbGUgKChpMmNfZGV2X2VudHJ5ID0gcmVhZGRpcihpMmNfZGV2
X2RpcikpKSB7CgkJY2hhciBuYW1lX3BhdGhbNTEyXSwgYWRhcHRlcl9uYW1lWzEyOF07CgkJaW50
IG5hbWVfZmQsIG5hbWVfbGVuZ3RoOwoKCQlpZiAoaTJjX2Rldl9lbnRyeS0+ZF9uYW1lWzBdID09
ICcuJykKCQkJY29udGludWU7CgkJc25wcmludGYobmFtZV9wYXRoLCBzaXplb2YobmFtZV9wYXRo
KSwKCQkJICIvc3lzL2NsYXNzL2kyYy1kZXYvJXMvbmFtZSIsIGkyY19kZXZfZW50cnktPmRfbmFt
ZSk7CgkJbmFtZV9mZCA9IG9wZW4obmFtZV9wYXRoLCBPX1JET05MWSk7CgkJaWYgKG5hbWVfZmQg
PCAwKQoJCQljb250aW51ZTsKCQluYW1lX2xlbmd0aCA9IHJlYWQobmFtZV9mZCwgYWRhcHRlcl9u
YW1lLCBzaXplb2YoYWRhcHRlcl9uYW1lKSAtIDEpOwoJCWNsb3NlKG5hbWVfZmQpOwoJCWlmIChu
YW1lX2xlbmd0aCA8PSAwKQoJCQljb250aW51ZTsKCQlhZGFwdGVyX25hbWVbbmFtZV9sZW5ndGhd
ID0gMDsKCQlpZiAoc3Ryc3RyKGFkYXB0ZXJfbmFtZSwgInNpNDcxMyIpKSB7CgkJCXNucHJpbnRm
KG5vZGVfb3V0LCBub2RlX291dF9zaXplLCAiL2Rldi8lcyIsCgkJCQkgaTJjX2Rldl9lbnRyeS0+
ZF9uYW1lKTsKCQkJZm91bmQgPSAxOwoJCQlicmVhazsKCQl9Cgl9CgljbG9zZWRpcihpMmNfZGV2
X2Rpcik7CglyZXR1cm4gZm91bmQgPyAwIDogLTE7Cn0KCnN0YXRpYyB2b2lkIGZpcmVfemVyb19s
ZW5ndGhfaTJjX3dyaXRlKGNvbnN0IGNoYXIgKm5vZGUpCnsKCXN0cnVjdCBpMmNfbXNnIG1zZzsK
CXN0cnVjdCBpMmNfcmR3cl9pb2N0bF9kYXRhIHJkd3JfYXJnOwoJdWludDhfdCB1bnVzZWRfdXNl
cl9idWZmZXIgPSAwOwoJaW50IGkyY19mZCA9IG9wZW4obm9kZSwgT19SRFdSKTsKCglpZiAoaTJj
X2ZkIDwgMCkgewoJCXBlcnJvcigib3BlbiBpMmMgbm9kZSIpOwoJCXJldHVybjsKCX0KCW1lbXNl
dCgmbXNnLCAwLCBzaXplb2YobXNnKSk7Cgltc2cuYWRkciA9IFNJNDcxM19JMkNfQUREUkVTUzsK
CW1zZy5mbGFncyA9IDA7Cgltc2cubGVuID0gMDsKCW1zZy5idWYgPSAmdW51c2VkX3VzZXJfYnVm
ZmVyOwoJcmR3cl9hcmcubXNncyA9ICZtc2c7CglyZHdyX2FyZy5ubXNncyA9IDE7Cglpb2N0bChp
MmNfZmQsIEkyQ19SRFdSLCAmcmR3cl9hcmcpOwoJY2xvc2UoaTJjX2ZkKTsKfQoKaW50IG1haW4o
dm9pZCkKewoJY2hhciB1ZGNfZHJpdmVyX25hbWVbMTI4XSwgdWRjX2RldmljZV9uYW1lWzEyOF0s
IGkyY19ub2RlWzEyOF07CglzdHJ1Y3QgdXNiX3Jhd19pbml0IGluaXQ7CglwaWRfdCBnYWRnZXRf
cGlkOwoJaW50IGF0dGVtcHQ7CgoJc3lzdGVtKCJtb2Rwcm9iZSBkdW1teV9oY2QgMj4vZGV2L251
bGw7IG1vZHByb2JlIHJhd19nYWRnZXQgMj4vZGV2L251bGw7IgoJICAgICAgICIgbW9kcHJvYmUg
aTJjLWRldiAyPi9kZXYvbnVsbCIpOwoKCWlmIChmaW5kX2ZyZWVfdWRjKHVkY19kcml2ZXJfbmFt
ZSwgdWRjX2RldmljZV9uYW1lKSA8IDApIHsKCQlmcHJpbnRmKHN0ZGVyciwgIm5vIFVEQyBmb3Vu
ZFxuIik7CgkJcmV0dXJuIDE7Cgl9CgoJcmF3X2dhZGdldF9mZCA9IG9wZW4oIi9kZXYvcmF3LWdh
ZGdldCIsIE9fUkRXUik7CglpZiAocmF3X2dhZGdldF9mZCA8IDApIHsKCQlwZXJyb3IoIm9wZW4g
L2Rldi9yYXctZ2FkZ2V0Iik7CgkJcmV0dXJuIDE7Cgl9CgoJbWVtc2V0KCZpbml0LCAwLCBzaXpl
b2YoaW5pdCkpOwoJc3RybmNweSgoY2hhciAqKWluaXQuZHJpdmVyX25hbWUsIHVkY19kcml2ZXJf
bmFtZSwKCQlzaXplb2YoaW5pdC5kcml2ZXJfbmFtZSkgLSAxKTsKCXN0cm5jcHkoKGNoYXIgKilp
bml0LmRldmljZV9uYW1lLCB1ZGNfZGV2aWNlX25hbWUsCgkJc2l6ZW9mKGluaXQuZGV2aWNlX25h
bWUpIC0gMSk7Cglpbml0LnNwZWVkID0gVVNCX1NQRUVEX0hJR0g7CglpZiAoaW9jdGwocmF3X2dh
ZGdldF9mZCwgVVNCX1JBV19JT0NUTF9JTklULCAmaW5pdCkgPCAwKSB7CgkJcGVycm9yKCJVU0Jf
UkFXX0lPQ1RMX0lOSVQiKTsKCQlyZXR1cm4gMTsKCX0KCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2Zk
LCBVU0JfUkFXX0lPQ1RMX1JVTiwgMCkgPCAwKSB7CgkJcGVycm9yKCJVU0JfUkFXX0lPQ1RMX1JV
TiIpOwoJCXJldHVybiAxOwoJfQoKCWdhZGdldF9waWQgPSBmb3JrKCk7CglpZiAoZ2FkZ2V0X3Bp
ZCA9PSAwKSB7CgkJc2VydmVfZ2FkZ2V0X2NvbnRyb2xfcmVxdWVzdHMoKTsKCQlfZXhpdCgwKTsK
CX0KCglmb3IgKGF0dGVtcHQgPSAwOyBhdHRlbXB0IDwgMjAwOyBhdHRlbXB0KyspIHsKCQlpZiAo
ZmluZF9zaTQ3MTNfaTJjX2Rldl9ub2RlKGkyY19ub2RlLCBzaXplb2YoaTJjX25vZGUpKSA9PSAw
KSB7CgkJCWZpcmVfemVyb19sZW5ndGhfaTJjX3dyaXRlKGkyY19ub2RlKTsKCQkJYnJlYWs7CgkJ
fQoJCXVzbGVlcCg1MDAwMCk7Cgl9CgoJa2lsbChnYWRnZXRfcGlkLCA5KTsKCXdhaXRwaWQoZ2Fk
Z2V0X3BpZCwgTlVMTCwgMCk7CgljbG9zZShyYXdfZ2FkZ2V0X2ZkKTsKCXJldHVybiAwOwp9Cg==
--00000000000072b130065b3873c2--
