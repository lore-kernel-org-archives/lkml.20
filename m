Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFD3DE45A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032130; cv=none; b=lguHnF4luFpO1nymCilj56ApubezA5+VpvPr2SQbBa3HzcrNunPq0VJiUhaC4N63Bkn29hiketVB2ZJvawqBPY5glT8tZSaMA+sLgJ5077YzdVOL0WaXIhFTHp3rGNZHYqoQvw3BceuRogu064fFIfgF1eYfx0b0UHLRdGpwLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032130; c=relaxed/simple;
	bh=SqMaIe31ErlyZPftI1VMm9z3onoE7TnEmVuwCwe1Z8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVI0CYhHq4f62lWw86c7sFhx1N3FWAXr8TV/Gb0EeO0FfMarH3lJT/wYN2g+I2jz85fGIxd+aZJ0HZkgN1HIUhYWZ/5Uxf51eNDADdVyXNX6iqrFMWnLfSBgdaFODMR8ESBAb6sXA4crdS/mwWGa26WCrSV1pjGjp312KGV3CqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REL0V7zV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FO0aLXm+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REL0V7zV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FO0aLXm+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A96Jqf3486533
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6tGM9diftK82uEPdEwwEmZx3
	599l3xHAru6r160uTxg=; b=REL0V7zVLnqqNklSk92VK2ksvnh73yn+uXTKLHJa
	u5ee37RDZSmQNr8DYqK9BkKvuyr7VMA5Oa6ujFJloJjRdacBPvicVOMa74qSvF9A
	MQanvxpWteCjrq8sPhgOzkWJItBWBhLMYS2NA4wsrU6dryGnJCOxlBbxZ8nx6Fqj
	Hc5ozfR7FsG908utiitSriOOmvQ7PviR+6ErTkQYQAxy3zBw/azQQRo8HLwHWB89
	+9aGRIg55uI+MNM5ozqnjGZOzwNvo55WT/EjcBOQZ0JpophFPRystsnrGEs5K4dC
	0UgGNmrdymloI4GKJ5op/zuv9ayWDHJpnmqPgedlxUExHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r3sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:22:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91055aae7f4so15374526d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789032127; x=1789636927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6tGM9diftK82uEPdEwwEmZx3599l3xHAru6r160uTxg=;
        b=FO0aLXm+aFZnZ7Fc02jJqTVjmlZuFqI5eTdhRD8Rs2MS0mQpJXpZ+YC7/eTDdMTBNN
         9E1pIdjXah6nu9jWKxgbUlHZxi79v46yhf4QA4kR8Oa/pru+u2GMZEaTYczCsQ9SJqxR
         flEfnGutq0IX5n+59Peg7OyltgqegfqumhUvpbaJqTAxKMVD4JdD/sbz7QizDFjmkpJt
         vhfsgOoICfAtZ4XBXxj+GZfbLxp1p5IMpkp9d1EHRpDMSfEdoUj/4+xuFS4JB5bWOyBQ
         rzedTvwQ8rMd+F4qp99Mx9psAZZnKZr/Cc9HYAUDmQwy4ukUoIYDIbYq7S3VqMLkiO7Z
         CrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032127; x=1789636927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tGM9diftK82uEPdEwwEmZx3599l3xHAru6r160uTxg=;
        b=mteuAoJxTcyU/ehncR6TA7tLiJgzWkYXZAEQMxLDiGMZlswk4hVJexDSSRMgINp4rg
         tWsg9k9LD81qcz5PlVfjm5atTRuHTQ+V3N8VJ5rY/dOyEYZcEvQqhOa2lMu+RNWJ1GE5
         T/XpDZXnZ2MSj32b4Mi+5xvQnU/maYPzoX8pofT6E5DrR6LYSz6FfM8fNS+lVMljOlHe
         +NIQHMlps2f3n8y8cPDZwSyn8XqCXY6egJ09NvrYNLp5zSmfkKRdT/UizutmekwGfxad
         NXCCKYTSHYd0dcpW4e/5zV1g3rzO4HSf57Cldq5GEe0aqbSPQX/DCM92q6GhcEawjOMI
         fdQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0ATvBHWxw26+Lg1JO5VW/wAxG5IF0NmD6MrILdEECZy/BOCSGc27yT7Dfr18USi7pZGNDyy6aijAwdnI=@vger.kernel.org
X-Gm-Message-State: AFuF++nwDb0R+aKgAYYv4FeDBgc06ziFXrb+vIJuFS2qcnw4B3yWenFo
	kjzLzN7b7tHFKPS2qEhiRVFlPX9TSRm9E4yhvvSKj+HCv/jPVTjHaa5rxmOffoqH2G6syTBU0Ww
	Yps0Cv+5IG23x1GaSEfwKByBs4j6Z9S/JFlmzFrEs9LYMqD0Tgv0cL1kIJsgBnzdStI8=
X-Gm-Gg: AYBFou0oxSyquLXUmE7j6U9GVw6cL7ZiKF393Uci4+qnpgqI2tJXoDLdn8i2HLH0/9b
	x6R2dEYBLd2Xb9QbJ66kdk6+MeeualdfW1MjLAjkpjg+NpNPuw4/qQjMS7kOsIquphcy67CqKZt
	amBWiUXadubjHIsS/cHX7k4y9qYR/qqBYzb6Mp3GZTteVJDzirOK/D32YpCM5j+wuj1COPaHtOk
	pkcFregLrJfEzLJOlZBCFDajjm6CeuqZEUrERHKewWxT1iOZqYMjIs5zK1b/witbnIx0daP5roH
	sJOMTQ34hqCsxATSSFJN/RcW5yGARbz3U9vXWUUtz2s07/2dk+Voy/zjhlwMrRXoRICGptxwa2P
	hY2KKjH8qmCI3pw==
