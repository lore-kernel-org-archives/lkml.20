Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334891;
	b=4u5qjXiDRQzQMRGVMmrT0/dPruOeOgUhwr/UMM40uwJSPhZ2bSawocl2Zr36l2XQlwMp
	 EQzsXvbQc8b5qiYuXSuycD7vXU3b/HwFuEEe7OGVbj/9gANsIOE8XduEyfvE+V7/KnvMy
	 mGjNQjA0mc4ki5uv23HWLiMmKfxEj+RmwBvXOZMoyvIMWoCgCLw11GsYNvxAdpOJ4Ae7d
	 2XEwUyunmtZKlD97adeAog5/wlMfsBdgpxtLV8nOQBIXScXR9RXs5uEjAwH+15GT9U4vl
	 P5R2SUEzk9u0keZgEnWD49c4JwYlM0pt5fQ2CouoG3BNYQFn5SpCn8+XRcCoo02X8sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
	b=U8slcWi3bOuzP51zXgi6XDZXopL3QePqV+2t3Hna5UAoKaMq0neirRc3bNi8A5RnuCr0
	 ymxBgtUneEfxAXF6Pz5bJLtg3F8mQJTNxIWYDE7gfvZOY8p/Xs/UW+SFP+LkVA7aNBZ/1
	 m2DkZlpfsSsoWoXd+NyFzzY3759nr5OuB/dJUFegj44D/dRpvbXRPJfAXjvJ3gIflgGbr
	 Rr3dNf8KOOAgjEXjYXmY3o1hN1G/FhcfA3e0zkkBxFvwJXsnppMqpv+Kf2ycdPkD7FPOD
	 JLILJZBcXIha82ZJiePc0IWPAK8lPVzUj8GvCHf43qDW/VVZHRoaqGmKRjrakXCca8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRiS9lhu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F71A606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F71A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRiS9lhu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso24716315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334889; x=1794939689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=oRiS9lhuoBGxiRDUQnQc+LIe8uZVl5QlGJDQGB4C26lXH+Ij2AtyMMHMpdQRvQ4CaL
         QCOSCIn5sjZC863cLQ5Am6sl0IobZWlm9xqYlT+6DIF9bjf0HBr5aIceAcWWmy2wSeOv
         pWKx/RBFUD/uDiTV9LmEZQd4UwjBqz3fUMUrkEdDNnqYI0BmsCAaK4GNC4JmtN6v+pYX
         2bfVR1bT0UUskjCpUgxG+F4w4R4KsKBrsF/zc+efXCJq9QbmbG/NgZof0U6GLqZmaCTP
         yidxY6BWsm7SBSLp3y3X5k18iD93muo1g29pVlP8RB58rA6pcXoDhi6nezGIgMCscBZh
         OOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334889; x=1794939689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=T3SXFXnCZp/55RVtbuttlAnHZ3rfZQOAYauuFmjqjikaQFBxwTHF/HlG/Jsa4jqS2V
         vODqB1woFJ4aFSO5Q4yWXOlH7RGjR3YFuhw42bzlEFEAw+4zdp0O8xR89wC7j92ABWKo
         br8KYNP1lwsGvTi0oaagY0ETr5iGLzcbLEnaJ3IFHycxh11Wh1Z7PBuL4uH8OHzaRMbx
         7zrrc0q/DiVVOog3RZ9I3RAemBasGOy2GBa6W6x274/+mxcsAPSvvGjmdpiJjB5w43Kx
         9y11MJRW18omP588YkCVO0MNaC0nE0nYz5LQ1uQZutqF57+vzIWgupg3iljOX4G/DygO
         noWA==
X-Forwarded-Encrypted: i=1; AL+hErEHMgZTBmfPgF9nvgxCObMUw7TOyLV5ejUrWygWFC8MPu6JLX8XL9jfXsL+1EC7AadOGaZaj8OKUmTjG3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G9q8l3Xs/ZPrR4GKwC801OmGMGtqIRkuHfZ1VVRpDkhU7vVqS
	8T6olJZ03Cs/s74hXlVe7pTgLxvFtnMoUaACsA3r4L9+YPT44VAhc3HL
X-Gm-Gg: AYBFou0TOuHQAOA5CMo8+uh/qsZyQU0LhvK7ejihIpkBsT02j0Yvus6eBB8yfJDMgjc
	hP6+3oEKZU/fwtsL7fkhQ2C5xxnfEgcJXVBL5ikg1Jt9AKAgi4iSmIrtohPnO/FcTcTQRg7XGYw
	id9JYH7vQ2EFThE0iRX9ShYTNPyh93gjzVFdU59mPeKkb8omorJZSndOBcvszNYAnADXWlCdF0T
	115LPEUGrXTMi5CxRQ3PVtjcgYAWsyIj+3cKJHZZD4Gh1Q61c3w/LS9M1WOtaQbeYEQh91nD6SP
	Js2G25VDx2WHAocQ7O4nuoq3Cb23Fq51J3qnoCHecrQnoVZB/on7XKugJ8qctfuE4MDqC7ahG0K
	bZTgP1xDenSakKHXa9GotxpqufOvEM/68OmBhl2j0sT6cojFcy52KMv/KfnSsxN+8zWW2oXwMe1
	WnlVoKM6V7DcWNfUsazdTRPCTRROx1e4ojETJNKR39pj33pFmccTl4L+54XRKZ+ZgpTjRLtRXvb
	7ep4iayGFe+YJ/v5WRHksoiYLUwjT+Nsh/JuPWjUxHLDQK3qRrdSrRb82unj8BtW7urdY62ds1c
	dfLlM2Q5WBhjGFqcdkmnvihTs9mLSKJNNZ99+0oFfSvUatp5pOw+zCuf8k84eGu6oZQXobN1BZV
	SSZf44Rfop6kyCgrZeByIb1HGU/dC5tQWCmlyhBsEZSlN24oT10ikZ5M=
X-Received: by 2002:a05:600c:4505:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0234e282mr61882635e9.25.1794334889412;
        Tue, 10 Nov 2026 10:21:29 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:28 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Tue, 10 Nov 2026 19:18:11 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

