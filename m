Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587A47FB04
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932746; cv=none; b=iNVPGWw7pRlRMksf9bYqSf3CnSccF6zaf+iNqv4FAwbvR4lvcfs5h3oSGY7vs/qCjzM3DrGA4JpNCAyAiJARkPlTFPTESOhm0HMypjnBAo0d5j3ef+FOmiB97mwKISb/0xUY2NY4DGZW6yHPPG6pz9zUwnWg2x9jyYUzpHpj7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932746; c=relaxed/simple;
	bh=CqCffG6nLjJm0TXOw/mVHtJVHYpp8tPhVcIO2taG2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVRYI2QvmeUHwvUHjSegRAksWekAugwuoBSaD2df1rNy3xFn1ISxw+rUvD3lkfngtBByC+K+6+NY/12nS534Fou/6MZ81rQ9wZeDgiHmxFEZg3BIJDlEk/vOiJ6LgKsXjAcZv3adSFXegXBZLWqneC93lN7NUJH8eumVUF4TGhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0j+f1FX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJl7QMnt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0j+f1FX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJl7QMnt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j7ef233754
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NbN34DVOat7zldqP3Nj8SrEN
	D+/tgrzS2dBCq5LGZ2k=; b=D0j+f1FXy56bp0hlVMmayiDkwfVuniL/rqgn/1SR
	qPSBjbKmcnKqUELqpgAJ44HhuR/PMVRk6xsklaCpTHNip/y+KFLvHWAca8idiJXv
	3Av4zn00z4or8RD4uqVBwPo6HpGPjg3QaqqoOx1q8eqCzTmo1Z4BctBfd7ZkVrjT
	wd+FKpvu1NHBvWqGAclWccvSJrGIRxuYd0TjdXNoW35q+TfzyUW+90EbxjNVUVZE
	+SPwcwSVCRLSnl+qwX4Nhe4sjBN4mNXcuE1wcd6q0kutRMQxZPJWhPTJT9lB6bsT
	SaTu4CU4Qk6GfoWcOHfHM20TE1wRhqLcjXDR6Zq8hpTzBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9abe3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:19:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so401184285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932743; x=1791537543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbN34DVOat7zldqP3Nj8SrEND+/tgrzS2dBCq5LGZ2k=;
        b=cJl7QMntaKDkb1qh29hiT/h3B3Ukk7HjcBpe0OrCcA7ApWvvDxt/0xVm2rcfvKfNH1
         qno3NbMBdsaYRM0Vtg2SJQZb/05j/MqDD0v4ynptLL21ke1el7Wgx8g8LyWeeZ4ztxmn
         G1PR2SRgTJNHiPaybdJIp+OZq5m/fK9krNX+SBFWTdK4QeIsdPOQ8GGBnLYg0hbPyuq9
         kvNDAu0YBVZGWUGqlOfyH6p9K8VbpBZFmucOSZSVDH9Ynom0c2aaYjI1PzhIYtAi+WUI
         tZInwJTY15eoRVL13SrQ/KvzbpGyHOPrjj1gBg71zWgug8fK2XtW5StENEI6na76B1q2
         2Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932743; x=1791537543;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbN34DVOat7zldqP3Nj8SrEND+/tgrzS2dBCq5LGZ2k=;
        b=QpsNBweeTojyYsuroYKJnxpxX2me0m5xW8TjvH9bOU3IIp8gB33yUdC00g6XL8xHnD
         Mdww0s7Tw8teu1Ggpg3oQ/R/Y2Am6vPJShfRheleB/2uW1on+K72rBkYCytYbbsFgGRY
         TLZiGeBcNgQv9/HCobKOg9IG550S+cfDX9lLsVEgxXAUc+D4nka7uYRoKQh6SAZsuoL+
         nbzlP5LnWRc0BDvSP+elf1GY66TFd38nPj0vmtY1Fyh/+FpLpw5tDuozt5PuLOWucGLf
         ofOUbLm6ElYigijT2MHmXhpC9TmokDd+Blogna1TCuiPj4R9Qm4vhwAngHPcu4If3bQp
         ew1Q==
