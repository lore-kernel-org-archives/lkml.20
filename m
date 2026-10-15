Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CD34A8432
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048539; cv=none; b=kggZpCy11zeCJdaS3USLXT22nyvImgL+4/GnoXyY+8BqUcUSCYJWi/IqnvJjFEo147lfsmojKmS/pGLhWtvNTpm1clmvv5upjGJ7qumUc5y4e3c2yu8GfD3HO7YG0Ijeqy8+7wC8hXsfC4v7a+SlT9OOtaGYrayB23kPNmhQRUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048539; c=relaxed/simple;
	bh=2E4LX2gi3ec2r3gAAOo7B3XAFZpCRr918/PUAS/EG/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CNj2e/HGgyGnTrsZuulSv8pQf3yWqXvR+EhHwDTC9TnEsy4bTYseBbCLVhDL59hzadEQpz+Teao/XmdwYWn0YR52q0GzJuJV0Z7wT29rOaQJGrOKAEKz+m/Gz4LyfXaVyEiU9g9SEIwEyJ9+1dHEajkvEPLKJj+e0gAvwQy7zGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfjN3JfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhJgcnFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfjN3JfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhJgcnFT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xZph2738645
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPl
	OQVWcOZ8=; b=MfjN3JfK73PEQGvN5hZP1ngb5CVdSK+hayCRlmpeSsskoMgE7jp
	7OgXKQBS8jqU9hstk2wWAFEBB+uw4o4psGsW2dhQdbHi5eugcXXnMUozZtLNa28T
	Ne1FjzJ8l0UIq6CKqfIBsKXdiN5xZaAeqES7PYPsXC42kpYRm6QFhh8Moz/UAihG
	LFcj4F1mj9zfw8RE1CCmeXE65TPVKnVkXIep5T0/dzJ2q2CiGDTp6c5TaZWhz5WK
	mZBG/NNUsRiWp9KqTNdNqQeWRJktD4KXMtb+k0oW4nF9WzyYApttq0N6h+rEtcrd
	0CbQCKTIoH1l8db8+N8OcHtU9YmVCqZiEnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds8nqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4697346a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048520; x=1792653320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPlOQVWcOZ8=;
        b=bhJgcnFTdAQYDErzh8XQANklJO7ckPFDyOhhh40bp0vRYS/WpziY/Csja7fPcACVQ0
         fvkzmy9RraNdIAgig9YR3DvIpQuYcCPY404lqlM4/qT4wXRX5c68FJEJRq9w66igk5wo
         5oifWbZUc1Qx2j8nkeGVpN3xWs7RRUKml5hv7mpvuEKvFTzlL9wy1/WJOv8S1SY+j3cT
         DdM0T2REPy9zjGvcGXk5J2JmFx3ke7xVoQeRgRmuNNU4+18EBjj1fVP8swbOJSMt+N9n
         8y7uOQga/WaDM2cuLwDm3c8YTKMOfTHFJmvL1UOeYBfWh32HX/vrwwL3DMEKnOZHz3WR
         1AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048520; x=1792653320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPlOQVWcOZ8=;
        b=wZhX7HcPxDtPXvxdsFsmmbWVNc23tGjxhpkkgqWJN/PcV7VjC9N+vHFESEOmRd1Rpa
         epvGec2Bnko8Fyhltc8nZNCku+JGv40oKukZg3DgD91iUiQlY39LY7rnjvFebxD3HWv4
         aIBH4vm4CYl1fmfwtnOtARWDW2tmuq7kr/wlZv+/Qye9DcRl+FZkEw2Brtubtc11+BF4
         Njj9Ktz3MoVY2TGJRTCdBRO8v/mJKdQhSD8HvC6id91/DkqRB4oG6qJST92mSD0xOach
         Q1KwPWJdiFStO4B8H9H57ppOSdsTTItcG5UOiUj4cQWNZ1vYs47eN4xJY5VsgH6GsWWX
         Hobg==
X-Forwarded-Encrypted: i=1; AKwUvBz0X15mK2ijPkPStmNK18US/yZMEpuegL6XV1278+xDCRKqUPQaQ8tgyuySQik1frnipcTkyVIuKR/MLpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ12OWXEE50hSbXiGkVuliy2bLALE1my9bntcRj9fpwzYym5ZVs
	ZdqhsnCSMYyKpJ6NoAxtsWCS/ZIXFfXxY0ImvPr692mfok6enPuhFbX6allDzziLxlWPFzG20X5
	Pt4jKi9XxCGPv2FUuUUkIKDFpEnNBJeCEtXrK81bbYGUhT6ithWAaWmi7UMYjmyYrSVQ=
