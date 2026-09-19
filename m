Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55B547049
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789839168; cv=none; b=PQeE7v68pKTwCznz8jhjYkqDH3886CUEVwTFVH4mMZ7EX0pHZ9O0s/3dvWMNI1HUfpQjt3q2Jaeqr1mUlmEdc4+Jg6ow48kPIvBXXgAm2vN1tGycxn0QcQPtU7L1qwZUOgOi7egsRtXfD/wZ6OBLq0P8U3/4hFBwMRklDtxDRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789839168; c=relaxed/simple;
	bh=y5NG3iQIekfVhbMlPZdGclL6+YuA6DfA2VUvSOE5yQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaLzZbXgWql52BwrnPGOdgm4QG1RzM2J6UxPG5j9sWnDrf5QNFEATGRMKz3Ut4pfxmo59+QccL2SOnTggj8EC4DgClzmxP5xXfevaNk7CwlpKSVYICwk5CTwgleiOkVwMXc16eULmOdw39PwFUIjv2BdDbSMRlE/+tA1JgY5+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9pF5FaP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZU5VNhat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9pF5FaP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZU5VNhat"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGJdhH2825262
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HqG9f5lzL9qDXlX9VaIV1TdU
	3erotb5WQ+seYvtPtig=; b=M9pF5FaPKwl5mA156xYxOhScuVO02hmsmedapARv
	9+kklJNS86FnFMnCbQAtcLt8ZCMDy7PgqUvV4enyNqrH+0ZamayoeXkKRT4PtwQ/
	HFAlbVD0MEbyhMq1knPGp0VB5gEnhpDLt6lTL8lJXVhAzd4rA0geQtJcf1I8ehJ7
	3VgO787FpVQWqebNTDBCux9MkV6la1qPXRC4AsRrKSb0kCQaRZuq+TZ28UNIBsSZ
	3j+GkzqZQvPQsyOPz9IfcM5Vad/3DwQoP8DSdhI7FC72LS3xP82EzlUYhtkJdwRi
	H9HzxB7YD44wSAm0Jk1YskOeUWbOAV/u7DtDVBt0W+GbYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk17dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:32:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso359441185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789839165; x=1790443965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=;
        b=ZU5VNhatROnnOjB1yOH/9JPwRwdShGH7XZuIAcAxagTHK/q8dW4z8MbwxH9sW3BLaq
         /LKPO/h8oapgSKaeyz9wgT5r3my1Wy4I6QHO5dqvUUzKM9VW9gYW7Q0CNyP3PXUnyVJE
         w08xhjf7xKlBwfRxCk3mLUEJz+k5ZeLS9aWa+OcHfm1IMOFHdD48yELy0rGCrw3GeZDH
         a1oN/QhIwvMY7ECIeUzx8NDLgHCtGuFMqDbdUtGAPSLOk1hBE82Z8+bfN6u0U8BVAMlD
         xS19idJbfIwbfwcBd9Qb3pEUtH2j1rLoCTr0CQHPYHZNnXHHFlt6CtZWS1wPl3CSL2Xp
         /ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839165; x=1790443965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=;
        b=oXmrrCE/WNs7H1WEsuA4o8WnbYURq9pQFvkSV2p5EEa8s1GuLKMbVLgAs2yg1JKE4p
         AsToj2ux5Nc1j52goy2tJX5XpO6AQnRI/Gjnk0pIdnG3OhnF+Tz1rdf8Ibktkuf6N1mI
         rKoxzHt+2er/D9KhwFjP5s9IQPfR3/hZaarzrJIXx39gQ6L0/tgZgGFcuudoXXZyVyMH
         kZMRLRrH8M8yvnuNyHaMZ0yGo4P/G/FcmRQn7oFp7tsvn0N6uWYPP8nVSYJ5CKfxwkKX
         NavODmVcuBBuz0sHIkIrTRVDRvYgrP2mdYrd9t3p4mP2PrlU2ThHTrN1XhNuZdyc8tA4
         sO0Q==
X-Forwarded-Encrypted: i=1; AKwUvBziImR7jcWs603mmcUCuILH9XXcdHrZRx5EEjO3mZ6UpsBC4ss65t72hrcU0JQaesT7yzqj1MkmIqoxsx8=@vger.kernel.org
X-Gm-Message-State: AFuF++k1q+L07oakxzbSaJNhe3UNe3Qc3MnI+y0wh8ALzuFTOILqhrSt
	qFr0TPEdC/xhsxbkYqPCd0zYcU7az/RrzJbvJIBT+RnhVyMhJ55FFNLBRMggGeGk820TYHfNpg2
	OF6TMHeidtXaiOkkpVYUvFYx63Q9G2rkD9roxroAA/LMNeg0his7qDNuzjkkgrFZotW4=
X-Gm-Gg: AYBFou3acTJaryPdB7Z4bLa0GGEeY5bUUI5Wa8kenMjT2nS9/YDk8rqgs1S7ObG+c+4
	tp8puSPwokVTF+ir29tgXtyUS4e+MG83AnSgzHyXeRe/iC95ad0KIcvFRwo86xP+aK/4kMuNNix
	gM0z7sRW/g757f8CW3HRbzPaFANftzycD+I3jEnbhm6oIqpUbmeBcCysSx6cCC/UqLugxdq14sH
	zi6J6Y8bVNlpYMT+mAgH4VQa6WY8uybauinHCAcCXSTsvCZ6tDiU71EaATzsAYOGe+PPYgDWJhC
	pfD20zcE1p7vPbUbhO37MSt7QIqn2magwMORB7JR9EUMbs1AMmOHyRTqzb8sFvCoKW0OdkNDYSJ
	n36YnUjxPaFN1IQ==
