Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B648EC74
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010079; cv=none; b=GV11Ubc9nyRZtwUF802QfQII/QMKcUC79GnlKRhnuBGz5POIWFjkP7Ww3kqCOGkMGMvbUVxOpBFP+XeCs35aIVy56r2+V37/uEAIyCJnzaCgDaW2tnu1q1pSMFhI82QhZOg0fUSIu5taUasCkWmiZAjdnndanonzGPbPwrIKc0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010079; c=relaxed/simple;
	bh=ZDIgi0iGmFDZX7jlfEAWDdYDGeDhU4CVW3R70mqKO5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X57M1l854TeoIadHPasTkIUJ5M8XRpa0w8GPiLftz94E/dOkgrrG4yC6aFdU5yOL3LfXkBBLe1mZEFO1gZj+b6tUXNVwg0ArQgLG6bDgvD5BwzlkZTmHVbiDx2xwbPYEHZcWf6JhyBj9TPLeZay0ALZEWn+M90cjzNKjsnyjyJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEtReE35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jD06oTY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEtReE35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jD06oTY+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpis61672397
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0JBiBo8u7UaSC9Rv39cO03Yj
	k1sy6Ysk6M919UcSD1U=; b=hEtReE35PA0qGR2ehdV3Eircseeb10WvpxANT3GQ
	bXVdx9PHWVniLRby5yl0FeVagccHR5TDoGEDG5XghOnI0OdLGUmOuT0wNjv672ln
	EEKLjixkKJWzveJZXp39zO08sb8+sdXFm7LXCYBtyqYxr4dGRZzA69gJaMOh6LKs
	ITcYq/G25/7wrqfEcMBfonGwX70mPxSscwy8EH7yJ+IutL5vZoOFAiCEetzXbiy/
	bYN7idogpgpZfoYnTsd/Ld+1ljulYnnu6on1E188UHe2OMdFyS6Hhwrqy+tP1NG+
	P0X9HohIoEUTHsrjJo2nKivGXq3o6Tql6NZ/p7g3sKUTTg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh91pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:34:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bb074ed1aso25384776d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792010076; x=1792614876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JBiBo8u7UaSC9Rv39cO03Yjk1sy6Ysk6M919UcSD1U=;
        b=jD06oTY+8rEepNQ+7SXByi2WDpDuT6rKD6DMK0Xs13TqfxQaRzZiNOeHNGYkis9SXh
         1ntozTBdqLoIjsWGSXjvBH8HBOV9x5orRM3o27Rs40OoRuHGoJICjiqPN48TkQrJM3y/
         cr42nF4VCn+sG4OwTc1P5eQc8Ou2LTfNCnTtTMibMWbFewOUl1Otm4O2nmrA33lMeh8z
         thZr1J9wRz7ODLC74SaB35HY82Mh3puIa46XD05RVyJFpX7oAsa3dGJol/YBYCRCM8aR
         zOgdY77/DFs8w5pU2IY4YHD8i9sOoN8i4DATTx3COIAN3215ZI8C398IVie4CVP0h2kN
         8WrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010076; x=1792614876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JBiBo8u7UaSC9Rv39cO03Yjk1sy6Ysk6M919UcSD1U=;
        b=eJr1I2PToSzuKFQgxRS3SwLeTTxBTx6sdr0Ut0onGlp5aDWtF9ygDPwJf+vxtlFD4O
         mUn3C7hRDuUYa6qu9ZrvNHpmlmOcuCB+ktIlTwwQjFQ4QY9+7YR+SNLP+D9c+IqzTcmk
         7YKNd0EJdGAM11T897gdFEmfyf6AN2c+MG9hauNq2yfGZHVGKSRFIkcC0fO9vzvcXt1T
         Mbc0+BquOYGiHTFLKTfGmLR5nNY1mGTIiGSatuT37/ZHmz5eiEBtyUo+o0MWuEaWCOqu
         tJFBvXAfdUE7bVIK/EtwYlrRCS91aSGSiAmMnuFFqzhe1JJ4u/OBJ6BdZNgUhJnkNfh5
         Tyig==
X-Forwarded-Encrypted: i=1; AKwUvBzXjl+lN5KqT8tWgTxB5J1LQr5chcDp0tX+W/j2shnvZ/MAnJYFIzWvFihDLp8rNd4Qej3hO9WFSK4ZTIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL83VYJmE8KYlGeTNHRyrrbioKOg6SyOFk0yr9lZXx+nvtkuyrL
	MeCAt7hQT2dwi6Ud3J+RqYpjoXLuaP3yKf05ABBbeRqDks0omw721smmiBtx8Pi14X4M6TkQIJe
	zYC0oTFMZeHquIkimD02eEsdwz4SDNjC6XaX6PUJwBDev5F2rt0aW/j5/5uCA+OdqAd4=
