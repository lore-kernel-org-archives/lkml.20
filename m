Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1CA28C5B1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994653; cv=pass; b=iUEjNQGWxpdxEi+J7Py3aXk4j3JfL6qQ+ewOYamLaRnuDXvMTjF8ox05O4Ia/eoRGmgEe4VqJA+AaT/aGD3xIcmm2lj/CsdXBiGavr1t3PsCQRzUk3ozVRnGpbCHdiG8hGNVo+T+57NEkEGTWRvm1GdR2qtc0+6suyooDp+ntVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994653; c=relaxed/simple;
	bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yc1xt9h2R3xboUcBWctcAmV5oKCVNdj+xOx24r0ZXmkBPFIg3caXApaCt8OP1pX9OifM8ilNvSU37vTfsrjG1LbMMJb5vclUrtGaAedE7LpkOGBeOwxppW4S4D10dZA54j6pcnThomkm/izxhuwMScODhhVsSjHs9Hr9i0qUH+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3O2LrFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O88IMThS; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3O2LrFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O88IMThS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T807tr647732
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9R0m/OtdoBNGH1Uc/ryAzaH
	BWvPsUBfW16dR7HZ5cc=; b=h3O2LrFRLjD+cR2dhW2tTnX8EG9JsdyMcU8Pzq5M
	RDn+8T6fA5lM+8fWIydv02iZ9pLjVIGqaYf5tiONU+ckgnqZKKl6A1LqeX3hcAKi
	daV5EA7nU5LEmirpW6rJmOzy34dHM4zDC2UkhPs861MXGodsn07PPse3IxUe42rh
	J2AujUuvquZJk2Hd+S+tJbDAeBoaIVnG6qjPWVeBrWTVKccJxewSmyMfd4mQO7IY
	CbJtbqJBrbK3YMQzYB9I6EwdFw1zIVDLqoSMP0NDWJFs44xBndqA1VxFsvIn4X8+
	zm+amfWEw2p/Lp5eC8aBLuooeAt+8kg7/LNT8kuk+xcKQA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq80en6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:10:50 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-855a66e5c76so43488397b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787994650; cv=none;
        d=google.com; s=arc-20260327;
        b=bjP/94+t6HcyWNBfx9y5//bOoXNIkbjbSY9umg4G2WhhsZ8ndAp5aRkkUIpXM/MU5Q
         4zQrtaiCzzl5EF+LnX/0puWe68GBs3XM0CIPqzIvXPOasK+BbDDBbnuWxvy3Eu3ovvQU
         9qd8jPA1lRLKot04azAybGyOjnvxbVkk2WdFoHER7HFunTg9Z3wWvFQw4paESCrNPe4m
         Sd9Kvd2DR11yoZSC88oqZNTdykkwrhthqWsNS+uF5oSLQXlXEdU/YnyRiys1WxsQdcXt
         MSPS2FfkLsRAels0y5NoumkyIMSk0tR9/15kUFpfMkUfGr+5t0ejypVU0lQzZbb42K4t
         mT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        fh=1tP383qfkRdkecu++uRfaXqlgDw+mECBT/OOh/N/EZw=;
        b=SinSt8hbIAqrK+5/MGSh/ObylR0IvuETZuDaZwyeuR845h1c3UaqnzZZfr4m3momE7
         Rv7avYn85FN2zdM3IKtyoR38bFDEXZxKwc5OvkoWo+sfMbNO2FCCIKokT8iGfE74FeQs
         YdBh63VgvHRTYXQp2pbwGrc8wtC5UhHe/rCsQJNWvDZ91hPBNsjEx5zJ3QKYyq2NvtQ4
         kKZb+Hk3B1W3QqkK6lQBcQxfGLMbzEHIMqISUr/O3uR/kYwEkQCq58Ni6KWJjBb2fzap
         XUahvSwnqR1L2VCYhe5ZqJ9cwU6s1r6Zj7rOImMHKW046AQ9lyh2kvHgqcM0NTzBOJkF
         gF6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787994650; x=1788599450; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=O88IMThSclac6UNP/V2QqYuETH7aLfjUFZTVGzTNS+iaDmaPCs/Yj9QyM5UasfiqFr
         HvZonxlHbHorBlzQ00Z/hbTCjOBdTfx9EabNPftI2IuZgxJvv8xRfxiN1BuAFhZ2+g5O
         h3pu4bDINIHe9OpEDBor1EPyM8mz26++8WtrsO7CktQsH6tp6/NYHMurVdVe0gHHxs1Q
         79a1Ftc7xt3P/LdotA5vC+xFtJiFfGBofjWIJALbegIoxJeti2gRM+6XYVeOwJnUoSaC
         iY0LlwCH9vncA3WT04PXR93by5td4WNlKt+ZwjJ/ohEOISHNvaxjbM5JoDhU6ry4peTF
         frrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787994650; x=1788599450;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=U8RreWTTlkpniD3xGsKGc2zXLFD08jyVUCyPwnsrCZOdP0Wf5kAupahBOr04Gli2hl
         Se/pazS2OP4t4rxZbc9GMKaVoekYjb+vQKXBPK327UgzsngiuLKD70oF7jL3F1jikFrH
         VqQbdVOaqr1r9lihhUkdWFqlqYjIBJa3Zrnbrs2MFlez8UOPsm2KGMCFh2WEm0Nfs4ZI
         x4zsIYqsuj8TscbNWigagxeL6zvjIK2+vlLYRIesuDUOVuS1o78TemQ4wX6NKElXrGBW
         OwJ92EZk6NWzEakO5baQrXyZE91P01DAkr9XCaZapwX8XmCIR5pyQq64Q6Nj7lF7lep8
         EdQA==
