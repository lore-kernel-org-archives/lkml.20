Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580473;
	b=lLN94eMHGfrnKrMldO0b0cEwqecChpWm72BbrmZBk4SQPBemxXvCXAkUmCMAD0qo62hs
	 DF2lTDNM6jefYOxk8xl1htB554zFL1ejZyLpH50Cy2+Me/Q7OXEmy0/Jk+6bQ2I3ZPBBC
	 HwkMUGQZInMNON6CobipytfWGNY5QaupmeP91KhNTRdD/v9Y6Ip9U8fELutNAwTJVz91o
	 iFo7aK53rXq/1bMHk5Sgq+mrEugZBG+wykM6vFKRNxayI+Z0G/mfWOE9ObMHJ7ivoskuD
	 tUzPkFbiI39BIoYchHRGAmrVkDuGGFvdTeuuVM7T/e2Oz4iZQO4z3B6Sva7fZURPFQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=;
	b=XRfl7Xhp7t6xl/vgh9sos+qYJAfW1e6QRuJoG4k4YOlIGLRsM4w7jHQaAdsN/OllRAn1
	 fgscpgskXV8RY8iQuDCPe1OElXOxYuMcZSYSRw9Je9EzfnadFbrcS5XTeLGth/6LTi8SQ
	 btl6j/1hmvOwdXj4XCZkH5uaF073Qrq6KtxeyTQdCqQOhC0RbXsRaQbqseDe404ipk36o
	 NUYqNkg17zb4kTWONjo1ygI80LJ9EE7hTHyOvuaSqtr590rFPoD2TZWwbzRvtBe2snrle
	 Sna4eqtpeWBdq/2mlqv42HTI8N5x9D/BbD/7IfuUMsoajEV8omK8QWX5nhQdhjGoKYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBhgXHq8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBM2B50P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F03B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBhgXHq8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eBM2B50P
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63hT3958413
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=; b=MBhgXHq83hx5GCDn
	HWm/hqW7klNivdA3DkC75vnc7ODYHVPpIzCBPR//FxMDvtE1VO5nFQGB53GlcDtl
	s+ekgbYqcSvnZKF2rHhdp9JJ5Kcgtm3I+0pi6ljMBL8aAPDhQALTAWV3P5Q9wUGx
	qW9DskDF2rzKgr9BKqyZ6zbpLCfmqOieAduixM3Zxqjo8oEwiptAtBuDmybUajnw
	rbLXmEQmfdriUHKkDWhaNb29mZxwocQBjxWOpZdaPe8MXJabsXqq5vxMIFLVDFIC
	XweuuU6SP1wGYCN7ZeJaM594PK2pl1C2AhBmMD6ayWf37jwj+Ejv9h3SNQ7NYcLV
	lY9+Vw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kjg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:01:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so3235546d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792580471; x=1793185271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=;
        b=eBM2B50P/giQiuDncRDVjUSMeCu1JA89HGBAFL6L944rkksBwfKr0hGMCpP65aHKV+
         MEQ1sCu9kXiQz7W4rpwmRA+UGCwailiqsYY+ici6AnBQqhC9WuJay4se81L1zEGq4s0c
         Tveg0NkjGMV9wt6VctI/2GBjdnmDQjAbiB/mTsq0sxKjuKd5t+2gDdUh0iXjraNcvAke
         97bO3iLtwVvfKQjpdE29brD67UIZnXWau9cGXM8aajBxK4V/WK8hoUxhZ5BGhIwOmqgi
         uXuPCwCbItCUHIPt4U4TjPe1EvkVygk4QZpFO/bgOJBbDOcFwZM/XLbxifhXQkQfTVUb
         //yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580471; x=1793185271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieHFy23q8nzXaZ195Z0A67B/EMZuqN8/BFlEEwpO4ek=;
        b=sPtwuGNjo/0HnGGfAd0vVY1V1P623/vpT4RWf2PdbDZSfd+v9p7+u6/es/7jknMCbQ
         hFiLr06o8pYIipL2G3Wbjx9rs8VwHcoQ2hl2RJELftGDoHuIalKzHkRZtOdHBy2wqYch
         d75a1g2DmbWTYwiaBGzIITzIIngvA2v/Ysad5nTw1riHiPBqCuyYb4NI3tQrTFIxav9M
         h2cmZQGnIZSTBDUuQUnL1k4cWI3HmV2VJoUKUYRa0/L0SFB6p7FQsRydwUaeObaI8Tv1
         2lIQdkKfSIyNd07UNmGyPrOsZ2xGVoDIjmL7vuWXPpGQfvsAoZfMGclebRaJGFl+CbGU
         Izwg==
X-Forwarded-Encrypted: i=1; AKwUvBxhPu5tggRERMjqKU39abywnCy116LKlwWzB+Yj6bOGYHFmmRsEXaknqhX55YPqwcDS/o8CvsBgWCxGdtc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIorGMF7yLziMPfkARTnfpqxFpUEudzaeq1adGhamW03skfJV7m
	QSSyI0T3tU1jhA00l3+4cL8fPTLehna2K2uXBHgXAShZ1+B5JG4cASI8ZYxUjhSRBlfm2VCEwV5
	HpJz/v8RUPzuZNpUw3+4+bpbr/ncV3E+1HoykasOEs08MKezkC8iiAu2IWF/+6VB9v2k=
