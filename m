Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887563;
	b=OkjCZWBvDc4ZvoTPpe9JeXg0DxVvg5/DM6rbAKSkEFzEplwydnXj1/U3Pf41NWFvEloq
	 VyEmUI3k84ch0jJTopo0XQyu1h1qcYBxJHX65ByFjpDvn6NrwNzIHz9BBWHLSaQ+WYpiM
	 YZcysUJ6qKH5fKuV2IS8u3cITGfxOOz+Kgd6hhxCBoTvC2X9IcHDUVJE4ttvZkhFA1rL0
	 YGKszQIM/L53yxEJm8mBTvpJQpRZpiy5a5rUlD/I52h0BaWTVSn+UIQ57i4BosyiXQXnp
	 unoJgBpN3pk7kgegsDV8Y2AYy9fG0pYMFbciVISSe+7nv8Db0MiPkQQQ7bPaThtVnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
	b=T2CgDogtq9/tEbLqg0UzExToiVxxJdnOSyDjlTB/lp+aHZpnDUQGkrMsMharkIhJDFum
	 ujlmbybldynKaHA3I3Ifpv+s9MdHplm3lIRoofc6vLvWqEaaXHc2/h0+eJZByMeibRnXN
	 iR5udvcccuGX8uhFRohIyTaSR4X4DvBm2kaVkueLKt0kabp+fh1xHkzVh+oub5HvYB58N
	 F1auVgzdgcF7vO9S3GMGY7yK+ptvsz6r7U8vN66HYFAQHqFQ6/lCPzd2HPxU9HTg3nYSP
	 YAekQdGtY0D6I0W0RLvBTiLoyD62SrXaNrXen0EA88ItXQTbGodh9ZOrvnRrY6R6yOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdmYwzJE;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E31606D80E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E31606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdmYwzJE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso422241f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887561; x=1794492361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=HdmYwzJEZlhLuP8KzIubtCCI+KKp1Ul7qZkS1Ew10px1p64T2MjShRp2ubhsZ4vM84
         4/QGyq/LcQpeRjpjUkDiMXG0+gs/AIA4TcXoYR+yL9vxPACuMcyPgD7TZNs+zgHoMQTA
         1AHUfyvf2gOLAUh0Txcp+YsQVYGEpDTCWRvW0Uk7CxHzi4aKFrhKNhVhlBXdBTny/+rb
         lizMIpTer7pC3rPiozNGWaH42w6Onk/ukS9g40+5CCTo50X3Q20d36/YF/j5J+NcBnPy
         RmqsciNJvdFM66cAFBuTUGXXMauRQ7IZ5+0sNuavmPpvS6LT4Fo8XFXi1p5oDOwqQMPh
         D+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887561; x=1794492361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=uVqyTIBWn9p45vVCr0FJesSR/4UTZ4i5xUysD4s3wo//MLtffLa959ftp4sKATfUxQ
         RKsS4qLSLYAVQJZEBseaPIq9PJ7EOOGLw3Cl9J4zTBDwNA8Y+lZ5Q4soh1dQQTneQZU0
         vsxk671SZa5wgw40PEKQset6KayRIJEZ7S1o0IaEAnhbR3ZoVq3Jxx6lkAYCauxSHQaf
         SI+jIVSaUFRHxKcMM7c7DLAL01De42r9JgLY11SRFk2QtzmKBk5dhpYoGdnaWvUPo6Vi
         l5LE5K1NZer3CpDVJKizHOYfR67H98HE5qWs3uit0tf195asC8I8ZjqtFOmqeiiP0a1Q
         P9Ww==
X-Forwarded-Encrypted: i=1; AKwUvBx7bLnjWJWb4r0skHIiO28roP5qMw7vsoOGSS5iTOaO4xeK+OyghWWEqW0ckEog4Gf81CAyMR7qr1cAKRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kj7jR7qJy4WASD5rvtPKLjggP8pbEpGTJwsBfWjVMorh+/O1k
	SNXP60BGJdTPbKY6UPel68TfW+rblCRGMPntrfFDr+3VAIjICYFx/OfF
X-Gm-Gg: AYBFou1dXr8u5HEKdKLe49RQ8pBWqsBXJDbFy4oFiO01eCP9tscegFj3PJrCvxaJo2l
	W/AJsx/7JkNgdHdHQn83+wtoCZ4QWJ1yUzW0+BQh2MbB08yuPFeVsoyzYdhIK+2g6zcR+xNpe3q
	JGpuyQEEASzyfBFdCjuwdKSafMWlKOy5St6bBrg9F8KQhiaBsNrAjm75kVlwsBqYdQ4tdNxd/PV
	rC9kozkLoqt6ye8IQEaWxOv+F3d31c+TxETfWLFVyd/EjIx4djbteaqozVu6gvkRoBpvtYenlIM
	3UYmGOpTi5Pa/xkOqhMIKeVOMA0ZJfuEPodfR4C+jz7PQwGv08hRgUAQO1TYun5eacjdfunoeDK
	AmBBtQ/z1OBr/hmhGqof9nvIDTEo8Ntne9rz/ich6bY2ZxGdR2BSmQ32UCvw/2jYnQu1SBe9uP4
	d5Hk/+rA0Lz5RX15MW/zTt0CtvBDN2fJsYKGzNt8Cbc2mz8EQ10BRHdNDjmHPDmVcbUiMdVG0ze
	icY1OYgzvsnEfH87dnmovYS6oTGlXRUBsoV+3o84BKLYCh6uLuc09fCZsbyLWcr2XOrdCKXIVua
	r5uB8zF7X2/40B7f8nc4BV6hYJP4+gX2ntQjya/Y6ZjfQ3ACQQ==
X-Received: by 2002:a05:6000:46cc:b0:491:1468:a504 with SMTP id ffacd0b85a97d-49117491f15mr3215686f8f.21.1793887561432;
        Thu, 05 Nov 2026 06:06:01 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/10] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Thu,  5 Nov 2026 16:05:05 +0200
Message-ID: <20261105140510.165165-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

