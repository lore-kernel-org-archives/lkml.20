Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74E4CCDCF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157914; cv=pass; b=ql9Wp4YRzcC4L81S394QlSRbXyU5eBXm6pqUzlNpP6cITY+7CknTjuJfx6dJ97HACrdbAq5cXQw/nR8C2eFKm19LpBQGTrzeDCuxyjRwRswq1REeCBd+/xWqTMh4hs0TfhjVgCIsi3NtU4/tJzzbndNldj6+v0dyxnRtx+6yXp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157914; c=relaxed/simple;
	bh=f+/BATksF101PiQ4VBnNYC++Ljl43ohDMA8uKkDF5V0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OC/JNNl2CYJoqaVCkrfH5idr1QNggHbig+fmoJASwph1x7aNGuriZ8W23HDk8q4t5ZmDfe4k/3JT2us/AYBBZ0lXMB5hB4Pza1vOp7qdXM4lV8LGdJq7OgcP4NkbvROGaZsrcUJWCHl5t9l0csJxrh47F3tDC82Wy+jZKAK/HSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=q0ILnHKe; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="q0ILnHKe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1679630a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789157912; cv=none;
        d=google.com; s=arc-20260327;
        b=FCYsbMthfu79dasx8wHFNuI3X4H103zspoJ4R9P+zfCReqJ5k4RWKwn48ycqsyFR/N
         /gEbMt5Q07mZm7fESlkVdD4xcmQgOchkmYIbcL0Hmi58O1cuVsPPHBip4Ga3i6gaSvx/
         QsenjvUYGqSBwVNRsaQ9D0xLHNDfJEeO6YuTlJ9w4Rz5gYfWGFZ2C1dlGcNOXWw2vVTe
         Q48CxpX3RZi1v3CslbwRuU/x4nDpnYjK0hrtd6rdjaQRW6C8ZaUp9TSBxW6FLpPxqc9o
         qor2CKzijq9nvsY/ArRO67vm9Nk53crnX+7TXyx59k9UDj2B+cdFiuDZPemNYgL+Y1SR
         X8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JlK46Z7AAwQOC8kmblUqtKoU0jTkGe9eePBo2toy0+M=;
        fh=G3FlY3ut/MbegFBPdUmtL6Ysch3BQVspd9ruCqMSNWA=;
        b=AmL2VlxVbBniV7k2yAnEDgM0qymL6T73ocKgZsy5BgX9O9hdXkgaZy0TEI5fDnmjvy
         EI1fBKqiGl0LE+wW/RvCJmAJZjOE2uYCtnfSxitdIIPhrTEJyq97Iw8ccLPP7aax2ZC9
         aIBo6lGBWnthO87gMmsvenQLK7c7tPDDGI4g2EOwPXjj+wkSNXNgCcL+aOi/YYoByyrZ
         6GydATDgj7mMt7/Vw97uOXbZPtKeILqleemM5M8JTc3WfKZpEMfzjrQtSPzfrGFaDiJ1
         xp9aQRgh2McRWrZyCh6UIoQAdaN72A169g64pUJlFI4f30Ahc9ZTm2oEKMGKY7EIoWKI
         E9mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789157912; x=1789762712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlK46Z7AAwQOC8kmblUqtKoU0jTkGe9eePBo2toy0+M=;
        b=q0ILnHKe1H2Sk2dnaHGu0yLXdFkmTObLVdETCT58QHzg/6V/jAzHu75XX02F0LIz76
         j5QJ2VZs2qmh72V81Wg07k3WsM5U93I038VqXDnc0A0m5LzhMvYtjenFAmePIMHzMl51
         w3s5ppcxvK9IiqPCWYs6q4rK7c8hEojP4a6zp7EdX9EfTJ2I7oqj44FZ2sIf+7/zOxsW
         u30EADZjDOWoY7d9y55vqHaP1yoq/1P12uKdWlq7NPKJFUbPbBBHUTM3SAm5dYrzN/+C
         R+X48dldJnt3AgcDSZYdExmfjtKGiHcV3RLq9iGgv/eU8brV3UMoCfVRK88XKBYIaeDi
         tboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157912; x=1789762712;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JlK46Z7AAwQOC8kmblUqtKoU0jTkGe9eePBo2toy0+M=;
        b=rHdsmOB16KpNtAPvRQPH0E93O8LyP151odxQHZ3NVVKBLHwTW9BC8Wsaj0v2uKo6K1
         CWV3nE/jciOviSdBToGVO58fLSO3+Yzm8brEiMcUBj2iEOmpbzWc98NCQG6go0HrC17q
         3o/kHUMUw3p5aA6i1pM1aSfZLzYhp9jT6O0dvY7BTESChXh27d+zFYYhB6ZyE7WcrrUv
         lScb5K5usRXpe4qj14l/NOMv6Umo4Qc+Lfw3rmJ3TJ39y1ZS6etnAwbo0xlWWHqNTCIT
         8ie1A9kvXo9voo/VDYIa4BngNPSAbvjHZ6UqdV5Y0awhc5tGzMf6Dsf4ZqdW8ip63I7w
         DjMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyeNbaoxxFv2uILgdmuNQjx6nQ6xU9M6ipL+X7eo32lxRY7qJFP38Sy0DtyhPcHVbs/LwDPJ/vYlPQGN4=@vger.kernel.org
