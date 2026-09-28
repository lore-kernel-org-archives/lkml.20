Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9844E9C3E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614317; cv=none; b=PZFiGBqor6TmPhxyKnJxLEBdWw/FpJBBr8IWmbr1e4zAoO01oYdbpal2c3HLT9FIvY85/ymDFYk9Dlgk17hEcYlemIifbgtbtFynLNqA/OpzuOfHq/KX/EGnK7k59RuY77d7dqw/+b2gTcKF3zR/hBjrJ9PYKuyv48ktVZY10Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614317; c=relaxed/simple;
	bh=M00uic8AvvE0BxLI2kWKEXPLKdvAB5ojyAyFLkti8iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYSJ9cIW3SpyXf9zPVmpELIIKA05WJNK41fYv9fJU3BMQLkyMW+tBR5VZm6dIQwfhbbzsdIzyQBocoG/2+aUop/TSey80tZn8P9rfK7kZh8IiYGNbcLfIVtakqpHdvitQMLA67DX/C8ucWtlNnzwuxH6D9qukzcAUkHBxVkaBlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZ5SaJsr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvQRIwc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZ5SaJsr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvQRIwc9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdurX1895304
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TBEwDTeJO1bAzkL7SkeN2AYJ
	AR0dEH6W3xkuViLva/g=; b=dZ5SaJsrrQev7bb1G2ZF9ct8LIrbJTfFCAg8u2L+
	Ap2eeNDZUphfcsLPPAoU+GmuiOTxO2TqZupjwp64S6OgWVUN1oeoYmuGHMyrL1VC
	4wU2djriWUa7QKFtEgLNhfDUHCY9hHbnLMWTqKw+w5Az3xFzzD1/y64tqRICtYMt
	x8EytUa3xmGtP09Tj7CCvjSzMqJ7NrzWgsvLVzA84KHkyU8RVaCZVP7gx9y0nvae
	z7PzjK0lA8ylCAlypoQPv+WHyrF0jvmJ8cVdBFWZRAJNIUZnvdbajzf6mjsZj5LQ
	qR5swhgMYp/kXPrzS/MQWG75PNpY9unsBh09nZ+Q3Rp/Sw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s2knc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:51:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b7aa329c5dso23175137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790614314; x=1791219114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBEwDTeJO1bAzkL7SkeN2AYJAR0dEH6W3xkuViLva/g=;
        b=ZvQRIwc91HjivWYDfIJl8SbD/W5y7+SMF7tjriLINFcebGL19b0Y6zZaPAiEte+YUt
         T3J0vuDyz+NTySQXH2WsKh161Lw/hshSiW1sdTRNWHTZLKQKafjxvNE4R5yJCEUPUpFt
         nSAZqY6zLTBSjTjajctecgUShPWcJqft7xikNHyV/O48wcWER90/LD7rA9414T/tQ69x
         LpEyjKfl69tpo9Bxy6ZcXH8uP8TutlypNXH640CZJyNQZm15snY53nBddyOYeSGBrjrP
         HHK4cIEjfst5trd8fftmvnC1gdZB2YKf0+zTzVgMwQ36xCmGlc3XKlTCudeidN8S/ktS
         Mx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614314; x=1791219114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBEwDTeJO1bAzkL7SkeN2AYJAR0dEH6W3xkuViLva/g=;
        b=un/+iYGkFnzkVxcAhPX3OgFOZsKLy6XOquHdrzBCNpZN3kpMseukDEiG1HR+UZG6Sw
         04J1h2MDh9kTzrknMELf6xOqXhJG9P+T2EXGICs8kIzuO4zHsW0SqrJXyqn0/tD6BmWk
         jkwQiqAECsUtGVEy9V60UZdeO6IddqJrGPvYrZmzIiLcldxM4YBAI2oOQBAFwmjgOV+X
         glsVeEgFCU1CC3J55EfFySuuOC3R+D51RzvRAk06srfsF2EOiUw5vMhOXRnz85e8cUSz
         0t3YPdpUh4RUI25829XpUsB4x13RLjG0kAEfmrAb4quxHr8Qg8ROeFMkQno6mVKjETXk
         v7OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJR3SlPhJRx2CKBrCznZk818xfxUELhTJ4om3qbifdXQ989ZSJaUCAfx7JODzAjncSunxMOqYj/ckjry0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9y0PO0c3OLTPYTBCf540k8DwNQvIZykOj42/3+SYr2hQBgJU3
	Jo1JX8TvShfctkGRS5vDVfwjCVULyHiniCHufevlw94jfE/KwSjKtmd8CBEijyqKgll8mmG2qgk
	lEY2Af1lyTMJ1uG4fF0hE9Q8BGF9DHjPc5Mmz2LRB+jAn4xQxrZPfjs/ZtFSEDRKpQJQ=
