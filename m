Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E73D75BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448319; cv=none; b=oNAlK4gHblozocP0ny3sw44Cce2a0nmLRBA/LSn2K9lR7kbKX7EzsqybTNme1htgOYHYxn2OkGD+k3x7ul1W5zit7VXMu5AyolOKL85rm4tWTwZRyuD0Px+zejYds4uE+HJBV0mKglGlKt/Z0+uSF4BKWrNKbd7KG3jwZahLzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448319; c=relaxed/simple;
	bh=JTdKXTty5jpDO+q/fR8vgUMb71Q9QpcYpIkAR4s8dc4=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=bfpROA6C309pJMkicBjSVI7GVGL7JTTEQF3RSX3sqtWFg3AwrJ+hc9yGmc1MISPBCI4sxSOH9dUxJhltd62+kiBsuTgcCcZOCw4EMegzdIq1C8nF2pPIf9DPXoVkbuKpBAMtu9/4TGhML0cdvVKDiYsufnFUmZwBih5SuaSzdK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3nr29rJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnstdedT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3nr29rJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnstdedT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPwk2167108
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtU8s/AKst+CauFok+Pw4oYBNEt2fpzTymlfvJLMsv0=; b=D3nr29rJtX0ov8K5
	iXxXTwkcjfJb5B+dYsXEvQ52eTfxMxKKlqCKH02lZmD7L1epf7mkJtGKLoqh8IRb
	RjRYVb0Kcg3EF+qN2FwQnBafiXb2RyPTTy8u/xOtZNUmWWoDuyPdAQfPZobqU/kM
	RYwz9l/RJWvYp1t3UIJVRtWjTGQZhLVYcU1fNBUmQ9dhSFD7qyiOYzHXOqBnaU1F
	xOxRRSGFpPFFgtbRmOUf0UflF4FlFR6E21caXJNhvAY78gOv04r7H5HENDvC1yNK
	qCMI8uVo6woiLYGT7ydIZYn48kjWxLQLgB9eng94cvJeZIzDKz4eYIjFv7VyUrsz
	KFaa/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t2be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:31:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4012263a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448316; x=1792053116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vtU8s/AKst+CauFok+Pw4oYBNEt2fpzTymlfvJLMsv0=;
        b=RnstdedTKizLSQ3symCoA8+ox6/fl0VgCtRGEYWV3SJ9jdjXfHNRmSOqOPZ+tC1xYc
         qWfbwAae8kt5NYgmEeKQDdj4fVnuHp8jIvdksTezSVwogZvcnzMOn6nWyihlG+RCwa+X
         WgAldGd5/zTOLXIDvQw/XPe9OXNVgFltQjBz4iKQz02ZMQdI5Qeuu5+8Dv/R0O5clnrw
         NEvTCT3p1C+TK7HRXGIHa9BKejkDLChyvWrFC1DSKN/RP8MiETYx/zc/EKlj23/BcH1K
         mqX+BiPGTSc1nUfof6gIU/fmOZrePgQ9mPqah9+vD3Ohg0UrGDfPOd/W+Oh730+jMs+T
         DOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448316; x=1792053116;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtU8s/AKst+CauFok+Pw4oYBNEt2fpzTymlfvJLMsv0=;
        b=aRmhs1PK2WuSlKYJqZ9W8IwO8F1A8UYGeD3XyeKXUJHzwP8ryy7AD2hvl+RZRJubn6
         z+vXpu9H6BpMzwufLqSorG48K+HuZQp1s8lN/0o/M512eQ2lb6KRfgr4mLwzznIbt9JU
         27OjBwSgdE4HIBc4NNXVXw9SgILzpdhOUTGu0S47vLFbt74kx7sIpnl8VgQ8l5hkJk6L
         weDQv4xhst8f/8yVVswDeP/M8Vr7IUnDGKALgFVzB+bk4kOExvLQb/6XMpzZtFCqjev1
         KBGlr9d6U5277gMojpf3bNqKgU6GpOzwLwqeepfuM7HD5hcoV7owN2gqwFBw7eFXe1Za
         +VyA==
