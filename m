Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918700;
	b=0e7gUufjMMKtfA6PtkrvdY916gYYBnj3+cAntmfcym3m79RJJGapMI6s29HSHq0e+7fX
	 hLxP+xTSBq81Q6WnhSuT//8WZUmz/DKDrlGVDOjE/hE3uY2UFru3Ey1616y5fto77uuua
	 rgJoir0mrsC0OJ+n0NeF6qpP2634teS1tK0dLjqrsAMxoNhMu0EaFcqwGkRa7BUy0KOlW
	 9PwATPMw2ZWTTCb8WSAoRF2buHdsPIPj24y7bwxdMdU9GEmTlVMAzpSBjRRzt+h1phK/5
	 ZuYQQPGrbHAgL/qH5+1rohhDXcUvj/t3idk/cfnCTQ8UTnKmUvgftiMkmBGwidKKspg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
	b=H6vSH1CnNNIICvW4qhtEWtgCJ3tlq/FmHsCkv3PvzK2FceaI+N6B6rE9RRFCu4/Dk56d
	 Dv7FINjWFRdwRl3yC8CV9lkDkXAvtCwY0OgWeJ0ScnNw2jPOLrMElPoMr2idtojCbCwOP
	 +j47PYyeT7BnYvJOX7xAhcNYXxXXJdsIhhXSHADSRw81BGn1HHugRTFNsTxSC/OOYBg8t
	 MtjuHm7l/81Ywg/yVVPif1h3EqXka51v7Kdaxt8XT8pePG/6CcSzSwgqALVe1H8w5SK9K
	 Q6kRhjnLHzpqfng2B2yomBiSxLONF52rTSw2Vw801ztWF8onkPbwg0olghWALQrSOqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="dLVy/XcJ";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC01606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC01606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=dLVy/XcJ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1605075f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918698; x=1793523498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
        b=dLVy/XcJWb0thYquOmIcYdfzl0P1c2YSLpBRkjuSdyRJ+UUKKFPZPFsfNvJxNRvqCR
         AkSMLKuPjy58EjPt16lzhKSpXMwtLC+q7OKkH1OflLVqZz8hwzBln8NnOpuRlCyF8ezu
         sU487CxMyU6k/qahPzygle3JA9vcUmCNXZJ/6VdEm2P+99g1EpsncYOq8pA1ZYGXMfdo
         n5RmHN0LVnp1Xca/VlP7Jr8a+HWVMN+m8j0n6Ts3W/W4lrIlq0//d0dbtCzLkMctAz+9
         y8KR9BiNFoODPZ827pzXptfhmYnDV3TzjpGnE7TrsWC6nu003Ka3vLNnKkqv1kMpB1Fi
         u3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918698; x=1793523498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BvMQkzk3cbMAzfEoRy8m31ymEv5Jtrkq2HGUm904Yk=;
        b=y5efWWF6++Agcgjm7cxu5f58vZwlcnKnsPyBxDanKQJRtwt5DJpLnjopID7cnoJAxZ
         Vib9Z/khU6HNKxpCwPQXzxAD8RIBKBbN9RZKohuC4akFiCjDQOCceaCsX0sO5sNQ5Tk0
         jZZLzwGBPIbe2MG49uvHSo5gc8ECY+adLuzj8BmpgMigRFhMrjFpBf4jQwyBIcmt8eac
         +7xwkqLti8Fai2ZI18FJ5L5m23cZFEWoM5i4SG9B8dkBsbsCB1WMJT14XyRdTY+kFWs2
         Ne0dPqaiXgUf+/7ME73MF1BVcWX/veyeh2Q9GRdoTqPKwn3JWUi2kELt3JwbaOcOMuZE
         G//A==
X-Forwarded-Encrypted: i=1; AKwUvByfPtWg4yKFXTKsoCijSnl9tXsPzLEB30HjXIR2q9sAImt+xlj83WqVJFA/ChsJdzYdCo1ZZ8LlHDOWkYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXLH1qia1m66SlsLirAn6CPwNzvXZyz/lJkCrGju+Mifom6uak
	NXxMkbjljBJ76JsfX69SVg1tUJ+Mndlb+wXMnbvYuX8tQTe+jnb9HsEiblKrNgX7v3E=
