Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381E73B71AD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718304; cv=none; b=SbiqWPm0GqYd09dWvk0Gnk96/lcGU3aFs4o+zrD9YtITiMPKlpZdaiKWzVwO1GL/Ydh/LCyErK0mh4u4BNhsSWNqWSQLvobmqWH9d6+E5nFwWmeTfDH2O2xyKJpEeVBxypBvmtk0oln/BVevmh/AnqG5LLTUqDDvmFglgvbsatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718304; c=relaxed/simple;
	bh=DZpCf3W7DYEFEAO5ppw8pHOndackIbF0C4IJ+5w6OPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itUD8+vbVfG9eX6StxUvRfrqENl1qaIVUdjexF7RFpisHekqzC3RnoShha39UleBfPDfwVkKV3vRIRWb+E1+hbw6+CJMfzVzbuptngny1OEmGbvr1IvjUJKpVxH2RHd/SeDHgMrp1M9RgIPvYbg5ERj+7tVKIXRlrtlOBsqDwqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwZ+z8ii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjKOYPsa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwZ+z8ii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjKOYPsa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I609nr3945125
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Xl2xxpLKuZ3XVWrJWvIPGXk
	jz6BT+vuek41WXdoj5c=; b=RwZ+z8iieRwrKdJ6HB2nBaKj2v9QEjr9vegvAOUC
	BKIYz7PXGgHdLoryAHGMnkNfObtRfSBEdpt/QGDNccFbZw1iubvO0kEnJMHt5mrn
	p/Rz+Xb31+S+W9+aeXyAdFuBDCJyke3niPa73efuibH+3/ieWxBX0e0ctAaL+0ZJ
	2ciXl1B7NbLevOOchM19EKQCl9tqBLCwTB7kL6FjQBnoazDRg41FlPjhjN+CMOjl
	iNWJ4YTqnPtUX0miOwSA2VLvn8HLWKV86iSsCKKoqhTIvWw23n78eU0uy29Ofw1K
	aGGE9FlxHDEBzYQHWGMPH2AeuaZ8SFZCNpUVJplyQllXsA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt3v5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e98e74535so10400426d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718298; x=1790323098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Xl2xxpLKuZ3XVWrJWvIPGXkjz6BT+vuek41WXdoj5c=;
        b=kjKOYPsab/7pdABHA7pNwM1dcxibzL5ykC0J4S/wNbtP8PWPH5BPYa6MjFrjNd1sCn
         qGAgWjLVNbLSXeXi0YguEdxllyi7cklF/z77Pcr7CT9xAJ7BiAIQm0tIgCpwZN8lwHvs
         AnVPqU5XSb91L7eg3dwySiUpsPHEzlALKrHZGqSp5zbwvHp7MTpOwivsZbediNqWiIIp
         8VGIblRknek22VbjHsUXXe+3/mkm/tf4a2xjrbeMbyjJF757x9XYIHw9JadwjYykmvHq
         L+/PGIpDMQi7HCLajSIe4eQkIvsTAbYY5+J/vq9wCjVcmvL4/PCos/GoIeJtU1MPc4MX
         Cguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718298; x=1790323098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Xl2xxpLKuZ3XVWrJWvIPGXkjz6BT+vuek41WXdoj5c=;
        b=sloPXv6fWBi7RgtEJkgNak89mTVIWx80UaHNNc82UOOCL4W8kAcuhDHefb2Bnp8JZX
         ODJu0McH5+zmMeIC7bSfbOehdRPL0dCWofE9lQH/CASypBmleItZ0W7Hl/9s2h5pgWUO
         vNgSIEBR+G2hb55oemWb4OY8H97gqsVRSVnIZo8iroKVCQ6cuTWPBi/fsdb+kGu+eTZU
         F7rMC9RuBlb4ZFmQKVTsXt6TsPmpa0Lhn7mD/06lvQWXnBJiUUzC/o1g+iABls8g/Cfm
         hvlwMZ2Ri/XIGXihKsVPD+Cdwb4/FlypnTvw+MzC4DSOqpmU85c22z0CCbswwYZvkux9
         mmGw==
