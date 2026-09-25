Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FDC44062F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334214; cv=none; b=PhBtauAEzIn/lRDc7pinAqkoJODlJN6PBMSVe7ca901eE5gUFOJct6oT3vPd9pKFAkQBkIEBtGJ22qKQgdFo28Syd4qmCk+iDdb0X/QZ7L709IKK3qKfe1Qp5MrzQpyadcRsAIdrhtOHfJMQu6Ute+4DW7kwwX5N4BXJQKLuCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334214; c=relaxed/simple;
	bh=NrOkTLU9aNS6hrvJ6qdUXdLjRzSoJw9qNpjM9yVrK6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3zECuborKUJsh/sgBw2Xxp6AAquNdaL+ux12msmo9Dn8RPcT5emkagJCYJrBJepjQbbm3SmaVRBtQSrNt3Q2FN7krNez5h8xTYke+Ag5+q/Nu3csC595qTl/wKb1UetMNXrVVIGwvGPx1b4YMTNQdMTupPQWAcEdqG0pYCHXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8SJlM1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUdm+8VF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8SJlM1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUdm+8VF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z2xH1194495
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KL5UvpKHjzpyxWhNGv3591jL
	faKqMWyF0eLovdVJgck=; b=h8SJlM1opHmnGymsHaTRDEHKvmL9+e3QVetJkJ3i
	9jw5a5FJ7Cp+O1glWFBGzl29UZqmQgNSsq4/6Gs57GWgTNG1ASnk7HELCgciBBMT
	uSTYoU84eVK+CqNWekYhkLrtbYQFgMOwlcl17YOQrhuAluPwBX3uewKW71EvEa5/
	XWhcK2PHbFjl9RordTtUjXuo0VWyXGRs0L4QJMw2kPLhGRjzLaOq5DQsqxUuMOkD
	j9K0nwJgJM64bMSregfTs3zKL0+KCiC1KwqxBYkxI9Xa8fwKTlYphmQ+AG2syVCK
	pP2PhKHZfMYG50MdN1LuZ7oECpjVGaXkj4srjuV9Ej631A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k4wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:03:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so181348e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790334211; x=1790939011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KL5UvpKHjzpyxWhNGv3591jLfaKqMWyF0eLovdVJgck=;
        b=PUdm+8VFwhf5CvYKq7KppljkUrYN/kohJ6Kb4w2nKl8d3KXqRUVe5bMvjblt67dLQ7
         7IB9SC7YtwMd/302fvBXBy9Det2Jk+D1wtwaNFHMPe8393iqBQcfHoRIVULusuia8PTE
         OtQLQsHZAuewngu0FAxulq/AqFVA1u/cEQ5BOZJnj4PbkXj0I70H6NBd2ddt8tG8h2S5
         ZeRfRRnYM0akdYKRNVGYjw7Ewvo3GIfPoDB0xy/mBcKKCREtRYx6OPebnGpcB3dw39Y2
         VI28k2lHQtVpbic0M4E61NwoKB+djnsPL+j7rdUOzqgyUqscDhqo7EYcie9nNdJ0oabH
         IePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334211; x=1790939011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KL5UvpKHjzpyxWhNGv3591jLfaKqMWyF0eLovdVJgck=;
        b=lLXIZU8eWAlW3ZJs/6htIAZyoXwN+Uktdq6HOqUO3hJGHIaUYHYwjSEQMJGCkD6AdV
         +MUnKMpv4wScE4GXOOce/Ns02BANz224revb2G0eCvIKn+SirHJLecifB9PSC730jS7x
         1QbsF0CmNzV7DF6FtK4kcdOuVozeC0cG9Z+gKdXollV5tSuqrWTcOPH7WrJoyG2stDKm
         E+XTxPCo1v4EHDrUyZHxRAKzQGOPsNAuAY50wk3RTTCzcLnYgLYnbql/k8r8Udj5cASW
         GPfLqczDyo73epHbeIWVRQz1oQWMyNMN3ZgZFuh9a8ZQZ97LJPa/OdO8dwEKCX9+S8uK
         rb7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzs7qnOeqYdcTVxjT4OaMM8ctOcQo76ow9Rg0JyiTzBkJ6IrSK0qHJuzdPFJGJpfdpOdlJsuMCWPiIUwB8=@vger.kernel.org
X-Gm-Message-State: AFuF++lCtuq9fZOuTw0NqkD5pKA2Yy5BvTRkX+GBCA4azZrP0Y6awvPD
	BGk8XxnUBMO5RfPKzeMbiXi3tbrdfAcmgOOqdwvu7+LyHcGH0lAwhMCjkf2B5Dn9Neu582tkRJd
	sVyui29tWmCmMAt4DtGiph2wPFF3CSLJERrRT6ITET/AkrYlKmpzO+v9TuYEDQWqe5/c=
