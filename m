Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC249E5D7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436518; cv=none; b=slrCblXt/xN4gY5YLQhu6lh3imh52sZEvEqU9PJ4Dehy6IeRaKEi0rOyRz6m8lpgU3FXsD9B8boWf9QY0vhK7MWJHLhUssIWiDu3OZdnGDLaJQK/hrgjU9uLBwnoSHwoFVoTxjR8q5NqcST4CLECBE5nDMcnKS1LPB7MSSajc4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436518; c=relaxed/simple;
	bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOnTYjRIg7UhMcU4yYjzoBcSwEq9EvN9haDCiQbAKw0t3Pt5OYQU/8bY03THiuQLJGK4Z6wo2q8pa9t80KZc3b7+Hq0ZnpYMjnv0pW+WTdU4/LNwf7pu+/HxQBUlND7aE9cri/95wErG22nMxgD8iKMk1lnz6qYIsbsHBCnlq8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+9TsFqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdiHivbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+9TsFqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdiHivbj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHK5f162990
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=; b=O+9TsFqGE6k363JD
	9dCl5iUaVqdw+Uclh1Y9mEV2kw5QjIsYEQHsfBNouNDUqBNanKxnvoO4qvURVb6Y
	tweP7l2SckV3qIF14Dg0GXiNhkLRxRXd3yr/3jdr1ZrFuFb8Y5UX1OloNRpOU37K
	H3GP4s1mYIa6oARjHZZFEf/wrUYXYggLVmkZYCRVfJQ7EyHzUmzby4kHAksf9HQC
	qUhjWwtipBC9lBFl8PV3lOtDCmrTLMwgsW18Y8QeZ7MWpQr1cUKTx65o3cD95G+b
	T5yMZ1QreIlqU1Aock/D31wolgVAx35NBhkL/P51lC5faZTW26HmOnIVcyoEqHUN
	EsnO+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0cc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:55:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so54690085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436511; x=1789041311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
        b=NdiHivbj4d7vqy8EIhZVv5+1etzmuImHPH2wiTt9O+95O5QBt63FErV+9MQJHvvKuW
         z9++AwvCppxW2W1XTgdj0iMCAgm0lRA14OLVVjNBnm5KvXmMstOs/l1YgnqeOof70x7W
         15i+8OeHKjmEzbk3myxoQmNJ+FjI5SM2I/gs95+190q9FeRpx19h6L7RgoTk9kVWI7wm
         UIOycGXKHMZRVlltetM5fiDuaZ+2tOWoMTCxSDTQnWmSKOxHNP5dt6oSnnr9euWPt6bn
         0P2HUaTDNCjZjO3APxBwrmwgNId4MKx8RQI27m5AkfuLrd0pYgwZuy8ogm6sDLeQHA/J
         MWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436511; x=1789041311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
        b=L8yE4ILijbIM5SsuSrhFz1bmCEtZzW7/R45AWTQPJHPI7daoszfgz3WOXq0xJ1OHzJ
         oBEnc59w/W92L5HxQWby2038OpAzSHcFdaBQL5GSpfHpYq8FjPJIe2HN67k/dCW4qspu
         pa/scKvfP/DsD67RhiSHZnJi6o24uGdpGl2lM4s3mAt/dZR9KMqn/MWss2T+Iwjrec7q
         bqLEWZyMCxGWGnDWmRdI9rJsvkknmqJHTbULCzYsW1mvZ6RkR+rxk5P7B8qo8Y7P34qY
         YNCTr+LmI39IfHWnDSUbZ4GFZX9EG98sA6n+slvorVDJKqvTmhmhKmL4wl/GWFfNLgX6
         7FVA==
