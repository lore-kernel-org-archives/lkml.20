Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6623A9615
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140633; cv=pass; b=cPxbvkkSsSxe37gbt5T7Q7BaVEwBUakoOURjwS2CI1Wo/X8BXKxpC6zC7wuu1GstewVzRWIhL175YEOOIEWyQH4eqMbTcHuMPtgQSqYLOP9pt0mGDgW9MO9Ol24SaxQTymuL1le0pVCBkjpbFJPkDQa3kXGDGocHAzcRXqNOsDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140633; c=relaxed/simple;
	bh=sufQC1XjQstT7fnBlvbsyy/EQsmMF0bD4qMQWPGONa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwYLFEPSFS6q3Fb+N9C0Tg2RMGRsJGrF77o1pR/bBZQgZKV8N0i6GPuzZdOzD+UU0nmLNMuU+U0qAbo29RjhtQuVyD5GkYk7pA0LTs77WiIVGujp6gVNaZa9KaRoJY8HwbSdAK3XM7oYzg+yKAI1OmUigPii8Hoau4SQsdUmg+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=C1rA2Xim; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="C1rA2Xim"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-851cbd64814so891620b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140628; cv=none;
        d=google.com; s=arc-20260327;
        b=PVMAW339yOw+WIqP+vz2Fjse8982zQfnvsyZzF5Iy/rAgdh5zHeN45V/9zEIdcOogw
         fkUMH9pT7XGMNYS7RH7Uzmo/cgXh9bdFvBvksFNsW2KYRwuYr2HGY8t5dbxw/Qz8bgR4
         eDN5gQ63jet9rwlWyUD/ONNjWSpjhY0cW/NrYYlCEFSAIyl5FJMhF+1aFtYgqj0FgoMp
         Dr1tvGUiDBnb5dK5bU4gp5vp0WUqUlgXp2cIULookJgYvDVWq9n/NuCC8sIYPuTC2Gkm
         nFmfGpZtJS4jvNc4IDOvhhCpdvj2JieeLIvWK4LcD3/cr94WojrBhKt1Nq1z6mlJnR4/
         SK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SD+afRB1C4aGajrfjRXBLO33tEbrEP65piHh4dKZKmk=;
        fh=x6SD5R/1y0F1qJgvBu/fXCC+v9NK9ktSrb7H26KhuwQ=;
        b=EmROaCWWKVQwjQ1suDJ5IZjJ52cThuVrrlO2x4dAg0PYiBvtEjoxU6NKt7QAq2z4l8
         qdgciQXccoGRQEHBKj21fhZUBJwrdmd3PoSZg0QiYQLd+EUfbQrglRvqBbfK7dUIFYjq
         W6PGsyngT8cVeY1rIxfGjSJUNiTkAHH0enVbOj2Vav1MgFR5EDF79r+pePpcYQ2qQXzm
         6YdOYow1MGGTEHObFB16wOoGqpeHNdk3ikVeKfOyPSJsqipP/NMTBE00r74K5UdcHjuf
         167xIRzRjirUruRhhqch+2tdUbEIjc8tyenjxs9/euz4oMUazh4FjoloFKesQJVuBkC6
         PDnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789140628; x=1789745428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SD+afRB1C4aGajrfjRXBLO33tEbrEP65piHh4dKZKmk=;
        b=C1rA2XimrzGY81NCjc7it77P35FJqbus1t/vFXhSy9YTu6ulG1TndpjZcDYzJwBOhO
         yN1LPAactvME1H+Ml+sEC7ZimVR824MrrSwEpSTRrthA0wPPOMV9mjk4cI8AhEWhHv1F
         zUalfNJRBptLDZfRdmc280axDzB9KrhI404YwwEkMEtstKyUjkGEP1xUffiNa8vIiQ2f
         tCP5yW1Jyqclo3YqSHxAAZBs3T7bT1TOQlBVinqbygENUrsWnH1qWD1sm7YttX9HgV8M
         i3q3Yf5WIIbCpnoeslr2YKXk4Syn2itNasJXJRNwkjtb3ieN4PbtwAc8s6BhWJf3MmEM
         HBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140628; x=1789745428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SD+afRB1C4aGajrfjRXBLO33tEbrEP65piHh4dKZKmk=;
        b=P1piFSHKAB/cLwzsV0ZG6vUgk42hJ+Cmt8FWaTIQCP6tvhROz5TTvnx9e5HbqSQmfG
         IrMvT39JpZNDZ+zITLj6g0Lqlk+CbX+AAjwQYjJYLu3pjj9bpVbyaFLVosHw1xlx36lU
         Z8p7BRbShMeWCSNLKZOXq+PARODAZWZy+3VinqNrlxzRcTkUfhREnAFgIMUHhZ2y/+RW
         27e9xTjAfrIMfbFmFL2P8k9VRjtq4bpnjjpyP07rWACnH/7Yz/2iUp8sbBzIbNv+7RUb
         0m6NSFhIJrYrFglpMGRqS/NyTMB0Ve8Oz0zPJH2KzQ8S13GhvTReDx5qytClXmJ3UHd+
         uCnw==
