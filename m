Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718570;
	b=Fkzf4r0kQwQngyltfxjgli7+/VUc1phbDgXQ4pVuOw0IB6LRrhkdgLoKpCK+GK2LUWjO
	 tuuegFd8BbxorjPJBQjyr6nn9MSbm1MOPAjhLd//eFkCT0WEoySuAjcJ/ZJl8Q3yKjihw
	 TmowDPuQBgEGdNb1hQrWQQWoZWkRv2JDJEUbKcFEsdL+wuJQRmaJAX3TlBHNmKOkidsDB
	 nBu6fqcUbz1FyFwZGbXXKMn9gLo0b9mLTE21/Ji7H9wSYFaqHCBaHb5NdbJAQzXpQgw1d
	 Px78b5KiwSgauXjQcx1/MU1sExZTEFtxN2/QamfCNa957J2Ixux/+beqtM82AHAxUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WtnaI/rE8dqZ2TDAvhFl2l1GKkkDIiG6JUx0pMWVYEM=;
	b=xQ+RlrpuufwlsutrZ4sqgIQPAv/WKv/JKsApz6R/HhKaxb250Hviwx+fyJupnjfw/C9R
	 ICazpBp6580CL9w+ZRoMt9rDA2bPD2jTwn7fc2sCS2ZNK9xQ9falycg5a2mA0oKFhmr1m
	 RM106e2235vEqXdNxPNzMxVdLSVx5G2dZWQ8KOqcCrsRTkBxjM8XLOXHkfgvzm6ivixzx
	 dI9gc8WBZ0MTV0iOOd/pqK0256Bjh2j4bWdltLl17+E9MJTCHdvqHf+jS3sLXSnretGTl
	 xTWjkSpNIZiyme09/G8ABaDu/K8/6sa2IBUgBpnDGlKuTPk5pBginHhOk+C0kyC/+sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsvtV3m1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e/Alcu6q";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE3606B25F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DE3606B25F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsvtV3m1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e/Alcu6q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9pGH4103888
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WtnaI/rE8dqZ2TDAvhFl2l1G
	KkkDIiG6JUx0pMWVYEM=; b=VsvtV3m10nlkXZ186rhLO4fXxZ39IP3M8PkirN5C
	J539yVBBCInCy9QYSttMftMfkEaL6QsjEsnb9/RDBHV92d40CjDJz7ih50M4rz8o
	TK2naZkOM0fmNGNCiBnvZ3wRMdLSkzSmptMtt7GQt6dO/VxnuA9pUe6KgTrW7kzh
	R0d1lIJc1kdjdYm0Z9MTvTJI+WCuCG7Lu0i39aNLYcshkGP4zZOaSiofyfAU+ybR
	mqXdhY7DSz2hhRhMCNgSJaE1dxgY0LiHa3O5GAB1picCaLZawKfF18DSsV0305HE
	OV7cY0xmf588y2vhyX17iBh70D09IrgOB5m8maqWexiMSw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dargk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:09:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc3a482af7so3827657137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793718567; x=1794323367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WtnaI/rE8dqZ2TDAvhFl2l1GKkkDIiG6JUx0pMWVYEM=;
        b=e/Alcu6qJDmoyZvA3VMIJ6Y4UV+/jYlUjqPmAc8VBYWuOMUYY6CJ/r1r5HU6w5rC3K
         PtV1u1pFQ2hq9BeT3sTF0I+a2Dkiqio4lFSjehh2yyUzfdBW55/w5U6bqAwmTSYHTDur
         XykD0qgpx7d3GWLIgAycKDDVPnKUAdhFEBB7SUJvS7GY2Oqb57oxr19JhcpQh38PMsEu
         0z8OfO1yrKl9hs3DP6lCucyqHL7/m3bze+FDL/D7b7tKqHeGtwDHLaBJzKRIFdN+3gsH
         v976mtJD8phwh5nG2zOkC20XNSyxHWawmTrs4lRJFkcssuolLh/fE+mVaOAirHKCw3k5
         R99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718567; x=1794323367;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtnaI/rE8dqZ2TDAvhFl2l1GKkkDIiG6JUx0pMWVYEM=;
        b=kZYcpEgMfOdMSOXIsZT514sLahOqWVSnn6neAGh2Ngqad6TGVGPcaOoM24QM0A+VGs
         RfG95HDJyC4UwedWO+/EyZZae71kKgqVK+d2gW5tLMzQ1GvjWWgytYVs0b2yRneS922Q
         6+gd45kpi1793LYbfx0hUHlHDL/5rJ3fFyrftGcbBF2AQQyYLjRqwdGAkjrRo3jN9mhT
         X1d3Gsgkol2Yg5gLYJtkfQRf2bMXzffceOcQWOjl/ptY5hU9ps1NGJrS6gU35DjpMoeZ
         XIHNxNmZ8O0mTwBsRvNg8dy/7Xbg0rubtMCLJ58gT3spiH/bvX583vx1hR1zg2PhcgV1
         FBQA==
