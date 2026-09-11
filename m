Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CB239E18E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108737; cv=none; b=WHm40tcysuyYzW1n49in1BA1wUcS7q77hOyXTrmwI0UALglttYxp/CrmPjR8koOROoRxQcy7vMxdJ35gvjVhY2xqgZj3Hj2/a3xWwEdOVe1tTeC4fy2psR5aqrN7LVxXfoijk36ZMLUv3TcZla82uV6xjsw59VjGA8Uxpwyhacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108737; c=relaxed/simple;
	bh=boItcdYNRLaSDuwJMrKPnlUGr8rAib5wS1PhfwnS8Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdyfbuVursjm3A2DqcckPIUe20xkWmpgtBIJYfG1nnf/wp2gB8IVfbbiE1YKn6qDDDznZTLJ+eI+D57agB15j/QIUS50cRjyoN625igzBcw95QHyZPOGu9FlggTvlIhROTW8JdBz4ovH+mmCYcrUZ+/FzPkd1iAeWOLLXZqp3vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnDl+VIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/j8LAIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnDl+VIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/j8LAIl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5JBj74002409
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ob8ae5B5IDk8sQgR+LZlULkW
	3J30ZZBC9EfolVLI+LE=; b=VnDl+VIVtzAQ4bhwY9DN+xH1ZvS9blAeL5TWt84b
	M6ZE8am+zOFdLdyb0OBeS3hgJGIi9s9aWP/ZR43pGGiHSenOCkdH5856efFJRVkW
	eVKCbyxyVhOZrGGZe4T4fbANn0l5GP4OadHTcOPRGWs41ypj1qcdJuJIxhmI1PYN
	4ifY/7RPiM5NL3Cp0sxIZXKhczAoWvVyjuSJ4y3yII7K/U/VPpe3Sa3ZyK3RNdc2
	6Jo+PfUowgJ1S8jIS6E1BmqFfUx7Iipn4HNXH3tQ9MSKMilorEzPgz/yS/8nfvDk
	sFDwNgosuEBbKIPW+4xHQpMdh3GqbqX3e5xKsbVknBD0Lw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd389v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:38:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so20598465ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789108724; x=1789713524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ob8ae5B5IDk8sQgR+LZlULkW3J30ZZBC9EfolVLI+LE=;
        b=Y/j8LAIl0ulYZ4m5SXTEYW0FQsSj0zbczzUnXE5Bnh/6UTMahoeCJrcRh6ml3JGfEk
         Fl0CnFb1opzhgYVh7xnbyL0QrxBK6uZ7IlNrl1h0paLX4lNO3CK8Lx5RHxHNBNdf1vmQ
         HXO0uCjI610+DyiYGgzLFwoWBlYq67JFbHECFp66Bg/SLBNCGcGk/+b8XfQLES5pn981
         JEolgYJ0YvDxxgkLc4Pj3pNGNIWhDhsXP7hXKW5q71PRcK51XrZQKOHQEKeaXLUrIDii
         0ObdAuKd/7q7mGBAyG3cPYBAYVNp/ILxpA1hm0Pmte7hBJW+MQQEJbopTmgF84ybSwrr
         0PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108724; x=1789713524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ob8ae5B5IDk8sQgR+LZlULkW3J30ZZBC9EfolVLI+LE=;
        b=flHQYOByOFoJT5Tu9c3P5AlYWpXhQ+TVw4Nun+qzUFsNXabuggj973ZrqKGj00RdLi
         AnUIxHzGa4ICEwE6YS1LILrFnfMYubrURQTFeuXmr6ZEVn+M5DGsYtwi14fSe6X2+a3v
         Qsxaojb2Usai7915cWjyI6BKmSTZlUmzAnJls6C7o+C6vfKvjdIxKjPxfGMU897KsjMR
         GI5lxc+OHdXoKqWy9bYe98aqgSkHT0k2FG1wAa2xS+5eOZ3sb1fibRMDW3s2biIzId+D
         O+Qrwb3VO4Qp0njdDqQVLMsCNd7XYzPfquGM8Ya5f7c2bA5Ws8FFS7UgePqDqMIGqL9s
         kIMA==
