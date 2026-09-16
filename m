Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58DE15E8B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542098; cv=none; b=vCaPT3j9yHM72y5L154ozhwecDGxKxc60GGJPpuRcEKXqLuD+HvNCLeycChpsLjvr41rAlxw2WajXH7+reGKQ6PdHH1rimCWxVz5FPMdv8bc7Z6StBBNmRbVdm6q//5h15pxKVuXtJV2Ig5QXPK7pVOCyM6BcClBYWN2X0O3hFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542098; c=relaxed/simple;
	bh=/uXK3nBPcvOluMqRdbUimf5jbPBZRHH3dsYrxtCj4x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6/C9YC0cTNTUsZhQ9D+/KkXL7aShFJZtJFbGfcT/bWaWra5tJlNyLBtQpUDP1z+SMudjzzgpRJT1h4plLKnzBl2c2HgbWPWwZ8p4RBTEizocuNwdXJsqYpysZmyeRPMmaeNOLZH6E04dxFRdhuGAu5gY5wgwEOFtu0ZaK1UtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWMyIdc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7S5tU6m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWMyIdc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7S5tU6m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68dit1730500
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Ut7kgm3lbIbgif0w1qtAKfZ
	wX8AzmJ0SyvmVTj0gdA=; b=bWMyIdc1uc9hXJVKe6ZNjVUgWVVhrdlwyggBXLCu
	8Kec5D51yYBYDR/RNHQXVGOtgTZMcyBsEtUzxZYUh/KTZzTpqf5GyiO+n7yzeGAo
	z34c39SWYjY7uVEsA4e+YfLRQOMxdO5XUOEemw75NpETLdhekixFXAAxRWpoP8jp
	yCXAq3GL8FV1NDi0pIq3TcN1qaPa+ZdT7Gli+FRte3GfXTuL1PdlFTyV4Qt1Y0zv
	MfTFO5K4zAccldwD48CSX2coflm5RF1CMwL9yc/H3l3dHSj5soWM9fgq31L4T6Qh
	WrrkpucoQ2iY6V3l/HAwb8je7Ir91nE0PcTyoiiLaVeTpw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7gp6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:01:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so3660850241.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789542095; x=1790146895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=;
        b=j7S5tU6mYldYkTjB2iR39+z5FtQPBbyo0tAR26DV1afCbaX613/KPJeB3YUCiVDtal
         wSJFTGtmNk6NpKhYwNNGK5xc6ns7RGzeCHOekDfNoT0sdQwCI/dh6CZWFC8JIlFTNotO
         SNMPXeuvXAxVYWnDbGr3LMLFPHcv0EeWUnQBDAFh20G5Se5z1iywly6+i8U8yVkQW7Pd
         rrRFPyOQwOuqgGrKg5xaqiPum1K0yGOtk2KGR+lIayJoF0+McsuY8PJAkVV//mrtFbfy
         8wWrn3BWw4dSgWVsWW/knD5+h5alJn0eFK+M1NEa/UYNu+OvdXGTRJHs78ZVtvdtklVl
         8MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542095; x=1790146895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ut7kgm3lbIbgif0w1qtAKfZwX8AzmJ0SyvmVTj0gdA=;
        b=TmOJZAwzmDTZDDKyHyDycCcRicUtPLZV2b3dXfogMwkld7+T871WrZB/5FSL6r+c/f
         I12szQ+IBd8/3N5+KNlYu9o9hjGlhilTQpfad1NepdsxJyi5RJ9CTJxobcHQ8vCQyLSe
         ziGFE7cCccZHnYNZK/OIkvSpEKvAynU2gka/xPwB6QlKLxxQ8VorlRL4Tf61a3Nja5b6
         V2J2VlQ3h+mIKny6s+yaI14u4MFP8F1KepvKnzm7oh35ofOq1MhS2bVpSdDpjUERTHZe
         OauEcRE1Z/cufLYiJJ8UtvDmToAk+9sTpjVNBeZ2rUeL8dVD/eWPrzbew3S1H/qAz2mj
         ueYA==
X-Forwarded-Encrypted: i=1; AKwUvByTIutErCTdx9aDEFQpCU07i+II2ZpvJr9dTD67S4dFGIHi1zsqYLfI2D8INwpTXVnIyGMNOUdIorklzak=@vger.kernel.org
X-Gm-Message-State: AFuF++kwV3BeANIaBRsPiTjPry77vk4OgqliBPuhMwlbpH5MJNdQ1WuP
	iwNGtKpylHQ1qaBwDkEyKQejb/MeuLAKQsBA0SO8cw+LcqJkP871M60h9hSr0q3q4wotETTluv1
	4bUZy2aeIT1eCZSBnq1suq9EPJHWRURqu1FiR85eeww1UYZkUseMJPjZzMd7QBm7J1CQ=
