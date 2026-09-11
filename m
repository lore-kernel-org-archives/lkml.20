Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFC59D610
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157785; cv=pass; b=rIK4PyeICoCqxQtEOF7lVsNt2Ut0mq0Nc0SspibkNDvuLxAxaU1HZWUgUW5XrN0lMSKoSsY3RHnIcSEVd8zHxr9sOjxwfhZIF82/x6hWLSvlyYSNGSZqZF8+2GhgtJ20bVx68iTUtdwtZzddeuhmbt6p1bcdUJ1HMB2aqUTuE2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157785; c=relaxed/simple;
	bh=gxaSn40BO9MQBTXgEjiUr7HNZ5l4XK6PZr22OuDM5l8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dUmqyN0qZkssYHY3vP9595dL63n8XbZiS/1TzUusqGzUd0yYcj45zP59l10/kzuCvfpgc+a2xvzixTQ42rswXdrWU9ImxyFggM8P/EkbUUGhB+5c5CW2Mi5DZhSBItae4q6ErSoYffAn4PgzVaMvB55DrBQnQAQ+FGRsVZD8o2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=CacYzh+z; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="CacYzh+z"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so1685631b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:16:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789157784; cv=none;
        d=google.com; s=arc-20260327;
        b=U+sJjHsp0yUoQzNY+sJcOPG0ysxB/zp/h5f+Vp7BI+Feg973mYatwEA0/dRYHXgpBF
         WPsrhF5SJY+/yCvjisXLVYe68CjfvF7djXzD19yc2T5gYD7/ReHFgQ8kroWDZUIPMvvQ
         PNDUXzCQCWsrg439jpalQjmTCSbWC1WGn3PbwPaNbhkdJzvGJ1PQnjOzFk9Vc0FfE9LH
         K7s+zVFG506/VLRYyPTCBzbD+0/I/GqqQ4CSyzBUm5IYAsd84mO9gj4YBlStrogKkqqk
         JD33IAhgCfdw/YBLT8Sd6HAyuIUw4C7BW7JgN5rRdvEDMLQgkGtn0I1l1KyLtjRHyI6I
         UO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hRp0Xi0yjTUEZ7QtGctBj/WX7Mj969LgwXI5NwSVgvo=;
        fh=2ja2pN1J6Pfwg1H9XjTv4hVP4DH6zVSRlaBQ9BZ4kWU=;
        b=OBs4Fx1Xlw8jMipoWDlT4JhqBaSPrWAvdyDCqHE6iPIucC9lJXrosD9M5NPKCU2luS
         8sPi0Xy4Ti+/AF48lrDh5vlCjYoqDWVe75PdwMc6BVwEkQmwd8uKfVnsjW1qMw6Wxw7P
         iFLtJuafrfSO53XrARYEQBMxC5+3Rs913skLCWjaF6lEX4cs+TAx5eLQFHZ+LvBjnoLj
         wcVVduXDjwWos4fvAmBJPQ4BXZZzumXnWS4WJTPV7IwHgrkzf67lptF0AB3l8Xk4HWfJ
         dArOEmZqZWYTD9spQFVsGe58FphXQY/NPibkvWGZTasZkoD5qtycfyoZtT0rwS6vHePK
         miiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789157784; x=1789762584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRp0Xi0yjTUEZ7QtGctBj/WX7Mj969LgwXI5NwSVgvo=;
        b=CacYzh+zlqO9fC2r0pdbMitOrvL41UjsYvIm9cewNkwH6s3fXzk9LrAHJBtt5bqHez
         UojE3xrd5bbdOaLNEdKT47yvHPUmmapwiMd0LA9QHbFTeyoWxX0e9TZYNXeS8KFobhLb
         p5wfgDVsVvTCyWsKJ9U/zzFeLPQO6t0MElq9l29m5+mvh3cjG0Wk61It031z2WJClwiv
         HRc5ZMPEA82qYUGIYO1uYEDe5d11hJWLNXn62oK/6m5hiD0iuhtGy6PYoghpWycYU8+f
         WGYRSC1qSeFDHdVeOYOg0VwSg6ukE3yPP2ZSsGnKJsbbusKe92FUIiwh/T6HU/3ON27F
         kXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789157784; x=1789762584;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hRp0Xi0yjTUEZ7QtGctBj/WX7Mj969LgwXI5NwSVgvo=;
        b=T1CoWaC8HwUZoAFn3OVGRV2vYBaMdr6nnCnTBoSODai8iWSC9mGwN7OMUEnwcTpkE/
         IQX8ScaYFypdgCC9HJ2KY7sk0nnH6y6/aDQCPSyWxtlLtleV1O+3th/i1HUyCLKGKUtB
         fdgEnOaSohr2E4B35InvYbXWudsfkFjvQswRQbmz56lIQWktsi4yzHvq7uV26XYv/twe
         ssRyJ63ssr4zov5CVVQolYDJPr1T6noZr0mebpOCzg3oyjeBydBvVrIaOdbRqPIJEuaK
         m1p/OEFxMrXACCSR1j+WZ0Jb3w/xgoqsmdqZq1uly/M7bQFyyPWmVhIY1dpJ9RBQogeC
         NPLw==
