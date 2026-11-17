Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934553;
	b=I/jYjJhQqpvNX7iuSFnSHlGC9012Pc2XNNVViRW6H0vMTSa59EpQ35l12tD1CjhttOV3
	 LiW0iu2B58f6wcMJD3NnEkE9a5dRCJBBE6/MZBlYo7U6Sl41SsJu4IiMdiNE32cXQvkaJ
	 aPe6gQPmH4fNNiI8jqZ/KS4KwIFJ1o6NzyILueE8l2JZ95el9wk/4+dHoVumOSoROLeKG
	 Cyo3AqoCVZmhtTgWmKsv//zEZ0Nc5ZR5UBgQF9INjy5R2GZu+qPcEnDzuDfCAdsBkduAo
	 l5LRXZs8KgJHiKNZXphff02tjUPXj77yr6qDN+EywCPHrYkWW62kxjJ5zuSOXEB3DMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934553;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=rdVP8970YC8GrPU7E70d6kuddX0/TeiUXS73Mp4QXYE=;
	b=eNqyuCu75TZNfHxaHP3gz+UJgcfAbHcepZR1aRwrhduzk8HONtZutisDgUQsq/htgEVh
	 7V1l9X8guWq3W0FOQA/1w4I4RxZklfG1FXr/NrbD4y8KV72S7c4VZK+FO2SoYPNJ9Genf
	 m0g4lEB/ZP1FQBojvOrljUmC8a/dHkWkt+31Szt/nZSRoGP346MXUYCur7gEkRoPrNM2i
	 sWyzwhrIuNlKtk9s7So6zADH0KDMaWvYvtuMQUULlwQ0+nn1va2Qk1oiZGMZ3ECAzDtm4
	 N/wNxNSVyZCS6BXiXEtZdedH86O+XSullnbRZX43G2iFLN6+2AZpI2dbZuXX8dN/zCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hFZpR8U5;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D66606A31C;
	Tue, 17 Nov 2026 16:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hFZpR8U5
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 26E711A167C;
	Tue, 17 Nov 2026 16:55:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD2005FDAD;
	Tue, 17 Nov 2026 16:55:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57B9611BC0039;
	Tue, 17 Nov 2026 17:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794934544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rdVP8970YC8GrPU7E70d6kuddX0/TeiUXS73Mp4QXYE=;
	b=hFZpR8U5WBz2fvhgHtJ2bmkXXlurn8Nla80rAyBtouwTNPXOU5wPF0wRFp6bGEYWszl3WI
	JQbCD5jDktDOG7RtVsgMSA60TUe6i6qUAKnx+zJMwXXHVOk7UACGAT2lbpiYiEcA0AR8/+
	UC8+co7BNuh/+Xcdt/rcaGKAqzooXBcc+AujYeK1KV8vIy5HWYD2iAKf1e/Llm0S/6K7zy
	DhhRnXedvLLxqjXF3ajX4zJ98glkEMso9dqOzEstJPe+Y2UOljBCEXWSgEBOvqxmuVU1iz
	OdwfBy5932FU+2XmRxXzNcTlW9DGqtbMw1LdHFmhs/amAM+YsWeXyzCaq06uRw==
Message-ID: <3c907364-7adc-4fb9-a990-674563e1228e@bootlin.com>
Date: Tue, 17 Nov 2026 17:55:30 +0100
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
Subject: Re: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
To: zhu xin <zxyan0222@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261116114923.1157920-1-zxyan0222@gmail.com>
 <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
 <CAP7veT+3eNY82uka0-x5MzburF_x7tyvvSdGnhQP9_EYs-Os2w@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CAP7veT+3eNY82uka0-x5MzburF_x7tyvvSdGnhQP9_EYs-Os2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/17/26 14:19, zhu xin wrote:
> Hi Maxime,

> Right, ntmrmd was indeed added for upcoming glue drivers and has no
> in-tree user yet. I'll drop the field and just program a hardcoded default
> for now.
> 
> What default would you prefer? The databook doesn't suggest a particular
> value for NTMRMD. 1s (NTMRMD = 0x6) is my choice because FSM
> transactions complete in microseconds, so 1s is comfortably above that
> to avoid false timeouts, and it sits in the middle of the supported
> range. I'm happy to use whatever you deem appropriate.

1s seems reasonable to me :) let's go with that,

Thanks,

Maxime

