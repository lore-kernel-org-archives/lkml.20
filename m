Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983A346E019
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583239; cv=none; b=DBkWdOmH9SPC5EnCwdCi0fGij1lU3qOoaIXR8jlt5jiZusWSnUkB0qCKUPBVWkPXQNsXs/66MEXqc91CTCachUbFBsw8EJpwmxOZC/RbOq6EsfWogB6JIhom1W9mpjbnJytVI+Ep72Vsiyg7SeYpERDJw/e8VbYktN5hb+XZAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583239; c=relaxed/simple;
	bh=fUtDTQF5AlpGxLechFVY0Zh74+1W8n9TdovwRc6CYOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCm74kLBSBweUa6XzUUV2pJGS7vCBsZnPY6cglVXiH3lfSqwxUyeKEms32VP4qy3iaPobXEiWp9yR7PK1xtUh6p7WGzfWI7kEGD//X8EaNVHzPtGsIAemUcBSD/gkQntowIXjyO77jgkpmxi5PgKcJlkk7/+ePYXrSGN7VyrNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFmbm4wJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OahM3W4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFmbm4wJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OahM3W4l"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xqQH361392
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=; b=MFmbm4wJMmN0AL5c
	8uAQtdRPzfofdZaSK/kWkW79c5efOjMVP3sGKf6mTYTOs55OzQ+5RrGLNlUF9rv5
	p772rIht92eU9OF05waMVmIoD+GYPTjX34NuKOXlqlczpwB18eh/uktE51QGezm6
	ZW/+WbtEKnnM3+bItOLaYayW/1RA8IEg0xYwzkBcayTxIWUUDm2tRqOtWee9yusF
	4YKs5cP1Vnvi35RA0jeKk/MNI0fLfbldexrjbCcEVKBD/+IX0Ve9ftfHo0LfV7xA
	tUM7wBZH+r976wPvtUVgPulAoxdqhuwsMpxqx8Oh714xHn3Y4CijMxQ4Lw8LcYLZ
	4gNyQQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49fwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:13:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so3344966b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583237; x=1791188037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=;
        b=OahM3W4ll9QJm6ZPaBVTXE0y0jr06S6YhKJ6Y8URnPNHqBOg6dMZZPyU32PBWGwbFT
         RFtwpmDVhdgfJGNBNu7GObNgsFTdvgAUzzMuCPjtxhcTLEkOPBq6s+ZoC4xcGIbyAX3h
         TOEYqsUH509/MfAQUK6DNCL6RNDtz4Dln5uqr29arkvLYilJRHoQC1HZn8L0PpcAqq49
         DHzK4GmhMukLiYIXwMIu8/kqWnCURVDP/DuAEMVXWW6x9rFq2ZqPoeAL25vRyM6jV6sA
         ouYQwjqCWIVbiKjZBhDUXcwvkADaf+AZF4+Qqxqk9vjORqwXtaOqXtMM0DDLZ1KA/gon
         gW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583237; x=1791188037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=;
        b=VXRIyalXhlchwyDpXxtZhT4K30YAsYMVRtlIXrUuH8yWdlA3OTG0NF4ew+k+5NY4h5
         xK2LAb6zCVJJ5eLZabg3s2i1tZxyhiJXjhpFYSXoAcAFWrGJlriHe9EkBi9wGglCFCpp
         CiJw0yG2zwxnZ+lKX7uHoHkEC6xFatI0KrxM6EbJ+zAQTXm/aDxVnyEFHR7GlZQUeRIw
         zqRfY6ytLAQoBd/kpsXM5Id1wfFI+kgaYAXDYOHx7bDa2nllub4pbfJFnezp7IA17xEY
         dmfUc81nLw0mGDg5bULrVCqAm4hyvTIxPfmP+ORZ1UYMcizest7aGeXAaSF4sDQEot/4
         4HEw==
