Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD27373BEC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077941; cv=pass; b=DAlQte5GqHP7c1XT/gMifdSMlCv4M6kFpNiWRN8ESIeeyOv7kFHzllnDtQo8vjhKsR7+BwmMoHkLo5OvNM68NltQ5J+56G6GaC4B9pRnX2F5A9CgQcPGVaInvTNLuXFU5N/ybE0zap9oZIse9Wu9CNqwd+ViNdUnH+OI4AB2i24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077941; c=relaxed/simple;
	bh=C4KCoyIMvszYxaZGUNezRmEIdbPHlFrhiMOai3yFDfw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=b79Wrk2KN7XoAJ4r+C3e1kuwQpVvbN+Gmr6s2SmFHPAxRt677f5JAZY4kw7UZEO1IzxZoqLRRcOAQrJEgrgCTm8Tyn37J2cu1vTBkpkhZiXnVHs6i+GHrefT2Xyk+UVkZ9MjpfHSHqjkXhuxOzY0Hx/jzKM2xjyG1m6ZlgiCVN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=UNrf9xP3; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="UNrf9xP3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6d28aa26cso1533315ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789077939; cv=none;
        d=google.com; s=arc-20260327;
        b=JODLGR0P6XZ4yx3Iz9GXm7avWpidECu7AceCFOd8fpi9MNX1iwzYdgkGvOl5psW6Uy
         RNo03+SveNczuLYeSEvDdGcmfgHu1/MOxuR9FlEJ84PJUF6kzzCq5uDlgqlvEOjQM5Sb
         THBgI/Gd2B5pOqzfnWYJFxIlbNSjOrELZby/mAiHe60XZ7VALvQPvM6NxxLz8XmEaq7c
         U2Zbuw+rvQVtVS9X1SVLwOFbRwDE+sxOPtp6NhOcGBJfMV4V0y3NzVUuycdsgCt9uxZk
         tDht0O4pNEq4OepYczkHSdEwXDyJJKMyG9j/6/TKsFvwsQKBn7A5zEBxwYZb38xwNPDb
         ekCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3JEn/ebhceAwC8xLoqFHSQdwxMRetMPov/1PrPlD0PY=;
        fh=mBIODdYtF9wL5KWzng+tUEm8CU9hThCnPlwkk+lQLvE=;
        b=iJN+h3wrnosKvVYaP97NlWrVN+yb4ZcxCX4P6v0uvTAHXJuo6Pn/Dl/tq8Rkd13DFP
         IRkECuSPggMNeEdQ7e9CAAyVkM7Z7+0teZk3j3ZCJeh2AxsTc0LRV0Qk9BojXleSPJSY
         g0Un/fG1J7tMCudGoS9HVbCJZ2+4/5TRlrg5Cvv+z2DAay5t+GrwRu2wr63jKgugBRls
         nQ3jRZhynBiTv5NRRXi6gmROMUp6ZGdfDRttujZbCSsB5X6F/t//awu+bWZMqpg5SE+T
         vvSvpnRuZhkMAl90oMkWQ50Rb+jvruOrNuHy40wQ/ytCaoj09CO62aC4biK3N+Df/bfz
         novA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789077939; x=1789682739; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3JEn/ebhceAwC8xLoqFHSQdwxMRetMPov/1PrPlD0PY=;
        b=UNrf9xP3K5abJRI5lUE45pMAigE8VlBrV/CxO0gl+Pl5klDYqExzXuCUFD3VzJHnJ+
         dgAHkTV7e9szU0YdYtloK+HeafL5jO/Hj7JxWPI3om07uCr2C1Hz7OlXfLF7B2PgUjl/
         tFu87TzA+Bpr6+gAUa/Ux0AMnNToznJX6eeE3oFulwUP/RPPhiDnzWefRUh4cv9J0ZR1
         7UYpd6645Lqmh1lXhwssDNkqwYVK0it9sm2K0q2mDWR0b98fgr2meBhKDThbBjoeRt4q
         9KulUOIFRgF8N5gY1s5+SK85HlsqhbqEE/W6JW7U8KYQk9lyQ2AmC0mO5W5HyzX9fQtv
         j7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077939; x=1789682739;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3JEn/ebhceAwC8xLoqFHSQdwxMRetMPov/1PrPlD0PY=;
        b=do9xsv7SiPwzdtC5Nmx2JgHKuhilYnbnzE9FgSkKqbbFXV3BWzmozycaQG0nPj9wJl
         t2+1cf/6T8YtaMog+Ms13XBl3AzUlRzJfqTTrTSTNwu/lqpJ2wdprLMaNI7+WTDgT/tM
         zPxeafB4qcwBbFCv8/RQUpORN9br8gul9LXd4pgWyho6J7UYT9i/cSNe/VbQxoK7QBan
         auwWswLyLSq07Vsv4AHEy9E8Yz3AIQMafIsWm9smakuoq6y+es/aAlKy9vKklgrQ7jBO
         RB5vJbpnkZyjskNt1UQzkicW9P8LOcXnK+zw9OvV+2grNuDUVn4IGWeCBgGrsHK/G52d
         1OTA==
