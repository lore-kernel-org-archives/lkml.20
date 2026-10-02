Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D355F470135
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945990; cv=none; b=eqdq6KDJFQqm+pxEKTEbi4XfQrYPMQ9CnjIJ08TrXZWe154jyb4TitTNoNuTNuwcTj6O/yqTScrO34lWiWbTIabpwRFftkxUIr1egt31o5cbNXeh/Qx2p1p+4Gd8xaHdQqF2eRtRsfbiWwwlR383YpEqYVH7CI7NCQ//mfG0h9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945990; c=relaxed/simple;
	bh=1kyDt4JTb22Uoi2LnkpQhAiVJKN25v4eLOJunyfK0HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Te98xs3eN4/M8+ewtQkDGU7NCKLm1T9xt6PK9td68Prpp1EH3gL7UNdt8DL0vl5yJZ0G89YhcCLkuEttd+6bnjin4Mv2E7F9V08u7m3mMaJOsDbAGJlMvglEAo2Jr66uc1NkodOyerWWAouMcfMaFhv8KquYhM+FBRgxAq+Zilw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAziJZBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnsaTMSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAziJZBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnsaTMSI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nevl1190543
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 12:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y7x/VlWWy2BsRTiBpnYJg7ky
	XQlMniK9j0tDbkxyDLY=; b=JAziJZBiG50qprKDeSWjkAGyyLrmlrLfC69no1ZS
	G/CoEvxY/4B1wFMoES0WmgXCV+tCAd6v4btzjfFHw90+2ypP/vG8Ss3rLOkORPdO
	2Qunr3eLSx363QKnCm4eIp5FUzyj/uu4ja2SNoxhYec8wwbjt63//YxLTVylAJLT
	myHl/Sm2uK2dY6Rby8WPaiOGxWc8VqAvwVTJuBUzb3q/5Vw0RgrX9NuLpCoc2uXD
	gNPL1ne5Ab4XwaIoZY9cK3Zl603ptLUGa1RD87MbR8Rqn/zApAkzmgEZvvndTqme
	vXax4apSTVU7FBTrE8F2uR2kU9+4wnTq+MBqAvCTcz8vhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tk1mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:59:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso406233985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790945985; x=1791550785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7x/VlWWy2BsRTiBpnYJg7kyXQlMniK9j0tDbkxyDLY=;
        b=fnsaTMSIHO7rzPtkr5Zd/MwvEvsm8anrGRtQDbxpEHFtQpShqqI3kUY8AmqvJ8ZXC9
         jRBvpyKgDXk6ymCGpxgxXxcV9rBkd+l13gSBT69WMW5bO1hF34o+8gnIAY8PIVa5iUi9
         JAvdCbu2bFvRJIAaFO3OugvWmGepHzTXHVClVH8cIw2ZPKJY9WtPwIKkHMiAgjNxaQUH
         liCMsISavy7o3d7gpfNTlD1WmtKDSvlWZAHqkINOUj2rdVz+9+poO7ttJLPFrkZVTUf/
         Kj3EzO+JUmmeD+mitAHg0NKpSrLdgxx3tt2IDiqiKcAT3S4bkvzNnO0LipDF+nL8fsNj
         m09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945985; x=1791550785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7x/VlWWy2BsRTiBpnYJg7kyXQlMniK9j0tDbkxyDLY=;
        b=GpT4F/F/p29xb7ywb+4UxSXdVdHS0hm88FHsj1r7VurE+lHR0VoZYIO/oYuqo/I/6y
         59GiCamDi3RVe6i2RtLfjGzL1q9GScFwWdwoYpHAFnJ5avIClgN4Sg+mAvC7eNCp8siC
         XiggNJXMM6NgyjJ7MPD/oIVdvnPzJLO8AoOZHOVxO9Hjm7ECfmZCWN7BYqdyor1sXCGc
         q4rDD8Hjem87dwXSbLYOFXhKlprCBljHzSUEmgf/WBlhjghPEWOyOoJfvg+bLTbf6xec
         J9Uzx6pWVUGXCYTS6n4+yBPL6yqfVJoO0t4Ai/xxLQEkl4DPOWUqEvYl3HeTZ37ZCAHP
         cacw==
