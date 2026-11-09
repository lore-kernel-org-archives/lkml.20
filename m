Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227046;
	b=AY10SM3JPqc1uk0lXvsywhFE7OvjBebc5wABkNcwZFe8zgmpt47hzmMHHmiuGPp8aKpr
	 JOhKMuG41zjh9uZJ/8VxJFZ0mdcTjGfMi8eeIzuB9jNuNoZCHnogzOFUIyOiKVg6yU2U7
	 VuGdiX/0aU7qN4GELIM74FSPqCH4V4cxGCelP21ejozUvHsT4SEbB7+9InFVuwNQRtL/1
	 i3D6LEhvI12kLrpiMk1O+dF1SQEWTz0D/2gXDeqw9LpZb01MBVRIYVsoMWv8ApcKtoID6
	 icQmLBOOpFvMwJv0rigu5LFSYA9IhHnfnfWElyvVIHRqvdQZLOmpeiOJYHX+DMeOjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
	b=YgPnlPT16YmzQzksAiSOvDdsUzOi68AYKo/7uIpkigFg8t1wJPlFSK3rBgnb1n5PPSYs
	 rNLje0YgKydeKIyTKHQYEGvqtDqrFxHw6dEVeE6OxWNL3W1xd/0CFvjI4KCyYfg8OElRU
	 P0mnRtJkld97ip/1rfKphU5PdgfBFfaSdhaArtbga5Z4iHpa9hw/Lw2alS+tEAPpT+zun
	 /VYqxZksuHgKhp/D3WBan2Hg1uRvYTDreN5+rHu5XukbYUHYA7ZP99T8xPqA68+0cHvR4
	 w8Uu2pcnxx0V8gA1ymbTr553OEO1skBeTsw+nqoQxqxj8muaF2QDXhjJMwecndDoOFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CWXifbq3;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627B6083614
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6627B6083614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CWXifbq3
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f563d1c6so247493f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227045; x=1794831845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=CWXifbq31+Kzv0+HgMY/heyFpekSNagPUM5+ZpJQZMraafm+EM8duq6aRFThpQeGIg
         GrBAb4jOuPRRjJfR34RL4eezQcYoUGUCxAc/fs127An85nnZXLiZlnflJW0XPXCL6J8R
         miGY0B3iYEqcUXZeo/PeFhwY7tGVJEa5454j0elS4T7Q6g5oPbMf3VFhPkzLyb/czkul
         AAdkR5ol7ZaiEF9EJ8GKfQuaB35mFqUqOeiQsMSWAqJ+inYNW8usA4ZPd6kUULCyboJ3
         wQCa9rvGgjM2h4dxxL3Gi/hnzX0dIclsyKX75vpXvmaETYOw2chfsWcTD8GxJstw3dnm
         vf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227045; x=1794831845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=dXD3Lt7XtrrDaRN8OjzcAcQ33+/jzxbfj9KDmwcSRK0pvcprj4Hmzs6mUNwDmSNeXc
         HZ3ubA2ekX6WZl3CY4xQ9GCl8Fdf54azdGLG3vyLtG+hRzqc70m9z4uzzVQcpRLlK6z5
         2KaSFhyPsQsrZVFAUfqciddYJQIBoItCX6G/lBUSHHUIXtSTYP18FfJpx9G/RevYKZF6
         PDXZ+OkhsOaoyMBNiD4WPfyDFxKDEBI5wgHXK7QWrF3kz/9LDxjKJHzLFUOzLSRqZT1c
         HqrdNRlGAZZLQV/0scQ0jEjdxa+zfPG2AANisxT59d37T/rfRW3IEZ6KSIOg2JkNzydY
         A4HA==
X-Forwarded-Encrypted: i=1; AL+hErFOwgoC220z07j/TvY5CY21rdxsn5iWUIuyJ2SXG4vloRDSyI+Bt4H3ycuSfuiKfYfkQkVV4FuudRvU44k=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Yjf4eZM/54am6OJw5NwNm55FU1/OaXZ/YIzD4fNGBVTj6A6E
	UiHJjU/dzwnhL5sb0ghKFHakTEh/7SeDCXvMpiDq7PSZPGNJsY6O01lu9BjTvRlp82E=
X-Gm-Gg: AYBFou1q8ENpLpajB6eYUhevnavlY9ARl34+JuBB/KucfIWTHBZZooaERai7k2S67QR
	BOER45r5v5uKawpC+Mi8pv05REsckQarQ5uopKc8M9aPZ6yVKn8QWnVES4xJhQORAV6xn3Iql8h
	oqBO9IjATnMKz70Lp7s83VlaY4rzbRepbAdOG05k8kQlL2X6LVI9M2g249aeH8VOVUWheZ13u4G
	elhj65RRwhOihiNBKhmPLglH429tB7dk7fItTnjCSSlHoPR8fvIGMdiSzGYASKfYRgtDq+8PO74
	0BdL5cl5eVGUxEFI5NCHLOWBuAJDW4BvYmxBArJkc4Bjx+lqF0e68puC1rx6dFffFRbTVtqeCZ6
	8uB9pBvGx6xGMQQcKVm2Iysh3qdr6lRTtjUYMDNBN8D91OwdOkHwcdMzmRXp/qHf3A/ioTv8Yxb
	XbzHr6RXg9rQQmhxIGpDhZrsXkoQCftZGpt7D8W0xljtNJufxNPdfCGpcsoOC4lsYWY8IH8I08h
	6l9IyX2bRjmziPxbwg3yHwSIv7SV+nG3W7eLwHliGOVbJSexWr9R1CEOa9Yhi0yKnaVJuoeeOmv
	Jb/QsBR0VmVnYaH8ENUcC/R51POJelzb/xglBgM/ouWlngLpWqbnBnlt5l8aWnSTEiv5oKaiv/D
	jlVF37MhS71o=
X-Received: by 2002:a05:6000:2488:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-495852178b9mr6692780f8f.38.1794227044813;
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Mon,  9 Nov 2026 13:22:49 +0100
Message-ID: <20261109122250.720757-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Document the compatible strings for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the byteENGINE carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml       | 12 ++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml         |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..d342930981d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,18 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and bytedevkit
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
+      - description: i.MX93 boards with bytesatwork byteENGINE OSM Modules
+        items:
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