X-Forwarded-Encrypted: i=1; AKwUvBw84gY4LPt32jE6PMCUPvk2brUP3/xFoWxTXYu0aO8D+N/oATaXIpgiVxHPJEd/s5SkjHGGH51EL3H0MP0=@vger.kernel.org
X-Gm-Message-State: AFuF++mpBCut+OFLXRPJ7DN1xNu4XmsyZ7aHe1X5XdfwnmpsoV3KPsJQ
	d+82DR37SE07YiCudVyFkuGtH1KeCYzmwPvdimyGCz3xj0BOBQBLYq0ylJ/6V52FkyB4mpcBQl1
	ByC/pSJDcR8Cl9dnGIMrONBb7lgCrQmNuO2DrbA2n
X-Gm-Gg: AYBFou1FdQXZYEymoC/LgNryctoS5zbz56b2WRp6B7QlmKUOXk52JjirY4klqOZRxav
	/iPMtWnHjw/0lQaCd0ous2Z+KT9osjQ8+bRLU9OlPqpcvUi+m672MXU4kp60LmQAW03saqa6u0t
	TJxQxy7tX2TGZGiECJ193cPH4royqVsp+FPwfvIFfkwNJIuDWx4arcCs0xtf/7/Mh1AoPRrs8nj
	Nc/YGxvW2fZOnXBlGOEl0jvK+6TVVZz6LSObPvlclyEbaOdiZF2YCXnLUDnrCt5p6TrBjZtmM0A
	JYb770Go8h4/zGscJ1RvVUnR9+FsUM0iuouxOIeyGuXvbwh/2s9JeDCR6X73ogaquiQMEnCfm5T
	pc4Lp1Z3cSUvJgsGh5I5n0y+Fp5wN7HD5qcBMO77DQQ==
X-Received: by 2002:a17:903:2c0c:b0:2dd:8e5:28d with SMTP id
 d9443c01a7336-2dd2a1f04eemr27020265ad.8.1789077938269; Thu, 10 Sep 2026
 15:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 10 Sep 2026 15:05:27 -0700
X-Gm-Features: AcwNN1XpZbS5XyDOLXFIqaFb60UOWqvqTC9WWCoT7u8T43p5cfxQeFgB0Wbzt_o
Message-ID: <CA+0ovCiqm0MVi55RpNtbUQoOjiSxnbjHXGN9rq+P6aJJCqCguQ@mail.gmail.com>
Subject: [BUG] general protection fault in dostream
To: Frank Zago <frank@zago.net>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Farhad Alemi <falemi@asu.edu>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fd57e0065b282adc"