X-Received: by 2002:a05:620a:2697:b0:93b:da60:a557 with SMTP id af79cd13be357-93bf5595446mr265128885a.19.1789839164963;
        Sat, 19 Sep 2026 10:32:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:93b:da60:a557 with SMTP id af79cd13be357-93bf5595446mr265123785a.19.1789839164435;
        Sat, 19 Sep 2026 10:32:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm330064325e9.4.2026.09.19.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:32:43 -0700 (PDT)
Date: Sat, 19 Sep 2026 19:32:42 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Tao <gongtao0607@gmail.com>
Cc: netdev@vger.kernel.org, "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: trap frames to conduit in MFC
 on EN7581 and AN7583
Message-ID: <aq7HOswpuqqboFj5@lore-desk>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
 <20260919065214.31604-3-gongtao0607@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hVJhV1FC9rC/pOle"
Content-Disposition: inline
In-Reply-To: <20260919065214.31604-3-gongtao0607@gmail.com>
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaec73e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=heobWi1WCqv2MVib:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3Szyxn8DIQ0cRF5uja8A:9 a=CjuIK1q_8ugA:10
 a=oxjvUbtD-TdPno90v-gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI1NSBTYWx0ZWRfX4TUgr6z83AAU
 BN1Z9w3pd/p5i//VdbC/EBrbKzTuj52nz30Y6ZUmwMD1Pd5O79oC9fUIaN7f1gSdvdz3891V6Gv
 +R0bGPZZeb9WDk2NUMUdl2RtF5gokAlfzu6J1JuYCQPBYW8q4e4532ZIlji1CYEqEY8VMynY10I
 WSzgY1IpLetxZtBVCXltM58GL++B8AjAG3fGvmEQtdfETL5f9mnNJd7K/Lw4aEYDeBF9PPvJgJZ
 RIcSPEiw5h1I/d16Xg/LqVmul+xBRmm/0S4SWX98XowbnuYlyE6YTFKHA14oxLLZfcN2lXBSbPY
 L7tfnxK4fmhFRsceXJsmKxear/1oAUrKh9o+h8gCegTJggIQpFIS7TZhiRkTcxiBhjq2VuAg0CD
 hlS4hjBn+QwDq2kISukKn/d7YRo2nimZa8QC98TYFfqvaQM99gLob2mnGCMppeDHYvUa/vwobha
 GXT0WYMfhn3ZivZrSZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI1NSBTYWx0ZWRfXw4VRJQoecKfo
 JkpOqJr6EKQSBg2yAMsWAY5Pt11x8sdLMthd31TAwMRa/ZU4uHu1w+F/A2VhaJHwaD+sb2TBk8Y
 EYvH4nmzffAYpbeF9gY6IRtVwKB/0MA=
X-Proofpoint-ORIG-GUID: v3i56t4-CtOXSrxLPHOegdoDYPhrQsRn
X-Proofpoint-GUID: v3i56t4-CtOXSrxLPHOegdoDYPhrQsRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190255

--hVJhV1FC9rC/pOle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On MT7531 and MT7988 switches, trapped frames forwarding is directed to
> CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
> for EN7581 was introduced, it was assumed to follow the MT7531 model.
>=20
> However, on Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC alone
> is not sufficient for trapped control frames (such as STP BPDUs) to exit
> towards the CPU port. The switch forwarding hardware also requires the
> MT7530_CPU_EN bit and MT7530_CPU_PORT field to be enabled in MT753X_MFC
> (0x10). Without this, trapped frames are dropped by the switch forwarding
> logic and never reach the CPU conduit.
>=20
> Include ID_EN7581 and ID_AN7583 in mt753x_conduit_state_change() to set
> MT7530_CPU_EN and MT7530_CPU_PORT in MT753X_MFC when the conduit becomes
> operational, matching the handling for MT7530, MT7621, and EN7528.
>=20
> Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
> Signed-off-by: Tao <gongtao0607@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/dsa/mt7530.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 863f2079833f..9693a55f553e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3309,7 +3309,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
>  	 * interface is up.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> -	    priv->id !=3D ID_EN7528)
> +	    priv->id !=3D ID_EN7528 &&
> +	    priv->id !=3D ID_EN7581 && priv->id !=3D ID_AN7583)
>  		return;
> =20
>  	mask =3D BIT(cpu_dp->index);
> --=20
> 2.55.0
>=20
>=20

--hVJhV1FC9rC/pOle
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq7HOgAKCRA6cBh0uS2t
rBiNAQCFg1nQRwOzz8FU5MVSG9sMaa5p0AdbjtEe35Uz9/PYcwD/T8H/q4YIYf8V
geEV0Ie0ekM6b4TJpIqUUS/qyK9/LQM=
=JURm
-----END PGP SIGNATURE-----

--hVJhV1FC9rC/pOle--
