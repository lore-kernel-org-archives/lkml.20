Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191779;
	b=zcxvD61d9Apz9O9Tv4djAhdYEX+jY5QU0Qm/VLKf5sSShAZCa8Ulxn6pBxiq80O06Azb
	 jCpdN2L95nZ0anCnPw4/t1dVGHiQkoFK0DrcMhhWNF4RMD6v8la8MxY0dZSvrZFr7oiPc
	 iZm8B6PIS/H6LUAc9SBZuIqF4abELBv8cxNGAIAUhNOj/+LFXPcbZq//KuMUFoBDADntd
	 a25QSf3mWcWI2voLc4QW7dNwJgWmUEC7RZRXu/kBIaareh2ROMz86FNEN3O1PCFJ9AYdh
	 QaoNn5vJUQwp25kecXyrd1ZXmht/fs5AoRi0pf4RyKSGHqccWMAkTwp91OJLsvAtu9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
	b=hjbNn5xz3VLCv4MHLxJXNlfvHNbrEpKPlakil22USEH0XxtSWHh1pSCcF9fLGI2MtQkT
	 svo9xBUWe5cDfNEjudD7ARK32LKXQZ43T3zod/Sdi8rxt3Serj7/vjS8Jwqco6HCenvok
	 Yb8+8oCCJ/nYKkzTPQVXTfBsWxnOLunbRhuRSSIFx9P+ZtbXiniY5wXnMLcqoN76+dKLp
	 sBFH71ZX/6vu0e4T1KUC4iULzyQtKwbpY8GW87dx85JrZ42IFW6rF1HaMq/vPvL2BzK69
	 U9riLVLj/jY1J31Cx4zcB53SF8+OPf53U23yyHZvjO+H2fd0DDJZa6WAxSztByuTfsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kGcGygIb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRmMJUBG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768E5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kGcGygIb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRmMJUBG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2ZN4154745
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=; b=kGcGygIba6OVMRxE
	/L4EQh1pss1+HCJmr6bFeuZrBp0KPi9d8ZCiWo2EnnbCgC863kY29hhjZGFy8wuB
	gljCm76hohmROgJTbQz1dmhtOpxCiCd9JRfP8CxiS/ruADla1YUKIuXMMxmKMXuD
	E2KdVRSrTocxh6Uc//aSyxDLFQ9gaJNSUZQPuIcyOiCrei52HoUhYzPItn5dtLix
	QTw8nz1uRyXkLyLJrbqKk0dlrpH3DZ56K0NamXVNql/oAvm7nzvlt7u/ulbjFB0r
	6sbkh6NdLyA6ASFXHX2BKXFh9H5gFtITLQcQUl5SDLwag9+qDUXLcMQwaSfTXC5N
	3ZD/pQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0uqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:49:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so1514570eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191777; x=1793796577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
        b=MRmMJUBGI7BrfHmy5MQ8dGwsSEiKOckE6qfgzo48MhpVyA7MMOcaRE6J4HI0bRAApo
         eg+fyqEPudLtkgmkRiYtco84ryKBKZimKpObqplXfmivRmE0quxpoUy0aCIsm4ildeZW
         xpUNtxy1Jijp6ZUgkt1mv/kYYHQkuZpkXk1AzhOkowim/q8sWD2rdk+GZgQtcqm2qBMr
         S+izb9KX1SWLRbi8Y4HIBmJ+tniYENN5fU4N6c55iIrbfnguJfQKOy5P5AuFsD8jWa6y
         3ccKwc7sth9O48trizjnBZa2+I5rAwSEsV+9xiVp+WjQnsv+2EPR2lLEgvstm/MEioII
         i5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191777; x=1793796577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBxRy5SG66MmScsYDuUj/ykuDA1OANRhOsY43nPww/8=;
        b=sXMBtlf6LgGYzlE8El5d9WUCd5spltdw1AANYMpQ61l/dhoeAgaIJy63HXOOD/I8SB
         Ab6fRUl6qChccn/MgdWP0mR/qIfdf19aDn9tFqmBUI+jd6gH0pnq5Si5LV3s5PU/eDgh
         mtIBZiHjBqr4mCrziw8hYdYCWnObGl1lMvxW+TCZ/kLIW7LnCe32+VLv5yhMLPJOkoep
         H1OwEMyob3kdoF6W2enEmbbtmUmdYZIVYfHWw8DLVtw7lfpcWibipfWzlbwnYkgvqa7D
         THycFnaAV+YFvtD3Q2LLaqQdIW3EqbTkBerGZ80IU7pIz2cUvj5XoeaEkCAh9jNsLz0t
         u+YA==