X-Forwarded-Encrypted: i=1; AKwUvByfDNV0EIZEpJ6JHZe0iEZ/j7yMx6AM0NkxAw1C+jBRyxwl2nnRTi2zqg4X7coTxXbWFH1x5Jc+2yhEqHw=@vger.kernel.org
X-Gm-Message-State: AFuF++npxd2kC2bNZXbWlVRrWzeBOqnY17Q3nMDD1OjWkSvtHBtZPCht
	ZhI6ujTEfolFMNuFPZ9yBey6CKJUOPaMcvReq2NcJ5pwwoMOT9/2O8dlI3gKCa8vO/qzHeZHXnA
	/NacQ4kH/Wh4BI+08lJXO2lUmynpZR+gfSTmxC9DsbLVfuxZzL2ITU46QtlLHFbkjOQDrCbLdAP
	AjWw==
X-Gm-Gg: AYBFou09NNZA4fEJpmvbobMDL6D4azCKUZp0WqRboiv5gO/3QiTp/r2kJImkJqAdXf0
	l6vjGWRCPx8Mz53/rolo8jgEdx8jJJZ3tRvsMt15hkHF6chdOeYE6jLeHvdIfHvxJn5Y7TMqGTT
	J2xbXnGSwUc6orPSkO4gykHBm1j6AsbruBbuSqhkZ2y9yM1ILdx3FE2My7Q9MBNtt6A+pniuyZA
	zxuWoAcsdmNh8faOqIRWog4ycChJrevXHwsppnmKMiwq1vVIiZwtPE7+TW1+RRfnUcF1xwwDPig
	V2vtTC1MGVTc0OscmtORS2pndwTusFCNPJUedyZqIzelmzm+2aewqXquYwO1LSndP4ReCEWKwb0
	AbkY0De6FsvX30b9VkJAF0QBquqEDn2C0QgQHm39w5mk=
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr11591569a91.23.1789108723649;
        Thu, 10 Sep 2026 23:38:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr11591525a91.23.1789108723200;
        Thu, 10 Sep 2026 23:38:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm3835825eec.29.2026.09.10.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:38:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:38:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
Message-ID: <aqOh7Wgoj7VnM9X1@QCOM-aGQu4IUr3Y>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3a1f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KVCpSeD2ufFQf_ukYwr_imTmbQI5rW4F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MCBTYWx0ZWRfX6yXEvyV87+l3
 J+wn2JUoYi6YVsLkgXZTFujuGSrBOJUim+FnK18Fb+Ea1O4IKVNUU8HR6lVQt9GUpHAIkxoNMlR
 JuwEcG6RcYhli9WFWuMU+FpC4TYalTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MCBTYWx0ZWRfX6HUu+VqBzdqy
 uLB85h84S27997iBinElaJSl6MW7bxzVahjr6ipmyd8TrbImm9CETd0SSNboGHVXMRFYbX0CppJ
 W1bYvnw1IlA5zEdNXliytrGHiAt0dYUjlWO0+gDqeOnPolr538BCqBcgJRFVAR2jr/BVRowXVrM
 akbG4/rqRDRC2GFhkRhGFZVJ7Q1vdBDE28O3tbZR1DIz1Kj/WisNy/JGZwtGCucVNed3/5Ca1cn
 5wzmeKaeGAO593fOfrf4iztpBVU1dL/CGowwtLEGonluYOtVNR4Q7lIdYVMZ0mKmXekk94mPnYi
 S9INslhZLJIg9+czz19BFhsozDca7SB4nYHhiOPLzGK8FVk1242b+rNCYXSIyoD9FuOg/6dAL6M
 PdNDdbkG6uaZTUxVy6s1qlwBXZS4jq/KU27+g14sGdwba65H8x8Y1o4jGmt2+rComIRNWcjakxX
 9BZRKApuOdYJ597Y32Q==
X-Proofpoint-ORIG-GUID: KVCpSeD2ufFQf_ukYwr_imTmbQI5rW4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110090

On Thu, Sep 10, 2026 at 06:30:44PM +0530, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
