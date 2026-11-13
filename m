Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586739;
	b=lkonm2sSKHD039Zuxi1Aom5fPsSpwpqvHhpOkmTFM/KWGjV4zU31/x2D7umvzvaYIsxJ
	 eB9Y515QKXU92HtEnENG+MSAomDiZklElvKiIHNy2wqQlH1vxnen647IjHo+EmjvbQZQO
	 FuXsA7QErGpfYWdtada3Me5VYJRFKMZ/lwv8UPIqh2INwm/rKsSaESaIzHmlJlM0MbQQH
	 3vdYq68OG98oXru0hJ5hVfodrbND7RYRrMDKPFsSe2dUWtV9ZFKbc7N6GFmJu1NTTQebr
	 6FuPX0XcwQqNlxodmkBE2VyjKafLTgC8woq7Ynnkm34MiEZM5QI+8NfURjKsoWV+XoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=cCHrtW3H09Y7FtXBEZcuirO2+nDpMg5pcaCB5eCCqtJV7SEVyZzws3WvVr7IfJlIDFHo
	 2DMi0KVCXD40Q2LYOS/9PnISh5UhKid2n9Q8k24c9bfzoVjZIz5Dcxv4MLg+B59LYz7dv
	 Wm+GubkPGTEY0OgQyaeWJccMPsi7WqVYhFNVjtg5aQOWJWdqcSv1qvjHWlZsoQO+u10Q3
	 514awR+ZEHaPp/+E7JM1cjQeD6XezLefr68B7630pc8rPKkynG9CRI+nBB0YMYl8TDDTz
	 VonnH55EQL/+QOcLPxwAusq4T+cL7rdr3kw8MoFe3zY190gFxymqFUuk8jGGrgvbTJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/xZduVu";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5860A3816
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA5860A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/xZduVu
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c247f6687dcso289723466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586737; x=1795191537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=h/xZduVukTCl98vPuaD9tn7ALCK/+1HewUEzyNcbAZYa8oxWIHIV7r+j1AzG8JkuLH
         28XeWnnMevEHeKDQ6if9gLfnPgBAOLIU67vCQFebQIKpLAZu4B73xIYiKzNL2z/fIgY0
         yh8YQNaq4KfViS8dBltd+isLo9z/hrM9j2BBzBTh138rsni8UF1HYUOIKwEEHxfAl6NN
         sX3tfC9HW06LxyY6oQqc/7jzKHlbOjQLsPYrwUyhgUO0/buG3XT81pNAo+F9ZWqV9Qhk
         ObmZ+/Y7fFhaeI44Isf4MVJVnjLgQUyDpZiDYXU+eevVWUqan2FhVEtfgYVlQVXTUB2U
         hTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586737; x=1795191537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=ad8c9sBLjs0G8PdqjP4roCSPQ4TaNQ+YY0mU3vVTjutHdnc1eumrE7C5j5ur1c82X2
         6LyN5PDQMCEQoLcHBNCMCVKnbicd+0VwZXYgkhhT++BkDaH3FpW01TLD+e95NdEfZ+za
         4AX1cCHgvkP/rASwwZQnX/h0JJVXGBfWe7AkMoLa8Wi2A3fzYOitjR9SZQkLBJY5wHzc
         noYa3busVzmFpiTpAvwLANkQdiuqFAxtvES4mC9Tuew/Xjzbf9CVLL0hpNZVD//qrbDi
         Toxl/qq6oTkm+wNJDgq1JiUr999LkSrpIptUEguPzNZC/AiCzg0E4JA/XXsgXqimOF1K
         NxqQ==
X-Forwarded-Encrypted: i=1; AL+hErFC7fnK/yoVMsvTxSVEYaMSHb9q0xCPP8JzXKchFLti+GrWQIg8JBKgIELrzoVRVJeCyKVfwHHuu8dTdZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T1dsGtf6AZQ1Fki/hL4QSielqdJTuKoWCTBSB/+D1cvh2doso
	eZ4a59Rpt3YjvYAb4QSojQ0AqU91M6UR4z4RGIIRT2Eh4c9ucunwtVJ3
X-Gm-Gg: AYBFou1s7J8nk5Gtn306fsEEFr3kx6ERiPul3mzww7ypGYDl5RCOW7SUbhSet8s1nhI
	f0P/P6JZ2KZMl1xfxClbig4LeMFspB5O39WV/NPmwz+Vhu6aNd/BnVGvdkiEV6loSNZ5LvW+Uio
	8yjZ+tunJChWKJtEX8shrhM4Ktc4SbU8GctE5DI/Dak/1NWZazrcriODBUva0eGFmL2te2GYTVr
	90UQjhebJDq9Ujjqz60gzl2IuCT2sQrvEZQPs3rL5cIkhu25NMEPq9/Tyr5cua+XdjTcoUDyY5E
	VPWNkkUfksRnADtG3zCMDf2c3k6eBU/Rol7Pt//KdrJXN1ME7ArwutpbvHuiB7Z+uXk7tcYIOal
	f1eF4FJNbg6swuOsdlH993pnvrJYD0xdXzEbvCfSa56EzYh2uwgCegE+2tRuHxXYiiDVEzUg8DM
	dTzZxX37uZYZpX5qLyzxT187DNFMn9R34Kc04BAsYdJuhRr/DflzFwC+jSjlgUal1c+DRYM09fF
	e6dH93+CPvK6eLcvFR4X4ZVnDwGfEVzK3UpLaxQWs70ZToMREgUzMAkwynvNQvnyDuhWOMs1CKJ
	lGwyhHLuV1OWsGhRd1RmoaS62pippXwIa50w04JTfYucW5D/qvvRSrUx5+yqs6uFxWIlF0kWxvG
	xi6OKq7xTdAvGA3H0Qa13ireChjR4imM=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277155866b.9.1794586737209;
        Fri, 13 Nov 2026 08:18:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/10] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Fri, 13 Nov 2026 18:18:18 +0200
Message-ID: <20261113161819.36847-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

