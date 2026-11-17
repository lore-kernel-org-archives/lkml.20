Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928814;
	b=wVz4zHq92IJjcaYUIZMNAoEUkuhRFe182kwliKOINk2fBOy92MuNY3iof/lm2TNl/+70
	 dVbr1Q2+GTkvyTb62wZ200QA9EGJ+f1WW5SG8tKS3Pev90VJ38bma6GE08iTY1+PE8Lnk
	 6FIcFuyWASKMwGm9SgVzCwWUaedp9Vk1Uc/C6lbwlmeXmfL7qHHT3mvl+gahFmw4GKXHk
	 fJ2ts0aS0hQRzBIOKj8OJR1wOjFJz5mQjDlXZ5us4DFLSNfwEjrcTPoYn4QWZRFNmhJKe
	 9yrgBgy5jftGApr07dcRoshWbWrIuK+rPaRQdF3M9pJ15qcPDWpZyn4TfnE0Ko7Qmuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928814;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=f8D4AXpdECEMbVGfexe2cz/ScJYTT4Gg2O95M/ifd9s=;
	b=Cmt/3BtrtfD3R1nQ905z/VliQGF4PTSoQlxo9qJPAIErNVrS8ShjunkUzBUrsPOD12xA
	 B7M3aKunpayMFmfEEZilLFUYLLSvPXdpdaxL1HdjOuo0x8bLNKLP9CuInIoYGI64z6z+z
	 gSvRUz9Y+tI5ayvGN8nS5emfgBauIxQsobPu/nmprSGRXck1A8VuMP1dLtwvOy3bfZEnE
	 Gr2+izU+I5inczrJ/7zqTbO/SLyzVuA5Z3IOHb8zaLrzVl+rfjnC0vcTDvyvFzuAyBpMA
	 2z69rGV0Nqy5coW3HPA8eftIdVN3RWbQ6fG792YPgMw5+XTe8Ec/a8IU7qAd4mzosFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=spPImfx6;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19799606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19799606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=spPImfx6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 68B454E4157D;
	Tue, 17 Nov 2026 15:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 326355FD6A;
	Tue, 17 Nov 2026 15:20:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5396711BC0041;
	Tue, 17 Nov 2026 16:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794928806; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f8D4AXpdECEMbVGfexe2cz/ScJYTT4Gg2O95M/ifd9s=;
	b=spPImfx6F3CzhN16ICPmW7T06RqvUifyDFcrx8atsJuVdxPSElDxgZB3E+SewfgfHYbQk7
	V4MlwVfWoKNAWrdv5W73fwoMA5MKtYJL6gTuWVWG5jpjyMFOs6PTpxcM3z1Ak1FEeJgqSV
	pDsvdF2j+XIkT3XSP5tIkPd/Grrg8Ck2a58GoDWddT0px3jEXbYA9SHV1AcW1meNc2od9k
	lSpWdBItmquE4Ebno/2zFDY9affW+xNwnrDKoEVv6JXEFnixQ+Tw96/Q6PGmfrhO6/VDuL
	kTmlc3oYWYiDDxby2VdZYL37wbzOyJPI6nLRUjWOyPwVyoUZW+CvSDlUe9uyzQ==
Message-ID: <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
Date: Tue, 17 Nov 2026 16:20:00 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/16/26 01:58, James Hilliard wrote:
> stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> hardware checksum engine. The MAC therefore keeps dropping packets with
> invalid IP or transport checksums before they reach the host, even after
> ethtool reports RX checksumming as disabled.
> 
> Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
> offload leaves checksum validation to the network stack. Preserve the
> callback's existing success return value.
> 
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Nice and simple, I tested that on an orangepi zero, with an allwinner
H2+, and I can indeed see the difference as bad chksum packets are
dropped on that core.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

