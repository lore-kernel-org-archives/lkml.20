Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B21B3C0A07
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792351; cv=pass; b=ilwaQFK7WQASYu9TH3HZbfnGy96RrDn6IITP5Et8h13L914jqwyeQH/K0g2+8WA4r4pa9acFxfP7d5Vo8bqwhU3LCRR3MF1EfJp5UaVGyxhff6irYaaUG1jC5X1i7GYY58/u0Znc6vmjeno/KTlSYBRQrgp2C/rl/7sSzF171DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792351; c=relaxed/simple;
	bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNPuJ7WQ+bsNonQsepAjkzad/CnFw68JDHPHD0qCVO/egA//GAxiTRWCExvv63uPPsn9dGqPlDQo/SiGQz+agAP6BQ6w33l4d356Eu71K7IHTymB1+PAnzjcpkWaOLsNKOCrNQDCplR48hnP9XytvekzuAvPLveV06AYCsbxOv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsCmWEf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSh0rt5V; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsCmWEf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSh0rt5V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DeHHY3607031
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 14:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4KaEx79l/Qo9EXLcB4JmwpQu
	z9/m4i42cFxTh0FVROg=; b=HsCmWEf4i7abXHZFCxX36UJ/9JBW+WwyXSLb/io4
	h6c3l0meFY4K2wrqAPYwPDPhN0liIYKcNmOIacP64rf0ANUhS8t/RGECdChJkO/f
	E1lR9F5KZ3anF9NnpI1PbFk00h25NRbBu3KZTXIKZviecOxgLcFrNryH7X/QY3X4
	QN15qgqVLNttQIjclPIyjVyA2hXMv882k4GG9Tb2kr4VaTdk0K3zQvE4yj2cLKCX
	hkqFT6NfIbbDP/8Dq1V7DI5lVb/kOVLU69oTr5RRxzqpOUd7CXfpPR9HeYGcUhcD
	J03VdSEIX3y+UdzFXHcSlzwGdq575M4hfwBJ4LPdu05Q8g==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxku5ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:45:48 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-86e8abd719aso60637467b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788792348; cv=none;
        d=google.com; s=arc-20260327;
        b=oc8cp5TDt7OYrWPH4Q9Jhgqwwmv5Id1yOxS0EH5ax/P67vOvb4RT56FMIBGkVvG+ah
         s/Yzyk6lPIP1QXHUKdDkVS2pVHGKTPIbTTeFQ/c0UR5m+Ii9MksFpZ03XB+fQgKLBZwe
         wN8x/xl09M6IpOtriRd1IksPDIYM4sRDZ8dPLwH+9dR+oSFoXRMhoEAY+NHlah59+qSO
         /5fo+TtM2x2Zid2GjrzYVaA6pB9ZwQOR5vRLLbcuLjZxhwcjFM+06nUHL0AptNK57Y9/
         VryQTXCElF/H8WY9aMm0mApieipH2neQQM718Og4uvfx6Ev788Bcj0ZM02IjS94K4hns
         DqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        fh=PAKUh9vvSCH4xbgQMcE1aASj9ZablUY2Cqfe/5BIVCs=;
        b=kRhNUmbPe8e08az/2JVLcPM2p/IlIsgfttIAF/Vhhsd+JbMlRcN3v+f29YQDObwYXf
         ojiu6nljpcaYLUsRVMhXzPUlvxCSZQYK8sHt+O1sSvd9oxdNG4Hoc6Wf1xDxP7MM5mTE
         nzUmjJ1jp3mHPtiibUiek5F13A0DLMem+9BVVrMBazIgsNYvQWombxWOSK1M6KDnW3Jd
         KMSVN98OWjyN4OT84tQAOGW+0yUvPKy6St10aIygmglWvPDnHx95Q6TwJQC9dPWAR+yP
         xM+KTImj4evplfciSouI3MyXSMZphyonsdEb2he6vQUuuEaqVO5y3/WEPnXsx00bRdFX
         xVuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788792348; x=1789397148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        b=GSh0rt5VSadtGpqLmWn9waEjl3l+Moq2hiUmtJ2fMRaEDk4HTb5vG7gn9L0MBfR1Jy
         P2NdTlSDbuHnkxz7aKPhdWrMEC5JQm2QlKgvAb0+Uhl8iLLL5Av2saTe/Z8Z0+0+ggKt
         GJEMIMHKOUUisvIHhvtN0F3F6vTMoYO27MpLFF8oBPDIorHqAaqVZXsdwYAU3QYL91q2
         fqro1rTpujo9JXvSedM5Hzs17/x/f3vuRCpBsbAnSA3u3u/1h5b3ICICNFEws5aH3TkU
         MxVIfPjgXEVeypkmKJ5IY+1k+WdSxY8DIp00nKC3RJVdYJaaHWw6Uf4KdwqiU/M79G6B
         LGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792348; x=1789397148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        b=hYiKM/dqpPttiz8NiObi7XDvPe6swhVq8oXrah+YkYpKtT1AkNeFnwqorm2aNRB1dP
         fSQpB/k7G4bzJAcC4WzELcFR2jCvzFR5KUs7+8R+jVU3BEJghkq/vVCLv3uDqCHgqQE5
         EiO5FE/xRiKWMz4dE3q9LtK9EiAqdMUzC6GZfVlxnLM2hg2XxHfetCTDRzpXDE7dQRFq
         /3r4n1/sCNNlZ0asq/zmVmE+7iu7tMQMYjda9reNa4t25ZZDAxOzTzPy/N85Uj6JsbXR
         ynxDL/y4hg3uIxpOUJHZnoByoO/rU2y1rbRwpCF9sbB0BeaSV5c4xubAzLpN3h8bTbiC
         kEwQ==