--000000000000fd57e0065b282adc
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached and a
proposed patch forthcoming):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   44.061617][ T5050] usb 1-1: new high-speed USB device number 2
using dummy_hcd
[   44.222640][ T5050] usb 1-1: New USB device found, idVendor=04cb,
idProduct=0104, bcdDevice= 1.00
[   44.225178][ T5050] usb 1-1: New USB device strings: Mfr=0,
Product=0, SerialNumber=0
[   44.239511][ T5050] gspca_main: finepix-2.14.0 probing 04cb:0104
[   44.321173][ T5050] Oops: general protection fault, probably for
non-canonical address 0xdffffc000000000c: 0000 [#1] SMP KASAN NOPTI
[   44.322340][ T5050] KASAN: null-ptr-deref in range
[0x0000000000000060-0x0000000000000067]
[   44.323096][ T5050] CPU: 1 UID: 0 PID: 5050 Comm: kworker/1:5 Not
tainted 7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   44.324077][ T5050] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   44.325031][ T5050] Workqueue: events dostream
[   44.325487][ T5050] RIP: 0010:dostream+0xac/0x990
[   44.325935][ T5050] Code: ff 48 89 d8 48 c1 e8 03 42 80 3c 20 00 74
08 48 89 df e8 47 be 12 fa 48 8b 03 48 89 44 24 40 48 8d 58 60 48 89
d8 48 c1 e8 03 <42> 80 3c 20 00 74 08 48 89 df e8 25 be 12 fa 4c 8b 3b
43 c6 44 26
[   44.327737][ T5050] RSP: 0018:ffffc90002f1f9a0 EFLAGS: 00010206
[   44.328284][ T5050] RAX: 000000000000000c RBX: 0000000000000060
RCX: ffff888106e2cc80
[   44.328994][ T5050] RDX: 0000000000000000 RSI: ffffffff8c4c9260
RDI: ffff888025ff2d28
[   44.329704][ T5050] RBP: ffffc90002f1fad0 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   44.330417][ T5050] R10: dffffc0000000000 R11: ffffffff8824d730
R12: dffffc0000000000
[   44.331143][ T5050] R13: ffff888025ff2d28 R14: 1ffff920005e3f48
R15: ffff88810e04e418
[   44.331929][ T5050] FS:  0000000000000000(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   44.332724][ T5050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.333313][ T5050] CR2: 00007ffdf8f1cbc8 CR3: 000000010586c000
CR4: 0000000000752ef0
[   44.334030][ T5050] PKRU: 55555554
[   44.334356][ T5050] Call Trace:
[   44.334664][ T5050]  <TASK>
[   44.334943][ T5050]  ? lock_acquire+0x115/0x350
[   44.335392][ T5050]  ? __pfx_dostream+0x10/0x10
[   44.335824][ T5050]  ? process_scheduled_works+0x94e/0x1900
[   44.336348][ T5050]  ? process_scheduled_works+0x94e/0x1900
[   44.336878][ T5050]  ? process_scheduled_works+0x94e/0x1900
[   44.337396][ T5050]  process_scheduled_works+0xc99/0x1900
[   44.337907][ T5050]  ? __pfx_process_scheduled_works+0x10/0x10
[   44.338453][ T5050]  ? assign_work+0x3d5/0x5e0
[   44.338883][ T5050]  worker_thread+0xa53/0xfc0
[   44.339307][ T5050]  kthread+0x38b/0x480
[   44.339688][ T5050]  ? __pfx_worker_thread+0x10/0x10
[   44.340154][ T5050]  ? __pfx_kthread+0x10/0x10
[   44.340578][ T5050]  ret_from_fork+0x514/0xb70
[   44.341011][ T5050]  ? __pfx_ret_from_fork+0x10/0x10
[   44.341546][ T5050]  ? __switch_to+0xc79/0x1410
[   44.341983][ T5050]  ? __pfx_kthread+0x10/0x10
[   44.342407][ T5050]  ret_from_fork_asm+0x1a/0x30
[   44.342856][ T5050]  </TASK>
[   44.343141][ T5050] Modules linked in:
[   44.343610][ T5050] ---[ end trace 0000000000000000 ]---
[   44.353359][ T5050] RIP: 0010:dostream+0xac/0x990
[   44.353371][ T5050] Code: ff 48 89 d8 48 c1 e8 03 42 80 3c 20 00 74
08 48 89 df e8 47 be 12 fa 48 8b 03 48 89 44 24 40 48 8d 58 60 48 89
d8 48 c1 e8 03 <42> 80 3c 20 00 74 08 48 89 df e8 25 be 12 fa 4c 8b 3b
43 c6 44 26
[   44.353377][ T5050] RSP: 0018:ffffc90002f1f9a0 EFLAGS: 00010206
[   44.353384][ T5050] RAX: 000000000000000c RBX: 0000000000000060
RCX: ffff888106e2cc80
[   44.353388][ T5050] RDX: 0000000000000000 RSI: ffffffff8c4c9260
RDI: ffff888025ff2d28
[   44.353393][ T5050] RBP: ffffc90002f1fad0 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   44.353398][ T5050] R10: dffffc0000000000 R11: ffffffff8824d730
R12: dffffc0000000000
[   44.353402][ T5050] R13: ffff888025ff2d28 R14: 1ffff920005e3f48
R15: ffff88810e04e418
[   44.353407][ T5050] FS:  0000000000000000(0000)
GS:ffff8881da588000(0000) knlGS:0000000000000000
[   44.353412][ T5050] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.353417][ T5050] CR2: 0000564b412ac2c8 CR3: 000000000e948000
CR4: 0000000000752ef0
[   44.353423][ T5050] PKRU: 55555554
[   44.353429][ T5050] Kernel panic - not syncing: Fatal exception
[   44.363111][ T5050] Kernel Offset: disabled
[   44.363652][ T5050] Rebooting in 86400 seconds..

Regards,
SEFCOM Lab @ ASU

--000000000000fd57e0065b282adc
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtw2smat0>
X-Attachment-Id: f_mtw2smat0