X-Gm-Message-State: AFuF++ky+zxuXDOEDUtPXY8OqU6QFeEWUJdAOPKFoDxMAD3EzDn6xgxk
	wVgLi05YfCP7f4X2FFizvPXlU4rfReAuCKxA1GnmTegfCS1rIgxH0CZfooOPSp+BfCbzA3P1D84
	SNYEyPKzA3wzKyzqkh6m+ZsevGAKid7mFtIROoQEILHG3g3+qhWlPWb9g8N5tRA==
X-Gm-Gg: AYBFou3KBMtrDai0Q/FyPYqT5Oub7GXpsxSSQA2S+hBBF2gSMP/ZMUiRJwRyz38v+qn
	E7v7husnG5nIkmkynp1OlElXtEb5tXewlp+xB0ws9VoFd6ntR70r6RS/50oMkzQCk21hs42iBsz
	8psbLHChvLFL/uitYvzPHsm4oxl3CGVJesL8651jiqpW8NfTxKfVOpFrzQEK4SMtNenCj7ycOOv
	bj1qibhmCDjaJZ5X78lob975Zq1u+R+qQ8O+tIjD5ECE0aamFbRyJ/j9f7UZ3LQZsec9uOOM3iv
	PlTD0mHB2vPJPeD8RTqA+hS4bS/MNR9yh881O59BUpEYtQ9YdGzsI7Ecu5xqkWzfPUhLvcs2Koe
	qa+D+oC3K76ih4kMZn8fYgliMYGvTkO7clYQ2FFH0J2wWZxdYRq0sJHIup6MRRaUOJaRqS2e2NL
	g=
X-Received: by 2002:a05:6a00:4295:b0:851:d12e:389b with SMTP id
 d2e1a72fcca58-86b314083d9mr9899684b3a.14.1789157782628; Fri, 11 Sep 2026
 13:16:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Fri, 11 Sep 2026 13:16:11 -0700
X-Gm-Features: AcwNN1WnuwpUV1V9V3r_M8aJugo0VxUiFh0VPHt0yNehT5GSnkmfsi0fFXjYx1M
Message-ID: <CA+0ovChXjGWuRQuKHHWkSiLbdt-WEWv=M0mGOB2eKcJjFiEY=A@mail.gmail.com>
Subject: [BUG] general protection fault in upd78f0730_tiocmset
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000155ff3065b3ac242"