X-Forwarded-Encrypted: i=1; AKwUvByQbahq5XRDcC7IjWu01TSAqjC6ToSqQoEPggVKDnEcf6UOHqUHuExcohu6wiicl5EBssXEMOx9RRQYqcA=@vger.kernel.org
X-Gm-Message-State: AFuF++lWJtKYf9HQx+OLCzI/i04dCEMs9cGq/8nztNcko7Gizlu3Rpou
	e/HgYKl+EBM9PmbuCXURh+i7sYfQEwfXl75boP35R6d3ki80rOXrdiMQRY8bg9IlQ/pRuuNwKS5
	93GnNH0Y7hmwJr+VZyFCF1UCfZz6pOmpL39uWxhPTxHwc2UIKPp+2Ov1DaPPzu6vOmrA=
X-Gm-Gg: AYBFou2bZhHvTSW2NVkToqjbfoFqFejJmrgT/DoQUWyReQtOHvvCwYgrCdh+cQx0JI8
	76AWuhE6TFGPB5kHUIiZPyKB64B3YdDF0HKSe6LruEPEQKqMkhLJznEQoIuS8p1058bhrAjrxe0
	6Antnv6k8GMUhb77uHtFRQRO7nHjMbwBjo3ibnsaM6atjIB6GdVD4Vi7hG5YU1gWibjcHC7gFgr
	azYu22gbT2RfzoDu5cURkIVWlIFUWxPAAr7rmJ2eY/N0/lPHyMHQdhNd6lQEe5iXPUII0bDcnQe
	j/qr0HTHcHeaexWjX1P+huJ+nhzTUYaYRakvizbfBunU+2mV9fk2bAXhhDni7rIevsrhShwYxvK
	pYQqidzAKE6ppUqoTqxByrP75sQ==
X-Received: by 2002:a05:620a:28cd:b0:93b:d79a:c45f with SMTP id af79cd13be357-93cf19d92f4mr331614885a.55.1790932743304;
        Fri, 02 Oct 2026 02:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:28cd:b0:93b:d79a:c45f with SMTP id af79cd13be357-93cf19d92f4mr331610885a.55.1790932742557;
        Fri, 02 Oct 2026 02:19:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm3983582f8f.34.2026.10.02.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:19:01 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:19:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH RFC 11/15] arm64: dts: qcom: maili: Add support for
 cambistmclkcc and camcc
Message-ID: <astvkiexa6ihrg3w7g5lhowvu5g2i37rxofmtlqejuozl3i4cu@34ej3ckphqwc>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-11-cbbb42e534ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-hawi-maili-camss-v1-11-cbbb42e534ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX5HR7N9Lcz5zh
 +vZJNFw8620qTI23yJ8x1OdsxoLdn6RlIrDtsMLbGB6QOfXzrR+MK5r73OyLvIAcadxAVVe1VxE
 QGXRXFqaHcLK9xk4ndo5SBt/pFt7/zw=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf7708 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=c8Nb2DwzlUeNwivyVygA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IplSfFYpBP6VFRSuO1e0pRCLUg-pV1dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXzfct5TQSlXdW
 Ga7hbJCDp9GBILL6HSRzU3AMTtOLxJHKEe/Gg9IrTYR/Ce9rJTVxYPGx8st5/MNWHKI6bJkLB1f
 rcR00pajDu3haRKLCQXX1LRFIJKmQ/INZH1yRA95ptkvywmA5lhHg1a1xnZNaeL8sdbrSZuXtnb
 nDYY1EGfAujPz1Z/JU8ToKJWhBApIrHFTN/Li3LXhE8/hRJyzgB9VMk7zFlmr8m5DGqKXFrq2Lc
 mHDrzEnNnQAXGvR+DopZzO0FyrWGasiPn0HT5FylT0hgHElVcXIW0j579baGeMAOF9j7HDPCV0d
 1YlcR0FFjDfsLN7ZRrw5wMDD099o9mEmDLwdX+Z9jBPiWoM9i1znclUrwd1+c+LpbrakysVZw6j
 hDxhDHrNBCGwibiKqy2o0gvVNi7YPL9l/zbBha+vDEtUc7N77Em2v6nbPel4m6sdvlqIT15MlUH
 81t7Y8AfQAJFTPlNzGg==
X-Proofpoint-GUID: IplSfFYpBP6VFRSuO1e0pRCLUg-pV1dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

On 26-09-23 16:32:42, Nihal Kumar Gupta wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the device nodes for the cambistmclkcc and camcc on Qualcomm
> Maili SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
