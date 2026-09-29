Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128439C657
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666017; cv=none; b=ZhX+lsnpUmkdVAqbK49Zo9OPRfPtL7+4IQ+mvXJNO+d6rL7aCoFC7F8QZp552MnNxJ2u9JB3cC0DA2/TZUk1tjvWgq9g2dw/Ixc/d0aMWT8rCzBQOteHeVhALHThurnnEO+cjFJvps0C7T9Mci4icp5NfzWbjPj/DwK1y15KZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666017; c=relaxed/simple;
	bh=OD/2Z9i5FlYVANmscJPSCqUoHst2gkiQD2aSmRFY5y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBk5Jp7hTC9JvZSxlS9KANIyuvSPbqEJtmsBlEelK4og1NZDJGQXJ0M6xVZ6VNQTGmtGhBSwvKXFiGJlgK7023LHDa6eG+UXIgCyWNw/ihzpab578X5bDc7Z95mUi63vRASxvLj45wdXlHV9BAZShbSaZjxJRsJAaeqvcz7MIQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppg4JIaN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayq/Caop; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppg4JIaN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayq/Caop"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Ucf2991431
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aRA7DODR2959lHEtpusPTNFu
	ptGLf/zMYDjv6njZNl0=; b=ppg4JIaNJrD60qPhc3j5QQ2Br97bfPxdFzjvjiAH
	wVEg2El/VgB1E8kCP2fxP2I+Bb8VSI6MgatqI5IKjhXWtaeY/LK1d9vYP1KKLmry
	jOZ/m8gusaZI7lLOH9Qv8iDEJfS56NdIbO4fRANNs5+O31eR0EAQGLk1dEEM+w4b
	SoAk2yyRrN5k5eZ1PYf3B2Jz9UYqH4HMzpxe8C9t8u9f54LcBRJw4zMr0FDHjnoX
	BLZZrFNxjAktdirKEzOC3XZWk25lJLXwD2aKr13UFF8Jxo9OGH1aF492qZGEfUqM
	uYy6NVQ5IC5zkBO+dIifZKY1hE5wuLx2L7xPazOfkrTsDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnaqk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:13:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c444b438aso834306585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790666014; x=1791270814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRA7DODR2959lHEtpusPTNFuptGLf/zMYDjv6njZNl0=;
        b=ayq/CaopsnaAu8Bvndioau0ZnOZQEQQ/5Stz609XV2KRJXObQYDdI+EUL6/urxvD3z
         Hw8A3aRh4CsFWhaItAWw5ucbkmerHP9qlOEI2afZSxs8xZP9VZX/s/meWvAI0GEg056L
         H2EmekYNj7bQ9CmLIQx43Cpointkbd6+Yjw/EwCQ/PROB45KBvv27KhDwGR9Gx7fP3fb
         5GxSShSq52p43uy2Hlo/h+DgxxLvjD5HalFOtSeIcoaASx4+iYts59dCj3hcT1R8AwGZ
         j+yW4mbhRGJspJxULnjvA7XqqSfxQ+xqtCySjGiajaxCZ42UCECpMJQ4WUauHHSiWYYQ
         s68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666014; x=1791270814;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRA7DODR2959lHEtpusPTNFuptGLf/zMYDjv6njZNl0=;
        b=EPUebxD5kVUuIlR6+uS1uXBjNOwvULEmOzAeOD+CEL1c1z2xX5zzOYfQCFSYyCm+qL
         EHJpDOdnQyNLW9GNwdgMG2T7L6ybRndi6mweIz8HLbaMjHrKCU2laTckYq4PR1Vywkc9
         j9gg6iG/vPugUpBypvIHVJiqRWRFQuUcStx0asgueL40AGPgCjFl2XKIfeeIJqJ3t8Ay
         edMdWG91RWY4sjU7ZWaR/Olia5MVxRKvSN/NUIAiF2j9nzasjj17L17P6VC8y4xfhR1n
         0/8UMmTWF3aWDM+Vcm3WGJuBouRQhY04BJXvHowDVCPGSVCpgD5VCkLrnseJAbTdnNfy
         Gpjw==
X-Forwarded-Encrypted: i=1; AKwUvByfxjYtXA3M0JSABJXjjNpqy4B25IqnOjGUekEwo9A1qXsen6Gdy/XFffc4t7dElE1d5J62TAYX4WiSdSw=@vger.kernel.org
X-Gm-Message-State: AFuF++n1zCKtN2EyJ38yJVmFkcUlXIGxP3/SCqBMrJBQwXNTBS/4wDWu
	J2Vpo03NUNAzulySh4sHiCM3rQAY0GxlfXKXYjEMWdyDJtDAV0Hr/Fod6b64jl/qy9TSEHlElQm
	2RPCnQYuhTyGNEJubEBTBMlGqrhQQMSfoqRAKILAowigz/sX0dSkbsozNA5Pg0ioU1LM=
