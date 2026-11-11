Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368947;
	b=3lDP/hMcxZtU8/GdbXVLsyygGRo3MZbNLEND/vMwVyrMECM63Ck1Oa27ie8EaDXPdK7o
	 lAp8z0PDxJZlFSiJNu6JLX4sYUnaPVcD3qmLCRzhsMN+BS7gfLPRlqbuPvmcjg9F4YXMA
	 6V9z0P1SoCI79gaGsq+1092d7n1jkrvBgIWlBnXJZCH0bugG9CmNdkmP71qJVjLgJ4tgI
	 bXpxhtu/JzEAeabQ96jekENy8r+YKo3KJTyIfPnPtjp9xbl+HWj05btG1bGtGw7PYozWi
	 D1HmtSd6vEqY/KqLqF1KN/2P2EuajLlG0E/TqzYi2/k+yo2B7F1D5re12uMKRsjoruA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
	b=KdG9H53iWI4JXCxPvxYGj6a6vqsput84Mqqch3Ok23YGW6EGdUs1KXLqIDOZ5zVVEg31
	 wIblSt1p36ZGjSM7UUGFNwwXhUyZp0rHkXvUAXq07JmDp3muExGHbflcQGS+cUBeOH7Pw
	 9OQkalOBLKsOe9M8n3rVrRTRkXth3ScjfYNeuDp4aMv3sbPbK94398RXJxtFxA71zoCWE
	 tYOqN81Zn97CsX1mvIfEIQZKsvpsax62ak2usAYVHY19nX/U27oppaRIdAv3jGv6vOYLF
	 HfzTJpMy6Vjy37KcZshU6RRlm2NVEx4ldN/ZRm28cNjthnKj4kJEdPB+GooZI6Y3DIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLpyvzuU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLpyvzuU
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2eb18f4da15so11053285ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368946; cv=none;
        d=google.com; s=arc-20260327;
        b=PQu7aLCHgSQqaVQwy4pzyQnFcoir9b61Sk5UX7u23BQuHLErXvqrENqtA0rdmACGJO
         n0JNquZRJ8TeBjuVQy7ugTyBoMRiHLAVyvThk/bQPMEhna+6xE8KdVNFJRjVaJ2ZCktc
         AN/VGCtLdxunKuSj05gLYgIiR2G6F3Ce5bSbW1vbIcoW4chPDUNQhOTrzdE+czuUOQvQ
         iQf1J6RGX7Wl8m0st50s5EzphHCxR7RyaGpI72vUfEF2DHMmQvASYZffO//ReO5q6DUf
         l+thxGwB5VWi4fdwVFL20fhdZfvDi9yJQq0SoX26ViK1gKF6sbgXm3d2qRloUCWQxjjc
         EPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        fh=ShEAp0jBFZMXVh4argOWS7k0B99Zkwl4odvL5nKOHMc=;
        b=mgYMxLi2F9gl0g9dYLW+pkoaZB7e5aRJ1+8s8JtLcHfTsFBiXH3EwJhebR8IZooia3
         CUBbtaxU0cMLUAUrXYE2c5SYhagDiz7KfofsaZBOafMdZNxC+CnpK7V0OUB8+4yGdiuV
         cPZDa8XrR3+x39wVbB5HpIMk5DG2yhZvvhImTLwMTVlZU6uflfF8q3MEpeqEvPUYVC0q
         BLWUrXkC+bh+ZfTRYBhjgD5/s+OkyYgugWqDwp9N3hZ3iUwS3vC2XDAgJL+N66AoFEZM
         JFMup7WvDSC0GXEj/HUFTWai5pnI/6K1zDrZ6t95WVSzb0E4+/29H1ms9uG1koEK8Lpy
         pN8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368946; x=1794973746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        b=uLpyvzuUjOziycscbYMwqyMtydI/pMiEeQzEAFxqpcdSU05lFxRuKipfJeuyu2ZKvS
         9AtFUnY1vM4SkKmQegXJNp5nq7LUYs3ozLpKoyMc0DoRM67NE40qmtaFGD0jMy4sgMOb
         M3LXKOU4A8HLGzg8maCeY9CnYhru/vgSghVj6mBpxWvCACe0Y/3TH1tqNUoLYUlw1IR/
         ubphfLWcHt1xvUmC4U3VqFdVWeD39w12lDXm6lmWKtF6k62vgyDri4w366tdB7DzCL83
         RRejL3gcsE0g115mySOJsv5BulPveTiz+vJl2xmq3s2J2+8XDkq55pPWrYPIbHl0pAT0
         9Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368946; x=1794973746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        b=x+jQiigEGYY14f5yFw/449Xt9rSKYTPhP8kA2aS72Trf1jFCmGvp8OtLG1awJT0qvO
         /kP0dbbQkZYgFnfc+DiVWvSe0hL2NuYEmq8DOOpUGiSVCHwNxkX7sln5DS8LVokPcFAg
         hmRm5J8JDuk6v0+HNBuQYaYWxQdsKzqS4k9DR3twa4sXFEmZ111lI0jsSwMDstTlk/fe
         dXBRpDbK++jRdyTZtPh69KhWuI2jBLFwm6MLbRJbnhfe1dWNiQPFaebUIxaHS9VspsyS
         qO/ROWRC/OM2F1MNS3UOZ6dGTX1oGzAqXDx6B4YlQ8/bDddHLUXdbZ6MRGwCIypgwmXT
         JogQ==