X-Forwarded-Encrypted: i=1; AKwUvByeUevJkO5iaocoOCHonkrMXNcoe9ETd/UDInFRdNaLUsJcti//wRSt0Lg8/dZCJ0edXy/8BEj4vYpJM8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6iYk0vzSnHNlKtXHNopQ1lHWbtEBToEp64+o4QM8qM/IISUfP
	SvI9ogKTi/lYU4EJT8QvOpzfgDQ4rbwWj7PeqKKrBBsjJ4awHvjUY6OjQM+5jgMFqW0rFFv56lp
	u6D3uTCIVJawfTOM5MMW/vdvbMQRQOglAHtlzvRpWs7T4jfcK4VA/NsrYi4/dpSKs3MY=
X-Gm-Gg: AYBFou0/ypydheUToPzZ7NAifzFAR6Npi4YdDjt+gxLdszQPVKJDGJmBGVLQWBVLOJM
	ysnYhJNGMG6VTrBcH2/osw5ITw4uBH5UH3FQxWCNGVA0SfqT8cJk+BdMWff8nLsT6lDZnWEwwGV
	2TS/0AYOuW/qY5JylzK8q/+4ETp6mBCZ1yJ6z1dPvWYjBCFozSVueGrUNZNUf7g/PLiRihOT65K
	wxaWeTRBarMi9GRCvMK2Nl1H+2iqXQy/PkBTAmIB+Mjjm6fgzmErEFh0ya+YHy/LPlKGXn0hRE+
	yAzdOJ0GQbFEke71h96CIQOYtradfHGrVfEPErMxnPzVOWJYkMrmHFhnmq4djCUqPGTnzmVfqQa
	6BM0ARfbNihy4via33zW7daqmDnzj+GgKdnj0wxEakhZhBBz69tWULFMs5nTdg0nOZR/QZuEd4I
	G+7U3ka2H4
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr3806633eec.36.1793191776327;
        Wed, 28 Oct 2026 05:49:36 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c4:20b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a20427d57mr3806595eec.36.1793191775704;
        Wed, 28 Oct 2026 05:49:35 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm7401232eec.9.2026.10.28.05.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:49:35 -0700 (PDT)
Message-ID: <c64d095a-d725-477f-8421-14cc74dd0a09@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:19:29 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W2iZIHCMj_pv3qIuKUAS9ZrwcGBlIOqp
X-Proofpoint-ORIG-GUID: W2iZIHCMj_pv3qIuKUAS9ZrwcGBlIOqp
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1ef61 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Udm-XXnTmhyVqvlFBioA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX67DjGN3DjOeX
 VbtDz+4TgeITMSx9c1/qawGoN9BnOSdYIxMaCQJetsS35VsGTU7Ibtoobtb5a957pgMlQMQce/r
 buPnx4FAw3kJB7iIiyeqzGNKDJIbuwIF7+sKs4br4lkbKnOqRmThy5Yh6AOGEuZMlDgnaOOIn8P
 8IZZvxx8z3G1y/7zo0IM+jXvCYI4j4nUq8XBJZ2pTBORbIAYVU3/iBSjgm4obuIKkxI49/0WYir
 gRrxCln8tFSdwiy8SaaxSG/22iJdTKm+fhEvGnbqLmb8davxqZEk2ZNmOk27a/VU0MFXhtA4YAD
 U3+KE9ORnrPQVAfXjJf1iUwzAmWPYxy7uED02aRlJUCP/qUFK5V/UQsIyMqmDywRepH6poBmqzm
 VhjIIfpv1XIvxWxDcZpdvm5IVecwBj93ZNEZM1l/CuvMfaZ28GIrsmfEyal7nVXGKHUljw1jKOu
 1anfxRoW6mA1i8NdNHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX/K/L9IX2w8Xa
 rIak27/9z3OdFSFn9JgPMfN7iAOoZz6e450NxSIEJc30y0ByaHqTtr1S/HZKP9KiGrf2PDJl1CZ
 LsqXfk/qzasFKf+qbVtawhnLPfkdy3Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280050

>   
> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +};
> +
> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +};
> +
>   struct qcom_snd_soc_common {
>   	const char *driver_name;
>   	const struct snd_soc_dapm_widget *dapm_widgets;
> @@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
>   	.codec_sysclk_set = true,
>   };
>   
> +static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls = shikra_iqs_controls,
> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,


With cpu_dai_fmt unset, the CPU DAI falls back to SND_SOC_DAIFMT_BP_FP, while codec_dai_fmt configures the codec as SND_SOC_DAIFMT_CBP_CFP.

Wouldn't this configure both sides as clock providers? Which side is intended to provide BCLK/FSYNC on IQS?

Thanks,
Prasad

> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +};
> +
>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>   	.driver_name = "sm8450",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -611,6 +638,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
>   	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
> +	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
>   	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>
