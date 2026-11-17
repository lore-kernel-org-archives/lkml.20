Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929177;
	b=ScnUGixvWaqS+HsPM1XSw4qmCuZ4Qv9RX0v2dRsD5cRWYOUqMZragurjz4eo6/mpa8Gs
	 Fa6EaI0wz4RaExU8aUaRWWZe+xYjmYg6F1ttprnVCng6Yks6U9Uh3a4ptyvy2ZZaeY5D9
	 Roj1q+V8IU5WKg6EBl1y6BSySewdG0OBl52/OtkJUvRda3upnEd2Qo1ZaoSPDQgrRRDT2
	 +3exMZHMMiOjMrQTyV/KYGqbG3QWRM3Zjsc+BKlYOmRx+zv1AtJS2YFqObmRdt41HED5n
	 Wk5HLsq6ZZAWOJ139OARS6y+jlByrY9bqj2AWwzzC4ztXvTvYOM4Xh0lBqKKuhkzdxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
	b=UvPNK78iZo7r0wYRqYeUv/upXKWTsMR65t8fb4RisXkuqCZJNutt1oo6IgeeC+kmfaW7
	 slH/ojfaWFrFUIUIIUmakASyaA5qFbfLu89nqzYsYvH1JFFflfEovTx+rsjI6i5mdrKpE
	 50LRRefWC/fZxu9oUuO6EszZhBzl2njEZDnJ7luh9hEUH2kgDvJsmzai4/6/vkpLL0193
	 3y4slv3njbFNYxrU6Kpq7dpfmXAK562J3v29EG0CcYoKSVdBEoKTgFw7pfYKuPdeEGI/d
	 FecvbionrvtE6jlOVH+f/5lHjQ6umTP94kLJoO/Vi8s2Vf4Qm7ngwgvMBJVEWHRiMfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOK5naCi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZgLg9/61";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C7606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649C7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WOK5naCi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZgLg9/61
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHDEDru626633
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vBPOLGbjQHm2dEs2LFQcVrcZ
	3yp94sR2RDaK/4V+R0U=; b=WOK5naCiqB7oN+BcYiBV1TTMRGwYxJjX6kguGQBp
	UVLtobmT0q49Xys5cMtJvKuWcFwTI2zEOw5DLGgBkJNN7ot4WJDTh7V2Ce5qlKSe
	sFI5cBonrDt0QwwMZnAd+tsTvElLZ6+iJYVNN8liQ+Q+04r+Z9jj2HOv9WFunqYr
	pPqKoNUhb8A69wNsj64wfP7G3UKgT87rr+dxzG8gs5XlG/P9+M5EWJli1b6q2bX8
	9D1L+56I4dkkMX8kTXP6WDAi6D8YIbl+t++WOgdHLzARJwMsnxxW4iQ/BvvzjiI8
	L9dEmvGaukugxvux0TfPw4SOgRv1AGtruP/PYzwHo6ffoQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms0kxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:26:15 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d5cc693fso679469137.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929174; x=1795533974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
        b=ZgLg9/61rZJT4JZ0PpPJvv+jfwsA8zsyppgTu1NWldDTNGHCIprYd4dv4UWG0afdyg
         POSmJXe2GmrUVcOQI/vCDb3TD0sP5cGDU6Q1lGpS1o0wzLJuzx8GQL2CzZPLfgGxLV0X
         2lt2kwooYbotxt6nptpfPbdnLamwfPixkZ63NkVBRLaA9d3cy5V5yCInVYTZbA5McIHb
         2N8GUUbO/H2OChcbbKVvdHAJa+O+n2/HfeQF8QKKK6awJMnHMHp//FRQPyMNu2CyddL/
         E+szhqkT1VJqRwROxJovR5D/6c0wGnPmQk3LwSPTUCtzUzjTfJoueAyhGaUWm0MfmyKk
         k1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929174; x=1795533974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBPOLGbjQHm2dEs2LFQcVrcZ3yp94sR2RDaK/4V+R0U=;
        b=n3IT72BSXE538XwFMkwDz1F+uwMqcIi83fHHYMiuj6Rox0tbP840QPK4eKb7g1Id2X
         wdhf7ig3mwdkl414UXsNfQ49Waf039/plWTUd2A0v5h0K+R6XUT0+ZStF11DlmWLFRsj
         ManCJQMDS5P8kJuqQ3yrpT3rBS7V/Rs6bcXI6O3i7/au7CkSYZvuyZI6kSgH0c9f3tKP
         xFTKn9IeqZfTbNFchckdGpyfysHNXbUQRos18Q5w7vvErnpS8J0dme72vZNxfVf8BBI4
         u4HVFd2ww4tCAzRlS0xgH2KT2+HuzfoibWtI+s78XJLqFK5aCi0Ns6qGMkuad2kgWP1y
         qSLA==
