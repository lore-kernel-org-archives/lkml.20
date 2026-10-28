Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206118;
	b=H3MinjAqtnQk2RhCxbWuhWhc991iUVrkziWdun3ct34hS2MXmC2WQhV76rsohTffKv5+
	 grwS4ZF7IuxqSlWuuqLIZSnmDuOQ7NXhRFXJ+WCgR5jgY3XpLmQvcoQielEiWK/pahhSA
	 xdPSD1G2UMCAmDQmNKsVaFl80lctvgHkDNfxNFLM9+1oI79sQyOF7kA/ErS/Ck3fhFQkl
	 4BfKx9UB2YTe9zukUcRMbD9qOWPI1tOChK/orzLB9yMykY+PkkSnYxEKJ1v1lJTBcKka4
	 HWTvQ887h1tqoBskwOFeOczKoTgNZUm7zEVl4wh9XTaWLesbMy3eL3EL2l1RiHsLv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
	b=sugLpsyJldsSVdkjGI+rBJdc+IWqGaRo6VyfC04k6VINWz+/u3HUJnnont220jZYcpT/
	 jmOZw84pW0VFPF4xLwFhrbW7YL8/Y7AgsaHOEAulw5geBIs8852+pjn/shdBCFc74O9tH
	 ylO1/wUacREFZBVn2Le6feDekeWT3lVc3czs9ziewQMOMq25zMinF41ga/vodtZ392mE+
	 IOCv+/1HpLFwqNTSWLnWXy2hxtJ5/vMlP5JzHJrgZB1PYPEF5SYaEtCgsPs4w731iz0Ey
	 U5zu/FGWvxlob+OobaCyUaqUOU9lDVznJ8NyuWwX4pXAgV4A0zqWTBvN5RoJlgQPLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AWZCxGkZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF2F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AWZCxGkZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so13500995e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206117; x=1793810917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=AWZCxGkZoQdesLGQrrnvsYGQNrqcDiUUTccIA8g+LjGGdy9Zlpf6SAWSqBYBU/N556
         XqnM1yNS1SG4KQqokLrnmkSge8vkg7/p2+IbdcbgIc25S1IyhSjnUNQvZtezTHBCG8uD
         52Xw4fOgrcqrE6th6EPQdWEWwPgtZ2ftMMJMNlOxYeldBQE8F7+vwnKuUJc1AWvN0FYb
         9Yi1OsWmdqEUOLdCLt2ILHohZj4gq1CX5ARDHWnF7DEjqJcJMPN4HqxhnS/h+Nq108O5
         8wGK3UKv4j336bEvuU5MhQiP7ZwmAEYyAZYRe0VeoPgrzoafGwnzsKbwFXMmIo62SRdE
         wYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206117; x=1793810917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TKL45EGjOvSJq9RcZeBcdQfOCRHkAFNmFcBB7UbKPw=;
        b=nBVyQw5iCGAX3QMeqBeWydFJzEYt0zszBkagYE4K82eU7i0M1OrusNVWX/rkQeHNO0
         rZP/Ab2noZJ9Yz+2yk/g1jurKWkr1xpdKRfx0OwZFoOiPAfZVBWCXr9vEoBzj2BCA0QD
         Y8JSf8yM1CegL0wKU6WCIL7D24ZoFhN79EHl6wNxnaLvsoYYwuNYVi9pQtwkEYnHQQwi
         c1SIDZOBSV+Y1OEXSJTACxCsKxLS73ZOdpiDzM7pV6Nhb0kiancW+YWAZdGZt4D0Y8Tt
         jpJ+uVldbwCJSziTvbrrnacYjmsCKvDEIuLlionutzca5uE6nBKztNZDCcx3coRPYM4U
         D2UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzh03UHresdebhalr8C7DNbiDAMvwZCaqV4rUfpWVqSIux5lvxJ84mI64XYTTt38wQJhvZFOJSnNb+2D4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/MpTkQxoI8+5KkWB6jFYbjPTiOOrPiZl16ac8VxKkDRXPNae2
	97NSpLeeWiNC7Cg2Wfa57sAlSpQ/NUmfMxrcr3iFP/W7oW+a0zIlMY/n
X-Gm-Gg: AYBFou3V4JWCDiEjPO5a5ABHMk3oLW10VS8x8W88P2YOEMWM1vPHYGfetFZoOam3LkQ
	lEu1OTTgjQVm5TCaRd91pSyRF7HSPWCQfpWAbzpsAtbZ4NUGReXYWftvZoKVrWapkQqHzdGpXyQ
	dho/QNH//zgKrNOzoD5wQlpbU19Iqf9hDoYvEJLfBGGPm7HxEbmDyOGDUXBdwjU4ooIyN5U5mNg
	aPlg/h2K9/MyL+Sx11jx5/Dfct5D43bk75dhq4NFOsCLg92p1I9yIMrq9kFsIvNliid60DMN7Md
	AGEi8n4zsbdZhV7kpm/ZoT9qsqmR3IqUBDoo0/8iPsP7evlMhV0K/dRicSrOiXpMejzALU8P09k
	9DrtjceF1dLgqMv0BYdxjMVsx7fPeQM3g86T3QUSdZaM6Hb+4g6e8I3J+bFhzxFG8X2kkY6yeAY
	abT58dgDK78QTyhW5rvmpmEHUZ1TQbFPiR4lMMMyPpvLGBU/QUquN4kw7n2RbYqrZXiMjMFWf4K
	UbdPQtWrS4DBq0XsMalD3DLcsnTV88+hXlrAIu3GAJmvJ8x1+zX4Jwc1lEqZIoS57LHdUAl8G6w
	pB6Yk0vVvdpVdl3hX22oG5aYC0eM4dKpN6MQuLn9fp0rjUzlJswSRCQH4NwCfX35Gq/i3BVSnon
	nfIrUliE/Ko40biKoHtIWsRhJIBSugu9Hf835Mw==
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr22034485e9.28.1793206116486;
        Wed, 28 Oct 2026 09:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm4600155e9.2.2026.10.28.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:48:35 -0700 (PDT)
Message-ID: <6ae22763.2bb6edcb.3bc160.a0e2@mx.google.com>
X-Google-Original-Message-ID: <auInYOnHl6n-3ggU@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:48:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document support for
 Airoha AN7581 SoC
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
 <20261028-academic-blue-earwig-72d3d1@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-academic-blue-earwig-72d3d1@quoll>

On Wed, Oct 28, 2026 at 01:51:16PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 03:40:00PM +0100, Christian Marangi wrote:
> > Add dedicated compatible for Airoha AN7581 SoC integrated MMC controller.
> > The MMC controller is based on the MT7988 with the difference that it does
> > have a single clock controlling it.
> > 
> > Add the dedicated compatible to describe the 2 register requirement and
> > permit to define only 2 clock (the main one and a fixed clock for HS)
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Also add compatible to restrict clock-names for source and hclk
> >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> Your driver part suggests it's fully compatible with other variant. Why
> not expressing it with fallback?
> 

You mean something like 

   compatible = "airoha,an7581-mmc", "mediatek,mt7988-mmc";

? (my concern is if this would be problematic with the current if
conditions in the schema)

The driver is very liberal for the clock configuration as it does use lots
of _optional... But it's not possible to reuse one of the current
compatible as they all require additional property that Airoha SoC doesn't
have (either additional clocks or single register)

-- 
	Ansuel
