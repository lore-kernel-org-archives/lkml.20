Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703004CDDCA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167982; cv=none; b=gFbFf8/WxHPGep7UKPne60m8pBg1Dve3aCo7Hs50xkErJqUMIVEfjuT0YsC4AR6wLzEhrXhB6T5eViu1ZE7mTEfpWPkVOaJ1MhgAkM2sCkuEAi9wjIV+M5xUif2v3zZwcOV9kZ1/Iu2F1kolCYIq6cIhmjNFV/AvFAni2Bwc5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167982; c=relaxed/simple;
	bh=g73K1kFJKClIKuK+3AW4NuAPAHp5cYsn0gAPJiYJIgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlrIz+pgQj8MZdhM0YRvhZxi4vhrs/W6165wuRTVx5QHfgEm42yAwJK1Z1AHWKdUsWd5gb+60PiOIpM5Z+bfBI4+HFyjKpRvV0hBU15x++7c8959Ld8WMMC2m5fc50q3EKU+yDjwdz9AOiHpN8t4zmhK+1bVc1bWDNBWoOlF3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmrVYs0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jo4+x8WY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmrVYs0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jo4+x8WY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVY04144500
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3TBru2LjhWrK5UI6Nd5iQkiMg0zqz5wNpP02NfK9egk=; b=VmrVYs0TbJco0JQV
	7D1VASLt1avyVEu3F78DAt7pnsrW0yAs3VB7y27joLefvmGty36nkzNLzcYgFUgU
	Jv8wvNBL2HtyMeBJp3UyexiwmmvbenV+vdF0NUuQqgMeIuYEJDKeGH43LoEYz3I8
	8F26WoVZJwwFFVO8febfx3ijdwrmPoidtsZBftEb/EglLLtCc0rpJSLSzZ8r8fkv
	n1fyMHH2Nv+Ax5vSK2LyVXDTpC4zWo62jmzZUsJWhf+jLap48oywq8JTXZ+e3CaC
	OkhV08huoG4vqyP9AyX7OL8y/Sk3oiZXTbx62UxdtIKlKsQpe5CFcIK6EsfDr6VO
	vKmrAQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428ttnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:52:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-791265014f7so68990137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167978; x=1790772778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TBru2LjhWrK5UI6Nd5iQkiMg0zqz5wNpP02NfK9egk=;
        b=Jo4+x8WYcn8Ev3PaNnZ4hvaKVPE9bYMNLYrlZUxf7vjlAR7OdG+Q8+usJxG5lKtJoS
         uY6edCMFMWZDu9zvJfwrgm5nzvca1RpKXO7xdUyWqnsdW6mex3qb+tJZJmszjp2DwkNq
         cUklF5cYYO8iltQl8jAr3a/Q02PeUmb4eQpSLb2ENGZ58ZYKq6iRS07pFW3nEszvyfKZ
         UKY0P35nxO/hk6B8vNm8ZcfyvoT6lDMhDPeEaf79/T8CEpz0N8H/pw0k4OJGI59tiBLZ
         2IhrdteIQXiFeJYQanNCXXNIUdJLKa+cDB9+GtUx7Q/0w2nkP37QsaN/jK79WPUqh7eO
         DxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167978; x=1790772778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TBru2LjhWrK5UI6Nd5iQkiMg0zqz5wNpP02NfK9egk=;
        b=OELH+Fv7KV/8kUAekEdggPTtiI1DLzsqvkukZoIiWIsF8uQ80alLsf609TnZ2d9RZv
         3bP+gZGIJBq+yDk02GGuMzHn6lPDMY18q2VcGC00gwm8cYUhNB2+J9tZ+QjHV9r0hUuZ
         KNpK+kNOynB2vSU3drsozuwwM9ruBn0dTwHZ3CiaEXaz7G29aritXAIkG8EdDSaMrqye
         v0EIf4wRTJbjxxMUKffWhI3sz2Bm7yJTPYa8NrfnGwERFLndnglwdF7Y3+qjl0lEpr3O
         F6SpICyvWPke9Zvdm7N3v1Zeh6PvHDg/8erwQSsk6i/atdCwMRbmfSs7opjRHHNoba7X
         bTuA==
