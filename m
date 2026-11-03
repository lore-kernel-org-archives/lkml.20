Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713297;
	b=IbuN8n8PQvoTPHAgpyQKM2iUnQ2zi9W4tItzbyicFK4qjgcta2RH0gNmEHKwlwGHsY0I
	 ECOP8RCbSOKO7O/leuysiS95dmhHJ+EXE2+u8VR59Z4qjIRFRdAYr4FajqlwbQKQ5XmUg
	 aK6vcD2o4nGlJnPyCEitok+f2WC7Sts3cfNL3VhUmLlHqru/nRNUX6lkiGhCbhUWdD2sE
	 d8V6V27CFgDxlGLDV7eBig+xH8qz0Pd/xTXJg85m6h2NyGW8oMApm0h4E9v590sMNXYlY
	 ZbIgPp4bxehCzOgB7kjCWHgUbkv1BkPn8MqgG6WJ7ibmTgd0KPIJB3BMrIVsMShx+bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bcYDRPzyHHMEv/pDR4h+hjr434XL94uQThpC2nQ5TSs=;
	b=LIXcFBJ0Gr4NhInogKw+nlYIQnBpKne3YstnSexghv+tNzPfRjX3JNk/l0CdORywdK6I
	 p5U50GPENiVDrttidckjqVsUKLT0XQAS2EQAxPCztF3xFJ9QTqTGp/TJeaSk9kz6wpP8/
	 0SKWUy8I9J2+zKJbRf5bMGHtGEIKJQT4R11KoqpTH21vyAwhITZlopZiOjirXzF3LjxQo
	 v0hL1jRXQldB/5hX4Xx9Wg4ZKj5fPC/SdqvHbHPsNAjZVjHNR8fJOGhb4yYYVqQKTttM2
	 vKT1okdUfd8/alRgkDBUliRMbyItu+lZHwwk0ljkTuWZJD9E8FJksUqP6WMGepdXC8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsuknYPv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOZclklt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E3606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsuknYPv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOZclklt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZBqJ3581414
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bcYDRPzyHHMEv/pDR4h+hjr4
	34XL94uQThpC2nQ5TSs=; b=BsuknYPvWkJzbbIe1z590ijeM3b2T7J3/0ij5cgZ
	0rnhsw38ER2IaEilQDxD0QG1tG4kpQWj2bRyAbn/Z1p3/IsX0hBU0A8hbyB2sZEA
	kw5jcPMc+IPFplYRN2gfTVO+iAShtYvWIOsQUcdOHSYFenTIWeA7ur8i2Er9H+GI
	2J7ozGwle8lWyl3wqa+9tZeATzwSjHW51SmraQKCwyOyMNDGuE9U/Sg8Y0NZteyw
	V0uKTrrY9Hedxn3ZBW21ZDnBU5MemPuko2429Pk1Gece9258eG3Cyi4r+ZrZBCR3
	Xnw7c7AEJdZAXe1FY4uT3RLKRUzX57C1uYdqCYNYsaGWrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94csxpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:41:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so826395085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713295; x=1794318095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bcYDRPzyHHMEv/pDR4h+hjr434XL94uQThpC2nQ5TSs=;
        b=HOZclkltWSPIWa5oH+pkBt/SFOv3nGdWHoGI7gp15Zht3WljsG+AlzBpd13pEXpGfX
         Ea6zW0XfrRNSx5YGp+I+HIHaHpAoLpdgu3LBROoPq/zIqFtOu1mt1U4MjcTZLmTI2UQp
         e/CRJinNNP0mragngj6+YljvsJtjL4OblH/FQFT/krhpEPLF9xAkGhs5js6w1Z0fp/Rq
         mIS4EjiwSAE0dWAJVHDYEp4fu93KBC7iBPos8KsqHXYfJFZxJcM0084I5ynYv6Z0CqCe
         fbxeKOdsJAkYambEzrFl4rfXNAQDXWQyfYqVJIHzwceJx7ioYUIuYjg2la86qbBLl7ZK
         38qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713295; x=1794318095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcYDRPzyHHMEv/pDR4h+hjr434XL94uQThpC2nQ5TSs=;
        b=hUrDip8JmYD12mO+CBPU5aitPMwkt3tFKp8kEOosX05pfT1tkxgbZrsyiwrkoj3YKM
         NuY6++29Zddt7/AuZvht2ChZ783I+zCuRLlmryHIuPchZ5pj3lL0E+zIDaCyApwXOQkI
         /gqA0XQwxr3iyPXP50Mxj6tuxQHTejFAWqnmh4nWaurgYAi+Uep7GiWD/bnYv3aUVDnG
         Naedxlt8faUZc5Vo4lrCYG8+JgqAOoZ5qh6Zj1fDjTSJlnBcIYssqi5NVfxVgqxqcWdW
         rXydA1C/aOVawes+mlxu3yCWo3y7EKj7KVsFtmAlrlal/cus7xuuZ2Swmb3DvIiOmDvG
         OKHA==