X-Forwarded-Encrypted: i=1; AKwUvByi17sfRPveczJig2ZwHiszMt1ZHAcVggYxbXHG2N0dhkoNi/KVAEboVRCwecZ9TJppKU5k8lw5gkAQe8w=@vger.kernel.org
X-Gm-Message-State: AFuF++keryEqo+Zat+L6sY93I8iIp69lQjxmUMQzS1m3QKYrAgRm9sjL
	1C2qKDQfls6dddoea9vI3l10ot5dGdED5xqzJjBABCm4tD66JX8qe1hAwDtlj8zGQCgP8Bw3bil
	EsQL9J9jcaOK0raNmDaekuhtp4mRLBRXosnAnJDiPqCq0VKWglMGTSis4W6lbv//Wzb8=
X-Gm-Gg: AYBFou20ImVGeEORNpvl11huaac4UFyRCcN7yx1p/wW7XnAdkowPD3TbRCwFP3kjqPq
	8S3UchZGM7FRKFjGu2Ubaf+fwZC66K16hXwUN56AXav8sEJmcGg+vs+aN5uqsykddnCNb4RxbCJ
	U/9DAmRRDYKHtYV8I1kuJXXDUnRCGmkhFiQdl5ZKU4HhJCYV+5baSOET2iluCU4NxKOldMZBLVL
	aYg+r3sUBH6eV4DhLFh47hf4JcO95Jppus9/IJOtHQ27L347sRc4h6IgREHyr+VHHDRHxvDuUac
	N/HXY75PFjkRvrQTf4iffIaWB3T9NA/dBCnchpkN+cM3rib9fYmbyPqFHwaRpNtRaGM45yIXOLq
	hrqaXIWhX04UBPSb0vONaEg==
X-Received: by 2002:a05:620a:458a:b0:939:4b2b:b831 with SMTP id af79cd13be357-93960f5b7dbmr848199685a.3.1788436510848;
        Thu, 03 Sep 2026 04:55:10 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:939:4b2b:b831 with SMTP id af79cd13be357-93960f5b7dbmr848193585a.3.1788436510224;
        Thu, 03 Sep 2026 04:55:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm88150666b.59.2026.09.03.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:55:09 -0700 (PDT)
Message-ID: <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VyYMrE0eWcn6gY56rr89eGgyn2fnGpjX
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99601f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=zIksogJa38HEA0Sl8gkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: VyYMrE0eWcn6gY56rr89eGgyn2fnGpjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfXz9ySX78ttskd
 cZbRf2ifKf9UADgabxWz7mSy2EJaOR/FOJYzqe9+mbwJwRGaH5kCbrxq4P+OZ/uDzSOKuIK761W
 gz2ya6M4nSp01oBxqdVWBM7TZg5425dCaXIpQ0Sm3Epu0kTMhnmo3ocwDistMKrjxcZ0ejjnZkK
 92cOJKXcw3tTiqewAcjYgfqtOVMIbouMsvMGGJfVRaIROE7uAX4CwqBjztaeKIiLly0NK9+NEf8
 SS+KzuerbA22PetYlqeMFPwyZKE2Z/slvzLyfM0+/ZngmWdbkZS0OMsfCCZEw5tP8xWNjZfHGoF
 C/qPccNMK3OWP5fZTF0HrHxDQwecXTl+HYR7YuWxWyaj+WtQJvyVWMaeFf0ttsvDE1gOfafgJ+p
 S3181RJ87IHubJHW0PKKhS/uxi9s3kZLVj7WsVATl7ZIGJu1aaBD3GZO71CRhMp7RjSh2Ru2Cqh
 tMRbDzYaIzRY5H1xLFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfXyYIfhkc1oRlb
 DtG8jbBx4GJismJLf31J+ycdXpwPL86+nVkdwMfOqz66NJ/GPp29z+3kuQjVmZpFE0XgQkgeFNA
 8pMkMk11t4kk+qqigrk8XnU/lMan82I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030103

On 8/14/26 2:48 PM, Luo Jie wrote:
> Most CMN PLL output clocks are derived from the 12 GHz PLL output
> through a shared, physical /2 stage, ahead of any further per-clock
> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
> This /2 stage is present in the CMN PLL block on every SoC supported
> by this driver, not just IPQ5210.

I'm not sure how the mention of IPQ5210 here is significant

Konrad
