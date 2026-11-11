Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403902;
	b=SvBIRWEzCnJIOb+FVsDKAXwPw7hBfWxy48KufQLwW3X2QeD7b8VqyE5DjX7s9hE5giQy
	 5caQt2Ryhm6s4Sz0rIBxaqbOito19oyCiZuVKBmy/mWVqq/N3RE8kK08/G77rVwCH0fck
	 0ZQ4hel2gQStYemrOWIKMO3rv0lWBIaTUl1ExHSRsUa0r9OSkIdUju4R2rx2CyWnL1Fx4
	 6h8Ry7GUxta8dvAodAORPaEtVkQak3kAHSPwpmxO1kp7uTzLD7QjU8i0zWvf0ph5fvIge
	 cNSp4d1KjHjXyUp741Ec+JBohzFpkOdeh4T7pdESxgjLl2JGf/u6ohvOXwHVPIl3DvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
	b=Dp3Wjk1JO8RqPSitCyvHrgdQi9PD317RKulD/gZ0F6CAvWOLoZd48FPGIPq/jNZEFxVc
	 +ks+U4FNLwM6yYv/MAzl10oOSfhYBG6Vj0OGpPNWPIDjNMstsZVdGFr3MxqnOhQgRZn5r
	 qc1bNCCRci8wK+rsp4XRDahAubuF4jMq3Rt2G081KRQW7N1TG5QLHCNGL+zrWsz0cLxm0
	 RryS7BgP2Go0o0QSGcmhL52BSFI62pMi8YrrIoc4sAOkf17TOOeOpwzQLpGDA3es6DRO9
	 h+1IREIh7PYZpYC4QdPjNJCsXJbCMvwnfyswHm5cnGlN6rwuda1zPNt59aLxrehav1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o6IVK7s7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB662606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB662606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o6IVK7s7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1719484f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403900; x=1795008700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=o6IVK7s7b0bKyMHvyshYiXsxa4OKgZ9tjNrNl50dXKdePI3A0Pqk0JlPrxyl+is6Ty
         KW2014oGSpgL139lUwhwe5HBOfkABYE1UHDIpS4NtxLArWKgYhhPBkB+/eY7CAfollHA
         GtkQhQnDFq1RM8XuYi5Nk62gPwBi5nm0kUwJm6QbXC4WeXrmJazZiQett8rwlPgmjs/v
         cSm00MbIZkLg1I4XamB4aa3+WhjXv/4JpCIOZgfzRN6+CvTZFQsrhrDf8PrXEp+160tD
         WsBeElXsvNx8PjPdkTrlvHHcntBw7C94K3LtMlQ3o61DSGt1MRIv9uVuVa3uyW9xyFWC
         VGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403900; x=1795008700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=vcSUxdHtzvIHGzkBspIxbaUJ3kB2BmSzVjzsL/CJ/wK0GzSNJbOlOcdjx5fcfNv32b
         PnoRZFXm5AREbFW46zB5EMSdehc2xOSryJVY7p4bjMrjJIFhPFCu87MlJN+eLmbJTXx+
         O/3LiIBSs0Jp/q18uOq8z4hgJ1X60F1FnWK5GsqE+/CSvSY8VYz9LL5p8QU28nmUn9m+
         MTglxzIJo8Imd+L1rOcpYBteTy4ZcdFfOU7rP48z3RhpO677qHltfjlK0lpaxTsfayez
         5PcXcsDtun3zXhU2dYhYXK7tOxNed8AtHAdTwMaflzk/Habo32ounWmOnjx4JSPcca69
         hSYQ==
X-Forwarded-Encrypted: i=1; AL+hErG67976pNEOA+/u1vBnibYGyiJacGJfufcxOBiN8DpznpmNdfvtOmcipT3oZgaxZHZdPASa2bsjZXhX8SU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OZ97vLLWRfyOgXpv1q+9+YqtzZQISwEhZttqeQy/V4+8n45gH
	E9+2T/13kDu51PLdr9iiMuoRIOvcgnXKaGm/oIpMldt0CzoCuomqv6f9bSz/qQxOnIE=
X-Gm-Gg: AYBFou0t9gMKpfaI5zLA+8Rtvppw86MEucPuUDw11vLcGV2xVQogOe3gpjF4XXVq1s4
	Yuty4858Mg8aXi/A5tUOjjduBwKPDd3IMXdxPnlOYNuxnKNegHhm5RkIt4WGzODaQMrVR7YPCyh
	cdaQ6J3aRZ1gnxbChuVMu4fBvKeoDpXmPG6XtK2MuMfw7W4tdAx5zDHkUfeSc+EGuLF0IAVrD5j
	9QspzTsb4pbUdVTHu9AwNiBeG5CVjbQeb+EeCWFG2dpyRRZTWeC88rpknML2wCu9WWYbc+2KC1v
	Pz+psziQDo+xQiE0ZVrQcVVgoUrAl19Jvwv7c4IMqh3iUuR8Rke16Qc/eX5YCSFLmeICy46xpOe
	j8j0rPrz8LIvdTD58ZdijkSm0j1i9EVveMl64B8aeS6gm+KnsaAEYgkAAByn+OTs3GPesl8TB45
	XAXomh6ajBgRyb/m0IIaRzF7Hc0sZAECTtoK5HFxse6a/oEv/9cCLfWnYhxYK7ddjSwryZPFT4f
	tmchY2jcNgWzVwoQED31wjNkOhEn3W6GaCQd8QxWmByX1FwkXc25BEmpisvFm5iMYVDj0A4VGaJ
	TeyKYn6UZfpX7Ud1zN/OnEE7/NqzAwQcKDW5Zv2aNxsMTQgyVi+PeeorlmAapyAZQQHOr7KTkDk
	nNsiaCdYtaA==
X-Received: by 2002:a5d:5f47:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-499c3ba0637mr4190729f8f.3.1794403900138;
        Wed, 11 Nov 2026 05:31:40 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:39 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 14:31:15 +0100
Message-ID: <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

