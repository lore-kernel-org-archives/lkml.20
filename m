Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040344;
	b=0NMV2IcmX4TFmZfNnZ6qhwo4ti5wKHJte4pQqq6ShINGDW5WVVn4ckAGnDdtwnNdNbiw
	 60DLGghHQldoNGle30SOl1MPEkFBu/xeQEnGASOl/KJcvIjS27m/276Hqj58fBeR87+LM
	 YgLKwFHGXv3SVPBXEnLM74J6P5w/8J6i1lN+KUG5WB+cr4VZrRsKVvTAbAkeHo9jWYXJl
	 SkOXogcsrf7ELtRIWOgMXXCVkY7QpuxEoJ/eSrEbBWj+uwkO5k9vimbmq5GSsBzftNGYr
	 bxbVZM18CziHK+Eh1S+4DxgTPq/m+WcF5fP6axhfQqdQPItNpu1O0fuhoOGiZrKjmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=;
	b=r+dSlGmXKo+KBSvqguWXPIdxy2v/gEs//61f7XDOg+qhnoQYro31+FZCX1IbT71Kuinp
	 bT/E5iUFsAhqfjMh67uJ7NB6HTTBCRhWDHc3epzC3kFXsthF/VJaRi8fJWkpVoxl43fed
	 ofTOXBgRwPs3V9Jpd8g6JWjMyGdZNN4y0zwn1MF+ak3RbB24Ql7p0N+pcNOYqMldaEYxl
	 uzXK+LDEjlx2XBdzJdTtYzSenkatqBq3ODSCocWBc2IQDhosSEMfVSjy8fxxlxgpSLBbj
	 JSsKNyrj+a+6AQgcWjKOaqCLgDxRTcSfRCty3IZIquaCLkn2QlcEMckqV8hc49RgfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sope3mTw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8mXtiHF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C63606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C63606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sope3mTw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8mXtiHF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvjat4098797
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=; b=Sope3mTwm5HyUkLJ
	x6jQx52i9U0ecmeJZJ6qH94yFRsy11XErJh51uRDJDpuTJGrRNIViamgJHx1QiZ3
	xKfa90J6Agp3uy1aMvwH+FQtvQV2npPxF6PVJ20850ALK90sqAIb1oOO9JeUDhuH
	cPjS8l5fgbWpex089wYTcrJvNFsE0HY9ARYjwTNHJl4aLvguXECWyQ7i5U2PBcD0
	wIitKtL13jJxrPig422W669mWUtuqu7n5oL6XJdtXx5l3snNAhKxeqvHsgc7lSao
	Xzr4puP5oqAmiy3fHvDtFzHsTpiujsj21hANOW0mEZxwwSoqZO9mJ5KoBviOeYs3
	pTKiLQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s922vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:45:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-186c1aae818so2863240c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793040342; x=1793645142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=;
        b=B8mXtiHFbgXY+kZt92oZ79JerUUCf29185RekpjEMyHcTSHIchQeAQ5bsCGsDTpDBk
         gb46vI6FIuocc4+IGNuob8HxU/yUi1eFf36eZ2UdWhWCyIhYCpINY7TAHnqImJ1sN8dk
         8ECj2VcqZuXkXH7A7AQcjO8c1AX5FCKVWoF89goiJrb/wmIVhVONX0ZFnbW8rbKX0AZM
         V/ki9/Rv9TvmTqs1HaJpH0fTW1LVqIhCHYf3UXpuR7QDf+ksQvnQqsQZzfYEiC+CVPh/
         xEJgcvZfuh2dwEJiXtZf1U7zdosiRd0fBkLBVxBKNx1AW3Mh2xIH9kLwa9ILDWy5eeWc
         O9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040342; x=1793645142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=;
        b=c1J9F5rBhPK2QlsyaBcpJqDP3s78iH2HSf3eD0F1IHPDlu3ZC8WMvQLvNGotyUaybj
         5HZg4ChIRoz4qpDcyFXVe4DiDVlTmQ8FtYm7wE9oP/mp/j7vitd2fBpY1uf/6Puyzjv5
         ICFR4mh3TV106AKRwNWxjPj2uZUv5yctzQ3QhJNLDsOhHfqiCcUcYl3PGqyfDvKa1swB
         NCfpC9Ixa9PzfCT6lfjhT7wwKf+GopBjKNX9sDJYcAOZXFc74XINLpiKzB8FJ+JiSCsf
         zNktRIgrEmSQKALlR5ZARHOxyYve3Zgqc5rB0GLDhXWA1ErycaxOj5tGbLQQg4ubJ+Hp
         3Eng==
X-Forwarded-Encrypted: i=1; AKwUvBw4HnaeW9ZR9c1uysgcW4Fhza18b4JaF9+KYS62SrGuk1J6ajdXa/ToeNbKH+bwjEP3Wj/VnmlTlCvIJ88=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW9+E5wsCdO5LtMmZEWhB17k/danle8Lpas0wYFCFJPl6S7GZ6
	tV2md725HAzzGdVsxX9s62zpi/tbv7WF3nElEIvyjKVjH0jJLz2F2KVRBItQYPTK4mjGcq5BriK
	iBG6II9nPmynk63Gpy5G4qslkjg3NS74gP8WOKnfMEPzRhmWR5qVDuC1lUoQndCtsrk4=
