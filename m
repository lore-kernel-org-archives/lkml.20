Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2D1370D7C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249758; cv=none; b=V4G9vBHb40Nj0jyR2HLm+NeF1Cg2TCpPvto5Nr/ieNvkM2c9TO9eCVDXKfuluQSmJx9IPTbSz8QYR7dkrRaFVpWPWDClEPOYo3LmODSKe/t0qOH9dhfQE3vHu0EyhBitNmjx9xFQNiehErJZXb26jtoCwD5CkQuAXTttk14yts0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249758; c=relaxed/simple;
	bh=XC3g9SfcpSuQ2UnRkRL38hKZEYdHmgPnxGy3AaH3AMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnVqXNnD+e6rB53gqOKhsTPGvC11cnN/c4C5vnCF07H/HnCp9wVRskomLF+M+v2oQQcS7DcnmofV3ihy9tvPrDmLdgz6dV6lTW8eQ9bjHMSoa7yJ/YMLzfxuhQDo7jI58+qfaHSj/wGIuiFhsphalEC6YzOFNt3tAVDwUo1heTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNx4Auht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MS4LcUFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNx4Auht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MS4LcUFV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9QAml1774013
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2NGtpxUDEm3znMDiFzPNS5o
	aL/oxJhvkzadrxY1WCg=; b=cNx4Auhtm6HmZ+p6qR+mYt6+6tWpWH/Pzgac274C
	kg2woD1jZWVa6/3kLB7Km+5ac9WYx1nf1N+6NktewyNsT4PPO0BXtv4Lm9gKyHaU
	5HCLEYZ2+jBFS0NisKbaTE/AWd0DNPW+x8PcKLaAZLLik4IKipsUeJ/nT8nUie3v
	PzAsTf+tWhk4rr8hkW4Uqo/jO/J8yPN4f19gdRPwMQ6WrF3qXvrtt5QjExVjsV/7
	vM0dSYkSXGfLM3LGFnbvX5y9+bK7DH9aO9bZButgWEzGKw2q7KLmxQqsiR11BbOi
	xsCmAngqwI09r0Z4GzV4awsi+/JHjI813RYplSXWLUW+cA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb47u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:35:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso1549464241.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249750; x=1790854550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2NGtpxUDEm3znMDiFzPNS5oaL/oxJhvkzadrxY1WCg=;
        b=MS4LcUFVErpBjyuRgY4pMhU4pSeC9SxAFKgAf90nDYwEMtoWNKmhZkLNQ/JgWgTVsI
         ZwE/WINEAcyjOC7zl7borI84lZTokLiEV0LTXi/XVSehmflsDL3LP+krMmBFNRRB2T9d
         vydlYYgPfBynSEzckqo9dN+cHQuvutxhDCRRJKkw5A1K9wXpZSwGpwrCF2/II+BWIumD
         zMe19Db/CRDB67OAUqm1xPBYus6kcd1Lg1Xr+iC2zYXR/OK9ec+k0/a80dMLS9OlkfrF
         naza90wxDra/UtQ3Hq/47oWhSGTI0nYGaidWEeyxh5YL6oUHL7UBBlITbNykmz9W1BA1
         eMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249750; x=1790854550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2NGtpxUDEm3znMDiFzPNS5oaL/oxJhvkzadrxY1WCg=;
        b=CLzKMEb53E2OiT7D1qm1oi6in8j6nwojy42r9EM+iNlbby4fvI/XREc1VuMzj0qc4V
         QSg3hNYwVA3hp2cMwObG5ezI0XpnVqDjOMsqMr7W3IzCeu1mJsNqb2n0+PLTCH0yBxCo
         BMIA3g9xGZkM0U8y710jmdKxa5kBQlscH/ba6BhU1BVLksXBGESTetLcog4NVsmoiV1x
         pWKZL76Ae+vQMxjUleG9NIer+sJhJGf1q/9hk2UU7m8cJTU3AJQeP1pJsYVg87ZrObtp
         9e5YZbqJYN7zi3u8SDof+8lXUUaYGLSCZyuDfwFv1r/HWKzCYp2D/efVw4uVbUZGaxdu
         O9ww==