--000000000000155ff3065b3ac242
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.256596][ T9490] Oops: general protection fault, probably for
non-canonical address 0xdffffc00000000ba: 0000 [#1] SMP KASAN NOPTI
[   44.258408][ T9490] KASAN: null-ptr-deref in range
[0x00000000000005d0-0x00000000000005d7]
[   44.259206][ T9490] CPU: 0 UID: 0 PID: 9490 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.260235][ T9490] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.261396][ T9490] RIP: 0010:upd78f0730_tiocmset+0x86/0x4b0
[   44.261972][ T9490] Code: 48 c1 e9 03 48 b8 f1 f1 f1 f1 f8 f3 f3 f3
48 89 4c 24 18 4a 89 04 31 e8 b8 7d 2c fa 48 81 c3 d0 05 00 00 48 89
d8 48 c1 e8 03 <42> 80 3c 30 00 74 08 48 89 df e8 2b 77 9c fa 48 8b 1b
48 b9 00 00
[   44.263789][ T9490] RSP: 0018:ffffc90007ab7cc0 EFLAGS: 00010202
[   44.264354][ T9490] RAX: 00000000000000ba RBX: 00000000000005d0
RCX: ffff888023c14c80
[   44.265071][ T9490] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   44.265809][ T9490] RBP: ffffc90007ab7d78 R08: ffff88802ca5e23f
R09: 1ffff1100594bc47
[   44.266578][ T9490] R10: dffffc0000000000 R11: ffffffff879b2310
R12: ffff88802ca5e238
[   44.267349][ T9490] R13: 0000000000000000 R14: dffffc0000000000
R15: 0000000000000006
[   44.268064][ T9490] FS:  000000002dfbb400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   44.268859][ T9490] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.269453][ T9490] CR2: 0000563a83ef0e60 CR3: 0000000109e01000
CR4: 0000000000752ef0
[   44.270165][ T9490] PKRU: 55555554
[   44.270495][ T9490] Call Trace:
[   44.270882][ T9490]  <TASK>
[   44.271160][ T9490]  ? __pfx_upd78f0730_tiocmset+0x10/0x10
[   44.271694][ T9490]  ? __pfx_serial_port_dtr_rts+0x10/0x10
[   44.272208][ T9490]  tty_port_shutdown+0x165/0x220
[   44.272672][ T9490]  tty_port_hangup+0xee/0x170
[   44.273101][ T9490]  ? __pfx_serial_hangup+0x10/0x10
[   44.273600][ T9490]  __tty_hangup+0x5a7/0x650
[   44.274074][ T9490]  tty_ioctl+0x757/0xde0
[   44.274503][ T9490]  ? __pfx_tty_ioctl+0x10/0x10
[   44.274984][ T9490]  __se_sys_ioctl+0xfc/0x170
[   44.275432][ T9490]  do_syscall_64+0x155/0x510
[   44.275862][ T9490]  ? trace_irq_disable+0x3b/0x140
[   44.276329][ T9490]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.276884][ T9490]  ? clear_bhb_loop+0x30/0x80
[   44.277314][ T9490]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   44.277850][ T9490] RIP: 0033:0x417a9d
[   44.278211][ T9490] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d
45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10
00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25
28 00 00 00
[   44.279975][ T9490] RSP: 002b:00007ffe10b6f070 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[   44.280825][ T9490] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000417a9d
[   44.281622][ T9490] RDX: 0000000000000000 RSI: 0000000000005437
RDI: 0000000000000004
[   44.282389][ T9490] RBP: 00007ffe10b6f0c0 R08: 0000000000000000
R09: 0000000000000000
[   44.283156][ T9490] R10: 0000000000000000 R11: 0000000000000246
R12: 00007ffe10b6f318
[   44.283867][ T9490] R13: 00007ffe10b6f328 R14: 0000000000000002
R15: 00000000004cd9e0
[   44.284586][ T9490]  </TASK>
[   44.284876][ T9490] Modules linked in:
[   44.285291][ T9490] ---[ end trace 0000000000000000 ]---
[   44.286033][ T9490] RIP: 0010:upd78f0730_tiocmset+0x86/0x4b0
[   44.286048][ T9490] Code: 48 c1 e9 03 48 b8 f1 f1 f1 f1 f8 f3 f3 f3
48 89 4c 24 18 4a 89 04 31 e8 b8 7d 2c fa 48 81 c3 d0 05 00 00 48 89
d8 48 c1 e8 03 <42> 80 3c 30 00 74 08 48 89 df e8 2b 77 9c fa 48 8b 1b
48 b9 00 00
[   44.286054][ T9490] RSP: 0018:ffffc90007ab7cc0 EFLAGS: 00010202
[   44.286060][ T9490] RAX: 00000000000000ba RBX: 00000000000005d0
RCX: ffff888023c14c80
[   44.286065][ T9490] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
[   44.286069][ T9490] RBP: ffffc90007ab7d78 R08: ffff88802ca5e23f
R09: 1ffff1100594bc47
[   44.286074][ T9490] R10: dffffc0000000000 R11: ffffffff879b2310
R12: ffff88802ca5e238
[   44.286079][ T9490] R13: 0000000000000000 R14: dffffc0000000000
R15: 0000000000000006
[   44.286084][ T9490] FS:  000000002dfbb400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   44.286089][ T9490] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.286094][ T9490] CR2: 0000563a83ef0e60 CR3: 0000000109e01000
CR4: 0000000000752ef0
[   44.286100][ T9490] PKRU: 55555554
[   44.286106][ T9490] Kernel panic - not syncing: Fatal exception
[   44.296338][ T9490] Kernel Offset: disabled
[   44.296884][ T9490] Rebooting in 86400 seconds..