X-Gm-Gg: AYBFou2QDUeosmd3Iza80EaXnxRb0Nksce3ongEf2zjx/hxYNOcrIhL8LgQObZlo7qG
	4q3vAZbsYtObDdz/IL9SARgBOBzcr/XLHjBiLSSshz/Bj86xWp5HhcCKSPw3ykSaas+anF+LsIq
	AWCZSzgL48VsIv9cHDNuwZeGBqREbrgzkXPpdvnYoNPdWdnbTBZxTG5/cblSkWlCtSqESOmfUyc
	oUtHQTtes71oIB44+mRe8it9w0tpfXnjNHgA87d+6XmDZCiHp4WIvqsf87HAVxpoNzkITuYrCHV
	+QBPSW20cdwW2ct8MNGBxrEQ2l5q6MQdr1eNHnXtI1T1ex5kZsDx1bXkkXyLA2MA7vCVmtGeZCo
	rYaWBxkhIttvNHg==
X-Received: by 2002:a05:620a:404d:b0:93b:ee1e:6714 with SMTP id af79cd13be357-93c43d2359dmr2340390085a.60.1790666013984;
        Tue, 29 Sep 2026 00:13:33 -0700 (PDT)
X-Received: by 2002:a05:620a:404d:b0:93b:ee1e:6714 with SMTP id af79cd13be357-93c43d2359dmr2340386485a.60.1790666013318;
        Tue, 29 Sep 2026 00:13:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af507f33fsm1745638f8f.24.2026.09.29.00.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:13:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:13:31 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolai Buchwitz <nb@tipi-net.de>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        thomas.petazzoni@bootlin.com,
        Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
Message-ID: <artlGxdHjIKyuPuP@lore-desk>
References: <20260928145043.1228968-1-maxime.chevallier@bootlin.com>
 <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlNQx2lngAS2JeLJ"
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
X-Proofpoint-ORIG-GUID: 5Wo7rvPWia_RCNXT4lMB18aoy-oMqbeu
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb651f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=8xPVtbtLPbnhiEF_wpUA:9 a=CjuIK1q_8ugA:10
 a=pZA6dvReJZDbMZWyEwoA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfX45GdR0Rlrb+o
 7Kyn2jgTvsfpyj4gmTFecffPidlj68tYpkNur5LRz+B4HlLfNADHJyIiFm10lO29nqGvW7xvTQw
 NYq6Q+2ylBPz6QnW7miGBUv5bZV415a4ho9RgTbfyoP6pkFoYwZODPohKF8lm75vgIJxzC+iQp5
 hutC9h1o6N8v2TbPQnxqx04dsFuzCwLSiKVHZfrtVbM+l5liRPRaEKoV/RQcr0jC1bcmFNsPPOK
 OPUmmwQUHBJ7Y4TFKf3zg05MXOAIfV7bNJw6czR/twiLYvwkB/2rz7Onr4z8uqYhUWb9i4NoCvC
 RPx7X3UQ8UHqaODM0stdHUFxH+IFs7+fVihIC0KCS8UyjvXUEJJNwRU2R46fwvm8stJq7fGMFvx
 Y9rsdqFw37iRx0nTuUypntS7NMPgLFxvj+Mi6QCi+f7CTqBfVj/Q/CLJnQYAQGT3LP9BzMcB5tN
 B/oHYTai/ck8IlJMgew==
X-Proofpoint-GUID: 5Wo7rvPWia_RCNXT4lMB18aoy-oMqbeu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyOCBTYWx0ZWRfXxXdNd7fDSqaB
 ucouspajd3BlwoCdaAaMfpMuZctNBCKchKdHRqbjIYKz3QnN1jCWLKd9E6k/rTtvY62HJOszZ+w
 aRtYAVKcwgAIzftfswN6nuZvWKgl4eo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290028

--UlNQx2lngAS2JeLJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
>=20
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
>=20
> Let's return early in the rss ops if we know the hardware and platform
> don't support RSS.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drive=
rs/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 154cc0c7623d..b78dc301d70d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -927,6 +927,9 @@ static u32 stmmac_get_rxfh_key_size(struct net_device=
 *dev)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return 0;
> +
>  	return sizeof(priv->rss.key);
>  }
> =20
> @@ -934,6 +937,9 @@ static u32 stmmac_get_rxfh_indir_size(struct net_devi=
ce *dev)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return 0;
> +
>  	return ARRAY_SIZE(priv->rss.table);
>  }
> =20
> @@ -943,6 +949,9 @@ static int stmmac_get_rxfh(struct net_device *dev,
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
>  	int i;
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return -EOPNOTSUPP;
> +
>  	if (rxfh->indir) {
>  		for (i =3D 0; i < ARRAY_SIZE(priv->rss.table); i++)
>  			rxfh->indir[i] =3D priv->rss.table[i];
> @@ -962,6 +971,9 @@ static int stmmac_set_rxfh(struct net_device *dev,
>  	struct stmmac_priv *priv =3D netdev_priv(dev);
>  	int i;
> =20
> +	if (!stmmac_rss_is_supported(priv))
> +		return -EOPNOTSUPP;
> +
>  	if (rxfh->hfunc !=3D ETH_RSS_HASH_NO_CHANGE &&
>  	    rxfh->hfunc !=3D ETH_RSS_HASH_TOP)
>  		return -EOPNOTSUPP;
> --=20
> 2.55.0
>=20
>=20

--UlNQx2lngAS2JeLJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCartlGwAKCRA6cBh0uS2t
rJCeAQCl/sM1/UiVOqNd4jhL5Oy3pU029vOCKWXEOSlJSz+XZgD/d+i/oeT18HiZ
DpFlaHzEx66iglM4gU7yoatpOMjQPwc=
=kiG3
-----END PGP SIGNATURE-----

--UlNQx2lngAS2JeLJ--
