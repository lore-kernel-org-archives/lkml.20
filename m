Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365773E63AA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893591; cv=none; b=OqLX+Hrcc1aGy3aUd8IfRYrQ3X/lIUmi7EYrCWShJ/xK7N+HLRHqbXm9AV+cCmuOVHS9sL6Y3RTb588BN80F4sCtqAGx65n86pT06vPOyesPsQiBaaStckpKDTsoqz9z2iE6PMwDJieT/l+JKeBpJlEMG4j3ZPn7Eaj1u80uWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893591; c=relaxed/simple;
	bh=AEVzG3BZZKQ7YDpiXhSDIeW+q0FP+8c46hNGmBogobg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaUbCgTBXUGUFzz++1zzDlrWiA65Y+r5NkrB73E4999s/Q6KthdF02iNYRed2OnUf0GFy49mOydC7jesRMqM4mqC8BmLe4/Ig5tEo31hG6gS/bb2A2y4SrR2+ik/rumbNcxDaEC5+rMsJt/fLimmR7FE+r0DvsiOYJJ+F/2XGRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbmYetsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iwp5EkXB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbmYetsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iwp5EkXB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VkQu3047982
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2AGAP2Ybmw0L7jOZJjvxtsmn
	LMJVGg8ukn0BH3Z2m38=; b=EbmYetsuXA9InbIe1SWN3OR7BiVZ4a3X8RJgVnaV
	+1WZFbhyVVg9phlno0Fi0kZuD+Ro8v2kNF14xyTq3IV71pJfgqeQXD6a0mn4ag49
	keQ4ibW5j87Dqcr0xfyPbnLD2I4Aolnhu5He0lwPgpqBRc580LAjKZmHWs3HiPvT
	Y7wlVro2lGOuuOW8dB05hikiOZUz5nTRbcjk0lJmad616dI0iKCXQ1yjoNxgYMsq
	ZCy8US5c7XyxvORavdCKc67m0z9k7tZWYxMggSvACs/OrxJ67293mcM5BspNoHcs
	R9wEFcVi0kJh8+OAxILSDBzGfPgnAZpJgrzDYz4m2NgAkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f2y3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:39:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso302700985a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789893588; x=1790498388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AGAP2Ybmw0L7jOZJjvxtsmnLMJVGg8ukn0BH3Z2m38=;
        b=Iwp5EkXBmlVF6EbI55DUHRRm95KGj0Z/SsKH67sAQ372VinrfNKV9Zlj67yDk15jcO
         KuKk/+Xn6cD7B7Gsp1V8bl7CdnjQBrF4nhHu2RAQTcJuuC4OthSR63JpsCL2WLJ1+Ruw
         8409XCO4aoIAFT0JJPg/njFRvxoH+5iK1Wci8B2GH55L6LILEAtZuQvV5VFFYw0go+Sp
         UqjCFzwJdHh++dHW2v1uA0JLmI1psXWJzarjQEbUbrlmxlQMHwfC2Vl4MsKW0TS35/34
         6Qar+rmaENOu6ykI7VN+2TXm9m1bTEFN++gPRdo/JrkoJvBmdtHDb7QYHasIcjugsAq3
         uaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789893588; x=1790498388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AGAP2Ybmw0L7jOZJjvxtsmnLMJVGg8ukn0BH3Z2m38=;
        b=sZQeA9cqgDjzp62R4R+2/z9TlB8YRQ/H0nBkOT9lAGMXd332J4Sh6Pls/OQJHyXkEl
         cHTtEqIXM8HMD0r6WY8c/HpvhyCqBbF150igjjb998BJKK2LMs0Y+YkbniKFgArNPD8u
         B7K8EPcIJtLOmfyk26QYw5dIZbKMVsNl0ryhmvqKxWuY9XArJ5bRMxIalyDPm9mmRhxO
         0GqWoPVvByAq6hDWtyNp0BMumoJGilR2b5zfAbhGliR1EfGeApRofzImFeV94uzVtBzL
         U2Dey6NyodA8ks8IS1VmRW8Ps9ri3BVEz31tSyw5ckalU5L9mAxRg+8Dj2W1pj9V9yHl
         EuJg==
X-Forwarded-Encrypted: i=1; AKwUvBzYBWjQXRUeM1AF2OtQuYSeEU5hCEHJ+W9zdCXdNYNkbPPwchVTTg0MHXygVhf/CEG57qWBLXRpP9hIIxA=@vger.kernel.org
X-Gm-Message-State: AFuF++kri18VbumL6/n4hJb1lV0Ckoe/Tcu04YMCrchGmdo7JbhpMwkl
	mSbVUbl5Sqano2mRXtyN6gcVRzbliXUD6ALwAXwNnIZgxtZYsSujYNAnJfAh+x0Ur3QbKZ9cDFo
	bxaE5ijL5pVYvTQ/9hawM0hM4vcxdp0DGsZoEuvlUgNE2cZixEAbUOaS1dZ8NH9Ox+yw=
