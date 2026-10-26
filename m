Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793010137;
	b=QEazkuk8thdrbz/28jrvX60DfgXcfYCefS+ITyy2tGM87TQ3kaByyD1EMX9+ytBlXNrf
	 d7dpK9NljHCCY0Vyn2Ri6N0npSOFXj9xoQynxonLwQ29ID/3NIEf7+b9yapQ1ncLLxRXO
	 eNIN5bgAMJYYIcc/ExbtdQNkKNAAMALTrujK4RVroG91EPSa9/iNWnVk8SeWpyZhn7sJ5
	 GIveO36exWDYrS0Zao7gdUGq7VPWEw3vN7Irb8kwpQ+2xtwPbYeqic43lPQ4Rre+9DSmV
	 +fyPZNRrnNiupNaMel0oIy534wUf5CAKfnhc4oNoidAQfmIyy5MqAFN/YXul+J1ZaqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
	b=cu8ck4Uw5ask6itahQy2dbgZgQoGD6HLcQtZ2x1wkfm+V03qjD/IEPo+gGSXvjC1IM4y
	 aFpthF175y/fsYsHyVNT1k2r3ORzzdZcaZRDV4rQHWAPd39aEayqeMrSv/1htJFeEIvIs
	 EjwuO6PYlRlBebsyqBVMsVhV2k+NAzGBxvxQVobl/pT391aQWeYeQ1A7rLoxZJu072KLJ
	 l78yiAsAMHJd9g+uq4k1a52BNpnRjbdVuJyzdJ3OgA8poqYaL99Gg1Lgf/YhMH5TpV2mC
	 8hYlyQVWlB+jCLGk8EEbxiMt+huqElIeRaMPbj6zzurIrcn4LnV08Bo3RxyQUwWoUIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm4QzNr0;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D39606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D39606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm4QzNr0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aT2O1708665
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=; b=DzghUXN3GTriIoQo
	uVKgpHKJuKi2N+Uxol72TGifH6HJfclAUE27lq7LK+SiKWdF5BDiybBP6PaNCyao
	75JN3do5HIGuGXpP36SEc0/JhsOceDOA5od4cqpVX0RY8iF/zZMnHvKoC03XejAZ
	saR6NQAfwO+CavhgH1S3C0H+3flrzrG1XmEZLyvxeCJMX3+0+UwWUd9Re5itBGD2
	W4UxjqyodaKDeTL9yNScNt/YynzCv/AfJmS92TqJQHTK1T2lUgoo9kASCHnf7O0X
	KV7ha4iPcf5OwVVCuw4kFn+SMzY5KuRDoSs2H3yWohI045L/e0TrqFk5LjfFItax
	HjipPA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9yvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so405621137.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010134; cv=none;
        d=google.com; s=arc-20260327;
        b=R+/fVItVmiUSEISeeAcQln8/2Z0FOJlxT8ZlsgLniXEC/3jogfM+aRRClyntMRLrQl
         sVH8PlN6y7QG0w6S5hcdHrQYgegWiYKqKwaqtmQsxonzPjqT9HFQaEG/MHgmC35PdSPM
         yZDm19CpZfp/GzwOs9q8ayHhDIfmxTSdPjY/GUNOTWC8HzbO3kwj1p/HhLgPnI3jBhgh
         aQFTzgHhM2vpxeMQRG6fHa8p0R0CJuaUvu+Fs+/yFlIGgO9b1aDm62cWgyErtNGGVDab
         hrAnajuursrxljwpwg/HuSCHsVIoReNQ2aGPvngCJNnVcCk8n1B5DNLiK++yjfnPfQlT
         bzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        fh=go8EpjnB45/vC9k/86uQxftbIDE10xYPAwuS8jSUCHk=;
        b=jlZMEwsFRRVTkfMYm2ot6LB4TJeHAmaFehci8KiG48aVLzt+qgWJ01sld8oDTJNvx2
         3xppoLXjL6A4EHrK/RDAhJXkfCRMc+vdrDxZIikPQKJFaphf/5Z9U71e9eJw08cYgyCG
         jlUonXoNB25SnmsMZw/2yV6UZpPw/dtgIr0rCbHy+46xrt6aFdZJspskwbvhJc3YU4b8
         njSwJvOxzq6/olWkZeVqCwOY2EdpPSCKFdsogUEbEohVWAl0RGC4hVgDmZwAW8JsU5yR
         NUix0Zk/S4cC9oZb7BSaoDVCVl/lb7QDxPuJK1T4VmeN3n2ynMENz2E+luEc6TCkXWf6
         OmIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010134; x=1793614934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=Sm4QzNr0n24T0+J4lycYDwCzkN+SN1F3Hd1Fru9eln1Dz3/qIM9wBSdv15Zp8pQ+IN
         anhtzW0tNObCndoYH05AsmLLhNOQhRhzJAiskTtcMypCkdKw73KL/wWOK8m6RFN/obsH
         lCE0GDeej+fyAc6DLudjRMwv/VrpqDPj47pWhgLFgMwt33mGhaCELcfYxj4U0yXm6/n3
         udE+bVcMq6OyAgdYH1zWxjYBRpIKd90ATASrTbRmUVaMr4Q0BCfErQU31RTwT1PS76hG
         cbeEbSBjpz1AwvNBhBalIc9U+rxI51z/izin9Gk1OSHUlTBjKgXXPCoWWKFtGaGGZ8sL
         4NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010134; x=1793614934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=FVV9pj1x7pFjdZx129GuENcH5MRl2MOQ8XENY4PRvRbyyroadjxMYGcD5F54JvDZ8C
         FMpTQHueLIu6mHiaqB4F8tyP6sGPtFNYlvPL42T8aZMtJuEblmiUAi30YpjZD6p/liCv
         y5zEk0N+w8fEaWiIdD1nSieu5r1+a0BnTEjJODV5QwEx8eydOGN4kcEJHrTAlco22Dce
         uhjWtVR1b8nqc6HY63JVCMX/03yXbn+F+T+erX6TadKOb79eGV0RWkSZZ4HCRfCv6U79
         cTTtnJ2/zL5N23d9+5iPTS/9cW32osFsJkviVEsygugsWIEKWkzTwVBUeUzr/IiEFJDj
         KPow==
