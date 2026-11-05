Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851439;
	b=XRtQ81Crs1xuWtHbucd9JX6/+OfHX19yvhQbnwZcU1UL6WHv36pDO0LKWWtqrMV66qtE
	 3Xv5IOBAKjpA3QTPEsb1Sybvn4oSpCSqQqjXqObAdGn8vzJuKrHSHhLR3vS/Q50YOn+Fc
	 hj1KlDuofLbqNx5s/kk78nq0yGj+YIFPILJqRQqPZLlsVBN6tQGoXKDbLWjoTa/DoBpwU
	 IhugFDBh+Nn1osYRkgq7veTYkJbKUSsDTEJEBczfbPWzxo1zsx3aHihsY8bAen7pIqNrK
	 QiT+9gsiGIII2me1MdyEGHHG4ZQuEVCu/jWQ7+0Ki/NKGuH7HsZJ3C/OLCTUB0BROhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=AouVsEJi67JgAtqfY1MqGUWfrdWF3xPqbsbhWzfoN5g=;
	b=wal3xS1JLfc1F/UJqWdt3vceFcU4yP5WVeiDt97xo20XcdG91ZUJU2ji/2HW3C5j7L5o
	 EL7HZlwR7CsdD0Do5rdBlbeyBr1FkR81MwIahSDALb8BxDpe8k92VtfFRBE+jpsDFpwTT
	 DeXGMjbeD2uhmshOEVET6AnMUCM/dgtA5AKtGQ4tQ4F/9MAv3S+OUOz7KB6ssw1/1n/Av
	 5yyNTBE6qQ+Qg0VmJQp9/ZRnB7w2e0s8PhLn2gsiFBW9N012E7hormmOl0/xKLYmNUAxi
	 fOr2Mi8L35HoF1jftnyvPfsjFG3DU5opmWh4DOY7SbsIWa6QZWZJt0dTEIlwE+rEUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMPkghEB;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A01E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QMPkghEB
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-703be215729so643256eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793851438; x=1794456238; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AouVsEJi67JgAtqfY1MqGUWfrdWF3xPqbsbhWzfoN5g=;
        b=QMPkghEBpkt8Ldmg6JQG6mf3EWelpLNaZiMfRPQmB1OmTdTwzKEwWrgEpPw1EK5V1Q
         lALkIlDp3yiEx2Zr5w2T6vNWiloqic/+yE9gB9h0jhKIagPbIaQNOcroxwWKfyE31Kzq
         l15Edr2y/vaPBY3/hHJDhLuuI3yFD3oVqEsnVQ5h0LvW2DmxUbT9KCBLSw6HOO+T8N/H
         5u7ghGm7pG9OaskIazdDFqv4xQUTzig2Ei3o3jsHf1VGrAuIuk8qsVXWou1Ulx7XdbKV
         kSuqdceAoYxQQ9kZs6iIUFBpCD5BxNz6KqYhGt7FUO7w4GFJUGWueKai4IT5WKXeeA9t
         ATdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851438; x=1794456238;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AouVsEJi67JgAtqfY1MqGUWfrdWF3xPqbsbhWzfoN5g=;
        b=Y9ykgr42ym+4rlqIgTZDvLFRxwporF5TnErzhQKUyIRTkcwQ3ex6F9qg5EVkbvNArj
         73iwww/xRkka26WeoPlQpZetUv9DY1EJcgW5wMuhnNTMo35rmssdHB6HDsE8eaJG9Yzt
         nPq+1Mw3L3kYfH1g5AsiE/h8OtASwPtJ0GUwKqbikgazN61Ia/nlPfx8+Gm/uLdhBXAu
         tkLAc17QIqwvDMJpZPNkfjBpbhtW0uuVLuXVlHoxrePiZBsUm81jAo1NoZptsuVqMaHa
         WJktAT1o7etsA+G5UGwe9bP7dYqnnDjqf0i9zG4/BFiyvsRFsyQjcG86x1Xr7fqEYI3y
         nPiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGaVSjjket7qgYngXfnCI9j4AV+PNc8LcWOlzixrU9JEV+/j+XiLiOudP2Zs3Fn2b4lxKRmWFC4nWTD9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DJpHr2wE2oQvPUFasJekNet4goMxKq3s9NAUBzPn1pE97NMtJ
	lnhrjjfTrAKiPXXf4HjLPpau4w22dnKc3Ke3dBgLhyHvr1kRQ2qcXv+N
