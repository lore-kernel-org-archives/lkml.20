Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955789;
	b=D+BvKEOBN4EbFIRM7hbwHpTm7hWE5sSupuuqtbouh8nZ/ucpaQMGhzHp+Et1ejzElVs1
	 p2l6GR5SECGg7PoohF2SQvREdXOXVVmbxuKUkRrvtAzL/hrbspvvsSTSZF+DiBsHBnv60
	 7h/dJ6QGs0dXc99hIK244pwZhIhTcI6KqgOvO1X63FonE7i42OLF6rS6iqFx7vwZObYBF
	 3TTVW5IKhp6NFQJclPdVBImYDFhQb/MrFrEP92ExHSMVljntQ1ovmX8bjo9GC4Mpf0Ko1
	 bpQkxN6MPXf8L4ZSwJfy+BDjTq50mg988AOQaFhkGq71OVlvJxXJS6fImNLbJYsQfJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
	b=xXNh1Agee5kzFNUieCB5j4UDlXYQh6dP2iGuVZjsU7thIiqUxJckgaMyKRuzQIdkDIx/
	 RgTAXrcwzr+L+i9xFT8oa4Wh1Q/Yo/4M6TAvmz/IUcjvuBuVYIdftKG7hQ9m+c1j8QbDl
	 69xTUDXXMNyP4+QepC5RpFj+pa3Q3BqQUK5o6M3Y/n9zzS1alST/cNSYJtQjuno3p3gjR
	 Le/nkxjl0m/8W1k1pnREQSeO6Fg8T0hzprzuOydKgd2VwzNqU2wlIdl+JgQZrLoRaZW3w
	 XL/Td3fI8lhMZklJs7BHrOx2JnrWWbxFJUW7of2SPcyubl+a+r0rxPEDNNlRacJnmLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VTvXvSik;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BE6606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VTvXvSik
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2414549f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955786; x=1793560586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
        b=VTvXvSikLfJGslamcvpxzCJTu9WkCqjiJqpiEmRb3NyqMiAEDAZqGiMJOtgonAhvVe
         ghVqAx1FnE16xEaww+LmUM3JTFBWGkrjBFsQlyG/IdXi2YGFwzny5206DDVamb8N1MGh
         cAfRYHnoGVF63+UjNmuJm0Sn3D99fSfvJFaUV2DjMknY2UjvCIJL4FyhRSOrznDeFOBV
         liWh36MSsxs/4AcMi2HmaxivN7SLlfqr/r5HQIp+4u0Asqk/CSyU+BluZIGLCmNB28TC
         YEoChXByW7WkhkxR9+w3vExNtNv2TtfBR9fafQblnxFRZfD7O5NPhGQo187Ak4APjsFn
         sBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955786; x=1793560586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsKEoWn0J6eZRSfAvhzwhCyUkWA5eiqJ4y72mpKVBNU=;
        b=uPDrGsA6U/3Zr5KlmIq3OObZ3/VaP+ileIGnbQH7MZ6yB6R4b5VlIwNmzru0KJqcjo
         Q0fBU8kIriIxxNKCkVFt5Gupl5OAVgRc+sQug1ZU5q8yWiQHYVn6zjeXCpRWOBMzFjPP
         tHidTOzxNWqcc3iSk8VylqdWYSNHG5BiEABhiy83ValAFteZlWqjh0X/y1b5zBU2cFiA
         DIZB+HUHF33io28+pSqOYywzP0dbW7kyJTUWVl2TJej2ip7dUkSYivfSx+omQ48YoTTT
         nL6HYDo7UgGHpOZqnljwINhGiqk/LVqSdl69Syu4iNUM6wuPgGzFg10F4cCRbAeP5uYY
         PvNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNNQWtE8w7BAWzKFieYNxZZppc8rfgMV4XKOo7643Hvw7+rC6XUFTjBhD7KV8lHQHjxkn3HJinmLgplZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtzXF4h22MoAp+xQCuUSDMDDxUkM6frklhk8ELpSqd0kR4keZb
	lyRBz3R6KJUcqJmcS5sbd0jLOxk218inq5lh2H486yLb6ycxjxkLSvqvDmQyaKvm2K8=
X-Gm-Gg: AYBFou37EeUwQp3Q6aRzNXGm7oZakGCR71H9/yHC0O+fEXsh0g/w9GjrZQ6tDDEtHgc
	SowZrDRadodqCc+Xm10MCTuWGeMa0w6CQ0n+iLt6LYCx8M4TiU9ITAWzha13BA6EsNNlywDRyWm
	rQPn3iR7Z4xJWaNsPkZi7UuST2gOXeQYyCszIlgFq/JoRtr+7Se7jbrRPDpSz6VtXFQjSqR2/uU
	OgROUbtowPQqt9NmJMhag4RMXFx9fZZ7P5V3whAvte2aUXa52yaDJuc1oMm75aD8UIiDT+r4m+z
	onuuJ2UKwEWjhw289DwqfSTzrTibcjMadn2ta4oBITRF2C3ZWLwxnPfkDHwnpRRjC4bBBH9MQ7J
	TxKJKWMCwpoV71l4zdOfOw65jEx+Ir08SrrPamAePvATHigKD22kyQaFmC4u4g/sDDdHrHMqJWC
	DO+CNFtJl5r/nk9XjO6CLoYw2p7vffY2XQ4VnKddxxLE099ykeZL0srLudHzwAPpePoff+qFU4m
	R6d5dOZwrhBJ9e1KPQIE5uQQDyG0YwMgfzSMHy00ifydanxdQQRFv32H6cp9q09/9a+MaFbsYOj
	aGOn4BZKM1vgpwVrDXOAu70UtjNvV4b21yo=
X-Received: by 2002:a05:6000:4b04:b0:48d:fbe1:bb17 with SMTP id ffacd0b85a97d-48e3eb7ca4emr8944736f8f.41.1792955785830;
        Sun, 25 Oct 2026 12:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm10082051f8f.13.2026.10.25.12.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:25 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 20:16:22 +0100
Message-ID: <20261025191624.9219-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The Ingenic X1600 has a PWM controller of its own, separate from the TCU
timers that pwm-jz4740 drives on the earlier Ingenic SoCs. This adds its
binding and a driver built on the waveform callbacks.

Changes in v2 (both found by the Sashiko review of v1):
- A channel that is off with both counts still loaded, as one stopped
  behind the driver's back leaves it, now reads back as disabled. v1 read
  it as running, so asking for the same waveform again didn't switch it
  on. A channel off with one count zero is how 0 and 100% are written; the
  idle level gives which.
- A clock rate of 0 is refused with -EINVAL when rounding a waveform and
  when writing one, instead of switching the channel off silently or
  dividing by zero in the update timeout.

Tested on a HiBy R1 (X1600), whose backlight is channel 0, through
pwm-backlight: brightness 1, 25, 50, 60 and 100% give the expected high and
low counts, 0 and 100% switch the channel off at the right idle level,
and an inversed 250 us of 1 ms on channel 1 reads back as INL 0, LOW
9375 then HIGH 28125 with the clock divided by 8. PWM_DEBUG stayed
silent. For v2 also: channel 1 running 250 us of 1 ms, switched off
through ENC directly, then requested again through sysfs, reads back as
disabled, and the same waveform asked again switches it back on; v1's
driver read it as enabled and left it off.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

v1: https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 +++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 280 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 00e917df050d79ac26ec700717680ad6421d2808
-- 
2.39.5

