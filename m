Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325754A7C9C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859055; cv=none; b=mDm05s4q7dAgJWWuDOUkp1N4csLpru2uo+aNe4XYTgpemso4SeDEZ8WpZ+rCPhi6AYzYKwjG/pyPKI5PZj35B12ohXd6MLHIf1WrPquOiseTMwJmP6wMRJ3uB3Qr+o0JnQ/QaGu4kiCbtNAaskpwCQTdzHxsM6hjs2iR30reKXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859055; c=relaxed/simple;
	bh=qsNumoTBSrwUbU7OFJ613pVZJ7eY+2K0f3zdIYvMA/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq/kx/XQvb/ZvxdF9k+kOnENyP8leHlTZK9UOoxC1ubKP8HOk3QOSR1mZfzQQffQ8laDTcECsPl7eHokDxLRL281NKFGDYXP0CmHpujC+wOP7VTaQ+aiwKBIYNEBhw7UckubVn3ZR401KnQ8UX7jTQPB46iuinIO2tK+k5pEqzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUTKbEZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ttke/296; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUTKbEZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ttke/296"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691ChXbF2176849
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=; b=JUTKbEZTXKMh5x3v
	VcOxq+OX0snveClbfS8PvAGvErOeT3BQHd5pgUONLYyycNhzpGxkuouNV9W6xzrq
	USF5+RCJwCcnv6BAgJQ4pJZtsIPR87M72cUQPvx3viLPnOTGlS40pZZNcl9IFa9F
	uaw5pjE5wHHx+7fP7Lyzv8Wup5qjbm1GsRj31a9vHj2IBEiXaoIsyeyGcAHai3ad
	0dEPM/hgMCwgDiSZkx3sY1WYDtMCFko9J5lMVzxl3AdKo2NwAhGqIF5lbsUvoCDv
	jNJ6yuYZL4za2zOmMozq5QCVq5c9C5658t2+JuOm0GqVN8ICH11KYdueKfHhndHH
	usIV/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsv8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:50:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc19d8e59so3965885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790859052; x=1791463852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=;
        b=Ttke/2963NoQMVMmxF+umV0oyGF7XgvktodBhviBNl2pO0UnufonHE8QWovuG9K3pI
         UQ9ThdSSw4zdXIPrYXBsFSupF0wjMWK1ohe0bV9P3R2qNA3erkq2UQXeBj6li076w9DP
         R7rLM0gICiS4Sa059UL8wR331f3cfU6ZflrdxhpLJVWVfDITIxzhAvydRRFa6FNsusVy
         8zB91ZCBq33EN8O+8GWM0H3CV4A0DWSLIpJEAFRuUTHHm3GE/8AjPP+o+MJM5UVgnwHO
         0ZFCdInd8+SH3muP2fylf/ceGY+5XIW3PBhIV9nHmCqXvargC0YwmMstrr3GyCRow5vP
         o+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859052; x=1791463852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVRR6552Q7i6toyIteovKxKFPdp0Ro8m7DKjvVzJGL8=;
        b=WP7XYQ9uoh5xRHysPveNMgWVPrKlLyQ+6TJ2nuPSvuohHPkxL44YbEjOyZYNGHzK/l
         ZFxygvFZFK0Rj5nTRzaNMAUE3LtgAs77rYcm9FumDtHIj5OWFUfmIn1RhHByb+xCbBzk
         OOr7GRvSmmC9q7rX/N88auKrFhvXRyqdcucuroDf+oEm1wCiStBcK8QarOHM3S4A3khN
         UMsN9fmzQDu1PAoIPd4dLg4EgmRqVnG/V//57IwcQ19xvT01LTCRFviacRb8hGamhzgS
         qLjrflUb/781fcv/QZ0HRatt8u4uWizRKLxeDqtcpEMARWpezOu4LjywN8Taj/c7ybBI
         +fKg==
