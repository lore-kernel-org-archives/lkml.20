Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2969746C858
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779066; cv=none; b=NshxAaUaWeMPEP+uXaIg3dgTWdR1JRyqqEMB1MBd+vlHbkp81Kkq0JTYqNYCts9ecmbq0Tl7loz6KZAiUWPFPXP3jRokBbf2+dosMTDtghmGegG5gDii6BbE/xleP0q+Ec7BT8G7Nic+8z2nFbCaV2+w7GIsdTJ+wPyIFOYat64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779066; c=relaxed/simple;
	bh=fUDCEYxySoxCRaRhUyorwv4kDhDUQpIZplJBgorTcpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4waDU+BJKUQxw1C6oKxyr9HvgcvyylWB+D6hy78FhrSDW5Fa393aoMWv9Oub9zOnD5xzqFh54IgxG6rCM4irmVMBT422O/Mz8KSgTd7WEdfm2NiPdk15M1mMmJ6SWXTbPnlKdN30gYSrcvDbCVPyj+zjFGmZ99rsHLjbjr1nAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7vbh3pX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxg+f+Aa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7vbh3pX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxg+f+Aa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmuKc3349032
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KU6so8CejBjFsi3+BBcs4GZz
	l4XTntXNI65b62R9Ly4=; b=T7vbh3pXv/qx4qvUcQMgClITpuSSW1czzuLzhMSV
	7CJdYy46p8R6qnsxZKopWMYY6Eebs5eQpKRc3zEd0E0bIU0Eik/jAuyZshcSD4lV
	p6f6V1QZd9ZhdSQEuEqJ9Elu0kdCDIXw3iVYTdwtcgmrawHzV5+bwNHffCONwgdD
	bkKSstEvIoc7RpaSlxbicClH/gXn6xsaIDJ6npdab28qqWIjcdDt16jhbl/pbfVW
	T7TVxvQcxuq07PvhnS+bBgy3MHxbu9ClY77dETCHFBXp20UjrLf64S35EPPSXZmb
	Zomi2EYb+BOEDVhmBp9TOnTpCDkXQ1s9lLASrxHKJkTZOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0f56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:04:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93771aa0379so700123885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779062; x=1789383862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KU6so8CejBjFsi3+BBcs4GZzl4XTntXNI65b62R9Ly4=;
        b=hxg+f+AalBj0fcji+BVSUTQoXTvT34FpkAElHMUd1CEs5rK0uSrzpMHThMhO2Slcjs
         vJkXX5zZsflI7EvYbLVN9lxckL1PmYmtWq+yWVB5QHzNifvavQPRcwTlO6ZjLub0u26l
         4x9s7AxSrKj/8J9/UGPVuWOMm4yHHcD61aT84HB9RLCH+3dsIBc+HyJc3+6GkEx0ckZF
         TXxouDR9hr013Z44t9PctlSnQXjV1Jj/XK8UYmaQFQ/e0xBalg0LThUcs89guFOddoUa
         Yg3dpKsVShCUcOMb/HF+E6xjsobmfFQKB9rqdcmY1KBqlGNXBB6NxnxbYEY7Cj0otG3Q
         WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779062; x=1789383862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU6so8CejBjFsi3+BBcs4GZzl4XTntXNI65b62R9Ly4=;
        b=qM6MxRUka8TEbeahoIW9cDnNqlhSK4UWy9juFIjC3nr4qWwAk/gpv5qb/Xosic6tpZ
         TLHH1Gtd6miajM9SEKbhAfsBEmUzTcv/vOo2vKoDyRM3cBfOF7fU2180fJUEtFgOUWFc
         PPqRtNKCpJ/Jl5Mb63kebRVH6irCyVY6uGAV1A6ZaWgXW1IKfseHt5gABvgrszwJPUgu
         CO7qPzhTpKDMvISLABCmLf2aGdnqTCYLV9xM5n+axrCrgCSI3qWK4UDv+I8XlTlAX9D0
         rRlW/52n3HaQ8EOnDuWrWJ7PDfE2ApRP7TjQtw4rIskTG9bQNvUGosrVRNUDooWQ+ZUb
         yOPA==
