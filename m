Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55B4052C2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108309; cv=none; b=iBrxasv73HJqjUTO/BBBUXNQOn5r4d2kuK+VYGnxAuXliKysocazAN+4yLtBzIhLIlStEKHG2y5nfojxhrdJlKODeuEpJRacHhyZTshO4CGBhJ6pt2GRRQVkZVoLESe/qQQGPZJJCiDadFwLCnn/WdfC8FHgzCkD3z4l4dhSITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108309; c=relaxed/simple;
	bh=841d5FYBA+uiiw5q64ZndC+xRGtfySpWCw6HET1TXoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqKTNMgLDaeJyD7Xx5R2LsvTnnhy5w1xTNo9JxyymEGk5xKTPkfr0q8sLgHljymcgPNrZ5hHgMXesd9xZBbKsCCjwM0DiXAV1rKCVQmx6ZgCQpDjfiQej7owNaSpo0u2hsoiH76nE9GxjJDVny7LWjdxJ75w5hB3YQydiehBOB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGxcgHTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtWMt4kJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGxcgHTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtWMt4kJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vSQF2422310
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iJNryjpmXiJCbdcmZCcawGEz
	28hmwGABzhorM5Josc0=; b=pGxcgHToG6N59Ff8MHXwVZgysvYdRwdPBUdX1nWo
	4s9Ws6G78hRFJ3xko66Guf4BN+AcZAUHu90U3ciS9P4EXTHZpa958ztGHRe2MB0s
	J41WZaHJ+m+Cwl0mQO2ByNF/aZmroMOvGlSQ6UsnagAARICzfZBSEfHV7zL00qWO
	1GVrLmVtFPjEfu2ULTJ5cXssUm9UFmy5XIvQTIwGgcTO5NXHUDdw9py7mg+ZzajV
	zBm28iSBySCAsYn+cBcs5ZteCTY4k/kUtFA+a20oBIPbiAztEW+SWSlzrHWiv6aX
	FlNkwDnkpKsqHu/5XyfUgZadV/qzZMfRC+YEcNEyqKA63w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729h6d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:31:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso845674a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789108304; x=1789713104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iJNryjpmXiJCbdcmZCcawGEz28hmwGABzhorM5Josc0=;
        b=UtWMt4kJ22n6cUKBatcXL9KxtnRWLJq3FA6msJgtzoluiPhrNPnPkgaQ3znG7dYrRY
         Ufk2ub3ix9NN2r/s0PACA/86Pkl62bmOlpdzhM3Gk8Hqm9EthqW/yq1/7QZCy2MkmpLq
         GlrR+lZWm8zcIkSLkzbcayGhsNfiyzCfks5u7y8nfRyQowCbypMuqU50ZNDhKLMqebZC
         0C+uR2g35vUlnjYZQWkrkduJZUwGPy2l4UeqXmsv6ltm/ttmW7Nrjuk/djTmZIqX61hx
         6wqnAjqQTMIW8xw7vE+4hvHL7oQbRWEHsIZXPviU4xSJnn0TmujMnWlezSE3ZBvw6Rv/
         nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108304; x=1789713104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJNryjpmXiJCbdcmZCcawGEz28hmwGABzhorM5Josc0=;
        b=ng7Rx94kgLlYKfBaB1FxF1IvltnYWPYDaEj2oN15d7OcvZJ8hKkzm3VI1PAytybBGa
         VgMXUU2oj2fIvas0B0x4W4gHVwnNWH0hP5NHWxmiXn6UckRXwXn22mpI4R2vLjRhQ6fE
         PpFQcgwcu4cg82dcpf35zH+g2bOnH+nF4r7T7ei2us3zNWA3B7LFqNZ9FptaHbBDdmVV
         DZx7pLPje0OZs5oB4DaEp7jXuDeh0FvKhdALGPE0+lT229XjyTli4t9JNxieLvtzWnIL
         bgiwnR2KuyDTaov8Jr3nPt5yyZ3i3RUmtLA/22m5QhhEtdVX63z6B5DI6RVJEiJv7eJh
         hVtg==
