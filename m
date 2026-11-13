Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794570413;
	b=u+avzX4gfd033udUklPCiZE2eqxevyFkLYG1L62RlVc4dbg4KcGXH4o8syRvAENe50ek
	 LQFLEotSW6CWWsDf1c2SPOJdEDhPutPOlWTVn5bi8HVLl6kgyBW1qE5pa1145ixRTn5Qg
	 xOYjqEnCNxyRAYFtr+Cv8by0AZ7a+yNwZqjQVXl+EJI20bVzJ6/dEY3CG1VH5VLnUsuOW
	 Ayx7+1oH1Lmz/R2ELrdwywwWjrR6dB5ZZNyS/7UxxT2zl0An/vvcaV1QgLI+W4FRfcFlC
	 cOjHC6GnfVaMe65fE+tNTTcd6Fxt34H44RJzN65mF0/u5P1TqdSVHqcEVLjeMYB6IwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
	b=avIl6mTvuY9bwT8U3+nypF3wOf1kt4PtdxH9HkQkgHwJMM2bHETwCjzGQ1wROWmlrKFk
	 UT65G4GLSsJjkL4rZTIeeEZQkI9OmcjevRy3cWZHzbrRMsJFAltHGqoKPQjPopU9ckjbn
	 hjiSKsb0hkfWjNRahch/r+v9Wj6oufYHxCuBlsu/qcyr8G6hcw2aVYcLiyoWBheAhDaJQ
	 ULqddaX1jZEpiHEhSWXu/8UNySCQr0+kx61nuq+1ABYN0E4BT1LkPUi/quoAXQJwIIqMa
	 efYxqu8Ss9nRJSVenoCCVODzy+Ii/x8UxBkldKQdaIJzISFck7bZ/kxppBZZXo9/fCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFD0Xox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXWnh4rS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16990606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16990606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFD0Xox;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXWnh4rS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8UvHB3164540
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=; b=TLFD0XoxjBWwGNSh
	40KMNOgMybCIzGVhmLjmJEqCgTsYKSL87b9ScPTKF/1zuGxpo7YLfwNOw0QMwkQd
	JPRVAg4qv6GNtqUluc8F5Y3hQqV0SH7ROcNcG5wxunqqqPQwumWNtdsxPqVC45Fu
	hWmQC/5ZdcFXfnmRu3yoxBR4v8t6+e97A2lbm/VUrlpBwQoEHr/S99qKLjsYOplL
	vU2t+yvJkLpMVAGziPWUHFB0zLsS45bubJQ6ThuYYBkwv6dpiIo3R5PRb2NtltFW
	vlXZlBoNDguUuSc5mMGLsBlntCBTpXrvoC1oEL7qzma+8zwCpHNZ/aNqoK9QLog5
	4YFbTQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2msh5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:46:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso458879a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570412; cv=none;
        d=google.com; s=arc-20260327;
        b=PUGsXd+A2cVEd0xRXQGfVqKUviftin3FQ+yOzHVnysoThLOMDINOJdbgr5n6UnNKZy
         eEuraHGY6KtDsMh28l2oz+t2dJBAxddeezBFkrAd/z6XswO1IFi6Rt7JIRKyQGPu8OrP
         ZvoDd2noboYZvlWmOTkn3k7xcRPXzxiJx1Mcd5ILfMP4jhaZXlOyF/xaeHrXLOrFANks
         NcJ4mMAMKVdNy6fef/NZvOSlbDwl5Mq2reh0pTJLYdZH+xWLz6/4a/r8YF/OnYHE2zbu
         M1HHHGuZ41ZfmGp3Ie/p37S6iyddzKkQTi0VLr9nEksJLO4dDJs20Jv3ngqzcVfA6k9y
         NZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
        fh=Mh5w4C8yg4sviTpMVK0cbmAWc4dqpv80PEqxNQO1AMM=;
        b=YM5/su7d7/Sr5DEsoezBHHvfSLC6wmabN5BlGdB2WCr33Y8qHEMOBXOH6ibWYshMvI
         1k58BRedygqkE+er+Yhv1vaQvTR6CjL8339DPnHCa62fFZK9fGZ83RIQwzYMptCycvOd
         yRpqOD3syUSNactwvgEd0E2sqe7i/y5aUhaTwvK+nhchSYrJkKhtWgPLEQy9pxPoFg/p
         RsgR31LSwSOaKNuNacBB2eOgCsbPWU+vZn9Fzl5zfeIKhf0I374M6xm2X/+DNOKfCVe3
         VsPudDSqpCv2cTiy5miZqji5syTD/Vk3lhQ5bCX1jVwvgdiAU704rSqg1wki5XYsFdXR
         CvOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794570412; x=1795175212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
        b=ZXWnh4rSONknL2E1sRKilFH7Sh09Ot6DYntBpJ7+g1zzm8oBc1dgzDCesjSf+dFLgk
         uMwWbCNrZ8nyeTYoByMqNhO8sDYuEze9B3CgiKAkaddU6lW08aJsERWtAEi+MFsqzkhl
         8OuNPl9Ql5GwadDpnLQV/ZUEck/hMMWvxkgt5WQu+3tYgQ85Ys+0o+6lUWF6JvkntL3h
         pru1tx9a1ehVGyd/zk/vqRBBUTL+KaTeTDsAnel3Tu77XA7sOhvqBD3Ri9EqRWD7EkSS
         Yizi8I6Og8tKC3StrTr61ZXGsvFLzYj8ZZzICcXdYKFUtyxinABMifr/RzL8NAEWumhk
         eWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570412; x=1795175212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvrKIGgMsKekaZ4OYmJWDRmxhlP6pZF+z/6bpyikrIw=;
        b=cGLlSLKGopwowJTCIkSgZ61Sg7gR1n8txAJSvOgicLGBVnvSABqPHwolUFuoNlB8Oe
         Yn4FtRO9TWoHAz7wqIVkJz/aNJ3/XCVEDROJeqeYu+TiyN03LQ/WZigV9VG1D6RfkBir
         mvPXuhtUilZPw5MbvejC/ctIkC4JQnxNtNJNp/0uyhiuoIPANVccPG2Wh/cQIpWUn8J4
         +eVEWmNl7A0L4ffJWMQEaxnMXnYAAkEQ2B+XNzChAds8sHS0xh26PsOfV8uyKSSXVLdu
         xABWrlgWlkQrwo+jzX+mMejrRxa26QBtqnz+ixZyGR3/4mmXtsTzR63wmPpRSinbbobp
         6Daw==
