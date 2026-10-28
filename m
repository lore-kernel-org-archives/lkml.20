Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207732;
	b=tz5XV+ZjMn3noSKOI10TAHTzS8VqRGslEmHhM/7I/4aUS4JlV9+c8aygJKGYhMBGoNKZ
	 1bN5dzb4IDTKjdWByDk9SGaNEdXN9qrgLzEH+wZcP5m+nHlj5gcBZIu6Q7fR+OCPCGQFS
	 /O0YA9vys2L5g1wMR7E89adSut5OMb2BUmZQ3yswW3GRoqMzSGWUm74iePLMLVdjTSsM/
	 /buLKxu2Pw2Q31wHmSpEQQlgaJVuXLW5galknZwRJgM9P7Xd/wBDkqRibgVVcfx4ngn7i
	 gfPQbAragruVCJnEkOydNpKcl3mqf0xhNGe1YWH4bqqzYJQGlH/aqZClriO9iafWBag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YmpkSWqeYoXJLNmVPmN3QN8gq4888rDnBVOunPZHDro=;
	b=TPYjMyDnE/BYujngoTLjY12MlNEJcpAGqpcgpYp9prrFe5Nr32WgtFc6Cd3G1SqQBe85
	 LnfMdEfQ9cBIhXwY0zXaxZvKCt1Hr2B2OwbGE2SUv2WXggtieqnLjhbn1SnNPZ56v2Q+D
	 QA7J6lt5Oh9QapAKrEW1KSbgJXS19zGfB5Mg1Ok9mVJoBX+TsLmkhRQCLRrcYQfomqqb/
	 9Xi93o1MCPFMoI70Auh5RiEJ56OmEqVdtCZEsXfYg3sfmjdNs7WoJCAXYEebHqA53mwsu
	 DvA2r+Hvggyz0z0f8rwiqIllofBfIFSiraGInBfZCzDp9D18jvxV8ON/DYShodJXLbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMAeb7yv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSJ1Rcd6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1198606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1198606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMAeb7yv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSJ1Rcd6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAjN61517022
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmpkSWqeYoXJLNmVPmN3QN8gq4888rDnBVOunPZHDro=; b=fMAeb7yvYXlKdJ/c
	dQ9g7I20T5Tu9QewcR12EqhNY84W2mFo7R46rEE+SrUkJ3V9orTv6CqWFOJEbk7d
	AeiFltoVYrMJMo8O2zpevTHSlQOmh8e0rxK8UedK1fsuZKLnbWm2flTKe+zWC4Up
	f33lio3t/Odoy3yCkSeiuND4D3LijAWbpu5Fv9OtNkNVAjbLP8B2w7RapxevcFp8
	g/49ngx8DA4gbv8sSz6pq+JKI+ZF/GbltoGYHYo+/xepcKgNlCY4wabKTBiZCaJO
	HOg0UR96Y16/5GEDqAmh22NjsE13tqIGMydffn3PZcsvxIXbVV9hEC63hHtOJL7K
	ILbK5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwam89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:15:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e80f7acc67so13735035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207730; cv=none;
        d=google.com; s=arc-20260327;
        b=bx8QuzqpcRXalrvlE25JPN29aye/jdTR4CO1g0zMjwFlVXImbq8VMCoUa72LRJPGmc
         ObO21Xm5FCkVBYCmeAvEmaYkZviDoMMRnRE9rpbCBqrN8QJTfywn8b608W1Tt7X8tdYe
         qlS9YVgTbAWE4V8q3O5rfa65OMVnFBIW0C/SEcHIDhyTcW3xvsPJnE445YeC5Dh7lj3w
         HkTGzcA994yM4HjJSjMXnboZdjP5UNK4LjPDjSEoP+Oauui2kzN9wTHelYfSilK9e+yB
         JRg8iKAC9mM+NDibN3MLTAfPgXuYjrwDPhX0ju8cQWBfrtXSKS8uQTMRHN+CxMW+aUKx
         8ueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YmpkSWqeYoXJLNmVPmN3QN8gq4888rDnBVOunPZHDro=;
        fh=hU+rE6Aos/jXV9a7ckmAy5DWC9nCHjFQLBKobqfvplI=;
        b=jRW7xuywypEqX5FE8XmTb3AyWFy3eYu6fiDN0Y9w2XAUJ16k4rYYLujFfn3+caoh+r
         jHSWZzz+HKXjJkfDkUBqNbhzfE+zb6mf392Szc0gbQsttLCgAHyiDBza0njeqwYMyI+e
         y/X9tlxgS1B6BDbNft5LJ8zKVR5ML3CbPxZmpjRHbogUkHK5nf0VVsY+sBvJKnrHea37
         CuI+fcvgGg4KHBK0eg36WRB2eHGgi56l9GkpaaiRr0Ezu7YX0M+XjKp7v0C/hQjg9Fku
         bx7lYv25UDHsGso4HvbruwSCAZ2dMqH/RgdSfZ2bPLtcXNpJe4/eyYsBHc992JbOVnuo
         0Rog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207730; x=1793812530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YmpkSWqeYoXJLNmVPmN3QN8gq4888rDnBVOunPZHDro=;
        b=TSJ1Rcd67p+a7muIL+bYa788xuUNd4J8XY0CiAlrcEsMpoUSM8IipweDTVGFhSAszj
         YUavdp8fRQ+GiUU0qfStvVSEMThsvaPh7bn8WgQpDuRekLW9pZwPyaY6UzkOw/rM9aOO
         +hPX1szXlfGb205Lsz/6oGm+nLUyvwjayASP1ATSoo2vrwLgcIbyUuig8YSOZ1XOPCXG
         VyoFRMUKgK2yzoUF9oORBAhJEGVO9vJCUdoDFas/HsM7wc2OTRk3XOw4AjN5MNT7uI1c
         uU6prtpXy7XAElIfx9qHeDa/9eN7Yxv3T/R86KHSVLB/NncUF+D1xaQksMksLQKkueRA
         I+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207730; x=1793812530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmpkSWqeYoXJLNmVPmN3QN8gq4888rDnBVOunPZHDro=;
        b=ACrnWyRfMgGDLc/we/N0Gz0eeqpCjydNlBX6IhAlsMNuMRzVz76/wIUzG+9pOeFLcC
         OKFZuu9VqY5VC2cMcPKO2TxI11jdAKj5REIDFl4fhZA4sxyY3Q8q9rBCdEV7fzVwHma3
         VOUPPNOhz8dm4ViFncWnjXbDmiOvxnQcTLTxY4PbPS/2XdGnQxbX9rToeu2JI0Wrkl8y
         e4ssWk/mvNPoTQHHsv62yZUWp8y0rZTizu+5/zMXGfmJyNYvEcLyUIVf+EhkBs8Fwugm
         mg9RtXV8pxDkwUb+jnI6lp1NWHIUJdrft1CDgFVQq6AQ/25WQN9lJNi3mbRkc+DIIJlJ
         +fuA==