X-Forwarded-Encrypted: i=1; AKwUvBxnEuOnIzwr+sEm+y2rnkmkOTggEmPuI7GIdGbY3b0ooi56ik0vdKfNNMBX6/32EacY+5WPit78YrHwguY=@vger.kernel.org
X-Gm-Message-State: APuU4Z86lQto3dObG82y7vpqKCQYUdBvxl5LTP19GfQWhMuy6vugHkmN
	61BF6Qn3o598yELtC2cRluQb/C94NG0rH8Hrfu7O7hm/7FhrSZeWpAewCezY3HSneXrPfj2nZuU
	4PWopXwwjUB7N8/3BBCeasjsnE6Z4WoF7vMfF69cF7Nu6MCtya+z1I0iStLtxZo92racAPXqttu
	U=
X-Gm-Gg: AYBFou1BwtYe5I7G5dYA7sZhuMm6SpKWG7gF+8j2xMxBW2+m+U/45nyINxCAdjQacQj
	JamDtdR/9+UeGzLkyQXCo6piMs6dJrgAqasUcBVSkx1ot4AS+iLtZlC/8Ev9bXuHhyUMoBpFYb9
	96T1sdWDFg/zVd1tPdL2nsPnd3Oy/znoumef49fLhKTS9g+nAt3Amll1e9svudPH5+xhWgkVoRR
	hQvkZ7E4i45fM+yafC/gf4Voc6FzzFz6/CC0Whzcz/pEYKQM6AMFdO0LaO3AMbRtG9ISF1F0aRE
	eVfT5Emsb4DbR7hDqWiD7E95e+mTPuESrJ7E4WRgCggTe7H/3N4fpazmR8LeSvPgRUze9pRvaV7
	zAFStnqlbfsueipHxoiVWxjm+7W+qV0nbMh1+t+MGcXNZHWLjKe/dl8JHulHfiQ==
X-Received: by 2002:a05:620a:272a:b0:93e:c35b:2332 with SMTP id af79cd13be357-9442184e908mr2122586185a.73.1793713294555;
        Tue, 03 Nov 2026 05:41:34 -0800 (PST)
X-Received: by 2002:a05:620a:272a:b0:93e:c35b:2332 with SMTP id af79cd13be357-9442184e908mr2122580485a.73.1793713293852;
        Tue, 03 Nov 2026 05:41:33 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09fadb75sm222751545e9.3.2026.11.03.05.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:41:32 -0800 (PST)
Date: Tue, 3 Nov 2026 14:41:31 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Magnus Leatti <magnusleatti@kernelriot.com>,
        thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel
 interrupts
Message-ID: <aunki9NNExOeLaAb@lore-desk>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VCchJjwU/KronfNG"
Content-Disposition: inline
In-Reply-To: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9e48f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hUCKMWOQsVhIjlt2O00A:9 a=CjuIK1q_8ugA:10
 a=N9U-9oHc826BwoMl2xwA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: wb4xNz_PwtnlzZRZ7NczoDIWkuucBK-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX7k4Lu1jgCq3h
 xd83r0n0OJAFxrKM1ecI0aEAqFSPa6m936z5N4SPmxhZ2WUY8ly8yYSZ39gTGWmA43rdyr3ohyb
 d1aX7jncsKmgkJiQTkR8kKVzDE6cLVfizQZSN9bAAd61vKwgpLWfpxWeb08T1HBb2iAxOAEdZ+S
 ks4pS1OWw3zZFXXmB/OzSWJneqcWc2nTko203Y9jDCVgAEb5YXiRtS8JvPN2jVSb80MHaSEOb+A
 mVTraX4PM7PZcQu1uX3EJ5OwB9+Bdz+AVJfIOwWzMW/+j3xawKVwVYl7d4DAsMuL3J76U0tLy57
 3LOYznJVyP/LSqOKCEoyLubxh2kzcUZ10YuH9Hyp+Hzu3ghzMiIl0d+EZSrdcc4HlKOiJt4B9Mg
 t2N6996ri+t+NvzqWKH7Qy9PeUuXzJ0uBuTwDj4jKCLPazfONVRMuSQC8onJtbaT5LUbRo6Af0q
 oEoBsR/LqGblc9ObwuQ==
X-Proofpoint-GUID: wb4xNz_PwtnlzZRZ7NczoDIWkuucBK-7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfXwcxZBDtjpAkq
 YzheLp11WD0cwuo/FHftLW4WkO4m35+ORVba2W4PIzPw/eHSeaoDuLqs74WTNH09QftwexpWbqj
 F9aI9okYjtbz1Dw0IqK/ckFyAGQpCWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030054