LyoKICogMjI0LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1kb3N0cmVhbQogKi8KI2RlZmlu
ZSBfR05VX1NPVVJDRQojaW5jbHVkZSA8ZGlyZW50Lmg+CiNpbmNsdWRlIDxlcnJuby5oPgojaW5j
bHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUgPHB0aHJlYWQuaD4KI2luY2x1ZGUgPHNjaGVkLmg+CiNp
bmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwu
aD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8bGludXgvdXNiL2NoOS5oPgojaW5jbHVk
ZSA8bGludXgvdXNiL3Jhd19nYWRnZXQuaD4KI2luY2x1ZGUgPGxpbnV4L3ZpZGVvZGV2Mi5oPgoK
I2RlZmluZSBFUDBfQlVGRkVSX01BWCA1MTIKI2RlZmluZSBCVUxLX1BBQ0tFVF9CWVRFUyA1MTIK
I2RlZmluZSBMRTE2KHYpICgodikgJiAweGZmKSwgKCgodikgPj4gOCkgJiAweGZmKQoKc3RhdGlj
IGludCByYXdfZ2FkZ2V0X2ZkID0gLTE7CnN0YXRpYyB2b2xhdGlsZSBpbnQgYnVsa19pbl9lcF9o
YW5kbGUgPSAtMTsKCi8qIDA0Y2I6MDEwNCBpcyB0aGUgZmlyc3QgZW50cnkgb2YgZmluZXBpeC5j
J3MgZGV2aWNlX3RhYmxlLCBhbmQgZ3NwY2EgYmluZHMKICogb24gdmVuZG9yL3Byb2R1Y3QgYWxv
bmUsIHNvIHRoZSBpbnRlcmZhY2UgY2xhc3MgYmVsb3cgaXMgZnJlZS4gKi8Kc3RhdGljIHN0cnVj
dCB1c2JfZGV2aWNlX2Rlc2NyaXB0b3IgZGV2aWNlX2Rlc2NyaXB0b3IgPSB7CgkuYkxlbmd0aCA9
IHNpemVvZihzdHJ1Y3QgdXNiX2RldmljZV9kZXNjcmlwdG9yKSwKCS5iRGVzY3JpcHRvclR5cGUg
PSBVU0JfRFRfREVWSUNFLAoJLmJjZFVTQiA9IDB4MDIwMCwJCQkvKiA8IDB4MDIwMTogbm8gQk9T
IHJlcXVlc3QgKi8KCS5iTWF4UGFja2V0U2l6ZTAgPSA2NCwKCS5pZFZlbmRvciA9IDB4MDRjYiwg
LmlkUHJvZHVjdCA9IDB4MDEwNCwKCS5iY2REZXZpY2UgPSAweDAxMDAsCgkuYk51bUNvbmZpZ3Vy
YXRpb25zID0gMSwKfTsKCi8qIE9uZSBpbnRlcmZhY2Ugd2l0aCBleGFjdGx5IG9uZSBhbHRzZXR0
aW5nIGhvbGRpbmcgb25lIGJ1bGsgSU4gZW5kcG9pbnQ6CiAqIGFsdF94ZmVyKCkgdGFrZXMgdGhl
IGZpcnN0IGJ1bGsgSU4gb2YgYWx0c2V0dGluZyAwLCBhbmQgaGF2aW5nIG5vIG90aGVyCiAqIGFs
dHNldHRpbmcga2VlcHMgZ3NwY2Ffc2V0X2FsdDAoKSBmcm9tIGlzc3VpbmcgYSBTRVRfSU5URVJG
QUNFLiAqLwpzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBjb25maWd1cmF0aW9uX2Rlc2NyaXB0
b3JzW10gPSB7Cgk5LCBVU0JfRFRfQ09ORklHLCBMRTE2KDkgKyA5ICsgNyksIDEsIDEsIDAsIDB4
ODAsIDB4ZmEsCgk5LCBVU0JfRFRfSU5URVJGQUNFLCAwLCAwLCAxLCAweGZmLCAweGZmLCAweGZm
LCAwLAoJNywgVVNCX0RUX0VORFBPSU5ULCAweDgxLCBVU0JfRU5EUE9JTlRfWEZFUl9CVUxLLAoJ
CUxFMTYoQlVMS19QQUNLRVRfQllURVMpLCAwLAp9OwoKc3RhdGljIHN0cnVjdCB1c2JfZW5kcG9p
bnRfZGVzY3JpcHRvciBidWxrX2luX2VuZHBvaW50X2Rlc2NyaXB0b3IgPSB7CgkuYkxlbmd0aCA9
IFVTQl9EVF9FTkRQT0lOVF9TSVpFLAoJLmJEZXNjcmlwdG9yVHlwZSA9IFVTQl9EVF9FTkRQT0lO
VCwKCS5iRW5kcG9pbnRBZGRyZXNzID0gMHg4MSwKCS5ibUF0dHJpYnV0ZXMgPSBVU0JfRU5EUE9J
TlRfWEZFUl9CVUxLLAoJLndNYXhQYWNrZXRTaXplID0gQlVMS19QQUNLRVRfQllURVMsCn07Cgpz
dGF0aWMgdm9pZCBwaW5fdGhpc190aHJlYWRfdG9fY3B1KGludCBjcHUpCnsKCWNwdV9zZXRfdCBj
cHVfc2V0OwoKCUNQVV9aRVJPKCZjcHVfc2V0KTsKCUNQVV9TRVQoY3B1LCAmY3B1X3NldCk7Cglz
Y2hlZF9zZXRhZmZpbml0eSgwLCBzaXplb2YoY3B1X3NldCksICZjcHVfc2V0KTsKfQoKc3RhdGlj
IHZvaWQgZXAwX3dyaXRlKGNvbnN0IHZvaWQgKnBheWxvYWQsIHVuc2lnbmVkIGxlbmd0aCkKewoJ
Y2hhciBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSArIEVQMF9CVUZGRVJfTUFY
XTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICppbyA9ICh2b2lkICopYnVmZmVyOwoKCWlmIChsZW5n
dGggPiBFUDBfQlVGRkVSX01BWCkKCQlsZW5ndGggPSBFUDBfQlVGRkVSX01BWDsKCWlvLT5lcCA9
IDA7IGlvLT5mbGFncyA9IDA7IGlvLT5sZW5ndGggPSBsZW5ndGg7CglpZiAobGVuZ3RoKQoJCW1l
bWNweShpby0+ZGF0YSwgcGF5bG9hZCwgbGVuZ3RoKTsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIFVT
Ql9SQVdfSU9DVExfRVAwX1dSSVRFLCBpbyk7Cn0KCnN0YXRpYyB2b2lkIGVwMF9yZWFkKHVuc2ln
bmVkIGxlbmd0aCkKewoJY2hhciBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSAr
IEVQMF9CVUZGRVJfTUFYXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICppbyA9ICh2b2lkICopYnVm
ZmVyOwoKCWlvLT5lcCA9IDA7IGlvLT5mbGFncyA9IDA7Cglpby0+bGVuZ3RoID0gbGVuZ3RoID4g
RVAwX0JVRkZFUl9NQVggPyBFUDBfQlVGRkVSX01BWCA6IGxlbmd0aDsKCWlvY3RsKHJhd19nYWRn
ZXRfZmQsIFVTQl9SQVdfSU9DVExfRVAwX1JFQUQsIGlvKTsKfQoKLyogc2Rfc3RhcnQoKSByZWFk
cyBvbmUgYnVsayBwYWNrZXQgc3luY2hyb25vdXNseSB3aXRoIGEgMjUwIG1zIHRpbWVvdXQgYW5k
CiAqIGJhaWxzIG91dCAtLSBuZXZlciByZWFjaGluZyBzY2hlZHVsZV93b3JrKCkgLS0gaWYgaXQg
ZXhwaXJlcywgc28gdGhlIGJ1bGsKICogSU4gZW5kcG9pbnQgaGFzIHRvIGJlIGFuc3dlcmVkIGZv
ciB0aGUgd2hvbGUgcnVuLiAqLwpzdGF0aWMgdm9pZCAqYnVsa19pbl9mZWVkZXJfdGhyZWFkKHZv
aWQgKnVudXNlZCkKewoJY2hhciBidWZmZXJbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2VwX2lvKSAr
IEJVTEtfUEFDS0VUX0JZVEVTXTsKCXN0cnVjdCB1c2JfcmF3X2VwX2lvICppbyA9ICh2b2lkICop
YnVmZmVyOwoKCXBpbl90aGlzX3RocmVhZF90b19jcHUoMCk7CgltZW1zZXQoaW8tPmRhdGEsIDAs
IEJVTEtfUEFDS0VUX0JZVEVTKTsKCWZvciAoOzspIHsKCQlpZiAoYnVsa19pbl9lcF9oYW5kbGUg
PCAwKSB7CgkJCXVzbGVlcCgxMDAwKTsKCQkJY29udGludWU7CgkJfQoJCWlvLT5lcCA9IGJ1bGtf
aW5fZXBfaGFuZGxlOwoJCWlvLT5mbGFncyA9IDA7CgkJaW8tPmxlbmd0aCA9IEJVTEtfUEFDS0VU
X0JZVEVTOwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VQX1dSSVRF
LCBpbykgPCAwICYmCgkJICAgIGVycm5vICE9IEVJTlRSICYmIGVycm5vICE9IEVCVVNZKQoJCQl1
c2xlZXAoMjAwMCk7Cgl9CglyZXR1cm4gTlVMTDsKfQoKc3RhdGljIHZvaWQgKmdhZGdldF9jb250
cm9sX3RocmVhZCh2b2lkICp1bnVzZWQpCnsKCWNoYXIgZXZlbnRfYnVmZmVyW3NpemVvZihzdHJ1
Y3QgdXNiX3Jhd19ldmVudCkgKyBFUDBfQlVGRkVSX01BWF07CglzdHJ1Y3QgdXNiX3Jhd19ldmVu
dCAqZXZlbnQgPSAodm9pZCAqKWV2ZW50X2J1ZmZlcjsKCglwaW5fdGhpc190aHJlYWRfdG9fY3B1
KDApOwoJZm9yICg7OykgewoJCXN0cnVjdCB1c2JfY3RybHJlcXVlc3QgKmN0cmw7CgkJdW5zaWdu
ZWQgY2hhciByZXBseVtFUDBfQlVGRkVSX01BWF07CgkJaW50IHJlcGx5X2xlbmd0aCwgaXNfc3Rh
bmRhcmQsIGRlc2NyaXB0b3JfdHlwZTsKCgkJZXZlbnQtPmxlbmd0aCA9IEVQMF9CVUZGRVJfTUFY
OwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0VWRU5UX0ZFVENILCBl
dmVudCkgPCAwKSB7CgkJCWlmIChlcnJubyA9PSBFSU5UUikKCQkJCWNvbnRpbnVlOwoJCQlyZXR1
cm4gTlVMTDsKCQl9CgkJaWYgKGV2ZW50LT50eXBlICE9IFVTQl9SQVdfRVZFTlRfQ09OVFJPTCkK
CQkJY29udGludWU7CgkJY3RybCA9IChzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0ICopZXZlbnQtPmRh
dGE7CgoJCWlzX3N0YW5kYXJkID0gKGN0cmwtPmJSZXF1ZXN0VHlwZSAmIFVTQl9UWVBFX01BU0sp
ID09CgkJCQlVU0JfVFlQRV9TVEFOREFSRDsKCQlkZXNjcmlwdG9yX3R5cGUgPSBjdHJsLT53VmFs
dWUgPj4gODsKCgkJaWYgKGlzX3N0YW5kYXJkICYmIGN0cmwtPmJSZXF1ZXN0ID09IFVTQl9SRVFf
R0VUX0RFU0NSSVBUT1IgJiYKCQkgICAgZGVzY3JpcHRvcl90eXBlID09IFVTQl9EVF9ERVZJQ0Up
IHsKCQkJcmVwbHlfbGVuZ3RoID0gc2l6ZW9mKGRldmljZV9kZXNjcmlwdG9yKTsKCQkJbWVtY3B5
KHJlcGx5LCAmZGV2aWNlX2Rlc2NyaXB0b3IsIHJlcGx5X2xlbmd0aCk7CgkJfSBlbHNlIGlmIChp
c19zdGFuZGFyZCAmJgoJCQkgICBjdHJsLT5iUmVxdWVzdCA9PSBVU0JfUkVRX0dFVF9ERVNDUklQ
VE9SICYmCgkJCSAgIGRlc2NyaXB0b3JfdHlwZSA9PSBVU0JfRFRfQ09ORklHKSB7CgkJCXJlcGx5
X2xlbmd0aCA9IHNpemVvZihjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3JzKTsKCQkJbWVtY3B5KHJl
cGx5LCBjb25maWd1cmF0aW9uX2Rlc2NyaXB0b3JzLCByZXBseV9sZW5ndGgpOwoJCX0gZWxzZSBp
ZiAoaXNfc3RhbmRhcmQgJiYKCQkJICAgY3RybC0+YlJlcXVlc3QgPT0gVVNCX1JFUV9TRVRfQ09O
RklHVVJBVElPTikgewoJCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0NPTkZJ
R1VSRSwgMCk7CgkJCWJ1bGtfaW5fZXBfaGFuZGxlID0gaW9jdGwocmF3X2dhZGdldF9mZCwKCQkJ
CQlVU0JfUkFXX0lPQ1RMX0VQX0VOQUJMRSwKCQkJCQkmYnVsa19pbl9lbmRwb2ludF9kZXNjcmlw
dG9yKTsKCQkJcmVwbHlfbGVuZ3RoID0gMDsKCQl9IGVsc2UgewoJCQkvKiBOb3RoaW5nIGVsc2Ug
aXMgbG9hZC1iZWFyaW5nOiBhbGwgc3RyaW5nIGluZGljZXMgYXJlCgkJCSAqIDAgYW5kIGJjZFVT
QiBpcyAweDAyMDAsIHNvIHRoZSBjb3JlIGFza3MgZm9yIG5vIG90aGVyCgkJCSAqIGRlc2NyaXB0
b3IsIGFuZCB0aGUgcmVzdWx0cyBvZiBmaW5lcGl4J3MgY2xhc3MtT1VUCgkJCSAqIGNvbW1hbmQo
KSBhbmQgb2YgdXNiX2NsZWFyX2hhbHQoKSdzIENMRUFSX0ZFQVRVUkUgYXJlCgkJCSAqIGJvdGgg
aWdub3JlZCBieSBzZF9zdGFydCgpLiAgQWNrbm93bGVkZ2Ugd2l0aCB6ZXJvcy4gKi8KCQkJcmVw
bHlfbGVuZ3RoID0gY3RybC0+d0xlbmd0aCA+IEVQMF9CVUZGRVJfTUFYID8KCQkJCQlFUDBfQlVG
RkVSX01BWCA6IGN0cmwtPndMZW5ndGg7CgkJCW1lbXNldChyZXBseSwgMCwgcmVwbHlfbGVuZ3Ro
KTsKCQl9CgoJCWlmIChjdHJsLT5iUmVxdWVzdFR5cGUgJiBVU0JfRElSX0lOKQoJCQllcDBfd3Jp
dGUocmVwbHksIHJlcGx5X2xlbmd0aCA+IGN0cmwtPndMZW5ndGggPwoJCQkJCWN0cmwtPndMZW5n
dGggOiByZXBseV9sZW5ndGgpOwoJCWVsc2UKCQkJZXAwX3JlYWQoY3RybC0+d0xlbmd0aCk7Cgl9
Cn0KCi8qIFRoaXMga2VybmVsIHJlZ2lzdGVycyBhIHBpbGUgb2YgdmlydHVhbCB2NGwyIGRyaXZl
cnMsIHNvIC9kZXYvdmlkZW8wIGlzCiAqIHNvbWVib2R5IGVsc2U6IG1hdGNoIG9uIHRoZSBkcml2
ZXIgc3ltbGluayBpbnN0ZWFkIG9mIGd1ZXNzaW5nIGFuIGluZGV4LiAqLwpzdGF0aWMgaW50IG9w
ZW5fZmluZXBpeF92aWRlb19ub2RlKHZvaWQpCnsKCURJUiAqZGlyID0gb3BlbmRpcigiL3N5cy9j
bGFzcy92aWRlbzRsaW51eCIpOwoJc3RydWN0IGRpcmVudCAqZW50cnk7CglpbnQgZmQgPSAtMTsK
CglpZiAoIWRpcikKCQlyZXR1cm4gLTE7Cgl3aGlsZSAoKGVudHJ5ID0gcmVhZGRpcihkaXIpKSkg
ewoJCWNoYXIgbGlua19wYXRoWzUxMl0sIGxpbmtfdGFyZ2V0WzUxMl0sIG5vZGVfcGF0aFs2NF07
CgkJaW50IHRhcmdldF9sZW5ndGg7CgoJCWlmIChzdHJuY21wKGVudHJ5LT5kX25hbWUsICJ2aWRl
byIsIDUpKQoJCQljb250aW51ZTsKCQlzbnByaW50ZihsaW5rX3BhdGgsIHNpemVvZihsaW5rX3Bh
dGgpLAoJCQkgIi9zeXMvY2xhc3MvdmlkZW80bGludXgvJXMvZGV2aWNlL2RyaXZlciIsIGVudHJ5
LT5kX25hbWUpOwoJCXRhcmdldF9sZW5ndGggPSByZWFkbGluayhsaW5rX3BhdGgsIGxpbmtfdGFy
Z2V0LAoJCQkJCSBzaXplb2YobGlua190YXJnZXQpIC0gMSk7CgkJaWYgKHRhcmdldF9sZW5ndGgg
PD0gMCkKCQkJY29udGludWU7CgkJbGlua190YXJnZXRbdGFyZ2V0X2xlbmd0aF0gPSAwOwoJCWlm
ICghc3Ryc3RyKGxpbmtfdGFyZ2V0LCAiL2ZpbmVwaXgiKSkKCQkJY29udGludWU7CgkJc25wcmlu
dGYobm9kZV9wYXRoLCBzaXplb2Yobm9kZV9wYXRoKSwgIi9kZXYvJXMiLCBlbnRyeS0+ZF9uYW1l
KTsKCQlmZCA9IG9wZW4obm9kZV9wYXRoLCBPX1JEV1IpOwoJCWlmIChmZCA+PSAwKQoJCQlicmVh
azsKCX0KCWNsb3NlZGlyKGRpcik7CglyZXR1cm4gZmQ7Cn0KCmludCBtYWluKHZvaWQpCnsKCXN0
cnVjdCB1c2JfcmF3X2luaXQgaW5pdDsKCXB0aHJlYWRfdCBnYWRnZXRfdGhyZWFkLCBmZWVkZXJf
dGhyZWFkOwoJc3RydWN0IHNjaGVkX3BhcmFtIHJlYWx0aW1lX3BhcmFtID0geyAuc2NoZWRfcHJp
b3JpdHkgPSAxIH07CglzdHJ1Y3QgdjRsMl9yZXF1ZXN0YnVmZmVycyByZXF1ZXN0X2J1ZmZlcnM7
CglpbnQgYnVmZmVyX3R5cGUgPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkU7CglpbnQgdmlk
ZW9fZmQgPSAtMTsKCXVuc2lnbmVkIGluZGV4OwoJaW50IGF0dGVtcHQ7CgoJcmF3X2dhZGdldF9m
ZCA9IG9wZW4oIi9kZXYvcmF3LWdhZGdldCIsIE9fUkRXUik7CglpZiAocmF3X2dhZGdldF9mZCA8
IDApIHsKCQlwZXJyb3IoIm9wZW4gL2Rldi9yYXctZ2FkZ2V0Iik7CgkJcmV0dXJuIDE7Cgl9Cglt
ZW1zZXQoJmluaXQsIDAsIHNpemVvZihpbml0KSk7CgkvKiBkdW1teV9oY2QncyBmaXJzdCBVREM6
IGRyaXZlciAiZHVtbXlfdWRjIiwgZGV2aWNlICJkdW1teV91ZGMuMCIuICovCglzdHJjcHkoKGNo
YXIgKilpbml0LmRyaXZlcl9uYW1lLCAiZHVtbXlfdWRjIik7CglzdHJjcHkoKGNoYXIgKilpbml0
LmRldmljZV9uYW1lLCAiZHVtbXlfdWRjLjAiKTsKCWluaXQuc3BlZWQgPSBVU0JfU1BFRURfSElH
SDsKCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0lOSVQsICZpbml0KSA8
IDApIHsKCQlwZXJyb3IoIlVTQl9SQVdfSU9DVExfSU5JVCIpOwoJCXJldHVybiAxOwoJfQoJaWYg
KGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfUlVOLCAwKSA8IDApIHsKCQlwZXJy
b3IoIlVTQl9SQVdfSU9DVExfUlVOIik7CgkJcmV0dXJuIDE7Cgl9CglwdGhyZWFkX2NyZWF0ZSgm
Z2FkZ2V0X3RocmVhZCwgTlVMTCwgZ2FkZ2V0X2NvbnRyb2xfdGhyZWFkLCBOVUxMKTsKCXB0aHJl
YWRfY3JlYXRlKCZmZWVkZXJfdGhyZWFkLCBOVUxMLCBidWxrX2luX2ZlZWRlcl90aHJlYWQsIE5V
TEwpOwoKCWZvciAoYXR0ZW1wdCA9IDA7IGF0dGVtcHQgPCAxMDAgJiYgdmlkZW9fZmQgPCAwOyBh
dHRlbXB0KyspIHsKCQl1c2xlZXAoMTAwMDAwKTsKCQl2aWRlb19mZCA9IG9wZW5fZmluZXBpeF92
aWRlb19ub2RlKCk7Cgl9CglpZiAodmlkZW9fZmQgPCAwKSB7CgkJZnByaW50ZihzdGRlcnIsICJm
aW5lcGl4IG5ldmVyIHByb2JlZFxuIik7CgkJcmV0dXJuIDE7Cgl9CgoJLyogZ3NwY2Egc2V0cyB2
YjIgbWluX3F1ZXVlZF9idWZmZXJzID0gMiwgc28gU1RSRUFNT04gd2l0aCBmZXdlciB0aGFuCgkg
KiB0d28gcXVldWVkIGJ1ZmZlcnMgbmV2ZXIgcmVhY2hlcyBzZF9zdGFydCgpLiAqLwoJbWVtc2V0
KCZyZXF1ZXN0X2J1ZmZlcnMsIDAsIHNpemVvZihyZXF1ZXN0X2J1ZmZlcnMpKTsKCXJlcXVlc3Rf
YnVmZmVycy5jb3VudCA9IDI7CglyZXF1ZXN0X2J1ZmZlcnMudHlwZSA9IGJ1ZmZlcl90eXBlOwoJ
cmVxdWVzdF9idWZmZXJzLm1lbW9yeSA9IFY0TDJfTUVNT1JZX01NQVA7CglpZiAoaW9jdGwodmlk
ZW9fZmQsIFZJRElPQ19SRVFCVUZTLCAmcmVxdWVzdF9idWZmZXJzKSA8IDApIHsKCQlwZXJyb3Io
IlZJRElPQ19SRVFCVUZTIik7CgkJcmV0dXJuIDE7Cgl9Cglmb3IgKGluZGV4ID0gMDsgaW5kZXgg
PCByZXF1ZXN0X2J1ZmZlcnMuY291bnQ7IGluZGV4KyspIHsKCQlzdHJ1Y3QgdjRsMl9idWZmZXIg
YnVmZmVyOwoKCQltZW1zZXQoJmJ1ZmZlciwgMCwgc2l6ZW9mKGJ1ZmZlcikpOwoJCWJ1ZmZlci50
eXBlID0gYnVmZmVyX3R5cGU7CgkJYnVmZmVyLm1lbW9yeSA9IFY0TDJfTUVNT1JZX01NQVA7CgkJ
YnVmZmVyLmluZGV4ID0gaW5kZXg7CgkJaW9jdGwodmlkZW9fZmQsIFZJRElPQ19RQlVGLCAmYnVm
ZmVyKTsKCX0KCgkvKiBzZF9zdGFydCgpIGVuZHMgd2l0aCBzY2hlZHVsZV93b3JrKGRvc3RyZWFt
KSwgd2hpY2ggcXVldWVzIG9udG8gdGhlCgkgKiBDUFUgd2UgYXJlIHJ1bm5pbmcgb247IGRvc3Ry
ZWFtKCkgdGhlbiBsb2FkcyBnc3BjYV9kZXYtPnVyYlswXS4KCSAqIFNUUkVBTU9GRidzIGdzcGNh
X3N0cmVhbV9vZmYoKSBOVUxMcyB0aGF0IHBvaW50ZXIgaW4gZGVzdHJveV91cmJzKCkKCSAqIGFu
ZCBvbmx5IGFmdGVyd2FyZHMgZmx1c2hlcyB0aGUgd29yay4gIFJ1bm5pbmcgU0NIRURfRklGTyBv
biBhCgkgKiBkZWRpY2F0ZWQgQ1BVIGtlZXBzIHRoZSBub3JtYWwtcHJpb3JpdHkga3dvcmtlciBm
cm9tIHByZWVtcHRpbmcgdXMKCSAqIGluc2lkZSB0aGF0IHdpbmRvdywgc28gdGhlIGZsdXNoIGlz
IHdoYXQgZmluYWxseSBydW5zIGRvc3RyZWFtIC0tCgkgKiB3aXRoIHVyYlswXSBhbHJlYWR5IE5V
TEwuICBXaXRob3V0IHRoaXMgdGhlIGt3b3JrZXIgdXN1YWxseSB3aW5zIGFuZAoJICogdGhlIGJv
eCBkaWVzIG9mIGEgZGlmZmVyZW50IGJ1ZyAoYSBzbGFiLXVzZS1hZnRlci1mcmVlIGluCgkgKiBk
dW1teV90aW1lciBvbiB0aGUgZnJlZWQgdHJhbnNmZXIgYnVmZmVyKSBpbnN0ZWFkLiAqLwoJcGlu
X3RoaXNfdGhyZWFkX3RvX2NwdSgxKTsKCWlmIChzY2hlZF9zZXRzY2hlZHVsZXIoMCwgU0NIRURf
RklGTywgJnJlYWx0aW1lX3BhcmFtKSA8IDApCgkJcGVycm9yKCJzY2hlZF9zZXRzY2hlZHVsZXIi
KTsKCglpZiAoaW9jdGwodmlkZW9fZmQsIFZJRElPQ19TVFJFQU1PTiwgJmJ1ZmZlcl90eXBlKSA8
IDApIHsKCQlwZXJyb3IoIlZJRElPQ19TVFJFQU1PTiIpOwoJCXJldHVybiAxOwoJfQoJaW9jdGwo
dmlkZW9fZmQsIFZJRElPQ19TVFJFQU1PRkYsICZidWZmZXJfdHlwZSk7CgoJZnByaW50ZihzdGRl
cnIsICJubyBjcmFzaFxuIik7CglyZXR1cm4gMDsKfQo=
--000000000000fd57e0065b282adc--
