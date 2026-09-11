Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8251A3DAAA0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106666; cv=pass; b=X2ihkl5Rzcptzn06W4Wy0bM64wvUcHOIgzLUiPnVI0SJM8cXj49szv9vHg8x2o4XqpG7E4OS83pkxBwk+dbRHDOfQZqAkscNQpV+W8VX8XZGEDs+o8M3vQtztfxm5z7JYClD9EEzzmVw2Vlen+gVehsOqu/q1c+5Wx0+y9di9ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106666; c=relaxed/simple;
	bh=bJ0OPkbO/9t1gBsYtDK6TZUPm09QskdIS49RdNng5CM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=b4CJfnNLdM/LX5nyWq5ZKabbNqNlbO5kqWDOk4/v2HHJfdextgjsQNyHHSCMChBuRq4yN3+Q7w88OS6tiBWFdXlSAnyL/db93vzXz0b7KIE1t7sna3aKgiLu6M81iDgStTe1wpK5JIg0Joz2k5naU8a1f3XELxMjIRCLl3gJEFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=i8wyB290; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="i8wyB290"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so375625b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789106664; cv=none;
        d=google.com; s=arc-20260327;
        b=KLKkHua7B+9VvLGQlRzZJ4js13faSrZ89m+ntHbOpVqeLsDLNcVrCf3ysL60ixF+Vk
         gUZrLxwrEqsl5qmkYweg6M3blyH2s6plO4CzmEl0lC4QC3mSJgX5t4wKbTYyn2NbH7Yi
         tSFIVZjCVZIZ+a6XbQVcuZySTacC5mAh4AJnJ2rgoWj06J4ZPWySFFw7V5D/1OY8Q/qw
         dbJsUlW0MhOPfuMfBb47ZXiu8XAb9TAIL3CDNdp5ETvD6QSaGVCpy9H/23Hu+G8vYrFg
         cR+H7glPXGvWYAED0OC/r3xxQY/Kt/aytX9LuRAAQdE+fb9dL6o17CpQ+Qn5iqfYW6aO
         Tuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5z7yTOmaO6+UWlaRngY9pYH4yaorpsd24Dr+PJIAzmo=;
        fh=sPBDBq69+wYLu4DdL+TNjGmbLyl5Ec2YTDWvpGJe7R0=;
        b=ssTA1ebwo5WbJFmtscEt/GjPjkLidlrQuiX+kVBq60vzowypLdKC0gyBERy6dTvvX1
         JwzEJXK/Xh9VAqtKlEH/KYnJKb+Bwu+uqOqxO9594G1Hp6zGRnHh5r0c9i2YzOUaahh6
         gu7VZzh/D3pVgtMbx9khPUONJi3fciOLlqkzqdrtueOC5O48K3EK7W7fIHsjY8EFE07P
         l3dEwQ88rBXA92+ISDF2CBKOCYC3Tii4WCqrVoUmw7Ok/z157HZyBvQ2D8QS1CcylIIC
         bEyRoRYfe5XR3xjyvgTQyUNJxmHiiiqF/B3yFQH3qMhDnIu611l81XVlwRwsUB3ju/L1
         j2zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789106664; x=1789711464; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5z7yTOmaO6+UWlaRngY9pYH4yaorpsd24Dr+PJIAzmo=;
        b=i8wyB290wP2kP2op1FPhMVAWy9DjVeHbmuXqoZ8GQ+qOIHm4il0srjDJIKwouBFYKL
         fSwJNv5JQQtPczjNQJAiGwIIZBRirBQOxLhCFcXA5EO5tqz8If/iB05wnRyWtO69tDwU
         z3JhGa3+dc+rRVDYs+uVXg/wrfy1K0T7Sgu/Z+hgHbpUNPCC3faN2HC8BQkq8EcMlHPD
         R+O/gJsQV+juVhTwMyTeQx8TVEn5aoi9AmYhS0tLHualjHHukd05BW26mZ2yDdqxzv+T
         c/R3JxiOfcQGOgq55WAZyyVTW5R+nH9p7jvgBunN4HRF9cT5aB3EfdNkKcv3M6E5SvNC
         bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106664; x=1789711464;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5z7yTOmaO6+UWlaRngY9pYH4yaorpsd24Dr+PJIAzmo=;
        b=G+f4QIQgnY1CBn4+aZxaxfrUhjEwSKnPRn3ZLqvnzOCJxCiGo9q2rOFtXh7n4FTpEo
         b14T4vnpTibrHv1Cd2Mesg1HHUG18DK9/GF2mDTlSH0g7LuJNkL+EXMmFVV4KPkmTMh9
         JZZz83xpOgb4zmzlSsZpaOOVpcuDQW1Z4ENMh44aWlHeRycaMgPn+YvKX2UNxYZk77Kn
         ISwRyWvSVdaTk8sR9KhVrnGUqnpaaxxk3Yth1YVzGHdMkk8cOtZA9pelhOSfEZZMEp7W
         iUdfHzBxAXC0+I6Xlq+5xG9SldGaVR06X0CzNq713UHPP5jtw6GGXT6EGpJGTaj26ilv
         D21w==