X-Gm-Gg: AYBFou1O514ApFePydEK0jYuC9W8flUWoWFdY/KWa2VeDxBRes+1rwAFuF9nkkqjx6Z
	WdpL7yr+p3ATouYIe6Gabg8Zo5e+sugQNDySILi2SFgP27S0QcZpanYdZiDjB7cbGHHKZAHTfwE
	aNqatYsJYmTEVf73KVA83N5J9gzDdVj4463HCEGKns1t2Dp1oU98MYtbqPOq6MpD+kwni0eRGkR
	s0d5CmqWVoWXI39HWWnzWm6BcPYr4/5JDbnEhGLnj54Xy7cdx2D5lvVMidMW73rIFg8WUzXUGrL
	kH3hBNVdiGW3oK/G6ZutKxb9Ujx5b/5jJKmqDURTPzIS01vnPhKC7jVNghRmiao6muWzQqld0km
	SowaIQ2Kh1pEjTdCHM7cIYabQHv+BSdxa8SpGgKdVT9VPT5ydQz4GaN7dj6ss0Q47xUDCif85PI
	4h1QMwMk7H6701n8kbvX82t1G9LD79p0I3s/If1RVe54N4KDM8r/+HznmwDeul5zzfZeWhJCFvD
	9ND2Spt/9mQUCuDHGdvef4NL2OtNiBFFM3yZ7moIfl+4bv6e6wBW7il3qtA/p5KTkJR2OyueIuz
	lsk9IUpcVClxDiTuPGVb963RPa3fN2tUY7l0kuLkJGJYvbh5CZiRe6xLEag/kz4zOiBC0HCvLk7
	hl3KxoubabImxL9QdnIY=
X-Received: by 2002:a05:6000:1626:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e4ad232f4mr1415110f8f.29.1792918697894;
        Sun, 25 Oct 2026 01:58:17 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm9094542f8f.17.2026.10.25.01.58.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:58:17 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 0/5] drm/ingenic: Add the X1600 LCD controller and the HiBy R1 panel
Date: Sun, 25 Oct 2026 09:58:11 +0100
Message-ID: <20261025085816.60405-1-olivier@mgcrea.io>
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

The display controller of the Ingenic X1600 is not the one ingenic-drm
drives: it fetches frames through descriptors and keeps its interface and
timings in register blocks of their own. It is the X2000's controller
without the composer. This series adds a binding and a driver for it,
then the panel of the HiBy R1, an X1600 audio player: 480x800 parallel
RGB, set up over a 3-wire SPI bus.

The driver covers what the R1 uses and what could be tested: parallel RGB
panels on a 24-bit bus and one full-screen RGB565 plane. The composer,
smart panels and other pixel formats are left out.

Two things come from the vendor kernel rather than the manual. A flip
also writes SRD_CHAIN_START, which the manual doesn't describe for a
running controller; flips without it were not tried. The panel's set-up
sequence is the vendor's too: HiBy calls the panel LG35583, its maker and
controller are unknown, hence the hiby prefix.

Tested on a HiBy R1: the fbdev console and a player drawing through
fbdev, blanking and unblanking, 60 page flips in 0.97 s at about 61 Hz,
and the colour order (RGB order swaps red and blue on this panel).

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately:
https://lore.kernel.org/r/20261025084643.93167-1-olivier@mgcrea.io

Olivier Louvignes (5):
  dt-bindings: vendor-prefixes: Add HiBy
  dt-bindings: display: Add the Ingenic X1600 LCD controller
  drm/ingenic: Add a driver for the X1600 LCD controller
  dt-bindings: display: panel: Add the HiBy LG35583
  drm/panel: Add the HiBy LG35583

 .../bindings/display/ingenic,x1600-lcd.yaml   |  70 ++
 .../bindings/display/panel/hiby,lg35583.yaml  |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/ingenic/Kconfig               |  22 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 694 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 +++++++++
 11 files changed, 1226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.39.5

