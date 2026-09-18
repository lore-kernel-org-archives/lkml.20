Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25E48C41F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726759; cv=none; b=KoYeZyCYB4MebUzKlhJKfoxJ6Kf6jg+0U0Jka11ydlyUMkD+2XnL86a4O7UpsDhehRQ7OMEREPNuJOXHbOdwYCBJFze7S4CbUPyzY8/Kosg9VwShU1HvTlYzAiYrGcHKYrn8a7zS56uCtkTCCj5cCgwKd5rHwAvztRFnTmuytKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726759; c=relaxed/simple;
	bh=8fjQJiJEzWPsbO1frulwQqvRHirJed2i4uBwsSljtNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBOTI1aVfk7zw8978YIFLZnWbgrPolKw/z0WgMkvgbHZJAs4b+ge7kDEXKOQkt4fNHZ1uE6zlH5Qqq82izj2cgXMw826fMg5pXfIPoOh9v/J6/ILWIrNzG1sT+/4Awq86SSkp20ed8Qeo0T0a8uUvrUnnEH0A7QFsfS2lDm7BUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adl/+FLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYHE0c/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adl/+FLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYHE0c/u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dd763801911
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHkJ75ewzmbvKgcRo7Ae3mDKRV8Ptv+pXDHjf+M9sE4=; b=adl/+FLhGpkds4YF
	5Wu0pL1wJyLDZlwF8otazc3I/JEC3tBX2alBFe19Y1JwoydHubHxIb6m2MDZyUui
	d9f0n+KfMPx3PDd+LncuqGyRb1Zn3S3foEtntbE2IhSBHyX8Kysm91y0ih/M3y0D
	Z0FqAqQNkGc1NhMLZt9PK402OLh6SXGPCQB0Suo3LirlgkW7ADHxoCQl8vt13+4k
	XmUeQTbN9qdbFCq72mwy7F8I/o8tBL2ImKyQJDjN0QeHVN0QBKTlJkrJvkrhSRrz
	bP5XfoupKL92lmSgTabvD1xRzbcfgvVLfff3l7/AAz+s3AuBzBflSj08KdpK6/3H
	uwWb9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku2c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:19:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1bffc2eeso155936185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726748; x=1790331548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHkJ75ewzmbvKgcRo7Ae3mDKRV8Ptv+pXDHjf+M9sE4=;
        b=jYHE0c/ujJAeibz9INJP7zk7x78y40FWJmWjBE+2FUpgn4Mmpw/kjHtA4LZVbOOo9b
         FwVdumvVpAIzAm0zLXbU1rsnIY0GMcYoToo2aNODrS2S2/1dpgGt/dviga3d8dUEQBGI
         63s+1JhyN7yPFnaMtCWNkyrnfrrJA6kss1E5Bs2h3RZ/Ma52eE/FDIvcsG7rko3OVOhS
         FybgY7tem/eHCIdenQBme8aXOoXRqMz3nR5snQgtY/law3YW39CfVh0/kgWueRYEM9p1
         Eq0QvZK/v8XrX/4K/3ImPqPwFj8hk5m2hrC7XYKFBGdbg9Ro6nXLmD0lnJHs4N/IMCjr
         Ktxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726748; x=1790331548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHkJ75ewzmbvKgcRo7Ae3mDKRV8Ptv+pXDHjf+M9sE4=;
        b=Fr9Chn1EGD0pVBjOVYxSS6j0RzfnUbpl3dkNE00zqP5FShhY91Hucs7IeChua2UYIY
         3tWIdM56Yx4wNEDYYhVQ+UzIzbFL0YRdEE/fq3ZqBlTOf0UQAFwgZzv/VLiWDMVun3IV
         f8znlI0qsLy/SFKI4QmcXKtYphWzgP40+jAq984Qbcn5S4ztiyczSKSYxzF94yk1kZSO
         fqZUIB3TikV5ppuKSSKOS4WJyKrIAMtFdO+oMWvBfGY0gVprDwAl6egSd1b0davvAnU8
         bWtpm9XLsQefBC+4/gXY96D9UhiUS42wx1qj0hKkqIUGKYjGcDnQeDDyWec8hpmIg0Bt
         qoYw==
X-Forwarded-Encrypted: i=1; AKwUvBySqGqFirUeLzJTquGpKCDl58RnRcuZGEo6GnEneKUzByYeVi1sRLwkZ0uUna8fr/jn0B/lkim8io2xQUg=@vger.kernel.org
X-Gm-Message-State: AFuF++lAbxXGdLhe0KA3CKZxEDmaTiYN1FDYskWpw4Jd99NOILw0QOOf
	lxOVN6m+2gjCP0ex5NV3U3StuFChPO4LtytYPLYrYTDiSPiacmk7gJv8iB8xMGOBDIKAY0b9Hyo
	/zjA4dvE9TCfqmfCFLbN5+pHqyrXWnggkW65gdnExSzY49I80BZrEQ7NnlzuBTRtRCX0=