X-Forwarded-Encrypted: i=1; AKwUvBynRQT2D4btTSOYFwuiTrzN2znnhydCxnW3xztPybGOQ1E0jAFpN0yivAbss7ex9+CH/n0LVGJYYM7jRQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/opdpMUeypw4E5a+7vaf9YZYZD2lcmdOtOzdUULh/3rojljB6+
	45xKKFE8D1mktAzCMMygNuXa+io+WctgJyX/S4ChchrlLTEV9bpKB1QW0wPOdG7RdsUVSv99q+Q
	WVB7RXgXILescVkvlvIfY5RbpdzK8Uiv9YJ0tPI/ak+h/Mn8VYe76HS3kEKo1vZV1pKg=
X-Gm-Gg: AYBFou1joFxuJXkMJse54p2RNbzterJJNZFX7vVONtbyggtOKEo1Gd+exJJXD/4B8ot
	OVpe+l2vf6s1xVC2tL6nzZRcX9raB25p7JJVPUt1KBiFURxMcyCWqPCRapQHMTQ4iYyiZS8SffV
	nOBzQ+WeAFI+ASbeiCa6O3Cc7wqp5+l/9khH3zhzV6P9BjKPQm3VriYqWYXi6yJKQ+7YdifqKhn
	mAgtdnppvApPKcmlCKxrJBof2gKidjHI3Ax6NBjLVcNMc1NxCK6YtIm9b6ik0h393vYXqmsJATu
	tbHDThc88hC6/1Njh8IxBjISDjKejnDU42sgJFMTz5L2wpwhITBGX7xywLK55vbGnyyJyMVxpIc
	R6ZyZIFBKH6lHyWkC7rAXXPXNqH+QapLb6uRTgf2m8i32e3Q/PbqS+hG636u6KA==
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr5713670137.13.1793718567389;
        Tue, 03 Nov 2026 07:09:27 -0800 (PST)
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr5713641137.13.1793718566728;
        Tue, 03 Nov 2026 07:09:26 -0800 (PST)
