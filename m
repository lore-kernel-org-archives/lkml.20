Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685280;
	b=MyjjJXBNZCLEGHXjBFFYC4yE3BIoWZMqkcfYI88akyXKgnSdQLrv/UXLoIjgPRjelqs5
	 Zsq221LPLr16iGlyLSMFIrd7u8UkXobHYKvsJ5NNNPw0Dwicbd8awd0YOeSXLy8WJJQST
	 mcCoJrUJWcQSSscEI4deGQCtAFRKGtq5S/7CEwpfrxC7qeR202ORsD+rmcdNFQAisLz9D
	 6p9g1IY7r/qARva636bk3NVmUCOeYkXjaj3rEZh4o2cFDgvmPancBueFrjXghDigmD+gD
	 pBIXTd1foH0Jvn4I0eYjhw5IyeO45G2tk8BbAP29oqgLCWKJfvrHmLzOjz3rIJRLBJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
	b=x5ywS8O0OZoDaudGgK/OEjyHayHg/Ojwlq7VwOUF+GXx+Mjm2lfBIRa4Ivn61n5OYH9D
	 m063qwDzoSvX9O/47WCL5niAWwddDj1AirS/l6jX/b91XBg6T4UXiXuKMyuxYnoYm7VSN
	 hqpy3GyjT2obqpwM4NqVdlEQozrqqihj45RRCfT/GCzKfHpbV7NcOIRbfe+atYKsPZ/uZ
	 LfMMPqiPOsGVeYECp1OKRgHIQlWuvg6DXROpypBmd+CkvhighUsKaZoucJkcUqugrQX00
	 oszXAowjhRabfzR2nw4NN9lRnq2H5w52zfr2Fa45flshGNWhuDKiiMAvktr2Y2U79rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDvJatAA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOhkkQMr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4F606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F4F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDvJatAA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOhkkQMr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFVKZ4098326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=; b=SDvJatAAVPIIVtEt
	EheiKoLEV5P/+uT9bE17Ch9o19/8L9giDLTqZMjB0N/WJeeiKADlhBI5fzEuimj2
	Txjfgk3th7MAzvKboQwBE1shfw8PDnjYFPPmR+uJlYHnQOpkHDYB06d2J00jtEo0
	FJBxsORhB01j0D+NHf8rQH3qzmXUb1DQPQDJmOQnGj9GulgZCf0XuJU+uTrxiVPh
	j2YS5SzK8GFKNoO4CZPFCHTLhBU4vES8LAdljQXn5wpsoavkjfQTxi7PQVcYosEz
	KkqYZz+1t6F1LAc6ig7nHBrTm3UyYfO1UKJJNpBKJEpHEKsXc/Pw0zo//JfYQcNU
	axx0Uw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq3ew2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:07:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so3258508eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792685272; x=1793290072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
        b=TOhkkQMrbFikNyiGk1LgwmHcJyae4EdAtbpvige1UQTTx3LUhGbcDHuOGVCF6cqxhr
         6waYErcAI5XempbzwjDXCwsyEMMjkZhZuJ+1DJ1BUZc2efaU3GWzii+FWEWIAMzwjMF9
         BQivbkoQt77Jq6f6aO8cCHIFiVWRnSgO1znjvmLoc91S3B5XAEoBz5XpEWLA+8JNxX4N
         wIF4Bzeo5Cx/AO0FNl0K3YPQu4I1HbjU5sIy0OFMB3FDwj6dsb5YAGyTFCze/9zClM7w
         WsyBwcTW/lvOrVawtt5VP87vNA5OppmluXUjrdgzE6vN78o5pXOCi4qBaI64hSS7NwpZ
         TvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685272; x=1793290072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvLjnA+g80xDDOloUKTJVnDZv7ahI9jhwQBN1yw6YCE=;
        b=i/eOmFR2fJWc69rYbNxDt88N3eZ9UmEHY1oBvFSg7acaczRZkX+SrQ93jpZe1KzeLV
         6iTvCE4PLNL/6BoyMhL1p/V6fHZR1ZcbmS4m+Z42MwS7B7PHA2AHUBc9lSo5O/mgocJ0
         PeEaY7/7sSQb8Y9FReWDZ0ufg1Qrqd0fYhaQ1EEbiJcbjBxJG1h0vRvlnPUFK4ITHhbo
         jbzosnJRIwrAdJ2iMRUZpMc4fyZuxzyhzLekwDlgrVKop5en7GgZ5IDC8uGxxDCFsy/J
         zFwCiK9bPyiyxt5gw57aZ1GgqpLOB3i3J/sDPD5bGKGBwbnyK13jWL+wMVu/OBb9kD0H
         2ogw==
