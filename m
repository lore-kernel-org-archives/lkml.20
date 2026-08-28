Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C83EB0EF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907507; cv=pass; b=nJys9sRF2WD2B0O6Xi2916aZlgFO55pgpt7iq6z1g+9qN14ofx2WojPovX8Q9HKKhPwkL8sgD00xzUUX+ginoh9lTABBROmwib1bLvgEeqllSx1wAMm/GpJAToghWprjPQlnrIQU8JNK1RyhEn7+9z1HGdTRUj0AWKdPjvVXhKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907507; c=relaxed/simple;
	bh=1tsOIF7GoqjTfi40uyZxs9Vza8UXlgkEXcU+W5xhQJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+Dn01fVvB5WJ1VPjfmHloF+hcDG8JjetSMFmBDoq1Ve8BRkC10Pq6VJ50F/aN3Tc9CeWjFEyeCMnoosJHV72csHiG+SFyGWpbtirRvBigDw/cmv2fDQdqVvH1ZzBb0WUe8bwMBUrNIFkIpujBW5kBt/Cno3ZZzKBkolIfwxQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXtXKF5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiixQJdM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXtXKF5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiixQJdM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66gNq3205961
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h9qkRpA0u5mykihbpeoCW8HU
	7LRmqZIXoSQrDWLq8YY=; b=pXtXKF5yPk1BKfDBQCYDpjfC5+Ujrkw6ShRTS9M9
	abPLyOFuyzKreu3L1tMX2o+qXkeLAckAhc6+QyMjRnyMLT3fCFP7/1K/T5ty6XjX
	QZ0CjE39GhPmvhFXmCVrHZqpAck8XwVR07KgVfRTY+S+ycIkuIlmXlq1ZpiO5chK
	BxOS4pXOfw/CE/WNov+UHYsngtrgj4qkPsFOTCuin8tSLgUyCZyv9bogsSh+LRaw
	86a68TCzYMqOwLrxfIzd4G69CE5PvOvJg2hFvTa+MIzo/SIg1qhMJ71AuYdafD3f
	DGAy9FSTiHMo6+MJiwbr2bIBtLnDGktmaF/zmNN1vYxzIQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatfxk7r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66c70f4b830so1543569d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907503; cv=none;
        d=google.com; s=arc-20260327;
        b=rdMIxLrd0oKbNBOS9s1C/yModha5N7uad/5nsIk72pP0gVnOB1emvRDpKDoNM2Vgup
         V9Sm8pBbhHlSFSn03/yVK8gs5OBUtBly4fbfyvnWHkt6T1Hn3E98puSyjHAJ9ITUhGyD
         jR1Y8VrAEMK1ciZ2OwWpcYz3tk/dYpxjnGuo3NnXJFsgfgo3134gMKO2sv11nrRWDbGz
         xEFoXHlNbwbeZzklSU0ipnQMNn/cCIor2nGX5EgZhVq8EOFzK4kn8BR8UR9HilyUWB6x
         FZwnW7goKuQ2r/3bJTKuqPUJCnrSWBaDtKk5ceOIwBC6KJ2NgmDGDPX5HKpyQjmdn4F1
         faBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        fh=DiqzhMhjfKs0UJyYIZ7IisGH7Vx1Y880ayVmdJDUqd4=;
        b=mwiS6nmk5OrzJuEceYBENE7UKWL2F3gsk1js5ANJdP+bl5tFAPmyrJ5KR9T5glUFzc
         PeL5oAREpjuP7rA8wuTymE3jSyCZYx0QABuxUOya2A3vnpyYxh6QkZU5afDaD85RuDwe
         D8c5XD84T2a9stC0aSfVzkMNd1n8+KZ9+peoP+K1Gka52swH5CfI37uYYYKePUqsSeZK
         yBDS0enk3hSeZMvk6a+Ndy+8yEqswxD1ZkoDLAHbEu3lDMyD2L2Si9XQEQb05Tw7crF2
         dwvjz1+w1VlQ7AdyGbVIcjFk1DEcle+QDNNK7R7ATXsWoMKyNmnnWWNEAre4DDRLTTHn
         aKaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787907503; x=1788512303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=YiixQJdM5fptqa8SZjHzXQn/I5KIYhbs7E7W51MC4UDf8HuHeR6BleBUfibRNLkm3U
         w3bO3mEYlq5YSjD2GEKYFmHyaMGU833QKhGhmS/NVmCSjOH4iqJF9/VZRgj2pf7eZdG9
         KlqmJAV7uqsIL2q0SDRyEqQQm9i3KMSyj0LgCaDaFrp5RlyAWue6NGSbQMPeCDWJjCtY
         xK4CEDYF9BGICuiWpQcXVS0fL15NSJNoNDdRFV/I9pOwyRfHIZVeNJftmmBpo1GxqdJQ
         MHvchYL8PUugfX11cXhnV7NBE+uDpUzIKvkKDUEc6aTQuvW3TpVXHnQsr1Qz0ntHe7+n
         Snig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907503; x=1788512303;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=QBAdhvR7T5+0VBMHcOwaBkWMEZd5z96R5mgwZSmnImXfaE047kvQcBJ6BlEDLaYlgq
         NqQuq2gjZnYDo9g/htbP6VKO1U8XgH1DocnwteuwUDo1xCl+Ix3NRTvFs6PbhAjX/m2A
         8ICXqFMthncQrF8Ipu8MlmJmGJjIk/4UE6M68OC1a8on+WHy72Fs2MIIKCRgE2DUoeHj
         bvJsixoS5ijagttW22WOM65JX2ORlM9VKn4ALsrl+0/Fpe/eO5Moe4rtHqZqSXBIGNWz
         a28YQgTXrvAH5SjK03itix0EeyhfO7eN5vYMZTZMHl55TvTqIev4zmun2TMtAM134YRt
         FGiA==