Regards,

--000000000000155ff3065b3ac242
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtxec8f80>
X-Attachment-Id: f_mtxec8f80

LyoKICogMjgyLWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi11cGQ3OGYwNzMwLXRpb2Ntc2V0
CiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8ZmNu
dGwuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5jbHVkZSA8
c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5j
bHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxsaW51eC91c2IvY2g5Lmg+CiNpbmNsdWRlIDxsaW51
eC91c2IvcmF3X2dhZGdldC5oPgoKI2RlZmluZSBFUDBfQlVGRkVSX0JZVEVTIDQwOTYKI2RlZmlu
ZSBMRTE2KHZhbHVlKSAoKHZhbHVlKSAmIDB4ZmYpLCAoKCh2YWx1ZSkgPj4gOCkgJiAweGZmKQoK
c3RhdGljIGludCByYXdfZ2FkZ2V0X2ZkID0gLTE7CgpzdGF0aWMgY29uc3QgdWludDhfdCBjb25m
aWd1cmF0aW9uX2Rlc2NyaXB0b3JbXSA9IHsKCTksIFVTQl9EVF9DT05GSUcsIExFMTYoOSArIDkp
LCAxLCAxLCAwLCAweGEwLCAweGZhLAoJOSwgVVNCX0RUX0lOVEVSRkFDRSwgMCwgMCwgMCwgMHhm
ZiwgMHhmZiwgMHhmZiwgMCwKfTsKCnN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9kZXNj
cmlwdG9yIGRldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGggPSBzaXplb2Yoc3RydWN0IHVz
Yl9kZXZpY2VfZGVzY3JpcHRvciksCgkuYkRlc2NyaXB0b3JUeXBlID0gVVNCX0RUX0RFVklDRSwK
CS5iY2RVU0IgPSAweDAyMDAsCgkuYk1heFBhY2tldFNpemUwID0gNjQsCgkuaWRWZW5kb3IgPSAw
eDA0MDksCgkuaWRQcm9kdWN0ID0gMHgwMDYzLAoJLmJjZERldmljZSA9IDB4MDEwMCwKCS5iTnVt
Q29uZmlndXJhdGlvbnMgPSAxLAp9OwoKc3RhdGljIHZvaWQgZXAwX3dyaXRlKGNvbnN0IHZvaWQg
KmRhdGEsIHVpbnQzMl90IGxlbmd0aCkKewoJdWludDhfdCBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1
c2JfcmF3X2VwX2lvKSArIEVQMF9CVUZGRVJfQllURVNdOwoJc3RydWN0IHVzYl9yYXdfZXBfaW8g
KnRyYW5zZmVyID0gKHZvaWQgKilidWZmZXI7CgoJdHJhbnNmZXItPmVwID0gMDsKCXRyYW5zZmVy
LT5mbGFncyA9IDA7Cgl0cmFuc2Zlci0+bGVuZ3RoID0gbGVuZ3RoOwoJaWYgKGxlbmd0aCkKCQlt
ZW1jcHkodHJhbnNmZXItPmRhdGEsIGRhdGEsIGxlbmd0aCk7Cglpb2N0bChyYXdfZ2FkZ2V0X2Zk
LCBVU0JfUkFXX0lPQ1RMX0VQMF9XUklURSwgdHJhbnNmZXIpOwp9CgpzdGF0aWMgdm9pZCBoYW5k
bGVfY29udHJvbF9yZXF1ZXN0KGNvbnN0IHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0cmwpCnsK
CXVpbnQ4X3QgZGF0YVtFUDBfQlVGRkVSX0JZVEVTXTsKCXVpbnQ4X3QgYnVmZmVyW3NpemVvZihz
dHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyBFUDBfQlVGRkVSX0JZVEVTXTsKCXN0cnVjdCB1c2JfcmF3
X2VwX2lvICp0cmFuc2ZlciA9ICh2b2lkICopYnVmZmVyOwoJaW50IGxlbmd0aCA9IC0xOwoKCWlm
ICgoY3RybC0+YlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNCX1RZUEVfU1RBTkRB
UkQpIHsKCQlpZiAoY3RybC0+YlJlcXVlc3QgPT0gVVNCX1JFUV9HRVRfREVTQ1JJUFRPUiAmJgoJ
CSAgICAoY3RybC0+d1ZhbHVlID4+IDgpID09IFVTQl9EVF9ERVZJQ0UpIHsKCQkJbGVuZ3RoID0g
c2l6ZW9mKGRldmljZV9kZXNjcmlwdG9yKTsKCQkJbWVtY3B5KGRhdGEsICZkZXZpY2VfZGVzY3Jp
cHRvciwgbGVuZ3RoKTsKCQl9IGVsc2UgaWYgKGN0cmwtPmJSZXF1ZXN0ID09IFVTQl9SRVFfR0VU
X0RFU0NSSVBUT1IgJiYKCQkJICAgKGN0cmwtPndWYWx1ZSA+PiA4KSA9PSBVU0JfRFRfQ09ORklH
KSB7CgkJCWxlbmd0aCA9IHNpemVvZihjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3IpOwoJCQltZW1j
cHkoZGF0YSwgY29uZmlndXJhdGlvbl9kZXNjcmlwdG9yLCBsZW5ndGgpOwoJCX0gZWxzZSBpZiAo
Y3RybC0+YlJlcXVlc3QgPT0gVVNCX1JFUV9TRVRfQ09ORklHVVJBVElPTikgewoJCQlpb2N0bChy
YXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0NPTkZJR1VSRSwgMCk7CgkJCWxlbmd0aCA9IDA7
CgkJfQoJfSBlbHNlIHsKCgkJbGVuZ3RoID0gMDsKCX0KCglpZiAobGVuZ3RoIDwgMCkgewoJCWlv
Y3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1NUQUxMLCAwKTsKCQlyZXR1cm47
Cgl9CglpZiAoY3RybC0+YlJlcXVlc3RUeXBlICYgVVNCX0RJUl9JTikgewoJCWlmIChsZW5ndGgg
PiBjdHJsLT53TGVuZ3RoKQoJCQlsZW5ndGggPSBjdHJsLT53TGVuZ3RoOwoJCWVwMF93cml0ZShk
YXRhLCAodWludDMyX3QpbGVuZ3RoKTsKCX0gZWxzZSB7CgkJdHJhbnNmZXItPmVwID0gMDsKCQl0
cmFuc2Zlci0+ZmxhZ3MgPSAwOwoJCXRyYW5zZmVyLT5sZW5ndGggPSBjdHJsLT53TGVuZ3RoID4g
RVAwX0JVRkZFUl9CWVRFUyA/CgkJCQkgICBFUDBfQlVGRkVSX0JZVEVTIDogY3RybC0+d0xlbmd0
aDsKCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQMF9SRUFELCB0cmFuc2Zl
cik7Cgl9Cn0KCnN0YXRpYyB2b2lkICpnYWRnZXRfZXAwX2V2ZW50X3B1bXAodm9pZCAqdW51c2Vk
KQp7Cgl1aW50OF90IGJ1ZmZlcltzaXplb2Yoc3RydWN0IHVzYl9yYXdfZXZlbnQpICsgRVAwX0JV
RkZFUl9CWVRFU107CglzdHJ1Y3QgdXNiX3Jhd19ldmVudCAqZXZlbnQgPSAodm9pZCAqKWJ1ZmZl
cjsKCglmb3IgKDs7KSB7CgkJZXZlbnQtPnR5cGUgPSAwOwoJCWV2ZW50LT5sZW5ndGggPSBFUDBf
QlVGRkVSX0JZVEVTOwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VW
RU5UX0ZFVENILCBldmVudCkgPCAwKSB7CgkJCWlmIChlcnJubyA9PSBFSU5UUiB8fCBlcnJubyA9
PSBFQlVTWSB8fCBlcnJubyA9PSBFQUdBSU4pCgkJCQljb250aW51ZTsKCQkJcmV0dXJuIE5VTEw7
CgkJfQoJCWlmIChldmVudC0+dHlwZSA9PSBVU0JfUkFXX0VWRU5UX0NPTlRST0wpCgkJCWhhbmRs
ZV9jb250cm9sX3JlcXVlc3QoKHN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKilldmVudC0+ZGF0YSk7
Cgl9Cn0KCmludCBtYWluKHZvaWQpCnsKCXN0cnVjdCB1c2JfcmF3X2luaXQgaW5pdDsKCXB0aHJl
YWRfdCBldmVudF9wdW1wX3RocmVhZDsKCWludCB0dHlfZmQgPSAtMSwgYXR0ZW1wdDsKCglzeXN0
ZW0oIm1vZHByb2JlIGR1bW15X2hjZCAyPi9kZXYvbnVsbCIpOwoJc3lzdGVtKCJtb2Rwcm9iZSBy
YXdfZ2FkZ2V0IDI+L2Rldi9udWxsIik7CgoJcmF3X2dhZGdldF9mZCA9IG9wZW4oIi9kZXYvcmF3
LWdhZGdldCIsIE9fUkRXUik7CglpZiAocmF3X2dhZGdldF9mZCA8IDApCgkJcmV0dXJuIDE7CgoJ
bWVtc2V0KCZpbml0LCAwLCBzaXplb2YoaW5pdCkpOwoJc3RyY3B5KChjaGFyICopaW5pdC5kcml2
ZXJfbmFtZSwgImR1bW15X3VkYyIpOwoJc3RyY3B5KChjaGFyICopaW5pdC5kZXZpY2VfbmFtZSwg
ImR1bW15X3VkYy4wIik7Cglpbml0LnNwZWVkID0gVVNCX1NQRUVEX0hJR0g7CglpZiAoaW9jdGwo
cmF3X2dhZGdldF9mZCwgVVNCX1JBV19JT0NUTF9JTklULCAmaW5pdCkgPCAwKQoJCXJldHVybiAx
OwoJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfUlVOLCAwKSA8IDApCgkJ
cmV0dXJuIDE7CgoJcHRocmVhZF9jcmVhdGUoJmV2ZW50X3B1bXBfdGhyZWFkLCBOVUxMLCBnYWRn
ZXRfZXAwX2V2ZW50X3B1bXAsIE5VTEwpOwoKCWZvciAoYXR0ZW1wdCA9IDA7IGF0dGVtcHQgPCAx
MDAgJiYgdHR5X2ZkIDwgMDsgYXR0ZW1wdCsrKSB7CgkJdXNsZWVwKDEwMDAwMCk7CgkJdHR5X2Zk
ID0gb3BlbigiL2Rldi90dHlVU0IwIiwgT19SRFdSIHwgT19OT0NUVFkgfCBPX05PTkJMT0NLKTsK
CX0KCWlmICh0dHlfZmQgPCAwKQoJCXJldHVybiAxOwoKCWlvY3RsKHR0eV9mZCwgVElPQ1ZIQU5H
VVAsIDApOwoJcmV0dXJuIDA7Cn0K
--000000000000155ff3065b3ac242--