X-Gm-Gg: AYBFou1hfzUtyo76zHtJ0FK3iFBJvPXNAKxe1FUDg2LX7CszK1UfV9oOkcQwpxcrMmZ
	eBzdOzZBGjVSmJ9bB9/L5eDr2re5jiYdUTpL9LkDKI7uIv5fk2j4yL/YK6asL1qqCpnhz2aRFgX
	0VYk1LzbiZD7RzhnVhnHU/k6t/Vj1t8aQrOzYNmdbMcFlJj79OhMgm5C2Y3HvuvPrhN6b1KRHEg
	ldjTZ82NHUNEbRVrbD5Ka2UT2BKWImUjkAKy6ozt0u6U2sA/oO3LJi5yR2eoHUk/22Qwco9TVhW
	yw6gsaGMjjfiDv4dZiIoUawy+m6k5lBzcMFxSfd9rRuFQGMIaL/3UyPnYYqUOcNYh6nzaHjOZO9
	LKUn2z6OIH8BBeUg/qrqPfCDYc0BRi9VQSrC6TRioz7wUWX3RSdQkqTMSCVJ8G6aGXyCcQ4sWIT
	P6pc1o971hd+kxQQE8tBu3EBBuDwqnygAN5EvbeRzYWQLvVsg0rJsxF7MLZWZzRzrG/l6fT/Ocb
	wUf3/uzM4E64MLyKD8vegBx2szjLqYTsExQQaT509ZxuoGlYzZ0Z+gLpXYiaxQh0UzRd8xvNFRY
	UNTA6rdhDVe6uC3fM9nPp+CEot4rAmAR4OsHaCd96omiiEy76ouK16IYKHYbEFu83rVdC19stbH
	3ISpJRJY3YEHsQAknxIt6/68xggblZRmCU06xZEHTNwD/j0kovmeVWcbOhp05hTYiWOh2ayKdq6
	exWk1Fid508cplbYJYiU8jgxPcfkEJoRH2P7+tH+2JXWCTaPd7MaWCFxYReISGNWOXgRuXVXzv
X-Received: by 2002:a05:6820:560b:b0:700:dac:ba85 with SMTP id 006d021491bc7-714f295ac1cmr6702854eaf.14.1793851438261;
        Wed, 04 Nov 2026 20:03:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12d1f36sm3018997eaf.8.2026.11.04.20.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:03:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 21:03:55 -0700
Subject: [PATCH] mtd: core: avoid overflow when checking data bounds
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-submit-mtd-oob-bounds-v1-v1-1-05209fce5a3e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB0wQ6ulVykuTDJpp2BSMlEK4
 t2b6vIt/t9AOQsr3JsNMq+ikmKFaRtwryk+GcVXA3XUG9NdUBc7S8G5eEzJok1L9IqrQXJXF24
 UaOgHqPknc5DvsX6Mp2v7Zlf+P9j3HzneXbd8AAAA
X-Change-ID: 20261104-submit-mtd-oob-bounds-v1-2c5cf82f2767
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtd_check_oob_ops() adds the starting offset to the data length before
comparing the result with the device size. On 64-bit systems, a request
with offs == 1 and ops->len == SIZE_MAX wraps that sum to zero and passes
the range check. The public read and write wrappers can then pass an
out-of-range request to the driver.

Validate the starting offset first, then compare the data length with
the remaining capacity. Preserve NULL-buffer length normalization and
empty requests at the end of the device.

Fixes: 5cdd929da53d ("mtd: Add sanity checks in mtd_write/read_oob()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..dda976ef52c9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1670,7 +1670,7 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (!ops->oobbuf)
 		ops->ooblen = 0;
 
-	if (offs < 0 || offs + ops->len > mtd->size)
+	if (offs < 0 || offs > mtd->size || ops->len > mtd->size - offs)
 		return -EINVAL;
 
 	if (ops->ooblen) {

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-oob-bounds-v1-2c5cf82f2767

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