X-Forwarded-Encrypted: i=1; AKwUvBz6/tEkLYKz3/dqIXjgxonP+6iZO1Ahv6XA9NoVVQ6/bNW1RzadC3Ykw0N/lQpBDcxJ/WIy4aF/IVY0Ngw=@vger.kernel.org
X-Gm-Message-State: AFuF++mffL+PuhDgSuf154r8MwAT3YKAMWdyNXzKszSqdJROVOB0rRCa
	BJvQgCARz+0a67RA9gsbmrkIgzrETlrDZngIfyIbUSXXHhOVN8GaC+fSGehVblJgxTUULD8R3On
	TlWSlp958PWv18VkQgvFPpls7rOHqlf5v5I1/v0FijnknUceRS59Uykw9pxzgocLgdKQ=
X-Gm-Gg: AYBFou0dkeFMj11XufHGZ5vnsxnvCC8JzfOrmmp4LEhDUF6NJ5G9cYzTJ1D9W+flltZ
	HLl+WA5FPPbeZ3lk+xti3v5dzzOPnYgY1WVJrc2i4u8gl+8zKdAUgIRTzwDSiVeQZRgjgox952t
	yxegArkNlD9vxIYiPd+r9MMwczo0cAu3YysisKpQVZaZ5g6LCYSdEArHgEsx+zJNK1Y92CojqQs
	hYFUzLg7+mglWgDzowGcHcYq8d5LAjh2WsXOjY45dhCAnY1MODvp056UUbv8EisOb4z4dqakpEa
	PiQJr5vw+TNoD+AcJvvcAvXGqwW6VWUsAQcB/dWHCOams8M8p0MWHvApVjvtscxhHEVFcclxIOI
	CKmLne3vrKmd119C5Fq+UdYAYCW9Jfii+xJNwos5Ehf9b405UwWch+XXtg5/2kk0=
X-Received: by 2002:a05:6a21:600d:b0:3e0:c5c9:d559 with SMTP id adf61e73a8af0-3e1340a3244mr3798178637.47.1791448316038;
        Thu, 08 Oct 2026 01:31:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:600d:b0:3e0:c5c9:d559 with SMTP id adf61e73a8af0-3e1340a3244mr3798163637.47.1791448315587;
        Thu, 08 Oct 2026 01:31:55 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a97c2e9dsm2647641a12.19.2026.10.08.01.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:31:55 -0700 (PDT)
Message-ID: <071d1984-98b8-4cf7-a0a2-00fb2e02b7c1@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 16:30:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Hitesh Patel <hitesh@ebytelogic.com>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com, Hitesh Patel <hitesh@ebytelogic.com>
Subject: Re: [PATCH v3] i2c: qcom-cci: always enable SCL clock stretching
References: <20261007050147.274096-1-hitesh@ebytelogic.com>
In-Reply-To: <20261007050147.274096-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac754fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8 a=aRisd7SqZz04jVWGTukA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: -MK1gV4fJKS-PmrlBIgHhzu5luBqhc1m
X-Proofpoint-ORIG-GUID: -MK1gV4fJKS-PmrlBIgHhzu5luBqhc1m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX+XLbgB0hwnrs
 k5yjBeEyl6ZpWTsp1nTn0l5fNgVVFbmgFrLn4GBjmbkBEPCneNfrztLR+2yYM419FQTqOZJC/bS
 uYUfwZfh9JnGvKIQMtitXt/2Dq8A84I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX970uG5KuIbeZ
 hCfeDt1QaAwHMY4x7IxCQXa8kRuH1GyxpwJsb9JYf35PXmdp/kRYdetR7VuKuQA2nz8xGHt6wpN
 ggZFBQQKy+Bt3KflKqiszss0pdC0qW6GLNrfhjZmmIMPP6Hs/8En7TEBWhZ77MGujLBFl+fFkdH
 G5T9fvr7JSX/tZDBYjTgpFbowqa2bFewJ/59Zhip0df6uUuvxLVoY6+RUettxMqbEzL2W7rbsXb
 KB3DLga6s7kkMkNd7ovrlnELZr3Vbfn+O1HyELxh3RIM59TQ+2Fcyo/NJmWCs8NZOS4t1xgQoax
 it2WyWYbC0VCK8x2SS3enRpqucL4aYFtw9sRiMmMP3dra54Wl2ne9MKVUw6DxDgacd/0JGfnDLn
 PINgr+M1eR0Js9dZlZJd0AQh7y/+st5nCg0VAwfzZ5OGmTXkXuU2abCG48daM9I8Cvqp/6JAX1j
 RB2n0X5kncshpMcvWRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

