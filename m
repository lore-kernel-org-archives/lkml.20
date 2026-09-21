Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F03D45C5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993082; cv=none; b=YZvkbJNcWCtH2WXQ+OLJ+XnmeD70x9gLRaolis1H1dLPOSXjhZphgjZcJsb0zPmHznsp0ujm3pG0tHeGDMm3GHH8pNBV0IXK3VdBUrzYBcnYVYJ5pUiMG4cfvYHZQz9CbZCAFvSZuFsCKuI2ebREHdNPjR2q10vlXOuorKCPMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993082; c=relaxed/simple;
	bh=ESkY5FWgQMLmQHwOLxfmFmINRkCIod2d2UPAP7eaJZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJt09MUPBE0i+H62WIiPqDY0yjjdzalJxg684E87z8dBHuo7GiBHOXumlOV2otP0A68vCnMVzmyeLC7XuE+jcIypZ+l3yRrMSCdRD5/Mk2YCadGnmxxt1xQdff97fh9AXiECOB33voXBjarGfuQeHhUV7N4n2+Aslxuf76mt/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lji2HYAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8O9F/FD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lji2HYAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8O9F/FD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdt5E2091254
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YNSbtFBhYM3/ttm0CXJWPKRBCFJnEW6PXzhW6IM1Nk=; b=Lji2HYAdkc3DEm1Z
	PQ+lhb98XVPGLSxzKly9KEVrnoyx5FjfBQJbmntN8j5HPHGMK32xkyQFSOOXjnqS
	1MSaYqDOIP2blUU0H04cYbIAZ/ou/Ylg+wHlQp7m7FgTCQsrUKsPQa0LZrP48SRm
	5BrEtPSg/3+7QrFNWjNkJWmGxDQXxjnxCR7HhEmS1R4gnfDG77/eN8/dpEk2Zxuj
	VRaV5RIQn4CXfYpxup7AA/wFbYsnttceFu9mh2sha8NQMWsSu3+PQheaP1ySgx1c
	nRmF8pYrXzx4ehmub8d8ryt26PUC9BtgF5w4ioZhN1ybxVJI8L0TQPuptJCbuUV1
	+R9YMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wt9w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:17:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530db5af1dcso5736381cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993079; x=1790597879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YNSbtFBhYM3/ttm0CXJWPKRBCFJnEW6PXzhW6IM1Nk=;
        b=e8O9F/FDTfW9eFRBiLIFNm7G+7eGYbg5iu02tfsqs8iaxq5Y8D0epU5bCOBLYd3TW4
         GLb+bmLJvssEH88JirFuds8hXqoTfZATfuunfdKDLHju/6cpXVRCvFm+O9/a3bsc9vWr
         sjF1QgiNLb7KSMRUyH0+I72lR6kuFkSNsXNGUB3OrnMZyZc/qsilNg5b6CnmgG4FGnS7
         timY/J4GCtObHKlGJDNt2xeUfhUDPI7OzR0IWv5XavlSuHds2KTV8I3Q2VlDVBK31lTs
         nTWmAV0kxjJ2KCfPbyHBFtZUn82Snz5x4CY/6mD9Y+E0OUZp6f9A+aPZmeuH0WybFxqh
         fuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993079; x=1790597879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YNSbtFBhYM3/ttm0CXJWPKRBCFJnEW6PXzhW6IM1Nk=;
        b=mp5vlUUUeqJ5a3CBEAbBwe1ED1PYs4/AHQBluOgMO3M/ELPwGG+2ty2AvaeQphjYyo
         zXGq9SK41CGHZOX8sqlynKHAxSsKa09yQOvlLEM+XpL8fwJ5aLrhdRw/f09BgJEbzlZ2
         x54p31udco7hYStZB4pOmBZCSvQHY+l0R5eKnXD6ddsEbtw0gpuvhi/9XRUO9vZ153Lb
         x4rX0loQ9ElTva+aeshOnBJZjPy7Dnia0VXi3IfHoyCOaoGCHUnRHfWKdAEm1rnuoCbT
         bjWvr+9RwrDahYEtU9JYE1ftabq/m6S/qChsTxItOiMrI1DICN0o0E4ZbmynboLej1iZ
         +C+w==
X-Forwarded-Encrypted: i=1; AKwUvBx+lajsUJjT7C1lCXIHHLk3Jd4yPWoHKKKdDN3e3kUqvTVlajTKG9Au/s/a0RMWf33L4oth9q4Lf4Ht6nY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+C1wvKsQ9DxndwhigmEnIAYE8D0gn//U89o19xNyMFeRv0UIt
	KSxuKzOgJGgU+m6s84GVroUqBjMmG/Im2luywQERBZ+HIkz6NqPgkmpNffqHFz+OuUmhn1LIWP8
	rKNQ6OeCzZDGirt65e1Wc8wL8F8IzRCQ1Bb7eTVdlyJl6DTWrBbQ5T3ob+OkQP5wyE9k=