X-Forwarded-Encrypted: i=1; AHgh+RqVB1ZzgFno07BFFZkLoqIEsqVIc9sN7Ly8L97BI2udwRWbVYYM0JtZsleJICRdy/S/ZY7dBYBeL9L7AwU=@vger.kernel.org
X-Gm-Message-State: AFuF++l5tCJmkcatYbZmNKxnm6YTt27ooymPSQi9AWzG/r/7e3raNokz
	0PnW5TQmUWl/Bc1NsnOA+8quH9/eZmo3OOkYwLo48aOY6qtrbCotvc+e73QJs1wHQK8LVvSlJf1
	VCrpbzR/ET7tBf/rD5OaPQgjzD8wWM3EbK63FxEXb+vw3kEoXGcHq0ipte8T+uMngtwa/ZvEccV
	y+yxFo+XLNX8NDipFXIeiq+zuLhdxuMjhGrf5HKTeapw==
X-Gm-Gg: AR+sD10k5ar24pcAGEKWi6RACRoTGQRXlSTH9iG+pXKGrrrW5/FL7ozOG0SMEb1iHIX
	x1u0u49cfbPhvH6WMuIsoVhaQwUz1jqFg3uluE8JwksrZjlwno/lPEjG/fxuLYskAxjb0bPgGZz
	2Baescp5b4mOQl6bsiSAdiAa6DkDP9eUQ7qLFUh+MwEgeNaBHhzzJMI8jzxSE=
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id 956f58d0204a3-66e4c6007a0mr1146611d50.8.1787907503463;
        Fri, 28 Aug 2026 01:58:23 -0700 (PDT)
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id
 956f58d0204a3-66e4c6007a0mr1146595d50.8.1787907503061; Fri, 28 Aug 2026
 01:58:23 -0700 (PDT)
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
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
In-Reply-To: <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:28:10 +0530
X-Gm-Features: AcwNN1UHIzNqBIGzwT_M18HWoKDt3V5mbkibZsr-oWOmOtjNKEOEnS-AEr9thQ4
Message-ID: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
X-Authority-Analysis: v=2.4 cv=UKLt2ify c=1 sm=1 tr=0 ts=6a914db0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8 a=VRosaQPrOrfO6Z3GwksA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: LDNwLfcFDNGOnBsFDgrwckceqQkOfFRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX0NipSn5Ized8
 OtGuhH0+ycmQXqcjCHLwRLMooMyJJvbeAwVm8cL47Pk2HOVxpwHOYrQOFZQHdRKXNCECpWpfXPF
 7kPS++Al/sndIwGGC8AFCoTcQMJmNWkbktdrvlGs4VOcMVPMOm4IQx5RQYZK+sJpKuLj5QF0dl+
 IcP+MG9WiZPY3t/gPCD/5F/kdmopstODYATyCjtnVvZ9etzkMz8+akTkoB7wHYNAiJTamfVqdEN
 BfkSqQSLRJYkae70n+Y5B+eLG88UZxvoh8+S22TZXCFPFCbW+xQUZ+KB58Ytv7RlzlLw8WjXv5C
 N3nWO0BTyf86UsdFPOfQ9E8f5iNr3jlZNiZj/d87PT64G7Fbd3d5VdWf2s4iZMIuBKQsGusJtjo
 nBIfC5RxRtCNj0X87Y1OwdNsB6dxKUZboD/3vWrtFzVDcMTx9BakHa1L1+igV/y0l/OisZhNj2h
 BKwG7klnC8A36kWK1jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX32ZRKetb/H/o
 rAopVkpiZACRQZPpyR48aB/n+H8y+iM2TVQ7R+5iiRgRQRtVN2YgwOzgGLh+S4R1EtK5r409ZiI
 iDagqq84W5ppq1I1aoYParAyFY03Nn4=
X-Proofpoint-ORIG-GUID: LDNwLfcFDNGOnBsFDgrwckceqQkOfFRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280076

> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
> >>>> card registration to fail.
> >>>>
> >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >>>> beyond the supported LPASS port range.
> >>>>
> >>>> Best Regards,
> >>>> Rafi.
> >>> Thanks for pointing this out. We can either add the range check for
> >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> >>> platforms.
> >>
> >> You should add these ids to
> >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> >> conflicts with common code.
> >>
> >> --srini
> > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>
> These are IDs that will be reused across both dsp and non-dsp solution.
> So it makes more sense to keep it in one single place to allow the
> hardware description (DT) unchanged across different software solutions.
>
>
> > would it be better to update the range check in common.c/common.h to
> > accommodate both LPASS and QAIF DAI ID ranges instead?
> No, that does not make sense because these numbering might conflicting
> with other ports in future.
>
> --srini
Srini, could you please confirm if adding QAIF DAIs to
qcom,q6dsp-lpass-ports.h is acceptable given that it increases
LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
drivers eg below
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
-Harendra
