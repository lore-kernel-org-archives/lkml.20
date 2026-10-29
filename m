Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252186;
	b=0zWggwY1MX8WJkeWCF8WsFJF9/eEqFt8hGchnx/hTOUMybETKMIuDCCFfebwFzn4fIif
	 8Hi8Zc8l9U4nDkwoZOFO/f4fI1cp3ZjgGSY91Jyrd2E5735bMjdNIsTXLTwxyaxKOIiSz
	 d/Mh/f4J03QU1CBJKSIMaoIEfJPIPT4GYC1iwJAEi+C7B9agQ4SuTmO/AxJ1qubrTxXBt
	 P8hIaGTOTnUSCkOxmodMqBEGcMN7H22HwXSpBNOeBk9rsfIvoZ41H5vpFPNeNmEdGpbAN
	 8FhC5f0LlTDnUhleeRN08J0v4tjT2eGWuDBpGPR9AHU4DzSF/scMclmsFbe81GD1obg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
	b=3t+333KDkyiHM9YbLM7ygeF+uUfCzc3xTtlQ3uMC0X1Jy2yCOcL1X0suRVP+aP6unmTm
	 ULxrH+yDbEBcyuFfMkbtkkGP+u3avohhLdGqlcxtmmVGITw0pD4Gip9lHhBk3hIOBAr3U
	 7le3pzNm2PtRC5KC5PHQH1Bv/ujK6MaQfIhosumzcrHEYlaM/4jkxUdWjXF42VflzRm9y
	 QFC8j2COAcbzIPa8dFSfr49FBLmVzgVEgKsuvBAcdHRp0b3MZLjcRSkc5Cxz6pNr0zbQe
	 EXou3bdB3h9fyQHBDfdgCmTdlZFpceRA47Lol1CJPCxhwQo+VPzkZkv/1zcYmWwPC+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLVwEfMa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MA/TZZpq";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86099606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86099606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLVwEfMa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MA/TZZpq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gx5I2427201
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=; b=TLVwEfMakAs6PB4Q
	p9p3OujGCJ2pTjhJYLMjThVakBXfVBcBUHHCy1THoDddEqOJesE7CN69fBoFkeIa
	utLbGQEOhzG8uZ18aQ5WuHjbypBgkh7lXRrHJaaZmDLdn77jgBRLjgLerz2JLRlI
	BnzmvcYd3dqFJRetHukHfuFeI7HvFWnwxKJ51DquEo4e4/oQEX77A0JDHnMvCmyP
	67ax6qNdZ0JQ9tZDSJnabSUsWjMgFgudUjvr41SrhSb95Jhj5tKytWUAJTEgZRRR
	46RTKsEfwE8pRGfqUCJKkiKts9vtglLOHFc6ALYxOqNeXL9nFYNwlZtg3IuCxgOa
	6ulRog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2advg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:36:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso241417a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252184; x=1793856984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
        b=MA/TZZpqTudMbtbdd74dbNcHJ3IUJh1o/PXKrfM9TFxKGOA/iqq1M4eOR/4Ozmh4nS
         2RleXoaWFFz2Z8lHt/Gcp7PgtsRRhV20BWrERgduQTuTdKE8b49C0QzDR+JySJXPWvUq
         HlXgmoxSleYGrBq24NM7EAlUL4r/f46sY4MyE2hv/hW6T+ETFYxWnOYnkvU3WPsxToRt
         2KwKTiI4LuJF3CaZwASBxYtaptdI+2srKoccAtCH8vG6oWlXr8BCzVURocTPYFVVmmkp
         2r9B/ZNcDbIaefCW/5Di445Qdz10ii0V2yN5QYG7oaGYrTqcdmg5fHMJXQHTMtClU1Hh
         yunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252184; x=1793856984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
        b=Y9pJN30EcxxlHcVl/Z/5Dew6shgjH7zgJXcTgfUUo9Aj61i1FJgsAyjH+FGtg8WOfT
         M+XpCFxqOXjBrsI5PcuQgtThzm1u5Y1PGr3ByrP12EPQph/qkCQHQfgEKbrsOVSuZZ+E
         QTeVrcSYkEO48DfXSljIjTXUfo0nhPPyWt2qEeN63lQDJSbroa0upyWYp+sHBGLUnIw6
         npmx2qLFXPyd0i2E+UHGo9leydt+G1nYekkeq/83dU2c/yilbR2UYvrvgnVhyh1Li/Ef
         yp7Z2APPGO+SvNrT1/2OW/Dzi+8kL9k2j1jWTjDaho8XAW3UZwy+/FIzlgsLHd9bE12M
         aAyw==
