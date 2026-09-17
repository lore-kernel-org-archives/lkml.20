Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E394AFE12
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638613; cv=none; b=plDcu9qnwWTa555XtaXqgBqy8K8FfB4sgGmqSNjMba/E5XDLHO76NDZyeiBI/SUtinO802rOeynQETG5d90OwPVTyU3PNzHOLNZKAvm+Up7OdBg7pk62PhwRBIEkxISnJtsXFsz/I9gB8tzNCFV2z1GscR9232YjSMH79EzZk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638613; c=relaxed/simple;
	bh=VKtvCqmaFwakDh3dPdx59QHwtYLAF0CeW9u+HP99fIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxKBilWutSYsR+KpJONyxeb+k5j8aEPG3UMZ90xqPYvzzNn8r25anaMI607vz40jx4hXLcgx86Q+MWZz21nWPgWQayKHjjCgzH9fR8qsMlsipZCJ/bqG+XhNxM1grk9RP6GeUeYpZWsdeX69QwXewv6mpgYSU+styl0CWsyQN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWNFDDrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Af2urDWa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWNFDDrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Af2urDWa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZYNX576941
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=; b=ZWNFDDrLmTQxDCuQ
	HFDQlHMYRRCo+rH2wLP6KJcXoMJ8HI+z1pxwgOXSBrbhfMiC7OjhqJkMx4i5kIJP
	AwJaTN2D6t3ambX6BPl/8pR9v0pmvtwDa32vIbW1mrUzIMb5qrXaO6bbugZMRZsn
	+VXJ8X3YFMjpnizlN8t8hGnwKJ+yYpFGJgBL5AyJb27KW9XgaAuG6d53uPGvPzMm
	lqMNnSS1Ik1zfwape1U3jAVGp4Gn7ZESpuKhHd+6Jw0cQVesTbS5nyjtU8AXCryu
	XaWpXmwJh3S0yS5zirrCu8D30NDPMcpnQsqfnJv+EYJvZSdtlmB0I5n43w71rZwb
	eeIIvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw19ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so111592585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638587; x=1790243387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=;
        b=Af2urDWaIm9Qvt7MYKgxXX4jE/Fn2BjvAk4rarzLePn/2MiX5bDV2BO7pRIumxOQ1P
         WAz0D5RGNo77j10GQx6Ynyn7vyzvFFrBsk4QN4u2MKxmcMDv5wFZN2kvmeoRgZfQmV45
         8SjHlVDVRJzGFT+BsfwkWreP0rwZW9/IgPEhSQCuIgjWL5+vO9YVlk+fgpj+GQFuqiWw
         BAOh3Qkv3fLHDZ4HEQpGQ6cZhQ5cBHJz/wWviTNn3QRL21wGH6Zx95kIadYz1PiWmqaC
         Hs6tIbuo16wckmnZuMbgyW6RcEGu8fBCwBrFK6HtjsMdVN7+PNy9QYypxT+Csmgw8Dyi
         EmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638587; x=1790243387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXfjpYF/qRx5R7vw/ngOXgeAsq7XaRfsZ2rZhaAn2Fo=;
        b=qiALrYLqzxju9yrb6uDhEFvTz+kCqcdnluN/WNm/QroO7F6Zndgf5n7+nvP/E8ZQr9
         c9kAx5o0Cw3hV3VbOHhyGCeyX6QQeQhQantUSdRgCvq1NZAkYlV+xwLeScyVqNMv56+i
         j78Lci8jFDsUh4wkpQIo0UWVuQjsGVvJatwSTcsOVYOtsfqWd7KmjNblUTXYF8ZFZ2qh
         8M2hXOX/6+muKBwS2lvYuV8UVcCALkkQA/hGTMJ6cXbx6GyItRn5WZLWBdU8lTy4cqhj
         bXXAKTEkRzSeIUTSB7E6qM4s0jKu7+qsUctzPASQXZDpgUXTZ8Jqlbw+ZSVn8nlA9ESr
         v9jA==