X-Forwarded-Encrypted: i=1; AKwUvBx8LojWafUMs0XieNXogKx2H3YN4HQnN7EDGMOaIevmVXDJThMjHaDj0gPLXsWNnr9hNfUXNSj9sLPtRqo=@vger.kernel.org
X-Gm-Message-State: AFuF++m8v3wTZU/4qju14w6WXUlyhDLqxFkDrepXZMu9EDX5tuYtSFhH
	HMo3bd+ljv3Xt0pSI7qrj9JyIeKwU02XmI//qKnukrOOk4+j4oqRtNpW3yLdogwlMFt7e0fcX4u
	UuDXQvFPfdfOq6QpyMaTZJgHiWEvWLU+61V8zh7R+7NVSDZmya6lyIbGx5GDsJA==
X-Gm-Gg: AYBFou0yh4vtJgC0f4SaFbIyU0gGasSCcj3YiuZVqiErAnW473vjspdLiOoldXg5ZUc
	y8yuwG2UK5mCdR+Ku4bWjZz4hvjehr0tVt81TxfvzW434CEzNEcd0DJBDtm2388BUHTxchh0Lnj
	rTwv+Lugw+L0GmT0Nka58/8BrB37OoMeysyfxn7ghIrR29/myWojKcyaCwGFWCT3U5ORgqyA3H+
	dZHpYQl4himo45jexb+Y/wTFjtteA3JXLz6Lkx2hp/87wdCayaNJqGlcUK2/hfC9n62tCdR2dEi
	0kGZ5MtlDbybfy7QCFHAs0q6awbl6RTYc1FJM73n5GFVMB0oc0Tuf9m+DD0YwhuVsj6nDcRTOGy
	YRtsYwwUqD+uxWdxK2UNyV1F9coS9JLtlsq4xefzvFo3fmbLJZAPwAM6HYK3NpXwfClHrDiVP8Y
	8=
X-Received: by 2002:a05:6a00:a244:b0:869:9757:49bb with SMTP id
 d2e1a72fcca58-86b2e7ef091mr4284374b3a.9.1789106662592; Thu, 10 Sep 2026
 23:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 10 Sep 2026 23:04:11 -0700
X-Gm-Features: AcwNN1V15Qz-ZJgqF4d8DYVprwBMzCVRZYN0-24JfyGNJHe__LDkhE5o1X9LgVc
Message-ID: <CA+0ovCh63ei3SWria1JexWc0r9ckhj=XVNhXSzgHQFMUEj+ypA@mail.gmail.com>
Subject: [BUG] general protection fault in m5602_stop_transfer
To: Erik Andren <erik.andren@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Farhad Alemi <falemi@asu.edu>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000001836e3065b2edb90"

--0000000000001836e3065b2edb90
Content-Type: text/plain; charset="UTF-8"

Hello,

We are reporting the following crash (reproducer attached and a
proposed patch forthcoming):
Linux version 7.3.0-rc2 50d05c7c76c96b90462f24debacca971d2e86713
Build Config: UpstreamAppArmorKASAN (KASAN + UBSAN, panic_on_warn=1)