X-Gm-Gg: AYBFou3rl9EI08tGKwK7Pv7Okh3px7U7fbw0A4kalj/XuvuY9if4NA1Iyl+QB7VfRaT
	0HYVDaYjQHxBywgeVRMi1xsTcLNhamT8/bncXUf/2LJ56s7h0hTA5oHkHi6lPmmW1ZXMv5nnsan
	C4cRLDQ2WHf8448RJ7LlVulk10eapr+04EAiYkfiKd+Etc3//3k2t660+bpvMh1UTm2ZWrWaoXZ
	zPv+g1vfyG3AGH4tni6sHskRBRQui+++J4mr39WIwSLgohMzn7xK/rJj7mNdKWjrWQ02LSMVKbX
	Ur0yXHTZZgKB6H7Ih9SXG2Us3hFRT3Nw/vTnmR/vO/LG0ceQI9UJlfS4/fO2xm5ISMwhPyN745I
	oh/XMi7m6Hry1Z/hODC7vseZ0ZAk+yc+4taP7jUFIy4ORsmQZIOpHlp4JwRGHDUiPLzvXWgMVz6
	Ikgkb5YLQ=
X-Received: by 2002:a05:7023:a85:b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1993f6d3884mr12733997c88.45.1793040341905;
        Mon, 26 Oct 2026 11:45:41 -0700 (PDT)
X-Received: by 2002:a05:7023:a85:b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1993f6d3884mr12733961c88.45.1793040341387;
        Mon, 26 Oct 2026 11:45:41 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm25283040eec.4.2026.10.26.11.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:45:38 -0700 (PDT)
Message-ID: <1360aff0-d738-441c-a631-0d2998889057@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:15:33 +0530
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
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-0-9f31b5fae5f6@oss.qualcomm.com>
 <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-1-9f31b5fae5f6@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-1-9f31b5fae5f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3NCBTYWx0ZWRfX7kSO55guC2Ug
 iWJYt1GjHYGjUq2gNXITTG9GjM2KY4jXDIa8eOQVZL+r4k5BEVswZziBrl5o2EGoT0hQ/nXkE7+
 iEpwyVHZH45L4AaKbJaKjwj42+CdqnNx6k0TSSBolzGiNFXlUUv+0on6FOH1AV0g5/joEjfQbcy
 o6sAIWlADen4AC3HDhNDpWwnmjBGJD5BAKFS7/XKaejRos5AsqJ56KJW9nSvsWxY0LpqfZbvvwC
 zU+ElUCe9a6AAtg6wa7wMw6Rq8pKktiiqCVARQFdrbKoYzSgItBO4bqCglojM4qPiImXWBGgBwQ
 2WKhbSXqaG6WvAFwRxWJb6LrZPq1IeEPM/EUsMmJgAFqce3KD+E6L/jzmbU63kQDqHN8Qx2l7Jq
 KPTx/Tsh8S1VyhpByea8wL4TDYn4J6YG6euHy8jOSb/+kpDbi302EVLisoZYdyGQ7vKymdbjy1Q
 SzD9L3+OETFFTu/AJnQ==
X-Proofpoint-ORIG-GUID: mwFDg1xDZMwYNPsz2kAnxrX9flGaEHxj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3NCBTYWx0ZWRfX8B5TZC8MAsz0
 CwXHkXhx9EFQr33EuGoZl6DMpWYkW3Rw4EvomB+FNwLpxi6aWrJbOAifRgarjlxQX80nFpcfH2l
 1qLTd7LkHkxP+m3DFXZhNTkm/HtokJ8=
X-Proofpoint-GUID: mwFDg1xDZMwYNPsz2kAnxrX9flGaEHxj
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf9fd7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=hUR4YRKjZVNWWFvtt-oA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260074



On 8/18/2026 10:31 AM, Praveen Talari wrote:
[...]> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 51 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 658636c1ee0e..10c6a4b0b825 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[...]

> +	geni_se_abort_m_cmd(&gi2c->se);
> +
> +	if (!readl_poll_timeout_atomic(base + SE_GENI_M_IRQ_STATUS, val,
> +				       val & M_CMD_ABORT_EN, 10, 200000))
> +		writel_relaxed(M_CMD_ABORT_EN, base + SE_GENI_M_IRQ_CLEAR);
> +
> +	if (readl_relaxed(base + SE_GENI_DMA_MODE_EN)) {
> +		writel_relaxed(1, base + SE_DMA_TX_FSM_RST);
> +		readl_poll_timeout_atomic(base + SE_DMA_TX_IRQ_STAT, val,
> +					  val & TX_RESET_DONE, 10, 50000);
Any error log to print if times out ?

if (ret)
	dev_err(gi2c->se.dev, "Timeout resetting TX DMA FSM\n");
else
	writel_relaxed(TX_RESET_DONE, base + SE_DMA_TX_IRQ_CLR);

> +		writel_relaxed(val, base + SE_DMA_TX_IRQ_CLR);
> +
> +		writel_relaxed(1, base + SE_DMA_RX_FSM_RST);
> +		readl_poll_timeout_atomic(base + SE_DMA_RX_IRQ_STAT, val,
> +					  val & RX_RESET_DONE, 10, 50000);
Any error log to print if times out ?

> +		writel_relaxed(val, base + SE_DMA_RX_IRQ_CLR);
> +	}
> +}
> +
>   static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   {
>   	u32 proto, tx_depth;
> @@ -1209,8 +1257,7 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
>   {
>   	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>   
> -	/* Make client i2c transfers start failing */
> -	i2c_mark_adapter_suspended(&gi2c->adap);
> +	geni_i2c_quiesce(gi2c);
>   }
>   
>   static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
> 

