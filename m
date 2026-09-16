Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6146F483
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549760; cv=none; b=HYqtNxOc51+w9ipn20gdvahFYtNYEXK3XtHls1hS/KD1vy9z1Xwp6D/Jxsp2nsbMbFmzd9cpBYIW7vcrbFOMdKoKkyH7MQO04TtQ+JdG5lGmkamHVZhCSRfBFYKraMFjG7rB7veHR5cLXxAojWW3mq14MTdnzmgdZb6+58SVnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549760; c=relaxed/simple;
	bh=Qu4pqTdu5epD17+lJeflRRMUkQe0SF0FCXVRQBn2mRs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CsoszQTdAa3vF+oXJsMnkmoPu1Aiju4vZco5WrSS9XEJzwN4V68Y2/IPK5YJLPqNHBKHnNeiPNXRrzECZ47enrO3uNz13UBe85Tu9v7+EpHHhKaxp1HEBbiamhNlFnnxvWFaGk+rQGSl9/UnztcPG3fmtz2Y5yaMoZIZV6piWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6lTN0yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcffbFxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6lTN0yr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcffbFxj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gAZ2477689
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbZV7IVh9kI5fSxuVTgJ+fWHTxKOpmNBozeCupilRiM=; b=A6lTN0yr0vhi9xil
	rIMMNM7gXr/opFbNtA/u+SMoNnm96JhgQTYe7tPt+1MDOvw9c/XGNJeJgDH+dg2r
	F/RkWSxSpq8mkcHuRchV3gZntmGHFi8G/R46Zb1WXbn+CHga3U62iJ2D473vhciF
	U+oD8CQK07UCOHhkhho+lB6ruz2wqKlf4g9CERexCQdtbLjFKB0WEDCaZs3i9chN
	ciQ6pptS4tDp14uayljU5qvsk82IW3LlYJlDf5lTPwv7ht+vGfYiYLrjG2SnyhPC
	JfB4d8wMkq9HjI1YsPLMvsCUIWdEZ55wKqWn0oepNnldvTkdrA3YQPBHU3tEMC7U
	560UCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksgxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:09:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so11896206a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549741; x=1790154541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbZV7IVh9kI5fSxuVTgJ+fWHTxKOpmNBozeCupilRiM=;
        b=TcffbFxjH9yGJPcjBRhACQ5bsuKPcKX80wHard5+ewz9QM1KtU+oIO5bYOvMCGq9Xh
         1tQPWIDZMOmNe3CMxFIfzjyiYV2jpYwZTvmU3vH3MzGLckzmvs6phXdhc2x9oES42joL
         zg8Y5aqNwHo1RqxmuFMwwpZawtcqTFQx09Sd6h4G6d8WnNnQXUig5vN17mCRufR4S8J9
         uEAUkm3vtZRLP9+iLTJOcQDDVp8GWoTcAgDwa/dCUBQH0oMdze0ODqlNt4dp+ng14iKL
         Segx70MPXKuYUrZ1CA9QL5bTiKUNtAOc64AE17Oidz8Hk8YFI2cZiUzMog8JPsA4pILQ
         0ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549741; x=1790154541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbZV7IVh9kI5fSxuVTgJ+fWHTxKOpmNBozeCupilRiM=;
        b=Yk3htEnRPxjT72DTO6nBo4dpKBonUcdqsaNYywyPzrB8WCwfFi3AGu65S6azyZqRfb
         YFlP3AJXkWhu+Y1owt5Ca5bAmoVd9ZYO9DfTC9D3Jd3UW85rKobxP02IO18BJ72IF1s4
         k35LtOHEDzKpDLLKCv0dwfUuYyP5/L3499SPo4ln22S2ZEjZNUqeqsPVJfMVTrf8+sO7
         XMT0/KSDx/Vx6I64vXeyEFpENOqXOGw0SRviAzshjlVqnXP4Os7WjUJAuIfi6Es5RTMc
         GAIZHHspbwU0ErfbkNl+gyjwUK7zZMJdegApgwPg8Gh/Bc6yk1jXtF6peeBa+qAit9EJ
         D4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwqAFi5+03/rqCFabmrZ/HnqNbA43YIOLL2mbrJ4g0KZHPeqJ9jfoFJie13JzQK6ip/TfLzOfZ127f7nRM=@vger.kernel.org
X-Gm-Message-State: AFuF++mLoebSmdikBZ89kO98GUfwW0LqJrSnOwrLBYKODqlrH1WS/O/B
	Gu5zWHMgM+55mNVPvZ1kum04CUTFhzMTPDVsQuJu6KEz/apshH/tYG9/MnasGSPHHogXVVsR95R
	qWHcEUd6UdkZXe8fk4b+PUrBZL8hKsU3IqlMymBXouWQDQ7VXq+cb0/29iVePjnTJFwqIeex5e7
	c=
