Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593873;
	b=NcR7YtVJrc2Y85PsxUIuxXiXmfrM4+r3tLg0Hfv8LyWynbZzzMwoPmlakwWxj+47Aaql
	 Y8g7wFy0hFGGdym1yrxwSochWN4+j27JTDziMjyySd0xGIO95gZ6da5H31OqEqZ6Z80RR
	 aDgd7FySe7wtkzZcJkclRObGsscImPuHJPzlXTw1qij3WaBTDFeYvGHKQvjyBRDMLKW0o
	 DaBJm0iuHv3g7uSHGllkkS8g/qsweGW8fY67xQP8YjFNqYoXcpWiDT8Qff2ljQvm9dx/e
	 1m3pBTsed37D+hJ2P0LbV8fW3JUj3DjI4HtaiO5iA0Iy4EwIgr4rq+OuH4ySEhLgH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DIWUBaGuWsD0xZ7Hp4rCkINn5dbjhOkM4Za7aeiZ0A8=;
	b=1BNWJlKqMb5bG6ExVqbGmy3IryQ4gTkaSX8jVld8mQF9sQfU6HK/1VPmvaXKeAFEU5Ko
	 u3406LKHvGx35YqdZJCx7nSKiBp0iBq1XU60df69gFaUYDdAq+8RWsmHA/JRl4D6tk0f/
	 59CZUHU9OnS8SmrnvI3GDrSLvWfQzqyaRHMNSJIF+Q/TXvsLqjb6rFSNaJJs3jOT9YYeI
	 2CEBxGsqVUIcedHijRj9DGdtDN9MMmUBSy4w+CiNzThQ1fWCD9ybbFKuiXqK1kYC6+N+3
	 HsBe0007hSMJ9Gqr6YKkzyeZnMFcCs4rAyqoppMrqre8Gmi0eZ6E8TKBOIAweepllOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ep12povA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qj0UwVkW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566AC606B50E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566AC606B50E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ep12povA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qj0UwVkW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR3VK737212
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DIWUBaGuWsD0xZ7Hp4rCkINn5dbjhOkM4Za7aeiZ0A8=; b=Ep12povAjm11dMKE
	yQPIbH475q3SYP43UmPt7XA+VfVQbMbgxRugtn+ESp2KmiCvTd2lAm/AlY4ymJfv
	6Jwhn+B5w5R/PPWzbIXMD782ZZ7C1w4YqbvC36u/NvXhBRaFcizAQqLJkA1L963Z
	scOjJlUCw70Hh7jiXBrMcIvlykWoMTNzPZtvF+l2yBMKmRLSScRFbw0JclZgI7hd
	fc77H4okzV7k/lpiNMzvTVU3nqOJ9/lUwpYTNBfz/kCwj3c3L/EDcnLlD9GRDLUm
	Vb1X2qu1yFPYuN9VbaffVxL1AMMDLLykNA8De0g2OOAo1+n2gBs5TugY7ugSugqe
	K+piRw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jr65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:17:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b23f91cd47so14308c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794593871; x=1795198671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIWUBaGuWsD0xZ7Hp4rCkINn5dbjhOkM4Za7aeiZ0A8=;
        b=Qj0UwVkW/J4uXHaK89gPSJpVTia8nzJfw2bJPKEQWGzthinVL8yukpubyVI9ZuoiR6
         F8otjOmQj0HfKPrAdit0ziL1O+Osv+8jzcw7XznnIv03K0vplRTKfRqq3ul/VhyFSVJe
         wLt9J1Pyf6JSloV3A0HmuRMny/TeRiQNmkbnKuqGlsD+S48mhTlQOKDdiPAAjrgmIOm6
         Rl4DhV58p1UOehqG4+ugVfsj3j77g4XtXXh4M6oXIvmwyqMXLMnXtAmZJt+nfcg+zjPR
         88cIV5czkdaSCN0pANiCYVMOpeLz/1niFjb2eD9F+8d3QX5vSjGUS9NwI2nLcmqIjC1h
         p+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593871; x=1795198671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIWUBaGuWsD0xZ7Hp4rCkINn5dbjhOkM4Za7aeiZ0A8=;
        b=UTCxnedrdbJdm2oncEty5lj38Qs3k5inlySiE77MKeilQmY9JfOZGddAHc6oglxG85
         mGb+N2eiBrqSEDLo8uXnSsaK9VwYAsMXZoQSsaf/FdIQE/l7DzaDQ39fXnZJjs1Y+cbr
         ORwgWUEwkQGwRjY0hAANOjVRywn8aaI1NypGkqwqxyoYfr0SNfQkkil7wkiQt/mzJHOL
         ZHoddqusl70Fqf5skrwl1Bfn7lzmxB+1BxdVRNCHvLgEiCLEzB/IZqyY5VFRJeMr0enc
         rIXp4SfHo80lGEcEBkXG9eirYltmsIST9sY2BObZN65CI3owz+V4PMufWtxsmjM2MAEe
         gt1w==
X-Forwarded-Encrypted: i=1; AL+hErHR9DgFG8436mDTTxvwSbJhMdx+8mDZmfTQXRcEhY+IJnVOr2EAs3bVeVEz5uk/6BuOwFRZu0kAlDL4j50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k49kANuSmuILdnx6hGyeendgX42D9N8atk+VjscheH86TnMWY
	FnIYn2kihqMFp617l9nHN9e4HVj1dSDL/cm9nfEqGZqfgIqkGVchLgbrDgh+jQlNEpVLvkJJz0M
	sTeQsxZBTQBvGUH498h0OOdo/Xxib1xJ1k1024Kr8pDCqgVMnElxGOTnsaV1t90V3tQU=
