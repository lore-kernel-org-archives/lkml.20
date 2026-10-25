Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918007;
	b=uR+DZJvoYTXAcD05wbRWmVuMgoyWY7tHfx/X5RZHdjxdBVmL78GkRyEjZ6XZk9gpHvSI
	 FZC6kXox6/DXWCn9IDLd9r2E94y0b6FvoC5n9Sa37rwZ7hxBRqxhzZAhqEPRhheYn65pK
	 qbmtnc0lQ+g6dDuEE/hdcTv8JkRSd2TdrDamcAP8wS6jzP1n//AWGmCj9iOFvJXFovG46
	 3AYmB3CUYyq2Q6724mLWd6ZlyUrU6oSdlxQF0MAaH2rydLhVKQNZhGnOUuPC1p/RuIDHB
	 FbVImRs5lA8LS7PoZD8p6mh/hdP872AMJNk8qTO4M29lNZEk1bEmJ3h6jPkteV4wTaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
	b=bR8gxVce/Ykj/Rl6p1Dme06k5ABHlqd7ypImdNbaZv4IWeQOnNAMRFgoE7BxQEHfbjTH
	 fNV3tc+VBeDVVtZj+nbf6VGA0mpt78j/tkjVFmpmXW7453N57u2AEOrunoDwnxPB1kikd
	 rKTOGZviqgSKU4LVfdVu8Nw5t3uF4WIg7NOkIrGEN9w7gWL1y9W9pKYCmMmU1C2v0FKT9
	 c1Bejh0VOhQnlqolW60f86u9yleW1YknHKo6c9FQKee7BFPVh5T5JYy5iUqQrw05/yJx6
	 iJA8ygXwLlvhjbluCW5frLbwyL3sT/K1M+Pe73KNdKk7SI2i+LQEdO6m4mHGa+nZJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sacsCAWC;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F791606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F791606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sacsCAWC
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so19725475e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918005; x=1793522805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
        b=sacsCAWCmrTu09sFa9ikOphxuUASQYHVKM4+sRpN3oU2QRipbZ2KT7R5klNZ5NVSpn
         EYF5PG3vg855Hpev/RvIRupc+rfVEAop1PtZf3N6dLpU/awS6cMRWyb5kX5ze9FLkXez
         /cl7HIK7KKreXDACoIh/vIHGt+861Gq8/SJxYtxH6tDT8K+4K1mGRjaT19l2kyPzuBXB
         8fYRtE/ENWgC2UL75Tjivj2lakzHDNUKTC+zfGGZXs/a1A5RrutEubIuqHhCXlbXNpT8
         /UWaI/frABxR2jsybSGBrdzxNo1MseEPckhm9FS910fnwZWfNR5IMMi7iZpXEjqvOoF+
         RH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918005; x=1793522805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
        b=T1kyO7D6Zc+yvuDjqk1oNQ8VWBB/JAYbs90borcWTShGQOyUjFJ5X9AcPWeEBJF8Uw
         BK1GktAAzBriR9tusQJ2JBHnSt0JUNo2Hu/EWJLlCy7G2e5nRHd2X0QeCNE5Brk8JMYm
         v4aK7qcDlj3Oq2W2X0ZLIXouN0u3DNc6sYx+yaXpKlUBWd1ueUXdkagfTwPraoT214j8
         hrZPkZ+YIKudKd0vzbBiDNCXFOMSSZcMqfSEIqB189xpU1j5ay1I0qYW5p8+LJvRkeCI
         BKnPNRc95Okw2J6/TanMocfXU+jf0PKX+IrZ7C6jRLrtOimg/aQWgZeJSxzZI3iPf+om
         I3aQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfIr+H7nGcMg/vJpHIGF+Y+4ZqqyICcK6F1KQe3VyGOBmRhiltFyz+qAma/OB9mvr1lFZjk2SdlZQ+js4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwidjVnT7CZdioRykopPJbCXTs4eGg20OSD75rca8lKMZI17dY
	G3CZ9iEsikqruek0b7lu5H5i1TaCaakoWEYyzZdnMSs90L8OSHo3dq+/gRMMLI4eltg=
X-Gm-Gg: AYBFou0pqXYYqJiuoehjbF/ojIVJHSlbNXO4dx7Wauu/8L/PwXa7wCszRMp5o1wKj2/
	RwEAhct02tdtEhTU6ogQYvfDGmc961QO3IuOUZt7rje1Q3/GwcUi/nlCA9+C20sr3FJBo4gTzym
	vLJD+HRIlSGx8nAxtxWtNtztcQB5m8pO7A61YmBnIFfEv/dSiXv/KBQjKeYujodFKffPSqPJVaR
	Izue3PkP9/it9NRUrOTKN49dhqqRJmf4ZNFjcexDeV+c16TZBLlkiTsUTuT2VMb6qEutspecNw1
	pjnSDJNF25r/B9migAlg/dC1NAc9nLd0dXfFGw4JRkm0Iax6aiyTKyzI82wUz9wrFCCJJcLJKQu
	kcUUch2ILqSGjt7EpgEjJg7YBYBq7P583jW2Rb6o+Cw0TmCvm3rX4uj36XpPrlwDBw67U1Icm7W
	HY62AOKo8OiRA5uEAW6fYTSLBqjBKbIa8nXmaPievAiKlIzHVpHk9VQIUUV/d1rKNBQsiVA1New
	qCCnx2VRK1tM1BdkXKMTFITQq+MGRn087iG7OKd0HhyhYc1WAiYjJIy6PZeL+FF4+ccAS9/F0JC
	WUN0YZlJZ5zCmIroJgszxrkhiHmuLoyylZKT30ErZ+ZkizTcdNptozVPspf0mwK1zQpNAQDEFQ=
	=
X-Received: by 2002:a05:600c:524c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4a35ac8c0fdmr68412805e9.7.1792918004829;
        Sun, 25 Oct 2026 01:46:44 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:44 -0700 (PDT)
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
Subject: [PATCH 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:41 +0100
Message-ID: <20261025084643.93167-1-olivier@mgcrea.io>
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

Tested on a HiBy R1 (X1600), whose backlight is channel 0, through
pwm-backlight: brightness 1, 25, 50, 60 and 100% give the expected high and
low counts, 0 and 100% switch the channel off at the right idle level,
and an inversed 250 us of 1 ms on channel 1 reads back as INL 0, LOW
9375 then HIGH 28125 with the clock divided by 8. PWM_DEBUG stayed
silent.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 ++++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 260 ++++++++++++++++++
 5 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 00e917df050d79ac26ec700717680ad6421d2808
-- 
2.54.0

