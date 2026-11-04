Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787570;
	b=W+gmSI3U2dRvqjGiqGXgjH8tNRyC1ed33Jq7LJL7Gw4PyQfznP98pCCLSq3swDNVoQpv
	 XwY8yIfRD5Dhf/zW6yjJJxbIsDxq0TLtpe/Mm6UygkV8HofgpOno6YG6PQM4hA4NB9KL2
	 6vvQmBT1gsyVanEueaomzeK0mrVodW57/tNsTNU6/EGnBvD8D4sCI4AkY3bzJEYIFUwFW
	 W/fr6ipnnDUzVA7KGkqlUa6lSmiF5oNRn8GcxloC+KPuDbBbWO8/KzApxg/J484yn4RyZ
	 Coya9KNaRK+S/tXWBMb8iB/JO7Mvsh+eE2Vm6u95mmJdnzHu12JQkqEHd1vC2q1v7+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787570;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xhG1kWg9FHuiWew+KueUeuR06Nlit/JCOLdWRAh8Vu0=;
	b=klgjbFaguuLi+aWWHD8nlCW89cmfD5vIL4NXXLh485cmQABGBYKjWo9BDueijSqzJAdc
	 bvKAwYoJBij8/RqI65MIP0MxViotTIUaesGFWz79JptJsqDAPkeSOmu0GuJqwGQn6AOy3
	 /yekcR4DGh+qsJw+XQ0QwoqiOjX0El1TQslVoY3Lc45k8OHsh3BhPtHHJWHKwbLy2jvu6
	 joPd5ogA8R6q2mNI9baCFAFMJt8koi5X0iRxRxzGhRBbyS4cjjJMYGi9scckg4d0gxFwY
	 XYWlnw+Mhq4+Hcs+tUieYWQhTQR/Q6U4me/4nPPizsyyo1/+YqrnGKTvEjO4CiofD/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=KmUf3TwT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YpSZPlhU;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B15606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B15606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=KmUf3TwT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YpSZPlhU
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 39DB7EC0253
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:19:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 05:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793787569;
	 x=1793873969; bh=xhG1kWg9FHuiWew+KueUeuR06Nlit/JCOLdWRAh8Vu0=; b=
	KmUf3TwTU145VAutAsAGFFKsw4dsRPnjyCCKezJamzZyyneN6NEVTRdz/xKCuHgB
	O9mLcGaRrdRdWi5gMcZqZUpO4hGSxgBSoqOMnkEqdTe5JkJD3ZSBMuf/A69DJcuh
	EJknqxNBwcp8DFCaoKRF1y1iSsExE7AakCKpUecehdy7A8aybxwUccveSgapubQG
	WNb/ueDxbUbyi1OAVhT03q7MEwYEw6M4f43F6hxx1yFgdOKsb9ido2kAk36MoS38
	Y5RLCA/CeW3SroFG2xmGszJOEMF4TGO7STgCS4t6E3JsdAGN2FlUG4278rbYITUo
	oBaIz0n+sp2sBx4z6xoBNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793787569; x=
	1793873969; bh=xhG1kWg9FHuiWew+KueUeuR06Nlit/JCOLdWRAh8Vu0=; b=Y
	pSZPlhUbs87j+GAJgSNzf3v0WwriJzVT1AFM8riWNWS0dfY/MTmZO+8a3s1zOFrO
	5Fr+eeYI0GFTeiZvjpY2oSeaQeErPOO03VSKSrQ3weKTzKu5EN03aH9PQzYycAaD
	LhvrIoYjkC2q1+3i8c5k+phyveZfpi2mDa1GI9/IAipKj9xTBvb+I3wRVDV4ScJ5
	r95VYs1SYRlU65gX5NCbCG7nWB9vccKoiNwzcEYP1fxMxa6uVmtHSfsJ3H6X8TYD
	vt4/HkWylb+elHwyozJkqn+avLMHKpUyTd6JWrEUkx+hfNy7IBZOX/+6xv659cSq
	i2l9sAg+UwGWjkleVFK6A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793787569; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:eNolkjZlHw+vJ6/t/deDYzT3FpcTqYlZao4RB2KMp+zIRyQ
	W5HSQHOFpQTz/0az5+heHjFphJla2hltRzyqmgimNVlmMhDpEi5Zb1jY2a0ZZIru
	dB3zEbM2LcEXpBBJYxPEkh5VQp9NnvLruAyg0PcSYxRBTs2DTaJiQ9gUiHM9XC6A
	HYsQxJBTminnF/0PZ1WXJjMjMNJyFD7MVdQdKWOkheB+vMFefjTl6WQaPRM722d/
	rKfl8gDM5IrtRU1e0i/h5D5v/V1GKIKglMXk8o7o6z0QWqaIyt1gGrJypQNyDAL1
	g8WI/3dr7aAYcl/8kyaVk7TZb3gz/OfjkZeRwBA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LbRTBXbfilP10S+efDESyPr/5ll5nQrh2EYPjkkyBBY=:hpj8Ab5Pcg/91wuX5zWer7gpJSrv9ZtvGWDD4YeDtfk=;