X-Forwarded-Encrypted: i=1; AKwUvBy6d31kREEYSxfiAn69Q4Wz9UCKHYXtdV/GdhOFU60GEf9nz4Q0jZgw4NJ/yVG+KcymhtSQBHttIqKsqZI=@vger.kernel.org
X-Gm-Message-State: AFuF++nAQf7g+y3uKzYufcsA5Cl2We0ODmHHrMOCQAT/BRbe/JwvJauN
	ukypiClwCbBOZlJ3mGbm5QMVMPbEzEPnoDFyfISUp5LSrDCMVSjUFwiQsOJkNBWRIQjv0RjX3gK
	thhvt9/wSF5wRl2RbRKw6CAQJFoZyJ4TeepK/O6af
X-Gm-Gg: AYBFou2cKhlsYB0EkpqgvqVP43UhCBcpbFrlZrRzZoqQy8C8IdduClQXK8gKAQIwMek
	bjH8mVIxhZM+yd0Z18/fcmR93IkzmFidJ+VFsUptNWNjh9rZ1FzOFZ9TGW7h67Tln4Xkk1ttwdN
	Eratn/pPRhaa+bzhoXzGhb9p3LyvP06HAyDxM3YtSUkrq5twKvu9fLjxF5YyUmxq09jFw+n45Xq
	XlzUTjea+eZRw4CmY50mOIb4M5zZm+TLqaslaZmBjVFZsnBABBP1M+prmJGtDFjOL4z5HkevNF7
	YQl4stdRnz58HzyyhQvWvVEIHp3mpoycECWQ6GIo4uH+3XAl+JvgbS5swjnnGCxe8ECgkReTcsl
	w0Pu5utqiJ4hUgVCLf/DU/sj9STz4TcfuukemSDoNARtcsUSSuZKoxIg0uv6EQMxcN/oY/s3b2D
	s=
X-Received: by 2002:a05:6a21:330f:b0:3d1:5c01:e6cc with SMTP id
 adf61e73a8af0-3daed184f9bmr9064808637.10.1789140626762; Fri, 11 Sep 2026
 08:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCg9xV6rwkFf3vj0bCCZkqhcbvPJQZHmZOR1JXzj1jVeow@mail.gmail.com>
In-Reply-To: <CA+0ovCg9xV6rwkFf3vj0bCCZkqhcbvPJQZHmZOR1JXzj1jVeow@mail.gmail.com>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 08:30:15 -0700
X-Gm-Features: AcwNN1XSD8isj0zQUSgzJYQub8uSXFsjloVv2-Ru1-Xv1T3JBfIbOOc8nIqCzDU
Message-ID: <CA+0ovChtAztP726f5EU0LMWWaouHdZT=DF_vbF5fr1LPUx3pDA@mail.gmail.com>
Subject: Re: [BUG] general protection fault in stk1160_write_reg
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000083e070065b36c39d"

