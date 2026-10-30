Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363562;
	b=Q0KMXxgZGBdiUODFFZRnw8CbiMB6ItHb9WDsjYka5Z876xwk4S+CxB4/s2Ps0lUhLP7D
	 uzF7fiNg3t0zpZAlmmK7TXlmZQw4aJd5BrYz2nQ+DlFoLOz9ZTtfo+UScQG1tDlT+MT5d
	 +YaCUoIJFSuNkNjv9Zl4+RFyiwLp2Uki+WlDt0DlVHOdYLqN1DxeE2BVvmkEhqkkLSi7C
	 8g9HAj/rPjG3Q+MDmX+DgtNIZsHmpkImvGva4xgLdo4XevyOs+0LYadVYIlm1TVs3T5lE
	 7IboDIq4kdHXJOki0nBfuPB4CO1c/BSxj9hlgmEhnSWMH2f5HultHVl3hBqdR2s4zvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rQqAjjFnrAFg1/5l+3pgQ8JrQXRSksXXCKCV2WK0j4o=;
	b=33+ZTF++PYGL0MvUNlJGqB+IlO3UGW2pSzIx6RzCBVxaPD+wi+VZGyNa5WJ8Z5AucvDW
	 PGTybbzxZTxiigHCa9SlZC4+wH1PqO6ac9szwPAfO2u/i78ji2KEdEN9XdBtsuW2ka2O4
	 bC+atZRqH8nJiIwzjT1VWl+9E2BnkYTIgXQ5z871vpa/uG75IjSAy1gr9r9z0W3SCWBuw
	 +NF5qGX26FFXGziWwWyZ/ddUxuU1Zv+MxXV3oxuGi4lVtWrNFejtApmLm3jnqvLKZghJz
	 1AYcx08fpPphZjT2lRQaBAIS6BUdQAIdJR7YalbsXAblcy2G+qqTlp/a1WvaXCw15Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCHkCNGf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MW9pU9NW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE60606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCHkCNGf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MW9pU9NW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGHEA1527675
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQqAjjFnrAFg1/5l+3pgQ8Jr
	QXRSksXXCKCV2WK0j4o=; b=GCHkCNGfmbNNJjSHkVyyxURW1u7Wzc/Wm2MtFr8F
	mnIhv2WWR6NYTnRHkZ/grOTE6esHEj9SQdNnkreNf5NtADxww6qjKZqHUkofExKv
	tJp8w6o242AQCI5Ndu/sulPY5KwSuZ2qNzmwyjay7LuF1qoJIWM5rU7JJo4fpFGn
	CT+bmjUEYAWWMauwZ/94UNJV22uP5aL6ZRuGqFw6PbeGmJKA1NasvN4Y7MQSqYN9
	fiGmSbIYvht5V28cytcEvXU/XHBB7gL6qdIErJSZjHpRNY5m+Z2pJA2dQMK8QMAZ
	BIRc5OTfmxulMcyUaIeYJr1wEuB4qM6FZZoQ+yWKsSttJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pk0qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:32:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so117563085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363560; x=1793968360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQqAjjFnrAFg1/5l+3pgQ8JrQXRSksXXCKCV2WK0j4o=;
        b=MW9pU9NWrgXxrvWh413S7Xp7NsFhFFvr1vI0eCNvDERBYjb4narC06K811S7C8zYlz
         qxdVu2e7qDwDXoV8YCnUB28RN3kHFbYfm9W+N8mBUmk4Fdzq1xh/2bN4Mkeu31otueEg
         vxw/Jw0mMN8CLtmCkGbE86TEyzrL2vckbMQ4jg9Nj0KcrlK+W+7P4gvmg+Me6Ctxd21E
         JE+fJUYW/rcEdgyYW7UH2DdXZgoIeb3KRN6qAcyTl5SeNC4TMYIdpLpiE0Xa87w1erxx
         kTFchlss2OBkhpCNg+ZYuYbEjxFPCpdkRrRH0XRJa0Z99f4YdMqdLp/hu/abHGZOTuw3
         eoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363560; x=1793968360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQqAjjFnrAFg1/5l+3pgQ8JrQXRSksXXCKCV2WK0j4o=;
        b=rm5vFARlgOJAv6Jjc0DxFOg4ML2tT+BcNPzs7YgrgVk5xx/NxwHZGJf7bu5A9TuN6J
         CBKfnYEIE62cqJgCDoW3EFVmaOu2/PSqAdRiUZe9muwrfNNFZWW6KPxrgULab8FK/IqJ
         D3usLwizbSALxH8r68Z/rPhiP/X0u4y2X+tWL43H/UbltbZ9wcryiQP0VvOxIMGH9rnq
         g99IDdcNhtseDgr4imSqrMu9T68pcAUrpbaMSxk8EyGy36HYNsBlE8NsKTSupG6SydM+
         tQ4geRMlbxpO4In1uLLR1Tnh5Ju8jAawG2FJEK0ItRd4hbLn6X+q0EI2NI3JQi1RAtuk
         Vtjg==