X-Gm-Gg: AYBFou3fvMwtfSN2LlElqLEDFcQB3FS2GsQsWU5xZHHJ3LHw0iShteayJvwqjE9pVHo
	mVfu9PgHEqi1D5ScXvZ2+UtNSNLZLyeAD6DQP6eC3FKT9fZ7k6vOuIwjXbv1ZQ2T/MCU8t40NS5
	b2tUxQOu1rVxjo9IIwQsO7CVQIhCqk0f0Xi8OLvVUgZLW819PxI08Y+D5FFmJzHtSwJr0NUh67g
	9h348mr5EoNvyYgEXa0B5La6Yaz3x5Gjx06jFXsdnFYKoWdQsjwDQGzMxRskEz/fKuxxjfvK4VO
	nCoEGq39TUeQEZEva8haX+FEiUcAdcrdsfN9RTxgJaXQkjPv0aHYmFua5Z4Qk7bsJgsSu7EtMX8
	n7NSBdoSbvoXj9w==
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2080934137.21.1790334210475;
        Fri, 25 Sep 2026 04:03:30 -0700 (PDT)
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2080917137.21.1790334209864;
        Fri, 25 Sep 2026 04:03:29 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff04440e2sm48935915e9.0.2026.09.25.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:03:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:03:28 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 5/9] net: pcs: xpcs: initialize runtime PM
 as suspended
Message-ID: <arZVAEHs04xLNXTu@lore-desk>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lVoFIgUXX7x55kE9"
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: P6Dv6cesw1q7fTvI_DZLzFXyPVXxahyu
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab65503 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=05hQUwIZQIh6G6I0U8UA:9 a=CjuIK1q_8ugA:10 a=QVkzxUxUNwT0qHlZT5MA:9
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX8qsNjmGc7Dk1
 CUNGVla5OuGquyLY6Ut/N+IOBms0fWAd25dUZNt9geE6VdcTZRUBCXB4RdmL3oEMIiwZRs17i71
 oXqjHfKIM4fOt16YYnHP0Zx5JPNrw53dVrokrWxCHTZ0XZV2x7vtL+PXIIL+omtK3bN7uRgnX6v
 hSuO7RApjhtd0AO856bljI9M3+KdGa1SWakzlHhhzNqX4OBcvtPeYV0xjVwmGydiz1b/D/xevK0
 4NA7wfQ0yjd2KMENCWeO+7NoIvMzAW7wtfdQ3ZCVWhs9i/3fSloIXkIh/gWy8cE7W/cPa7ID1EL
 U4IAiBIVs5yFZw1CD0wxBm0wKVYush4wEImRQF2J0BM1BLp4EiZRfetekqZjclHhAjVucQQZiOW
 ft1VF0yTr4dv6I5rYwPK8uZwo9Z1oR3xcyPIjxPGdmWNxrT5d9E5/SWzImoFm9LolzEDOSGRMFN
 mGrvjjXdEyT87LzQMuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX+KBddF3+St0e
 Hjws+UXVHSJ0Dx3QjRIQkRUuOe80vCRDjYuQlh9dorWR91uGcGB+f2cULbJZodXwg4Sc3z/sCbd
 vYe42/fn8VcMyyxKT1JIYClI22jAiV8=
X-Proofpoint-GUID: P6Dv6cesw1q7fTvI_DZLzFXyPVXxahyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250043

--lVoFIgUXX7x55kE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> xpcs_plat_init_clk() acquires the optional CSR clock but does not
> prepare or enable it. Marking the device runtime-active at that point
> makes the PM core assume that the hardware is already powered.
>=20
> On Nord, once the XPCS CSR clock was described, the first
> pm_runtime_resume_and_get() accessed XPCS registers without invoking
> runtime_resume() to enable the clock. The matching runtime put then
> invoked runtime_suspend() and attempted to disable a clock which was
> never enabled, producing an already-disabled clock warning.
>=20
> Initialize the runtime-PM state as suspended instead. The first
> register access now runs the resume callback and enables the CSR clock,
> while the subsequent suspend callback performs the matching disable.
> Check and propagate the state-transition error as part of probe.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

This patch seems a fix to me even for other SoCs. The pcs device is marked
as 'PM active' in xpcs_plat_init_clk() but the CSR clock is not actually
enabled. Moreover, the CSR clock will not be enabled even in the pm ops
since xpcs_plat_pm_runtime_resume() will not be executed (the device is
already as PM active). Am I missing something?

Regards,
Lorenzo

> ---
>  drivers/net/pcs/pcs-xpcs-plat.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-p=
lat.c
> index e013a5253a22651220e62352d03faabc3a3c3658..328c50940d46eb8e7bea06ecd=
1a20214e3cde61c 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
> @@ -322,7 +322,11 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *p=
xpcs)
>  		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
>  				     "Failed to get CSR clock\n");
> =20
> -	pm_runtime_set_active(dev);
> +	ret =3D pm_runtime_set_suspended(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to set runtime-PM suspended state\n");
> +
>  	ret =3D devm_pm_runtime_enable(dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable runtime-PM\n");
>=20
> --=20
> 2.34.1
>=20

--lVoFIgUXX7x55kE9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZVAAAKCRA6cBh0uS2t
rLCrAQCobR+wMwviJitki0D8UXg+bk1Lsss+ylzGxdzBJPlCvwEA06MlQVLUPViq
8IliKoIeVuqVM6Tj5hwuPKqdwtvAwws=
=qJHD
-----END PGP SIGNATURE-----

--lVoFIgUXX7x55kE9--