X-Forwarded-Encrypted: i=1; AKwUvBzKi9sVmx7QakRxLp1Djnz0ZX6qLusFzKk1JK/u2GTJcsq6VYIfRMRaaHO9zsleWzUnckN/OOm/6DA/WQM=@vger.kernel.org
X-Gm-Message-State: AFuF++mepRjXiLwzC8BqfGS4ndti+k+iNPuT3nxwb/1KQtlt13qEaQAS
	nalyoGKpdnu/nl0PUpnkJl6X574L9kDCTxuDv+S3yKgw4he2fjKuPv5GrWdo1Lwc3l0AV7EsFMI
	SzIacby88mIQ7GffmQ2WsU71hFMMG3KkcgXYxf5yls8oG7U1gxSlH3bVqis8We9NauBg=
X-Gm-Gg: AYBFou1g2+zY3D8haT12KfmwwAR8WjFsTojHQHOoaGwkjsSmuwQ9O3vaE5TrnVWkk7v
	cHTm3jvD/OcB7qUwSoGB8yEU4fpk+xp9K0BTJOabFUK7PXfYtlCZ9MgVFlq4xSjlviiDMyBPJf9
	xkJ+OcygCpjlQot5HeE4zm+TddzenUNgezps8UTFwkzXItp0LJsLvVXp73bC1H3w5o2Ti4NJhbJ
	ZPWa6CSxBxulYnQNTrWEcWKOcw4n1NTD+egsPLl+dXW6Gwleo37IXgpoU/jBGb9sxsy4qmRXRke
	NHIt3hNTiUcH+hiDPsXNOybeC6DATUunT2nEjRX35X2FYVnAiweq1ZIJPkP1mpYDaqoTUyMp7R6
	w9FxnHj1yTAJj
X-Received: by 2002:a05:620a:2855:b0:936:eb7f:d2c7 with SMTP id af79cd13be357-93980400609mr2799092785a.27.1788779062269;
        Mon, 07 Sep 2026 04:04:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:936:eb7f:d2c7 with SMTP id af79cd13be357-93980400609mr2799080585a.27.1788779061607;
        Mon, 07 Sep 2026 04:04:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm27092081f8f.32.2026.09.07.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:04:20 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:04:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] interconnect: qcom: use 64-bit SMD RPM bus votes
Message-ID: <fwhzhkt76zmpdbaehbiihulokhllhvb2zfrajmd4ovme6zqm22@ujsrm6yvhxsv>
References: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e9a37 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zrAAXKNDYC0mzo9CIGYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7Uycn0kYKGtosKHFoirkkpyybUAcuPoF
X-Proofpoint-ORIG-GUID: 7Uycn0kYKGtosKHFoirkkpyybUAcuPoF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX5n4Q7j3vWPXK
 WulVucu8wAvH4HpiqUDAl7vo980YkpH3CxYYrfncGZQaxnbdpKl8LUtovdueCTDSk1UboCLp85d
 M+G3LlLnRGRJLuSz82TXtYDIfCRLA/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX9Ph+XN4ENlbO
 EgwP4GFKxcbWtBCtW1a0uaSi3LAKSPZ4Cd9jMB9VgwGopeMuKkM3B+0l22tCEktugtUA1+y4P9F
 6bd8f8KRT7e1x1Aaxod45Q+l1FVcchztmiV6MtEkMn57WvLrlbHqkqeqDcP6MxrdAQVDfqZdh8B
 sm8ax6N/2Qq08d0FmUX/zvwD6PKxPFKCotAycQUblqZi9xWmWsIURtyEbONM0PW65Hv7sGN+o/v
 teQBDcQ/hvE218nv27kB62fZpcw/9fveXzFyjt6s8h21RQdqbbaIalDeZNRliMgGJtN/sVg9xz2
 Zj1rwLjwU9xTWg0BJq/Jx21KsxQ/KbbB3csgy3Aho0BVDkqXFY/AvIKxvx5lPmnWN4pFdXGvv3T
 qrpN4kzRBJXH3aB7d4bqt+eRqn9qti9+ZPvMCbtVavYtEcydN4P/GY9p3+iYqH4W5qzDQcaVjha
 u0Lf2xJdvY1B1Rt10gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070121

On 26-09-04 13:55:37, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SMD RPM bus bandwidth requests carry a 64-bit bandwidth value.
> The interconnect proxy declared the KVP payload as u32, truncating
> votes above 4 GiB/s and advertising the wrong payload size to RPM.
> 
> Use a little-endian 64-bit payload and accept a u64 value in the proxy
> API. This has always been the right behavior, even on msm-3.10 and
> 32-bit SoCs.
> 
> Fixes: be06f8e7425d ("interconnect: qcom: Add interconnect RPM over SMD driver")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