X-Forwarded-Encrypted: i=1; AL+hErH5HLUupKOc7c+qXl+Tnbsyw/GdcHJw+HyDV2Xy+gw66vDlMaKXfPSIfdYq8Oy+EdWi7XQQ9x6182QcZcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LXt6I5JAuxKFZSf04tEuVvsbTV96Xup+07D0zoqpwBl67gyKP
	Xc26157/zWesVAg/fXIXoC7ZThDFElU4gL4wf0Svj0xS2pZdofRZptAwvpQmpiwentc9Ee8o/S/
	kCEWFxld2+c+nR/L7Y+BaPmmCojutBPIe3M8pa0aEqgabGgx8iqeA0mZEtOQnBYsk3O7G4PMKdM
	f3M37SCL7ZektyMiweZrg88PsvBCVbRZVYZOhnxAx1Ag==
X-Gm-Gg: AYBFou1r6Da4bb7PuOQppI+aMMBz3YYy8bq69gVtUP2pXMZ/ULpZf1htiC+3aHUzJYx
	uYPYgCWJ5LBgagwQAAZtseskZmzQuKBaNk7PxYK48jPWSFoqVDgE1CBavvxkbcuNNJ/vehKw4Ba
	CB9ZOdNPuH7ZDVFimbIQTol5+Rd3qg+F9duFOJ4lUrPH4mSrjl0cH9DL7kkg==
X-Received: by 2002:a17:90b:1807:b0:3aa:fdad:7d6c with SMTP id 98e67ed59e1d1-3b1b0ca59a4mr2048298a91.58.1794570411524;
        Fri, 13 Nov 2026 03:46:51 -0800 (PST)
X-Received: by 2002:a17:90b:1807:b0:3aa:fdad:7d6c with SMTP id
 98e67ed59e1d1-3b1b0ca59a4mr2048283a91.58.1794570411076; Fri, 13 Nov 2026
 03:46:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030215427.488298-1-marex@nabladev.com> <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com> <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
 <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
