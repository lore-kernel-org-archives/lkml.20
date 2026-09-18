Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5E4F96C4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739042; cv=none; b=MaobbYhtX4NnEtrNka1WqjxVX/U6ErW8Q4LcVt3p/d/Kymrs1mIluaToiEhSCR4U+0BQTQiWDwYNHZzqY5/cwEKk93AKpkzRtve+f/aVQnFZ9Tvul7yblJDDRSlpcyeG/nreG2Y4yVomyG1TuMRn3lK6jkuuOT3r4jlQBTEQv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739042; c=relaxed/simple;
	bh=C6rDwUvjmjOqpt4wZEMxf6encxALlNrtz7gB4Dm+IQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwuatwsAXeZ6lNI6Ao7Z2Ys6Sgz/oCHomvWek1/nPo6vCCuUVCQIyr/tphytyO5CI1dS3WcFnlmwFSzkX4j1fPthFWpFjwgk0sySxWOUnAa/E8kQcuWhBecowJOsHcJGTb4jNJGAOwhW7mijjVIfIH5HLNS4N77NKEpo11c8VRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+ZaDLda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VS/iRASm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+ZaDLda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS/iRASm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDP25u637478
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=; b=H+ZaDLdayhTXvZUW
	MbSqPzkTlUSGS5ywuvjjmtIyDAYrOhehSGdtDSVY7EYK1JKK7QlLB4wZGw4ssoii
	OLLnKp5RaZqyVt+2qyVDJTyXTY+sSY7T2cG5vVQOiaxMdfP6NZpWHkcR1YTKgDJa
	VzSYh5sj4fG9O2Xzv1CwGHZ/PQULh6sHcBGckNEj4Tu+OK+nfhxE/hRIGD6jLCeG
	h5RNQeAhqXMphzwKdCsZk/Rh1MOU49n7l+a1LWGwnbQC+Qq9gXfJ9yuLckTX1+H0
	7QI7bOKgP/xR47cNPzWZD9Jmd47owVyqAI7+naRxM197qTphehlmh95zk6pPlw1r
	qYqi1g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bsx4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:43:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so696856a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739038; x=1790343838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=;
        b=VS/iRASmulVKUmoJ5qn1KubNS2IhcTDWxo/NTHd6vp/ZkpA89HVvxWgTCYmJnIt0q7
         q04cR5iE8Bpd5RygMT614jjxSERfvMwjU4FJ6LBwbJpXike9RG0QPwNTosZG6kCVhg8g
         g+MHVxdTR5fXmvn3oRhod4C9IVD+2oPlOAXTo5HIzvq5E05UYBI1FJ6yMOPrjKHjNsJj
         MklD6THbOwRbZ33ye1IDAqPh6N9wAzOG35BDnj+P9xn9VeQ7yJ5HGryIyz8dgl0AJWBQ
         0KhXy8VmS0LO2RLJ3Uw7i0EJIA1ReMaG2wck3ag25sbgY7aOpHJlt/Y+Y/3So+GVXaWz
         rJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739038; x=1790343838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R40LNzW/2/QtfddysHfgigjJCHidHFz25WJIuDBATmo=;
        b=KT0ZS9p5egpTzPVhKyWHCqklCvUBX0CLm4DzyaXs0eGp3uzT9TMpe/sOeY363d+Ccm
         HYBhPJyOlrjh+xSSPyaDCBYe+QH/X7A2egUCCFk6+dR2VhrH4w4CgkqBZLBbWroPK5qB
         opOnIMQyc6oF31TsSkYCOg0NQ4OlO0Jy2b0303RBxYxWJIzSXDHqCVSzB6GuJQuSKxtH
         Dp4a9dxiBYNatIf+eJiAWnU/6VlWPtYQjmXlG3jkcd3r4ONHxyZLXZXAfWWTgv3SJ462
         1jpBEP77RrXd/S5XdM0M5EbB06qYzgKe1EoG7amijRpVospJU202dkqE+FaYSEwbGfMa
         6jgA==
X-Forwarded-Encrypted: i=1; AKwUvBzCh+iItOi1totFhJa2IRe2j3vWm7l7lkpzQ7bDyhNPd/wDQy7Ee0TQCatlDNWYRXGXE6bl6IOGC35s+fk=@vger.kernel.org
X-Gm-Message-State: AFuF++n21Ugdjo+nMjFzSMOhl0siUv3roSWqLqe0lRuwSjyyzXsP+wKQ
	sL9Wo8Lt1xcCMaY46sffUAOY4+fFLLkpy7wr6pCGy+H04u9QdoSWkQrHJznCgZ9FIZYWbO5oqqv
	oS4d5Zg/Q1QMqya6TVN6jxxO5rqEkrap8y2ybs/+b5c4PY2fvVDNQKGsIvXFsbFCAhF4=
X-Gm-Gg: AYBFou0spsPJUjj/zH1nAjFytZcJ4Goo4BgyvzAv/oklEy+n39PSkOD1iHYaEXJJ209
	7JrvoOsjyBAaZguemkZMsdauN5k6xSVLkIYxKZJagyNcAkGzXGVwgQameNibhUnXYTadicj2Ty0
	4SjR7pg4Dh2Sk+6fV4KG/MtzVRItjf1C8YtazbyQ6Z2owIfNMCc2Hupxj8wV/hfqSeB7HEXvDS7
	Z/jyGyxJD1qHE0hMEZE8Dr/fUp26f/cI6ITUJ4S/I5e1Mnmm1mBJ0X8NDR9oEaQbpy5OKoWzdF5
	Phg3BhvcRnC/vrx9Nr3Lx1DdfSd+mw2KnHoYE6KbIacfid+obzscfW9vJ6eWQuifmdt1D9p7syv
	qQA9YpaOn7VkwLTdSQ4NI5dJz0ljw8EOY4kdS0A==
