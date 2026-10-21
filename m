Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560353;
	b=s+sR3e7M445I6AIy1Kz2xvV0OO8rLYryI6QQDCGJcLdfphVsXhXXN+CZVDB2OiJ7prla
	 FWfpiTOjO9xQpB0EcBZm96vVcYXtmJid4BhLzns2aIZ35rGkUWnQ4Xj4+7HuphF581cFr
	 j5FRrRQYSGlv5u8Wbe0Xc0i6oMYtUB2RghF9BX2yWE5AUzl8kjkDJ4vCF+MD6WDTDS2A1
	 79aBYlTz2z25vKfRl8gVLHME0uarPS3tPm7HeezdjyY79rvzD/xzQBoQxcWI2QnD8WuXn
	 GGTMnOxFSKoA8xaSpajCVGeR9ZdRfKmK3RSKgdWSWdVlkuGTe7/VUaYhkbFi+h5lYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=;
	b=HKXpiZXrzsC4yQsI6Mz2Zvnled+Ohk35Ss9xw7EYlHV356pSUaYhOzalcZOFFLO+KYUp
	 oc9Sn6p+/sjxAa7fpn7+GipvQqGrGHebnTdsq10BSweEeoDccuJq9bBLOZdX6V1eE0/tJ
	 AlNC0iJyPfwPHo0CK80jnNjtz+jV13iXpIIYPnUnlsP+KqXpgs6M/Gw3x8kBfksvV5xem
	 3LTV/9GnRrqOfZHWZY0yJnP+blx0O0QviO06ZQ0B6MpLRX2dONb5KrWgScUSfQ570U25A
	 4K0/lfSbDOQeqUnURxTthXKNfNtj/vep7WKTzPyJEQ3IODT9nwCynhnG2z9hlC2mFqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVOnp7bB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS4lcm5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4ED606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVOnp7bB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VsS4lcm5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L4ZtQQ3727946
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=; b=EVOnp7bBUf1rZMNP
	0jeIi8Fr8Qn5/E7KxbJiAVyg84IqFPoqZwv5eBWnbJtvtnp7P8CvI0GdhPL8pXuf
	Rlwaaoou13zTlN/p+ijDCmum/VUMD+a+oS4kzeIcpLhcVrQA3DIQ/mlsNRWAZCvk
	wDXEGMN29GuWTQBeFkxasgEC9H7UeZGLv33dWTr3ij8R5Jc+3URmbkTlakTDE1wZ
	MFl2N0wyffF0g4ZhIQWxg6vGThagumIhZj9EgbhBRJ8ti8n+KXKmK1MX9m7KKn+K
	7CjkPcSKdKhO+CytpC3FjHpJT4EyFapbDfgeE+FAWVDukwxr4s0m3OOsnHMO4kF8
	Uar4cg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r17jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:25:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c902e0da2so1814022eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560351; x=1793165151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=;
        b=VsS4lcm5fJUkp1aX876czzvu1wmKTPkf0es/svn+71IPEYRbqWptdmjKWHkLo0B+68
         C5Dku2t4Blx6qkwYIKE46m022mKPVs8NdL4WxxF3iBQuD/ocvMK3wtjl7dWMrzsN1aFI
         TGVN+mFtYDz6VeykYSD9i73m2PT/HJ8rTvKnCPokm7MnPTsnwtmjHqFnLlyI+arwvaKT
         Q3jBwnF5UqE/VEcuTpr5a/nha1NWBqFNplNACKleMHAu5RVJYbCfX/nfaIMI8DPghyig
         3iA8rm4dHiBoPiHPr0xBROPPZheiTJ3TDSDa7dIYVMa1qVNt8RxkLxcQT+f//QNFBoIZ
         6yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560351; x=1793165151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5x0KAiGxuqBFfbPBkgkWYH4+5nqiP03c6qy+3l9cr1M=;
        b=E9E+5VZfNP81hL8A6BIl21+g/MkvH0p9BraXKGZf7wbgRkNooDhzgfHnvywIUAJa3E
         HsrPi0RTOHdqtRv+88ZRlHF0SzmFTYmxHcWOW98vGezzxxCtcuc6scN1CJRfE1Co9a2D
         fMxgi2dkqjZLN4nWY67KVdkwdP8VnjZHcMIQ2+yNv8Rtge8Ece38pkg2ra8HTT0Q6U/g
         41jsm1hm0TyGA83F5BMxedIWX8La48FjCkWuF9WlTmAyyPKr6jFSwS2TT5TlcZJIemtZ
         j114Hiw1ZaTpfWoy0CXeyBsKSt6ZKfIV2f3p0xVmKE65J52umDbKNJfAa5iqVzGbsSJX
         WbtQ==
X-Forwarded-Encrypted: i=1; AKwUvByP//O0w2HZWzQD2xKA2hi9NlgTzyutpdcXlQPpVAR41VVO4CR5Gv1Sch8fW4VZCuiwaC7FPssXu7YNEzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPcZRvj5AsPxyXubcdJAPmCsyPoMk4VuauNxmXSpFGlH6ydYNe
	d5R5gOV2ILom0uekPSM1o5zPWNhMYCDDp7cTh0AI1NhInOT0fBKZirPcUsA+FXdQGXEv8B6TrgJ
	eAfFiCp8R5DfDxosouEwch/2imyn9qA216zvixIq/wDRToX++2KotEi72LW+kDsIhASE=