X-ME-Sender: <xms:sAbraoFWx_DknU7_FChzoUQrNNDPDXkCgzXjynDdtKh67nS6qiFlwQ>
    <xme:sAbraqoqcR2Tnwxee94NrmaCPhIC3yn0ejXpD8TogcrgHM8ns1HBZ4ld9JJCUEWpR
    VluPOyIFWy6-PZawQhLmZaUayZoElb0_2ckp7waNGjBpoS39NJDHQ>
X-ME-Received: <xmr:sAbrapa1sVwSFPScE67aMDxPMiDvXEDR4jSEgVvhQUu-YoZK84u94imrxWwsDQkPz18sqZxbhy2abAzxZwj3TFVhzlkvhg4>
X-ME-Proxy-Cause: dmFkZTFd4Vrpjb6vo7D4/IUyjIi6AQ8ZKH6jR8IUydUpaF7oGZ2hRyYcnY1EPpvSVhoS+c
    Xw5yPXnDirq8kU7rhakUDLtPpO7qZryGfreitZHeLzxGlnPBep/VfEkOVV6G7FAA2C26jt
    vF03gyZu/s3hX18HUni2unBry6zLiJ4J5Vx5MeD9CidaSIKjRmvORfYJ7XMfbZksbPdRgo
    GqSaMMcS2LAgOyEl08dYqtguI/Q5B2dseeZ3WkFj84j3TrLLxfwr4IvfD63epMqL9Bk27g
    kJQykXZ4Gv90N7KQL5VVB8sh46xytwMm9Fx0WiNBVxMubio/1OR/8ZKlvzVOTgQ3A8JGDq
    zQUCdoWx1ev3fG+llFU45zaHUgD0mdeehxndjceIjJF0ijX+r7j4DV2Cti4CSwrnvf3DeO
    /dZim0Ui7DYiAkFm6OhueXd2ZpP3+ZWafqpOYEg9gv6iMisusxu9Yz35DS3FD1Ngosq+a2
    PgpttjLq3gNqX7Oh52aDXqa2ZmawN8djcBlpntrPJWkdiPBmt5dw3I3+c2zrpICLGnIPzD
    EHxDeR9tewKzeI9qfbyuIAcfRAUZe4CNCkQ7OiP1pdS5Tw8MbHMNgEzqxeEXE4FSCk/Wam
    Sx8216S5itL1ZEg9hBQgE8aMcTKgNSSCAKt8yZ6bPNvxy9YbeEIulYSsCg3g
X-ME-Proxy: <xmx:sAbrarUzRyru2rMsFs22TtkaMvZrxh065tFnQwxtK24axdsYKFLMeA>
    <xmx:sAbraq8YqqdCf_--fhOqbi4w2tdjxMjq9D20IrADalUMrt3jsa6wgA>
    <xmx:sAbras_Au7c0yKR6Esc1nI6xbhFYFGtyasrqVWDDaUPybB4ETjD1Dw>
    <xmx:sAbraiTuQha7rFHiEYQRsdWxslDJcKlEj9yoYSQ6qReN5AHLrzC2jw>
    <xmx:sQbrarXyuKCawD_yCQ9KY4GcfBqGbiMYMXPG_Vo8hYpD0ogzZaj3eQhL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 05:19:28 -0500 (EST)
Date: Wed, 4 Nov 2026 11:19:26 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rppx1: Update shadowed registers
Message-ID: <20261104101926.GI1959885@ragnatech.se>
References: <20261027174014.315061-1-barnabas.pocze+renesas@ideasonboard.com>
 <20261027174014.315061-2-barnabas.pocze+renesas@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027174014.315061-2-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your work.

On 2026-10-27 18:40:14 +0100, Barnabás Pőcze wrote:
> Certain registers are shadowed and changes to those must be explicly
> applied. Updating the shadowed registers after a frame is complete can
> be done by writing `RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD` to the
> `RPPX1_RPP_HDR_UPD_REG` register.
> 
> This is already done in `rppx1_start()`, but this auto-update feature
> is documented as "self reset at picture end". Therefore setting it
> at start will only auto-update the registers once, after the first
> frame.
> 
> For example, this causes that the LSC module cannot be toggled after
> the first frame. This behaviour can be tested by reading the first
> bit of `LSC_STATUS_REG`, which will show the same value after the
> first frame regardless of what was last written to `LSC_CTRL_REG`.
> 
> Fix this by unconditionall triggering an auto-update when a parameter
> buffer is processed in `rppx1_params()`.
> 
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

Looks good.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/dreamchip/rppx1/rpp_params.c | 3 +++
>  drivers/media/platform/dreamchip/rppx1/rppx1.c      | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a75a27a8afd09..cbc9847ba5be6 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -110,6 +110,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		}
>  	}
>  
> +	/* Trigger update of shadowed registers after frame is done. */
> +	write(priv, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(rppx1_params);
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> index c03dd061783a5..a3c923a57d922 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> @@ -257,9 +257,6 @@ int rppx1_start(struct rppx1 *rpp,
>  	/* Immediate commit update for shadows. */
>  	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
>  
> -	/* Then for operation update shadows with picture synchronization. */
> -	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
> -
>  	/* Clear any pending interrupts. */
>  	rppx1_interrupt(rpp, NULL);
>  
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