[   52.671675][ T9483] Oops: general protection fault, probably for
non-canonical address 0xdffffc0000000009: 0000 [#1] SMP KASAN NOPTI
[   52.826702][ T9483] KASAN: null-ptr-deref in range
[0x0000000000000048-0x000000000000004f]
[   52.827517][ T9483] CPU: 0 UID: 0 PID: 9483 Comm: repro Not tainted
7.3.0-rc2-00099-g50d05c7c76c9 #1 PREEMPT(full)
[   52.828543][ T9483] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009), BIOS 1.17.0-debian-1.17.0-1ubuntu1 04/01/2014
[   52.829635][ T9483] RIP: 0010:m5602_stop_transfer+0x46/0x90
[   52.830190][ T9483] Code: 8d b3 28 0d 00 00 4c 89 f0 48 c1 e8 03 42
80 3c 38 00 74 08 4c 89 f7 e8 18 7b 00 fa 4d 8b 36 49 83 c6 48 4c 89
f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 fb 7a 00 fa 4d 8b 36
4d 85 f6 74
[   52.831934][ T9483] RSP: 0018:ffffc9000828fb58 EFLAGS: 00010206
[   52.832509][ T9483] RAX: 0000000000000009 RBX: ffff8881124a4000
RCX: ffff888024528000
[   52.833304][ T9483] RDX: 0000000000000000 RSI: 0000000000000002
RDI: ffff8881124a4000
[   52.834093][ T9483] RBP: dffffc0000000000 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   52.834877][ T9483] R10: dffffc0000000000 R11: ffffffff88371ac0
R12: dffffc0000000000
[   52.835657][ T9483] R13: 1ffff11022494976 R14: 0000000000000048
R15: dffffc0000000000
[   52.836454][ T9483] FS:  0000000005e01400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   52.837331][ T9483] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   52.837981][ T9483] CR2: 000056177bfecf78 CR3: 0000000024331000
CR4: 0000000000752ef0
[   52.838744][ T9483] PKRU: 55555554
[   52.839089][ T9483] Call Trace:
[   52.839491][ T9483]  <TASK>
[   52.839782][ T9483]  ? __pfx_m5602_stop_transfer+0x10/0x10
[   52.840315][ T9483]  gspca_stream_off+0xb7/0x400
[   52.840769][ T9483]  gspca_stop_streaming+0x48/0x1e0
[   52.841235][ T9483]  ? ima_file_free+0x16b/0x5d0
[   52.841686][ T9483]  ? __pfx_gspca_stop_streaming+0x10/0x10
[   52.842243][ T9483]  __vb2_queue_cancel+0xba/0xdb0
[   52.842742][ T9483]  ? __asan_memset+0x22/0x50
[   52.843194][ T9483]  ? __fsnotify_parent+0x267/0x620
[   52.843695][ T9483]  __vb2_cleanup_fileio+0x4e/0x1f0
[   52.844187][ T9483]  vb2_core_queue_release+0x27/0x150
[   52.844698][ T9483]  vb2_fop_release+0x16e/0x200
[   52.845137][ T9483]  v4l2_release+0x250/0x370
[   52.845566][ T9483]  ? __pfx_v4l2_release+0x10/0x10
[   52.846023][ T9483]  __fput+0x44f/0xa60
[   52.846404][ T9483]  fput_close_sync+0x11f/0x240
[   52.846846][ T9483]  ? __pfx_fput_close_sync+0x10/0x10
[   52.847349][ T9483]  __x64_sys_close+0x7e/0x110
[   52.847817][ T9483]  do_syscall_64+0x155/0x510
[   52.848287][ T9483]  ? trace_irq_disable+0x3b/0x140
[   52.848862][ T9483]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.849551][ T9483]  ? clear_bhb_loop+0x30/0x80
[   52.850003][ T9483]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   52.850602][ T9483] RIP: 0033:0x456ed6
[   52.850997][ T9483] Code: 47 ba 04 00 00 00 48 c7 c0 f0 ff ff ff 64
89 10 48 c7 c2 ff ff ff ff c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48
8b 45 10 0f 05 <48> 89 c2 48 3d 00 f0 ff ff 77 0f c9 48 89 d0 c3 66 2e
0f 1f 84 00
[   52.852863][ T9483] RSP: 002b:00007ffd18c13250 EFLAGS: 00000202
ORIG_RAX: 0000000000000003
[   52.853659][ T9483] RAX: ffffffffffffffda RBX: 0000000000000001
RCX: 0000000000456ed6
[   52.854415][ T9483] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000003
[   52.855261][ T9483] RBP: 00007ffd18c13260 R08: 0000000000000000
R09: 0000000000000000
[   52.856254][ T9483] R10: 0000000000000000 R11: 0000000000000202
R12: 00007ffd18c15668
[   52.857009][ T9483] R13: 00007ffd18c15678 R14: 0000000000000002
R15: 00000000004b3100
[   52.857784][ T9483]  </TASK>
[   52.858096][ T9483] Modules linked in:
[   52.858690][ T9483] ---[ end trace 0000000000000000 ]---
[   52.859988][ T9483] RIP: 0010:m5602_stop_transfer+0x46/0x90
[   52.860003][ T9483] Code: 8d b3 28 0d 00 00 4c 89 f0 48 c1 e8 03 42
80 3c 38 00 74 08 4c 89 f7 e8 18 7b 00 fa 4d 8b 36 49 83 c6 48 4c 89
f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 fb 7a 00 fa 4d 8b 36
4d 85 f6 74
[   52.860008][ T9483] RSP: 0018:ffffc9000828fb58 EFLAGS: 00010206
[   52.860015][ T9483] RAX: 0000000000000009 RBX: ffff8881124a4000
RCX: ffff888024528000
[   52.860020][ T9483] RDX: 0000000000000000 RSI: 0000000000000002
RDI: ffff8881124a4000
[   52.860024][ T9483] RBP: dffffc0000000000 R08: ffffffff90563d7f
R09: 1ffffffff20ac7af
[   52.860029][ T9483] R10: dffffc0000000000 R11: ffffffff88371ac0
R12: dffffc0000000000
[   52.860034][ T9483] R13: 1ffff11022494976 R14: 0000000000000048
R15: dffffc0000000000
[   52.860038][ T9483] FS:  0000000005e01400(0000)
GS:ffff8880d7388000(0000) knlGS:0000000000000000
[   52.860052][ T9483] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   52.860056][ T9483] CR2: 00007f66069c6dc0 CR3: 0000000024331000
CR4: 0000000000752ef0
[   52.860063][ T9483] PKRU: 55555554
[   52.860071][ T9483] Kernel panic - not syncing: Fatal exception
[   52.870715][ T9483] Kernel Offset: disabled
[   52.871260][ T9483] Rebooting in 86400 seconds..

Regards,
SEFCOM Lab @ ASU

--0000000000001836e3065b2edb90
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtwjwkhq0>
X-Attachment-Id: f_mtwjwkhq0