X-Gm-Gg: AYBFou1b+vz57s1iOD9ItNLqerG639P1DcnFgS35h9jr16aLLDoDaMYXNgru5ADcSDg
	k8pm1alV9+oGesTJflHVYlJWJM8Q/dpKgZ1agzq7+4yMcccP0HipVgiazrYD9U8kd5aULVfi80Z
	cmK/pCr8jn0NBIOzZ72eKbtVjE9d/JwXYq6HB2AOVVnGFwWabhm9knk68Q1fSLS65PI7oH5kbqM
	Fkq2sQCLUILg6zdUtmjTBNXOi4ltNVBrAGFZfiQYlSQwLQ+TnX3l2NZhbzRvYep3MmXs+qVN83R
	OiA1x0XJr9tlaCyEfM01SxsehQd9R9TGc+I/MiUCqhwsswz6rDHNOQq66tDiEIAymB5/v4P0owV
	eCPANgtFrqR+AOZZ1py9dKU8NHqNs5W5YHxOiBndodzG0mh4XOOxaRNdG1Q6iOow=
X-Received: by 2002:a05:620a:268b:b0:937:5298:7820 with SMTP id af79cd13be357-93bdc6a6c91mr259107785a.8.1789726747815;
        Fri, 18 Sep 2026 03:19:07 -0700 (PDT)
X-Received: by 2002:a05:620a:268b:b0:937:5298:7820 with SMTP id af79cd13be357-93bdc6a6c91mr259101785a.8.1789726746850;
        Fri, 18 Sep 2026 03:19:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm150832725e9.6.2026.09.18.03.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:19:06 -0700 (PDT)
Message-ID: <a2165ba7-e259-4e0b-a533-3961649b1803@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: ti,omap-bandgap: Convert to DT
 schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com,
        daniel.baluta@gmail.com, simona.toaca@nxp.com
References: <20260811-ti-bandgap-v2-1-6fec2a71c394@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260811-ti-bandgap-v2-1-6fec2a71c394@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfXxJ+pHjANKJPd
 Cb1WPN5Vq6Oj5/XGrUmQPjo4bHme5ICokGTtxHVJ4wETryHqBAUjx9H5nKVrTlCVh/x9IkHDmPF
 lblML+ckTFBvClptD+sbHTQP0Wb7gmcNH5kzW7Z/fmGejMKx5EsgQ7hi/bN/wfiW21unTYOrd0l
 TorcJEwWYOKOYHycQZNj4SXSlj/bYzZoVR6h6JNsXHq0b3O9fJF67FHZiCEBGDSo+x7g1914We1
 XQ8vYdweqy/zThv9RbT1v5/uK863joncB0aAFEWqISft+y1+zX5xBGl+/4+ZQmIQ/Cc2yEW7EOf
 yQbv2JFRFA5hSS+QnANnMoOy+KscRA1zIXna1m+c12k/LnNkciUU5EPyRE6H//eL1RpJMGMmM8a
 HdQYDnmaIsVRU8ehK99U4Lvk6h27hVi5U0RT6D8cQ7G56sGrL2sWKzp0tjnSLezp1mlrTzXw9zA
 iP53FiW8yBSBbZIS/Kg==
X-Proofpoint-GUID: 88HpbIcUs84bDjzuzcUACsbpRfz_MpEI
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad101c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=XW-PbBF8hWzyniDVdj8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX0z09haiuyc/M
 vQ+UsK4PjpNIsa3FcsLFOCyJiVL6C0sHBk7n0I4NB8zh+XlmzhMkNyy/Eya5+q1etIxkCQJuE/I
 z2eJlx/A+Uc3QFPv9vLwhqYdvWCUL4U=
X-Proofpoint-ORIG-GUID: 88HpbIcUs84bDjzuzcUACsbpRfz_MpEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142

On 8/10/26 20:49, Bhargav Joshi wrote:
> Convert Texas Instruments OMAP SCM bandgap from legacy text to DT schema
> 
> Add "ti,dra752-bandgap" to compatible which was missing in text binding
> but used and matched by same driver.
> 
> Document the "#thermal-sensor-cells" property, which was missing from
> the original text binding but is required in practice by all in-tree
> users via the common thermal-sensor.yaml binding.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
Applied, thanks
