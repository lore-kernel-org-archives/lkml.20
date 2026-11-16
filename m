Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858929;
	b=oHm1fdRj0Dj5lui7FIx7/GYKMiluuziPMK2HDRsaWMlCiVr9u/8pThEa8X4ZUAFKuRT5
	 S6prG2tEfo4UVmC/NxZU8PnSSyo04x4LnWdRQetOdzUApO1gz5IVRiE8a2GP9TbGQqXl9
	 2FG0hBIBvEmjMDXtnLgEjgOX2siWfNOTj9yH4zKyE7mvXfAOaMC+msyBrVJ3akXhkXRFR
	 0PzRdSi4XNaHxViUXstvIlvZ0fhQqckTiVJdIMzqzheqhVcuEziqzscqA8/TvJaFB5biZ
	 Xkk5a1ZTsFqFYvXNEXdAgeOMnr9ekAirhyM7/EYvMoX8PqyPlROFUHnCU9o92Sizflw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZYix/OLdciQihq7DIwR9ubCLG7vIH820farEoUf4A/A=;
	b=igcJzbAaJ+GMsvNqOe+1sBKCNrpRe8GusYhC/Bqx2Um60/xkGvQOKIa5xRr2DXwixtru
	 h45zQ9LweviFZd7/ILUg5xN8awoMwNd6RlQXgrK6vaj0bUDtz7y2fh0sRQrK+xtspR12I
	 pHHHczxS2vBwKo+glFvKXXgFre0VrhKdT5myf6fKcHQTT8vr/sXHCfU7GSlVPkarMyK8a
	 YEUTQZidZ3pM8dvYnUsW+Ap9xUd50vhbHwRUCePhe4bWiLCIi8klrf2MsukYbKUM+jLCI
	 WChRkcfaVAsG8uCHJxSPIFoacnVo9IJ7N9180yoBlNfjp+CDgenpvIwQFHG2hms+exQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OePMjijy;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE40606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE40606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OePMjijy
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so151260137.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858928; x=1795463728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYix/OLdciQihq7DIwR9ubCLG7vIH820farEoUf4A/A=;
        b=OePMjijyJ15gubJKFAW+vUGCzLIYnT4IOOfJ+548xdDhlEwkw4AY3KHK4QXTEWcAsK
         RYO4U5wH3R17WxYKwcS/KtIHQJX7lJpJhJamOl1Ezn+p+MPp5JpfizpmaaWNwoCIwA8T
         psXxdIt+xkMy4gxffbkFkPkZsM73/TyWUGeyfMykJGFogsmJyMjVQCxrZzax/g+cNMkq
         0tTpGarBb6B6DlI414Hu9iMsEFEOVhrUB8ZDjo83iX+Zvse//Mjo3gI+S2afsM0g/LUa
         HTMlZ4doMwtM6Df0LYVIQjrAZ+1benWSjGmbnGShvD5iSiAEu1N53rRRHafCDv23jE//
         G8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858928; x=1795463728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYix/OLdciQihq7DIwR9ubCLG7vIH820farEoUf4A/A=;
        b=h36xAtPtmign2sgyiNf10wH1UkkDJBB8VFEC+/12DN6dE9ypokJyNGA1MfI1iM91tc
         kF4MK7yoPz7hQy3rIsK4bAd73P3EXpzBDQejJNRpE7240lA+IbWjOHAsXUUXCwK7ALrr
         8oRorBGSjhjBMEbmLSw+rg8yKHj4+3x0MES8P1t6si6PXmTf1N21kh0W6OLZTkaE15x9
         2VVmSrWwzMZj4R/kfVrJWWyNO+ay1dwoG+p5mdx0j63du0L5j8yHQ5zAU8nT8wivwFjZ
         DprM9lZkwUNQN8pHeryOMmFmahoC4shwEJMmiw5D67XClt7mzVYC3rFYKEahS+mCR8IE
         FFMA==
X-Forwarded-Encrypted: i=1; AL+hErEIDblrEx43dWif2zTN7ephI9SCmGksnCGJytI6hOdzputMfvNbsSceOyXaxulkm6fcir6HXcl5cuBSYOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aRWo82mKgh3TcvYdXMFMvuQ0TQBzj2GwBFR+DEt97TuKnl6B9
	4Pro1o/zJMcvPH1Nw0Am6gatdWkEKUwN+SkwpW8srKFexGKIKWnGIjis