X-Gm-Gg: AYBFou0Dzd1owQPPEIk4IqQPtcJijlU9EpswRRBsgoAoEWkWuqVEqHnmMiRU2lJcu49
	YRNs8q65XZSOMJpGlcDmeG8rK2ZqMJtqzVk0hnPblGAgXGEEzWrRe2FfYZ/ODETW8tZfw6Ec3+/
	CnZ6UwKf0+OSKNUwBZiKDKn4+w1OTcHOeC2UbiPQ8HkOvDpZ1vgVjdENrh9fHkXCu/FAxsorbnj
	CSuD1+O5Ck0DfQshEbPS0omcaCbwkdca1AZRfvagjO4e6pmc/rn4PeSeRtYAiqPbcNepzg/9TzM
	yezFeeguuWZDezx5zHslyWD0XtoI57CV1a2Bsefc19OZKwbIWKOpjYDzpYt5KbfXPZ/IGUlupg4
	RfTlvuWtnskgzQQaQLfACIw==
X-Received: by 2002:ac8:5f47:0:b0:532:9b57:14d7 with SMTP id d75a77b69052e-532d8ddbfd7mr3265551cf.2.1789993079007;
        Mon, 21 Sep 2026 05:17:59 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:532:9b57:14d7 with SMTP id d75a77b69052e-532d8ddbfd7mr3265071cf.2.1789993078428;
        Mon, 21 Sep 2026 05:17:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761b338sm21061231fa.28.2026.09.21.05.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:17:57 -0700 (PDT)
Message-ID: <d7c55b3b-53f4-47ea-9dbc-c212c414a694@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: qcom-ipcc: remove stray disable_irq_wake() call
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-b4-ipcc_wake_disable_upstream-v1-1-d1b363b5a735@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfXwYRC8rLdwJPu
 GQ0+nCjoyGuAdxPUopE8eZ6w6i9uCprVApXT/r293qI+GfImX6kCK2F8m+4tAv/p/OlBADQZJHh
 k8W78Lal5ouxX6ySv2fGIXOH+/5JevkscLS66izIMWy3a6QCmxwmrGC54u8FNQiAG4hK7vlsMaR
 modRSwHs7uwj/5I/Ou10F7ONmSKNxPxSwqumL2mM3gTTHOYZvbEMfDpsMGqHtrUxP2zsFi2EbBK
 Px8fRkl1+CVD9HKDVElOiJ5T4RyAIItDFmO4DElQgOUHz2K+Qkz6QNGUs4bJp+XZPAr6LrxgTGE
 fNKFWK7zPmsB+JSj7pIdNMidMJGBvV7UxWtenEQ6yEQohqyTu3eGKCMUGtQ2iTT+qxSvp3CcRC7
 MNFWMj355uNxQwHx2x4ypQWlcLjXXQNddpMQoDE3c0GoMO2knSeK14yVk/fUjX9RT8vdcmKvo2c
 w1X3hYjjQeQYSaQj1SQ==
X-Proofpoint-ORIG-GUID: MYAejD-e1-H8-BLPveBR--SYyWOCX7Sq
X-Proofpoint-GUID: MYAejD-e1-H8-BLPveBR--SYyWOCX7Sq
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab12077 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qUYU0M5rQdTeglGxE2QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfXxFmHZ0o5MFot
 JiUKfXnLIOF5vcrx0GYNySCQYSaYRGBFhZvrPUiZr4pUXJgStjFmFxFgR4vHeu519oPOyGADfuX
 07p4CWBWZpV07kk2j7O5i4/2PxOC/LQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210177

On 9/16/26 9:31 AM, Anup Vishwakarma wrote:
> Commit afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up
> from suspend") replaced enable_irq_wake() with IRQF_NO_SUSPEND on the
> IRQ request, but left the paired disable_irq_wake() in remove()
> behind.
> 
> disable_irq_wake() decrements the IRQ's wake_depth. With no matching
> enable_irq_wake() left to increment it, wake_depth stays at 0 and
> irq_set_irq_wake() reports:
> 
>   WARN(1, "Unbalanced IRQ %d wake disable\n", irq)
> 
> on every unbind. Since there is no enable_irq_wake() to pair it with,
> remove the stray disable_irq_wake() call; IRQF_NO_SUSPEND already
> provides the intended wake behaviour.
> 
> Fixes: afaf2ba5b430 ("mailbox: qcom-ipcc: Support interrupt wake up from suspend")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