X-Gm-Gg: AYBFou0aNzCuf9VMmRkqALNwZghzZT1qRALvd3Z8mVgtS8nDfzRfdmh7oYkwslGDaBZ
	1r/Qlu3KAOn2ueoZb5/eAbx9uQjt08SYC47brF3gjDsfh32TeYNrFzmqfxGMQ1yRUXgRFV5YBsd
	IffHrrHXUyrTPSRnopIuJyphp50ua19V2voGW9kTgnSUIoTXELcfQSgUQl4hkflZVGNvMJ130a+
	tUeNGZcl6rTjygqFJZ0z1IdQm7amgVpfAXiF3mLuX1PxAn/JNLiAB7cCc7O7jkk5kMdDpDV+7X6
	gCJupOzGue+56UD8K5wz+gUeBMZ915DfVsbN3xRhQLZDlRTzjq/wPw5sAHxs8OXjk7nnO+ZsGgy
	/kLx34xzA7qtK7Iq5Vl4eah2M4d2QUOc=
X-Received: by 2002:a17:90b:4a51:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-39e1e27a33amr4109111a91.4.1789549740418;
        Wed, 16 Sep 2026 02:09:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4a51:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-39e1e27a33amr4109014a91.4.1789549739189;
        Wed, 16 Sep 2026 02:08:59 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c00ede586sm3419343eec.10.2026.09.16.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:08:58 -0700 (PDT)
Message-ID: <19293fa5-3a7b-4496-83a1-422b385fa36d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:38:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
 <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
 <7d78ea3c-3de3-4f90-8964-18a962218fca@oss.qualcomm.com>
 <d27d1c7b-72c8-4295-b308-52541348d1ea@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d27d1c7b-72c8-4295-b308-52541348d1ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX7R6q+56npLhk
 XMG1uY51tJ9bHZJdZrtPPLGrIDD/uhxS3wu1AQVe1nXOVLxKfFCOt8tFNh/j9IjI19u9cU3LtQQ
 Hu6Ev80tC6iJj8g40+B76ho6gP+b648=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa5cad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2StpY0YwogJTyEZmcEIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: HfNOVTxLphD5yIVi-qDzHtFfX55KyiUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX1IH5W4Ik9Nui
 g39x1QoXUAAuAd3gWV1jcNDMkmnAjbIt6MOsRvgNRCo5DAS6/bis71Hcjfkj+5dFqXGFy5T0f02
 KX+FAr0QRVj1F2kJZJ9SMyS5TZsTySGZT9sUoVUUIGOTysC//dIGNjPh9E68zvdf6FCD+VbGj86
 Lc0mBIWC9v8z8lCUqOkksytq+CuEcvGC5Il90KSUvJFbRrB2aiYdTCSP3tPJMDpnLR7lwjj63Ql
 YakJ61Fu5sl/08m7q8savk6J70/lefsaayBqCSQwMQftRnlws7HRaoN1unUAwAUt2uX7c/AdDkC
 VfsOy/8JLkTqfP+IJcpqyNQuS9ma9tRQRD8/m8UmHhP5TkjtqPJ3ePrxVMfXBCNaMy/vBS4rd0e
 KRoRbbufpENOJR28Ug3uLMFJSUqlLjyPdb2w5YyUsPnDhXkZM5XM/bKiePSbOGyC4/z4HWKjoCK
 rM1/OueKgSKGm8fMm2w==
X-Proofpoint-GUID: HfNOVTxLphD5yIVi-qDzHtFfX55KyiUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160116

On 24-08-2026 15:48, Kuldeep Singh wrote:
>> I'm afraid you're unfamiliar with the release process and have
>> mismatched expectations. The feature development of 7.3 on
>> maintainer trees is done already and the RCs will only pull in
>> fixes to the new code.
> 
> Sure konrad, what I am more afraid here is that patch was in ready to
> accept state but somehow got *missed/skipped* to pull in maintainer tree.
> 
> I think i was well before that timeline but still couldn't have this
> patch in(for v7.3). Not sure if something to change at my end.
> 
> Can we atleast pull in for v7.4 now?
Hi Bjorn,
Can you please help in picking this series for v7.4 if there are no
further comments!!

There's another series[1] dependent on this one which cannot be pulled
unless current one is pulled in.

[1]
https://lore.kernel.org/linux-arm-msm/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/

-- 
Regards
Kuldeep