X-Gm-Gg: AYBFou3+DkL1k6q2FcQBM2KuywJEHxQyhvVVSChSaApunLDH8D1v62HwzmZ/0noYL/F
	eIWzZP7V7ZAjbG+l7ryntaKaG+yrYOWtvSfkxPrdrFlDIBaYCH/wcPLhxOclBjxsP4Xw1Opk5EG
	ZPeHNULt5EFCw8F8XBlHh59rjDZPPa5YrxrxF2GQKIjRg6PLMiNOnJQa5OxzM7J6SwWM7sFexYl
	SXcoQUhmPfWfSz1KuGh/76a5uVBPVvHeRdFtLN5ZuxxxfoeKKiCmBDXLUpwz/WhbUm9n/ZZ+HwJ
	yETQpXuPiKigTNJzuJ0bCycgCK40N6HnfhedmqwukVuWv7ZIQCObrQDxpakPfpDXxvzzR8FjbNX
	HIbpmFLUeee+k+Tywi+o06uoBMohubHVjS2vCbmXBO7y43F8F5jODR685MhV4p7ou69vrl5YA/t
	duUUZCdAo+Stk=
X-Received: by 2002:a05:7022:158e:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b5030dcb27mr5315138c88.2.1794593871199;
        Fri, 13 Nov 2026 10:17:51 -0800 (PST)
X-Received: by 2002:a05:7022:158e:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b5030dcb27mr5315118c88.2.1794593870614;
        Fri, 13 Nov 2026 10:17:50 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm8443143c88.15.2026.11.13.10.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:17:50 -0800 (PST)
Message-ID: <49eed8d1-0f3d-454b-b06a-b9a7a1c49ac0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:17:26 -0800
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
Subject: Re: [PATCH] media: iris: Fix out-of-bounds read in timestamp metadata
 fallback
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-fix-oob-tss-v1-1-fb86f4cabf65@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <20261017-fix-oob-tss-v1-1-fb86f4cabf65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfXwddSpz6bHLDO
 wfeVdZ617GpmH4KVkElDRTg9LXk9Ehb2QEnXCNikqJv/85YbIfW8mOZWcs2YgoCuNDIq2QF19E/
 4VI4LK0usj97HTzcIS7gs06MyPCA1Gk=
X-Proofpoint-ORIG-GUID: 6-67l7f-qEGBjHRG9Sa4n2vl-9bSNmiU
X-Proofpoint-GUID: 6-67l7f-qEGBjHRG9Sa4n2vl-9bSNmiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MiBTYWx0ZWRfX9SQSy5rCR5F1
 Kgfxk1OjHRAwfPX2RVOkJ3MrHSawwdpp5dlh9+IPwMgeZBPP+WG3jJ7lYaaN5ki7VH3zseeXRI+
 hDqhLUQluPzB9M8MnRsPAFAiSmLr1ZocVIn5kKIBN26+51SdKf1G9NZjFBNdrWzcTLVRm9p0ev2
 z4BtNwdOA1LjeFMOhielw8y+g846L2CZ9AYupaCyK72fOqYPmZ3HWwwsRYffSBJmTahE+du6bpH
 Lla5NXQgokjXR/tqi1zh803awLDXcBS/T9AeJf4oXgYSZgK8FRX/q4qDRRVf5sy3WCmKAvgqZJf
 sORphwAnxzJcjZMyHZYpPA1I4dGMqm8v3tSEvTY3Njj7VXMcIHMXEGrhKzcXLKDAI1+LOFO3B3R
 tpNwOhIlcSgR6Gk+sjZ1tZ5/ntRqLhJTOJs7r/rjjr8TlxK7Z0jbJPk5UKFZb1fERchlNqgnTNi
 DmRLzbYWfO3uex0qzYg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75450 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gQ9FY97bq1JvQ168ofUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130072


On 10/16/2026 8:25 PM, Vishnu Reddy wrote:
> inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
> through 31. iris_set_ts_metadata() writes at metadata_idx and then
> increments it. After the 32nd input buffer, metadata_idx is 32 until
> the next input buffer is queued.
>
> If iris_get_ts_metadata() finds no matching timestamp in that window,
> its fallback reads inst->tss[32], one entry past the end of the array.
> UBSAN (Undefined Behavior Sanity Checker) reports this as an
> array-index-out-of-bounds error.
>
> Use the last written entry, metadata_idx - 1, in the fallback instead.
> Fall back to slot 0 if nothing has been written yet. Even if stream off
> and stream on happen multiple times on the same session, the fallback
> always uses the latest metadata received.
>
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f..31cba99a665c1 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -865,9 +865,11 @@ static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
>   		return;
>   	}
>   
> +	i = inst->metadata_idx ? inst->metadata_idx - 1 : 0;
> +
>   	vbuf->flags &= ~mask;
> -	vbuf->flags |= inst->tss[inst->metadata_idx].flags;
> -	vbuf->timecode = inst->tss[inst->metadata_idx].tc;
> +	vbuf->flags |= inst->tss[i].flags;
> +	vbuf->timecode = inst->tss[i].tc;
>   }
>   
>   int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>
> ---
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> change-id: 20261013-fix-oob-tss-7d317d612cf0
>
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Deepa Madivalara <deepa.madivalara@oss.qualcomm.com>

