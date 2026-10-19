Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440750;
	b=iGnVJGUNDnVjO1TE+oJy6XJOQYoFXRwYkMzqtKeq3PQrv/1umYlU/czupCyQkXvIy+MU
	 ydgr2zbGTln4T1JkkelvPyKTL90Z+OMdBEVbVdBHDFLb8QS7xRQWugylrzW6gZ39Qey11
	 924L118oRp1mTxTUb4ZOG34oY2VfWcdGoNCvMty1632xSd8qH2DB9OjAIXFhtwI3fznh6
	 j9mzdpVb5yFyjJstQBBdHvb3uVcFG80F/AC3shlSR907cmgWVYMg4rHUn8PM3Va1egPxO
	 Dj9leFrKWvCrxhc09CT9hOraDiWf9XtSb5EcX0bKl+388iuH7Tt1BF/28IGhWJQuf7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440750;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=LTRlnK1nXG1mmQO++Uq1vusm9ibIA0GFtmdvXpx6u5o=;
	b=CdTJDrKSRJcU3kHnAeFNp0N5rUysLosYZ5lF6Bwna05H/kDSysIVvESFvKIFGnhbXNrL
	 KaakwsuAc2JzYspSnDfVUSdi+GDZmOpT9ceDf8QAzTnzwq6YsEPSVOvsukDP8aC/Gki49
	 +oF22m1DqbNfw+ETO3uMpWCBlDgnUr3PBmEENVF/zB0HJClvDyeGYx9uL1MunVhIoFxEZ
	 fdKVk1kTUV0HHnJ+cR9A/kvlXDxOCJAb8V1ULiRZpjkOAOfGwSGBAlFDWTc+8pYx/pSSI
	 K1sf8njEvzPEHisgPYFQe9jscOMLeQJ0Jivr1v3QfjnxpAl/au6qpoYOzdvfAUNGBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pMkKdZes;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F74606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F74606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pMkKdZes
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 677DA4E4127B;
	Mon, 19 Oct 2026 20:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A33D60582;
	Mon, 19 Oct 2026 20:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DE9B10328C22;
	Mon, 19 Oct 2026 22:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LTRlnK1nXG1mmQO++Uq1vusm9ibIA0GFtmdvXpx6u5o=;
	b=pMkKdZesfYONkSLVd9w2zfn0x1bHOEpUnypkBOSqlSy0pjCpzKYspdAir5JIiYpA40Tyfr
	EjcgZ0DJVHZHo05EHCXI/BO1+GZvL/FP5Dqyjdhi6X2XJxY/4ZTOjmVU5TMe8AS2ZLgQw7
	uQ2gOhWb/KlcpBNkqlaTZlqGKb43xH4c2jA1eNPntVW1/alFEj4xd6w8iPGXsoUYJZ3/Ca
	iNkR4NZonej30f4Ulf7DfznKNCnGACq64TIyDyKomVVDWuTq8KNvGO4Tb2y4X4BWVo/pPF
	UblefzjSbKKriP8AWBpFPn1TeEjVoYrr+i5HxyGlyEOuOuEegW9c7eboWvvqHg==
Date: Mon, 19 Oct 2026 22:12:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
Message-ID: <179244056613.104236.10835769446499654446.b4-ty@b4>
References: <20261014193220.38055-1-pmazzini@gmail.com>
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
In-Reply-To: <20261014193220.38055-1-pmazzini@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 14 Oct 2026 20:32:20 +0100, Pablo Mazzini wrote:
> Set sun6i_rtc only once all clocks are registered, and unwind fully on
> error.

Applied, thanks!

[1/1] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
      https://git.kernel.org/abelloni/c/2d6f97296143

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
