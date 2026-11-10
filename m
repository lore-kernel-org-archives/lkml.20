Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340394;
	b=lBRdHfKUCvFy5vkfQ+7alHAZBQoy9R8dmxEOx+z+KG13yJAih3tF+b0EboHh4lRn0Ncr
	 QfeJ6PUMbxLXku2AJVKDPxeeMaCVqrARlJXbQ/Z8ghJsg737b9284apJz0OIIQIMn8S/B
	 KGg/GFPpGK7a6jjJ9a37bsoywvPug6liq1zGQ13QYeJ7wb17Uh6OaFmAjV5RWKssqH11c
	 w8MIEgZQfROvBcZSo5lUq2tsRsROi8h1B+Mbj54Zq1WmBzw+otdXmuA04QuaySStMDG+y
	 t+BK0f/cEih9BVgK4vJ9PmzX1dIRtzQrI8W9K1++VcR0DKl94a24ZUM9+zB/qli+OZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WL9SHgfJTRGu/WBkYdNm7G/jAeYVCea7hdaqofQfU7g=;
	b=UL6kxQKTLbnY0y6bYKg81be/T18LJa19OPJmUTEsrL5Ei/ocLqyJVVdQ6L2NBfjntVhv
	 PTyFSsyHorghfOGz7QyeRgQ3MODaL2t0ixfhJ+KkvSWyXuU7xl8/Ohiy4J5NHJXS/TPky
	 y6QL36V8hQFS9DpFPxzT2H1by3q4Udwicf/on18l3G+bhiknCIfBMVwQP1AO/bH4rwhHQ
	 A0corm1jPVxlXXYENC4gdB/LwWOPUxKL5R8HSmkYzidnbi7qWEMgEvgjCTh/q+bjMT6gm
	 Td4NU0OZAQFiYXxhQE/zVnVPUqjt7cc41pK0jOgHFJfTUbi9SGGX4BOa68HT4BJmwDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjJdQ4P0;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7184606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7184606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjJdQ4P0
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so284096a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340393; x=1794945193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL9SHgfJTRGu/WBkYdNm7G/jAeYVCea7hdaqofQfU7g=;
        b=RjJdQ4P0TaxJRvRooZd1WV+O6P7NwLQnlInIdiOq9sDBKpRL5JMAJOHc57dvfPSCqA
         F0lcUbi0N8b3V6wddGJbLnWQ+CrqAnzoHBcxgSWkE7/RwgCLDoSRDGfwSN3t+h8vLADY
         t9m2mLl3w3K4OGN0zmD6qLafSjcx/13gHSXwb1zZNh2PFy3C25IChklwawBI3QN3Lm4q
         3l5VovYBJ4mRPYwXWilE4joz/BbiAj0jQdztGoU43KFkeEnvrEFNQniNlMFQk8o7Btss
         0tsYzCEaU+gbvVt21/RK6Bx/c3Gj/Ru46jKDVFqcv17WJtFPaYkP5Tf8gL8wsZbDoBz4
         kYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340393; x=1794945193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WL9SHgfJTRGu/WBkYdNm7G/jAeYVCea7hdaqofQfU7g=;
        b=yYzDOOzliWNiIaBlZ6dQYn6DEgIz2xdS2Ucaymw4HI8CibW4mXz+FNQpr+I116jdq/
         cm20XW1r6msuCOdHn2hn5alna9doHIec9/uWGTohBMDDsgtjWxCeH6KWSFyJyQ5J6IgF
         vEswqp7q8bvJtSC88xBSUlU1ErIY0e3BXJroBk1AL37gcDw0BThsq7JonL1mwh7Ui/5G
         yEqECWeNetOic1ZyrDwU6O74A7FzeBV7UxZBwMiUX2H/Nwra8DEQ5kXS9zNKBr4pUSIO
         Z/MHwaytL0fahFL1ZqftPm2OGwJhfDAciAqucIpDq9NeIa3UXjBOIetvX0oE+6FTtDBs
         ntKw==
X-Forwarded-Encrypted: i=1; AL+hErGKf3fULgil5DVIQhFvVw0M8Q+OoZko1afxU2QTXsbXtzQaifyqCJKECDSIBtLH1bxziXKYcHQNKswUI7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pkpRDPxeHWT97Tcv7nGPhI9RGt9eVLxI4btwj14NIa7TtfMGN
	CudM5AawU1FRG6OEwCgL/R7C6qbbfYdghoIC4QKCujf449f+YCV8OQR4
X-Gm-Gg: AYBFou2yuGekIIJs9IjAnokGeCtFyUJ+lT1QbAgbd1zIqFDTHjwo4jvOsh/kHfpzxLI
	oG4mQEXqq/q0nLaRNRbig/uj2udQnTmkdDRwlOfTw/CV4DoC3o1sjStadMjbMX76X7MBCemg4T6
	jI6MRbq/sHLEk427L6qb7E/R3vhXbWvn4k/FTt1VH04dyF4Dhb5TC0UmLTzKgXPx8ufZ346uHBZ
	9uJ4B2eILskRSXUdMjPIkrGFaYw3wJrbEFpEvmbuYJG+KnhvqZNagG3UXlRgEwhepiQiDZUFK1b
	UXXTq7sR/A5JdXsFxp8CeCmo6j+qbff7HJ09axJuUNWcaPvvmYW/KcZPDu0zDWp80e9Pq5pz/AS
	cAtbMMKMAtjsLiQ4uwx/okPiiHHEsKnH6v/S3Yh0XXWZ8ekrXvnx2n7aobVP+PfWZuo2ZTX8e97
	ovZrdj4amepy6b1A0MvOkttgKXUAnKCqHa05dKrNr/Wos0LS3Ye9QW9gwaAz69nZCMrnN3k4Xbo
	7fShhtY2zg2z9GAJ3MtMttkai7CAwnlzppzzliFFSPk4T4VB6ve2pKP6U7ypcdKmkBf6foJ4wrm
	msvUU4dvf2MgWPPwWZc9DHF081Yet78XjNXe5vM=
X-Received: by 2002:a17:90b:28c3:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b182d34513mr149153a91.0.1794340393165;
        Tue, 10 Nov 2026 11:53:13 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:12 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:36 +0530
Subject: [PATCH 6/7] ARM: dts: ti: omap: omap4-panda-es: drop redundant
 fallback compatibles
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
Message-Id: <20261111-ti-omap-dts-fix-v1-6-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=897;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=BRnkJw3cHyRHMzMZ0B/KYf4+f70CIw00mFhCF3duqu0=;
 b=aVlp7YfQ2U/wkPFkov8Zzk2jzrkg3QeNdbU342SFwuZTRBt8/vXz25600TLPBSI0VqH0tZZIw
 RjBAOTuggEbDyDKDbUeKrSEyKVEqf1WKVm311zOyYsANoKEGaCEL/FI
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

PandaBoard-ES uses the OMAP4460 SoC rather than OMAP4430, and no driver
matches "ti,omap4-panda". Drop both redundant strings to match omap.yaml
binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
index 70c609811d119..2c7de0bb02d55 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-es.dts
@@ -9,7 +9,7 @@
 
 / {
 	model = "TI OMAP4 PandaBoard-ES";
-	compatible = "ti,omap4-panda-es", "ti,omap4-panda", "ti,omap4460", "ti,omap4430", "ti,omap4";
+	compatible = "ti,omap4-panda-es", "ti,omap4460", "ti,omap4";
 };
 
 /* Audio routing is different between PandaBoard4430 and PandaBoardES */

-- 
2.56.0