X-Gm-Message-State: AFuF++mYhVayOqdtepW4oSUzFz27Y1A6S4GnQ3QkfPUGf7O5pYy7DHEt
	5QYGhBHfXjUCPyYH62VLs5Nv/BkXPAd7drQwGEBJ88uPqyJKI/q5yhDXbf3xQ+Gfk4gCkgYOJt/
	+qrNzrL0ZSrYWB7ONVdtQvt/OeQQlrTCAvSupnypElF8lKrI3mt83lKYa
X-Gm-Gg: AYBFou0u8Ux2iO9bUXvj9ZATp9xXa8oqBz/3+Shy6WG58+VPo4W+aRR+XraXQT0o6TM
	RxR3l4daYxkpxw4qrR5O+kPs9LWjp6GHRaQ7x5NQsSIrJX3U7NSeNF6Vn1g8Ixs8qnhbrZepQGr
	fTpVNPBSw/WGhBQS1fxMU5COLQmIJPN6Ha6OhilnUW8oYaTE+vz9e0ew/Zb7XLCcM5ruLJioK9s
	3BYNdToEi+mrHMm6efc3H1VqjF0o+tFwUO2sxiG7gPlMgX+R52ML9W4y8Z8mk8dHWEGuPSoA0HK
	wDFEEKLdflpHIPZDz0v05Aa2xNqlSgO9emLLGhEXN2YNrTb4XJx1fAKjeXGcdHA55oTTq1e4P9L
	gnafUNQqII/S+/B+JUvCy8oIMoGpLcPaiVgjw1YDT65bMAL+8XDfeweSUqD6ATIZZ6jpqEwO1Wp
	QexGRcV3I5UQ==
X-Received: by 2002:a17:90a:10d6:b0:39d:b769:3067 with SMTP id
 98e67ed59e1d1-39db7693418mr918578a91.0.1789157911414; Fri, 11 Sep 2026
 13:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 13:18:20 -0700
X-Gm-Features: AcwNN1WbvY_5_8C6CIuOyqSIg4bkKoWEh0CxgchoPxYFi4fCcd8J7GOVUiRfeA0
Message-ID: <CA+0ovCgMnZ_MQK81D167zBJ-3Rj1ku7kRvyUsm-DaZgrPRLR3Q@mail.gmail.com>
Subject: [BUG] general protection fault in stv06xx_write_sensor
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000c2ad1d065b3ac92e"

