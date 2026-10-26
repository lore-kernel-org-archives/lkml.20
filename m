Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024203;
	b=s5OJt0h87Zl7yjzZP61ivgis/jCOP8LeCSkYheR6FCrajlqCni/DzV90HICv3WUFXsW5
	 wfzwOFLFDNaM56EtNoq3QPjCILZBHR4mnxtfYgh5a2WO0U/fjZ/vVt+qTpYIOGe/3IfuT
	 jnhBlriAVZUbsiM/T+aUs5X4ywiSClvEsPIjQX+ysSWs7gnXkyjuxbGQCD8tE/m84g4Yk
	 OzAyqq8q9mnIms4F/6BPcJIej68RlfAwZMRJmHSVVrSDAyDhYXvuUBQeZn8p8UvqgBYUC
	 jPd5FSZ5MbbN2ctG74ZFrEor6AXvqHBjHLV4586hwy+Zq2wvT15qGZhbYADfYB22Cgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024203;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=lN7LmDxK/3IJS+spc2D933xtZU2kguufCVVuiL1xDzc=;
	b=cV2BxPtbnmDWAKm02YKEcPCoCmp/dlGdlT3yQ/bmFkBQloK1gVWvJ4fQAx++Mr4ZFNXH
	 QMxX5JKb6+c5NjWTr5TgJycLN75WOmQ4Ko4mMjxf9HTWNY7yxTDjpvaRBBaAgCnjyy8El
	 785/JqOjwdOVkkb4nWwfFyFpIV22YoRP7aoPDSTXJSAxcGzz3ZkZkuUJhIgR0uyse1eMQ
	 84K3hUhjSrQF6sOg1boWe9xvbtJzIl40j/V6M5kyitudoF1bzA2m51n2bFP8Z2E30h/Dh
	 xE1L8caYiF/rnW1bG6V0KS5Nbtu6WNgd3i8VImQUK7Lvs1ri5ka9O11/EmRuUzrxVBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=b1iVQ1DZ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Y1XSoMIH;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA8C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=b1iVQ1DZ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Y1XSoMIH
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id C9E291D0037F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:16:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 26 Oct 2026 10:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793024201;
	 x=1793110601; bh=lN7LmDxK/3IJS+spc2D933xtZU2kguufCVVuiL1xDzc=; b=
	b1iVQ1DZJBRqEyqC6YxoQmQv0TiElJ243JNv4rIAM6Hw10c9or5EcZ1a1HPqaQa0
	05gnSt45rENlHolJtgtZkzecq/t4y0SbklliZId7gORpwNtr+1EBMSHn+wB9h7eV
	E6lP/Zn222YGwFYhWiqx7hFDPikjTMcQserDoDEXg1QFYQnufly+ux3fscrAHgHv
	aUonJ+QKVhzKgmDcSrIjavPXg3LtzzFNhJNw2fCB6AMsfPwxY9LSKP0r17kTe1gQ
	/NSikIZnSDSnfMVxYHHl1F4/+P9epBjiflf09y1vOuzXMfbMgri5bgQpn5vEuK2w
	4NCw4+WAcBebRi08bXsBVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793024201; x=
	1793110601; bh=lN7LmDxK/3IJS+spc2D933xtZU2kguufCVVuiL1xDzc=; b=Y
	1XSoMIHrloCxON8y9ik6gqBvIqzJQN/m62QxekMtbgYsKaNkvi7J63yFqR6Sl/Bh
	NAmx04E2Q6U2vdrhgftoyxHqVIhZ9vSGC+/eepevHlfAitV6Maz/FEUOSaM+IdjY
	lyWn6HHU2UzCEtd2eSpzfw4tEttMEXHIgpyf5Uh8bb8xO1KGK00TglC99G5JKfxU
	nuZZFu1Jp5rz3w6tx1Eps4WdQGx/khoB4e+mgi5VgYS5y/0wNAiP1Gz6gkrPBuPE
	eP6vwxpxzlIG3F0uI1gryjjdvq9mdWd/vXKwnTlWz0xZngK4/O0feenwc52xwgnW
	Oa/HjCoNf/drv55vfqY4g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793024201; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:lniyu8lm6m8ml0mFSw628BfmhLWsm06sVa4EXbwB9c8j2y1
	78roqAwykqtPM59t0bxMoUwOIbGfVTGEeh76lHSEYO7SAe4uUDWl4JJRaOyp0QJU
	0Gk4/MxFM7vjd4YdZrKiLKUl7qLfE3cFaeMgGtddIQPvI08h+PhDyA5qe4NYdsUG
	WtgYhDAiQk8tm0suXJLbUSse4Yo9ECsM+pemt8LDlnhvxg47mdfEjBC6Y2LGUlY7
	EnT1bgVZHeMlNmqWGuYIoOIcGJTev72E+qKaivvo4NsDX0JTIg4aEDJCGsQagEPs
	1eSMZe93G/9IwbDywju1IybHKloOJrwqk9G0kRg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QahsNuh5XYJc0FLjC6hsidNC8Uvi5ftiI4cXENOpFME=:sGNXjRn5pi18sFJOomDnd5TGDvinCOpZGoqo/HfzmqM=;
