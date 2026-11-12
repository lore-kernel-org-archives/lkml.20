Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519479;
	b=ysvCxFBaoM+mobJfeiTplOmiMlxlBS5XWbkhggJGPb1Oq5OMVkK11k6HEipx8KtdjMSO
	 v7ZFb6njgnJ/qrBMcr97ruemd1JdsaL/+c8V+g2Pfr0RJ5PiUMH7jmG374NlrEIjFGJAv
	 wlj7lOsTkASvCvVS0o0F6gbwrvRTW43o3wYUJVFYWYh3Wrp4ucIMf5u9kKtowbBgmlQzj
	 1khH0BNt201HIbPUlxg2d0PcM9vx0VYd24Gf8CBQo0IOzXbtKvaEVSAP1hBiApG+wnKJP
	 legTJ0b1FhKTi3P6O/vxBc6FRExvIM8iecsyNL3gfu2EEmX7Io1anxWypF/HfjBw3GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
	b=1GWsRh2hwrfAI3bVR4qh4ZNeo2Na+udnasmRkHUiBj1BE6gq6N9CbT4Q5ZpzVZMMNd9i
	 FSkHZecco2zgT7o/vBg0VLPR09IBjLi2LTy8257zwX2kTm7Qt4PirVMrC2u/9xBrmDXnh
	 bNZi97g7ySwULmTAwMszZZ03FRyBoJQp1HzBxO+vNMURnJYuPhQKjDgNrsceX4GF2+tD1
	 6Uc7OWKdhIzJMsStxpBiOXf8uobWleJPoFjpoAS3oAai6j44yXIByba8+6Jopm8M88i58
	 YOz4mSvSUQKa+G4HsKUBcB75DDnbXVSPQ+njGBQl/QKxuoLa1XS1yPk9SlJJqTzjE6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CDA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86CDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso329944a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519479; x=1795124279;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
        b=CgiOMrt4fKnUZNl45tq5ZDgtrL08QHXWRyEbk3nRJ6FljcBs04a4E7VO1P7VJywxmn
         J28MkVhHbMsq0Qnd5BKzCsrV4ZztHzyas7lLIhvEIY+dxlhQ9deAuYj7NhdL8c3Lm5uw
         Qi4Uqy6XWG1UBE/GFB5JQdbGMHT68prZxVguoxsHmHswejodmw+iXJLmzX9dGE7ja2wW
         2Q099NXSWNp4JMfnU20477pvaAzRwV5NJekMnXXXNUHrwLCRQ/v49hR2uKOCq6AIoUZG
         9f64XMEFFH8laojwO+eOOYisKr7bT1I4tiFFhPGsKyUlwQTBkqQI4dLEj0DzLKxSFvjv
         wo3g==
X-Forwarded-Encrypted: i=1; AL+hErG+I635iGrHlevJwGdp9PPHFmfEng3qArgpmmKHq1Y1U5FC8Z8jDswXMA0C2N5c2WYK1N+xjPxDmddYafc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/41fPJcQilC2NK0JhN5Ga7izYTMFgYG2umy3JFEu63gxpYi85j
	8Vc1fvML00KTf6o7nsuLI7fGLaCeIpECmt2jCRj6cSNaYrZIEb8nbYpPWP0OE/lV
X-Gm-Gg: AYBFou3HIIfVRj2gf3huzb0B/XliC08GVvc26TYnzEYpNj4HugkZOCOplRLBhgVMvRM
	0K+xRsf/8Z8TYlX02xIBliuVrHb7d/pXqw760EiKflQGoMNQZS0Z40xS1/8wl0XrwflVBeh8xii
	P0JdpKLqA+6ZwTg6nD33M25g3XCr+jIoI30RMoe4ZONMoLOGOCliAs7/szvLS/WzdGYevz128NI
	n1Y7UUS2fKbVonmBCFXJncwSu8tlKmHLhmWvG19BDaTldxHzNRKghD8Mt4xajghyxe5/Kvshiw0
	wu/2jLvO98GbjnCmK90ke3r7L2PTUP+tP4HbvabS6PjSwRMDc87sTpE9N/+xBqZd3PnXozQ6+dr
	QysvUaYHTkYP/ahA0PlRiAkGDau6LLslCaCVujXTGNbXO0fDoh40hCLQRhZzDDMHXQJx3a/wDUL
	RLT7x31oZvK5b0iSPuTkIvur39pTHM5vqTzB/KpqEe3ClqnIpp9AO2wSLIMFkMedIm3f86XXqPS
	vbC7536mesxXpNHkIb3pttGBaueHLFXRSwnx6c1EXmbSw60CxNvsR9SUhyEPqZJ9MoLnQcIu2SW
	4FgeD4mRMi0QZ+lAzHSsXwXE+nPMDuvMvdCPTRmOK2mmEngeZ5xRW+I5ubrv1Rk89XlkWXlVKMO
	am2PIYNIO2zDZSZ2h0eYFCD8iRLLes+WddWqHAg6TRBks
X-Received: by 2002:a17:90b:2d88:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b1b0ba38d1mr289656a91.30.1794519478633;
        Thu, 12 Nov 2026 13:37:58 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76f95sm1007485a91.17.2026.11.12.13.37.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:37:57 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37628596783so576684eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGeFwTxJ30VerTYrRKgwKrTvTnVth6vhwscBS9ktrjBmB9jxVro+XnHWdJYJuaJ6OqzKdEmf2MTIRmQ8mY=@vger.kernel.org
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id
 5a478bee46e88-3798df3d361mr53568eec.13.1794519476959; Thu, 12 Nov 2026
 13:37:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev> <179444699398.1126566.18079369824329437583.b4-review@b4>
In-Reply-To: <179444699398.1126566.18079369824329437583.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 16:37:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
X-Gm-Features: AclHuK-qYQ4QvhuWcFcAv5sXFh2xbA3gQD3BM89Iz_DI_n7EaCswO7U9VivUGq0
Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock manager
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>
> The license is different compared to siflower,sf19a2890-clk.yaml. Is that
> expected?

Yes. The header is Chuanhong's, and it keeps the license he gave it,
with only the identifier updated from GPL-2.0 to GPL-2.0-only. The
binding is mine, under the usual GPL-2.0-only OR BSD-2-Clause. Both
licenses let non-GPL device trees use the header.

> > +#define CLK_MUXDIV_NPU_PE_CLK 20
>
> This is the only one that has a suffix of _CLK. Can that be dropped for
> consistency?

Sure, v3 names it CLK_MUXDIV_NPU_PE. No device tree uses it yet.

Thanks,
Joseph