LyoKICogMjI5LWdlbmVyYWwtcHJvdGVjdGlvbi1mYXVsdC1pbi1tNTYwMi1zdG9wLXRyYW5zZmVy
CiAqLwojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2luY2x1ZGUgPGZj
bnRsLmg+CiNpbmNsdWRlIDxzaWduYWwuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5jbHVkZSA8
c3RkaW8uaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiNpbmNs
dWRlIDxzeXMvd2FpdC5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxsaW51eC91c2Iv
Y2g5Lmg+CiNpbmNsdWRlIDxsaW51eC91c2IvcmF3X2dhZGdldC5oPgoKI2RlZmluZSBFUDBfTUFY
X1RSQU5TRkVSIDQwOTYKCnN0YXRpYyBpbnQgcmF3X2dhZGdldF9mZCA9IC0xOwoKLyogMDQwMjo1
NjAyIGlzIHRoZSBvbmx5IGlkIGluIGdzcGNhX201NjAyJ3MgdXNiX2RldmljZV9pZCB0YWJsZS4g
QWxsIHRocmVlCiAqIHN0cmluZyBpbmRpY2VzIGFyZSAwIHNvIHRoZSBob3N0IG5ldmVyIGFza3Mg
Zm9yIGEgc3RyaW5nIGRlc2NyaXB0b3IuICovCnN0YXRpYyBzdHJ1Y3QgdXNiX2RldmljZV9kZXNj
cmlwdG9yIG01NjAyX2RldmljZV9kZXNjcmlwdG9yID0gewoJLmJMZW5ndGggPSBzaXplb2Yoc3Ry
dWN0IHVzYl9kZXZpY2VfZGVzY3JpcHRvciksCgkuYkRlc2NyaXB0b3JUeXBlID0gVVNCX0RUX0RF
VklDRSwKCS5iY2RVU0IgPSAweDAyMDAsCgkuYk1heFBhY2tldFNpemUwID0gNjQsCgkuaWRWZW5k
b3IgPSAweDA0MDIsCgkuaWRQcm9kdWN0ID0gMHg1NjAyLAoJLmJjZERldmljZSA9IDB4MDEwMCwK
CS5iTnVtQ29uZmlndXJhdGlvbnMgPSAxLAp9OwoKLyogT25lIGludGVyZmFjZSB3aXRoIG9uZSBp
c29jaHJvbm91cyBJTiBlbmRwb2ludDogZ3NwY2EgYmluZHMgdGhlIGlzb2MKICogdHJhbnNmZXIg
cGF0aCwgd2hpY2ggaXMgd2hhdCBtYWtlcyB2YjIgcmVhY2ggc3RhcnRfc3RyZWFtaW5nLiAqLwpz
dGF0aWMgY29uc3QgdWludDhfdCBtNTYwMl9jb25maWdfZGVzY3JpcHRvcltdID0gewoJOSwgVVNC
X0RUX0NPTkZJRywgKDkgKyA5ICsgNykgJiAweGZmLCAwLCAxLCAxLCAwLCAweGEwLCAweGZhLAoJ
OSwgVVNCX0RUX0lOVEVSRkFDRSwgMCwgMCwgMSwgMHhmZiwgMHhmZiwgMHhmZiwgMCwKCTcsIFVT
Ql9EVF9FTkRQT0lOVCwgMHg4MSwgVVNCX0VORFBPSU5UX1hGRVJfSVNPQywgMHgwMCwgMHgwMiwg
NCwKfTsKCnN0YXRpYyB2b2lkIGVwMF90cmFuc2ZlcihpbnQgaW9jdGxfcmVxdWVzdCwgY29uc3Qg
dm9pZCAqZGF0YSwgdWludDMyX3QgbmJ5dGVzKQp7Cgl1aW50OF90IHJhd19pb19zdG9yYWdlW3Np
emVvZihzdHJ1Y3QgdXNiX3Jhd19lcF9pbykgKyBFUDBfTUFYX1RSQU5TRkVSXTsKCXN0cnVjdCB1
c2JfcmF3X2VwX2lvICpyYXdfaW8gPSAodm9pZCAqKXJhd19pb19zdG9yYWdlOwoKCWlmIChuYnl0
ZXMgPiBFUDBfTUFYX1RSQU5TRkVSKQoJCW5ieXRlcyA9IEVQMF9NQVhfVFJBTlNGRVI7CglyYXdf
aW8tPmVwID0gMDsKCXJhd19pby0+ZmxhZ3MgPSAwOwoJcmF3X2lvLT5sZW5ndGggPSBuYnl0ZXM7
CglpZiAoZGF0YSAmJiBuYnl0ZXMpCgkJbWVtY3B5KHJhd19pby0+ZGF0YSwgZGF0YSwgbmJ5dGVz
KTsKCWlvY3RsKHJhd19nYWRnZXRfZmQsIGlvY3RsX3JlcXVlc3QsIHJhd19pbyk7Cn0KCnN0YXRp
YyB2b2lkIGhhbmRsZV9jb250cm9sX3JlcXVlc3Qoc3RydWN0IHVzYl9jdHJscmVxdWVzdCAqc2V0
dXApCnsKCXVpbnQ4X3QgcmVwbHlbRVAwX01BWF9UUkFOU0ZFUl07CglpbnQgcmVwbHlfbGVuZ3Ro
ID0gLTE7CgoJaWYgKChzZXR1cC0+YlJlcXVlc3RUeXBlICYgVVNCX1RZUEVfTUFTSykgPT0gVVNC
X1RZUEVfU1RBTkRBUkQpIHsKCQlzd2l0Y2ggKHNldHVwLT5iUmVxdWVzdCkgewoJCWNhc2UgVVNC
X1JFUV9HRVRfREVTQ1JJUFRPUjoKCQkJaWYgKChzZXR1cC0+d1ZhbHVlID4+IDgpID09IFVTQl9E
VF9ERVZJQ0UpIHsKCQkJCXJlcGx5X2xlbmd0aCA9IHNpemVvZihtNTYwMl9kZXZpY2VfZGVzY3Jp
cHRvcik7CgkJCQltZW1jcHkocmVwbHksICZtNTYwMl9kZXZpY2VfZGVzY3JpcHRvciwKCQkJCSAg
ICAgICByZXBseV9sZW5ndGgpOwoJCQl9IGVsc2UgaWYgKChzZXR1cC0+d1ZhbHVlID4+IDgpID09
IFVTQl9EVF9DT05GSUcpIHsKCQkJCXJlcGx5X2xlbmd0aCA9IHNpemVvZihtNTYwMl9jb25maWdf
ZGVzY3JpcHRvcik7CgkJCQltZW1jcHkocmVwbHksIG01NjAyX2NvbmZpZ19kZXNjcmlwdG9yLAoJ
CQkJICAgICAgIHJlcGx5X2xlbmd0aCk7CgkJCX0KCQkJYnJlYWs7CgkJY2FzZSBVU0JfUkVRX1NF
VF9DT05GSUdVUkFUSU9OOgoJCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lPQ1RMX0NP
TkZJR1VSRSwgMCk7CgkJCXJlcGx5X2xlbmd0aCA9IDA7CgkJCWJyZWFrOwoJCX0KCX0gZWxzZSB7
CgkJLyogbTU2MDIgYnJpZGdlIHRyYWZmaWMgKHZlbmRvciByZXF1ZXN0IDB4MDQpLiBmb3JjZV9z
ZW5zb3IKCQkgKiBzaG9ydC1jaXJjdWl0cyBvdjk2NTBfcHJvYmUgKG01NjAyX292OTY1MC5jKSwg
c28gbm8gcmVnaXN0ZXIKCQkgKiB2YWx1ZSBoYXMgdG8gYmUgZW11bGF0ZWQ6IHplcm9zIGZvciBJ
TiwgZHJhaW4gZm9yIE9VVC4gKi8KCQlpZiAoc2V0dXAtPmJSZXF1ZXN0VHlwZSAmIFVTQl9ESVJf
SU4pIHsKCQkJcmVwbHlfbGVuZ3RoID0gc2V0dXAtPndMZW5ndGggPiBFUDBfTUFYX1RSQU5TRkVS
ID8KCQkJCUVQMF9NQVhfVFJBTlNGRVIgOiBzZXR1cC0+d0xlbmd0aDsKCQkJbWVtc2V0KHJlcGx5
LCAwLCByZXBseV9sZW5ndGgpOwoJCX0gZWxzZSB7CgkJCWVwMF90cmFuc2ZlcihVU0JfUkFXX0lP
Q1RMX0VQMF9SRUFELCBOVUxMLAoJCQkJICAgICBzZXR1cC0+d0xlbmd0aCk7CgkJCXJldHVybjsK
CQl9Cgl9CgoJaWYgKHJlcGx5X2xlbmd0aCA8IDApIHsKCQlpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBV
U0JfUkFXX0lPQ1RMX0VQMF9TVEFMTCwgMCk7CgkJcmV0dXJuOwoJfQoJaWYgKHNldHVwLT5iUmVx
dWVzdFR5cGUgJiBVU0JfRElSX0lOKSB7CgkJaWYgKHJlcGx5X2xlbmd0aCA+IHNldHVwLT53TGVu
Z3RoKQoJCQlyZXBseV9sZW5ndGggPSBzZXR1cC0+d0xlbmd0aDsKCQllcDBfdHJhbnNmZXIoVVNC
X1JBV19JT0NUTF9FUDBfV1JJVEUsIHJlcGx5LCByZXBseV9sZW5ndGgpOwoJfSBlbHNlIHsKCQll
cDBfdHJhbnNmZXIoVVNCX1JBV19JT0NUTF9FUDBfUkVBRCwgTlVMTCwgc2V0dXAtPndMZW5ndGgp
OwoJfQp9CgpzdGF0aWMgdm9pZCBnYWRnZXRfZXZlbnRfbG9vcCh2b2lkKQp7Cgl1aW50OF90IGV2
ZW50X3N0b3JhZ2Vbc2l6ZW9mKHN0cnVjdCB1c2JfcmF3X2V2ZW50KSArIEVQMF9NQVhfVFJBTlNG
RVJdOwoJc3RydWN0IHVzYl9yYXdfZXZlbnQgKmV2ZW50ID0gKHZvaWQgKilldmVudF9zdG9yYWdl
OwoKCWZvciAoOzspIHsKCQlldmVudC0+dHlwZSA9IDA7CgkJZXZlbnQtPmxlbmd0aCA9IEVQMF9N
QVhfVFJBTlNGRVI7CgkJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfRVZF
TlRfRkVUQ0gsIGV2ZW50KSA8IDApCgkJCXJldHVybjsKCQlpZiAoZXZlbnQtPnR5cGUgPT0gVVNC
X1JBV19FVkVOVF9DT05UUk9MKQoJCQloYW5kbGVfY29udHJvbF9yZXF1ZXN0KAoJCQkJKHN0cnVj
dCB1c2JfY3RybHJlcXVlc3QgKilldmVudC0+ZGF0YSk7CgkJZWxzZSBpZiAoZXZlbnQtPnR5cGUg
PT0gVVNCX1JBV19FVkVOVF9ESVNDT05ORUNUKQoJCQlyZXR1cm47Cgl9Cn0KCnN0YXRpYyBpbnQg
ZmluZF9maXJzdF91ZGMoY2hhciAqZHJpdmVyX25hbWUsIHNpemVfdCBkcml2ZXJfbmFtZV9zaXpl
LAoJCQkgIGNoYXIgKmRldmljZV9uYW1lLCBzaXplX3QgZGV2aWNlX25hbWVfc2l6ZSkKewoJRElS
ICp1ZGNfZGlyID0gb3BlbmRpcigiL3N5cy9jbGFzcy91ZGMiKTsKCXN0cnVjdCBkaXJlbnQgKnVk
Y19lbnRyeTsKCWNoYXIgKmluc3RhbmNlX3N1ZmZpeDsKCglpZiAoIXVkY19kaXIpCgkJcmV0dXJu
IC0xOwoJd2hpbGUgKCh1ZGNfZW50cnkgPSByZWFkZGlyKHVkY19kaXIpKSkgewoJCWlmICh1ZGNf
ZW50cnktPmRfbmFtZVswXSA9PSAnLicpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKGRldmljZV9u
YW1lLCBkZXZpY2VfbmFtZV9zaXplLCAiJXMiLAoJCQkgdWRjX2VudHJ5LT5kX25hbWUpOwoJCXNu
cHJpbnRmKGRyaXZlcl9uYW1lLCBkcml2ZXJfbmFtZV9zaXplLCAiJXMiLAoJCQkgdWRjX2VudHJ5
LT5kX25hbWUpOwoJCS8qICJkdW1teV91ZGMuMiIgaXMgdGhlIGRldmljZTsgaXRzIGRyaXZlciBp
cyAiZHVtbXlfdWRjIi4gKi8KCQlpbnN0YW5jZV9zdWZmaXggPSBzdHJyY2hyKGRyaXZlcl9uYW1l
LCAnLicpOwoJCWlmIChpbnN0YW5jZV9zdWZmaXgpCgkJCSppbnN0YW5jZV9zdWZmaXggPSAwOwoJ
CWNsb3NlZGlyKHVkY19kaXIpOwoJCXJldHVybiAwOwoJfQoJY2xvc2VkaXIodWRjX2Rpcik7Cgly
ZXR1cm4gLTE7Cn0KCi8qIGdzcGNhIG5hbWVzIGV2ZXJ5IGNhbWVyYSdzIHZpZGVvX2RldmljZSAi
Z3NwY2EgbWFpbiBkcml2ZXIiIChnc3BjYS5jKSwgc28KICogdGhlIG01NjAyIG1vZHVsZSBuYW1l
IG5ldmVyIGFwcGVhcnMgaW4gL3N5cy9jbGFzcy92aWRlbzRsaW51eC92aWRlb04vbmFtZS4gKi8K
c3RhdGljIGludCBmaW5kX2dzcGNhX3ZpZGVvX25vZGUoY2hhciAqbm9kZV9wYXRoLCBzaXplX3Qg
bm9kZV9wYXRoX3NpemUpCnsKCURJUiAqdjRsX2RpciA9IG9wZW5kaXIoIi9zeXMvY2xhc3Mvdmlk
ZW80bGludXgiKTsKCXN0cnVjdCBkaXJlbnQgKnY0bF9lbnRyeTsKCWludCBmb3VuZCA9IDA7CgoJ
aWYgKCF2NGxfZGlyKQoJCXJldHVybiAtMTsKCXdoaWxlICghZm91bmQgJiYgKHY0bF9lbnRyeSA9
IHJlYWRkaXIodjRsX2RpcikpKSB7CgkJY2hhciBuYW1lX3BhdGhbNTEyXSwgZGV2aWNlX25hbWVb
MjU2XTsKCQlpbnQgbmFtZV9mZCwgbmJ5dGVzOwoKCQlpZiAoc3RybmNtcCh2NGxfZW50cnktPmRf
bmFtZSwgInZpZGVvIiwgNSkpCgkJCWNvbnRpbnVlOwoJCXNucHJpbnRmKG5hbWVfcGF0aCwgc2l6
ZW9mKG5hbWVfcGF0aCksCgkJCSAiL3N5cy9jbGFzcy92aWRlbzRsaW51eC8lcy9uYW1lIiwgdjRs
X2VudHJ5LT5kX25hbWUpOwoJCW5hbWVfZmQgPSBvcGVuKG5hbWVfcGF0aCwgT19SRE9OTFkpOwoJ
CWlmIChuYW1lX2ZkIDwgMCkKCQkJY29udGludWU7CgkJbmJ5dGVzID0gcmVhZChuYW1lX2ZkLCBk
ZXZpY2VfbmFtZSwgc2l6ZW9mKGRldmljZV9uYW1lKSAtIDEpOwoJCWNsb3NlKG5hbWVfZmQpOwoJ
CWlmIChuYnl0ZXMgPD0gMCkKCQkJY29udGludWU7CgkJZGV2aWNlX25hbWVbbmJ5dGVzXSA9IDA7
CgkJaWYgKHN0cnN0cihkZXZpY2VfbmFtZSwgImdzcGNhIikpIHsKCQkJc25wcmludGYobm9kZV9w
YXRoLCBub2RlX3BhdGhfc2l6ZSwgIi9kZXYvJXMiLAoJCQkJIHY0bF9lbnRyeS0+ZF9uYW1lKTsK
CQkJZm91bmQgPSAxOwoJCX0KCX0KCWNsb3NlZGlyKHY0bF9kaXIpOwoJcmV0dXJuIGZvdW5kID8g
MCA6IC0xOwp9CgpzdGF0aWMgdm9pZCBmb3JjZV9vdjk2NTBfc2Vuc29yKHZvaWQpCnsKCS8qIDEg
PT0gT1Y5NjUwX1NFTlNPUiAobTU2MDJfc2Vuc29yLmgpLiBvdjk2NTBfcHJvYmUoKSB0aGVuIHJl
dHVybnMKCSAqIHN1Y2Nlc3MgaW1tZWRpYXRlbHkgYW5kIG5vIHNlbnNvciByZWdpc3RlciByZWFk
cyBoYXZlIHRvIGJlIGZha2VkLiAqLwoJaW50IHBhcmFtX2ZkID0gb3BlbigiL3N5cy9tb2R1bGUv
Z3NwY2FfbTU2MDIvcGFyYW1ldGVycy9mb3JjZV9zZW5zb3IiLAoJCQkgICAgT19XUk9OTFkpOwoK
CWlmIChwYXJhbV9mZCA8IDApCgkJcmV0dXJuOwoJd3JpdGUocGFyYW1fZmQsICIxIiwgMSk7Cglj
bG9zZShwYXJhbV9mZCk7Cn0KCmludCBtYWluKHZvaWQpCnsKCWNoYXIgdWRjX2RyaXZlcl9uYW1l
WzEyOF0sIHVkY19kZXZpY2VfbmFtZVsxMjhdLCB2aWRlb19ub2RlX3BhdGhbMTI4XTsKCXN0cnVj
dCB1c2JfcmF3X2luaXQgcmF3X2luaXQ7CglwaWRfdCBnYWRnZXRfcGlkOwoJaW50IHZpZGVvX2Zk
LCBhdHRlbXB0OwoJY2hhciBjYXB0dXJlX2J1ZmZlcls4MTkyXTsKCglmb3JjZV9vdjk2NTBfc2Vu
c29yKCk7CgoJaWYgKGZpbmRfZmlyc3RfdWRjKHVkY19kcml2ZXJfbmFtZSwgc2l6ZW9mKHVkY19k
cml2ZXJfbmFtZSksCgkJCSAgIHVkY19kZXZpY2VfbmFtZSwgc2l6ZW9mKHVkY19kZXZpY2VfbmFt
ZSkpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAibm8gVURDIHVuZGVyIC9zeXMvY2xhc3MvdWRj
XG4iKTsKCQlyZXR1cm4gMTsKCX0KCglnYWRnZXRfcGlkID0gZm9yaygpOwoJaWYgKGdhZGdldF9w
aWQgPCAwKQoJCXJldHVybiAxOwoJaWYgKGdhZGdldF9waWQgPT0gMCkgewoJCXJhd19nYWRnZXRf
ZmQgPSBvcGVuKCIvZGV2L3Jhdy1nYWRnZXQiLCBPX1JEV1IpOwoJCWlmIChyYXdfZ2FkZ2V0X2Zk
IDwgMCkKCQkJX2V4aXQoMSk7CgkJbWVtc2V0KCZyYXdfaW5pdCwgMCwgc2l6ZW9mKHJhd19pbml0
KSk7CgkJc3RybmNweSgoY2hhciAqKXJhd19pbml0LmRyaXZlcl9uYW1lLCB1ZGNfZHJpdmVyX25h
bWUsCgkJCXNpemVvZihyYXdfaW5pdC5kcml2ZXJfbmFtZSkgLSAxKTsKCQlzdHJuY3B5KChjaGFy
ICopcmF3X2luaXQuZGV2aWNlX25hbWUsIHVkY19kZXZpY2VfbmFtZSwKCQkJc2l6ZW9mKHJhd19p
bml0LmRldmljZV9uYW1lKSAtIDEpOwoJCXJhd19pbml0LnNwZWVkID0gVVNCX1NQRUVEX0hJR0g7
CgkJaWYgKGlvY3RsKHJhd19nYWRnZXRfZmQsIFVTQl9SQVdfSU9DVExfSU5JVCwgJnJhd19pbml0
KSA8IDApCgkJCV9leGl0KDEpOwoJCWlmIChpb2N0bChyYXdfZ2FkZ2V0X2ZkLCBVU0JfUkFXX0lP
Q1RMX1JVTiwgMCkgPCAwKQoJCQlfZXhpdCgxKTsKCQlnYWRnZXRfZXZlbnRfbG9vcCgpOwoJCV9l
eGl0KDApOwoJfQoKCXZpZGVvX25vZGVfcGF0aFswXSA9IDA7Cglmb3IgKGF0dGVtcHQgPSAwOyBh
dHRlbXB0IDwgMjUwOyBhdHRlbXB0KyspIHsKCQlpZiAoZmluZF9nc3BjYV92aWRlb19ub2RlKHZp
ZGVvX25vZGVfcGF0aCwKCQkJCQkgIHNpemVvZih2aWRlb19ub2RlX3BhdGgpKSA9PSAwKQoJCQli
cmVhazsKCQl1c2xlZXAoMTAwMDAwKTsKCX0KCWlmICghdmlkZW9fbm9kZV9wYXRoWzBdKSB7CgkJ
ZnByaW50ZihzdGRlcnIsICJnc3BjYSB2aWRlbyBub2RlIG5ldmVyIGFwcGVhcmVkXG4iKTsKCQlr
aWxsKGdhZGdldF9waWQsIFNJR0tJTEwpOwoJCXdhaXRwaWQoZ2FkZ2V0X3BpZCwgTlVMTCwgMCk7
CgkJcmV0dXJuIDE7Cgl9Cgl1c2xlZXAoMjAwMDAwKTsKCgl2aWRlb19mZCA9IG9wZW4odmlkZW9f
bm9kZV9wYXRoLCBPX1JEV1IgfCBPX05PTkJMT0NLKTsKCWlmICh2aWRlb19mZCA8IDApIHsKCQlm
cHJpbnRmKHN0ZGVyciwgIm9wZW4gJXMgZmFpbGVkXG4iLCB2aWRlb19ub2RlX3BhdGgpOwoJCWtp
bGwoZ2FkZ2V0X3BpZCwgU0lHS0lMTCk7CgkJd2FpdHBpZChnYWRnZXRfcGlkLCBOVUxMLCAwKTsK
CQlyZXR1cm4gMTsKCX0KCgkvKiB2YjIgZmlsZWlvIGRvZXMgcmVxYnVmcyArIHN0cmVhbW9uIGlu
c2lkZSB0aGlzIHJlYWQoKSwgd2hpY2ggaXMgd2hhdAoJICogc2V0cyBxLT5zdGFydF9zdHJlYW1p
bmdfY2FsbGVkLiBJdCByZXR1cm5zIEVBR0FJTjsgdGhhdCBpcyBmaW5lLiAqLwoJcmVhZCh2aWRl
b19mZCwgY2FwdHVyZV9idWZmZXIsIHNpemVvZihjYXB0dXJlX2J1ZmZlcikpOwoJdXNsZWVwKDMw
MDAwMCk7CgoJLyogRGlzY29ubmVjdDogbTU2MDJfZGlzY29ubmVjdCgpIC0+IHNlbnNvci0+ZGlz
Y29ubmVjdCgpIC0+IHRoZSBzZW5zb3IKCSAqIGJhY2sgZW5kIGVuZHMgd2l0aCAic2QtPnNlbnNv
ciA9IE5VTEwiIChlLmcuIG01NjAyX292OTY1MC5jKS4gKi8KCWtpbGwoZ2FkZ2V0X3BpZCwgU0lH
S0lMTCk7Cgl3YWl0cGlkKGdhZGdldF9waWQsIE5VTEwsIDApOwoJdXNsZWVwKDUwMDAwMCk7CgoJ
LyogQ3Jhc2g6IHZiMl9mb3BfcmVsZWFzZSAtPiBfX3ZiMl9xdWV1ZV9jYW5jZWwgLT4gZ3NwY2Ff
c3RvcF9zdHJlYW1pbmcKCSAqIC0+IGdzcGNhX3N0cmVhbV9vZmYgLT4gbTU2MDJfc3RvcF90cmFu
c2Zlciwgd2hpY2ggZGVyZWZlcmVuY2VzIHRoZQoJICogTlVMTCBzZC0+c2Vuc29yLiAqLwoJY2xv
c2UodmlkZW9fZmQpOwoJcmV0dXJuIDA7Cn0K
--0000000000001836e3065b2edb90--