X-Forwarded-Encrypted: i=1; AL+hErFEJD5VMfh4aMniQONnrEEtRMbqGxefC8htX8VxeDmm1FzCsfmYIUrk2I9O0aeyUbfvfr2HijPpB00WrqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lumZOAjiHWMyXIPPkHcbNMONUHzXjO38dy72q0BX+IvOzbZVv
	PbZ4yK+aOIfs85yGT6ljF9bKHL1Tu4K93DJLaSMzAZrdvodHadxF99/J/7n7Mvqi6TisKiyP5Jz
	Sw2cLI5O2Wlf1gnUMpxJ3ab23D5HZMksKDkkRe0mkF+FJzzaMJXQB5B0rv8UOSoKEld4=
X-Gm-Gg: AYBFou2XVDBZKpXO2lP3tHk7asaURwgiOMPb3PqvEI6PDF3WJCSpNDzlr237fZkpinV
	8Kfx3c8+feXyKj0n8QE8a6cc+bX9OgLzR3bsCRFJgTgA/1qfIxOugo1ypU4wnFnnlIkCG7K4u4D
	M+o4OvG74I68EBCrUvWZ3lHwcgCw7OiCLFIPc0b256c5Et8lEFUJAk0qmWP2IxWENy8JBygqhwm
	wEeOfDrmfQT0s5DG+uT75qh5xk/opKenPKfOsPTY6b3eM9LGmjAhaUa8frNVJg/00Mwv/z/DtFT
	V8Wt97X2NsnjQoaMtH1+5lcvkzt8k29s7fNVMrPlYXWN5dHAIs1OI6P0XUBAKhhWjxUfaM6nneO
	9/WAVMXfy+7sAV718PeKJsLykQNoSZFKIUBfnHpkQvqA9vNkJK1oyVoLjYEvK4k0=
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr3870747137.25.1794929174080;
        Tue, 17 Nov 2026 07:26:14 -0800 (PST)
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr3870721137.25.1794929173461;
        Tue, 17 Nov 2026 07:26:13 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm82176765e9.1.2026.11.17.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:26:11 -0800 (PST)
Date: Tue, 17 Nov 2026 16:26:11 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        LABBE Corentin <clabbe.montjoie@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
Message-ID: <avxyE59XdBkdK0Jc@lore-qca>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="4RtWT8mPemudz8XJ"
Content-Disposition: inline
In-Reply-To: <a1efeff8-2963-4859-bacb-55fdc1f5370c@bootlin.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXxrB7aa5psbCi
 JDbVdMoumFWg2w8b5RZNPtrg6v1cVlbfJdnKmiw8iw4inIM8kSdVIBkeHhjSvMBFJ0imxXGQIep
 g7PqoO7KKqmiADPvfxly6bwXDA/0B5w=
X-Proofpoint-ORIG-GUID: 6B4yPphlOZYe4FPFjE9xGuamt867NGlX
X-Proofpoint-GUID: 6B4yPphlOZYe4FPFjE9xGuamt867NGlX
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc7217 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=fy4Z4mAkg3wtpZJeIqMA:9 a=CjuIK1q_8ugA:10
 a=AU2tUvvXhtKScF8-c3EA:9 a=crWF4MFLhNY0qMRaF8an:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX1kWZzfeHPr4x
 rL+407U0+2qdQMNn6ppzDS5I++D+2XnQE3l9pVQT0ksm1xgK+DqItEqcwHmNgUhIj2TuBteh3ro
 xBkQCcmblBEiew9kJ4OMQufCthMKP4XT83OU9TkswOjO9U4Y/lWu0KUyOkw5MlX4klTOSUOMZ+l
 coQOnfMG7eQCFhDD0L5Pql3FJEOyk9TFt02BmjHfCblQtzCagO1hK4x82MPmYf3aMeOgcNH5HTP
 it00w1PKoOiLAy7RISe2KWqWjZI61GN6k9uEYCY+sFnuDkfqn8tdQG88yw6tqT/u543CYzItJUP
 tY+lUcmLOgaeT/XrSqQ16MNLeQ7VjzPTmip0xXSJHllhk5BjpbkLukri7+iS8CzJ+ajXM3w6s3z
 uwo+icZavoJs2YjTYH2BtZaJXCO8nVBE7ANVkhMzlBEcuMsmSpoZ5mKGj+bS2Lwd/ea6A4IQlOd
 r8MoKckwS3rIQRaUbCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061

--4RtWT8mPemudz8XJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> On 11/16/26 01:58, James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even after
> > ethtool reports RX checksumming as disabled.
> >=20
> > Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
> > offload leaves checksum validation to the network stack. Preserve the
> > callback's existing success return value.
> >=20
> > Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>=20
> Nice and simple, I tested that on an orangepi zero, with an allwinner
> H2+, and I can indeed see the difference as bad chksum packets are
> dropped on that core.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

>=20
> Maxime
>=20
>=20

--4RtWT8mPemudz8XJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavxyEwAKCRA6cBh0uS2t
rCitAQCwtjLO8o2NUJzAsuBjPyc3kLWkrELN5vyl2FxMXkSmiwD+NtH/Z63B68b9
5KXnXA59zeSZCmCwsKk9CxtQXtPZ5QY=
=oVi3
-----END PGP SIGNATURE-----

--4RtWT8mPemudz8XJ--
