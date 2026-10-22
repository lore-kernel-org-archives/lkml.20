Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648333;
	b=htcpBXAz+edeGMB72kh2FmOrb1PcLHCmRtAQh1Dsrif3yeh+AVbjUESFC0pqR0k2KZr/
	 2Rjur6BGTLFo/zAYPZQxQBeUlqPZMC8CHundJZ+epMFgoUljdSKusrdpN2VRSVcUg3gkB
	 MKOsgv16+DAEps7rqEkVcFRBEuIQoc83dQlwzsYhyh0/RJlL3RHPelBKfhelD5vrJ6fp2
	 POcwVk4OE09pVw9IhCzKMTJ2+VfIMrwUChjiwaFwmt/xFLxdRXye3KgnE5peCDRHcWpNp
	 IO5cl5zqAPDT2hOOvLiVW+/EcOdwhP3xE8bBKIq1KYeIEZc0Im0OrLpFF79SS8dFfSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
	b=BxDTWsX5LgOi2tntp3FqYj2ekTZLfm9q6dwKFiXyfUXSkcmHEKNEdga+pie8xyXcyaZc
	 niLWnx56odl3R/8puzGMtBcnxu5oT3OTcLTyueNXupNu5ZC+8gtlwArP6F7rW7RrAJIOH
	 jTPuFSeJrlwSFhueCNab9Nz2/91FoOlhNN60u8RPyl0iogQn3vk4RfxYy2wbD3xDl2quU
	 E4wY0dy4DH+pi9jiYmum0BbQOTsBgkOkqqD3J6E1PE560G3FCRsaL8AWeFSxaKJCOKbjk
	 5XMhdTxWIrBUqlE7X1X3Dx7l/lX0MzrM8W28a8mviys5Vc70sl6+76nlxZ/mOKHLRsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6z+2ZtJ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1FC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F1FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6z+2ZtJ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11883395e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648332; x=1793253132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=I6z+2ZtJyElO0G4znh79MonwNy9aQb4oBy3+qS7jn+iBMoi60vxjfYGFWTG+1qPBDy
         oZvzN6qu4lX1wu98RPB/cLf87ioHqodcdNM7jMSWKpw1eaUbfMa2vxxno9Txh9Ae08i+
         zaCGLpbcSl1aVD+qDNNNxL/pIDKAa16YdhNzlk3U9w0gkl7xxj5x7VOCIyDSJ1hb5u5t
         LXOBLDg3ygAtmfMpIDOWeR6ootfSjPEwW1HxZSVivOHN9IvCxj1sOOKpO51qKgTMX4ZE
         paXzF54WrKdZJ5dkg0SsfKsoF6Bj+zKrV2Cw5KFi3a3AM6Az5hWwoeYWJdypBs3wZLuZ
         lsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648332; x=1793253132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Krj8OjITAThRkCGGSj2U5wCQS4PajnQVLbEtv8Y+ws=;
        b=KmaCgdu+R0HNgRJXFhOIOnfFce9x7dcNIqjWJSlEcte3SqLJm10+KLQ37HkEJ8bLSZ
         Qcea3fezWpMeX70c+oFsCaYKqEPbxId0cIEoHo/NazqH5JqivR4T2eXnCRM4UcC7wg1o
         20LC08UgcwO/CPmsWynoff+M2Ml9TcImV5DkArptbe7Jvu7I9LuITS0eDnmAkg/hfssI
         uTsCNX7Jxg9wr1Pss7uXJ8xA4vLAFkGt4JgYfrdMCuZpwIQAkPG0v/7VI5cGn5i68t6D
         R2OUSaTYTz6X9mbaDBEn47fR6Y5j6TFci4iJlEU4jpCM4SEOxuPE+BQA/kxTddD4Mdxv
         8paQ==
X-Forwarded-Encrypted: i=1; AKwUvByJllQ3/Qa/W20RNvgqnBr99X8xbMT+njasJAxpNj9gfxcYm00cZe9RC7JuCB9ddfZVa0/Uiq3aXmr0yd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBYjWhH6DChC4KXICCFY/DFpMN4pElb5BMU89BsD0+PZOrGeFg
	aR3ue9vDJPIfD6HvmfnGlXH7ThHzxbvS8FXR/y7XHyQTVE6nK7e1VKC2
X-Gm-Gg: AYBFou07w406OHufxr+65zisUmAuQjoErg6KZCh4EywT5Vysvyo5L+MISdKmzjT5Gtx
	2yfKOjc2bWYcNGW6ElkxSuWPbB2AuFHj1gULOkFG0vdChZAzNvLxMPQ2P5Wcz4qZDfmYWuKnAXL
	WqOSWtsZSaYKj4uhKGBrZJ2/J5Xy+riWmtDJUdUXohP+FbT78PYFGjNwc22xYrER7zr2C7mgMGz
	Wds0sdQRu/S23z+DGCP1H2V2WMEJyfMgNdIdbdovpxifJjuqy+vzoxFmyFPhDKkHakNQh3CKdPc
	TSvIqBmK+1MKAPoS2QHYJee6CSHXbM/5gilQEeDI+lOabZchEV3TbBOj6Snf2U/PhwlYwvH7JWj
	PZEip7F3XVv8UsftOGn7/+8eu65QEQD/kmOCYGj3S1ss36RyP866MeAUQ0xjNwA2GG6b0FhOsOf
	4XVspNZwUmvVWaSt0jE9JL2321c2kOKV/A4A3kEaOHv5yY82vQD6ji7fd5jMXnHl7vUdlcBzI9A
	kCn2n3ariNGgr37+zaTjr9zWet13vCvuqQNsO8pvcmjNdMloJO+2QAHSQ7Jvxj9WLmQkf0ef475
	BGCkD7+DAYXIepV7j7FfTCxWim6sAdU6utZNQKXSlanVoX45DuGBjZ3mjajU9J5RQvtEI1tPmuu
	5H6Yk3t8ZWF/loF49QZDWm1HzzulPxSxx15VQarm7jNgxjrY8TyoY7/qqtojN8DjpHgx9whhLDv
	CKB/Fx
X-Received: by 2002:a05:600c:6748:b0:4a2:1a:a122 with SMTP id 5b1f17b1804b1-4a2001aa387mr72903845e9.9.1792648331473;
        Wed, 21 Oct 2026 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:10 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:06 +0200
Message-ID: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
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

This series adds the Hardkernel ODROID-U2, the predecessor of the
ODROID-U3, based on the Samsung Exynos4412 Prime SoC.

v2 is reworked: as with other closely related boards, such as the
ODROID-X2 and the ODROID-X, the ODROID-U2 device tree now includes the
ODROID-U3 one and describes only the differences: the micro-USB port
is peripheral only, as there is no VBUS supply switch, there is no
expansion header with SPI, and the 3.5 mm jack is headphone only, with
an on-board digital microphone instead.

Ethernet, microSD, USB peripheral mode, the LED, the fan cooling
device, headphone playback and recording from the digital microphone
were tested on an ODROID-U2 with v1 on Linux 6.12. With v2, everything
except audio was checked again on Linux 6.18; the DTB is the same as in
v1, except for the cs-gpios property of the disabled spi_1 node. The
eMMC was not tested, as no eMMC module was available.

Changes in v2:
- Include the ODROID-U3 device tree instead of duplicating it, which
  also resolves the style issues reported by Henrik
- Add Reviewed-by from Henrik to the dt-bindings patch
- Link to v1: https://lore.kernel.org/all/20261018124459.3026-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |  1 +
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 4 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)