X-Forwarded-Encrypted: i=1; AKwUvByEXX1SzXYuqruuzRIwJSs85+m1pfGwH5a2q+uTtGd7iAhvbpgxbpfbzR2nJ+6C1dmc8wjif2OzD4FvZRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm4E5AMv0zV0Iq3zQ/hH1F0EUv2c3thmOuWwySTFxubWuE/nV9
	LXk1Vdufl6NHdZT/Z+OB4/dgCXEjazzWFAj3WUIS+UmvTHf1KvDeudFAC7Cap8ytHulAdH2N3BJ
	8xQVrA6wmMwl4bta5NhDfnZDGstjWLaygUU2C7LXbKYjMHP+67PNXohY3fT4m+l6IJkRhVY8+ta
	tu81JuqTisLHW8nMTPbiR0Mr8GDiDBfRzHuVlRCtvdzw==
X-Gm-Gg: AYBFou1Q5UCNKp/rM5PN5GLWBD8vfHCopJe0rriZcZZeyhyd+j0coaROjE7/xwv94Cs
	jF6NS8/KE2NV26H2NzCHv0RcmNlmy5Erqd/6lHabt7yqlldH/U8cxa2+9Oqt9r+zI35C6pd8UQz
	GPzt8OqGYuArxMvZBpjHpBbhy6SGiw5blkQZ6NJ9134AX6XGq90ON3Xm08a6JQuvwH8TcnnRI4m
	aTM1pcU5qu78CRz9A==
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7ce5ccddaf8mr1532820137.12.1793010134546;
        Mon, 26 Oct 2026 03:22:14 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7ce5ccddaf8mr1532813137.12.1793010134104; Mon, 26 Oct 2026
 03:22:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
In-Reply-To: <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:22:02 +0800
X-Gm-Features: AclHuK_xlm6aQdEz-Css4rzUDVJF4QbmrIMsutgXwCB88U0Xqwpq1be9I71U3vE
Message-ID: <CACbMrhrJTacHvdJ7eext9ucxwo4=XEDnnxxtL+DSpYzw+ozKxQ@mail.gmail.com>
Subject: Re: [PATCH v22 09/14] media: qcom: camss: vfe: Add support for VFE 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: my0KGxJK7ZirkwzFdoYS_mFeeVXd6fsF
X-Proofpoint-GUID: my0KGxJK7ZirkwzFdoYS_mFeeVXd6fsF
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf29d7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=q1ahQF__i1vN_A3V8cEA:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX3wSZ+DmAcZ7h
 yRRpspWO1aGDS4XFOwldrvXNLQ26at0kbcJ3xAy8iaku1yCczGOHQTP3GGTptlosf0iuqTD0uNQ
 UKXcwqgSKHvWU2wvHZ73C1PI9Y47gEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX0NB60tLS5zeM
 WxOR1SMyAAMt4wVHf+ADJdxXlihAg2vqCrWH1onRm958F+LHBsTcBOE21h/5CaUkSdF1PUbFEIR
 iUscCa8TL92QP4ftSitF3uNqBVwZMBBM4XRqIpEOOGBjQwqumdTNLQ+goqhZAcIJCHTs/zQ+6Aw
 bfHfaHu0S18prQ1w63WDCRpIwmF/qlamqEvmYOrs2SZLKKT6BQlI4NkSxVVnKbXSQIqoIpO/yyU
 RE9LQsnZAqzDmRQ1dPbJnlwI8ITF4ZIGdYycndAUeAe/eRxzj4ymeyHAnXAWkCWWTgj6QF5BwNC
 XrvlMCIbFoTRCUkZXYSiYI2659k+CIdSJJbFlzr8bgFWAdN+X7ph8V+e2GESQ0AfzEVVufqFQxU
 mICM+t+xRj+vhA2aOkhU/sOxRaI9SIAIH/lXOmlNzf8cnk6eQOhq2+x2KdRpGeGM+g9pD/asJV8
 JO6Z/60GzStvlu9cujQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On 10/26/2026 6:00 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>>
[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/p=
latform/qcom/camss/camss.c
>> index 7acace363fc2..beca4b827b32 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -156,6 +156,152 @@ static const struct camss_subdev_resources csid_re=
s_kaanapali[] =3D {
>>          }
>>   };
>>
>> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
>> + * to operate on any TFE Full.
>> + */
>> +static const struct camss_subdev_resources vfe_res_kaanapali[] =3D {
>> +       /* VFE0 - TFE Full */
>> +       {
>> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +                          "vfe0_fast_ahb", "vfe0",
>> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debu=
g_xo" },
>
> Now that we have pm_clk in the main camss_resources structure, it
> would make sense to move common/top-level clocks, such as the AHB
> clocks, to it. That would avoid having to duplicate them across each
> individual sub-block.
>

Thanks for pointing this out. I double-checked it, and this makes
perfect sense. I'll move the common/top-level clocks to pm_clk.

---
Best Regards,
Hangxiang