X-Forwarded-Encrypted: i=1; AL+hErEwFIdT5iLtUlw7KC6N5E6PytuId3G+crssM6e7PJXL1Uk/V/Lnz6dn8kGgqfWqlH/t/9HBLpATHObEAhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6kxrPs0NMoY+3nQTDuaEm3KbqLTroZxjQnFPrHUzz7KKqlIDi
	oDFNHDGUn+S/6Tasmqj2A1Evdz/ymj/flnnHKNWuN/wLPQ1cmaU6UJlD0o4sfCusSs79WggSGb/
	YuxvU3sa3HNU5pdYB9+wmKkyzehYvf+E=
X-Gm-Gg: AYBFou3dcF+ahJm/Dm+Za16ghWW5lNhWzTiLvXYRyL3XEZ+s3XtSQyKz8hmYn+ikbOD
	A8p7gsdSvcI2+6QxuEzyXeFfZOUdlC4C1unEBBPBZ2bUr4Vuw9GfRn4cmiYsxoztFlfY+RvzgfK
	Hkg7vU9EPCA48TwMpyv/q/4HnF1JhhjBHHkTflIE3nJv1YsJd5Rs/PIdcDruqWZnyyBgDywW/CQ
	XnH6wmUJ9hNDcgfAQNza3xq/s/apbNX6RitSZVTVCAYn+OD49osajncMFcjeJNZiUv7pJp3DMoX
	nJAOyackDhsoHuK6YF43F5swzBMPnZcKq36uhtD9bbMNC2dLvwn7tUhc0+SPOLkTF6w7A/3VVmw
	aevjZI1J4WKNskq7UvOCnISmSy/aLpXPfL5icm+rjvv2waE5xOcxoWcqBOEApf2LmBoqu3xtlxL
	1a6RXpquo3FQywrLov4igIJQ1CUbFd/HU15blvadawRn3HS8Vi
X-Received: by 2002:a17:902:f690:b0:2ed:acb:aa95 with SMTP id
 d9443c01a7336-2edd7b397cfmr13754315ad.32.1794368945939; Tue, 10 Nov 2026
 19:49:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002043856.97295-1-phucduc.bui@gmail.com> <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
In-Reply-To: <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 10:48:54 +0700
X-Gm-Features: AclHuK-_fA7OAuqiopVuFE8fqK_zpoIlrFShcyl-AqkfmWeSwLjfc9AT1zIS0jU
Message-ID: <CAABR9nE8Xo7z0Yg4AKPmqV9+Fjs3bnH+8pYykpFWOcq+3SG92A@mail.gmail.com>
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
To: Mark Brown <broonie@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

>
> This doesn't apply against current code, please check and resend.

I believe this series has already been applied to the for-7.4 branch.
I've also taken another look at the driver and plan to submit a few
more patches for it.

Best regards,
Phuc