X-Gm-Gg: AYBFou2m6yJC0DR2u5p6U11tIFim/AHM+15SbwuoseJn/GYbXZII8RqxyQNkNkbRiJu
	XCaL7n6rty0kVB0I0C4FIh0piyDwm09t59UVAcvgWX0/8osGEq1eImcNdjtQ/tcLJkOMFKlCluf
	JoGhoQ7x2dIuDh3n0+f1aOCnT7YA4q66rqrhPHR7hnfuusA/6q3ygrwM+Z7gJddZH2mAat1pbh8
	zsAEc07PH13QkEcX+fsSCPDojIvXDR3YaSmt15xpZrSu3RZA0NJ9Q553Fuo0SUDfUJMZO+v4X3B
	SdHCDMxSzT0oGKSHDGCs3ycFCvXxt6vScv8naP/mjEJF+oqIZqYgBEwMD7B4B2wCOt5kx1zWVFg
	bBvBQNyrTdricYL8dnpsqflGG1u3qUpk/XvwV4Knn0Yk9M1dlYsu1umXTQXwZJuhDkSQ/05S/o0
	L1wzy03jp1RENAAwsYEXQt9L2t7st5els8IEFItpiQtOsH3ErKSZoH+7R7JgvN6d77oxrhlXuIn
	2vVMxQlKFwQBp5j3ssYUL3AxgPQBjlV1jN/ARUdaD77+zATJv8Pze8i0bbxL+ydqPxMhytYyX+3
	nykbYdXswBaJtklv+0XtQh7+FfLzosMd33BDl1HbKA==
X-Received: by 2002:a05:6102:84c2:b0:7cb:bb7b:77e4 with SMTP id ada2fe7eead31-7d69f60aa43mr133060137.3.1794858927558;
        Mon, 16 Nov 2026 11:55:27 -0800 (PST)
Received: from budget-pc-cachyos ([37.19.211.133])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69dfe6e71sm720482137.6.2026.11.16.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:55:27 -0800 (PST)
From: Elliott Tyson <planetlinux98@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Elliott Tyson <planetlinux98@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vicki Pfau <vi@endrift.com>,
	stable@vger.kernel.org
Subject: [PATCH] Input: xpad - scale Xbox One rumble to the 0-100 GIP range
Date: Mon, 16 Nov 2026 14:53:58 -0500
Message-ID: <20261116195500.107990-1-planetlinux98@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GIP rumble command takes actuator levels from 0 to 100, but
xpad_play_effect() converts the 16-bit FF_RUMBLE magnitudes by dividing
by 512, which yields levels up to 127.

Not all pads handle out-of-range levels. On a PowerA XBX Spectra
Enhanced Wired Controller (20d6:4002), levels 1 to 100 produce
proportional rumble, 101 produces almost none, and 110 to 127 produce
only weak rumble. Any effect above about 78% of full magnitude,
including full-strength rumble, is therefore barely noticeable on this
pad.

Scale the magnitudes to 0-100 instead. This is the range used by SDL's
HIDAPI Xbox One driver and by the xbox_gip driver currently under
review on linux-input. Intermediate magnitudes now map to
proportionally lower levels than before; for example, half magnitude
sends 50 instead of 64.

The problem was diagnosed and this patch written with the help of an AI
coding assistant (Claude). The submitter tested it on the hardware
above and reviewed the change.

Fixes: 2a6d7527b35c ("Input: xpad - update Xbox One Force Feedback Support")
Cc: stable@vger.kernel.org
Signed-off-by: Elliott Tyson <planetlinux98@gmail.com>
---

Notes:
    Testing:
    - Built as a module against 7.3.4 (Clang, W=1) with no warnings and
      loaded on that kernel. A GCC/allmodconfig build was not done.
    - Hardware: PowerA XBX Spectra Enhanced Wired Controller (20d6:4002).
      FF_RUMBLE effects were uploaded directly with EVIOCSFF. Before the
      patch, full magnitude on both motors barely rumbled and half
      magnitude felt stronger; with the patch, rumble strength increases
      with magnitude all the way to full.
    - Not tested on a Microsoft-made controller or on other architectures.
    
    Behavior change for pads that already worked: below the old maximum,
    the same magnitude now gives a level about 22% lower (half magnitude
    sends 50 instead of 64). If you would rather keep those levels,
    clamping instead (min(strong / 512, 100)) also fixes this pad. I chose
    rescaling to match SDL and xbox_gip.
    
    The pending xbox_gip series (v7, patch 2 "Input: xpad - Remove Xbox One
    support") removes this code. This fix is meant for current and stable
    kernels in the meantime; please drop it if that series lands first.
    
    AI assistance: Claude Code (Claude Opus 5.5) found the cause using
    userspace FF_RUMBLE tests, wrote the code change and the commit
    message, and built the test module. I ran the hardware tests and
    reviewed the change and the description before submitting.

 drivers/input/joystick/xpad.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d2eb48d98fea..6cb3be9845fb 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1606,8 +1606,9 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 		packet->data[5] = GIP_MOTOR_ALL;
 		packet->data[6] = 0x00; /* left trigger */
 		packet->data[7] = 0x00; /* right trigger */
-		packet->data[8] = strong / 512;	/* left actuator */
-		packet->data[9] = weak / 512;	/* right actuator */
+		/* GIP actuator levels range from 0 to 100 */
+		packet->data[8] = strong * 100 / 0xffff;	/* left actuator */
+		packet->data[9] = weak * 100 / 0xffff;	/* right actuator */
 		packet->data[10] = 0xFF; /* on period */
 		packet->data[11] = 0x00; /* off period */
 		packet->data[12] = 0xFF; /* repeat count */

base-commit: ab13b5fc808e043a13f861a7c1c2ba8173c22b84
-- 
2.56.1