X-Forwarded-Encrypted: i=1; AKwUvBzMst6Do+ZHXEuQxpBALhJl40JSti9ZrdyjkvLMl1oYOvc+hO4f8asywsxB+naPJGLDEz2q7B0Qw2+2Odo=@vger.kernel.org
X-Gm-Message-State: AFuF++llKJ1O407Pn0uozJaCwdShG+eAdrkAVwjr95iVy+dVv1ANKORt
	Dgu/Oo1PwrKeXSxbtMFASmdIkMt1LlCbDvY/gM74FNN/FrAXVIUF9tboOarrEGQ5pQ0PbzYwmpX
	l2KDJtynVTC7zw11+YWqRsRoQo109Qj1MW+IGuvJ9tcXAINFUokJOPLl1Njnf6AyARSQ=
X-Gm-Gg: AYBFou06XjYfDwIO8VCrYP71H1CTpqsiXdpRXinyEAe0dG2bxY/fEcQ+tW+oQQPUVRw
	XY/Yv983XhL/4WEXYkf1eqDFjY/e0oysx3zghvunz2o7JDav+4sbFnXEUogJwjnOyhFgS4fAYWK
	M0F+B7PBgbMLVQKv7QgsPNtJVT7xPxiQWNKoj9F9r1oQYl8E8lGyxL/X3J1va8KTumNUPO5TJvr
	M2hlFgq1EOzRClv9kpMrYgG50f1m/yYOA5KJToJ/KMptSr/ZrQfwgD7EG9IxO8b+LwMUQ23KtcB
	FSG59hSwLPHkCLzN1hKXNZNREbYk2JqLtd4hT6EXZtruyiHWoit0TXyfXE3wHWeaajn3T/8vpz4
	=
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id af79cd13be357-93cf1763839mr390081185a.47.1790945984783;
        Fri, 02 Oct 2026 05:59:44 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id af79cd13be357-93cf1763839mr390075885a.47.1790945984155;
        Fri, 02 Oct 2026 05:59:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0304407d2sm49887535e9.0.2026.10.02.05.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:59:43 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:59:42 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <ar-qvvGVATQ8-YxY@lore-desk>
References: <ar-iXZa3AIidNzsZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O4EjaSrLBJhM+Fvw"
Content-Disposition: inline
In-Reply-To: <ar-iXZa3AIidNzsZ@sirena.org.uk>
X-Proofpoint-GUID: zQvFigtCqutOphIRsqk_K1RxWB74OnJc
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfaac2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=C2QiusJkKhMZhfYo:21 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EEJO2GkaDteSM9pISacA:9 a=CjuIK1q_8ugA:10 a=nKQr2Z7tQUnx1KUvgakA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXyjqo8MlxMjT2
 i6/McGmM5WsyLDfR5k6NQRYhJivU5EaR546TP1kA+0CtvsJ2OrXc4+D430/ejaypTLLOsHyv/xA
 WSm5r9+BCFLmPgGzk9sbeg0flKAQ7rzcEVsKuBD2tXD5oGLpcFR/tGc8hD0GNHsCVuJ1m9fb7/O
 C3NpBSLMYsTzdZjFtv0i2tFMMmKvAspLiJPlVHlMmvaKDj6ct/EG0gmxIqDsEzPZYD60lyGbzUB
 hnI7zcTTYUvLkZ5mIVlFd5VwaikeAHtSdyuSBFiW7ijzHq/Ah17ELhB0ZUs3gmgNJbAgalB18Sa
 LH8yRQK74W9yDJ3Afdb/O8KMYk1SSBG5do+QJPWzph/kxQhFeIKsrUCQEc2rvl53IubMitDOPoK
 plGRdM38p7NbPJ0EqopxXCbpn9CuBi3x91xXB8dSctm19En54D5bXNDGjjQvYsbROhuCMTuuD7J
 NFa6C5LABmhNt4soOpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX6w73aPWb5D7r
 sEAOZUbS3WsU8hrZEEsEyftWe2UuWA/+itqRhuC50XvI6W66O4+CNOpMy7Q5mdG+FUJUTdgWacn
 /PrWHSk9kPAbngwbxx9nfZoXCQnl4zc=
X-Proofpoint-ORIG-GUID: zQvFigtCqutOphIRsqk_K1RxWB74OnJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