X-Forwarded-Encrypted: i=1; AKwUvBzHAUhSqDYpwpfKlQ2sCz8uiobKIIi79cdOpGYUZPpIklv96SqoB95fYcOXk7DMUSdrp6JLYASyLr+qTDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIw2nitXHH7eYKB38l2sWqvXRHPym9CBqNTtfj50I/KZnLBkEe
	JhHTZIeYHmTLjulDKtVZ6Sjz7ZpL4UfLtJOX1PKwCqPlGxg8uRGDfJLbgEI1XWFEeGBFlm4xnbh
	aUQ8oeRD/7kXBfxNaVo29zBvdd08UqqGM6RuypU0boVG2GtP4SifTsyiKcxrFsxtzNtpLr0mU0D
	2UpaSUXS73GCvyQ7V/IDnMXWDe9PtpgsxsSejdAHgw+A==
X-Gm-Gg: AYBFou0N4H89SPkh24B2Cne8X1+nxF3rf/Uvvm4Z3sNxU1BCNjqHaVXi153A4QgsK/W
	RaIyjgRNErKAHjgXJi/T7S5q4Hsx/YxOKQzcHmA6yg9zrbPRHNMPTLge32gn44pcrbxrMIV025b
	8MtOaCTn0eYtSW4kNTDKBa6dVzc0QfFMdLgkT7HF3zTo6occEcu3t/OfkAzw==
X-Received: by 2002:a17:902:ce83:b0:2e8:f4f:ad04 with SMTP id d9443c01a7336-2eb003d8f19mr24877055ad.12.1793207730443;
        Wed, 28 Oct 2026 10:15:30 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2e8:f4f:ad04 with SMTP id
 d9443c01a7336-2eb003d8f19mr24876735ad.12.1793207729992; Wed, 28 Oct 2026
 10:15:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004102848.34563-1-joshuamulloy@gmail.com>