X-Gm-Gg: AYBFou2FjeHr0O9J0t2GVd5tTxnuX3MUVzXtsbpOkaVlgZZgaMh8rt2yP8DkQsLaKgr
	hPmaiomFilzkuVRjzdPoNO0LxaMrEJgSsCkfVnkzBemyiprIdsPrYxCpdyvgnyU4sKiijw4HyHe
	FbTtj9Zwz4hXdxOEEeYnyh0TZLDTlsrX1DRQt2vkbhIOcjztTImOjzMBmSpgeGC0S1+6g3xQYv9
	nzQrhW5+iqtZ29dOz0e85fKCCrOkR9/wM8D507mPwLmZzvxQ8uXSZmB88m6pmv1nLdfdGl1Jt7t
	Oqhop7FuL/FwxycS7M+dPTdevVPvivZv2T9KrWvXi0gtMP3MyWOqk5N70pPBI5RC7FxgembHL/L
	/5bj5bTraCDYH7g==
X-Received: by 2002:a05:620a:6007:b0:93e:a91d:6f94 with SMTP id af79cd13be357-93ebd224f61mr2537122385a.18.1792010075942;
        Wed, 14 Oct 2026 13:34:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6007:b0:93e:a91d:6f94 with SMTP id af79cd13be357-93ebd224f61mr2537116585a.18.1792010075116;
        Wed, 14 Oct 2026 13:34:35 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm14487762f8f.28.2026.10.14.13.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:34:32 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:34:31 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split
 header support
Message-ID: <as_nV38iPqeDnSJN@lore-desk>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
 <as9XUbOfJazEQ4y5@lore-desk>
 <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LIltqUKrDa7jHaj"
Content-Disposition: inline
In-Reply-To: <ff4fac87-380d-410d-942a-a48edce70397@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Hg4iD6P_0MvsVhTbWN6iMHOJQXtOmd8E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4MiBTYWx0ZWRfX5Gh1pg6gkDmI
 5PQu2yyXiBrlX15GeQo/EwyXkm5zpdKx7H3o9L2Wa1cqiQDwaswHuPoFK0bq3bBdFh80+9ryq5z
 YxsJpjJ5fZQxPnbq52pIjV0PEIwsgXA=
X-Proofpoint-GUID: Hg4iD6P_0MvsVhTbWN6iMHOJQXtOmd8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4MiBTYWx0ZWRfXw9Yn+1In3NRN
 coM8+mmVlNx+kOZzujWdyyPXgGKoP/31s1tB/elczjsc8S1Ma3MqA4S/G42bjps2sn+VU6z+SeG
 DffdfeuHAvfFSPc/DSJ5/YLVvvN0wSCW26DXuj+CzFi+brlQrNXS5TqcEXUApcoNMhO0hF/QSqh
 zfMR3OxwmUzJbvXPFxFOlBU6podrliaU0xJrOB9w4XXX+IUOI1hFG+gpJvUeRRhLBQ8qOlIKwFV
 ZxKNgJet7c3jiEuqxpAwbcsYHiNz5iAOVSLuGfjNmyVWTY+SAMXhcWQnKGZidtQ4RL0fqcnTU4b
 +5enS+WwD7KKuWbBfsmeTeskmlaRg6MtXukeF1ntTGmV00thhuIZ57uTfyQwyTSnKYqSFbuUDCz
 Okos5onoLNh8AmObqQIrfxAIOUma6njm8zNtkxrhX4WDmN9tSCX24mlnm9PjK3NMWDtSL56ZNfL
 n7qZvkgwz+bCcO3Z0ew==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfe75d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=l6KQ-lo0NrS8dpgq6q8A:9
 a=CjuIK1q_8ugA:10 a=5EYT4Zk4UCsHSFwCBpsA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140082

--+LIltqUKrDa7jHaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> >> index 6719ac6e395b..65ac5403ec58 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> >> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *=
p, u32 *hash,
> >> =20
> >>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned i=
nt *len)
> >>  {
> >> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
> >> +	u32 rdes3 =3D le32_to_cpu(p->des3);
> >> +
> >> +	/* when FD=3D1 and LD=3D0, HL is RDES2[9:0] */
> >> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> >> +		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> >> +		return;
> >> +	}
> >> +
> >> +	if (rdes3 & XGMAC_RDES3_L34T)
> > should we check FD=3D1 here? Since HL is not defined for the case {FD=
=3D0,LD=3D1},
> > right?
> >
> >>  		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> >> +	else if (rdes3 & XGMAC_RDES3_L2T)
> >> +		*len =3D (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
> > same here.
> >
> > Regards,
> > Lorenzo
> >
> Hi Lorenzo,
>=20
> Thanks for the review. dwxgmac2_get_rx_header_len() is only called from s=
tmmac_rx_buf1_len(),
> after the sph_active && len early return, so with split header enabled it=
 only runs on the
> first descriptor (FD=3D1). I don't think an extra FD check is needed, but=
 I can add one if you'd prefer.

I guess this approach would be more robust.

Regards,
Lorenzo

>=20
> Regards,
> Sagar
>=20

--+LIltqUKrDa7jHaj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas/nVwAKCRA6cBh0uS2t
rEcmAQCnBV/1zib4lq8ykuIgs4S7yaMfbi9Uf4Qr042Hk0VQWwD/eZ03uS5gU21E
BglezNU2cYxJHHkAwFb44+hYCJzZsAY=
=jxn7
-----END PGP SIGNATURE-----

--+LIltqUKrDa7jHaj--
