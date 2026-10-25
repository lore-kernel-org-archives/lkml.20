Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936709;
	b=D4wV1Oyqo8IcfVilQYJHSu/W6o1G79sl65/P6/1qTAz3pweZ6Rr9BvgkrbuaUpCcT34p
	 0gYukQ7DzRRSeqhgLj91oGL4O8V1wwci98b3vgkioZv2rG7EmpnXt/dh12LxJzSNzrwKV
	 L6wvQ0Q+1HM4Ing6pmWprd3swizKs+u5FoqbFwv+vwEtkBq375p+wYDFgXTRbms/9K217
	 iuLvqE/EsSM2aDybI/JP6EpMmr404MDkBM/w63j1a71WcBTYu1+x72/U/cbZLvIJxCRwv
	 Is9QIcg7IlJZM7Z/cr8QCNtTPnwE+sIKGHPlUPPuVktT9ZSrweL+SsQsCFrjnFFshOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
	b=qzorJ8oFCYhC4+pz71KoRsLhmsDKIGc1OoqODcu3UUmp5HWIgNIy5aBfjI8yCzLU7Xj8
	 8ZETlJ2IjtIaQ1fHWcjE1jPmhqNPDHxe4S78xY0AXrcMpGvv0zeEcEsMNfTDoHgcD8PA1
	 HMuRjI0cChiSTJSEtTEsQodR0UvgE1xOj5spgEeudwVlL3cqrFUuWL79xQJx/R1ZrWKuf
	 k1Onrf/Am0mUuPiOry6b3U9xygUHhWBrfejC6cA1VN1Ju0v3y6FNexEkuaVGqDFwAryE5
	 +ZU4daukd7TmT8kaM9O5C+1wDZu/XJ5S9er8erR3I6uc+/Vb8opqBVNbpZMOR45tWRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5TfxP3r;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8C606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0D8C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n5TfxP3r
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1253027f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936707; x=1793541507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=n5TfxP3reBlEm7ySHf8YpItTveboXcCRmuCtGf8xmaew8QkuZ2UFtwM6fcYztOPx2H
         3NVw6eesIW57y3bKjvWP67ksHUSh3BckdE72GTKJ54r8DpIE+YycTcbO+D/mYKp6Pc+7
         cNeVJvo4kBKTsOniQRbELTEV7j+OwWao0wVv9FuWwnUIgm+/BJp7vnTNaikmc/wRJfsV
         mzDMErTSyGMJEdXZeOHi8RYihmE8RxdIUGU7OMg5rcZhkVAnpIsa1liJsHXcG9YJPo2M
         i/q35LdXCUoKjCRSzsdHtimMxKL3yyEqzRt27jqxCT83j5777OuFb2GnLLeDMQj65b1N
         9tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936707; x=1793541507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=TTB9256qRHt0qIjFvEIzwpuBOEANYQ8Mh31+11AaId+y9p5Cbsz5Sl5B2IbuZe5Q19
         EfBVpO3tpZnjre9XSHhQzvgcc/99gDo+uCqbnkBc/e4oATPIgf9Q503oLM5ZChBlpMhd
         cu9gwWp3C/sfPsLGZW1zG2sjrq4pPoaAcXQw/swD0bRIetKXmGRmp5T9nGi0B7SMgb5E
         rCkMogpyp60sFSXJCmiS2WUtKMzltZ82HXqNA5oWwJ/0YTXSeiH1wKJgh8qJtshbUZ+t
         P+yBb0cCBYXRCXIxNs1NM/BBBXaoD3OeRzDSfYpKQ9JumtGhxQbU/ezCn9qw+bs07xqn
         YBkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvuTJNxJfBPKSE3Kf9Tsf/KQUunok07MxiX5Z7CXohnK9DUsEymGfBJfR8hTCOoZcfmoW1AKk6FP52TEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/NrHdTN6l5zH/sQHgMNJEhB4AWzXfM6okKqnLq6HS86f3gWj4
	RhGCfFta1hLqpqL1qwqP2F4jxgCKZCeQs7GO0770ZF7ZHlq5kGr8sSfj
X-Gm-Gg: AYBFou25Zucy/7XnTrj647P/qatTo4WLhm2PP1rc1qskc5lZ0gW3vNgEj3pihZaRSDY
	YNGBPVRO+57DhdKBNrxQr/rSzwPkdWAccZ/EFj2qbjaV/xmdTvtDAupjfPAAzD5L7SWW7Id8wAu
	p1UVh+jO92kFpPzk3UITNwkmJfNjSFuSDG5aeXDjpfgaRNg1mnfyBoCXUd1WekF0SOwZL5V6ZHO
	yyOiZXrkrY3HahNnZMA7t5/oGPWpc08k0rG7i2tP0/+LsiIOK3TaUUZ6EGJUwATDFvzJeNzLpUa
	stjHrb8z6jYvvl+4gFo3o8EXz+Z5PjsSJZLRaEmbfHBvh+9L6lxk0bEErG1+x+iXzwmOvqFdRkG
	OaKXmWxCXjHtj5Tp+JeSU1s1w3IwdDFEH9hYpNSXXfAgLZmi6A7r1Ntf/N6OSAkm+hxqu5RmWug
	LBtUwFB3BI9YONVIGK0fPh2rcfYFYWSltQyL6M16bo5pK2H1wcWaLDwlXFBiHAet6VffePcWAiZ
	blC4BTBnHPdjdZ+bod8PmzkrIUTP4ezB26lPod3LVems7+q+/TGIL7t+guWRqrJhFHHHp1oXcHD
	JEjo0aHc/Jf2Yg==
X-Received: by 2002:a05:6000:2501:b0:48d:f14a:9173 with SMTP id ffacd0b85a97d-48e3eb247a8mr7109194f8f.8.1792936707263;
        Sun, 25 Oct 2026 06:58:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 13:57:45 +0000
Message-ID: <20261025135745.102970-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0