X-Forwarded-Encrypted: i=1; AKwUvBznZJne/kr2sthHyyP39qGxD+ZbusZnT/lW0+oDIjnFZY3aUeFpxZ/wf3n6sJQf1g8Uem4Rnrd82KrOPDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaZ9WyqACGE7zLU+dQvqkCDtf/Bleg/piIcWUXx3cOnDJL2XmR
	NOj0Ks0bEDUJgLhmpS2MPtuJfNSGudgnXTMfmyCEdW2P0N4MlZTdcgaeckVohTEVy5Mbx5sx+Gn
	nP/2zCWs7ZGpTFuk1K/XHNGZHmPwXZ4xYEXVRyypETYWrqNFyBQ0W13pm7pfFKHWuo9Q=
X-Gm-Gg: AYBFou1L5LlP1t/MgmP9oZWXdw17Qxwo25olI/F8Maump1FPD7TDZ/+T7gXTpYZfA2w
	xHQoYQSxBx1H+qgwwrlc8G22LWgg9mBqdKjOFVcMw0QYReLCL6pJ8ejn79KVkpzU5jidBte/FEX
	qXFp8yJO30GSlNx6nVT9sHrRGQ2PvJESV8/j+cZNWOwTnxEiiQsHk4dZZw0nkwlfg7HMsUoS/w8
	YG0KDKnSqL6IT+3Qt53ZsHU7X3Ylo58/RXn4x4+7r4fbW9blf4wzDxeHJ2yExPubRxqAPkeYY9f
	qs3xT65GZLR1OJysjfvQFtgRdQEcVqLLfKmE0y6J3kESuodmCTsEh1yTiI7TaHFYMovSFtIxDyQ
	vh7MiLN6p3scgFuOTFf6e7buLgUKE/A==
X-Received: by 2002:a05:6a00:908c:b0:87e:35ae:783 with SMTP id d2e1a72fcca58-87e9c53ef9fmr10079876b3a.51.1790583237209;
        Mon, 28 Sep 2026 01:13:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:908c:b0:87e:35ae:783 with SMTP id d2e1a72fcca58-87e9c53ef9fmr10079859b3a.51.1790583236769;
        Mon, 28 Sep 2026 01:13:56 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb385ed8sm3799547b3a.45.2026.09.28.01.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:13:56 -0700 (PDT)
Message-ID: <553b2e77-d646-423a-9a80-4d0ae539b919@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 13:43:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MBtAoRbMQV2eru0jXYRLZ4lkALupJfQS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX+7QRmwNRWWq4
 ZxMfESeNUcb+jI1mumyI4dzxK2BRIFqltSFxUQD4e4xQ8pc2vrvYJDt9J3t4R898dSRPuMOaJSD
 6k7M6AZyVfzcSYAFBpuSFPLtWxhKEk2HAoNCb2BLyKvmQQXtBCBQbGfirx631OXDo5oevCHaOjH
 2K8cDOH9aqqWajj+G2rfiLi09FIr4/8Y20xpPPdbYDGWSdsr23YDolrpwYkqEPDvCmBoVXBegjG
 nzvypZc6eOqftbTEm8N5riz4BmblH//j4QbNwt/C86B4I2lZAPIOrJ9n3Vl93BeWNh5/p1ihl1G
 Cr8WgBCTUfPHcAW3Zc+6kLmIToBFDENv0PZltBQnbCJou+5bViQrqd5j9fw04r5o/1FU8FaUsvS
 11kItP+G65U28c3obljaohXF91clln3l8CkkuT49Ib8MY27otQDQuWBrQN9X14++8wTlobV3VLV
 4M9HKSd+LyNJ9K1qiOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX78PwPhaFcfFa
 qBXK4k8/xh3FZ90HI3ZTlV981NMAVxHB8OotMpeIvUCgJQeUjDdVEavXFfhdJyj3Hqp9UO8i8BS
 GhoLr1fABaJkmQKnUoZKUQOWpArLM8E=
X-Proofpoint-ORIG-GUID: MBtAoRbMQV2eru0jXYRLZ4lkALupJfQS
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba21c5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZAC9QuG5zvkjJuggSecA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032



On 9/27/2026 12:07 AM, Taniya Das wrote:
> Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
> AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
> CPHY RX rates.
> 
> CSID and IFE Lite use the CPHY RX rates, so share that table rather
> than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
> rate.
> 
> Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-nord.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
