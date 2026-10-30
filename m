Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354483;
	b=cXvR0MA8rc2KdB9CEBMV9nCYL75A1bHM6p1nFk4Ul9VbmLUZ7bg5f/edTvcBTEfndax+
	 9yrSdqZLXgtKGBJpE6yjazZyxeQkCNaVtCHnPcWQ0OM6PWrAOKOSlx+Afhs5gPEYSt1hK
	 EUQFHiJ6kHiicgk/g03LwNSOd+Nm1VRpcyJO6xcuicRwVALaDxyOqaz0zoOceaO15UREr
	 kbscrWfaswsgyGVGL8Y+YJLVxbWoKqNY0bEQQp3coLYP1ZIkm3SZNbrHsfLH2VHqIA3bV
	 bpdCQrxmgJOZpkmpxPtg6UuTwwg9MBUTYfMT/f8y7YQeRI+9C5ec7IU2WyujlG6jNXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354483;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=GL+scJfnHWYGcb5ZDCDZq1DsFM4XmLZLO7gXJFvI4SE=;
	b=XFVrpEqxSLkYQaQ2o3jgnAaLVkTvbYsap7fKVaOP6FeINbIt7Q7fky+/4Md6WwmBs+rU
	 pga61VHNRRBTuZ/dTjpKsQ5m5V0bcSEmGqrAzpel5iY2x/auNN8qmTUj7pazK3iQw5wjh
	 T33XYgPoIZSymCre7woFWu5B4edLcwJtf7pI4h7tn8SYGj+/eT4HKDwVqnhJVjcG8jZeu
	 fTLCy8Xlcj7ehMLT672KqGe3L3Ly3nu9MqjpwfPGqfw2e6wMNBGifQaA4TpLLiTEwwa5q
	 DO5mFaAuuG/vCIAyZVSUhIaH0HP558zPXrn//dPVrO1RXf/Olp346CWQ4dd3xiIZFJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UL6qCozx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FDE606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FDE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UL6qCozx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8EB3DC49F5E;
	Fri, 30 Oct 2026 10:02:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4E19603C2;
	Fri, 30 Oct 2026 10:01:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BBD910328D09;
	Fri, 30 Oct 2026 11:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793354476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GL+scJfnHWYGcb5ZDCDZq1DsFM4XmLZLO7gXJFvI4SE=;
	b=UL6qCozxlBY7caFOEQgPh5XeTPxe0uKsEO4bkWj9MyqY+iB6UMEjvRtH21o5vvUXcVKUI/
	CcysYI7iXZOapAOxnIb6BQjZdAGx1qYjrMvBt0YRs7+E6O4aDVwGHjCk7OhzXkeZhDVO23
	TQHECJhi0LcZgT1o+KpDTc7YN8L1J5L2EKzanWVej8oZEGJ6Vzsn4R5joPQ/BlfzljTve8
	PmVSOem/IiDXooQmrkdr7+6vYj1l1oO978SJdcSMrim3K4XcjL2JGzD7Q4YBKbsHs433CU
	FcHLSyrQvT1ygOs2bTiBRo350ax7+Z/O+9J+3YqY0rAvCHSzf0Ekv2GDiK8KUA==
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
Subject: Re: [PATCH 2/2] mfd: cgbc: Allow compile testing
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:00:48 +0100
Message-Id: <179335444849.822489.8403085231738038338.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> cgbc-core.c driver does not use any X86-specific headers, so looks like
> it can be build tested everywhere for increased build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 87ed55c155f0..de957f574056 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
>  config MFD_CGBC
>  	tristate "Congatec Board Controller"
>  	select MFD_CORE
> -	depends on X86
> +	depends on X86 || COMPILE_TEST
>  	help
>  	  This is the core driver of the Board Controller found on some Congatec
>  	  SMARC modules. The Board Controller provides functions like watchdog,

Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

-- 
Best Regards,
Thomas Richard