--00000000000083e070065b36c39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:29=E2=80=AFAM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> Reporting the following crash:
> Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
> Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=3D1)
>
> [   44.431638][   T10] usb 3-1: New USB device found, idVendor=3D05e1,
> idProduct=3D0408, bcdDevice=3D 1.00
> [   44.434878][   T10] usb 3-1: New USB device strings: Mfr=3D0,
> Product=3D0, SerialNumber=3D0
> [   44.459246][   T10] usb 3-1: New device   @ 480 Mbps (05e1:0408,
> interface 0, class 0)
> [   44.459259][   T10] usb 3-1: video interface 0 found
> [   44.618625][   T10] stk1160 3-1:1.0: V4L2 device registered as video10=
3
> [   45.168629][ T9487] stk1160: write failed on reg 0x203 (-71)
> [   45.182926][ T7049] usb 3-1: USB disconnect, device number 2
> [   45.191412][ T9487] stk1160: write failed on reg 0x203 (-19)
> [   45.212129][ T9487] Oops: general protection fault, probably for
> non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
> [   45.213308][ T9487] KASAN: null-ptr-deref in range
> [0x0000000000000000-0x0000000000000007]
> [   45.214088][ T9487] CPU: 0 UID: 0 PID: 9487 Comm: repro Not tainted
> 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
> [   45.215044][ T9487] Hardware name: QEMU Standard PC (Q35 + ICH9,
> 2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
> [   45.216017][ T9487] RIP: 0010:stk1160_write_reg+0x47/0xe0
> [   45.216544][ T9487] Code: 10 75 f9 49 81 c6 98 08 00 00 4c 89 f0 48
> c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 c3 09 e5 f9 49 8b 3e 48 89
> f8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 75 71 8b 37 c1 e6 08 81 ce 00 00
> 00 80 44 0f
> [   45.218286][ T9487] RSP: 0018:ffffc90020a6f898 EFLAGS: 00010246
> [   45.218863][ T9487] RAX: 0000000000000000 RBX: 0000000000000203
> RCX: ffff888110320000
> [   45.219584][ T9487] RDX: 0000000000000000 RSI: 0000000000000203
> RDI: 0000000000000000
> [   45.220372][ T9487] RBP: 000000000000004a R08: ffff88803091d3c7
> R09: 1ffff11006123a78
> [   45.221098][ T9487] R10: dffffc0000000000 R11: ffffffff88530370
> R12: 000000000000004a
> [   45.221821][ T9487] R13: ffff88803091c000 R14: ffff88803091c898
> R15: dffffc0000000000
> [   45.222557][ T9487] FS:  000000003bfcb400(0000)
> GS:ffff8880d7388000(0000) knlGS:0000000000000000
> [   45.223406][ T9487] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   45.224035][ T9487] CR2: 0000559fc2d50980 CR3: 0000000025d4b000
> CR4: 0000000000752ef0
> [   45.224824][ T9487] PKRU: 55555554
> [   45.225216][ T9487] Call Trace:
> [   45.225573][ T9487]  <TASK>
> [   45.225896][ T9487]  stk1160_i2c_xfer+0x446/0xe40
> [   45.226438][ T9487]  ? stack_depot_save_flags+0x33/0x7f0
> [   45.227016][ T9487]  ? __pfx_stk1160_i2c_xfer+0x10/0x10
> [   45.227595][ T9487]  ? kasan_save_track+0x4f/0x80
> [   45.228103][ T9487]  ? kasan_save_track+0x3e/0x80
> [   45.228573][ T9487]  ? kasan_save_free_info+0x46/0x50
> [   45.229055][ T9487]  ? __kasan_slab_free+0x5c/0x80
> [   45.229511][ T9487]  ? kfree+0x1c5/0x650
> [   45.229958][ T9487]  ? tomoyo_path_number_perm+0x501/0x630
> [   45.230475][ T9487]  ? security_file_ioctl+0xc3/0x2a0
> [   45.230962][ T9487]  ? do_syscall_64+0x155/0x510
> [   45.231408][ T9487]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [   45.231967][ T9487]  __i2c_transfer+0x7a3/0x1f80
> [   45.232427][ T9487]  ? __lock_acquire+0x74c/0x2db0
> [   45.232894][ T9487]  __i2c_smbus_xfer+0x105c/0x1f70
> [   45.233362][ T9487]  ? __pfx___i2c_smbus_xfer+0x10/0x10
> [   45.233863][ T9487]  ? _raw_spin_unlock_irqrestore+0x4c/0x80
> [   45.234401][ T9487]  ? rt_mutex_lock_nested+0x15c/0x1d0
> [   45.234899][ T9487]  i2c_smbus_xfer+0x1f5/0x310
> [   45.235336][ T9487]  i2cdev_ioctl_smbus+0x434/0x730
> [   45.235816][ T9487]  ? __pfx_i2cdev_ioctl_smbus+0x10/0x10
> [   45.236329][ T9487]  i2cdev_ioctl+0x615/0x880
> [   45.236755][ T9487]  ? __pfx_i2cdev_ioctl+0x10/0x10
> [   45.237225][ T9487]  ? rcu_is_watching+0x16/0xb0
> [   45.237678][ T9487]  ? bpf_lsm_file_ioctl+0x9/0x20
> [   45.238138][ T9487]  ? __pfx_i2cdev_ioctl+0x10/0x10
> [   45.238605][ T9487]  __se_sys_ioctl+0xfc/0x170
> [   45.239037][ T9487]  do_syscall_64+0x155/0x510
> [   45.239469][ T9487]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [   45.240092][ T9487]  ? clear_bhb_loop+0x30/0x80
> [   45.240529][ T9487]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [   45.241076][ T9487] RIP: 0033:0x41f86d
> [   45.241446][ T9487] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
> 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
> 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
> 28 00 00 00
> [   45.243267][ T9487] RSP: 002b:00007ffe8df119c0 EFLAGS: 00000246
> ORIG_RAX: 0000000000000010
> [   45.244048][ T9487] RAX: ffffffffffffffda RBX: 0000000000000001
> RCX: 000000000041f86d
> [   45.244767][ T9487] RDX: 00007ffe8df11a40 RSI: 0000000000000720
> RDI: 0000000000000005
> [   45.245485][ T9487] RBP: 00007ffe8df11a10 R08: 0000000000000000
> R09: 0000000000000000
> [   45.246206][ T9487] R10: 0000000000000000 R11: 0000000000000246
> R12: 00007ffe8df11e48
> [   45.246927][ T9487] R13: 00007ffe8df11e58 R14: 0000000000000002
> R15: 00000000004caa00
> [   45.247657][ T9487]  </TASK>
> [   45.247947][ T9487] Modules linked in:
> [   45.248442][ T9487] ---[ end trace 0000000000000000 ]---
> [   45.249950][ T9487] RIP: 0010:stk1160_write_reg+0x47/0xe0
> [   45.249965][ T9487] Code: 10 75 f9 49 81 c6 98 08 00 00 4c 89 f0 48
> c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 c3 09 e5 f9 49 8b 3e 48 89
> f8 48 c1 e8 03 <42> 0f b6 04 38 84 c0 75 71 8b 37 c1 e6 08 81 ce 00 00
> 00 80 44 0f
> [   45.249971][ T9487] RSP: 0018:ffffc90020a6f898 EFLAGS: 00010246
> [   45.249978][ T9487] RAX: 0000000000000000 RBX: 0000000000000203
> RCX: ffff888110320000
> [   45.249983][ T9487] RDX: 0000000000000000 RSI: 0000000000000203
> RDI: 0000000000000000
> [   45.249987][ T9487] RBP: 000000000000004a R08: ffff88803091d3c7
> R09: 1ffff11006123a78
> [   45.249992][ T9487] R10: dffffc0000000000 R11: ffffffff88530370
> R12: 000000000000004a
> [   45.249996][ T9487] R13: ffff88803091c000 R14: ffff88803091c898
> R15: dffffc0000000000
> [   45.250001][ T9487] FS:  000000003bfcb400(0000)
> GS:ffff8881da588000(0000) knlGS:0000000000000000
> [   45.250007][ T9487] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   45.250011][ T9487] CR2: 0000559fc2cf9198 CR3: 0000000025d4b000
> CR4: 0000000000752ef0
> [   45.250018][ T9487] PKRU: 55555554
> [   45.250024][ T9487] Kernel panic - not syncing: Fatal exception
> [   45.259703][ T9487] Kernel Offset: disabled
> [   45.260313][ T9487] Rebooting in 86400 seconds..
>
> Regards,