X-Received: by 2002:a05:620a:8801:b0:939:319f:d6e3 with SMTP id af79cd13be357-939d7e4028amr435139285a.5.1789032126631;
        Thu, 10 Sep 2026 02:22:06 -0700 (PDT)
X-Received: by 2002:a05:620a:8801:b0:939:319f:d6e3 with SMTP id af79cd13be357-939d7e4028amr435133485a.5.1789032126022;
        Thu, 10 Sep 2026 02:22:06 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm41732270f8f.17.2026.09.10.02.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:22:05 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:22:04 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix stale descriptors and DMA mapping
 leak on Tx map failure
Message-ID: <aqJ2vGaushx4EL5q@lore-desk>
References: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KcOlHxOUPHTI2fBm"
Content-Disposition: inline
In-Reply-To: <20260910-stmmac-fix-vlan-desc-leak-v1-1-6b07dca5e5e8@uniontech.com>
X-Proofpoint-GUID: N1uAOD8mrVphpSW42veisobRpvtXb2gR
X-Proofpoint-ORIG-GUID: N1uAOD8mrVphpSW42veisobRpvtXb2gR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfXwh110cYmaMbm
 BI/H0Tas0Jp7Dzm/VAknGQU5c72kkgHmPIyhpWR+M/lEzAoDjfnsK383wQg3yM7OTQIDQrtRtgN
 RBlMQuPlRkOf8RvbrAeu2Z5Q6YX5sg+ziskwcmLeLNzQhmaQIe90y3p5M50Sy+76pWoVi0zp8UA
 zPasyuYld5GqZNtTKCN/jNJwGxYeejvnxCcFdbW/Ky2yuS3JYMAXfBTQAHQnkt39pt2qcfKHKJw
 BQ40FeZScC6jWCfiesA2SzhLwNqexhLE7bINkkJG7mS7WEFBuFMk/g6StwQs7BV6ZXUvcVJX9ZT
 23+5Cp+FwvoNXWhmulvcDjng1wX4vIUxyOmNm2qeT2Vbf/rdBjf04Iqf2+z2aqwP7NG402Z2ahT
 J2+V2b60m1yTI0E3WCfEvO8lk3v3XpPpABd6SX5jjFVUYEsv/FAmVBLibn3S6e7oSfW/TLkCoXI
 Fqoh3ontrDz3+yVRNUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX8+y030JYBmJ9
 EvdSRXSNYrcmCO9ZMe/pJ08sTAjibbFemV+sVsc+JjvlkLqPeKcerXBg5Lqtg9rvSxJah+7HZaZ
 u4TLWZZct17ffjQLtRZwi0ij/7kxhnM=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa276bf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iHwBjlyiAAAA:8
 a=w8qe9T3wKc6gY-gyingA:9 a=CjuIK1q_8ugA:10 a=dhHhmpoG3uERpqc57R0A:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100104

--KcOlHxOUPHTI2fBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In stmmac_xmit(), when the DMA mapping of the linear part or of a

[...]

>  	if (unlikely(is_jumbo)) {
> -		entry =3D stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);
> -		if (unlikely(entry < 0) && (entry !=3D -EINVAL))
> +		ret =3D stmmac_jumbo_frm(priv, tx_q, skb, csum_insertion);

if jumbo_frm() returns an error on the subsequent frames, entry is not upda=
ted
here, so we will end up with a DMA leak. Am I missing something?


> +		if (unlikely(ret < 0) && (ret !=3D -EINVAL))
>  			goto dma_map_err;
> +		entry =3D ret;
>  	} else {
>  		bool last_segment =3D (nfrags =3D=3D 0);
> =20
> @@ -4984,6 +4985,26 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb=
, struct net_device *dev)
> =20
>  dma_map_err:
>  	netdev_err(priv->dev, "Tx DMA map failed\n");
> +
> +	/* entry points one past the last descriptor written for this frame:
> +	 * on failure it is the descriptor whose DMA mapping failed, so walk
> +	 * from first_entry up to, but not including, entry.  Reset cur_tx
> +	 * unconditionally as both stmmac_vlan_insert() and stmmac_jumbo_frm()
> +	 * may have advanced it, and release the VLAN context descriptor.
> +	 */
> +	while (first_entry !=3D entry) {
> +		desc =3D stmmac_get_tx_desc(priv, tx_q, first_entry);
> +		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
> +		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue, first_entry);
> +		first_entry =3D STMMAC_NEXT_ENTRY(first_entry,
> +						priv->dma_conf.dma_tx_size);
> +	}
> +
> +	tx_q->cur_tx =3D first_tx;

do we really need to update tx_q->cur_tx here?

Regards,
Lorenzo

> +	if (has_vlan) {
> +		desc =3D stmmac_get_tx_desc(priv, tx_q, first_tx);
> +		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
> +	}
>  max_sdu_err:
>  	dev_kfree_skb(skb);
>  	priv->xstats.tx_dropped++;
>=20
> ---
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> change-id: 20260909-stmmac-fix-vlan-desc-leak-f057bb061daa
>=20
> Best regards,
> --=20
> ZhaoJinming <zhaojinming@uniontech.com>
>=20
>=20

--KcOlHxOUPHTI2fBm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqJ2vAAKCRA6cBh0uS2t
rO4sAP9QplCgEOl7LHiJtVRsPPgK9CPA9e9w9UD6ia60BXo9jgD/QCPFa663G/VC
TKZ5L1wUNGHzBoI5o+tS5xidHxQsLww=
=LJmx
-----END PGP SIGNATURE-----

--KcOlHxOUPHTI2fBm--
