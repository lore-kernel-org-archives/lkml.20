Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D946F4BE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519437; cv=none; b=PcnMAjvrCInTVrRLNsGzTFMUaO4GHkPfUyOOhPdbLEBvM5uVIFA9fPbdG2/gV3tFmH2m2O0vMB6vinOYGWy/r8V5XZ52ug6gyWA4A4Pm0SCKvwRYI+FFNf3Ke4fCNvvd1eVt2Eq/D4YS2axZKOK0ay9NeyrBtMZ8TWhL8naALmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519437; c=relaxed/simple;
	bh=QgYuvOmY6qUDa5+A2/Nknmr3Ed4l68Xjr5A2n/C1lNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpK9MEa85Fc6ctwVnaLgEWsmDFwII7gBz5hBl+l8O19+9nA178OBh7Jx6dMfFB8oXwgs9uv3Ti1bSjJARL9F3fF7OcKmgopjteNDdcVufYKjykmCPxgodvGjSkRlbSTB+0cGrS87ULTuJq0S5HyFaEaXOLvaySxJhgSIDSRdpP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvIvCLqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmEe/ntk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvIvCLqp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmEe/ntk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIGq33442816
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08F2XPDmp3MN/acIJE0scEdK
	BWxNouhbbHVqjQV+qoU=; b=HvIvCLqpJ20kUDEiM0nhgKqDP0MIZkstiBk8ScTg
	IQvnKmse7P8c2pE8j3ctW09mxIyczAYT1qg6JtC4fw7lRekqro1hAwLRaXCO0V9T
	m5S1qIoy7N3ftyl4s0ChrgQ8oj8geuZxrdBLDI3U5R9DXw0HbZrn0LUOzmq6AjDN
	1DHfhAZWjtTZsP5Eag55WItNORwYTgUSkpKvL79QfwSMZq7J1bOFwaGFU/erHLff
	bieNvnTk7sY/dzeQigKpTh/qoarZ/TK5J0tQLxi1vmJAoqog/SlfsWAFsZT6sYjH
	vS6h4vwfXlGR7EAt88UecpVKxCLWH7Jq5y7qx5xrjNs2fg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp781adu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:57:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938153538caso155182985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788519434; x=1789124234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08F2XPDmp3MN/acIJE0scEdKBWxNouhbbHVqjQV+qoU=;
        b=KmEe/ntkiSvRIGivcS8jAT68dxDyLPvSTzHQW2ioz38y0DDRllUUdxWVQBCgyxwelX
         QNLnLgiFn49TA31SwtpO90/ooXW4TXKK2VAureXllrhOjwBpjCt1YSglOF9adZyBt5jx
         tvd3jhVmCr/hmuAl37uPOQtT8Tebd4XmGE8t3gvl2OMlAYezYPzq9MgfLSkZAH3THtes
         egETNXwJIWmcHbLfs1S1YP86E7nIeq0nWx3tQfNu+e7jGj1GLMpr5jG8Q4gcrY4GLBZS
         x1fYnQ+BXkxWFTJn1fgjdIZaYJQJkkNH/5ltuD7ZeNc46whExTec7L3lBNh5++ZFmyUI
         hS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519434; x=1789124234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08F2XPDmp3MN/acIJE0scEdKBWxNouhbbHVqjQV+qoU=;
        b=QyecDYHgkyRoN3WJXzVElMrgeHHAVLelX7p84US9daymc7hphrjcXYLLgh9jhz6gwT
         nuW0PzR0IT86j8yaxowu9nIYcniV3VQMNouTSlF8voS59YVh5G98SKvg9h5WCuiA2P6w
         sqJadJ85OztmBurR3MaKzKz9UkCIzp5lQY6ZgLBnTQVUpjiJFo5F9f5K1HrFKnZ3xEVB
         edcSrAcQC005w6Vgo35Rg/qdoDqlWAicSuFNN+9h1HDEy5NVeI4CsXE04GO5/VLa8Y3Y
         e+TDxnZvg6NeCWSG8qW1YXLoRXehM3jrWOg4a5nd0xtjhWQKsYN8yY2bDEBhSFZEm+EA
         SJfw==
X-Forwarded-Encrypted: i=1; AKwUvBysjhUc2Z4StlZ6d5BTkisQa1N8Koom7CNqR6nmf1/Wjbiy8wPfMg6xAQ5jSuPpEaSZdbTViY/AJX5bo2g=@vger.kernel.org
X-Gm-Message-State: AFuF++leYLvwGtKKxsssjEg1jvYXOQJ1yB3tAHW+9zXi05S5Lu+zAN+t
	y5Mr0kfJqVvwn34tBUAZ56K0JKG1R62+RNARJa8x5Fi42f29bDsXTt/VCpPsV7eolRQMtRMh8jq
	SAUyweL2oZPPHQ30WXZ7Qg1gMTQLdVNnXyw+kXMgeYE7tkGH0Zmowfbsztjzox0BZ0/M=
X-Gm-Gg: AYBFou33qIlgihB4I0zq+vPpQqD+W2ZMyvoh5DkoQdGN/twj++FD3sPwXNGJ+AK/oWu
	7+wYno2BZKeTAyUdEt+jXaESzS3YdhpVCIUKIlYbjsiUBGu3p4ZgaR8LldLx7LHuU2hQOxLewEz
	fiFhiA6/XKRLUnP3Wwz2smdskXWDqh4tU6XjaOi4LYCY4Oaovg28GFwhHsvkmTy8tU2LgKpiXKY
	1O/EMhhLW4k4dflYaBBFuRsTCf2etvOnZJQR51FwfmwNZEnYbmDiUNvv0q4klBgQR36O2F1/yb/
	9biiIiYEHIPp/janlaognNXPgpnWd/90wiR8Y+8n0n+pybmAYqCmy9DjZ98iIVQXPJadyOR1Xls
	osSk/sZcBGDgM+g==
