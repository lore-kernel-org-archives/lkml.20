Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260660;
	b=d9IyusYCQ3wqRulxsYMCJRQhW/Xqe0FT6oiwHWSw+SkaNCUQqZQaDUVpht79Ba1TqEpu
	 qcG2TjmsMOs77AGhHLIIjDmLdyUg+r0cNq9PeuDfkYrDM2BBRnim8rbYmMLRTA22f6ScB
	 srLBEckUjGEIAlMjEM0Ml3TceNpTtRzwpU8ZCQvL/RNca35aSs1NcNujscCcrjKgk2pzM
	 SiQGVj49g6Rc0uNvqOP+9eUBNCS2mLG8hj4vLVPb9v1qndD86cDZYQi3DHSRX4cpkG70D
	 YL6bKauR8ioQWrR2w3Gt6Cf07Y6w05PxPNNuqeBxkkf2FpkZvmgpcKau7dpiuQS4VYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=;
	b=JoknbzAQ6LddZ5diudsZMnhDSzAmmE3P3oB2gOm+KsQOKRNBFIV5yDbtlG1Skcs9u9Y6
	 US6ymI41WBZzO4y5n69rN/+i3e0UC1/+dApcOp6wRcVlWqTJakhoryLoOTEY4BS8tyTx6
	 fwrz8fMpj4xbGokqQFwB0tODHhDugu3J1MRLwyW4H0ZQNquw1gRWb9MIv7oz5cIg3dbS3
	 FgC9CHXtJBKA4A+zIBXjr64klsyrXyjAWuBz6nxsKZ+XPXoMmMh7rieFj/n7AMT5uZ2Ht
	 8bnvsaDetAY120gTswpwd4nwTGifdgD7C/bsr+XgdH8cgDOlh9bZtddptmTVKULV45w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bb9PoiBq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQHlDtiy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1AA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bb9PoiBq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQHlDtiy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H26l2244334
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=; b=Bb9PoiBqSCoRChvf
	1o890rAKaJB6cQmvACTmekSeLbSwRg9ojrrPtRQHEKwxuouNAd1IePVH3vJAbEJN
	wdw/KnxGmf9kBxNelZfBhP4sFRAwmxAN5iJNeR8iQoc6eji2FZi1Adp4V5l3J6V4
	6MkVBO6ztvLc4SFlMu7SfN8aZ36mffjZn+1aUkvA8JCYGceziBLZbUHHpTMIoLXu
	FgRTFspeyjI/e1yDvcv/86/20uSgs8NIjAn2VX9Oyit1+Ten8GSu4ucnUIpU3BXX
	21wMYCToayu0h9i4xQnoKlu8TsLis26Daudg304YsCnQpkTNsWHHRGcHwKXC7fTh
	wq8+KA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s8nur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so44398385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793260658; x=1793865458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=;
        b=TQHlDtiyrP3ZkOc/nRLlpzAvZ3DJ7SZ3FfM2N9mumdnCuhE7c3KPzbNzXvrsqo8zUb
         tEakyaUqGjth9LvkdM49DstaIE3sgMZUAVTfc8a+A3920Wh2hBAxx3qhwLh7qYde+QHR
         AEM11TE/7q2j0D6zdNDUUXT/Ff34JlDdHfjvGeijXDtEPxHHWwFJBqYCCC9RQm+Kl7zN
         vZJq+EFacpOuT5HfeeNwaXMWu31laEA9A1UUSvHbiHDUlqYByQEm48/SNkJWvaSjZpXG
         nsw6VtSWmOnxwu0sQrmKOsZpRO9FayhvRyi4A74zwLfs8uv0nMdhugjW4sZTJwIZuhxN
         9uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260658; x=1793865458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R87gYw/cy5uKWiwAMeRUbz2KigGtGCOWIclDCkHwR4=;
        b=ynfReTSUdS5INhhDtnBOARTFVfYgXavVa5cLO5sAOzi33bI1J3myyAiI0KjId4NG/K
         uhcyuo00G8OHKVXXVOrcRq/zEx9XbXynQs/WMpk5GmeLxfnWR9Ub5EwlnpA4AvGUQI+e
         4XzJb2ILFGx2eB7iBDM27/8jVL4vJxWOBMix674avXROdzPmLgaHxXWGECT4jrw7XVGx
         1NVSqjNAtiLuwZndhcbqN5oJ6QY7lkr9oQUYXBxWB4qOfkd4I6jIU591YB2cJExfzxM6
         zWl/CgQNqVEbL3oYv6RwLsN5GxvpA1yO4dDXuzZMTIPJaGg2WoHNtcbzRvTZ0pn6ifF3
         E40w==