X-Gm-Gg: AYBFou2Qj/lQvQMImgqbL2zL8AtBJBBRJpLHCtuL/7pRpAJVpQKLtKYgYBCvTq2j76N
	deb/EKnQA+rlcvTd4y4ZJKmmR7aOuy8/Kbk8HWQtzyCrwu9VHNhBC0AnamthGTf4598U/aiY922
	iM7SyRFKaRVAIq8zlstdcOYXctVm5sQS6hQUffXLFAlShs2kuRl5Cs/GSv8329/cnRjKXHErTB2
	hainMEbDRkppcDlDCf6a/50gB9fSybebEXP3yIrPurFnLhzgnpTXg6pXOossZ8ed5YmYL+DJI5d
	QfqrXppqbogpfdsq9hAxgUMQ3gkV2VOQ91E1t1vAPqQzCGluilK5YAIeefVZ1I19DZdVUCG5f3K
	OOceydKd+sOHq5w==
X-Received: by 2002:a05:6102:8382:20b0:7b8:1f7b:5e98 with SMTP id ada2fe7eead31-7b81f7b65c8mr522763137.13.1790614313727;
        Mon, 28 Sep 2026 09:51:53 -0700 (PDT)
X-Received: by 2002:a05:6102:8382:20b0:7b8:1f7b:5e98 with SMTP id ada2fe7eead31-7b81f7b65c8mr522734137.13.1790614313013;
        Mon, 28 Sep 2026 09:51:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a314sm29445527f8f.6.2026.09.28.09.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:51:51 -0700 (PDT)
Date: Mon, 28 Sep 2026 18:51:51 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: Introduce hw queue priority
 offload
Message-ID: <arqbJyW6rZiy4-4c@lore-desk>
References: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vGo5f+qo7DXy1Scc"
Content-Disposition: inline
In-Reply-To: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfXzkkX0Ded+lMm
 qRzdPSV2KGDTpUjNksLTj8kcjHWNGa226KpVUXSbARF6qvy9vXSgDgMzVGBh4ekZZ+dNQA/MwFs
 aUDRORwzvuxyNB7FB4yauhEHb7q7wVVY0N+D6bNfSGZSabrw+a7ZfnosKVwoQflBeqbLrrWJ491
 gF6KAsTNp4eLlUVRvML2ZsaDG7VIUIx2M052xVWC2F9A+DZQ1nvLGskObxK8iDaDaX6QWQBYJtZ
 rfofTzQjTOCNoVAeMxTEpbGtvVPu6OEyT+VPX4RnaJT5yp1cPQMWS9qkEp/nyg/QW91NgUUhI+g
 cOuqzPtKmVZ53DcljHQ4g3Fh35hhBzIMJM/z8VzoOpWxXXxjGzBkrNXdsGWK3GJYtovMkkpciaG
 Y63us6P77Jzpa2k9l0VUMK/Bc7rOHlzvmyp4K3YsVzk4k6gDXdF+Dlxy0wH3yeH6tnZTP9iiBsd
 8Nc3/kz/ppXutAQcv2A==
X-Proofpoint-ORIG-GUID: GakANeyGDPvLmDdUkSpvz0z2q4bef7rV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfXwKBFOoK2tlRe
 YAb9faLKkZES9r7s5nZ2Bnup6U79mnTgCU3y7vBLiCf8ZNGLcPiZJcDSMPsQcDOPlnC0VrreILB
 BrdDo/LuAIoVkJW6ObjGbwqlhz89bC0=
X-Proofpoint-GUID: GakANeyGDPvLmDdUkSpvz0z2q4bef7rV
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba9b2b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UBftKYhPbWsmCYAP9PIA:9 a=CjuIK1q_8ugA:10
 a=UBkmr0p7e9xWzdnbdSAA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280067

--vGo5f+qo7DXy1Scc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. This feature requires the mqprio to be configured in channel
> mode.
> Do not overwrite real_num_tx_queues configured by the qdisc in
> stmmac_hw_setup().
>=20
> ---
> Changes in v2:
> - Forbid cbs queue offload if mqprio is already enabled.
> - SP requires 1:1 TC to TXQ map.
> - Fix the real_num_tx_queue overwrite during device open.
> - Require the qdisc to be configured in channel mode to enable hw queue
>   priority offload in order to not introduce any regression in the
>   previous driver behaviour.
> - Link to v1: https://lore.kernel.org/r/20260918-stmmac-mqprio-prio-offlo=
ad-v1-1-5328157fcb58@oss.qualcomm.com
>=20
> ---
> Lorenzo Bianconi (2):
>       net: stmmac: add tc mqprio hw queue priority offload
>       net: stmmac: align real_num_tx_queues to mqprio configuration
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   7 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  28 +++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 132 ++++++++++++++++=
++++--
>  4 files changed, 146 insertions(+), 23 deletions(-)
> ---
> base-commit: 6516ac5e6b164bf78fb34d36b4d84d495a07c844
> change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

I will fix sashiko's reported issues in v3.

Regards,
Lorenzo

>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--vGo5f+qo7DXy1Scc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarqbJwAKCRA6cBh0uS2t
rGwEAP9oEyG66/9samTs3kLG015oGLi4ZY8zTArmgBxztWzSnAD9EEmXN5lC8XDM
aaqDN+jFQC6d2CeuyiHYN8fDNZ19ggk=
=lTFk
-----END PGP SIGNATURE-----

--vGo5f+qo7DXy1Scc--