X-Forwarded-Encrypted: i=1; AKwUvBzhh+QoZL64HlAwzmKhpPeZL90qYEG4+zrkCdqEaFmPtzg5RQa4jmY7xj8B9C/vlnas4wu4RXVucj+V2as=@vger.kernel.org
X-Gm-Message-State: AFuF++mAdDHhQHZaMO0qvmW9FkG+Sq0vLXGz2LIUjr2c1tmHjkfMm2jS
	6Bqtnk6yPbTZKwrEbrp58vLelpcB4AK40cM/UCRN8Mpc44D56XC599G05jBu5yb5gpBtymnfam2
	n4NbmbA7WZLedX+jscDgk63HYVDgt7O/7+9+DFp/HUgn/OOTiJXITb30Vi7j/99T/yWI=
X-Gm-Gg: AYBFou12V+4pYxRAuLWb+qQ1THZg/TKsLL3GkZWbIpkH4GvdGAlsqgTqfnrtvSXEv++
	UNGViPbL3FYZDdH6SBqrKL7u0XtcB8ov48LZvHJF1lBNaXYQWXhkht2+egxq6tf8Awyov9VnqQv
	2SfrsVo2bvhgL7I2Xn2oVD79L/1JZEiOetNZtzvwNs9LjMGBgHNnPAvj6osqqIBrh7oAMLKSi14
	GtFiLms7MJ/YJ8fO3OHRVmGse2/dz/SSjmXWB6xNKq/f+nOipPsU/l9N2PEWnTTx48IFFYha9UC
	wGL+G3MROuea6cQj24zm09/LNOx2vJ2uTELMxR4k5Z3M3tMagE5+JWDXtI6C0TKr7veXsCA5mR3
	8aajEX+J+PambgftpQPYMzWQiDMsI/j2B3HLPdTzjBXk=
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4440599a91.24.1789108303993;
        Thu, 10 Sep 2026 23:31:43 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4440522a91.24.1789108303439;
        Thu, 10 Sep 2026 23:31:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm6290797c88.12.2026.09.10.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:31:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:31:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
Message-ID: <aqOgSe_Q4YWBLnBJ@QCOM-aGQu4IUr3Y>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4OSBTYWx0ZWRfXyj5cX5DDaqf/
 UfzjpPXV84ROj7kgJk3VW731vdP3035NleOOeV0UGlPF3cBfXaqZjMPFZdwniWJTGLr93aCRz3n
 A1wIAQKHNmlsnbV1x0Rc9NGyAKsgFd8=
X-Proofpoint-GUID: uLEKMT0FDjID1z9jfWdhucNpey14i7GA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4OSBTYWx0ZWRfX9zYVNXSQOGYc
 xjH+PM/uiIRP8FA/hIpPS+0/YxfvcgodWkG05av/mEJsQmcK5w0YsgpQfFN/GDZxaJKVyusan3l
 LmeGmYHVOghwNt7OXfXw3KgR4G8SrCfnxyzJfXaXSJi+TCpg41dmiSxNAJQQ5JPJAsI//pVlHRp
 vS2JEkRor5aScEJNRDKNcsj27nwfkKGl9fc/WVVmKSTQOkjYvtcBt85k5fBpij1CQD+ZbMZBziz
 yCsuPrYo/wZlT5M5jGoTdCY4o5q76IAJv3KEkUdK4EdUKpsQiK7s6viN9ztoKdwhVMGyIXipJlz
 13f5//ZuYxPBIx61bLNRhORqG+hMMuvpon5ZPke7WwwD04yM4KTC1N7ynSKo7N4Zprl/1FLrVNX
 j9l1UG2lpCHNpfm7H8kEJpTfczckPZrZU6Um+bwm5DMwsI23+SEYXh5srnau3BVpw+73NcEmRS7
 5Zwhhts+BdZPzP1Yjyw==
X-Proofpoint-ORIG-GUID: uLEKMT0FDjID1z9jfWdhucNpey14i7GA
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3a050 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zkjlvTYbJJQcmHsFOKQA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110089

On Thu, Sep 10, 2026 at 06:30:43PM +0530, Anurag Pateriya wrote:
> Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
> sixteen bank regions plus the shared broadcast OR/AND pair. Add its
> compatible with a matching reg/reg-names group and raise the top level
> maxItems to eighteen.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