--VCchJjwU/KronfNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 03, Maxime Chevallier wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :
>=20
>  - The RBU (rx buff unav) which triggers under high traffic load
>=20
>    This triggers easily with iperf3 and small udp packets, and shows
>    when running the netpoll kselftest
>=20
>  - The RPS (rx process stop) which triggers when we stop the DMA RX.
>=20
>    This one shows when restarting the RX logic without doing a down/up
>    cycle, like when attaching an XDP program. The XSK kselftests
>    triggers it.
>=20
> Let's make sure we clear these interrupts for multi-MSI cases, and call
> stmmac_global_err() upon tx_hard_error to avoid possible races with
> other interrupts/napi.
>=20
> For that introduce an "ERR" DMA dir, as we don't want to touch the
> RI/TI bits when handling these interrupts.
>=20
> Both of the above storms have been found on dwmac-motorcomm (YT6801),
> and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
> ring_reconfig.py and netpoll_basic kernel selftests.
>=20
> This seems to only affect dwmac4, there's no multi-msi mode on
> dwmac1000, and on dwxgmac these interrupts are masked as of today.
>=20
> Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=3D1 for multi-=
MSI")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2:
>  - Dropped reviews/tested tags as the implementation has substantially
>    changed, sorry :(
>  - Discarded the helper, call directly stmmac_dma_interrupt_status on
>    all chans and use stmmac_global_err() for TX hard errors, following
>    sashiko's review.
>=20
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  5 +++++
>  .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++++++++++++++++++
>  4 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/e=
thernet/stmicro/stmmac/common.h
> index c74bc7c9750e..a972bee66504 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -382,6 +382,7 @@ enum dma_irq_dir {
>  	DMA_DIR_RX =3D 0x1,
>  	DMA_DIR_TX =3D 0x2,
>  	DMA_DIR_RXTX =3D 0x3,
> +	DMA_DIR_ERR =3D 0x4,
>  };
> =20
>  enum request_irq_err {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac4_dma.h
> index 43b036d4e95b..a7caac3c98e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
> @@ -173,6 +173,11 @@ static inline u32 dma_chanx_base_addr(const struct d=
wmac4_addrs *addrs,
>  					 DMA_CHAN_STATUS_TI | \
>  					 DMA_CHAN_STATUS_MSK_COMMON)
> =20
> +#define DMA_CHAN_STATUS_MSK_ERR		(DMA_CHAN_STATUS_AIS | \
> +					 DMA_CHAN_STATUS_FBE | \
> +					 DMA_CHAN_STATUS_RPS | \
> +					 DMA_CHAN_STATUS_RBU)
> +
>  int dwmac4_dma_reset(void __iomem *ioaddr);
>  void dwmac4_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioadd=
r,
>  			   u32 chan, bool rx, bool tx);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafa..02aa1a3dd1e2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -150,6 +150,8 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, vo=
id __iomem *ioaddr,
>  		intr_status &=3D DMA_CHAN_STATUS_MSK_RX;
>  	else if (dir =3D=3D DMA_DIR_TX)
>  		intr_status &=3D DMA_CHAN_STATUS_MSK_TX;
> +	else if (dir =3D=3D DMA_DIR_ERR)
> +		intr_status &=3D DMA_CHAN_STATUS_MSK_ERR;
> =20
>  	/* ABNORMAL interrupts */
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7ffed295eb14..6360605ef5ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3145,6 +3145,22 @@ static int stmmac_napi_check(struct stmmac_priv *p=
riv, u32 chan, u32 dir)
>  	return status;
>  }
> =20
> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
> +{
> +	u8 channels_to_check =3D max(priv->plat->rx_queues_to_use,
> +				   priv->plat->tx_queues_to_use);
> +	int status;
> +	u8 chan;
> +
> +	for (chan =3D 0; chan < channels_to_check; chan++) {
> +		status =3D stmmac_dma_interrupt_status(priv, priv->ioaddr,
> +						     &priv->xstats, chan,
> +						     DMA_DIR_ERR);
> +		if (unlikely(status & tx_hard_error))
> +			stmmac_global_err(priv);
> +	}
> +}
> +
>  /**
>   * stmmac_dma_interrupt - DMA ISR
>   * @priv: driver private structure
> @@ -6494,6 +6510,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, vo=
id *dev_id)
>  	/* To handle Common interrupts */
>  	stmmac_common_interrupt(priv);
> =20
> +	if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> +		stmmac_dma_err_interrupt(priv);
> +
>  	return IRQ_HANDLED;
>  }

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> =20
> --=20
> 2.56.0
>=20

--VCchJjwU/KronfNG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaunkiwAKCRA6cBh0uS2t
rGlyAP9/4lNlgiouhiFLBiFnn00p1XBEQmgCE2YDorFQ6N0/GgD/WxuwNcrXlVbI
Kpjv1IOByUWMenAa0cv2atKZQJ1IKgg=
=mOzg
-----END PGP SIGNATURE-----

--VCchJjwU/KronfNG--