Received: from localhost ([93.66.104.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77af8csm465070355e9.1.2026.11.03.07.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:09:24 -0800 (PST)
Date: Tue, 3 Nov 2026 16:09:22 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: selftests: Add missing endianness
 conversions
Message-ID: <aun5IpJsYPwrnBYB@lore-desk>
References: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="IxJjiVHShnjx8PxM"
Content-Disposition: inline
In-Reply-To: <20261103122249.951523-1-maxime.chevallier@bootlin.com>
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9f928 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=cAAIdyqZgEis9HJxay2Blw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=HEzXNubd1cMG4gQdFsAA:9
 a=CjuIK1q_8ugA:10 a=HiAPeVrv790yWpiQFZ0A:9 a=crWF4MFLhNY0qMRaF8an:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfX4QSkMwcKONT6
 QECe6g5JZ2Zgg6zZWkESR14vWbrZT5lWUevDFn4v00IaMPuKC5GSnqWhEAi8HZoh1RKcwtAES3y
 XMxiu+8RpzHn8LM7ZFJgbEk8NWe04bk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MCBTYWx0ZWRfXzcF8JfW6iHQb
 Zsr014bUYkqMQuRxEV0vlFRMtGw1fvyqeDqEIDMShwLjc9XOXNThX5/eeTpS8nlkfTMGHbrRJWG
 QSLi5qsNcXSE/hC/8HisUjHmZZK9VcB8oJ6nfsJcRIXGnG+ycdfJEU9NPmNObsVL8/Y2OrMY6ko
 wpIR9dSyMuTy1kWMscxoZyReTw8F8cZJ9uLl7LiCRpr921v2GYsYSNAQa6uID8Wf4NXPDUN35K1
 Pt+3VGQBUqG2irTCO0Ko4nLh2ksA1hwtO97724/g0MkKLUB1esPhQ4MKERGwSFrj1sjd2xtDNnc
 Cz0jHAaJv/52tAewcopprUuKiTNTLmP3YWvDV6mGYH8u4pThZW8/9SRns7f9iGoVMtJZRLzmR1C
 +D5J/VVfiU32OcWMThVNsaDRn4PQpIT0npbZsS2N0jlc45cK4khIrM9QF6fxlSXrt9TXqe+jDCm
 0HDS9sRH1mxpqyiHYFQ==
X-Proofpoint-GUID: Ton5GSODN-cfmN6mFbCblKOp6vY1XNZR
X-Proofpoint-ORIG-GUID: Ton5GSODN-cfmN6mFbCblKOp6vY1XNZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030060

--IxJjiVHShnjx8PxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The kbuild bot found some endianness issues in the stmmac ethtool
> selftests [1] let's address these.
>=20
> In practice these missing conversions didn't cause any issue, as the
> masks / values on which the conversions were missing were either always
> 0 or ~0, so skipping the byte swaps lead to the same value being passed
> anyway.
>=20
> [1]: https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@inte=
l.com/
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> This isn't worth sending to net, I've dropped the Fixes / Reported-by /
> Closes tags, let me know if I should add'em back.
>=20
> There are more of these endianness warnings in other places, but they
> require a bit more attention. This'll be addressed at a later point, I
> don't think we have many big-endian stmmac setups anyways.
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/dri=
vers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index 40811df8f2b7..df696e2c1528 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1216,7 +1216,7 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
>  	sel->offshift =3D 0;
>  	sel->keys[0].off =3D 6;
>  	sel->keys[0].val =3D htonl(0xdeadbeef);
> -	sel->keys[0].mask =3D ~0x0;
> +	sel->keys[0].mask =3D htonl(~0x0);
> =20
>  	ret =3D stmmac_tc_setup_cls_u32(priv, priv, &cls_u32);
>  	if (ret)
> @@ -1463,8 +1463,8 @@ static int __stmmac_test_l3filt(struct stmmac_priv =
*priv, u32 dst, u32 src,
> =20
>  	key.src =3D htonl(src);
>  	key.dst =3D htonl(dst);
> -	mask.src =3D src_mask;
> -	mask.dst =3D dst_mask;
> +	mask.src =3D htonl(src_mask);
> +	mask.dst =3D htonl(dst_mask);
> =20
>  	cls->rule =3D rule;
> =20
> @@ -1594,8 +1594,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv =
*priv, u32 dst, u32 src,
>  	keys.key.dst =3D htons(dst);
>  	/* Match the full IP proto field */
>  	masks.bmask.ip_proto =3D 0xff;
> -	masks.mask.src =3D src_mask;
> -	masks.mask.dst =3D dst_mask;
> +	masks.mask.src =3D htons(src_mask);
> +	masks.mask.dst =3D htons(dst_mask);
> =20
>  	cls->rule =3D rule;
> =20
> --=20
> 2.56.0
>=20
>=20

--IxJjiVHShnjx8PxM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaun5IgAKCRA6cBh0uS2t
rEreAP9RquFj7WKKDysqBVQoJ6e0dVIsW1UM/4cQsoIBq2aelwD/T9/Pdxsxz96+
bqDDg/n0YBnH3cZXcJCfxoB/tOAA1g0=
=hOaE
-----END PGP SIGNATURE-----

--IxJjiVHShnjx8PxM--