X-Gm-Gg: AYBFou1jln1xGIuwZ/8sXYv+DDO5Y7H4AozpCYWkg8LerObUTAMDNF/+g/dUrxFyeFB
	n+FuWmWZ2QauC77AtIM2jIfO+xYoi3Hhrq7DlHORf1XBEh0LnU0IwX2wZG5KyU0X4e6mpsBH/hW
	mbMxvoYkamzZOj+5R8jS0nPKEAvK8IIWrsP6kt8KCw/uaspoBDDiuE/KbI7ebNXhgYiDfpD7QmD
	tWS0DHDqbGq7Epbb1vbQ/bx4ziqajxXXhLNYV/E5asg9ye1FL+3BOuFCRJuRQOrUV6InG7FkCy+
	VtKjOmT+fM0wYRpBpkmJYrSKmiKawVlnaCP4Fg08OPUyz48atvvZdie2r1CJNXKGujurwhZusBc
	C5g+PTQ0Cy4aaPA==
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr1487028137.1.1789542094471;
        Wed, 16 Sep 2026 00:01:34 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr1486975137.1.1789542093963;
        Wed, 16 Sep 2026 00:01:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ed292fc12sm34571555e9.15.2026.09.16.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:01:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:01:32 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
Message-ID: <aqo-zBZDb0v_20w9@lore-desk>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JPSBXS7aDo/qX3Vv"
Content-Disposition: inline
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-Proofpoint-ORIG-GUID: gfzrsu9COwE5jeNhmA5RRmn2V8lGorq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA4OSBTYWx0ZWRfX0UEhWDrb9o2n
 ZIF9f0WYKv5+Dj8TJc1rFXxoWUyQ2Q0eWfjtta58jqoFqs3RcX4L5AdiZJaQgVwlcW0hozgIi5g
 eyeR4uBt+XsD7NkW9CzqApykPAKQX5tN4qD3UrWdRMolpWgisteo921hFgDKq8GYzRYL/qYS8Ft
 xl75Sw9GlZK34HOSJK1dHbiKC+n7Q0rvCzQejYBOdGIh36Ll+Uy2ChY603Spen9VkJgCFlCEIkS
 DU05p4DRmOaeC8DnA/A3tCZxVACkbYvXPHvtzpRNED9+LnQDvEpGR04PRXU+aawvy4rFjW6Cz+o
 gajRCgg1aNWeINfkNU9HYjorkoswAc4CwQo5yhL3KW5CU48b7WOtss5g2q4ePq03mmWRlDdXje5
 0CaOVGArDcQ7iK6pZLvQzbkkbx671bKF701maxpC4q364knDWkJ+wFax7jZfrNoVC6Mz9xUNZM0
 ib+J7mTfw2HIojMFMQw==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa3ecf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fix1ya3lApHd03os7AAA:9 a=CjuIK1q_8ugA:10
 a=NtCxNmvqVL2YQJkQa48A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA4OSBTYWx0ZWRfXwxR2/IwU6ktq
 H9/YJvnvp0AxEFLYvpCBKUyqu2j0SBZAsG73bFYTzQOS5rIYJs5aXlpZ74wJQ3X3D65eio0raio
 vcAm7YkVV9GXTPTPXmkXS6hJDCy6HeM=
X-Proofpoint-GUID: gfzrsu9COwE5jeNhmA5RRmn2V8lGorq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160089

--JPSBXS7aDo/qX3Vv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mtk_ppe_init() initializes the l2_flows rhashtable for each PPE
> instance.
>=20
> The probe failure path releases these resources with
> mtk_ppe_deinit(). However, after a successful probe, mtk_remove()
> tears down the network devices without calling mtk_ppe_deinit(),
> leaving the PPE rhashtable resources allocated.
>=20
> Call mtk_ppe_deinit() during device removal before freeing the network
> devices.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 33fc42de3327 ("net: ethernet: mtk_eth_soc: support creating mac ad=
dress based offload entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.c
> index be3bd025c41a..04d0a1eec4cf 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5394,6 +5394,7 @@ static void mtk_remove(struct platform_device *pdev)
> =20
>  	netif_napi_del(&eth->tx_napi);
>  	netif_napi_del(&eth->rx_napi);
> +	mtk_ppe_deinit(eth);
>  	mtk_cleanup(eth);
>  	free_netdev(eth->dummy_dev);
>  	mtk_mdio_cleanup(eth);
> --=20
> 2.43.0
>=20
>=20

--JPSBXS7aDo/qX3Vv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqo+zAAKCRA6cBh0uS2t
rFAWAP9S+DvP3rvVFwcvFbsCuUr8lmqmNv6uJJcrmYWW6kMSmgEA2kxhcWJU0SBx
j5014OQKU1hwFlulxNmz3jzfj8R4dgw=
=eEvR
-----END PGP SIGNATURE-----

--JPSBXS7aDo/qX3Vv--