--00000000000083e070065b36c39d
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtx447rx0>
X-Attachment-Id: f_mtx447rx0

LyoKICogMjM1LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1zdGsxMTYwLXdyaXRlLXJlZwog
Ki8KI2RlZmluZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxlcnJu
by5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHN0
ZGludC5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8
c3lzL2lvY3RsLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
CiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CgojZGVmaW5lIFVEQ19OQU1FX0xFTkdUSF9NQVgg
MTI4CnN0cnVjdCB1c2JfcmF3X2luaXQgewoJX191OCBkcml2ZXJfbmFtZVtVRENfTkFNRV9MRU5H
VEhfTUFYXTsKCV9fdTggZGV2aWNlX25hbWVbVURDX05BTUVfTEVOR1RIX01BWF07CglfX3U4IHNw
ZWVkOwp9OwojZGVmaW5lIFVTQl9SQVdfRVZFTlRfQ09OVFJPTAkJMgojZGVmaW5lIFVTQl9SQVdf
RVZFTlRfRElTQ09OTkVDVAk2CnN0cnVjdCB1c2JfcmF3X2V2ZW50IHsgX191MzIgdHlwZTsgX191
MzIgbGVuZ3RoOyBfX3U4IGRhdGFbMF07IH07CnN0cnVjdCB1c2JfcmF3X2VwX2lvIHsgX191MTYg
ZXA7IF9fdTE2IGZsYWdzOyBfX3UzMiBsZW5ndGg7IF9fdTggZGF0YVswXTsgfTsKCiNkZWZpbmUg
VVNCX1JBV19JT0NUTF9JTklUCQlfSU9XKCdVJywgMCwgc3RydWN0IHVzYl9yYXdfaW5pdCkKI2Rl
ZmluZSBVU0JfUkFXX0lPQ1RMX1JVTgkJX0lPKCdVJywgMSkKI2RlZmluZSBVU0JfUkFXX0lPQ1RM
X0VWRU5UX0ZFVENICV9JT1IoJ1UnLCAyLCBzdHJ1Y3QgdXNiX3Jhd19ldmVudCkKI2RlZmluZSBV
U0JfUkFXX0lPQ1RMX0VQMF9XUklURQkJX0lPVygnVScsIDMsIHN0cnVjdCB1c2JfcmF3X2VwX2lv
KQojZGVmaW5lIFVTQl9SQVdfSU9DVExfRVAwX1JFQUQJCV9JT1dSKCdVJywgNCwgc3RydWN0IHVz
Yl9yYXdfZXBfaW8pCiNkZWZpbmUgVVNCX1JBV19JT0NUTF9DT05GSUdVUkUJCV9JTygnVScsIDkp
CiNkZWZpbmUgVVNCX1JBV19JT0NUTF9FUDBfU1RBTEwJCV9JTygnVScsIDEyKQoKI2RlZmluZSBJ
MkNfU0xBVkVfRk9SQ0UgMHgwNzA2CiNkZWZpbmUgSTJDX1NNQlVTICAgICAgIDB4MDcyMAp1bmlv
biBpMmNfc21idXNfZGF0YSB7IF9fdTggYnl0ZTsgX191MTYgd29yZDsgX191OCBibG9ja1szNF07
IH07CnN0cnVjdCBpMmNfc21idXNfaW9jdGxfZGF0YSB7CglfX3U4IHJlYWRfd3JpdGU7IF9fdTgg
Y29tbWFuZDsgX191MzIgc2l6ZTsgdW5pb24gaTJjX3NtYnVzX2RhdGEgKmRhdGE7Cn07CiNkZWZp
bmUgSTJDX1NNQlVTX1dSSVRFICAgICAwCiNkZWZpbmUgSTJDX1NNQlVTX0JZVEVfREFUQSAyCgov
KiAtLS0tIGRlc2NyaXB0b3JzOiBtaW5pbWFsIHN0azExNjAgKDA1ZTE6MDQwOCkgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSAqLwpzdGF0aWMgc3RydWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciBzdGsx
MTYwX2RldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGggPSBzaXplb2Yoc3RydWN0IHVzYl9k
ZXZpY2VfZGVzY3JpcHRvciksCgkuYkRlc2NyaXB0b3JUeXBlID0gVVNCX0RUX0RFVklDRSwKCS5i
Y2RVU0IgPSAweDAyMDAsCgkuYk1heFBhY2tldFNpemUwID0gNjQsCgkuaWRWZW5kb3IgPSAweDA1
ZTEsCgkuaWRQcm9kdWN0ID0gMHgwNDA4LAoJLmJjZERldmljZSA9IDB4MDEwMCwKCS5iTnVtQ29u
ZmlndXJhdGlvbnMgPSAxLAp9OwoKLyogY29uZmlnKDkpICsgaWZhY2UoOSkgKyBpc29jLUlOIGVw
IDB4ODIgKDcpID0gMjUgKi8Kc3RhdGljIHVpbnQ4X3Qgc3RrMTE2MF9jb25maWdfZGVzY3JpcHRv
cltdID0gewoJOSwgVVNCX0RUX0NPTkZJRywgMjUsIDAsIDEsIDEsIDAsIDB4ODAsIDB4ZmEsCgk5
LCBVU0JfRFRfSU5URVJGQUNFLCAwLCAwLCAxLCAweGZmLCAweGZmLCAweGZmLCAwLAoJNywgVVNC
X0RUX0VORFBPSU5ULCAweDgyLCAweDAxLCAweDAwLCAweDA0LCAxLAp9OwoKc3RhdGljIGludCBy
YXdfZ2FkZ2V0X2ZkID0gLTE7CnN0YXRpYyB2b2xhdGlsZSBpbnQgZ2FkZ2V0X3RocmVhZF9zaG91
bGRfc3RvcDsKCnN0YXRpYyBpbnQgZmluZF91ZGMoY2hhciAqZHJpdmVyX25hbWUsIGNoYXIgKmRl
dmljZV9uYW1lKQp7CglESVIgKnVkY19kaXIgPSBvcGVuZGlyKCIvc3lzL2NsYXNzL3VkYyIpOwoJ
c3RydWN0IGRpcmVudCAqdWRjX2VudHJ5OwoKCWlmICghdWRjX2RpcikKCQlyZXR1cm4gLTE7Cgl3
aGlsZSAoKHVkY19lbnRyeSA9IHJlYWRkaXIodWRjX2RpcikpKSB7CgkJY2hhciAqaW5zdGFuY2Vf
c3VmZml4OwoKCQlpZiAodWRjX2VudHJ5LT5kX25hbWVbMF0gPT0gJy4nKQoJCQljb250aW51ZTsK
CQlzdHJjcHkoZGV2aWNlX25hbWUsIHVkY19lbnRyeS0+ZF9uYW1lKTsKCQlzdHJjcHkoZHJpdmVy
X25hbWUsIHVkY19lbnRyeS0+ZF9uYW1lKTsKCQkvKiBkZXZpY2UgaXMgImR1bW15X3VkYy5OIiwg
dGhlIGdhZGdldCBkcml2ZXIgaXMgImR1bW15X3VkYyIgKi8KCQlpbnN0YW5jZV9zdWZmaXggPSBz
dHJyY2hyKGRyaXZlcl9uYW1lLCAnLicpOwoJCWlmIChpbnN0YW5jZV9zdWZmaXgpCgkJCSppbnN0
YW5jZV9zdWZmaXggPSAwOwoJCWNsb3NlZGlyKHVkY19kaXIpOwoJCXJldHVybiAwOwoJfQoJY2xv
c2VkaXIodWRjX2Rpcik7CglyZXR1cm4gLTE7Cn0KCnN0YXRpYyB2b2lkIGVwMF93cml0ZShjb25z
dCB2b2lkICpwYXlsb2FkLCB1aW50MzJfdCBuYnl0ZXMpCnsKCXVpbnQ4X3QgYnVmZmVyW3NpemVv
ZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyA0MDk2XTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICpl
cDBfaW8gPSAodm9pZCAqKWJ1ZmZlcjsKCgllcDBfaW8tPmVwID0gMDsKCWVwMF9pby0+ZmxhZ3Mg
PSAwOwoJZXAwX2lvLT5sZW5ndGggPSBuYnl0ZXM7CgltZW1jcHkoZXAwX2lvLT5kYXRhLCBwYXls
b2FkLCBuYnl0ZXMpOwoJaW9jdGwocmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9FUDBfV1JJ
VEUsIGVwMF9pbyk7Cn0KCnN0YXRpYyB2b2lkIGVwMF9yZWFkKHVpbnQzMl90IG5ieXRlcykKewoJ
dWludDhfdCBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSArIDQwOTZdOwoJc3Ry
dWN0IHVzYl9yYXdfZXBfaW8gKmVwMF9pbyA9ICh2b2lkICopYnVmZmVyOwoKCWVwMF9pby0+ZXAg
PSAwOwoJZXAwX2lvLT5mbGFncyA9IDA7CgllcDBfaW8tPmxlbmd0aCA9IG5ieXRlczsKCWlvY3Rs
KHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsIGVwMF9pbyk7Cn0KCnN0YXRp
YyB2b2lkIGhhbmRsZV9jb250cm9sX3JlcXVlc3Qoc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqc2V0
dXApCnsKCXVpbnQ4X3QgcmVwbHlbNDA5Nl07CglpbnQgcmVwbHlfbGVuZ3RoID0gLTE7CgoJaWYg
KChzZXR1cC0+YlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfU1RBTkRB
UkQpIHsKCQlzd2l0Y2ggKHNldHVwLT5iUmVxdWVzdCkgewoJCWNhc2UgVVNCX1JFUV9HRVRfREVT
Q1JJUFRPUjoKCQkJc3dpdGNoIChzZXR1cC0+d1ZhbHVlID4+IDgpIHsKCQkJY2FzZSBVU0JfRFRf
REVWSUNFOgoJCQkJcmVwbHlfbGVuZ3RoID0gc2l6ZW9mKHN0azExNjBfZGV2aWNlX2Rlc2NyaXB0
b3IpOwoJCQkJbWVtY3B5KHJlcGx5LCAmc3RrMTE2MF9kZXZpY2VfZGVzY3JpcHRvciwgcmVwbHlf
bGVuZ3RoKTsKCQkJCWJyZWFrOwoJCQljYXNlIFVTQl9EVF9DT05GSUc6CgkJCQlyZXBseV9sZW5n
dGggPSBzaXplb2Yoc3RrMTE2MF9jb25maWdfZGVzY3JpcHRvcik7CgkJCQltZW1jcHkocmVwbHks
IHN0azExNjBfY29uZmlnX2Rlc2NyaXB0b3IsIHJlcGx5X2xlbmd0aCk7CgkJCQlicmVhazsKCQkJ
Y2FzZSBVU0JfRFRfU1RSSU5HOgoJCQkJLyogbGFuZy1pZCBsaXN0OiBlbi1VUyAqLwoJCQkJcmVw
bHlbMF0gPSA0OyByZXBseVsxXSA9IFVTQl9EVF9TVFJJTkc7CgkJCQlyZXBseVsyXSA9IDB4MDk7
IHJlcGx5WzNdID0gMHgwNDsKCQkJCXJlcGx5X2xlbmd0aCA9IDQ7CgkJCQlicmVhazsKCQkJfQoJ
CQlicmVhazsKCQljYXNlIFVTQl9SRVFfU0VUX0NPTkZJR1VSQVRJT046CgkJCWlvY3RsKHJhd19n
YWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfQ09ORklHVVJFLCAwKTsKCQkJcmVwbHlfbGVuZ3RoID0g
MDsKCQkJYnJlYWs7CgkJY2FzZSBVU0JfUkVRX0dFVF9DT05GSUdVUkFUSU9OOgoJCQlyZXBseVsw
XSA9IDE7IHJlcGx5X2xlbmd0aCA9IDE7CgkJCWJyZWFrOwoJCWNhc2UgVVNCX1JFUV9TRVRfSU5U
RVJGQUNFOgoJCQlyZXBseV9sZW5ndGggPSAwOwoJCQlicmVhazsKCQljYXNlIFVTQl9SRVFfR0VU
X0lOVEVSRkFDRToKCQkJcmVwbHlbMF0gPSAwOyByZXBseV9sZW5ndGggPSAxOwoJCQlicmVhazsK
CQljYXNlIFVTQl9SRVFfR0VUX1NUQVRVUzoKCQkJcmVwbHlbMF0gPSAwOyByZXBseVsxXSA9IDA7
IHJlcGx5X2xlbmd0aCA9IDI7CgkJCWJyZWFrOwoJCX0KCX0gZWxzZSB7CgkJLyogc3RrMTE2MCB2
ZW5kb3IgcmVnaXN0ZXIgcmVhZC93cml0ZTogYWNrbm93bGVkZ2UgZXZlcnl0aGluZyAqLwoJCW1l
bXNldChyZXBseSwgMCwgc2l6ZW9mKHJlcGx5KSk7CgkJcmVwbHlfbGVuZ3RoID0gc2V0dXAtPndM
ZW5ndGggPiA2NCA/IDY0IDogc2V0dXAtPndMZW5ndGg7Cgl9CgoJaWYgKHJlcGx5X2xlbmd0aCA8
IDApIHsKCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQMF9TVEFMTCwgMCk7
CgkJcmV0dXJuOwoJfQoKCWlmICgoc2V0dXAtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJfSU4pICYm
IHNldHVwLT53TGVuZ3RoKSB7CgkJaWYgKHJlcGx5X2xlbmd0aCA+IHNldHVwLT53TGVuZ3RoKQoJ
CQlyZXBseV9sZW5ndGggPSBzZXR1cC0+d0xlbmd0aDsKCQllcDBfd3JpdGUocmVwbHksICh1aW50
MzJfdClyZXBseV9sZW5ndGgpOwoJfSBlbHNlIHsKCQllcDBfcmVhZChzZXR1cC0+d0xlbmd0aCk7
Cgl9Cn0KCnN0YXRpYyB2b2lkICpnYWRnZXRfdGhyZWFkKHZvaWQgKnVudXNlZCkKewoJdWludDhf
dCBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2V2ZW50KSArIDQwOTZdOwoJc3RydWN0IHVz
Yl9yYXdfZXZlbnQgKmV2ZW50ID0gKHZvaWQgKilidWZmZXI7CgoJd2hpbGUgKCFnYWRnZXRfdGhy
ZWFkX3Nob3VsZF9zdG9wKSB7CgkJZXZlbnQtPnR5cGUgPSAwOwoJCWV2ZW50LT5sZW5ndGggPSA0
MDk2OwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENI
LCBldmVudCkgPCAwKSB7CgkJCWlmIChlcnJubyA9PSBFSU5UUikKCQkJCWNvbnRpbnVlOwoJCQli
cmVhazsKCQl9CgkJaWYgKGV2ZW50LT50eXBlID09IFVTQl9SQVdfRVZFTlRfQ09OVFJPTCkKCQkJ
aGFuZGxlX2NvbnRyb2xfcmVxdWVzdCgoc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqKWV2ZW50LT5k
YXRhKTsKCQllbHNlIGlmIChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0RJU0NPTk5FQ1Qp
CgkJCWJyZWFrOwoJfQoJcmV0dXJuIE5VTEw7Cn0KCnN0YXRpYyBpbnQgcmVhZF9zeXNmc19hdHRy
aWJ1dGUoY29uc3QgY2hhciAqcGF0aCwgY2hhciAqYnVmZmVyLCBzaXplX3Qgc2l6ZSkKewoJaW50
IGZkID0gb3BlbihwYXRoLCBPX1JET05MWSksIG5ieXRlczsKCglpZiAoZmQgPCAwKQoJCXJldHVy
biAtMTsKCW5ieXRlcyA9IHJlYWQoZmQsIGJ1ZmZlciwgc2l6ZSAtIDEpOwoJY2xvc2UoZmQpOwoJ
aWYgKG5ieXRlcyA8IDApCgkJcmV0dXJuIC0xOwoJYnVmZmVyW25ieXRlc10gPSAwOwoJcmV0dXJu
IG5ieXRlczsKfQoKc3RhdGljIGludCBmaW5kX3N0azExNjBfZGV2bm9kZShjb25zdCBjaGFyICpz
eXNmc19jbGFzc19kaXIsCgkJCQljb25zdCBjaGFyICplbnRyeV9wcmVmaXgsCgkJCQljaGFyICpk
ZXZub2RlX291dCwgc2l6ZV90IGRldm5vZGVfc2l6ZSkKewoJRElSICpjbGFzc19kaXIgPSBvcGVu
ZGlyKHN5c2ZzX2NsYXNzX2Rpcik7CglzdHJ1Y3QgZGlyZW50ICpjbGFzc19lbnRyeTsKCglpZiAo
IWNsYXNzX2RpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKGNsYXNzX2VudHJ5ID0gcmVhZGRpcihj
bGFzc19kaXIpKSkgewoJCWNoYXIgbmFtZV9hdHRyaWJ1dGVfcGF0aFszMjBdLCBkcml2ZXJfbmFt
ZVsxMjhdOwoKCQlpZiAoc3RybmNtcChjbGFzc19lbnRyeS0+ZF9uYW1lLCBlbnRyeV9wcmVmaXgs
IHN0cmxlbihlbnRyeV9wcmVmaXgpKSkKCQkJY29udGludWU7CgkJc25wcmludGYobmFtZV9hdHRy
aWJ1dGVfcGF0aCwgc2l6ZW9mKG5hbWVfYXR0cmlidXRlX3BhdGgpLAoJCQkgIiVzLyVzL25hbWUi
LCBzeXNmc19jbGFzc19kaXIsIGNsYXNzX2VudHJ5LT5kX25hbWUpOwoJCWlmIChyZWFkX3N5c2Zz
X2F0dHJpYnV0ZShuYW1lX2F0dHJpYnV0ZV9wYXRoLCBkcml2ZXJfbmFtZSwKCQkJCQkgc2l6ZW9m
KGRyaXZlcl9uYW1lKSkgPD0gMCkKCQkJY29udGludWU7CgkJaWYgKCFzdHJzdHIoZHJpdmVyX25h
bWUsICJzdGsxMTYwIikpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKGRldm5vZGVfb3V0LCBkZXZu
b2RlX3NpemUsICIvZGV2LyVzIiwgY2xhc3NfZW50cnktPmRfbmFtZSk7CgkJY2xvc2VkaXIoY2xh
c3NfZGlyKTsKCQlyZXR1cm4gMDsKCX0KCWNsb3NlZGlyKGNsYXNzX2Rpcik7CglyZXR1cm4gLTE7
Cn0KCmludCBtYWluKHZvaWQpCnsKCWNoYXIgdWRjX2RyaXZlcl9uYW1lWzEyOF0sIHVkY19kZXZp
Y2VfbmFtZVsxMjhdOwoJY2hhciBpMmNfZGV2bm9kZVs2NF0sIHZpZGVvX2Rldm5vZGVbNjRdOwoJ
c3RydWN0IHVzYl9yYXdfaW5pdCBpbml0OwoJcHRocmVhZF90IHRocmVhZDsKCXVuaW9uIGkyY19z
bWJ1c19kYXRhIHNtYnVzX3BheWxvYWQ7CglzdHJ1Y3QgaTJjX3NtYnVzX2lvY3RsX2RhdGEgc21i
dXNfcmVxdWVzdDsKCWludCBpMmNfZmQsIHZpZGVvX2ZkLCBhdHRlbXB0OwoKCWlmIChmaW5kX3Vk
Yyh1ZGNfZHJpdmVyX25hbWUsIHVkY19kZXZpY2VfbmFtZSkgPCAwKQoJCXJldHVybiAxOwoKCXJh
d19nYWRnZXRfZmQgPSBvcGVuKCIvZGV2L3Jhdy1nYWRnZXQiLCBPX1JEV1IpOwoJaWYgKHJhd19n
YWRnZXRfZmQgPCAwKQoJCXJldHVybiAxOwoKCW1lbXNldCgmaW5pdCwgMCwgc2l6ZW9mKGluaXQp
KTsKCXN0cm5jcHkoKGNoYXIgKilpbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25hbWUsCgkJ
c2l6ZW9mKGluaXQuZHJpdmVyX25hbWUpIC0gMSk7CglzdHJuY3B5KChjaGFyICopaW5pdC5kZXZp
Y2VfbmFtZSwgdWRjX2RldmljZV9uYW1lLAoJCXNpemVvZihpbml0LmRldmljZV9uYW1lKSAtIDEp
OwoJaW5pdC5zcGVlZCA9IDM7IC8qIFVTQl9TUEVFRF9ISUdIICovCglpZiAoaW9jdGwocmF3X2dh
ZGdldF9mZCwgVVNCX1JBV19JT0NUTF9JTklULCAmaW5pdCkgPCAwKQoJCXJldHVybiAxOwoJaWYg
KGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfUlVOLCAwKSA8IDApCgkJcmV0dXJu
IDE7CgoJcHRocmVhZF9jcmVhdGUoJnRocmVhZCwgTlVMTCwgZ2FkZ2V0X3RocmVhZCwgTlVMTCk7
CgoJLyogd2FpdCBmb3Igc3RrMTE2MCB0byBwcm9iZSBhbmQgcmVnaXN0ZXIgaXRzIEkyQyBhZGFw
dGVyICovCglmb3IgKGF0dGVtcHQgPSAwOyBhdHRlbXB0IDwgMTUwOyBhdHRlbXB0KyspIHsKCQlp
ZiAoZmluZF9zdGsxMTYwX2Rldm5vZGUoIi9zeXMvY2xhc3MvaTJjLWRldiIsICJpMmMtIiwKCQkJ
CQkgaTJjX2Rldm5vZGUsIHNpemVvZihpMmNfZGV2bm9kZSkpID09IDApCgkJCWJyZWFrOwoJCXVz
bGVlcCgxMDAwMDApOwoJfQoJaWYgKGF0dGVtcHQgPT0gMTUwKQoJCXJldHVybiAxOwoKCWZvciAo
YXR0ZW1wdCA9IDA7IGF0dGVtcHQgPCA1MDsgYXR0ZW1wdCsrKSB7CgkJaWYgKGZpbmRfc3RrMTE2
MF9kZXZub2RlKCIvc3lzL2NsYXNzL3ZpZGVvNGxpbnV4IiwgInZpZGVvIiwKCQkJCQkgdmlkZW9f
ZGV2bm9kZSwgc2l6ZW9mKHZpZGVvX2Rldm5vZGUpKSA9PSAwKQoJCQlicmVhazsKCQl1c2xlZXAo
MTAwMDAwKTsKCX0KCXZpZGVvX2ZkID0gb3Blbih2aWRlb19kZXZub2RlLCBPX1JEV1IgfCBPX05P
TkJMT0NLKTsKCglpMmNfZmQgPSBvcGVuKGkyY19kZXZub2RlLCBPX1JEV1IpOwoJaWYgKGkyY19m
ZCA8IDApCgkJcmV0dXJuIDE7Cglpb2N0bChpMmNfZmQsIEkyQ19TTEFWRV9GT1JDRSwgMHgyNSk7
CgoJLyogdW5wbHVnOiBkZXYtPnVkZXYgYmVjb21lcyBOVUxMLCB0aGUgSTJDIGFkYXB0ZXIgc3Rh
eXMgbGl2ZSAqLwoJZ2FkZ2V0X3RocmVhZF9zaG91bGRfc3RvcCA9IDE7CgljbG9zZShyYXdfZ2Fk
Z2V0X2ZkKTsKCXJhd19nYWRnZXRfZmQgPSAtMTsKCXVzbGVlcCg1MDAwMDApOwoKCXNtYnVzX3Bh
eWxvYWQuYnl0ZSA9IDB4NDI7CglzbWJ1c19yZXF1ZXN0LnJlYWRfd3JpdGUgPSBJMkNfU01CVVNf
V1JJVEU7CglzbWJ1c19yZXF1ZXN0LmNvbW1hbmQgPSAweDFlOwoJc21idXNfcmVxdWVzdC5zaXpl
ID0gSTJDX1NNQlVTX0JZVEVfREFUQTsKCXNtYnVzX3JlcXVlc3QuZGF0YSA9ICZzbWJ1c19wYXls
b2FkOwoJZm9yIChhdHRlbXB0ID0gMDsgYXR0ZW1wdCA8IDY0OyBhdHRlbXB0KyspIHsKCQlpb2N0
bChpMmNfZmQsIEkyQ19TTUJVUywgJnNtYnVzX3JlcXVlc3QpOwoJCXVzbGVlcCgyMDAwMCk7Cgl9
CgoJcmV0dXJuIDA7Cn0K
--00000000000083e070065b36c39d--