X-Forwarded-Encrypted: i=1; AKwUvBz5soQr2wCXY7z/8jmlJ6QSHjl5P8PG94DYBUmUwXiHRwy3Yx3xuwty5DIyOz7fib8z7JAWk0jBs398rS8=@vger.kernel.org
X-Gm-Message-State: AFuF++n3G3w3STmCGITrZq3yk8OI5OZJpaUJUmNChqr2GTFMfiS7jkg3
	HSBzbbf/sTcZRtOdGjY+2y7ggdwcVPpn1jK+8TreY+vMSTNNkIVK96VwcH5ax6X5NrA/n2+E/PU
	R+o4amP8IEdv5wA/FTYjbklBD7cfae6fBHhyPe4WZWnRGsHi+SDk2iENU5GMn3oPlI0/ENZYc2H
	AYoWvTuCtZ3o5ocBhcPApkPkwYu/RQPF5bw+yhMjX41A==
X-Gm-Gg: AYBFou1ro0sA9iA62FCqewgn7EWa+k35bgacZ2elHJz5f2RzStipY9BXny/DG6b193U
	qzi9TZuNYYWAWMZYUSzCICU16G/Xu3E3wYvnPBZuu4JS9oSSXe3IpUbxn0FT8tfZ/5Ag8QA/8g+
	FCqMs6SXgZyn/YWP//bx6C2KxodGo1DrsebVoA1RZ5tvdkG0oZjLEbjudenw==
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id 956f58d0204a3-66e4c43b71bmr3308157d50.13.1787994649707;
        Sat, 29 Aug 2026 02:10:49 -0700 (PDT)
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id
 956f58d0204a3-66e4c43b71bmr3308134d50.13.1787994647938; Sat, 29 Aug 2026
 02:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com> <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
In-Reply-To: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 14:40:36 +0530
X-Gm-Features: AcwNN1WZTqtwCy398rg4Jah6gCzauP506o5iczp3wsP_In2soqp-bDWVzQ4xo1g
Message-ID: <CAC-tS8BjRPjcFYMjuvyB-9uJkYB=rNkTUtDq9jF6EzgjKfb_qQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: qks7cj575yi3aRkCM9yXKRCX-SVBhxGy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfX/2zIUk74GuB4
 UyAcK+RgJSPiomVs26MiZz3HLdZKU7vRB8ZZkv/sMf/TszPT7AcKlx28A3zSKOi0hHQsoOT1BCq
 2srZoqCCweUk08KOHHwGQfnL3QuPBNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfXxwY6Ou+ryhOi
 JL2aoRuhcNhgrKdEdy/WYa/UxWNoEoU+6izXDiOB2Aisuuj7bhH+ERHhjvXPjaKuq/fPVEiWBcR
 MCuHGaleTLBPdH4Lp105kC34Pn6pNDeTfioc6F+YBUE7FgXx+m/6iYAi7kfxX5pOtoo1wHYAJMu
 FSGjxVCsSE4G+k1IXi1V4tc2wddcewumOV9XBYHyjdPGrs8TZmx9Y+LfAuh0Yvy8QfcKjk2NS63
 bAol3j0I7eQHUNNwRvPTahQGzkwvG4RKzURL4C8PhuQRL+NMBAlTBKHEEwOk/PeXpnHCJT7HlAH
 YMoiI35c2lxR1ZkcY/JCIwlf0Ym2LfVaduDJ+Dp+QdZibxfalEaRgm0GUNL9FGXXHJ/vp2tVkQq
 L7wuwSot3o0gLL6CiTMXFJE1GoqpaR3DGtmsxPZDf39wZRQzBeqC+t/VswryAbBZT7aWf+J4cbG
 oPB2utOtx3N8XdazNxQ==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a92a21a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=SUKUb0CtNzGe3DbvoegA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: qks7cj575yi3aRkCM9yXKRCX-SVBhxGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290078

> >> Srini, could you please confirm if adding QAIF DAIs to
> >> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> >> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> >> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
> >
> > BTW, the dai ids are already added by Prasad
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
> >
> >
> > You should use them.
>
> Correction, he only added QAIF clk ids, not the dai ids, Not sure why
> dai ids are missing.
>
> That also raises question on how did Prasad test it without the QAIF dai
> ids.
These IDs appear to have been introduced for QAIF interface clock
support in PRM SPF for DSP solution. Starting with HAWI, QAIF has been
in use.
>
>
> --srini
> >
> > to your question about increase in size, yes, this is know issue, i have
> > some changes to send which will remove the need of this static array
> > which should fix the concerns.
> >
> > But for now all the hardware dai ids for qualcomm SoCs should be in a
> > single place irrespective of dsp or non dsp solution.
> >
Understood. I will add QAIF DAI IDs in qcom,q6dsp-lpass-ports.h in the
next version.
-Harendra