X-Forwarded-Encrypted: i=1; AKwUvBw3wyJh8YTN2S4RwmmOPgT5mUGhBPIsOyolCoFKD1651aQC5tKofAyQfD5ZbGIBCrB5WCF1XaS7zybd5vU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgMS/I53lIt7WhFyael209zKn+rXXNWxrLP8yqBcSj+1XHt7Vs
	bhfd2TalJTECzveS28925c299BjFl615e+C/cIaGwWWhNEDW1nx6pihxrU8KE1aCycqWgGrkFFD
	s8lmB079CG55IGMxzOPRN89QcvkIEqlFCpf5y5hmoDGG+PkjFC4u+Gzeq2kva4M5k5XY=
X-Gm-Gg: AYBFou2l86YQC0T99U64htXlR/4OcDl+WaGn5J7y18A8cZ2r/OETy2TO2wMyqtoq8i9
	ijIhdPSq7yMs1birJRSq02r/bYY3a2u1WLNggNQNG1qo3qhG5zEBT0royBXtUTVbaXFzjnYAmRt
	ArlYQaejgx2wv6cbC4DzjolTZYSuGiwvMovQDFM1S5wr29DctJn7swqs2lj6l3Una6TJAb+W/yC
	xhr9pJCufsagmJggptJv5IG7ofOVO1pe4/IBwZ/Co6iTmTw3vUxUj0xDRjVofB3Y2MU9RSqeU/b
	SE3PhJ1Ovk0qv2H4ADoVm0/XOHsFeut2cEJ1qoalo1dMS9AyqaiyVCpNiNb4hDLsXDiNv4LNKLG
	IbltFH0eqJP1/KCobcZt6ftinZqFbgBkULSCmdQkXuATGahrPwPxRHxdc6nLhpFJ9BQnHaCohcx
	mP+HZh6A==
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr40133695ad.45.1793252183693;
        Wed, 28 Oct 2026 22:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr40133445ad.45.1793252183141;
        Wed, 28 Oct 2026 22:36:23 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm29267465ad.53.2026.10.28.22.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 22:36:22 -0700 (PDT)
Message-ID: <84e53a4b-5ea1-430c-90ce-09d98948c8de@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:06:17 +0530
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
Subject: Re: [PATCH] i2c: qcom-geni: fix double free of the DMA bounce buffer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Akash Asthana
 <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-i2c@vger.kernel.org>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20261028153353.69651-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261028153353.69651-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2db58 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5U0EVFohHyNS2EaXvY4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: wd_h94zCJ1ca-BQbZN5U51ryB_sR9cNR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX5xcg6TfZu8IH
 oRqMn2l71MhsjAhrSnhT6+0OHSh2aHfQODlJAA8hPoffNH+AtMLJB/xZ/drp+IlmAaTKrcUxRci
 1k6862IvUP3+CVjoJkviV7iFfPKHlNk=
X-Proofpoint-GUID: wd_h94zCJ1ca-BQbZN5U51ryB_sR9cNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX5LFaZTwhbKiz
 ie81kVh9gtrS+eHvJldq6jfyEb2Osz6Y42B0B2jwa4/i7qFmxTNQHypk6naIu1p34v/Fkdwmkix
 8os42vGUh/yIUEaymVZ9+H69ji8Wj4VXjjZhbpjzmsrqQMIt9jyCuVJumRD2KO31FXa0zAQrjdn
 T8RqMKnboHgiVmjQirACkOHzrrzyh8YKdtPaYJDz9Pzm1wowgLeOqX+RrHw/0jHE5QONpBPOiHJ
 dSozD13ME83ePnpgnODKYCZon1mD+X8dLj9sEhSu0VPXqoVNxC8AHzq4dOUTqMk6oT69uv8V8Fd
 1nhTIGiz8wWIjzIRKuQRz9C7wEUp+xCojBpQEjQ/HK8/jQSzoM/Wz/ELaTCAFt7cAi525BtRVdC
 SLGty4PPtSzgRTTKwHAYLY0eN6IWDuE58XkrLOgFNh6YiChKVEELhIjlUbEznVfp5AcZJh6QLo+
 dveQQmWOPIlmbIadAOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290021



On 10/28/2026 9:03 PM, Thomas Fourier wrote:
> geni_i2c_{rx,tx}_msg_cleanup() release gi2c->dma_buf through
> i2c_put_dma_safe_msg_buf(), which kfree()s the bounce buffer when the
> message buffer is not DMA safe, but leave the pointer set. gi2c->dma_buf
> is only updated when the DMA setup in geni_i2c_{rx,tx}_one_msg()
> succeeds. If the setup fails for a later message, the function clears
> only its local copy, so the cleanup helper sees the stale pointer from
> the previous transfer, unmaps it again and frees it a second time.
> 
> Clear gi2c->dma_buf once it has been released.
> 
> This bug was found statically and compile-tested only.
> 
> Fixes: 357ee8841d0b ("i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