--O4EjaSrLBJhM+Fvw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi all,
>=20
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>=20
> between commit:
>=20
>   232d49dd4b40a ("net: stmmac: propagate PTP addend and system time progr=
amming errors")
>=20
> from the net tree and commit:
>=20
>   8181678a92f01 ("net: stmmac: propagate PTP init failures in __stmmac_op=
en() and stmmac_resume()")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Mark,

I double checked the diff and it seems correct to me. Thanks.

Regards,
Lorenzo

>=20
> diff --cc drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9741f97fa37a2,0c381ae0d0ffa..0000000000000
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@@ -893,38 -862,38 +894,46 @@@ static int stmmac_hwtstamp_get(struct n
>    * Will be rerun after resuming from suspend, case in which the timesta=
mping
>    * flags updated by stmmac_hwtstamp_set() also need to be restored.
>    */
>  -static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
>  -				      u32 systime_flags)
>  +static int stmmac_init_tstamp_counter(struct stmmac_priv *priv)
>   {
>  +	u32 default_addend =3D priv->default_addend;
>   	struct timespec64 now;
>  +	int ret;
>  =20
> - 	if (!priv->plat->clk_ptp_rate) {
> - 		netdev_err(priv->dev, "Invalid PTP clock rate");
> - 		return -EINVAL;
> - 	}
>  -	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
>  -	priv->systime_flags =3D systime_flags;
> --
>  -	stmmac_update_subsecond_increment(priv);
>  +	ret =3D stmmac_update_subsecond_increment(priv, priv->systime_flags);
>  +	if (ret)
>  +		return ret;
>  =20
>   	/* initialize system time */
>   	ktime_get_real_ts64(&now);
>  =20
>   	/* lower 32 bits of tv_sec are safe until y2106 */
>  -	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
>  +	ret =3D stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec,
>  +				  now.tv_nsec);
>  +	if (ret)
>  +		goto error;
>  =20
>   	return 0;
>  +error:
>  +	/* Restore previous configuration */
>  +	stmmac_restore_subsecond_increment(priv, default_addend);
>  +
>  +	return ret;
>   }
>  =20
> + static int stmmac_init_ptp_clk_freq(struct stmmac_priv *priv)
> + {
> + 	if (priv->plat->ptp_clk_freq_config)
> + 		priv->plat->ptp_clk_freq_config(priv);
> +=20
> + 	if (!priv->plat->clk_ptp_rate) {
> + 		netdev_info(priv->dev, "PTP clock rate not configured\n");
> + 		return -EINVAL;
> + 	}
> +=20
> + 	return 0;
> + }
> +=20
>   /**
>    * stmmac_init_timestamping - initialise timestamping
>    * @priv: driver private structure
> @@@ -937,22 -912,8 +952,14 @@@ static int stmmac_init_timestamping(str
>   	bool xmac =3D dwmac_is_xmac(priv->plat->core_type);
>   	int ret;
>  =20
> - 	if (priv->plat->ptp_clk_freq_config)
> - 		priv->plat->ptp_clk_freq_config(priv);
> -=20
> - 	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
> - 		netdev_info(priv->dev, "PTP not supported by HW\n");
> - 		return -EOPNOTSUPP;
> - 	}
> -=20
>  -	ret =3D stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
>  -					       PTP_TCR_TSCFUPDT);
>  +	/* Reset hw ts configuration */
>  +	memset(&priv->tstamp_config, 0, sizeof(priv->tstamp_config));
>  +	priv->systime_flags =3D STMMAC_HWTS_ACTIVE | PTP_TCR_TSCFUPDT;
>  +	priv->tsfupdt_coarse =3D false;
>  +	priv->hwts_tx_en =3D 0;
>  +	priv->hwts_rx_en =3D 0;
>  +
>  +	ret =3D stmmac_init_tstamp_counter(priv);
>   	if (ret) {
>   		netdev_warn(priv->dev, "PTP init failed\n");
>   		return ret;



--O4EjaSrLBJhM+Fvw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar+qvgAKCRA6cBh0uS2t
rG+dAP96RtWcVw97+ysSLMsHdkn7pHCvHn20QqWpLICWQ/MJPAEAv5uAMJxDnb3x
dWajHJaVos9QdyaVvlOK466kOrSyawY=
=tita
-----END PGP SIGNATURE-----

--O4EjaSrLBJhM+Fvw--