X-Forwarded-Encrypted: i=1; AKwUvBygV6KSqV/4VxjI/Ffr/s3NrQM3IQt6F1SJLPO4cYJroyQdiAt0u1SnEAz+tSrLawVkFKEDJALdQx86088=@vger.kernel.org
X-Gm-Message-State: AFuF++muUrw9+ZVBacxGwO9mXHmzivPar00NPauA97DhZinG1zHBcbYh
	2j119meUsjkqGyU5BkuhgdVKQYMsr7bmAbxz3Ve7iCzLxAPe8d0MlPw6RZWwyNWANH8ADADuXJ1
	9hasGj5Y2c5Ns+bwdSy6tJ8d/6Tb2mgY16xSeJfQ4vQANhlGlfVVZE3za8SjJVT1uses=
X-Gm-Gg: AYBFou0kULBWKRe6Z9EJBmU9L1+R0FMM/pkkUJdMG4n77JZRoTxEA5syqZgcAzwI/Jl
	zRWBI1akr2j68xzATkCTX58vqSPOBJE1pQHlq9sauJoHhUZLxWullDbc5sQ+nfXuITWYKIwLekS
	aMC3AotTEbBwxuqZy+m60YVTvxDeUXM5JXK+Q5w3D2VFQdJMGC8fPiNURc5TDR6/8TA2VP0wcFl
	c/BCVz4WhZm5FxcevGfGC2dCIdQpLBsSx0oJUqfRsMyg5WZLSI/VYB0bTG2eJ5eJSFQzwB3t4VZ
	Uuyi++HoWeSaAhwoBSG9RnBGmbeTCFz2dAxsgOVWKxIqcFQJKzfc73UYvn96JqZsSQs0yHFfTeZ
	5fKn9O/eb1XRIWEw=
X-Received: by 2002:a05:6102:4b11:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7af1dce60b5mr1133956137.26.1790249749660;
        Thu, 24 Sep 2026 04:35:49 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7af1dce60b5mr1133943137.26.1790249749046;
        Thu, 24 Sep 2026 04:35:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm13914254f8f.16.2026.09.24.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:35:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:35:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
Message-ID: <kddqvzlmiqgqhz3hftikxyu62p55c3oyg7ftfpgd7mqul2hrqr@4txuknia5zt5>
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
X-Proofpoint-GUID: 7gVs3lhfJVl9_7rVVm3-qITx1jq9e31f
X-Proofpoint-ORIG-GUID: 7gVs3lhfJVl9_7rVVm3-qITx1jq9e31f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfXwJVeNbaK2zPS
 QCLfkbHOpuw9JDuNiY3zYAPL9yLaLQASdhny8sNAPvdAAbn4bmzcN6ndgJKAQFesMjJ2Dq0G2AL
 XrDb+/RYhOj372lgUVFkYsfPxTQmQIQHdBgPPnytKO8vctAxTrr98qsIuzvXbK2YKSef5ZZCqxq
 8d5xq4NHV+CfN9Ephoy1O3ArODZpA/WhamoIk6cBjKiTmtqGHDjF61L+CN32ukO4mM5j7FCZU67
 NADqJ7txJdLvxN0uuFCKOdElRMshGoa8P2i5drY58dFtZPJDgu++OYGPblbhZQ8J4yLl5r10hrB
 zd27AP8pQLoUc+TPQkduLEDRIxNX1OE1G2I4BR9kf3CnQdmzVqaV35kb83yz/O4BaNmhGoUC0f3
 oawXBW0npf7Z2pC+K/sYLEO0KPQ9FD7Vfyk9lBjI/yQW+LsO8tPm2UbgFZSftSS7pMEJDpfzDw5
 D5wgycasaYkKJaROVDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX50NQBMEbichN
 5oFA6nWgLYinI5CKgWDXMtytESsUBLzsx00A2DJvotW9f2nAMhni65nSs3JFAgQFBqj9p3tY68Z
 qkPWmm642YoTnreO23rDOO3u2UCEkHI=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab50b16 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240048

On 26-09-24 15:09:56, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