On 10/7/26 1:01 PM, Hitesh Patel <hitesh@ebytelogic.com> wrote:
> The CCI timing tables leave SCL clock stretching disabled. A slave that
> holds SCL low is then not waited for: the master keeps its own clock
> timing and the transfer fails with a NACK or returns corrupt data.
> 
> This is hit with a camera reached through a GMSL serializer/deserializer
> I2C tunnel (MAX9296A/MAX96717 on the RB3 Gen2 vision mezzanine). The
> deserializer acknowledges the address locally, but forwards the
> transaction over the coax link and stretches SCL until the remote side
> has completed it, which takes well over one clock period at 100 kHz.
> Without stretching the register reads of the sensor behind the link
> intermittently return garbage and writes are dropped, which shows up as
> random sensor init failures.
> 
> Clock stretching is part of the I2C specification for every speed mode
> and a device that does not stretch is unaffected by enabling it, so set
> the bit unconditionally in cci_init() and drop the per-table
> scl_stretch_en field, which is zero in every table.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebased on i2c/i2c-next, which reworked the timing tables; v2 no longer
>    applied (Andi)
> - The msm8953 table is gone on that branch, so scl_stretch_en is now zero
>    in every table; commit message updated to match
> - Collected Reviewed-by from Loic
> 
> Changes in v2:
> - Set the bit unconditionally in cci_init() and drop the per-table
>    scl_stretch_en field, instead of only fixing the v2 standard mode
>    table (Konrad)
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 6d8be7b..04e3053 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -28,6 +28,7 @@
>   #define CCI_I2C_Mm_SDA_CTL_1(m)			(0x108 + 0x100 * (m))
>   #define CCI_I2C_Mm_SDA_CTL_2(m)			(0x10c + 0x100 * (m))
>   #define CCI_I2C_Mm_MISC_CTL(m)			(0x110 + 0x100 * (m))
> +#define CCI_I2C_MISC_CTL_SCL_STRETCH_EN	BIT(8)
>   
>   #define CCI_I2C_Mm_READ_DATA(m)			(0x118 + 0x100 * (m))
>   #define CCI_I2C_Mm_READ_BUF_LEVEL(m)		(0x11c + 0x100 * (m))
> @@ -105,7 +106,6 @@ struct hw_params {
>   	u16 thd_dat; /* data hold time */
>   	u16 thd_sta; /* hold time (repeated) START condition */
>   	u16 tbuf; /* bus free time between a STOP and START condition */
> -	u8 scl_stretch_en;
>   	u16 trdhld;
>   	u16 tsp; /* pulse width of spikes suppressed by the input filter */
>   };
> @@ -260,7 +260,6 @@ static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] =
>   		.thd_dat = 10,
>   		.thd_sta = 77,
>   		.tbuf = 118,
> -		.scl_stretch_en = 0,
>   		.trdhld = 6,
>   		.tsp = 1
>   	},
> @@ -272,7 +271,6 @@ static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] =
>   		.thd_dat = 13,
>   		.thd_sta = 18,
>   		.tbuf = 32,
> -		.scl_stretch_en = 0,
>   		.trdhld = 6,
>   		.tsp = 3
>   	},
> @@ -284,7 +282,6 @@ static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] =
>   		.thd_dat = 22,
>   		.thd_sta = 162,
>   		.tbuf = 227,
> -		.scl_stretch_en = 0,
>   		.trdhld = 6,
>   		.tsp = 3
>   	},
> @@ -296,7 +293,6 @@ static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] =
>   		.thd_dat = 22,
>   		.thd_sta = 35,
>   		.tbuf = 62,
> -		.scl_stretch_en = 0,
>   		.trdhld = 6,
>   		.tsp = 3
>   	},
> @@ -308,7 +304,6 @@ static const struct hw_params cci_hw_params[NUM_CCI_CLK_RATES][NUM_I2C_MODES] =
>   		.thd_dat = 16,
>   		.thd_sta = 15,
>   		.tbuf = 24,
> -		.scl_stretch_en = 0,
>   		.trdhld = 3,
>   		.tsp = 3
>   	},
> @@ -368,7 +363,7 @@ static int cci_init(struct cci *cci)
>   		val = hw->tbuf;
>   		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
>   
> -		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
> +		val = CCI_I2C_MISC_CTL_SCL_STRETCH_EN | hw->trdhld << 4 | hw->tsp;
>   		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
>   	}
>   
> 

Tested-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com> # S5KJN5 on Kaanapali

---
Best Regards,
Hangxiang