X-Forwarded-Encrypted: i=1; AKwUvByNrmwQs/Qw4X8EEUCP6KMJjKiDtWBxncULPPwHR0TN9iXvj1/znK2KtYyKKrI5dDiGta129ue5di0s88I=@vger.kernel.org
X-Gm-Message-State: AFuF++lVDLyR2FuRApMeGasbnxLVA4VuLQBu77K0Vfasut2DNwRxIAlC
	XdZMsqMK0W3SAYVKf4XHcn6vH7dhrULNeR4rnk1L57go97SnoGgQl5NFOWN/k9YJLWnBi/5FDxt
	sA/IlHrRLEaRPgCVTuyZ/xjbiz/HNVPqJMxUcMNaYpIsnjEXEP7IzL27cDGmmEGE8Opwn1Rxf0o
	qlQrEoH7+CYQ0N3Xo8fAt0M7+gVxG5TjkF3p9iQX4hVw==
X-Gm-Gg: AYBFou2GRobPbdVDkD+tmb5Z2DoCUZQ4L92CEGXcqbzfYaQzwWRNKAzuRPe2t6Jf6Fl
	3lo/4mirW22eAtWwcaHHQy8Tq1GclySRlSi+u9yFng5bYLD+snNEQp3gHyawjkw4docTeadjKGP
	UkQnGXQk/Q+Wz2qqR3OTi1razW82qavFqBRz0zAvn3HA+L/TVd4FaVuYzYcQ==
X-Received: by 2002:a05:690e:450c:20b0:66f:bc17:4f18 with SMTP id 956f58d0204a3-66fbc1754c3mr3690246d50.30.1788792348449;
        Mon, 07 Sep 2026 07:45:48 -0700 (PDT)
X-Received: by 2002:a05:690e:450c:20b0:66f:bc17:4f18 with SMTP id
 956f58d0204a3-66fbc1754c3mr3690226d50.30.1788792348076; Mon, 07 Sep 2026
 07:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <CAC-tS8BVw6hbgA82V1mYL_3CG4Jdodr-DQbGfM4FzMMdCLbc0g@mail.gmail.com>
 <934b1e87-3ebe-4a6c-a925-6b3993cdcec7@kernel.org>
In-Reply-To: <934b1e87-3ebe-4a6c-a925-6b3993cdcec7@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 20:15:36 +0530
X-Gm-Features: AcwNN1X7F4Saf6Z-HB7nxKe8O53d3EFKPM70E0Ja_RmgPGm_qltV-8Gse5aESAI
Message-ID: <CAC-tS8BY_th+qa2DogXSZofkX8KaPJfL6iphX5_TX37NXMA5AA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MyBTYWx0ZWRfX29Vz+KH62Lk6
 e/LeCMlJCt/T73wsAtOeAorUUQ316iCsT7qo5z2M3n2XoAw+Y8hRQYobthn0Cquskasooh5dkZn
 vupfCD0GDrT4xZiRg7vabaBri2pCdzuHZvdZbmxputZHE1U9ad20thd5uy4tMJeYj0bGRnFPgXh
 xivECSRRUIz85RxnIqfbKagh9FX2sVUjkh9SVYBau3bIyH4c2qfxnTQf5CQxAPgpbep3lA5yiSG
 wYDL26whN2gu9QFkA+xnrtziaROm1pVZFwVWNwf07RsBroc+76lQm3juutdxkF0fFSKoWyIOQI6
 EvLrUJC1w+kCfcp4KbWLhlLj31zNZVdytO/am98YnOmIaaGe7T5OSvwAWdckmn8fQAhnRSkBZb0
 +lkxXczL9H3FDQuRbUT0ZTMx11zexgGE27S3p5o3iw7st45wig22GHsxPs9YPuCd2TZd0OjDy4t
 6I7jAQTR7fAGpy5Hk8A==
X-Proofpoint-GUID: MBvSWE1XznODXDAsQXTWiPHfa-z4y5wj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MyBTYWx0ZWRfX12q+Kb8I7NAm
 c1xUJDccgBPsZBiYKe1AOrdp8ofHHFaGG8sXeTEqod6KSYx63EK+2G7QKRoP0oCSmCsoNyzKXQF
 VDyoZMcxYOPbeGf865+NSoPmPMyYiNI=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ece1d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=emP4cCs2JGfxw6IAegoA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: MBvSWE1XznODXDAsQXTWiPHfa-z4y5wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070163

> > the binding intentionally allows subsets for future SoCs or board
> > configurations where not all interfaces are wired up.
>
> If the board does not need to enable them, then driver should simply not
> do that. The clocks are still there, so the clocks are required.
>
Understood. I have already raised version 5 using b4, Kindly review
version 5. I will address this comment in the next version along with
other comments.
-Harendra