X-Gm-Message-State: AFuF++kpdUWpkDogg5HqzukZ5wjayOzLAZl4eq2UGMMHhUXTBz5voMp5
	u98Tmc+XA4FxwGjH2C+9gv6GuWdN128gxpyMZGOok6Nb6XMzigL5VffPnnNzjVhT6+Udqe8mAQR
	TZXOokg+PXlW9nMtfvcCV/kQwQQu9gZN89u9x/ThvIoFveP7r4gFN5PxRfb65jikOx/c=
X-Gm-Gg: AYBFou2Z0LSXCeUeDZwcvlrHt+3WvIf04t1NhzWb2DPkkZ513ol2Tl0gM9aKwKKK5wM
	kBrWLH7+Cw5+XUXogfNUdY/9KOAOsrvFF/BK2ImPAgU3AlqywbednM7UiSPW99brQJguIP5JgRl
	t26Ok93fGuzirS5dEgJ//CkVH5T96BP+d/MUNhu21/Sm1dQg8KMKlGoDGrfXXRkuv5CgRY5CVIA
	7EZl1gwzMe+cbXXvvwzZHYwr79I+fyO8X+J/j6yx09QppgsQU3vr+ORLXZpFY0Du8ptIKH70S0r
	pvTeHoyQMDEfpP7gv+RNlD1KodN6fB+iiAcVjPUaweVuSgStOsM1cV9QTwA8CcuyHp9szm4s55I
	U5uUXicAhIuV+zdifLoyyvQ==
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr826925385a.1.1790859052095;
        Thu, 01 Oct 2026 05:50:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr826917785a.1.1790859051341;
        Thu, 01 Oct 2026 05:50:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e333b8bb1sm139289066b.21.2026.10.01.05.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:50:50 -0700 (PDT)
Message-ID: <e3e8b0b5-3da8-47bc-80d6-c47edf153d32@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add git tree for the Qualcomm pin control
 entry
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, brgl@kernel.org
References: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001123730.12157-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe572c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kjj55Q4xDMlVXKy7ifgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MSBTYWx0ZWRfXxb+/RBRBHXLo
 j01sYBAnIWNIVEJgLOLZ7JfYE3r0TEmZ0TC3kKjcOSfD+3WVqrQEte+agC854XIzggsiaspL0z0
 Q6kS6eb/SDLBrnXclVCIl+Xq1cdxdWM=
X-Proofpoint-ORIG-GUID: 8zb5ZYq5iRGR7PdnZRXvMJAXxKsIoTIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MSBTYWx0ZWRfX2Cbua2KDAJqs
 P/wapMlVppiJCvIfDspprRjilGtDGnPpxBr0Z4rp/BN8nTmUirvyN2WAxuYcppU+EeEEkYzVk4I
 98jb4Xy63YRREznvPM+TeLvJcxQikL0VJUn7khLhzVTKGvDh1IHfKD1xSwNInMy0Pjqy1cIrAvx
 vg2X0owSPaBkIMKLos3fdUyWzWZrAov7ZENXCIWRCmE51CRmu5NrV0KX/o2qx0SYaWnNRN5NWfQ
 QatRK643Mx94CEEfex8ngMbrXLtPS8pkTs0N5OtH8Y9K/l1LhCqI3Zf+Prz+VNXmf4UYwE8JvyC
 fn7ISn3kUCXZkTpC5RXpWHJl1Ts9ookQ47ow6LNlUSbllNl1nF04KARTggogReMnwaH97fYfnL5
 G7cKd+YEmxywr2if+GjgaGXOEc22q6PAi6ac5AQogv1zfqizmcA4yZfIL54+Hnz1yNA5PToTHwA
 wMrqyi7zGda1KNVvSuw==
X-Proofpoint-GUID: 8zb5ZYq5iRGR7PdnZRXvMJAXxKsIoTIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010051

On 10/1/26 2:37 PM, Bartosz Golaszewski wrote:
> I stage Qualcomm pin control changes in my own tree before sending them
> upstream to Linus Walleij. Add a git URL to the MAINTAINERS entry.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