X-Gm-Gg: AYBFou1Ma0Jm+Rr4I46ls5nGXHa0y8Cz7FNs9DRoHLCQpGPSpFltsqHLt9SYjc5+Nrh
	wKEUymIBR5b+Dcmn1ZeSCQDuaKynaonl+G2i1WAGYISFzj4UMKti84odHoCTqrEOK4KE254LwyQ
	cQTb/n8ataNoJYmSKj1M4Mz58W8ZbHTzbys+PzDyu4QOvGOENRPSGQDYX9Op8IcZgmV33rX6Mqi
	yIRfmgU76cjv6NdBtmkqr7N4ihZIBIiB1QmXwVS2SngFOOosq/qwof1Fb5oReZlr42AEBAE90SJ
	tDWX6hKnOGHFZqOAu1wEltlY5d4FwtcFZkSLuhYM4+LbZc+l8k1oJ4lojlO+IB1NDLsZ29jKbhA
	52Ryiulk8hIcKQg==
X-Received: by 2002:a05:620a:462a:b0:939:3b56:c416 with SMTP id af79cd13be357-93bf5523983mr486566785a.8.1789893588231;
        Sun, 20 Sep 2026 01:39:48 -0700 (PDT)
X-Received: by 2002:a05:620a:462a:b0:939:3b56:c416 with SMTP id af79cd13be357-93bf5523983mr486564585a.8.1789893587744;
        Sun, 20 Sep 2026 01:39:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm94919145e9.4.2026.09.20.01.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:39:46 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:39:46 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak
 when the PHY clock fails
Message-ID: <aq-b0sgCy6ILmWSc@lore-desk>
References: <20260919174223.2356964-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLE8aJHE80lsFHy5"
Content-Disposition: inline
In-Reply-To: <20260919174223.2356964-1-coiaprant@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNCBTYWx0ZWRfX+I6b90powqxM
 iA/0k2Uy21bfdWxAdTsETguikDFSUdU/lrQ6IzROktLfT4YFjieBhPwzzNBR5SQP4Cmbfcfu5Aa
 KTHf3r3XJZVrYxmE3etnMljeHezs7gU=
X-Proofpoint-ORIG-GUID: bvL7t-_hvbOT4Vcgumwk2fIJdnb2POZf
X-Proofpoint-GUID: bvL7t-_hvbOT4Vcgumwk2fIJdnb2POZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNCBTYWx0ZWRfX3GwX23QyjphM
 gdj2z6c5fnpg6P0gif6BizEJ2p/Wjbti26hrAK4XUlw9V5mTSNSi4GmrGXArADHDldCRveXylR+
 qinJlsyyHlKw8OKoCrko4bVMEjyFUbZZNxQyQOor2zbB3P/AYeoAzoBxU7pGaBKSQE7E5kugqq3
 p95HuYfCK80+5aYJlHj7+XR8+03A2hYq5d1ifHDSpExLE3EO+6wWQ4EdJmzZE7sEcNRVfMqQ9jn
 cU5/qYPSh9iMIU0ZJpMRRpdNhgywC+Eo2zumaL48hUn2fplSPdnzwcEEoCjzNNmvdUdwgPBtFZd
 4laxLZ2kRY5Y9IUgCwc3x4zQQhVL6fZA7crtlM8xfqPWRyg8pY79wc/V+EJbXIynhC23yhXEKr9
 KGz/m97lBpny2H+3ARug6Log2dMgwYjB7UGXrw3D9cGIPAFhcPx1s6vtnQ3zega1R33814JhZDy
 yzgnLuu6kvv6pxByIMA==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aaf9bd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=xsftiwRyr5-5OFJR58EA:9 a=CjuIK1q_8ugA:10
 a=zIhQHG-rzOcrLlsejY0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200124

--lLE8aJHE80lsFHy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> gmac_clk_enable() enables the bulk clocks first and then the optional
> PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
> returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
> stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
> no-op and the bulk clock references are leaked.
>=20
> Add the missing clk_bulk_disable_unprepare() on that failure path.
>=20
> Fixes: ea449f7fa0bf ("net: ethernet: stmmac: dwmac-rk: rework optional cl=
ock handling")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e689261..f3a98bd9d6ead 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1163,7 +1163,10 @@ static int gmac_clk_enable(struct rk_priv_data *bs=
p_priv, bool enable)
> =20
>  			ret =3D clk_prepare_enable(bsp_priv->clk_phy);
>  			if (ret)
> +				clk_bulk_disable_unprepare(bsp_priv->num_clks,
> +							   bsp_priv->clks);
>  				return ret;
> +			}
> =20
>  			rk_configure_io_clksel(bsp_priv);
>  			rk_ungate_rmii_clock(bsp_priv);
> --=20
> 2.47.3
>=20
>=20

--lLE8aJHE80lsFHy5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq+b0gAKCRA6cBh0uS2t
rCAUAQCj0yfpPfa6URfV93oy7BQLAm5/S0I5F+E5Bxs9H7YvqwEA0d7mRWgJU5W3
57K2prdD0OU/F5c69mDQ0MLisskqwAs=
=MXlj
-----END PGP SIGNATURE-----

--lLE8aJHE80lsFHy5--