X-Forwarded-Encrypted: i=1; AKwUvBwargprcBOmRZ66yhu8eqMMqiAjgoPpECtSYIrvhWQmYcAEuQppt0yoGDJhJJfmNzIY1zBm2MGkAh2j494=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCFCoo86SeXO7//kBS2YW1kfmEo07q8LPuc6qm2ir+hxgSIaz9
	hkX7f2euUzAKxWjfAPYLvOMWtBbi7CeboXUSMHVmmoWuoAL4FlLtUbdHnGjLL58z2HMoqBWWiEs
	0LTSM6ruPE5uBcMv4FnKJxG3zFKZU6wPG79pU+Q12Z53xykakWWmA+GDrh+sRs0Z36ekJJZp6ZQ
	8=
X-Gm-Gg: AYBFou12IaCuct02pS1hmVSn457hz/xSBKRGX7Vudwm6FLyVQ3S3r61E7rdWPt2Ey8J
	/RvMNu0DA2zwwinLgzqSMQOm73ths2hZShw6Ej+4Ylknff7Vm/k3EQPKOX3b6BGNyXflM9JXSy1
	0KrX+poyeYgC/caIAcOVny8moUbKX3D80NdT1Y3SmdtOx4V7WkRGYrd4ugDoMwZdPFjX2fFRVdh
	oSVF6QDKImUcNgrmGUGxywXJ3bKOz6jSY9h57xVRqsFHPB7reg0n7cslYMB0jghbE1Pc2bL8g1u
	eoXMUfMlaXdFKysEhvuINv8/KxU9q/yJHsGuR5BEL/6sZhJ9eZbk5M1QG/Xiyf4f8pJwzUQFrE3
	ABO2LgzvXiA0C7uCbjFtrFc93HrZluVjetDe42TvmkBl6u+070p/8gb68sanLDNfyLxZT7XE=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr780794885a.6.1793260658044;
        Thu, 29 Oct 2026 00:57:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr780790685a.6.1793260657590;
        Thu, 29 Oct 2026 00:57:37 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650a56sm705458166b.50.2026.10.29.00.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:57:36 -0700 (PDT)
Message-ID: <66c299b0-d30c-47d9-a6ff-cb0c47d2d789@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 08:57:34 +0100
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
Subject: Re: [PATCH] drm/msm/adreno: Soften no-firmware message
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfXzVpVOPdwNqtF
 c9o38uEo2ObXE32z7A/wb58VsJGLRm8tT43uLjuHDDvr6oeSMYpeykeeLLOG5AT9S1lrnr5hsT8
 TDi4vf+oM8V9bpYc/6A+ItYpp4+QI2WWRNS7BptELuXdX7FA6FKb5aongBzc27BRvAPZPGUzYJr
 et/KeRwARtrm7GzWlXBLwG0Mf1YW7V5Y9SomTBBRxZprkHk9kbOteK/YQhSVjNQh6t5txXslvQz
 7MnXb2pRQ3GHlfmR9MXuKGBp39Zcc3pJnvosNtMtmBqe33+5wYkCbZIkAxfvegLhlUxAq3l6PEz
 sIOfdM3HSSmW8C3bCnGjFuQSK6vFXMix0x8ELX0w0UjY0O06yR+zDp2CUo6vSKK9uFebL0VCxtN
 zm/wXt57WoFZqKAZmHJGcJPjKR2tQxWuFR166POgItS4VFFtlWoXA47uewEqHs1D01odsERkOKt
 JojJKUeLOrMg1DAK6xw==
X-Proofpoint-ORIG-GUID: VpfKOBCjT_OLA4NJxETxmpkDcWgUy3XY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMCBTYWx0ZWRfX4crtZFZ9I8bz
 nr2D/vR07fk92O+Lkg/NyeZwon5P9EovrihI44ADlJICWO1VckkEQxmEvhTHXj0ZbFMwllMpo4c
 /jKl7tSVcx3waZT1jydfNXo252ssKag=
X-Proofpoint-GUID: VpfKOBCjT_OLA4NJxETxmpkDcWgUy3XY
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae2fc72 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MTgaiBtVHodLpOmOn-4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290030

On 10/29/26 1:16 AM, Rob Clark wrote:
> It isn't _necessarily_ an error, the driver will try again each time the
> device file is opened.  But if you don't have GPU fw in the initrd, you
> end up seeing this error message at least once.  Which seems to confuse
> users.  So try to re-word it slightly.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