--000000000000c2ad1d065b3ac92e
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   45.011080][ T9488] Oops: general protection fault, probably for
non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
[   45.012184][ T9488] KASAN: null-ptr-deref in range
[0x0000000000000020-0x0000000000000027]
[   45.012951][ T9488] CPU: 1 UID: 0 PID: 9488 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   45.013900][ T9488] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   45.014860][ T9488] RIP: 0010:stv06xx_write_sensor+0xa0/0x190
[   45.015416][ T9488] Code: a3 28 0d 00 00 4c 89 e0 48 c1 e8 03 42 80
3c 28 00 74 08 4c 89 e7 e8 7f b7 ff f9 4d 8b 24 24 49 83 c4 22 4c 89
e0 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 b9 00 00 00 45 0f b6 24 24
bf 02 00 00
[   45.017145][ T9488] RSP: 0018:ffffc9000388f420 EFLAGS: 00010202
[   45.017703][ T9488] RAX: 0000000000000004 RBX: ffff88802c616000
RCX: ffff8881096c2640
[   45.018417][ T9488] RDX: 0000000000000000 RSI: 0000000000000001
RDI: ffff88802c616000
[   45.019193][ T9488] RBP: ffffc9000388f4d0 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   45.019939][ T9488] R10: dffffc0000000000 R11: fffffbfff20ac7b0
R12: 0000000000000022
[   45.020655][ T9488] R13: dffffc0000000000 R14: 1ffff92000711e88
R15: 0000000000000001
[   45.021370][ T9488] FS:  00007f1761e486c0(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   45.022173][ T9488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   45.022771][ T9488] CR2: 000055f682688a50 CR3: 000000002bf7b000
CR4: 0000000000752ef0
[   45.023489][ T9488] PKRU: 55555554
[   45.023820][ T9488] Call Trace:
[   45.024132][ T9488]  <TASK>
[   45.024411][ T9488]  ? __pfx_stv06xx_write_sensor+0x10/0x10
[   45.024938][ T9488]  ? usb_ifnum_to_if+0x262/0x2f0
[   45.025400][ T9488]  ? usb_altnum_to_altsetting+0xe3/0x120
[   45.025917][ T9488]  pb0100_start+0x27b/0x4c0
[   45.026335][ T9488]  stv06xx_start+0x2a3/0x6b0
[   45.026765][ T9488]  gspca_init_transfer+0x2470/0x3060
[   45.027255][ T9488]  ? __pfx_gspca_init_transfer+0x10/0x10
[   45.027771][ T9488]  ? add_lock_to_list+0xc7/0x100
[   45.028229][ T9488]  ? __lock_acquire+0x74c/0x2db0
[   45.028756][ T9488]  ? __pfx_do_raw_spin_lock+0x10/0x10
[   45.029245][ T9488]  ? __pfx_gspca_start_streaming+0x10/0x10
[   45.029779][ T9488]  gspca_start_streaming+0x6f/0x250
[   45.030254][ T9488]  ? _raw_spin_unlock_irqrestore+0x30/0x80
[   45.030795][ T9488]  ? __pfx_gspca_start_streaming+0x10/0x10
[   45.031326][ T9488]  vb2_start_streaming+0x128/0x460
[   45.031798][ T9488]  vb2_core_streamon+0x2e0/0x4f0
[   45.032255][ T9488]  __vb2_init_fileio+0xca2/0xff0
[   45.032716][ T9488]  __vb2_perform_fileio+0x282/0x1620
[   45.033199][ T9488]  ? __lock_acquire+0x74c/0x2db0
[   45.033657][ T9488]  vb2_fop_read+0x273/0x360
[   45.034073][ T9488]  v4l2_read+0x19c/0x2c0
[   45.034463][ T9488]  ? __pfx_v4l2_read+0x10/0x10
[   45.034905][ T9488]  vfs_read+0x20c/0xa70
[   45.035290][ T9488]  ? __pfx_vfs_read+0x10/0x10
[   45.035725][ T9488]  ? __fget_files+0x2a/0x420
[   45.036149][ T9488]  ? __fget_files+0x2a/0x420
[   45.036575][ T9488]  ? __fget_files+0x3a0/0x420
[   45.037004][ T9488]  ? __fget_files+0x2a/0x420
[   45.037428][ T9488]  ksys_read+0x150/0x270
[   45.037821][ T9488]  ? __pfx_ksys_read+0x10/0x10
[   45.038261][ T9488]  do_syscall_64+0x155/0x510
[   45.038758][ T9488]  ? trace_irq_disable+0x3b/0x140
[   45.039220][ T9488]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.039775][ T9488]  ? clear_bhb_loop+0x30/0x80
[   45.040207][ T9488]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   45.040747][ T9488] RIP: 0033:0x45e2b2
[   45.041112][ T9488] Code: 08 0f 85 11 eb ff ff 49 89 fb 48 89 f0 48
89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89
5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa
55 48 89 e5
[   45.042833][ T9488] RSP: 002b:00007f1761e47118 EFLAGS: 00000246
ORIG_RAX: 0000000000000000
[   45.043584][ T9488] RAX: ffffffffffffffda RBX: 00007f1761e486c0
RCX: 000000000045e2b2
[   45.044294][ T9488] RDX: 0000000000001000 RSI: 00007f1761e471d0
RDI: 0000000000000004
[   45.045007][ T9488] RBP: 00007f1761e47140 R08: 0000000000000000
R09: 0000000000000000
[   45.045721][ T9488] R10: 0000000000000000 R11: 0000000000000246
R12: 00007f1761e486c0
[   45.046430][ T9488] R13: 00007ffdbfd8c180 R14: 00007f1761e48ce4
R15: 00007ffdbfd8c277
[   45.047145][ T9488]  </TASK>
[   45.047431][ T9488] Modules linked in:
[   45.047847][ T9488] ---[ end trace 0000000000000000 ]---
[   45.048378][ T9488] RIP: 0010:stv06xx_write_sensor+0xa0/0x190
[   45.048391][ T9488] Code: a3 28 0d 00 00 4c 89 e0 48 c1 e8 03 42 80
3c 28 00 74 08 4c 89 e7 e8 7f b7 ff f9 4d 8b 24 24 49 83 c4 22 4c 89
e0 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 b9 00 00 00 45 0f b6 24 24
bf 02 00 00
[   45.048397][ T9488] RSP: 0018:ffffc9000388f420 EFLAGS: 00010202
[   45.048403][ T9488] RAX: 0000000000000004 RBX: ffff88802c616000
RCX: ffff8881096c2640
[   45.048408][ T9488] RDX: 0000000000000000 RSI: 0000000000000001
RDI: ffff88802c616000
[   45.048412][ T9488] RBP: ffffc9000388f4d0 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   45.048417][ T9488] R10: dffffc0000000000 R11: fffffbfff20ac7b0
R12: 0000000000000022
[   45.048422][ T9488] R13: dffffc0000000000 R14: 1ffff92000711e88
R15: 0000000000000001
[   45.048427][ T9488] FS:  00007f1761e486c0(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   45.048433][ T9488] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   45.048437][ T9488] CR2: 000055f682688a50 CR3: 000000002bf7b000
CR4: 0000000000752ef0
[   45.048443][ T9488] PKRU: 55555554
[   45.048449][ T9488] Kernel panic - not syncing: Fatal exception
[   45.058375][ T9488] Kernel Offset: disabled
[   45.058962][ T9488] Rebooting in 86400 seconds..

