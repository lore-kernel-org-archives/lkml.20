Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659332;
	b=vQ9nqRngFPeYDVvzSmugcb5KhskgWir19VQvwN0ZpgzjnrFDHfH9kwIW3QsaJEyNCmmu
	 I5F8BfW8cM2tNPGztbo/bFvnmw9OmuQ0o+ojllMyzd7J0zgqK64dkdu89VZ2g0v9/cL2O
	 QLVCD/mOnjEapqQyMIlDanEEzYjVCULM28BqfzToYTzO7IixSwpDMaKChQhRD7bT5qwXN
	 LvTQD0GwUBnrIi7aHbiJP+GKv0FPLgqBPty7Q4a4M3P/ICscPdGfg32WwR13r/1TnaarZ
	 Ll7QZXxAoiO13daRStQvj3lmPSSIrs+M4tB5RwhYR/Tump/4bgnemULG71YrK85NR2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
	b=yxxYz0vY5NXV0ANJpylfRqwUwOZ2QWtqgxcMsuzFKI9hasxX1YgzImM8reUxKI+fc1m0
	 VQk+H6SaWSMH2xAzIrHkVWoIapzBgMiy3UlUUZqOLvwKGeCctghliMUsf0dUne7lNtA/9
	 0oYmeRK/QoLVdWA2bdOWQrW7ZV82Nuk3ChgwXuSW1xgWnZQ1JNG3CdH30+L3ZgxDILWNq
	 +03ij5xN2ydc9hA4Q05oWNxxrJuBudlFuknYADHIfk3IWvguKjCE+XjsitSU87949YrjZ
	 N4Ee7ggs0a6qKgUOOhbgWi+iTJghm0VlfA+NCuIVFa7pudehkNu/S9gKmkFjLC8WE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oi+Zn+5p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIobJweU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348F9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oi+Zn+5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIobJweU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Swew3788277
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=; b=oi+Zn+5pVP1msRsJ
	KOXDTU6yTtwsq2OioVybeBhmJdXxQpp+R9IAb6QjuZBA6prCM5sEE1xtBTWZk3Du
	aBWn1eekJJp2uTGF46zDS51E3N20IqoW5fpmgPgj4DP7wkg9ah5srFaZhEVfzSvE
	/Q9rilRW47+mJFiq6iYP0a9nbrFNfEdbWkd9RNesO+b9Ngjj8B41vcaTcAZ0ofnP
	7yFg0ANGRt14ks5EY9G5MzxcPEfGAfYgk5U0h1OAW/sWykIAyZysvMZjBOQq+Y0N
	Dm6Jp3iTxQ8JD85CgeuYzJat+93BWwU1OXUPQmsWF6dVHfthiTyCMXbY9r9bxJXE
	NuXJTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9gmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:55:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53657d237ddso2895721cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659329; x=1793264129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
        b=DIobJweUDKDrX8GQWoy4G/w5j5TjUk6/ufpFsGlaahAEdmKrx0gKtDwx0Bh1mejXpd
         FMCs4Z5A75L287TRftxgkRkVtgrH5y42H8X+OPr4LTw59WaSMW/kT1kW8/0HZow4S2Dg
         abG/+wx2fvi/6wsI/VzixJgnXUk+ajkTFpHbg3gYTFdlIz3CNIbXF4u5zoJkMKsvtNvF
         XP4oZ61bbgvVRL0vdQhwzw/ZACxN51aOTDc5UZ/JDTVXO4Uyvvyq0jQdYtJ6SBDVHjQj
         0QlYKhJzl1q7QBOid0dC1BMHhWjLALMohpcCsmCgvmcxr2CcVAsg6aNlEGV4TLrtjB7B
         2QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659329; x=1793264129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95ScqGGkJRHhlmj15iFmjoUwd+LVxvsQOWPqBlksFMI=;
        b=RCdzjx3yR8K4JMdIXeXXhw5+7jz07rLqEUX5xw5s46ZPcLf6hrgxHj54EvafdtwyHw
         w+bJ25wH3xiXzfXbPtBJfqvj4QWesFBvJ0lvPG28HmSpK5gjV3FHeQTlLWEOr7TsYYdp
         GXV61JIW7FUjV5ONSx1EecD4y7QwtsHIi8romd204i2jX3M1NF5YLBKQeGuPbvAPMfNe
         ejQDsUOTHOpqAnKUsYcfJKes+Z4RLY5jyiaUg+3ukxAPbSsWJ1d0EXCbE9H9tr4bBbKO
         I7856Nc/0uHba/vT9SIZih7J0kcR4YQDtXFVdMfELRvw2c0JUEMauUkgcLSPqhl8G1OQ
         IG/w==