X-Received: by 2002:a05:620a:404c:b0:939:3cb9:553d with SMTP id af79cd13be357-9398048b9f8mr469253985a.38.1788519434507;
        Fri, 04 Sep 2026 03:57:14 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:939:3cb9:553d with SMTP id af79cd13be357-9398048b9f8mr469227285a.38.1788519431160;
        Fri, 04 Sep 2026 03:57:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm6543474f8f.12.2026.09.04.03.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:10 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:57:09 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Simon Horman <horms@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: clear dma_conf in __stmmac_open error
 path
Message-ID: <apqkBQJMqHKTUxEp@lore-desk>
References: <20260904-fix-stmmac-mtu-change-use-after-free-v2-1-91e680476921@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1MazB2LUUx/XJQ2"
Content-Disposition: inline
In-Reply-To: <20260904-fix-stmmac-mtu-change-use-after-free-v2-1-91e680476921@uniontech.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5OCBTYWx0ZWRfX1YYYI/gwa2bP
 mWKcha3tFrmQrT+zseXmbPgXXJzD9fG7xpVrul+mLQAa9enFl6wiYHopq0OQzuMy7fX7ar0qasQ
 GP24B9p1KUBsI95bNwkYNsQXFEZOZVo=
X-Proofpoint-ORIG-GUID: 3SG6IS1ap9fws-PsPXPeyYh5CC_Mxx8G
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9aa40b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=iHwBjlyiAAAA:8 a=SaV9t1am_M5Vh_LyuNUA:9 a=CjuIK1q_8ugA:10
 a=sX82_v1_a9lhBkuKYFsA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-GUID: 3SG6IS1ap9fws-PsPXPeyYh5CC_Mxx8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5OCBTYWx0ZWRfX6ZiKkU3L8W1p
 +3/RPOQBiNgzlgb0eR+GWtkr593f2WzqiXI94wD9px97LQJFfirhNPeZxA9gKPtEeZSBuXyzeEy
 MFgysxgLcRbSI/o/LBkLXXpg2vgqXF/523tBMT3xiQi/G250a63PYfpY7lCZ+7XNM+Z5mxsCWaz
 EUjVW0JvmbbNaPEaonkfzeXJNzI1zjp9nJlxTOVkmac/l2jAF2JcGMGJ+s0Ykilf61WsJ5FNomB
 4g4FdcLoyvq8G3K2rjWpa80vFUuTCsU2siiJMFrt2EsIjbK66FMbWraXyICf+hod0vqR0FRqsrA
 Kd7+xcNXIED23wbjSGne4JnnX+PWs9CfStS7tJGMaCj9nr3kSkdb3HxCCRH1/ftxNngj8zyaAxy
 f19KJFlKxgjMHAR4dEoVbx75oym5fif0e/xVijApyPIvksKTKXdiG89PnTDj8C7jRrw5hYXzI5T
 lM/xFYpF7O1B2sjkW4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040098

--E1MazB2LUUx/XJQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> __stmmac_open() copies the freshly allocated dma_conf into priv->dma_conf
> via memcpy() before it can fail, e.g. in stmmac_request_irq().  When it
> does fail, the callers free the dma_conf descriptor resources and the
> struct itself, but priv->dma_conf still holds pointers to those freed
> resources, a use-after-free that triggers when a subsequent
> stmmac_release() or another MTU change releases the resources again.
>=20
> Undo the memcpy in the error path by zeroing priv->dma_conf, leaving the
> state consistent regardless of the caller.
>=20
> Fixes: 30134b7c47bd2 ("net: ethernet: stmicro: stmmac: fix possible memor=
y leak in __stmmac_open")
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>

Hi ZhaoJinming,

I agree the issue is real, but assuming free_dma_desc_resources() always
tolerates a fully zeroed dma_conf struct seems a bit fragile to me.
Is it better to use a pointer for priv->dma_conf that we can set to NULL in
case of error? What do you think?

Regards,
Lorenzo

> ---
> Changes in v2:
> - Move the clearing of priv->dma_conf from stmmac_change_mtu() into
>   __stmmac_open() error path, undoing the memcpy() at the point where it
>   was made and covering both callers.
> - Link to v1: https://lore.kernel.org/r/20260903-fix-stmmac-mtu-change-us=
e-after-free-v1-1-c81dc7d6d18a@uniontech.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24656b35350b14454fb10deced6516eb89e2c0c9..4369e64faf9f878aa20ac5075=
705044f55c5f8bf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4190,6 +4190,7 @@ static int __stmmac_open(struct net_device *dev,
> =20
>  	stmmac_release_ptp(priv);
>  init_error:
> +	memset(&priv->dma_conf, 0, sizeof(priv->dma_conf));
>  	return ret;
>  }
> =20
>=20
> ---
> base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
> change-id: 20260903-fix-stmmac-mtu-change-use-after-free-693da6eb4a30
>=20
> Best regards,
> --=20
> ZhaoJinming <zhaojinming@uniontech.com>
>=20
>=20

--E1MazB2LUUx/XJQ2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapqkBQAKCRA6cBh0uS2t
rM/dAQDZOoJDs5HeJVYmNfdj9lanQiEx9EXr1USvD3sf/UejtAD+KxxYvB/7Bsu/
1P09VTIKMhSBbGLdyJNvqrrQNHSSOQc=
=8C6m
-----END PGP SIGNATURE-----

--E1MazB2LUUx/XJQ2--