X-Gm-Gg: AYBFou0xWTzvLEjbED/q+y17GMxjnHX36zl+BGF1U4yf+mzuCU/nDyAPY9Bxagy5mgh
	nOSoBr8eVhvLBudcd0yNK+OAm1PZN8SdYUMNugGWbKdcM0PV+0HubYsO5iJ9BOtkvvcOaQEwcTB
	Nm9GaxjWbrsNym3BgTwTDGxF5vpQ6RseGES16cNRvFgv2ZLQjmZ3W0sRlNr8qjxvW39ITWmuuOq
	LSyspb+5RiWVR18aZ7Zz6Igb1Ih0eTpbnFaAzFHw4ywVzkQkPeJkMkC/sqSlY9+4ChEm8pql+xW
	/EsN4WZkWBHcH0UP5koPbRTHKvcLo/U5lquU796oWLOJL9iCZgQKMK6Rkd1IQ8mDl0qvMwiPLBB
	jSoq/CJyq9jEO+DoOZoAQug==
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr28197721cf.2.1792580471105;
        Wed, 21 Oct 2026 04:01:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5369b5536dfmr28197021cf.2.1792580470613;
        Wed, 21 Oct 2026 04:01:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5b763sm66072366b.2.2026.10.21.04.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:01:09 -0700 (PDT)
Message-ID: <59888512-9938-4982-9869-5f1d0e3770be@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:01:07 +0200
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
Subject: Re: [PATCH v3 6/7] i2c: qcom-cci: Add burst read support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-6-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-6-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXz7UA2Y+DWTSF
 bFqiyxUJ9w/3aaZehG4l6dVDKu7qD4ApYsUjCgSoNxKNibKGUw6iENjlpOdVdi43sdjCiDESV9B
 cm/awd5OntfmajPkm6xn55gPbOmiHzrDVs6wo++W3VEzgjyniSFskJpYavyHzV0TO9Vz/hBKWIz
 CA5G7vreCjFwDIHDvX0ktQsYKdlVln4x4OKlQkdkWmMMRmZ0oZGpUSlfvXiuaqvBUx8pFk8qtaK
 i30ewCR7A+qSr2hEAadt2hDQAgoFv9VjcMj6kKvMTwPuDVkUQVJnyP1+YMjA+P1zE8d0U2dBoZ3
 u6Fy2jDFJ0dxDCtaCzKcsqTf0QVkhfXjep5Vdlj1g9zFXB+aALxnzDrODhp8xfPxCq0Dx36FLEx
 eTi2aAQFda/CMJVi3NTs8sui0T4kP/ZKql74/QqrcEDW+qYyNcVMl1LdsWrIje78DEZV9H046e+
 7BZrPWhUFQLn6WasW3A==
X-Proofpoint-ORIG-GUID: iFrs0_GycjABFWqfP4USfNZFjW87mgPV
X-Proofpoint-GUID: iFrs0_GycjABFWqfP4USfNZFjW87mgPV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXwIE5r/++VWaD
 g5dC2LojwWx6cnOdCsq2vjpzrREi6es4FeyvdB2G98lxoYReHEK/MF1gZox1O/+QUBFY8a/CW2g
 rJazXuTvRk23bAV0f4tGvEamxwvXox4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad89b78 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EWxcpF3ALA2S2w6I5qsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210043

On 10/16/26 10:00 AM, Loic Poulain wrote:
> CCI_I2C_READ transfers are currently limited by max_read_len to the
> amount of data that fits in the read FIFO, as the driver only drains
> the FIFO once after receiving RD_DONE. On current hardware this limits
> reads to at most 254 bytes.
> 
> CCI v1.7 and later support reads larger than the FIFO depth by
> generating RD_THRESHOLD interrupts as the FIFO fills, allowing software
> to drain data while the transfer is still in progress. When the FIFO
> becomes full, the hardware can also apply backpressure by stretching
> SCL and reports this condition through RD_PAUSE_IRQ.
> 
> Program CCI_I2C_Mm_RD_THRESHOLD to half the FIFO depth on hardware that
> supports RD_THRESHOLD and update the read path to drain the FIFO on
> each threshold interrupt until the final RD_DONE event is received.
> 
> Older hardware revisions do not support RD_THRESHOLD, keep their read
> size limited to the FIFO depth and continue relying solely on RD_DONE
> for completion.
> 
> Also emit a warning when RD_PAUSE_IRQ is observed, as FIFO backpressure
> is unexpected under normal conditions and may indicate that software is
> not draining the FIFO quickly enough.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +#define CCI_IRQ_MASK_1				0xc10

This exists all the way back to 8974, nice

[...]

> -	ret = cci_run_queue(cci, master, queue);
> -	if (ret < 0)
> -		return ret;
> +	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
>  
> -	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> -	words_exp = len / 4 + 1;

GPT says: can we keep this check for the legacy case?

> -	if (words_read != words_exp) {
> -		dev_err(cci->dev, "words read = %d, words expected = %d\n",
> -			words_read, words_exp);
> -		return -EIO;
> -	}
> +	reinit_completion(&cci->master[master].irq_complete);
> +
> +	cci_set_rd_threshold_irq(cci, master, true);
> +
> +	val = BIT(master * 2 + queue);
> +	writel(val, cci->base + CCI_QUEUE_START);
> +
> +	/*
> +	 * Hardware supporting RD_THRESHOLD can handle reads larger than the FIFO size.
> +	 * The FIFO is drained each time an RD_THRESHOLD interrupt is received, until
> +	 * the final RD_DONE interrupt completes the transfer.
> +	 * On hardware lacking RD_THRESHOLD support, reads are limited to the FIFO
> +	 * size and only one completion (RD_DONE interrupt) is expected.
> +	 */
> +	while (index < len) {

GPT says: the last transfer isn't waiting for RD_DONE

> +		if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
> +						 CCI_TIMEOUT)) {
> +			dev_err(cci->dev, "master %d queue %d read timeout\n",
> +				master, queue);
> +			cci_reset(cci);
> +			return -ETIMEDOUT;

GPT says: disable the threshold irq here?

Konrad