X-ME-Sender: <xms:yWDfaj-02u2P86-OknagyGQwH-3N329uAPyNzGPvDZ0vcFNywpuIdw>
    <xme:yWDfapDIEHQ2kfL4Oc89AkdRFWmVNBwQF3SnITA8ei6T0TllqQE4vIgqTfqK84Tcm
    Sj7Rl8yBqp4RNhEfkQNp-9ge97iCiqOw69Dl4xHq5xSColkyHTrJg>
X-ME-Received: <xmr:yWDfaoSUjKqDecycMixf0a4X9vCHfI8IorYuV8m5vFgtW_oYnLUdIPEeknoprwS1El9mSdj5IEnz92D3KFrwMWSndJNiBRQ>
X-ME-Proxy-Cause: dmFkZTGfqf4YI65uSXb3gqys6a0fU5HXFkZ3HR1R1+Espo5ChuLb83M9R+ep7gBGGds3mf
    awyHrH8DKL122P+rb9aAtD0LbHVVgTzNc+6/DvveGtseAXt2yNwmlTZxBs7vyQyTjkxpJG
    E+A1PlOasdPMqo02cWdu+J8R2oBCaLp/+iS8G5r0/lzQiADO5An9TFyBXE29ZDAnP8Jqla
    DzuclfjDuTh82kpVaU5qTS1bJOQnwUPCqp3HifjeT6daXKxN3IM9lAF9i3tXc9aiDDc28V
    BfKj+3d4xFEup5J+Qun9gVM/r97vQM2qLkTjEnoJQ2LuHgauYF5mllMrrr6uTa7OpYpgW4
    7MLJvCfTFnwez41Hv166vEYW8bKE1XrM48DXc3WK0KYmAHcokJvFRP4lJ8xxtNOb7rTgqX
    wXySfr1DaSYzCtHtGyDhd4ijENkulHxCsW7BKxAf5xjkGsgrrbZp4qXS/45Ry3hT+7Hk9R
    AKGuYvpjwCDilKMW4Fk3sLYqIemxWXOHpiJl7pi+qlfhZC5Qp1pC2duT0tSk/2UXC7Cqjh
    kwconrACv8YaW2+F41Mm0Xok6BuPNCOnKCeYVrxbQCY5PAuwrbPWtJlS+66aqGVmKcnWd5
    ytv/wvNi4hOdtXzQhP9AQsdjKSpuAe3tm0hVxIWFEc5MjIlTJZzQQjg2GHOw
X-ME-Proxy: <xmx:yWDfagvzKdwFbjYwRaDJJtL4Ibo-WPGt-lY_1GMhl3PTBljGyL8bow>
    <xmx:yWDfak3UZBRhhEE1LVLba2wdngXx9vw1_4ok6A5B6Tug-hGqxyCIhw>
    <xmx:yWDfahWXdcFTI4yWfdO7Wi8ZIBEGX6DzqwreMiCjT3zE_wgx59O8eg>
    <xmx:yWDfavINbm0W_7mxbYvx27iB4LNUO7BAIR6vBafNDBG-tH88csFLVw>
    <xmx:yWDfavOyuro71_P2tkTWYWWSRGJyJpNai_aPHMbPkPxy5XtvK_QOtWVI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Oct 2026 10:16:41 -0400 (EDT)