X-Forwarded-Encrypted: i=1; AKwUvBxaacT4hRvvzCZYUq8qZTpnrn6soGmN6tQI05v50A28VV/KBscUmy2uVb3zIbzb/b2CSDYGpdj4awJnfQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6dVpjgGExp2hcW2qRlHgPCR/7BktuOD2xeFLpaqklHdibm7g6
	yqy+zaAHRj1MCnb2RsoOutvKJuaYeKAwVPiki3AlUv6cmlcfKSZSOiq8sfkNSefjuo4IWLVWJXd
	+kM4mHwpcxmQGt0TH3xxiBRsLpH8NDjlgl2yP3Sd2X43o7PrI3LIbcbZhQ1M4Htcqvik=
X-Gm-Gg: AYBFou1IEX+xEkv+laK1ATZFqh4i2R40E8hTUZ7PlrP5nS1vvXKr8a9wuVqQR1LgYnO
	dy+Ah9fhDWH9aHN1dVqcWgylRQuK+HDdzNKwRCzjkcoc1+lhA3YG5UAbWPbvGWz0XZNeWbH6zpQ
	SvuFlY+fjjPCB4ADFvG6o99oEsesIl3Ptc7p0/jwkSxAB9TBG5nA5s4FLIzYjAy3hPetzE2g2IW
	Psekju8Fj0tnNOd45zae7FM5lKbxUdspaLAsRGoE2R9zyB2ainU2YJM7Asv3YK9Rwv59/CO/nrT
	fo0PKDlZcWoOSPE+V4pQn5Kn68D5ylvNxiDENcu7Y+BqwVhRrriskMrMh68gNyVZGMNbO2eqiD8
	Q23Hc6SLtk85jqPOTuoH82QRIpAzHPgi6D9oHIS0sM8oWWpbyNinS2ldRbRX3bENyB4RqbPqb+h
	4l1DYSOSlWFob7yWQRvNJtOA==
X-Received: by 2002:a05:620a:838b:b0:93f:5593:5750 with SMTP id af79cd13be357-944216ee79emr335402785a.17.1793363560106;
        Fri, 30 Oct 2026 05:32:40 -0700 (PDT)
X-Received: by 2002:a05:620a:838b:b0:93f:5593:5750 with SMTP id af79cd13be357-944216ee79emr335394785a.17.1793363559439;
        Fri, 30 Oct 2026 05:32:39 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm136475475e9.7.2026.10.30.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:32:38 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:32:37 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
        thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel
 interrupts
Message-ID: <auSOZaH_Hu6caTSH@lore-desk>
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="MiK4MvEZXEgqTADb"
Content-Disposition: inline
In-Reply-To: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfXzlz4UCxr2Cbp
 ztPmm88oEcCfEt4seQMlP1dAXcVz/Dnun3YSjtABGyxLjgPHJQJVzWAAj2SLVZzz72ue22bLJAU
 KIweMjo79OZmkqsYJRIyuLGECbSYzBM3y7cy7Acp10UycKe5sEbvCRV2jU0KuNft0P8Snwb2SXU
 QpEye/7jA4bBqdkN9/ajs+aNmAmTWKljnKjWsiCi+NW4RXWNTFQnprh4BLl/q0OD4K2997pm+nJ
 egncw8GANs/wT6hs/CtK1ibNLGS8ETmNPxQQZdXF7s39Cqz9eQnCYq3WsPKHM3+muKPeVbEo7b0
 KMVvGMpmDJGBFj5H0ZT9+yuzq+pbxbVmM3PmsXxH/c43olTuO4m+Rd55EcZCT1FCyXVoPbIv9Mf
 cNgvy5THNOF0xzrxp6UjKzEQ1iHP5NxglFuJoqSSM2ivdySZMCCp2FhhV/wABoMgQkicJDO5jmm
 INMoNcgwicvSVzgauAg==
X-Proofpoint-ORIG-GUID: J9cBbsau6pfHDvR2MoJkUnID3F5Ydsz5
X-Proofpoint-GUID: J9cBbsau6pfHDvR2MoJkUnID3F5Ydsz5
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae48e69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=TdYLlOzfE9KcRv6nyNQA:9 a=CjuIK1q_8ugA:10
 a=4nU4Df6lw9LS-X-cepgA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX4nVEVLfYS/qw
 AQ3/BiZu48gC6QA/Val4xCEuEBR/Vy4UQxLBR4OO+hr3rUx+1y34YObdOAQzn7BQYspxEz4pR7y
 7qJj6xiscy45SA93SOVuMA5/sh2wrEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300049