X-Forwarded-Encrypted: i=1; AKwUvBxHKG+u0xLJIfJah1a7wGTR2nmoWGO05QmsFa1zlGXM91/XKkjC1GKsrR6bsvu42UHSUHvIsiiCiISYjSU=@vger.kernel.org
X-Gm-Message-State: AFuF++lkYgGu8krqNjz09n0ZyHz1LK/eJxZlSrEBFoFKsd2WMXy0kxXS
	BXtMSenctHguursorLBMWIP1arxyB3HjWVh1zUhgPRqhgxZbMqzn2j7vKH/g8MMRIyi1fGAX9+U
	Xhebtsur4MR63+yLYUiXq5CyJsNk5HSYRo4ZnslKgaYgImftoO3zOiWPUfWk+JMPwz2g=
X-Gm-Gg: AYBFou3+XT+lEZV80FFaOcLVb9K+WjH7wZhoSm1OUFqhDyuEnMlGniS9GQpi69t6Waz
	f990YdCT+ueKoKhNCrYDd5BXmPCkexVeT1cP2+DKM+0nYtjXwjOQMJpHGORdC/HHLIJCSi3+HH5
	bhlPiYLlXmHgUj9zwe+vEuRKsNu1rMvy4o5c6o51O8UodTUzpzYUWjDmu8G6BY/woRig58RFmFN
	pWs84Rmgr50y4+iOzXO+k4hUp9UnSS0E6AYWD+guF0+Fxr9uRj3lQraepE1NcSiv7ALJjIpYThD
	WqGrdbR0bALgC39aFLXnOb950e0N+ZiDN4zEq2g9WnZ5LAt1L6dWz2yIafyz3RRJeAk9Rfp9mY7
	w6dFH5JGJ92nsCTPORW1lvGJf68M=
X-Received: by 2002:a05:620a:bd3:b0:939:6de6:9516 with SMTP id af79cd13be357-93bb79367b2mr1090262485a.45.1789638587378;
        Thu, 17 Sep 2026 02:49:47 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:939:6de6:9516 with SMTP id af79cd13be357-93bb79367b2mr1090251685a.45.1789638584950;
        Thu, 17 Sep 2026 02:49:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm15736333f8f.1.2026.09.17.02.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:49:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, andersson@kernel.org, brgl@kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
Date: Thu, 17 Sep 2026 11:49:40 +0200
Message-ID: <178963857686.7532.12774109057722051769.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DmCAYT5RvfJe7Oc2MuBLwQoS1ois5ytd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXzqMyG7ik0qsp
 ZcE8cROLqfhhLw7/jCDiHW6R4kSEPi4C4QDADC9efQIk1VGr0Hxfk0091Fg/U6QLpNJVZY7clPw
 JN1yNRK9dldYj0f4jEI/Q9N63/M9huTb8+Jp57BSu96Rx7i5esCtwN0CYn+0jLXwM6uTW2UKBRr
 LY3VfJ39QYjdUQW+ohOcVGhp7yMD/kBvOo7bw46B0qDBdZ28hsHgH2QEt9+59wjNjOzG2BFBXmO
 /Q7h4rI4MYBDEn+1PvcMWrQkjbKPI8Fsw8YIZ9XzaJQbBO5QDM9hH9pDU5avKLzAx/WJDL1jfWR
 4No/MYCeRy+gp8MnzFxWKnF+LMBMNwLfv6YsObrK8Mump/8SQQgeWkSQuAZMGw7GV//zWTyiPrD
 aE/2jQcriZBubeVDloiWVG7mDUJPSEOI2rTu4vfSKivIE+LXPLDVqnP9DyLSeXE+LlMT7L9eoCJ
 CW4Awtydk2jH3hbJW3g==
X-Proofpoint-GUID: DmCAYT5RvfJe7Oc2MuBLwQoS1ois5ytd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX7lvNaeHMEXJf
 RTQkd4k3JeOlliZGwQCWX5cFCprz+EXjoC//+Izf7zQtZ3ecCOIKX8Q0cNTl2al7CNHFWC33Z+k
 hQvmtsiqpY0HFxsK6r6Dg/6prixAxs8=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabb7c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UQ-mpCxKgesnfiZAKPwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170135


On Wed, 16 Sep 2026 16:57:20 +0800, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: nord: fix GPIO interrupt target width
      https://git.kernel.org/brgl/c/68ab4a6a84b92f52650508acb60317eb76454250

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