X-Gm-Gg: AYBFou1uG0QF8/EDkwMLtrJNmhZc8QQV4O/kA04aD+MKzFn4r+YuBsAHOyxEBmOiAGy
	lSzL2fDJpSQPmh9GspgXjhvbutQuRlwPSLkv/jng5Jm/V4lEQl684OCSR5t0pxoe2hnlbVEoDzn
	g/73Ta+FWGD0ib0nHZmBnTXU4DqKRtADoi7lDdNG3/UsswMq6GxvNRjtxmpHjqrvOYHM7R/5cPG
	s5Vs8jjB4/AEF46VPWhaIo23rrKEqr5mtUrDyDXXMWvv75c07EcSJokKZw3TYwCXp4yIhFwqgbx
	B5dVMXEJKFjb+U0pPQMS5LSEfqkdBcmfe0EIbl8gvJ7OV0FAiqcnkBgOr+S+NwoSMouvXKccHLX
	lrMgcp7zMoU5gTZfXh+NM/r1hb3hLwMnXAta1F/+91XEoqxuLr6STUq1iJqiOkNhGYBO0Yozf
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr9600586a91.33.1792048519894;
        Thu, 15 Oct 2026 00:15:19 -0700 (PDT)
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr9600546a91.33.1792048518648;
        Thu, 15 Oct 2026 00:15:18 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:18 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 0/4] arm64: dts: qcom: Make ADSP remote heaps no-map
Date: Thu, 15 Oct 2026 15:15:07 +0800
Message-Id: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h6A99sTpssIGYL5IxA3rMR2kwQ3bASML
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad07d8d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OBlduepgtoGKHnf9jnsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX8bBK0QUitU4Y
 ybahP7egFWuId20de2YZA47yPBRraQTScSj3uu1PzyZ+Q420UgiFlMPv+298dRf90Acfd6/SRDp
 b+tLkO5bvdqgCoQJZdbovxapJMbMLLY/00zP5yF+qnvywT6Hcl6yu6I+88Ls09gD3oxhHWFkUwe
 VtJf2bQ1oNXMfaXa+UL9A8iGvqkhddrJw0Orm/4u/ZIjIFZGgqIYQ/voQiy9jlNrce0BoxiDsCa
 ym51NNDcZNVjL8cplb49FZtzzOJPSU7Kh6EtZ8WcnpTtA0eEEoayQTefIJGBVI4agfwgNokc+4i
 TnKBMXgJXTTABger0ZwJaGl5wZwAoNNV7lFspM87CDb1nu2mU2L8ScgT3gt7dkxqTulrpxN7kty
 B1MSvE7RYcUGnuUTMNYccQ4tpgXOTHZ9Th2bAMoiU2bBeNcSYZx3iNJdUdwlFZwon9diSvC2re6
 eTYCSLb9JGEMmZnJoPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX/3bsHBCz5oLV
 Vpkf9fYRf8gEhj9FRYVQdAPQBDPL81qOme1CxypFVB8RiakbQ5mf2N6fNaUap69vCKkizWkLstE
 5eLvIqNj7uGYLRiqN7qlDTrOHzWDumo=
X-Proofpoint-GUID: h6A99sTpssIGYL5IxA3rMR2kwQ3bASML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

Several Qualcomm platforms declare the ADSP remote heap as a reusable
shared DMA pool. This allows the kernel to reuse the region for movable
allocations.

When FastRPC assigns the entire region to the DSP without first
allocating its pages from CMA, those pages remain available for HLOS
allocations despite HLOS access permissions having been revoked.
Subsequent kernel accesses can therefore cause synchronous external
aborts.

This issue has been reported on Talos during GPU stress testing and on
Kodiak during storage testing. A further report on a Kodiak-based
Motorola Edge 30 describes similar aborts during everyday use and
indicates that marking the heap no-map resolves the issue.

Following feedback on the Talos patch, this series updates the remaining
identified reusable ADSP remote heaps on Kodiak, Glymur, SM8250 and
SM8750. Each platform is handled in a separate patch to allow independent
review and backporting.

Replace reusable with no-map to prevent normal kernel allocations from
using these regions and exclude them from the kernel's standard memory
mapping. The existing allocation ranges, alignment and sizes are
unchanged.

The Talos fix was submitted separately [1]. Agatti is also excluded
because a separate fix has already been posted [2].

[1] https://lore.kernel.org/all/20261014083820.468-1-jianping.li@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261001085247.1897991-1-benjamin@wendy.sh/

Jianping Li (4):
  arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
  arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
  arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
  arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map

 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