X-Forwarded-Encrypted: i=1; AKwUvBxoigWsCSRncegHLP9LvAgjN/UJgTLgkcgIwvcHCvv19X5/2QTM9Q6rNIchvETrB9Y+GV5aoFy2yPyiLro=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYW0ew1cj6YAXTiFpoE1NQm91mroqbtzwQuUorTebBlrmNU2ro
	vRSIT7849Lm0FimSa5xu33KYy0XIzQdPeTKqrd/uTKJreTOlFFi2IVZp3zLvlkWpbJ3h+7WZr5l
	wbc999w/QNYT/OZ815EWYoh249Gw6Ytk00bbTDP9MOQOrP0No1HgwjfaGHh321Q37QWw=
X-Gm-Gg: AYBFou2sorgZmzgMnNt4xLDssWq2+M+vebhPjw3Xxmm34coWMFz5D8veEjTa5c2yX4i
	N/aeEWyyQSEYToU1vLyCpg27BabroHYQyutwQ5V8Z8LBSzLL146Hbylw4Tgt1rgnNOQHfIJymL8
	De3iPnyyjLsP5kZSdrBzqtZwBhnTFSl9rFD6+M9Zi9NzDb7k+k70BUxsVBVFLC2U2FnDAchno6Z
	HT3FL6Qcm+oN9UooytCPVqIcvY4cxTPSgO3JHLfdlTljtnbAX7n3HEJkcEXWnlRMruHnCb92GFz
	YU7x+j8Opzj8xN4ZL2Glr5KUoCUbhaoOOf10yL6KFtbVRhWX9rtz55ykC3uyyxoiK3hOPILBoyK
	uLoZUg/7cNv1bC48sSY2gag==
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr58721971cf.5.1792659329396;
        Thu, 22 Oct 2026 01:55:29 -0700 (PDT)
X-Received: by 2002:a05:622a:e603:10b0:536:61d4:cc80 with SMTP id d75a77b69052e-5369b813497mr58721781cf.5.1792659328970;
        Thu, 22 Oct 2026 01:55:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e2c3esm82701966b.73.2026.10.22.01.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:55:28 -0700 (PDT)
Message-ID: <a6f54a9b-ffee-4a06-9b32-2f2f47ebb19c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:55:25 +0200
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
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: hawi: add LPASS audio subsystem
 nodes
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX0Bx8D8PGigIn
 pzoPV5Ch3mGzE/DHvwiGKiiTvgY3N1U2xbNlkGIJkWkf/nMExzJsjcNuGI2CqBejm9ffF/AA7XG
 frYMiYuqugTV0/P1zZvXlxo5lH7W+to=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9cf82 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ydbIL3bE3U-0NGl9bRkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qF3jN0ovJCFhzsyB1Mq9lPRRok5LUnOP
X-Proofpoint-ORIG-GUID: qF3jN0ovJCFhzsyB1Mq9lPRRok5LUnOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXzGhY5bt4J9fD
 Sszra/3GwGz7YHQFP68x0qLpkBmYZ6W7AZ6FoX0nxDKN8YjWL5hi2iyy++M2pCHjE5NmPvmNzfr
 MRYQeGPvvk+OgZr0K4xgHFOCCYnYDM0R3JTxldVEHZW48iPh5gDkns2e43Se42/SFaCFm0EyihN
 CcbnPwC3+trPbpuaVik4jR3Be9RTDtBF3iYmBMKthgN0ALa2HVXCNQ4W7OKk4d49UBQ3QcxhExX
 skkkvviqcrd3oRNyPm+KHrBdapaEdIGEet3QXdwoNplO9r7cyuYW70cVgAjKx1lj7IcbXT/aYWi
 og4Yc+QQXRdSoD3LS2PN0yXBL9vpPbPQoZXzYdUqkUybmxGjnAoP9eXPRJxkNrSU7+NdAyO6zcj
 T78u0fNxc8pvCrKat/VB6C0vn9vS9WeG9zXinw1azKKAkx+DjurRMZQPLmseE2/8X4k+t7zzxlJ
 eztdvOYMVfsygnahj3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 9/23/26 10:46 AM, Prasad Kumpatla wrote:
> Add the Low Power Audio SubSystem (LPASS) device tree infrastructure
> for Hawi to describe the ADSP-based audio pipeline.
> 
> Add the GPR (Generic Packet Router) node with q6apm and q6prm audio
> services, LPASS RX, TX and VA macro codecs, SoundWire controllers,
> VA CSR clock provider, and LPI TLMM pinctrl node required by the audio
> subsystem.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

[...]

> +		lpass_rxmacro: codec@72c0000 {
> +			compatible = "qcom,hawi-lpass-rx-macro";
> +			reg = <0x0 0x072c0000 0x0 0x1000>;
> +			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&lpass_vamacro>;
> +			clock-names = "mclk", "lpr", "dcodec", "fsgen";

1 entry a line would be perfect, in all cases

Otherwise I think this lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
