Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769613;
	b=EZ3aJV2u8oxGf+iG0pKq3ckuxW0imH4966PcwodA5XeLQJ7yWJickl/Pr5cWDAQScrpU
	 397OKg4VlsC1w+cmlVFXv3vl17HOzBlQqB9YSfkE+2LURI/x0imOZ1du37Hhn/zYWiHLc
	 puQAgWOcpNrXbRxh9oBmiAB1nLj+GxH6ngii78ffm4dQFKcoLqsoCrENF5aTz2z2DMjVu
	 cvH66LiF2zOzaA2agNpI6bxdA70/1/1BgqqhbdYkjJpdZ+6cLHO3R7WhKy1FA7OD+3BFq
	 ReFcchDNn0zTPR1X+l8yycFugHJoDxBfE74ni77mbYLu8QLhANIpc8aRzzmF7utGu/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769613;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=OqxcrjBBblZlaETYTt6qAbmCiXsYwes8t7KDq2EEAmg=;
	b=POntbXYAPmfWy1/YHscfnDreAzxTcIMZ0Yx8yzMOZBMx3m8K6vICxRvx+BIkaJn5ocSo
	 1Fu5LtO8kPvZf1Aq9YFyG7eTwiUhELS5nXPuMqKFJVqE7qto7cx006M/lsl5sFqm0eTkL
	 KQCv0m2CRFJkbQXjDVkfeTR+N4N305yM2zAlePtNPXaI/LAgXaUYZ5xENXmax7VVbT2TK
	 sCMQUEe/ibwozuJsq5+96g1mDGL16/RE4hbEIcCW3li71rAMv+2gxCgLEGvrnh9+rfoIW
	 FTCndwA223QCKQRrQPDqZo35jwbVMMy2Fkjf95gRER3Jkq6Ol0yWjUumdUeZjTeWz9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=bKOlhrbU;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27176606A31E;
	Sun, 15 Nov 2026 19:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27176606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=bKOlhrbU
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50BBDA1609;
	Sun, 15 Nov 2026 20:06:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794769610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OqxcrjBBblZlaETYTt6qAbmCiXsYwes8t7KDq2EEAmg=;
	b=bKOlhrbUd+tfubCdpavGzSGW0RjK2DCmEtNM93Y0W6J5se+w5pgQUyU9ZSifhW8/EkQLad
	bprfuuAizAk5NuQKqTv3PUAaOPhIs7+d4TQHFfjKa7sxmxFViTqOSSubfH9sqCQV1Ofzva
	YiNwsQupjyf/kS40sg7xexpaSbkWHC25ffvYgN/oEJWBroyHEjau+aEAuF4hIkBXHqC8D9
	t4INilUJWo8jlzKXcmyLMzzev3XdXjWkp7wAmyGBehHNOb2AUleopzvwvmCugpwKXdEQof
	S36kPKhKCAlrqHX2KRaps18eVJbbVyxWE2L2b1d7Av/pXUABHO55SByw4+qiNQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 20:06:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paolo Valerio <pvalerio@redhat.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH net-next 0/2] net: macb: add some missing caps
In-Reply-To: <20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com>
References: <20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com>
Message-ID: <5b1935c96a1229ca311fc13e79943712@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 13.11.2026 16:59, Théo Lebrun wrote:
> Out of all the compatibles modified, I only could test on Mobileye
> EyeQ5. The rest is information pulled from public datasheets.
> 
>  - QUEUE_DISABLE is important for suspend WoL (avoiding tieoff
>    descriptors) and will allow ethtool -L support for those platforms.
> 
>    The QUEUE_DISABLE patch was sent once as part of the set_channels
>    series [0]. Comments from Nicolai were addressed. Split to keep the
>    series small.
> 
>  - QBV is important, well, if you need QBV features.
> 
> Thanks,
> Have a nice day,
> Théo
> 
> [0]: 
> https://lore.kernel.org/netdev/20261016-macb-set-channels-v5-1-90ce0c0b8e75@bootlin.com/
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
> Théo Lebrun (2):
>       net: macb: add QUEUE_DISABLE capability to 3 compatibles
>       net: macb: add QBV capability to 4 compatibles
> 
>  drivers/net/ethernet/cadence/macb_main.c | 34 
> ++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> ---
> base-commit: 573af801552999954caa8347e4490b04cf4763f0
> change-id: 20261113-macb-caps-be72fa7ce119
> 
> Best regards,
> --
> Théo Lebrun <theo.lebrun@bootlin.com>

For the series:

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
