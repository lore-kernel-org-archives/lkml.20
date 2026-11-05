Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900232;
	b=IGsYTbRk2JF/HKcm1x63TGcr1Z416Neac/HU38eZoIsRHn2x/xFvx/XGKqgI7qqkkbx6
	 Vm0kTT62R5LhHzgwm2xygKstqQQ4nm5cv0zkRyG695v0xpz3OF2sZIQe+4P6+AFtmFWdQ
	 ZULvnm5B4xiSmmS8RvaCeCG0JRIAHGe82NuuClvmf8ZitBZLMqbaiBQFwct2jYlf67cxp
	 dJq8oQVDZqzmftC86Cah8g2mi0nF/sCQFlvW1qYvDt8AFcbU3iWxPG76Z74Ny5QzWBONm
	 /SnWTMiTbNfeGTi3E2nrXLZtPSu6QC5VRyY0wPqGecE40o+T1obnFKp98tV/9rqsoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=;
	b=Wgov1Lu2Fbbjat690vsqVUTiFF+h/5fUV5pwyMvgudsU9jn7aRMqnQZQYhtn5rGIx/NG
	 uZj5RM+Y4qM0zjQqoxgC4QMbxs5DHhJanByCZ6Me+3q4U/uxO7z0MVP1fCV/PNAQbF7EE
	 XrTahGBWsHSGvx3nV/gVOzenbfExzpUtzVAxsNFzpiLfJD0DGXCbvEztAiMeHAEeGNbYN
	 9XzgufHJmSrXTvrxqshmfk7H0fd/PCrZboZAz6l/6NyELBbobKbHodGgeSHPw0nmbuW4L
	 J1c1KskwI/ok8Mp1LazMqk5UyZ/SGGAiVpDs31A9wQ2jGt6OKqvXWgcesN3y7l8ipYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kTSpYcHc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSQ7I+AQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA7606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BA7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kTSpYcHc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSQ7I+AQ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQXPv1040679
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 17:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=; b=kTSpYcHc1eF6HoUn
	XmCKZCKwstUxtyGwh6SmeL6oyoKtVD38v8i9Rr4+SRYSUIOWzL9DnvKFEsLlp5Ta
	lwM1kRBCCEaQylxNO2cziZJsPgoXpmwGN0teX4XFZBx/nIgW+rvSOECnvgUXrXcs
	rjNUmqxL36zWgn/k58c7eg2W8uCorc5RbbahAa7IGnlJTzaFKNQFm0ic4BMd4WYH
	MHQwRuxze2XC3eMVZT4C4J+p4pedr/hh9S8756HwSm4zI0LyDG/2k6lWP2ItJqfT
	Xl3H+g92/tjsCuUIQVEknVESVToTxv8TxYxDU8U1hIcRfeFSsUPNVe8d2QspBdIe
	p0vkWQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdawy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:37:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so3651044eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793900230; x=1794505030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=;
        b=TSQ7I+AQQiKKsnPSJnFyUzBgcJ5duAAUeiWc6n4kCvW9Bc7UbXtgCQtUjoyw28UG0a
         ZI8yizsLt2NkxwHKtzv9hhQKiHrHz5wqtNYCGck2k2tzyOsB40gOowMW4P26qzZxX52P
         y7nBsFcOYqB17R+WYt+Juf/Uvd8tiS9irzfwYqLLtwwErbZYnZyT9OJ+octD9hHJ3Wqf
         5qwtOkq+XbOamGBGkdhbpX2ksUE3pTXADyrtRbElqR6DRfyk21s9m4Iw4yZjXYFdHvYm
         01efQyYoxmM65uAZclRiZJE3iBdq2ZpdIUsBvKB2ZmbWEtk82deTxTs7PdV8c2Ip0jJs
         0v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900230; x=1794505030;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgYh4ixCnIjb0rEr5p1qolrzFm3xYIHBCGByIyBm0kE=;
        b=JUPIM/5O/7vzrQXo0S8QApdeNAY2jPLVeduRrNGgxnpnhWf+3gUs9nClo5CfeyWvFm
         EUXP247aiqTidLlERvFxvY5Co4jCz5VllNLCIPf3NGxZAaQ0Feu+xEJxvc/zbg+TO9HS
         EcpsYt42DEuGDSGhMLW7lYR7eP0cqX/hiXgInrphPHKvmBX4nwBZ0c2hIvH2+Z8iPC4L
         8nWlzan9uT79gYWK5ogeZdcKm6urpy05omHqqD+rm1lu/I48z17l2G/OphjQMo0VE86R
         oGnYwjz1ery5xvwNYSZNh7C2bWgIHjM/UJKr0bmyjlJ8K0PO9LrdWsjWhmj7v0I+u/p3
         An6A==
X-Forwarded-Encrypted: i=1; AKwUvBxHqHaMItk17XkfSDsqWH1uouZtltr8mJ6QCjNGWpjIoSFKTS/r0O2IJk9ZfhbrbOE/jlB1Jt8Fas4yzMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z95oZbX4rVwcOtlFI7SfXfuc8mrcI847D5upc0bjaucNFAzI6HW
	NMya4Oohm/ATvvP+2mZ1v9075i835BjM+F+uwxfbS+rVzQHrQpgaZCuaDTcw5TqzdSCKf+DjpGu
	sfNsogew5ht39v7bmUk1fg6OcoQwyKbTfDrWm/jd6tjBplBuNqLeqprGkr4JBKvvOEEQ=
X-Gm-Gg: AYBFou0GBBike+r18d//VOczu9oJeoSrh3ezXZZ8ktD9YJTYO5cAyRsi6i65ycmNu/a
	3Qsn2uK3fXmYRYdasFsq3dniZXWqzdBpiirK7Df8SVRsbzXQ8SDxrX7rxR4oF0TZXKHtMgnI3BN
	z2/ngZdjUwByg1x5Arkh7aueZkdtMFFkCfaaV1sUREStQwBgJWT092MfYxJYS/bCsk2DVzoGMCn
	CWegOzSWXw64J781qCYHgzMrECa2qzsjQ0EvjpasRfYgQDZtGHXV0qAxZci2aaUlBZ9rLfJrzCr
	fxyYRJkqhEZAaXjQO08nDyU7fwxr2falGuhpVWIDo691SYbSIw0SXhB8DvHRCV4sMzjo4arxR3K
	XwcV+r3HvTzXSQPDIvTyjRhR9+9eK5tmn5y0UXqI/mjO9TUDXaFbr9eg/1Fo+hN8zld6W2SLg8o
	Gn+MuQ4j5JcCCPkl8=
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr29719434eec.37.1793900229501;
        Thu, 05 Nov 2026 09:37:09 -0800 (PST)
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr29719382eec.37.1793900228538;
        Thu, 05 Nov 2026 09:37:08 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm22087653eec.24.2026.11.05.09.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:37:07 -0800 (PST)
Message-ID: <b780a16d-8302-4f54-968d-e411bf12942c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:07:03 +0530
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
Subject: Re: [PATCH] wifi: ath12k: Fix potential SRNG configuration leak on
 init failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-db9e3c75b3-wifi-ath12k-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecbec6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9PK0hdjxVsNkJ1tq3w0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 59rBgf4MPoA_fChmmqf-r1cu6B29ozPm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX9bRovN73RqlH
 ohwgqt23flfUe1WKzWIJYxgDrY/rlotRAusMFuoACphHfPyI5oTfNBX1ujXFxmKFbhWOGMLEsdh
 h4Edw+KpfF40cqgIkM/sC0FbPWToqQE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MCBTYWx0ZWRfX44c7SIKUk9Hu
 yANyLjBCivMnRTjAqRldooXbdW37xBpecRdce0vcVBboqspaA3IH0Kh2ZQzXxoIVtC+ZyJOeFpE
 BPDOdQ80IYhkDtDRnjsS/aZP4sX89fNZdjyw9DHsW5MaHDlM8k9VbWYFvUzVxXrw2EoGvtej/U9
 M8zec7ZVSYZGQqaq6YTyngR96slm+/GxpRHWJF2tuiowsUMmfNszpG7ILM9N4xq+8GYRlEWdoTp
 IrEhWYEtSdojKaAvaXFlxA3V/xKt6q1qAoe4fgJZ9dXLXar/mvhpMNobDfAwLEVc1XM6Vrqd/8D
 uPzA0A4em9UG8IIvuMeB3aLvttZjukyhgi6jY3i6hvO9UeLUilF6RGMnUF/QliGAXH0jsAEYtxS
 1Sde4MMr2v1Phhvgu0pUb7LnHsG4Dfj3ztvtPovLHKW3loesEXReC6/kG93cJSsUjbWyAVd/1sJ
 nvhk4WMQY+xNpiIYZpw==
X-Proofpoint-ORIG-GUID: 59rBgf4MPoA_fChmmqf-r1cu6B29ozPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050070

On 11/4/2026 8:03 AM, Guangshuo Li wrote:
> If either DMA pointer-buffer allocation fails after the SRNG
> configuration is copied, HAL initialization returns without freeing
> the copy. Its callers skip HAL deinitialization on this error.
> 
> Free the configuration on both allocation failure paths and clear
> its pointer before returning.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: x86-64 Clang W=1 changed-object builds passed with
> allmodconfig and allyesconfig. No hardware/kernel runtime test or full
> linked-kernel build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
> 
>   drivers/net/wireless/ath/ath12k/hal.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index c0c3d2f047ef..8dafbe44df38 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -744,7 +744,7 @@ int ath12k_hal_srng_init(struct ath12k_base *ab)
>   
>   	ret = ath12k_hal_alloc_cont_rdp(hal);
>   	if (ret)
> -		goto err_hal;
> +		goto err_free_config;
>   
>   	ret = ath12k_hal_alloc_cont_wrp(hal);
>   	if (ret)
> @@ -756,7 +756,9 @@ int ath12k_hal_srng_init(struct ath12k_base *ab)
>   
>   err_free_cont_rdp:
>   	ath12k_hal_free_cont_rdp(hal);
> -
> +err_free_config:
> +	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>   err_hal:
>   	return ret;
>   }
> 
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> 


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