In-Reply-To: <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:46:38 +0100
X-Gm-Features: AclHuK-rL4pW5II5yik8DeEMNv996e0C2bZMPptbleGKQZzyv7whzH6lt4_bHnk
Message-ID: <CAPx+jO8=nVBUuOQ==Q66nOnH+VeXur88DetmETe8qmOiS_NCWQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Marek Vasut <marex@nabladev.com>
Cc: linux-mmc@vger.kernel.org,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, kernel@dh-electronics.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: o_9ojV0ggiQnCBVUypqT82BfUZ6eIAdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX4MRRYrI5Bkib
 57Gttj4jd4xap5SiD1Pc2vNEB4JkFB0eL5anp9Ol1FLFFqpVP4VOPcY3SqbZJC2G2QPMSzVmdbl
 KX/B65NSJWBwLBsy2G70aQlcCiRgIFXzdWdRZc+28n5ihQdx22+BXG5hM9c+I3IgSwZj0rPlk7Y
 aFVFDekywLSeljf5s8XOtUHx25h9IcQp5ZrYmIarsyln7EBvmTHtyYyguK4xFDzm0DyGW4sZ4kZ
 Ahnt7dIgIMi6LkUZiXcz0whTX4udH7/N9VbDBNWCrQo3rXaVdA7kxzBg2/+8bcFpUNgyJgVJ97X
 jerOkf/SxJ1ffw1CpOnzuJ9KtwYoNlvyVgS20DpNk7X8gw/9rz+lgFELqbATxzm1kZoZYwRfmxw
 MU9L8lSUWTwv62hNgA3qQOsFb9dC1RX6b0bCaM/k7Ju377h3QgAn8TZpufIJq7VYiC/KEhagV5f
 yE2wdJWNJR2maoDH8Bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX6HQwOiIfs5T0
 JUudgQl6XnYj2TkbONniOXyWRsjt8CPQuNIBAQnuPHMw8qtwTlLd+cmsyWJEEzxqUYL3CS5jNBy
 j1gt6pjXJY9cBnh8UtsPvXp5lFxgsbk=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6f8ac cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=p-LfKV-GAAAA:8 a=sA2VMIrPSRRtzz563tQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=97BuGM4RKn6GwmfqMd6i:22
X-Proofpoint-GUID: o_9ojV0ggiQnCBVUypqT82BfUZ6eIAdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130046

On Thu, Nov 12, 2026 at 7:26=E2=80=AFAM Marek Vasut <marex@nabladev.com> wr=
ote:
>
> On 11/11/26 12:45 PM, Ulf Hansson wrote:
>
> Hello Ulf,
>
> >>>> -       if (ios.power_mode =3D=3D MMC_POWER_OFF) {
> >>>> +       if (ios.power_mode =3D=3D MMC_POWER_OFF ||
> >>>> +           ios.power_mode =3D=3D MMC_POWER_UP) {
> >>>>                   /* Only a reset could power-off sdmmc */
> >>>>                   reset_control_assert(host->rst);
> >>>>                   udelay(2);
> >>>
> >>> What exactly will this reset?
> >> The controller.
> >
> > Okay, I see.
> >
> > In that case, this reset also makes us reset preceding updates to any
> > other registers, for example the clock register. I would not recommend
> > doing that here, but perhaps there is no better option.
>
> Does that pose a problem in the MMC_POWER_OFF/UP state ? I agree this
> would pose a problem in the MMC_POWER_ON state, but here the card is not =
ON.

I think it is a problem, yes. If you have a closer look at what
happens in mmci_set_ios(), I think you will agree.

>
> > If I may I suggest an alternative solution, perhaps we can manage this
> > in the ->runtime_resume() callback instead. If the power_mode =3D=3D
> > MMC_POWER_OFF, perhaps do this reset there instead? Would that work?

Can you try this?

> >
> > Anothing thing that caught my eyes was the MCI_STM32_PWR_CYC bit that
> > gets written at MMC_POWER_OFF. This bit becomes cached in
> > host->pwr_reg, hence it's also rewritten at MMC_POWER_ON. Is that
> > intentional?
> I _think_ so, this seems to be used to power cycle the card.

Well, we are not power-cycling the card at MMC_POWER_ON, we are turning it =
on.

Seems like we could use some support from the ST guys to understand this be=
tter.

Kind regards
Uffe