X-Received: by 2002:a05:6300:2204:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3dd8c57c3camr6733564637.32.1789739038331;
        Fri, 18 Sep 2026 06:43:58 -0700 (PDT)
X-Received: by 2002:a05:6300:2204:b0:3dd:85aa:d268 with SMTP id adf61e73a8af0-3dd8c57c3camr6733501637.32.1789739037909;
        Fri, 18 Sep 2026 06:43:57 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4eae6fbsm1010698a12.6.2026.09.18.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:43:57 -0700 (PDT)
Message-ID: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NCBTYWx0ZWRfX5o9kFRRtL1t3
 O8zupATauT4lMPX4jMXFTpe8ZJ4QhKru4BuN95Uaz4ZRc1Ff/CMDgN5bvmFUtKvx//+UY/IHWTA
 KosdJME/KePqmlvxEp9ebIpg4vBivLybOpZs23FoUdzu2KIVXjWc6mik8NuBZYfIkaXccRMzFjn
 IA1iBhPnKsTjJ9I2QmHYJGHD3Zo17XKp2bfk8w1WeJVYW97TzBcj+qApBJgRdKb7TMA/jZ3p5pO
 RK0tfuCRzlPyiuLD8EEBCWXJLOvuyQcpxsMY4NiKuPWGBm3AAjRdcJyfVVZXxEPJnDHUKIzcnJ3
 IZ59eSENxcZYhHVt/xtfCadfe4pYJLjO4gbYKe/KPQc9glB91NKFP6xmYLlNVsiND6BDYeVHH2H
 Z5hluwgs7Ic8jNqo49qrEzdb71Mw1Isn4XZLwNSwgpvA1MWAUDNNRhgfAmbHsx43NXoYEp8zU5s
 Pik3q59G1/8C4oJ4MKw==
X-Proofpoint-GUID: 0cbOEDnibb6UrHaPMk2h8EX0jsi7N3l0
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad401f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cBTdkrXCvdqGFug1r-QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NCBTYWx0ZWRfX+m9GbmeW/SN2
 VnrdTF9Q1Swe8uddjjqNjGEvFnoOGsS/BXPBnMNXqWR4PTLuySpkHaO0HXSkQXqshIwNcIkZPE/
 FHBTTKAH+/eR97mjn7IZKraH74U6YDU=
X-Proofpoint-ORIG-GUID: 0cbOEDnibb6UrHaPMk2h8EX0jsi7N3l0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180194



On 9/11/2026 2:47 PM, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform, together with a dt-bindings
> header for QAIF DAI and AIF interface IDs.
> index 3a99703dbc4a..f08c20c84c60 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h

Please drop this DAI ID change from this series.

I have posted a separate series for these DAI ID additions since they 
are required by other Qualcomm platforms as well.

https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

Keeping them separate avoids blocking those board enablements and allows 
this series to remain focused on the Shikra-specific changes.

Best Regards,
Rafi.

> @@ -156,6 +156,58 @@
>   #define LPI_MI2S_TX_5		150
>   #define LPI_MI2S_RX_6		151
>   #define LPI_MI2S_TX_6		152
> +#define AIF_MI2S_RX_0		153
> +#define AIF_MI2S_RX_1		154
> +#define AIF_MI2S_RX_2		155
> +#define AIF_MI2S_RX_3		156
> +#define AIF_MI2S_RX_4		157
> +#define AIF_MI2S_RX_5		158
> +#define AIF_MI2S_RX_6		159
> +#define AIF_MI2S_RX_7		160
> +#define AIF_MI2S_RX_8		161
> +#define AIF_MI2S_RX_9		162
> +#define AIF_MI2S_RX_10		163
> +#define AIF_MI2S_RX_11		164
> +#define AIF_MI2S_RX_12		165
> +#define AIF_MI2S_TX_0		166
> +#define AIF_MI2S_TX_1		167
> +#define AIF_MI2S_TX_2		168
> +#define AIF_MI2S_TX_3		169
> +#define AIF_MI2S_TX_4		170
> +#define AIF_MI2S_TX_5		171
> +#define AIF_MI2S_TX_6		172
> +#define AIF_MI2S_TX_7		173
> +#define AIF_MI2S_TX_8		174
> +#define AIF_MI2S_TX_9		175
> +#define AIF_MI2S_TX_10		176
> +#define AIF_MI2S_TX_11		177
> +#define AIF_MI2S_TX_12		178
> +#define AIF_TDM_RX_0		179
> +#define AIF_TDM_RX_1		180
> +#define AIF_TDM_RX_2		181
> +#define AIF_TDM_RX_3		182
> +#define AIF_TDM_RX_4		183
> +#define AIF_TDM_RX_5		184
> +#define AIF_TDM_RX_6		185
> +#define AIF_TDM_RX_7		186
> +#define AIF_TDM_RX_8		187
> +#define AIF_TDM_RX_9		188
> +#define AIF_TDM_RX_10		189
> +#define AIF_TDM_RX_11		190
> +#define AIF_TDM_RX_12		191
> +#define AIF_TDM_TX_0		192
> +#define AIF_TDM_TX_1		193
> +#define AIF_TDM_TX_2		194
> +#define AIF_TDM_TX_3		195
> +#define AIF_TDM_TX_4		196
> +#define AIF_TDM_TX_5		197
> +#define AIF_TDM_TX_6		198
> +#define AIF_TDM_TX_7		199
> +#define AIF_TDM_TX_8		200
> +#define AIF_TDM_TX_9		201
> +#define AIF_TDM_TX_10		202
> +#define AIF_TDM_TX_11		203
> +#define AIF_TDM_TX_12		204
>   
>   #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>   #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> 

