Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837618;
	b=KqUBjYGFFABX/G/dBG6UDJELr1Qs+XyeUKJ5iuT/cdkuZXfBbPiJXB5rKyyYdbKXvgZ8
	 koUqIV0vNhWb2wIbxPpZILu2WV1vA1sA6S0cVIxAXeyq8R3Sko0yYGoUGcRfltcV9EGJ3
	 Npelfn1k5ZGwF+UzQ5JYXZOtBuRgJ8fvsra8uuu+zL1xA+1oRa+uP19GZu0wNrUoeemDS
	 /enQ4HxhscibnGMImpEtjR6Zb+V24o8GyNXpmMe0U4I4hV69aIFrRDsXriPKEST7whCXL
	 sANT38J5iH3e+D+HG7KEa2XV7xaIE/lmMHiHAl5FF0MLh8z2Eh+8uHVkQ6HHL0gN5Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837618;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=;
	b=wCAd94d4Wvnu/JQ0ndlL8jO1/paKUXE8NMggQtjtPNcERzLGJ8oniqbLlU5gxCmYSG3X
	 GaQ+r18U5h/iMD7JDRtyLtAFBZYexdFLeJIULRaooh+oxA/m+Jln8Be/Is6WF4ckXeTvI
	 LDpRDXrSYnKQFcSNf4pwYZLbtantZp5QPtIUzc88CIQuJJ8CQGsbnajLR+g2wMpTNrW5+
	 zhbMCxZTTgEWGYkcaa5LGcTUGuftk5X2cOQvf4u6+X5Rx7h9KMJwjh/LZmQc5XRXqi/lb
	 9fduSNcUc9cJAWR5vkyCIAJIFlk8LKv8F59PYpfSqbod4oHvehLuzL5vRa6ZSTexwNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=willbush.dev;
	spf=pass smtp.mailfrom=willbush.dev;
	dkim=pass header.d=willbush.dev header.i=@willbush.dev header.a=rsa-sha256 header.s=fm1 header.b=b5pkVAGW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nglupo5P;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F0606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=willbush.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willbush.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=willbush.dev header.i=@willbush.dev header.a=rsa-sha256 header.s=fm1 header.b=b5pkVAGW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nglupo5P
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 7D5B01D00132
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:26:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Sat, 24 Oct 2026 06:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willbush.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792837616;
	 x=1792924016; bh=F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=; b=
	b5pkVAGWlFJ7xh3wOa/ewnYXAQAlRZ7i3KtoFg5qzXT2/HIIxJFJ+c0WT3X/W2bB
	Y1Vp9ApinjAXMdQ5q7/o0PORiQ7NPTShDi1pZx1sKLd/CZd8aqQsCpomYL0lzBsz
	PmM8bSyaa/TRdPAZNRKrXn3c2DNOtlRDCD8bW32chmO55W6tbQc9ui1Af3Mvxxde
	L7HgJ2umkbA5NkwwQINYzuTmnM4cMcKNBIBH2m6A2aY5YCWQ5SC5vv0Z4XZ41pdJ
	6u7SX4I1FX45+7zdHkeL7rokpqSY34nQDy8qDhgXktz8Vm7py0PBmz0mZJeCGCnU
	hOaOuWhdHr27MtvKscRyFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792837616; x=
	1792924016; bh=F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=; b=n
	glupo5P+bo33CKeY1AMr/42EjmaZ/N3388qyahmNvE1zu0mGjq14XdWoy7DwGugU
	hj9PrzkzbAkaTa2dZOMEP7ECdulEf/TdO7rzcoHX/EWzC3BOlmdMoCMYmWTZW2Qq
	bx1yQTcocnD28meHspPawzNbUpeqr7T574fcaB4e/5uJwhWZ6mRPVADpHAPcSHQQ
	pRNOrWaLh6TTHl9f/ouMR3h06ic5Q80VydHmCUdBWop0AJg4iO46QXB3gLcAXvj9
	7mNR/RGCfUCDFNyVwTpq2p+HVrFRKERtQt1aabcfaa+PVzzjZRntTkZbTcc3WIET
	JdVIcDbkGKQQyONnxEHmQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=willbush.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792837616; d=willbush.dev;
	mf=PHdpbGxAd2lsbGJ1c2guZGV2Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:kYJ8JI+bfaYXB09ZoOUb536dx9BXCczEK0v8qq/Z51Mz9MB
	3ax7rAwzjjyzU/NHbGUBzW2l6hoLgLzdbQR9Wl+N06ZHrHJOI+iSRmi8UZeyQbvr
	yntmozURSvOlvtPVMSIqI7tuJYdMax8r+p//1zV4OViKewy5UEW3LHRXfs/+EFO2
	Dr5D+V6MQA7uvEBHqw7PnQmPPe1vJBzIX1ZhAWMFjiX2W+P7gXE5ZYYAyDMflyRo
	nnn2kWA7INJCSKVYraAWj8PEmW00x9FOVP0cmq4HaTYLF4UTSpYYA/LLMjU5qhgq
	8taPMO8C7Pdo2iSxymtXfKy9G04h/JqzVvuOF9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GFvj5PUssEElx8MeEIj2yuT1jZs9cUZ52cQsqxlYcdc=:F4GF/YHFpQCaR6gBCt0pMceA0m8Tmzj0vyf3rVcVrvU=;
X-ME-Sender: <xms:8IfcatJNoymSmjqc1E4U9G0x3DBzJRd_1OR5DkMJBfJFN3AP7EYC_Q>
    <xme:8Ifcaj-imScx-4lrjEmt_WvXxrVfE2ni3AUDGARWGJaKeGlr2bCwlMZ_SZHv71w8h
    xbsW5qxE3jjI6VVW2gnGOgVLeNOWm04P60mkzTnfsjl9Hsc6P_tK3E>
X-ME-Proxy-Cause: dmFkZTEMyYLQu2mHG1fCWK9eqXPlE4pPq3ymMC0teF//+ku6VD6HBSjnVZI9IW+TMNv5aO
    wly7ZHwPPncPFggUlxGxdXRP6AMAiAvYCN/t0I9x637eT362fSsm5wM1FrsKSF26u4krK3
    7J8vAppAE3msrpsoBC2bbMkNQ7p1xG8IZVLOqZvC1RYU04tjtvZdUXg3guhBTEU5KizTqn
    Ml9bfEn4rL3c3NXUKdYfiowvDMUX0SdLDLJ5tNx2/+w28m1fk7NC2BcE4jm+g92kRp4fEf
    TS0cGhtvfs1FzPzRgZFSJj5RrwnGgUCwg/C+vTvpDTlIzhAiJksIxb5K8fYSwehErQl6L9
    uHRBesGSx1ssXWB72WVwXfbfxt/+z+TBg8138k5XpJO6RqcTMw4UFczdB07WhApfb+tQG1
    RYrQSw5jmBFdS40ztEz7dEHwzZfCzdJg7S4kYMKXVjfusHoE7Xw1/31db9o0b546a8nu2p
    3kIUrS8kK4yzNYGOmu0X1kush6OGN0pm/ZqUDOaN+4JG39aZOUSZFosmtBLB/6QGCP6xv6
    Fz79xzU0QPR+B6EIGRgpt00rwA7+booviFoAj03LtzvKMAkSzd5rTkqpu+5BwBwAVxCqrv
    uhiNxZJll+i7k5G/U1cBz7AEj+mOKo+j0Iz4b5Bg7EuxLC+SQ6ibuoxW+PrQ
X-ME-Proxy: <xmx:8Ifcaqs9FWJEH4We7IHm1AA8vnp5qyx-IfWhcKH2EjSSVty4BPGAqA>
    <xmx:8IfcavlkqAZ7rIv8tEN0LVNoRVPAzp6as-AG8arnp_l7gP-4-SugdQ>
    <xmx:8Ifcatu9yZEhNfDWSOTePeDsRBPz-0X-ywyLW9csRRSHe_OmWID_5w>
    <xmx:8IfcatdYi6Zb8e-Of1FZ9WCYgW_FO2rr4IusriEiIlmRuz5Zhy7Lbw>
    <xmx:8IfcapK86z0yCQl4O3YkGeComZjPp2AfvCVoKUejvNv04ayzh8DrwpIZ>
Feedback-ID: i0f194965:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 03AF7700069; Sat, 24 Oct 2026 06:26:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AyAsXzFXx5f3
Date: Sat, 24 Oct 2026 05:26:34 -0500
From: "Will Bush" <will@willbush.dev>
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <c87b68d6-8e4d-4d4b-b5a9-5918af9f2217@app.fastmail.com>
In-Reply-To: <20261019102347.2425406-1-tiwai@suse.de>
References: <20261019102347.2425406-1-tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Avoid applying boot quirk for Behringer UMC204HD
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 5:23 AM, Takashi Iwai wrote:
> As a quick workaround, skip the quirk for those UMC204HD models.

I tested your patch on 7.2.10 with my UMC204HD (1397:0508) and it works. Thanks!

Tested-by: Will Bush <will@willbush.dev>

Best,
Will