Date: Mon, 26 Oct 2026 15:16:39 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] media: rppx1: Update shadowed registers
Message-ID: <20261026141639.GD1959885@ragnatech.se>
References: <20261026135814.564457-1-barnabas.pocze+renesas@ideasonboard.com>
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
In-Reply-To: <20261026135814.564457-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Thanks for your patch.

On 2026-10-26 14:58:14 +0100, Barnabás Pőcze wrote:
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

Nice catch. Indeed all my CI test of the different modules setup one 
use-case and do not change any shadowed registers.

> 
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> ---
> 
> I made the minimal amount of changes to get the desired behaviour because
> I don't know how the maintainers would prefer the registers in headers.
> So I simply copied only a subset, but it feels a bit suboptimal like this,
> hence this is an RFC.

I prefers to have as small scope as possible for the defines, but of 
course it needs to be useful. As the scope prior to this change fit 
inside the .c file I kept it there.

Now it does not and I think it would make sens to move all of the 
register defines in rppx1.c to rppx1.h to keep them together. With that 
changed I think I'm happy with this change.

> 
> ---
>  .../platform/dreamchip/rppx1/rpp_params.c     |  3 +++
>  .../media/platform/dreamchip/rppx1/rppx1.c    | 23 -------------------
>  .../media/platform/dreamchip/rppx1/rppx1.h    | 21 +++++++++++++++++
>  3 files changed, 24 insertions(+), 23 deletions(-)
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
> index c502be7979146..4794672e088cf 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
> @@ -15,7 +15,6 @@
>  #include "rppx1.h"
>  
>  /* RPP_HDR Base Addresses */
> -#define RPPX1_HDRREGS_BASE			0x0000
>  #define RPPX1_HDR_IRQ_BASE			0x0200
>  #define RPPX1_RPP_OUT_BASE			0x0800
>  #define RPPX1_RPP_RMAP_BASE			0x0c00
> @@ -26,25 +25,6 @@
>  #define RPPX1_RPP_MVOUT_BASE			0xc000
>  #define RPPX1_RPP_FUSA_BASE			0xf000
>  
> -#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
> -
> -#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
> -#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
> -#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
> -
> -#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
> -
> -#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
> -#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
> -#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
> -
> -#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
> -#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
> -
> -#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
> -#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
> -#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
> -
>  #define RPPX1_RPP_ISM				(RPPX1_HDR_IRQ_BASE + 0x00)
>  #define RPPX1_RPP_RIS				(RPPX1_HDR_IRQ_BASE + 0x04)
>  #define RPPX1_RPP_MIS				(RPPX1_HDR_IRQ_BASE + 0x08)
> @@ -349,9 +329,6 @@ int rppx1_start(struct rppx1 *rpp,
>  	/* Immediate commit update for shadows. */
>  	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
>  
> -	/* Then for operation update shadows with picture synchronization. */
> -	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
> -
>  	/* Clear any pending interrupts. */
>  	rppx1_interrupt(rpp, NULL);
>  
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
> index 3bf3955afbaed..c6bd82f504560 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
> @@ -13,6 +13,27 @@
>  
>  #include "rpp_module.h"
>  
> +#define RPPX1_HDRREGS_BASE			0x0000
> +
> +#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
> +
> +#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
> +#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
> +#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
> +
> +#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
> +
> +#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
> +#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
> +#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
> +
> +#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
> +#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
> +
> +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
> +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
> +#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
> +
>  #define RPPX1_IRQ_ID_256HIST			BIT(27)
>  #define RPPX1_IRQ_ID_PRE2_DPCC			BIT(25)
>  #define RPPX1_IRQ_ID_PRE1_DPCC			BIT(24)
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