--MiK4MvEZXEgqTADb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
> Let's make sure we clear these interrupts for multi-MSI cases. It's
> already properly done for the single-chan interrupt, and for that
> introduce an "ERR" DMA dir, as we don't want to touch the RI/TI bits
> when handling these interrupts.
>=20
> To avoid duplication, the DMA TX error handling is factored out in a
> dedicated helper (in the same commit to ease backporting).
>=20
> Both of the above storms have been found on dwmac-motorcomm (YT8601),
> and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
> ring_reconfig.py and netpoll_basic kernel selftests.
>=20
> This seems to only affect dwmac4, there's no multi-msi mode on
> dwmac1000, and on dwxgmac these interrupts are masked as of today.
>=20
> Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=3D1 for multi-=
MSI")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  5 ++
>  .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  2 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 46 +++++++++++++------
>  4 files changed, 40 insertions(+), 14 deletions(-)
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
> index 9ded31150fbe..2068b57df8d5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3141,6 +3141,16 @@ static int stmmac_napi_check(struct stmmac_priv *p=
riv, u32 chan, u32 dir)
>  	return status;
>  }
> =20
> +static void stmmac_dma_tx_error(struct stmmac_priv *priv, u32 chan, int =
status)
> +{
> +	if (unlikely(status & tx_hard_error_bump_tc)) {
> +		/* Try to bump up the dma threshold on this failure */
> +		stmmac_bump_dma_threshold(priv, chan);
> +	} else if (unlikely(status =3D=3D tx_hard_error)) {
> +		stmmac_tx_err(priv, chan);
> +	}
> +}
> +
>  /**
>   * stmmac_dma_interrupt - DMA ISR
>   * @priv: driver private structure
> @@ -3165,13 +3175,24 @@ static void stmmac_dma_interrupt(struct stmmac_pr=
iv *priv)
>  		status[chan] =3D stmmac_napi_check(priv, chan,
>  						 DMA_DIR_RXTX);
> =20
> -	for (chan =3D 0; chan < tx_channel_count; chan++) {
> -		if (unlikely(status[chan] & tx_hard_error_bump_tc)) {
> -			/* Try to bump up the dma threshold on this failure */
> -			stmmac_bump_dma_threshold(priv, chan);
> -		} else if (unlikely(status[chan] =3D=3D tx_hard_error)) {
> -			stmmac_tx_err(priv, chan);
> -		}
> +	for (chan =3D 0; chan < tx_channel_count; chan++)
> +		stmmac_dma_tx_error(priv, chan, status[chan]);
> +}
> +
> +static void stmmac_dma_err_interrupt(struct stmmac_priv *priv)
> +{
> +	u8 tx_channel_count =3D priv->plat->tx_queues_to_use;
> +	u8 channels_to_check =3D max(priv->plat->rx_queues_to_use,
> +				   tx_channel_count);
> +	int status;
> +	u8 chan;
> +
> +	for (chan =3D 0; chan < channels_to_check; chan++) {
> +		status =3D stmmac_dma_interrupt_status(priv, priv->ioaddr,
> +						     &priv->xstats, chan,
> +						     DMA_DIR_ERR);
> +		if (chan < tx_channel_count)
> +			stmmac_dma_tx_error(priv, chan, status);
>  	}
>  }
> =20
> @@ -6466,6 +6487,9 @@ static irqreturn_t stmmac_mac_interrupt(int irq, vo=
id *dev_id)
>  	/* To handle Common interrupts */
>  	stmmac_common_interrupt(priv);
> =20
> +	if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> +		stmmac_dma_err_interrupt(priv);
> +
>  	return IRQ_HANDLED;
>  }
> =20
> @@ -6500,13 +6524,7 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, voi=
d *data)
>  		return IRQ_HANDLED;
> =20
>  	status =3D stmmac_napi_check(priv, chan, DMA_DIR_TX);
> -
> -	if (unlikely(status & tx_hard_error_bump_tc)) {
> -		/* Try to bump up the dma threshold on this failure */
> -		stmmac_bump_dma_threshold(priv, chan);
> -	} else if (unlikely(status =3D=3D tx_hard_error)) {
> -		stmmac_tx_err(priv, chan);
> -	}
> +	stmmac_dma_tx_error(priv, chan, status);
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.56.0
>=20

--MiK4MvEZXEgqTADb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauSOZQAKCRA6cBh0uS2t
rLt2AP94/xq3HXI972oCxjUn64hJJfAqS/VqduknEbpg04vgCQEAoFB4EmEfJdaY
5GXrYPGGorHqDH29hb7XSJ6BbhpAnQI=
=yMqN
-----END PGP SIGNATURE-----

--MiK4MvEZXEgqTADb--