X-Forwarded-Encrypted: i=1; AKwUvBw/VgiivoLzwja4B2FrLkzs0IkRRJL1og6vxwr0ZB7kp9SGHM2pG/2U251BI+4yetsDHmTa+/Nsq4x7c5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxWMTB6O02dC2pY/FDuIRSj6k7yGJo9FdJLYWXJa6JzoCoJhI9
	std2LeSAQAznENqbR+8gSkN40h+15G0Wtx3uM1atjwDnkzNEEso1rS0wI5tIDjGkdCaoD9GdzAb
	92MDw4LRMwEMk2DJftvTQWLzs47i+yeDz4uh/Wwt4HaONpgHBcyX7938mPRpYoquUQgk=
X-Gm-Gg: AYBFou3ctyPDGohmgWZv9EH1X44zzx+3U5AaaCtSURkYR0ORfRWtbqOB701ZGZOuz5x
	UkLGoNoUpjTw1hpdeyzWZ08zvEJP0Jea38RGH9I1wI5fSoPV/vSl4QRWK9Tpk32S6P0lr/8DPQ+
	DPn52sSZenq6jsnFXNj6Ie64xNp57H7S0q9cBIeoswTbC0bc2zo0gTgvzhRl+6CXzxbJWOLcO3U
	milHVtfB/OTwmOvycO9hC3kvOVinTqZ4QEYWa/OFnmUpUDtpN0PzSZT5ADzxzIKYVkwi5MuXM6H
	B0Ff4MbCL3yfEWeuqGnGmvKKX0D+U8hZeWCLtWknItdyzVmptgsf8cBGmtewPMrylgysDYnRYOH
	rJmo/siV1+WvXgmlAIHejOvQECw==
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr6741545eec.37.1792685271539;
        Thu, 22 Oct 2026 09:07:51 -0700 (PDT)
X-Received: by 2002:a05:7300:a206:b0:35d:8c39:b314 with SMTP id 5a478bee46e88-3674f22497bmr6741516eec.37.1792685270960;
        Thu, 22 Oct 2026 09:07:50 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm25689760eec.24.2026.10.22.09.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:07:50 -0700 (PDT)
Message-ID: <4e08bcac-66ee-41b4-a2b7-65797ec0e3f0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:37:44 +0530
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
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk
 compatible support
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-6-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 644XPkthAy3yjGf47daFnXma5CK-nffc
X-Proofpoint-ORIG-GUID: 644XPkthAy3yjGf47daFnXma5CK-nffc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX8G1rXZtUGbY6
 vwxc4TRoTktYdYsYY2lKOlHSWnD0vtxnG8z89ctQg0kKzCqlYntfV5Icda5/VtCwOR+yoTY9Ou0
 gzfmBRywhp0ap+IzaW0RGnSo3CPUa+8=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada34d8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YK1r8bVAkC-uCLGTKrwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX7jPEeh0+1E4x
 gvcAGdwNReED4xT5hMu5zLY5hkD7/+4vJ2595olHXddHXwf9/jFdfl+Vg4zhCFToehyk77rUhKc
 YX32l21poTFo3dI5Fzc3zxqCi2CgrAKrFvheyKyxogguZgNb7ZmqlhQlXeSR7Vufv3EyAJfwqis
 +tthGRtbbXVGOndCEJU+2i0COvZgQU46ggz5M0QDrPwMXvWVC1c+m5FfBJBYNpFRnejyYodkzLD
 tzjWEUj8qCEhOidrRyW2N3hQcwRzG2Iv7LDvzMrhSJnBbQZZIvlkBhXG6l0ksfiz6ZAOy+T3XY/
 kBSsSTFylvP6rcS/oH9i3HY7kjl0sxkvfz3IJMuK7Kxf9RJ6i+bvdYjHYqJEHM9jRVG+NpZIVrM
 ftJlzC1HfQ4h8dkRUHXLt3m5Ah6UUW67bCMiDZ7evpT6XSjkm2/eozTp19C//QYWVCOCNuv7yB5
 GqAARviZV/vnrBSIfSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220064



On 10/22/2026 3:13 PM, Karthik S wrote:
> Add machine driver support for the Shikra IQS EVK variant that uses the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> The new compatible reuses the generic sc8280xp DAPM widgets and configures
> the codec DAI format for I2S with bit/frame clock driven by the codec.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9860a68e2add..66064c31136b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -541,6 +541,15 @@ static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
>   	.mi2s_bclk_enable = true,
>   };
>   
> +static const struct qcom_snd_soc_common shikra_iqs_lt9611uxd_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,
> +};

Since the codec is configured as SND_SOC_DAIFMT_BC_FC, shouldn't we also 
set .mi2s_bclk_enable = true here?

> +
>   static const struct qcom_snd_soc_common sm8450_priv_data = {
>   	.driver_name = "sm8450",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -608,6 +617,8 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
> +	{ .compatible = "qcom,shikra-iqs-lt9611uxd-sndcard",
> +	  .data = &shikra_iqs_lt9611uxd_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },

Nit: please keep the compatible list sorted alphabetically.

Thanks
Ajay Kumar Nandam

>   	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

