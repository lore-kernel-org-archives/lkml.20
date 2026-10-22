Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660763;
	b=sDBjMScoLN+bMCgI4w1gdHBCOM87rXhOJ2EdPPn/1HJMXIsrtT9YKyFGPM3HOiR+YFYK
	 sdEXcJopoQfK0lOO3yqvbWHtzkNvxAdzUYy5hFLE5/cqfDG+/S7bl1jarFthiP8NU675c
	 IJcb9k/O9FtCpS/5vSYWbTfLIm8JeTmPE/Z1VfHES/wonL8hdHe7P1X7bImnB3kyHQhqo
	 bLQlXB0jR/N38c++IRPt6EuHfrteC2+1ttK42wH932sL3KtVNnCZI1LpdZjudWVx4+CVT
	 URqu2XrdqO++HTLFUkH42JmSucL3ZEXNfhb0xT/GGCzYySsHvH/PYVtT0W41qQxeC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
	b=hnGDEHlwj8wKXPQJBWvApavA8QBb5540jFaxKM33GbG9dj2oNpqAesOMKNqG+lahEfuU
	 6EAXEezPLr+BJQL7E3UvdAtfFlwPdZnXX7iL3OgJKHiWucnsfhflSCTxF8h2GsM8RCpPl
	 OcsFTA5xSpwXUhG39TO/2Uhd5m+A+kRZKgC/lrd5848FqaWSkuJvPhiR+nbQSk2AP4IuX
	 DYeYthNKA7dl1fOlDzvIa0I0/0bTu9AZEhxPQzhpSVsq8oFmPTMcDT7XNtBSqowBW/Cmk
	 huYhbHRruvj74kJupMUgWltJm40BKnpeaxcX1YvGeaONg1+Dl708rwphrynA4WTUcLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=GLqS2jxP;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80760A2605
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C80760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=GLqS2jxP
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c418e215671so200449566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660761; x=1793265561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
        b=GLqS2jxPj592NSbnpzPb3btzVGgCkLlIqc2/z7sbSOnfobGOCMPB8gzQsJX7Yqfg43
         6Wmitb2SYy20M51IJ2RxNzAyLYyJG8a/inWV2I2vjrxkOfbceXzBKX1tbhGzq4luXZSW
         hkKAHhUplOKV7QXrGiTrKD/HZvQsw0TjMzrk2Nyk2H3fP19rvg2zstpImhy+i42vkxIQ
         maiv4olGWTyT7H4CCb6ExlCxY+W/5GdhZeOsGaSU8N/hRAfBQJf8/pfw/ge2J+f6rAdu
         GP4iBpkz+V4clHyvYWFuqItfblDI4QNEdCR5h6Wm5SiEZPoNUv8vZuR2bMmiqMbY7TUI
         hqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660761; x=1793265561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH4FeDzPCNNR2s+JvuKV7mYVmUzbbIHkggk2wlVeLXo=;
        b=kBxC6bRwc7xZpyFlat855ZCqcQY5D8C9I+0A60NUEJ+0jSLGiwTekB6aPgHuiR6r70
         KiLPzlYs6JC2+S7NTY+N7Vx0ZUovGBr9JFlNn/ycHZ6dtdzqZriYn5VTZNccIAb8SP2l
         vxV4vf3Nt8xJ7s3g8/Xv28kFX7tLBiPle8mWSeqf6OSZtnELGsOxSEGesldoigfb04zC
         tNDf5/9awRbT2g5P6dS5SJiYmHNlTBVcFzS7e2TuQ9Ig6/KzNca4yevUPXRHruNGY6T/
         9VpOVZKyNIAuKY8J++ngmmY7mi0BtAcCf3Ok/1WE8m2dKlhwWLkKVNLBd3dN2RoiwcnN
         lvOA==
X-Forwarded-Encrypted: i=1; AKwUvByl/WBEwUYPB2tAhKHW1T2Ve6aw+9H8Onq8kR6KnqVGM+vT5BsOqFeiekjlv3jGHAQZda4YFgxOr+CLqI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFPx3yM+ClcGl3fy/x1XJEWQiuTFb3eSxCpTe9YAXL75jO0TiZ
	pQL6th0nTjKTYk34JduTDUTpd9XOzvgaOopahOw7byT/IX2PDsngf0cD0P/AYgkh7ow=
X-Gm-Gg: AYBFou3OsV4J4C6kIl6gmMPN6GV6xN9AQ7FVG8o1Fviypb7qmc7vPF5qp7zoy39WhPE
	tDw1iTbzhHnba5wBzeOcL8x+JaFfapJgJB/2Ry4hfNK9BeWY86sklao+ccqePs70QC0ffI38Ovd
	vNsatlQ+80JB0V/w/Jdei0iJx/C4k/4rntvnfRNT2ZVuG/vZwXZy7qSHrNcK5v/BSAxxCjWZrqH
	o7Pzow/fzMpLImf+8m5QRAk+1koYEZHeLVrhrPR7ha+InijN62kjBWF4m5IZwEDgR3wJWhQZpqL
	EeFs0LEtawIgBfgHmhyV9RwVZfIOabCUYAS34GuXHoiOqc5kjiI1eWlEBIQVn5xB4d/Mv1m9Ikb
	k0+obIfwO6SxcmuVQXaX3vr74NppGj95O9RqE41UCyL/RtF8aDHPQCUDrzRqDPHojgT2fXi355j
	scIADBaovjcUsDhgGVuNk//g5xTUPvZ9QsqOfW/ZgjmkhAOXZeYBpKanajzXuKf0xRmfGl0/Wax
	+MABYHjgTv7msOLato1y6ZNG0GK/fsY/BSVerZJOZoD6ltkGrQt8rmYO9/iZTNNSRWwZQ+Cznr5
	6LnAs5N3DODLig2Z+69bt/HmmGC6OIrZBuoQ+a0j4rksoxMcBB+QA4jMYKg6c3j0pvhYG79PAWq
	w8nCTYi1l55sYvFKk0GA5xqTkoEHmtFuDivALDH7Eb9KQf7kZWHJkoi6H24agnkdxknli
X-Received: by 2002:a17:907:969f:b0:c42:24ea:3220 with SMTP id a640c23a62f3a-c467970e3b6mr441406766b.31.1792660760888;
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:18 +0200
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for AWINIC haptic driver
 family
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
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-4-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=880;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=pi2nL8kvBYr8FUFdGc6j29pfQDAldTc7iyEJBmQFvzs=;
 b=ozZpMWob2iUFdSZSQQRasTmd+MG2lGCrchPwltTq2tgohqewvze837ywdzkHno0JEnexC4HzP
 6KXAChSxZbOCovVdvHsD4hokJQTcLOOgtPYbLKKhap7193bDvVHJyRX
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

There was never an entry added for the AW86927 driver, I will take
responsibility for my creation and maintain it alongside the other
drivers in its family.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c103edaab227e7a21e50f6d9fd733..5b5792bfd58b9b4971bdd8471cb832068f8aec16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4419,6 +4419,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/pci/hws/
 
+AWINIC HAPTIC DRIVERS
+M:	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+F:	drivers/input/misc/aw869*.c
+
 AWINIC AW99706 WLED BACKLIGHT DRIVER
 M:	Junjie Cao <junjie.cao@linux.dev>
 S:	Maintained

-- 
2.43.0