In-Reply-To: <20261004102848.34563-1-joshuamulloy@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:15:16 +0100
X-Gm-Features: AclHuK8gWfIFKp-b0kY1y4_xJzO5XJ-X_4HlEsDbtq_-rxGRjXpdy3mzMkpCL1M
Message-ID: <CAPx+jO-kr4gE=ixWA60QF8woRJCJcX0oG3hFBEETJi-XOO091g@mail.gmail.com>
Subject: Re: [PATCH] memstick: core: don't clear dev->driver in memstick_device_remove()
To: Joshua Mulloy <joshuamulloy@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>, Danilo Krummrich <dakr@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 2-ghbPYrEJmOWMU3-kesqkqFP-AprWLR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX1vas9DLfuOBA
 S/sP7IMgbXIgZUqfE0JM5ojQWt8Bdw+3gKDnDtY4PElPUbfjd72yCOZ1wwmDaW6zerlMz+6sOx7
 juTRfQ1eIMMpQjf9PC7Ekar/xZaFbpY=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae22db3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=pnkmKwQGO6ub1VrLFOsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 2-ghbPYrEJmOWMU3-kesqkqFP-AprWLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX16DdZJ1ecyTt
 y9CE6mPnVAG8Ip0/+uVS5y6jYvbmTIdUI1hip/6r/b3t7g5s0LUxpEU6tzoOTmGjcAvMCoD0oB2
 /2GV81+RR8Kwgf/9V50LMLPVrSs8oAkqhA3tKyMKES/zxlejvz/eMNIjaBT5OBOylykMQr3vs8V
 ziX++7t0YWzPTSG9RHRZOx6sNG3QGajqj4Y9U8tWZzt1QQPGqmHZQI0sYSM17xH3IkDlgPnMcoL
 3hHml8YVfF2ZcRHDhCVAEXaDxjQlC2ugLzezulF+PCBW7/uhfq+V32HPdJTcdrK3O4THcKxATR7
 LMa/2GlSyhGSFpKOCCnRsUgoOibeDZLwbyHrwPF30Jkc25zjMQZS/NxEt+U6ekU64XiVvyvtxAU
 LxiJ2BtRmC/Sz8PsTpdA4oTkq3cke//KNDM/zaZAECkwlB5snp2Q8SfcTxhvA60NaxuYTVQtvfQ
 x3ICmSM07rEmqS2hzgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Sun, Oct 4, 2026 at 12:29=E2=80=AFPM Joshua Mulloy <joshuamulloy@gmail.c=
om> wrote:
>
> memstick_device_remove() sets card->dev.driver to NULL after calling the
> driver's remove() callback. Since commit a995fe1a3aa7 ("rust: driver:
> drop device private data post unbind"), device_unbind_cleanup()
> dereferences dev->driver after the bus remove() callback has returned,
> so this should result in a NULL pointer dereference whenever a
> MemoryStick card is removed or its driver is unbound.
>
> The driver core clears dev->driver itself in device_unbind_cleanup(), so
> there is no need for the bus code to do it. Remove the assignment.
>
> This was found by code inspection, with the help of an AI coding
> assistant, after hitting the same bug in the TI FlashMedia bus code
> (drivers/misc/tifm_core.c), which oopsed on SD card removal. It has
> only been compile-tested: no MemoryStick hardware was available.
>
> Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind"=
)
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Joshua Mulloy <joshuamulloy@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> Compile-tested only (W=3D1, no warnings, current mainline); not runtime-
> tested. The same fix for drivers/misc/tifm_core.c, which was tested on
> hardware, has been sent separately.
>
>  drivers/memstick/core/memstick.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/mem=
stick.c
> index e03989c4e..06ee6faed 100644
> --- a/drivers/memstick/core/memstick.c
> +++ b/drivers/memstick/core/memstick.c
> @@ -100,7 +100,6 @@ static void memstick_device_remove(struct device *dev=
)
>
>         if (dev->driver && drv->remove) {
>                 drv->remove(card);
> -               card->dev.driver =3D NULL;
>         }
>
>         put_device(dev);
>
> base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
> prerequisite-patch-id: d9a5a385ce2ccea3eec18ee2168d603e951c6374
> --
> 2.53.0
>