X-Forwarded-Encrypted: i=1; AKwUvBznWKx2LqC10x7dAlwHaffUIi7hltn+ud7DwEZBTTozJFGu81ntVIGO1P7Hg2uLGIeGS1Uu3ci8R5xMVgI=@vger.kernel.org
X-Gm-Message-State: AFuF++lDWkkp/UJ77hG7BIppteKZqIYBGY4c4sPRB8ieKFjB76ACXMhE
	FJouiobm6olp9LL8TZBQFpim1P0sGWMKykd2WYGXxx9RTT7NIHgfVC40sNTGYrC8VKRMVZOZJ7x
	sJtV1qJeaf/hNZbaJB1cgTu1uW8mJMGcBIVvhOHbBk82O6sMrZ4SpWqcTWVFKYw2hiTo=
X-Gm-Gg: AYBFou2HSBrtHCGJFUW63Qb8atZdJtStcD9GgiPBYQaXWEGOubxeeanxVcQfz5sC0jS
	HrzclQgjlG+LnLEHLUJ2KLUW8uBVXSya/xGiu+LY62XDxqgnXhYPVrkqLjbewVnoTtVA2/7RdDg
	4Ehq/2uBHV6fFEc+jIlLFwSo0vjCPpsELaQw3HbCV8nqpVIYZo1gF0asGabMI6mEGzTbjrF6qMI
	FaoEqir1Fv3pwM0eCcBERt9U+JBpQKe/YtV+KLufTNCpwErUBtrrOtfpoD1CfZ41tKONv2HTHy9
	8Prc7b6sNcd/PkSrGdUQzcWnjKzL0BosXRQJ4Po8JvNDAYTLU50B6+yifimKl9CF5qwLSVzl7YI
	eNU+vWJl9I5X2Zg==
X-Received: by 2002:a05:620a:44d4:b0:939:a45b:76ee with SMTP id af79cd13be357-93bdc70bf55mr230737185a.23.1789718298608;
        Fri, 18 Sep 2026 00:58:18 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:939:a45b:76ee with SMTP id af79cd13be357-93bdc70bf55mr230734185a.23.1789718298021;
        Fri, 18 Sep 2026 00:58:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm36534535e9.3.2026.09.18.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:58:16 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:58:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Amit Nischal <quic_anischal@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: qcom: rcg2: Initialize shared floor clock state
Message-ID: <4uetjsqcm4ozt62lgj6crwjqxhtbikicccw37mkmxs5xkobvya@u5uhjl5zs4o2>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-1-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-1-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfXyVAqech0nWm9
 S2rpqo62zIxTArm4eC+60MRZMB3kzdDzQkLdli1r/SNK+aG6uCehYIQBYYB4HyRhQtHmE16YdDM
 0G75jQNiSWEus5Gt82HFe2UU4oLUv0gNCl3Vl4W88o8807Q02M0icK6fQ+MLHhxPBT5eZLGH/Rj
 4YQEC7LhHu1A6lqe4+YrsJddAIn9nx9FH3UONVbLexA2AN8IDFLBXJCfa/pw7GGT1mR84ERanIB
 VLtFb5KQsdsrSEkuKNaqMUUeOn20bqIKCir0vvSWo3VmcHUC80KYdfScJRheCeyTz2HcvKM/nBL
 3xU0dAFVO/dJu8LdcgJ35LT1nRPnGui7r8k/g2neJIPdgx8Cw2iFq6vQ2B787q0mEY/jO0raXS/
 o0hj5p6bO9Gyppe7pPyBIj4E8zzUlQgyTRTHk0/NxoeqNw6C4wTb4IZAGkbsNQkYZ6+IieE6DdC
 YuRe/vRBFR9e+wmFilg==
X-Proofpoint-GUID: OBubCD8qwwkeEB2mDt5Hw2U4XU9o8dc2
X-Proofpoint-ORIG-GUID: OBubCD8qwwkeEB2mDt5Hw2U4XU9o8dc2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX6umaXbpKHU1L
 mRqnDdkjsn/bwZ3KeTNEgYe3tLsLruECNp2ELpKBPJqVDBvLC/1EcETFV63o3jjirfDT56Jq25o
 8sYFv/izkpZ4f+mTMkdZRjkU/6meGEQ=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aacef1b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HK8F92NRLrjYxt8c1QAA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180107

On 26-09-17 11:06:53, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Shared floor RCGs use the cached parked_cfg whenever CCF considers the
> clock disabled. Unlike the other shared RCG variants, their ops do not
> initialize that cache, leaving it zeroed until the first disable or rate
> change. This can make registration report an undivided XO configuration
> instead of the boot-programmed parent and divider.
> 
> Initialize parked_cfg from CFG_REG without parking or otherwise changing
> the hardware. Propagate read failures so a clock with unknown initial
> state is not registered.
> 
> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