X-Forwarded-Encrypted: i=1; AKwUvBxRZyM5YeGcXE9xGYtBUGn8rX2jiYeWU/GRxUbbNcwECjI/GRUpi/Fn0y8wN9/TLm74gRwtL9cr/w5+q1w=@vger.kernel.org
X-Gm-Message-State: AFuF++m4UlsIVTV678wnHE8/ycddvFKrDTeewHtAf5ub/PnzxvBqotI5
	iElOldzAGMhKV+vGEW3fBuFL6lLGrz6/lLUcowXVZq92C/GbU+2ZPmalTul+NjBoXRcJWFRPAWt
	H9ym82zR+RoOM08q08PnLbiOqP9G5FMaxFmuZ5KCo8AY3NubAnb7idrXh/w50YpmWwq4=
X-Gm-Gg: AYBFou3WyHNG3/UsKAOGmsg+ConIoe6mhTj1d+Wkx4qeKpUe8DRuV2d+j95o2/Qs8yM
	57x7Ay/q0e/kGMnTgDOA+mrydXkEiuTLm0SoSqwDEgf4qin/LX6ObWgaU8I8vUi0Txy/VAmQKPT
	reEgQd3AvDbFa/NHHA3eh/R2iArK8kG8BibXYVhMK5slpaB/+nTCRDTssFoIBE5Lc3SfafswdtN
	lVViBYrO2E/dwZMo8MJ/xh1wr8r5aWa162pLxUadVa+Fkb8lnY4694DIgyOvG/KfUNKCKsFw2vE
	lZ45ygw3/igRXZWNGaFd2FNPKDqvsB88CDoc0cAw62qx2XBfoXThYtLhTxuLN3AUEgmChgp15Jc
	Az9m/Y1z9TDtVHpa+jJ19Qzv3zvksAmnH
X-Received: by 2002:a05:6102:508b:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7ae544dcb9bmr399738137.3.1790167978581;
        Wed, 23 Sep 2026 05:52:58 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7ae544dcb9bmr399717137.3.1790167978161;
        Wed, 23 Sep 2026 05:52:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6da6acsm110013666b.59.2026.09.23.05.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:52:57 -0700 (PDT)
Message-ID: <6f07518b-1917-4560-9b62-ca21e8eb56f1@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
 <20260915-dts-qcom-eliza-add-ufs-variant-v2-2-86d72a2a8f47@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-2-86d72a2a8f47@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3cbab cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RULibRgnv89dH67Rq6kA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: cZ2mLajdEnpDuJ_4TqwUIT2mWaQB0YzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX1aJFRgnbvATf
 9BpsNfshU4uzLWJfeXqSqgsiEV5HWFLgX5xzk93QFnQMb5HLEsr0Wnl0L8gGwSIZF6qw0Fj8LS+
 xF4+eA9bRrSh91d/2LIjaN2ThCdKju6bQiI/ubUzxx/fIp3fw+Qy7BzMxmNQ65FK4sKFDKvHD52
 PGlU4f56BGFtIp7F13xbMPlz18q2gZ4NM/+vYmeJBYFTkIJffy1w2eIcsESIQkEHLwBKdgWGAWU
 4xeFji5DRcK+pgEKc8Ztsine1fN8fcq2sbL037yoIBXRTa9WpPjJ996zgU1iwMGR5hCboWh24E9
 OOkUbdOi7S4SkbNyXgm9CPW+S0NzkpKjfkT21UVhaaSDOmwzRs1lz83c2gf3qDB80d+dAzL5wFf
 Er7rGwThGKzZIDZkmoqrrG1BFifIOzs+Qjv4aovjbfC2GiJQ6Q5bDJYlcdWBJ8T4kp9EM4A8abw
 kIXCCDv+l4Guti5/cjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX5tSnOGCT+CB6
 +6wtuEkNtlJbsUnYHYMnzhQmxemjTZ5vw1Zk5XNMHIh8zYUREHZrHpxjwSLg79QjCXESTp5cPo9
 r33enOlAtSMOCyeqZArDtEK+EWzp4Pg=
X-Proofpoint-GUID: cZ2mLajdEnpDuJ_4TqwUIT2mWaQB0YzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230051

On 9/15/26 2:03 PM, Abel Vesa wrote:
> The sound card support is the same across all variants of the Eliza
> EVK. That means we can reuse it even for Eliza CQM EVK later.
> 
> So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
> implementation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

the soundcard model part could be moved to the board dt if
necessary

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