X-Gm-Gg: AYBFou0ZJUTfKQGXTjngjbeSBJeFC9ZjdChLJv6oUO9LpBfiCFJpc1Pr/lWwBpj0WZR
	zVo0JlTiGtIvodYrbfuFZS70X0cO55loGqJCWbgl1ZU71JMGLJB1vtptWkgOmBBluy7H1+hoZW1
	HoMaqHOBFFnFP4SACLpb7UuT6xm7TMkp2mzfwFREzN6mP4S3vnnO+MseqNSh4wVYLB2hTMRCri/
	nWxGjpjoixDRBcVon2cccA1T3bWyQ+4SLKYlmLVP8a9s+7JGjYSx4vqBQ7nAhtT7oOY4k8ryAxa
	2SGtbcgAGETMoxgzpJym27fhifq5FxDME743/7Zr+/jzG6lxV/S0UM+xyPpMAo1tWf5zazsoB86
	glMwbd7R60Q5ZyYG4dOvYmuXDPTOvSkZUtfrMA4g=
X-Received: by 2002:a05:7022:121:b0:146:84fd:7b58 with SMTP id a92af1059eb24-18dbe2af657mr7294182c88.9.1792560350879;
        Tue, 20 Oct 2026 22:25:50 -0700 (PDT)
X-Received: by 2002:a05:7022:121:b0:146:84fd:7b58 with SMTP id a92af1059eb24-18dbe2af657mr7294155c88.9.1792560350341;
        Tue, 20 Oct 2026 22:25:50 -0700 (PDT)
Received: from [10.253.160.36] ([106.192.14.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm7184384eec.26.2026.10.20.22.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:25:49 -0700 (PDT)
Message-ID: <679f383a-97a1-4505-8bd9-73ef76bc0d87@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:55:42 +0530
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
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad84ce0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IUwO3uqH19SZaseHF7nCgw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iFd55WBnZZna6GIBd50A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: IJR35ZreeBuoW3QnCgPS6xSnfIH6bIOD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX2lrUnj8nm+mt
 VvtcLv7+dLwhLeTQ4wp8yhkPAWSPBIH1EioFzLKnu9PXYFHJTflUujZgNSihrnoN6S7kK1kjCfp
 iuqxmgDUVf67MZz3tTPao2cututdQjMi6NJ7oCio0lY7h0CCoI28MTvXBAR4+ODZHlnrdGykRwv
 QeG6b7sCFKGqUttk1rmCSXW+t7g5YAMYXvM2PhZ6pn2xeXTuHFDGSgvJyzA0L+ec+diVkeZV/um
 k/TerJyPbg0HA1wFR7S4+ZlXjGp6UPnwLsw03TI49kUTDeH05ExvaEu330NssVRzf8XieoI3DRu
 HJPiR/LP9ZoFO/ZV7XvglEvk83JepRyja2q2NoQE8PIQqFD+5VyGNUai1ff9X70Z456FN9JAJS2
 IoEJOYgQ6pqeGNLoWIP9Xraln1n271xxTWOE4pgFyHiq7fahVioHwbtWI33PLslP1fRDCEyVom7
 NqXKKrbcQEQ5pb4bG6w==
X-Proofpoint-GUID: IJR35ZreeBuoW3QnCgPS6xSnfIH6bIOD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX1LBJAS3qbZR5
 c5aDGffHOrm4Y6CxUq4m7+ZReep4yFFkNFxQ4Q8xrMEhmNEfCmLeBXPld0h6cOW2Yr2jzkx9CUY
 AQYUNck3Af0R37MU11j88BQrOdUXKe4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021



On 10/21/2026 8:23 AM, Shawn Guo wrote:
> Derive the AIF_TDM_RX_8 and AIF_TDM_TX_8 backend channel count from
> the cpu DAI TDM slot mask in the DT, using the same tx/rx mask
> selection as q6tdm_set_tdm_slot(). Each board then gets the channel
> count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on RIDE.
> Keep the default of two when the link has no TDM slot description.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9aae6aadd43d..f3fb13145b3b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
> +	case AIF_TDM_RX_8:
> +	case AIF_TDM_TX_8: {

This should not be limited to AIF_TDM_RX_8/AIF_TDM_TX_8.

Enable it for all TDM DAI IDs.

case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
case AIF_TDM_RX_0 ... AIF_TDM_TX_12:


Best Regards,
Rafi


> +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> +		unsigned int mask;
> +
> +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
> +			break;
> +
> +		/* Same slot mask selection as q6tdm_set_tdm_slot() */
> +		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
> +		if (mask) {
> +			channels->min = hweight32(mask);
> +			channels->max = channels->min;
> +		}
> +		break;
> +	}
>   	case TX_CODEC_DMA_TX_0:
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:

