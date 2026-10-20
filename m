Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792472649;
	b=CV6hEMcFVmoVFGzRXhTS1bKoIzD4eAPLZdVEVmxQTHY1bm49PE6CR+UKtcKMmz7OOLF+
	 fvzxGiHkRdYIIIKll/A2e4B+aH+0BNzD1YjOsRt8czGLC9Qvh6FiBzK7EmGockDFWgS8t
	 QJ0MGIwKW9pjD0wN5Itk5/mYe1nP3X7b5wbMD6q+IiNzTuEJM1MNm2xGKh1lq5SDjxUFE
	 pptuJYyb3ond46eFx8J7t6w2tTgnDYrETk/98C1IuaoruKxPWTkjpwpfbzeDlWid751bv
	 aFLJSFUFflI/d4rl/1NiYNU2Sijw7w75MGVXYGk4yeN1AyRr7d6r2tyF44n6/U2opaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792472649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G5s338SO16XbpkdtMWpSdxzibIoHZLZutVSoQ9ZJFPQ=;
	b=MxskHHDFob+Y3aOntDy/NJ6J5CyYmnXhVE4xIXNI0ZruOw3p0D/GiILENSMC/vLTfd2q
	 Prt6VurnwHrcSId8rjRboU6LjwU8dpsIP5ggCSw7TyuDaXFRQzPeo+2K1yoDoKkjZ7oiw
	 GTZHE2NI+r2XSQEkHLsJcpcZsPML4g+BtwZgzEYOG+L4DHuzzC01C57WsJsc7jJ7N22/U
	 9NK5BC7O+9Xt39kZlZ2qM0PUYlqedSm8Pa0juGSDv/mGWt3BHS8E2GJj5HVWVvW8VhQoT
	 RSl6Q/snauz/bR9ZCWEprU8L/4IgnoY86wpCPm7iI4t+R2CbH2pFJSxZ2RpJ0M5CMkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drIpf4Wl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dPrDs8TX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B27606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B27606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=drIpf4Wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dPrDs8TX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K3twut527765
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5s338SO16XbpkdtMWpSdxzibIoHZLZutVSoQ9ZJFPQ=; b=drIpf4WlXDGBT4gA
	mAh124NETYBhVg4Y1qRERE9CD4eTAMbt8lp5FVckVh9EQaSJYdaI4rV2HStJ+7yi
	lwyB3CYBMH+7xcFfdzQxJxwSVsZkJ3w/dwi66TUV9jJqaHhihssbfZY20lGtFWUz
	KZeQillWeqD5a5rQrrvNzsdJKGLGMuQgVlWvpdaAVu0sKwQgdx0do+PLvbiGAFGV
	ix/Agcz9PszTJf4zwHK7y3FEd8D7SgKgb7GBbdjrtGRQj2lbXSVEhzqW3bJUFa3N
	nLigHzQ0AijjEPWIsWV2LOFuFQk58ZiAmR/wgzQh7scHgZGrtC47Pj0cnifZ9scs
	8lbUSA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n0x5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:04:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1222986a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792472646; x=1793077446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5s338SO16XbpkdtMWpSdxzibIoHZLZutVSoQ9ZJFPQ=;
        b=dPrDs8TXecLj/FCE6z54O6KdV8izPxIkANuCX2E7VKDFfrH9TyuaiSEy78mIaZWMac
         F1kM90FA5g/zgpd6CM3A59H6t4hu9Qheow9OKqjbVdVzmTraDGA/yEKI/IipRlBX8wHp
         MXgGCNXiU7qjCexmSyAuRy5NWQc7Jzf/PEk4YmURgSqEUOgRTKjMp64AgVezmDCljjgB
         PgYCfZCy9qw6I1CkEdwE5HhmtutLTXp4UDwdbGcRhajmuN2P+D9rPTBPbzEGad+jvJct
         3qrMutmoHDb2/Rq2F/y1PT4Qi6DVtdFO/33c0nqnAx5znsEhV38xCPtzqYMnLarrIo5a
         48zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792472646; x=1793077446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5s338SO16XbpkdtMWpSdxzibIoHZLZutVSoQ9ZJFPQ=;
        b=neLT4jnrz3KWvFH4PVNeh4ybUGeR2o9qlhL0aziZgwpL3rDc4TlvG/vAeq3Ug8lVn0
         Tnv4eJLW+onLIW2QyHJzTj0SK8UtgXgJ5oR/Imex8NJwsRQnm8fEfQI9SfMdp3jqv1Z8
         o0h+Eb0UdW7ysDRV8FqcDZw6yYWoq2qdYATM8W2itlwPni8oYD/6ITCUc3lCSmqzl7iG
         PtTAV4YYizfbokcWo0FwpnxB2KPvQImeLx7cD2o/gaMUub6gY8AbfRgVCnMdwg7BjzH7
         iEAq4T15q4s2VAnywtRm8+3MJrFRsOMaNvAMS0Bxk6mbfAw51j3NntvzLn35lt+cu74S
         FoIw==
X-Forwarded-Encrypted: i=1; AKwUvBwE6cSvD/gN0i0opqjCreWdOrTWLHe2NR7FaL90wk+OLI3x9XPDyJcDDQpuTb6o9Kx/kjXUtyJhsl7Cyek=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjjTb88HRMrgYjpGY4rablYR67wNhH0TtWtyUjmFNDfDBLC29q
	hh8ZySGdeOung/TxpW1h5XIFCLw8+GlcNTCjioO6kKZTvRGuBcATdZSQVvurFZ9x7bq8UBBxrbS
	cmDKs2pr1wxqFGA78QEgTtJ079eru4YDO2A8B6BN/IZ7CLm6N3QHOkuQBSfh4g0FCgqw=
X-Gm-Gg: AYBFou2AxG6tD41NmLqe5hsu1INE2tRpOhB/GOBPCV2Tf7zsS5X292CAeAi3fUXyBWF
	P+Ta7BZd/csXTbPPdRPaUNouvOatwpgFpzGYQoweaa1dHEyAqUIei+fwNAUPVd7oCkauFdqddD2
	5Mnlv3RUkvHHAbcmRab9Y3yrKlbDGosu27jV13JzVjdZX+5gPN2hnfscXxj0mTNgAT8F3rENNHG
	9JV9zZiadH22q5M9+Cv+5JR6L8rnoNz7fdP8K5ZZWAIm5CukQgzC319DdqA/SdAyv6bxHKm7Ui2
	RLPkW5JlblP7XQ0SFmAoOpUbMXBGeJl4PEyPWe2DfoJgbQAjzKvgiSDEGUDxBW1fZS1dHmtzsek
	Ajsx6D7j6X7bqZkiM39dZinLZEYjoBUsf42EU3PIua7N6c/tNKW3X1J6Bi67EwxQc6jDlsJU=
X-Received: by 2002:a05:6a21:b89:b0:3e1:29b:bb35 with SMTP id adf61e73a8af0-3e2260dacb7mr6998434637.88.1792472646552;
        Mon, 19 Oct 2026 22:04:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:b89:b0:3e1:29b:bb35 with SMTP id adf61e73a8af0-3e2260dacb7mr6998415637.88.1792472646111;
        Mon, 19 Oct 2026 22:04:06 -0700 (PDT)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a05e2e9c4dsm2257653b3a.19.2026.10.19.22.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 22:04:05 -0700 (PDT)
Message-ID: <0f38aae3-7e14-45cf-81c4-7647e96722c7@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:04:02 +0800
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
Subject: Re: [PATCH] cpufreq: longrun: fix kernel-doc warning
To: Manuel Ebner <manuelebnerli@mailbox.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20261019182946.1450406-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261019182946.1450406-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Se3U4zFzuFZpyKXp8Vvsq-bd2VFykDEW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAxOSBTYWx0ZWRfX2vcMY0/Yiztk
 ecTdwv2JZECtuMpXBKJkE9ahgY0XtIrr0dbNvooDMcqYKz5k9vj72vzXnfhUo8KpFl2lNA2iVfQ
 zG4wWIHLU0b+WVmOs13hIhhbWUkycRE=
X-Proofpoint-ORIG-GUID: Se3U4zFzuFZpyKXp8Vvsq-bd2VFykDEW
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad6f647 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=b3CbU_ItAAAA:8 a=4doGTLPSjtl--4LUb4sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAxOSBTYWx0ZWRfXy8XmpWkATwd7
 PSAYJRDPlLkJwfV3JZ/VYgEw8aHLplKTUVbr0IJwUOVBu+HsZXQIwNNc4pTRsDAj6jUwE/cIHS1
 9O2HoFguu6W9CQ0AWIwy+qNqhsuEsM1nGN+2IudBzsU5RdQfLwrAZ52aVq3Ms98YYbfKf1f1sLr
 aNHJk/mv2xMg6j0q0YPfX+5bebIwtHpksRGeKezQMGl6wZTqBk1dEuhcUMOuceUrnnUcVyoOeP0
 1QY776R4DfJ97rn8xC1fiW+HGilh8bts+FEvy/8L0v6JBfIvxcu07J/lmSxMSvsI7xk8A00H1lY
 z2MGz6jLIzn6WgtcT/2GRQnCCeeGGWm1jThLsNZd1Y29UXsSAZ42wqQLMwbypsrl6RHVB8V/iiJ
 cox8tV0BBa/zHBJxBgHzbaA8I4pin0ABWkRt7CGJHVDJetTlF1Ml82hJa+lyr84Cebg2xU60Wzb
 vxwtS5cf6YvucUYUR/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200019

Hi Manuel,

On 10/20/2026 2:29 AM, Manuel Ebner wrote:
> Replace kernel-doc comment with normal multi-line comment thereby fixing:
> 
>    $ ./scripts/kernel-doc -none drivers/cpufreq/longrun.c
>    Warning: drivers/cpufreq/longrun.c:21 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
>     * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz
> 
> Suggested by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

The tag should be Suggested-by (hyphen), with that fixed,

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/longrun.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/longrun.c b/drivers/cpufreq/longrun.c
> index 7d4146d6c..c1df9014a 100644
> --- a/drivers/cpufreq/longrun.c
> +++ b/drivers/cpufreq/longrun.c
> @@ -18,7 +18,7 @@
>   
>   static struct cpufreq_driver	longrun_driver;
>   
> -/**
> +/*
>    * longrun_{low,high}_freq is needed for the conversion of cpufreq kHz
>    * values into per cent values. In TMTA microcode, the following is valid:
>    * performance_pctg = (current_freq - low_freq)/(high_freq - low_freq)


-- 
Thx and BRs,
Zhongqiu Han
