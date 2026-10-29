Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278470;
	b=JUjhfY0ety/sXoRbJ2qzN0imI39jE0w6dg1jzUCxAOD2/Vo0nhwQ43lO6Traf3GDMzSx
	 99mB6rNoyAgEfNefHzCcfO6DbDQrek6RM4H+cypOiLWhAEYDxPgBflc/YnpgIFOsq5fvj
	 gGWx1Y/eZhdbob43g8q2CVIswIN1ffWUynbOHVS6jwQV0oobeonlbAFNii1mt8nOOpnSs
	 PoqHjkmifWAaTsfY3ZN7OfGJMhmaQtYgr5nNE6isF9AkI7e6bjjzZjTP/ov4tG340a+/r
	 OX5zC+epCtFSw/QjKAbfPutjhnFrDupoSbSobF8s6qrvfS9CMv+hQJ8JXH58xGXulZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
	b=LEbXblD06GLpBsE51O3+BcF3Dn8prF6EopFZklf3IcaXj108MDFGLl4mVF202sDkFGJa
	 7P+T1lHz0uf8NYHpp6LTXdnwjSNGP8XdljWBNDCJ3Kc7zyxm8sotq15yVUP9jDczzKJVv
	 d3JtiqkivYpQxRVQWALDz+nJi9QOWJDMS3Vs0uw047jaFhd7v3Dfk1S2y5ECDUNJM1AEw
	 EXoHiZUjqchJEfLP7FLZlEjvIPxCbdS56h6UDE6ovWxoJ0oXL143rnE9tyIsBFBKQSPwv
	 Li5EEpeRKhHblOjbdJQPf3C217c6b6uu4AKp+tf30RuDUSyhQLaVdvy+X8D1Y1g0JwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="a2/GUOHg";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092C606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E092C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a2/GUOHg
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d885929so1610600f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278467; x=1793883267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=a2/GUOHgM5+ewuUzOwHFnVfpqrW6kglZHhsqcf0ZezD/dsaTdRQUju6f5bzdp8Xkmn
         cxiFbRGwkYg89QK6g+Meh2O3HZFHiA6OLt5ZIDaa9XKH8RB6LJFAqD2fLiZB7ujebcFL
         VSMFXkdE1trmHAMPI8qSUOV/EXtB3u/8dCfaCaltZzOZ4bfCtdVf8u/QjXUxQaTieu5L
         FxwKLuM/LgV76Q3UA5KUShW9VAC/masaNu19RTMrlw3LhtVZ6a9e0DI2cWn0C56wrfOy
         avCMwK8iGWK7bbUQxs9VN01vuiVTzkKDwy9cAh8/3QQJ+K/rR49QIRHYBZ43i3UsZ9pM
         AI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278467; x=1793883267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Pl5KEszsxbSEkrqz64pMGPD6Bkbga9OOvIN3MFGNLg=;
        b=HHvv/ivX6YNH7cjoRBid2T5Xks1X2xNS+pjX9Vqq5UTdAC3p/H2PDhoyC5GZUOKzzk
         a5PD9B1LOStvzpO/MHVnNdQir8RsgmsHMBo0JtKDy8+sRqVtj0fvEfXKxHMtOzVveOxD
         6LfLhQRCrzvJTzSRKakK7zle21JZn1e1jEkHE7HKRoueSbKTQZIA5Q8UB9BPgyPd+kPm
         miA8h29g/MdkFMg/Df4Zhbad1v7l0LW40gK2VazQkCUbACK+Xh3aBvtvFhEFyXb0EyeP
         SUbwqJrGFnvUPp5kcNt6T7rUiVD8pfSL0mxax547dC0vcWwUvMJfaYemEdptZ5v2GnMf
         qQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjSUyRz7edpzsHr39TtcXTM1TDDRwIoSiVItCqWERzrF528RvaDlwZHW4j4j4xHuISG9SgmpQnm7DiLEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYYUsNXS5Pg6dHHZGrrIooc17w9ht0gRV5YmKIr/PuClvUuQRI
	dwf1NZHJ22Kl+deJSIB0hw2dTi3u8Utq0+uhb5V4qzbeA/ZSqJx/X0ByKiZEw7iVFYw=
X-Gm-Gg: AYBFou0JhvafFsZ346YcMMuNyvwywqhUuNUR7mXSnJoreeX4gTX+UpGy5iteNXxN4H/
	Jfv0Zh7KIq1iWluv/AknyeN9kUtD1wuak5P/pw3bdo+tOd6Fe7csNg8WsBa0O5OAz+bZ+KC3SqT
	fa9VoKcjWL9kXt1rnT1gvq6fQqCMG8D3D3RO7pxlIO0B2xMnjCNt1zH6GKBgB1jPm2Yx0X2ptAv
	tniLPn+zPK3U7Ub89Z/bJpo9yXfTJh+D/gl3YHapjNSCdaDd/484zq3bvlx4RurtMbIKD1uFu3W
	Yl6mp0XH4UHUK+Vgm1Dt2UezyDJyKYWx/ppVLTO6cwk4csYfpfy16eq+Jq6c++K0bz/9wLcEyUu
	v7055OqbIZ/qE6CaGMnglbtJpzQUrSEP0hFov4IG3zh4q30HoZslAktfW5BZxHmGPnMDf/BToQm
	rvy9bTCfQ+dWFFbD1uCS+tYLopEVWtl7FYlAmsUgFr7iKuBoPu93c3Skzs5+hG3Ao1FWBkgXEQw
	hVxvSu79RAHn60MCnKiC2BbAePWbVES/wnocF58j6QtPgAWnSP0aui5CS3EekXXFGCzhu30ce19
	WzLty1BafKGYCyOSNfgBFuegER9HyzK42yPRWDhZucBABExGXfA6y8YkBLp6fmuZlKMYyojytUs
	gu/hPY+xSQu0BoSd8O6jhZGyj8xp8kdztEkrKNU7nbkQ2KBZs1+b6elxPz5a0Z1uNDx8=
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id ffacd0b85a97d-48e679a4fbdmr2549385f8f.3.1793278466836;
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:26 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Date: Thu, 29 Oct 2026 13:54:18 +0100
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dgwtkYgr72FYtGUKo2DJFBoJ4
 e4WvICLv3jJz/t/FQGZMIhbtgrGSIH8O4E6ZcJ2+t0iUJNYqFyVMgXmMUyMegDbv4CxHfQI7KG
 hSA0yuAqxuBTKGZQiSUZGR59j4FH/OMzmiXbarXujozB5Xo4HUe69v8eihBzsVcnS5M5Uhb4bv
 fRkGM/WD6Letu0LaX4K6uEAAAA=
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first two
patches add a missing /4 entry to the GXL and G12A HDMI divider tables so
that all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Split the HDMI divider table fix per SoC and add Fixes tags (Jerome)
- Add a Fixes tag to the clk-regmap patch (Jerome)
- Add Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: add the missing HDMI divider /4 alias
      clk: meson: g12a: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