Regards,

--000000000000c2ad1d065b3ac92e
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxeeyrb0>
X-Attachment-Id: f_mtxeeyrb0

LyoKICogMjgzLWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1zdHYwNnh4LXdyaXRlLXNlbnNv
cgogKi8KI2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxm
Y250bC5oPgojaW5jbHVkZSA8cHRocmVhZC5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRl
IDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1
ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDx0aW1lLmg+CiNp
bmNsdWRlIDx1bmlzdGQuaD4KCiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxs
aW51eC91c2IvcmF3X2dhZGdldC5oPgoKI2RlZmluZSBFUDBfTUFYX1RSQU5TRkVSIDQwOTYKI2Rl
ZmluZSBTVFZfSVNPX1NJWkVfTCAweDE1YzEKCnN0YXRpYyBpbnQgcmF3X2dhZGdldF9mZCA9IC0x
OwpzdGF0aWMgdm9sYXRpbGUgaW50IHNhd19pc29fc2l6ZV93cml0ZTsKc3RhdGljIHZvbGF0aWxl
IGludCBjb250cm9sX3JlcXVlc3RzX3NpbmNlX2lzb19zaXplOwoKc3RhdGljIHVpbnQ2NF90IG5v
d19tcyh2b2lkKQp7CglzdHJ1Y3QgdGltZXNwZWMgdHM7CgljbG9ja19nZXR0aW1lKENMT0NLX01P
Tk9UT05JQywgJnRzKTsKCXJldHVybiAodWludDY0X3QpdHMudHZfc2VjICogMTAwMCArIHRzLnR2
X25zZWMgLyAxMDAwMDAwOwp9CgpzdGF0aWMgc3RydWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciBk
ZXZpY2VfZGVzY3JpcHRvciA9IHsKCS5iTGVuZ3RoID0gc2l6ZW9mKHN0cnVjdCB1c2JfZGV2aWNl
X2Rlc2NyaXB0b3IpLAoJLmJEZXNjcmlwdG9yVHlwZSA9IFVTQl9EVF9ERVZJQ0UsCgkuYmNkVVNC
ID0gMHgwMTEwLAoJLmJNYXhQYWNrZXRTaXplMCA9IDY0LAoJLmlkVmVuZG9yID0gMHgwNDZkLAoJ
LmlkUHJvZHVjdCA9IDB4MDg0MCwKCS5iTnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKI2RlZmlu
ZSBMRTE2KHYpICgodikgJiAweGZmKSwgKCgodikgPj4gOCkgJiAweGZmKQoKc3RhdGljIGNvbnN0
IHVpbnQ4X3QgY29uZmlndXJhdGlvbl9kZXNjcmlwdG9yW10gPSB7Cgk5LCBVU0JfRFRfQ09ORklH
LCBMRTE2KDkgKyA5ICsgOSArIDcpLCAxLCAxLCAwLCAweDgwLCAweGZhLAoJOSwgVVNCX0RUX0lO
VEVSRkFDRSwgMCwgMCwgMCwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCTksIFVTQl9EVF9JTlRFUkZB
Q0UsIDAsIDEsIDEsIDB4ZmYsIDB4ZmYsIDB4ZmYsIDAsCgk3LCBVU0JfRFRfRU5EUE9JTlQsIDB4
ODEsIFVTQl9FTkRQT0lOVF9YRkVSX0lTT0MsIExFMTYoMTAyMyksIDEsCn07CgpzdGF0aWMgdm9p
ZCAqdW5iaW5kX3N0djA2eHhfZHJpdmVyX3RocmVhZCh2b2lkICp1bnVzZWQpOwoKc3RhdGljIHZv
aWQgZXAwX3dyaXRlKGNvbnN0IHZvaWQgKmRhdGEsIHVpbnQzMl90IGxlbmd0aCkKewoJdWludDhf
dCBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSArIEVQMF9NQVhfVFJBTlNGRVJd
OwoJc3RydWN0IHVzYl9yYXdfZXBfaW8gKmlvID0gKHZvaWQgKilidWZmZXI7CgoJaW8tPmVwID0g
MDsKCWlvLT5mbGFncyA9IDA7Cglpby0+bGVuZ3RoID0gbGVuZ3RoOwoJbWVtY3B5KGlvLT5kYXRh
LCBkYXRhLCBsZW5ndGgpOwoJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBf
V1JJVEUsIGlvKTsKfQoKc3RhdGljIHZvaWQgZXAwX3JlYWQodWludDMyX3QgbGVuZ3RoKQp7Cgl1
aW50OF90IGJ1ZmZlcltzaXplb2Yoc3RydWN0IHVzYl9yYXdfZXBfaW8pICsgRVAwX01BWF9UUkFO
U0ZFUl07CglzdHJ1Y3QgdXNiX3Jhd19lcF9pbyAqaW8gPSAodm9pZCAqKWJ1ZmZlcjsKCglpby0+
ZXAgPSAwOwoJaW8tPmZsYWdzID0gMDsKCWlvLT5sZW5ndGggPSBsZW5ndGggPiBFUDBfTUFYX1RS
QU5TRkVSID8gRVAwX01BWF9UUkFOU0ZFUiA6IGxlbmd0aDsKCWlvY3RsKHJhd19nYWRnZXRfZmQs
IFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsIGlvKTsKfQoKc3RhdGljIHZvaWQgaGFuZGxlX2NvbnRy
b2woY29uc3Qgc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqY3RybCkKewoJdWludDhfdCBkYXRhW0VQ
MF9NQVhfVFJBTlNGRVJdOwoJaW50IGxlbmd0aCA9IC0xOwoKCW1lbXNldChkYXRhLCAwLCBzaXpl
b2YoZGF0YSkpOwoKCWlmICgoY3RybC0+YlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFTSykgPT0g
VVNCX1RZUEVfU1RBTkRBUkQpIHsKCQlzd2l0Y2ggKGN0cmwtPmJSZXF1ZXN0KSB7CgkJY2FzZSBV
U0JfUkVRX0dFVF9ERVNDUklQVE9SOgoJCQlpZiAoKGN0cmwtPndWYWx1ZSA+PiA4KSA9PSBVU0Jf
RFRfREVWSUNFKSB7CgkJCQlsZW5ndGggPSBzaXplb2YoZGV2aWNlX2Rlc2NyaXB0b3IpOwoJCQkJ
bWVtY3B5KGRhdGEsICZkZXZpY2VfZGVzY3JpcHRvciwgbGVuZ3RoKTsKCQkJfSBlbHNlIGlmICgo
Y3RybC0+d1ZhbHVlID4+IDgpID09IFVTQl9EVF9DT05GSUcpIHsKCQkJCWxlbmd0aCA9IHNpemVv
Zihjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3IpOwoJCQkJbWVtY3B5KGRhdGEsIGNvbmZpZ3VyYXRp
b25fZGVzY3JpcHRvciwgbGVuZ3RoKTsKCQkJfQoJCQlicmVhazsKCQljYXNlIFVTQl9SRVFfU0VU
X0NPTkZJR1VSQVRJT046CgkJCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfQ09O
RklHVVJFLCAwKTsKCQkJbGVuZ3RoID0gMDsKCQkJYnJlYWs7CgkJY2FzZSBVU0JfUkVRX1NFVF9J
TlRFUkZBQ0U6CgkJCWxlbmd0aCA9IDA7CgkJCWJyZWFrOwoJCX0KCX0gZWxzZSBpZiAoY3RybC0+
YlJlcXVlc3RUeXBlID09IDB4YzAgJiYgY3RybC0+YlJlcXVlc3QgPT0gMHgwNCkgewoKCQlpZiAo
Y3RybC0+d1ZhbHVlID09IDB4MTQxMCAmJiBjdHJsLT53TGVuZ3RoID09IDIpIHsKCQkJZGF0YVsx
XSA9IDB4NjQ7CgkJCWxlbmd0aCA9IDI7CgkJfSBlbHNlIHsKCQkJbGVuZ3RoID0gY3RybC0+d0xl
bmd0aCA+IEVQMF9NQVhfVFJBTlNGRVIgPwoJCQkJIEVQMF9NQVhfVFJBTlNGRVIgOiBjdHJsLT53
TGVuZ3RoOwoJCX0KCX0gZWxzZSBpZiAoY3RybC0+YlJlcXVlc3RUeXBlID09IDB4NDAgJiYgY3Ry
bC0+YlJlcXVlc3QgPT0gMHgwNCkgewoJCWlmIChjdHJsLT53VmFsdWUgPT0gU1RWX0lTT19TSVpF
X0wpCgkJCXNhd19pc29fc2l6ZV93cml0ZSA9IDE7CgkJbGVuZ3RoID0gMDsKCX0KCglpZiAoc2F3
X2lzb19zaXplX3dyaXRlICYmIGNvbnRyb2xfcmVxdWVzdHNfc2luY2VfaXNvX3NpemUgPT0gMSkg
ewoJCXB0aHJlYWRfdCB1bmJpbmRfdGhyZWFkOwoKCQlwdGhyZWFkX2NyZWF0ZSgmdW5iaW5kX3Ro
cmVhZCwgTlVMTCwKCQkJICAgICAgIHVuYmluZF9zdHYwNnh4X2RyaXZlcl90aHJlYWQsIE5VTEwp
OwoJCXB0aHJlYWRfZGV0YWNoKHVuYmluZF90aHJlYWQpOwoJCXVzbGVlcCgzMDAwMDApOwoJfQoK
CWlmIChsZW5ndGggPCAwKSB7CgkJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9F
UDBfU1RBTEwsIDApOwoJfSBlbHNlIGlmIChjdHJsLT5iUmVxdWVzdFR5cGUgJiBVU0JfRElSX0lO
KSB7CgkJaWYgKGxlbmd0aCA+IGN0cmwtPndMZW5ndGgpCgkJCWxlbmd0aCA9IGN0cmwtPndMZW5n
dGg7CgkJZXAwX3dyaXRlKGRhdGEsICh1aW50MzJfdClsZW5ndGgpOwoJfSBlbHNlIHsKCQllcDBf
cmVhZChjdHJsLT53TGVuZ3RoKTsKCX0KCglpZiAoc2F3X2lzb19zaXplX3dyaXRlKQoJCWNvbnRy
b2xfcmVxdWVzdHNfc2luY2VfaXNvX3NpemUrKzsKfQoKc3RhdGljIHZvaWQgKnVuYmluZF9zdHYw
Nnh4X2RyaXZlcl90aHJlYWQodm9pZCAqdW51c2VkKQp7CglESVIgKmRyaXZlcl9kaXI7CglzdHJ1
Y3QgZGlyZW50ICplbnRyeTsKCWNoYXIgaW50ZXJmYWNlX25hbWVbNjRdID0gIiI7CglpbnQgdW5i
aW5kX2ZkOwoKCWRyaXZlcl9kaXIgPSBvcGVuZGlyKCIvc3lzL2J1cy91c2IvZHJpdmVycy9TVFYw
Nnh4Iik7CglpZiAoIWRyaXZlcl9kaXIpCgkJcmV0dXJuIE5VTEw7Cgl3aGlsZSAoKGVudHJ5ID0g
cmVhZGRpcihkcml2ZXJfZGlyKSkpIHsKCQlpZiAoc3Ryc3RyKGVudHJ5LT5kX25hbWUsICI6MS4w
IikpIHsKCQkJc25wcmludGYoaW50ZXJmYWNlX25hbWUsIHNpemVvZihpbnRlcmZhY2VfbmFtZSks
ICIlcyIsCgkJCQkgZW50cnktPmRfbmFtZSk7CgkJCWJyZWFrOwoJCX0KCX0KCWNsb3NlZGlyKGRy
aXZlcl9kaXIpOwoJaWYgKCFpbnRlcmZhY2VfbmFtZVswXSkKCQlyZXR1cm4gTlVMTDsKCXVuYmlu
ZF9mZCA9IG9wZW4oIi9zeXMvYnVzL3VzYi9kcml2ZXJzL1NUVjA2eHgvdW5iaW5kIiwgT19XUk9O
TFkpOwoJaWYgKHVuYmluZF9mZCA8IDApCgkJcmV0dXJuIE5VTEw7CgoJKHZvaWQpIXdyaXRlKHVu
YmluZF9mZCwgaW50ZXJmYWNlX25hbWUsIHN0cmxlbihpbnRlcmZhY2VfbmFtZSkpOwoJY2xvc2Uo
dW5iaW5kX2ZkKTsKCXJldHVybiBOVUxMOwp9CgpzdGF0aWMgdm9pZCB3YWtlX2Jsb2NrZWRfZXZl
bnRfZmV0Y2goaW50IHNpZ25hbF9udW1iZXIpIHsgfQoKc3RhdGljIGludCBmaW5kX2R1bW15X3Vk
YyhjaGFyICpkcml2ZXJfbmFtZSwgc2l6ZV90IGRyaXZlcl9uYW1lX3NpemUsCgkJCSAgY2hhciAq
ZGV2aWNlX25hbWUsIHNpemVfdCBkZXZpY2VfbmFtZV9zaXplKQp7CglESVIgKnVkY19kaXIgPSBv
cGVuZGlyKCIvc3lzL2NsYXNzL3VkYyIpOwoJc3RydWN0IGRpcmVudCAqZW50cnk7CgljaGFyICpp
bnN0YW5jZV9zdWZmaXg7CgoJaWYgKCF1ZGNfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgoZW50
cnkgPSByZWFkZGlyKHVkY19kaXIpKSkgewoJCWlmIChlbnRyeS0+ZF9uYW1lWzBdID09ICcuJykK
CQkJY29udGludWU7CgkJc25wcmludGYoZGV2aWNlX25hbWUsIGRldmljZV9uYW1lX3NpemUsICIl
cyIsIGVudHJ5LT5kX25hbWUpOwoJCXNucHJpbnRmKGRyaXZlcl9uYW1lLCBkcml2ZXJfbmFtZV9z
aXplLCAiJXMiLCBlbnRyeS0+ZF9uYW1lKTsKCQlpbnN0YW5jZV9zdWZmaXggPSBzdHJyY2hyKGRy
aXZlcl9uYW1lLCAnLicpOwoJCWlmIChpbnN0YW5jZV9zdWZmaXgpCgkJCSppbnN0YW5jZV9zdWZm
aXggPSAwOwoJCWNsb3NlZGlyKHVkY19kaXIpOwoJCXJldHVybiAwOwoJfQoJY2xvc2VkaXIodWRj
X2Rpcik7CglyZXR1cm4gLTE7Cn0KCnN0YXRpYyBpbnQgZmluZF9zdHYwNnh4X3ZpZGVvX25vZGUo
Y2hhciAqb3V0LCBzaXplX3Qgb3V0X3NpemUpCnsKCURJUiAqdjRsX2RpciA9IG9wZW5kaXIoIi9z
eXMvY2xhc3MvdmlkZW80bGludXgiKTsKCXN0cnVjdCBkaXJlbnQgKmVudHJ5OwoJaW50IGZvdW5k
ID0gLTE7CgoJaWYgKCF2NGxfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICgoZW50cnkgPSByZWFk
ZGlyKHY0bF9kaXIpKSkgewoJCWNoYXIgcGF0aFs1MTJdLCBkcml2ZXJfbmFtZVsxMjhdLCBsaW5r
X3RhcmdldFsxMDI0XTsKCQlpbnQgbmFtZV9mZCwgbmFtZV9sZW5ndGg7CgkJc3NpemVfdCBsaW5r
X2xlbmd0aDsKCgkJaWYgKHN0cm5jbXAoZW50cnktPmRfbmFtZSwgInZpZGVvIiwgNSkpCgkJCWNv
bnRpbnVlOwoJCXNucHJpbnRmKHBhdGgsIHNpemVvZihwYXRoKSwKCQkJICIvc3lzL2NsYXNzL3Zp
ZGVvNGxpbnV4LyVzL25hbWUiLCBlbnRyeS0+ZF9uYW1lKTsKCQluYW1lX2ZkID0gb3BlbihwYXRo
LCBPX1JET05MWSk7CgkJaWYgKG5hbWVfZmQgPCAwKQoJCQljb250aW51ZTsKCQluYW1lX2xlbmd0
aCA9IHJlYWQobmFtZV9mZCwgZHJpdmVyX25hbWUsCgkJCQkgICBzaXplb2YoZHJpdmVyX25hbWUp
IC0gMSk7CgkJY2xvc2UobmFtZV9mZCk7CgkJaWYgKG5hbWVfbGVuZ3RoIDw9IDApCgkJCWNvbnRp
bnVlOwoJCWRyaXZlcl9uYW1lW25hbWVfbGVuZ3RoXSA9IDA7CgkJaWYgKCFzdHJzdHIoZHJpdmVy
X25hbWUsICJnc3BjYSIpICYmCgkJICAgICFzdHJzdHIoZHJpdmVyX25hbWUsICJzdHYwNnh4Iikp
CgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKHBhdGgsIHNpemVvZihwYXRoKSwgIi9zeXMvY2xhc3Mv
dmlkZW80bGludXgvJXMiLAoJCQkgZW50cnktPmRfbmFtZSk7CgkJbGlua19sZW5ndGggPSByZWFk
bGluayhwYXRoLCBsaW5rX3RhcmdldCwKCQkJCSAgICAgICBzaXplb2YobGlua190YXJnZXQpIC0g
MSk7CgkJaWYgKGxpbmtfbGVuZ3RoIDw9IDApCgkJCWNvbnRpbnVlOwoJCWxpbmtfdGFyZ2V0W2xp
bmtfbGVuZ3RoXSA9IDA7CgkJaWYgKCFzdHJzdHIobGlua190YXJnZXQsICJkdW1teV9oY2QiKSkK
CQkJY29udGludWU7CgkJc25wcmludGYob3V0LCBvdXRfc2l6ZSwgIi9kZXYvJXMiLCBlbnRyeS0+
ZF9uYW1lKTsKCQlmb3VuZCA9IDA7CgkJYnJlYWs7Cgl9CgljbG9zZWRpcih2NGxfZGlyKTsKCXJl
dHVybiBmb3VuZDsKfQoKc3RhdGljIHZvaWQgKnN0cmVhbV9zdGFydF92aWFfcmVhZF90aHJlYWQo
dm9pZCAqdW51c2VkKQp7Cgl1aW50NjRfdCBkZWFkbGluZSA9IG5vd19tcygpICsgNDAwMDsKCWNo
YXIgbm9kZVs2NF0sIGZyYW1lX2J1ZmZlcls0MDk2XTsKCWludCB2aWRlb19mZCA9IC0xOwoKCXdo
aWxlIChub3dfbXMoKSA8IGRlYWRsaW5lKSB7CgkJaWYgKGZpbmRfc3R2MDZ4eF92aWRlb19ub2Rl
KG5vZGUsIHNpemVvZihub2RlKSkgPT0gMCkgewoJCQl2aWRlb19mZCA9IG9wZW4obm9kZSwgT19S
RE9OTFkpOwoJCQlpZiAodmlkZW9fZmQgPj0gMCkKCQkJCWJyZWFrOwoJCX0KCQl1c2xlZXAoMTAw
MDApOwoJfQoJaWYgKHZpZGVvX2ZkIDwgMCkKCQlyZXR1cm4gTlVMTDsKCSh2b2lkKSFyZWFkKHZp
ZGVvX2ZkLCBmcmFtZV9idWZmZXIsIHNpemVvZihmcmFtZV9idWZmZXIpKTsKCWNsb3NlKHZpZGVv
X2ZkKTsKCXJldHVybiBOVUxMOwp9CgppbnQgbWFpbih2b2lkKQp7CgljaGFyIHVkY19kcml2ZXJf
bmFtZVsxMjhdLCB1ZGNfZGV2aWNlX25hbWVbMTI4XTsKCXN0cnVjdCB1c2JfcmF3X2luaXQgaW5p
dDsKCXVpbnQ4X3QgZXZlbnRfYnVmZmVyW3NpemVvZihzdHJ1Y3QgdXNiX3Jhd19ldmVudCkgKyBF
UDBfTUFYX1RSQU5TRkVSXTsKCXN0cnVjdCB1c2JfcmF3X2V2ZW50ICpldmVudCA9ICh2b2lkICop
ZXZlbnRfYnVmZmVyOwoJcHRocmVhZF90IHJlYWRfdGhyZWFkOwoJdWludDY0X3QgZGVhZGxpbmU7
CgoJc3lzdGVtKCJtb2Rwcm9iZSBkdW1teV9oY2QgPi9kZXYvbnVsbCAyPiYxIik7CglzeXN0ZW0o
Im1vZHByb2JlIHJhd19nYWRnZXQgPi9kZXYvbnVsbCAyPiYxIik7Cgl1c2xlZXAoMjAwMDAwKTsK
CglpZiAoZmluZF9kdW1teV91ZGModWRjX2RyaXZlcl9uYW1lLCBzaXplb2YodWRjX2RyaXZlcl9u
YW1lKSwKCQkJICAgdWRjX2RldmljZV9uYW1lLCBzaXplb2YodWRjX2RldmljZV9uYW1lKSkgPCAw
KSB7CgkJZnByaW50ZihzdGRlcnIsICJubyBVREMgdW5kZXIgL3N5cy9jbGFzcy91ZGNcbiIpOwoJ
CXJldHVybiAxOwoJfQoKCXJhd19nYWRnZXRfZmQgPSBvcGVuKCIvZGV2L3Jhdy1nYWRnZXQiLCBP
X1JEV1IpOwoJaWYgKHJhd19nYWRnZXRfZmQgPCAwKSB7CgkJcGVycm9yKCJvcGVuKC9kZXYvcmF3
LWdhZGdldCkiKTsKCQlyZXR1cm4gMTsKCX0KCW1lbXNldCgmaW5pdCwgMCwgc2l6ZW9mKGluaXQp
KTsKCXN0cm5jcHkoKGNoYXIgKilpbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25hbWUsCgkJ
c2l6ZW9mKGluaXQuZHJpdmVyX25hbWUpIC0gMSk7CglzdHJuY3B5KChjaGFyICopaW5pdC5kZXZp
Y2VfbmFtZSwgdWRjX2RldmljZV9uYW1lLAoJCXNpemVvZihpbml0LmRldmljZV9uYW1lKSAtIDEp
OwoJaW5pdC5zcGVlZCA9IFVTQl9TUEVFRF9GVUxMOwoJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQs
IFVTQl9SQVdfSU9DVExfSU5JVCwgJmluaXQpIDwgMCkgewoJCXBlcnJvcigiVVNCX1JBV19JT0NU
TF9JTklUIik7CgkJcmV0dXJuIDE7Cgl9CglpZiAoaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JB
V19JT0NUTF9SVU4sIDApIDwgMCkgewoJCXBlcnJvcigiVVNCX1JBV19JT0NUTF9SVU4iKTsKCQly
ZXR1cm4gMTsKCX0KCglwdGhyZWFkX2NyZWF0ZSgmcmVhZF90aHJlYWQsIE5VTEwsIHN0cmVhbV9z
dGFydF92aWFfcmVhZF90aHJlYWQsIE5VTEwpOwoKCXNpZ25hbChTSUdBTFJNLCB3YWtlX2Jsb2Nr
ZWRfZXZlbnRfZmV0Y2gpOwoJYWxhcm0oMjApOwoKCWRlYWRsaW5lID0gbm93X21zKCkgKyA5MDAw
OwoJd2hpbGUgKG5vd19tcygpIDwgZGVhZGxpbmUpIHsKCQlldmVudC0+dHlwZSA9IDA7CgkJZXZl
bnQtPmxlbmd0aCA9IEVQMF9NQVhfVFJBTlNGRVI7CgkJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQs
IFVTQl9SQVdfSU9DVExfRVZFTlRfRkVUQ0gsIGV2ZW50KSA8IDApCgkJCWNvbnRpbnVlOwoJCWlm
IChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0NPTlRST0wpCgkJCWhhbmRsZV9jb250cm9s
KChzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICopZXZlbnQtPmRhdGEpOwoJCWVsc2UgaWYgKGV2ZW50
LT50eXBlID09IFVTQl9SQVdfRVZFTlRfRElTQ09OTkVDVCkKCQkJYnJlYWs7Cgl9CgoJY2xvc2Uo
cmF3X2dhZGdldF9mZCk7CglwdGhyZWFkX2pvaW4ocmVhZF90aHJlYWQsIE5VTEwpOwoJcmV0dXJu
IDA7Cn0K
--000000000000c2ad1d065b3ac92e--
