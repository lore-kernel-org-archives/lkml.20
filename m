Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D727AC57
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639513; cv=none; b=qjcYFzWMG/GsCfkQ8kktRoFwqHSUknM/jPP7F280gSKKovDfp1WY2qSxTQrXDq9S2lkrq57RKEqd+NqYcnQSt8GpHsouXOjmA4Z2ExF2wzjYC2Zg98YUiFpVu087QSw5fe0jezkYTpmHa/gu9WpRM6ALurZHwDiwJ1/CJqv6Ujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639513; c=relaxed/simple;
	bh=+/FOiGAdA0/Ch5DAKflPF64XRT4LzaHU3EryfBCxt7c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hAbdZZcW84OO8YnH+Cy283ROR6W63P41cwFYZmDcgQvEaFubRs5wkCYUMHhv7dlFqKony03zJS+IrgmqHyDBrZC8qhHwRM3ym/hNJRpt7c68+/Vh8bxCA6/b4RXO6S/3m5BYNVHVAMThwC1ropeu7DDp19D3im9/NPeGaUz/Cos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O56HNSyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNznDqUK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O56HNSyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNznDqUK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUiBG1020548
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kXeit6qoeff5Pm79BGKCnh
	U5l8BDS7L4aPTjGtWaCVM=; b=O56HNSyEDVnUnwvKi5erEg9n+U/2ywhqZgCjuO
	FcOfBL7a3zbeEdTgR+78ipRciP+pEpJ5UvSgAo6OP+ucMzVjJXiTnZaKsLs45n81
	LCXGwSdiw1F4NZUkjZSZr/1RuH1FgZ611yWJqqS66C/dGp2NmZUUQi/K7Xonz1W6
	O8HQJoKQyRWq++LLQlaSGoO+nKU5RnNJffGlcHgilp9K9mZqY05S2OyVPaQG7Zwv
	zR9b32nLFyLBqkv7O4tGk98JVw0gcWaNnH8a3W4JEfIMIii51HmTQg9aUk/ivN+X
	h/INrmSh2IpI8NtgeoUOLRi9YjUQOw9xUIDgyYbQjJ50Nvig==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6983f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso934135eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639510; x=1792244310; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kXeit6qoeff5Pm79BGKCnhU5l8BDS7L4aPTjGtWaCVM=;
        b=HNznDqUK9Cv3wCuYKUWdPGV0gPXn3kBma5ZAiW6GNtit+Uwr9Yc5AkfaZyf8wgMtXi
         WgBR2zPT1PAOq0+kDo5FsIGIQwH6E0KKCyXBLreaTTMFvjzTX/eyGHZBgTS9UKDxwQHn
         boFZ9g5KuFhrbIiCDCJ38Mb5eF+oJpbqxS3vH6pQISuZTtJrxWso6OHUI8y20nDemBdR
         Sd3cm22viXSUc7QEHMVB1gSXZe0w+sK6N8PZpa2R8vfFhxw+w/US0immW/haLx90DiOv
         5ufgMAx6R/u5Li4RN+xii0YzT7v8kdRbTjzvAJM0ZyEe5cqCCQPqJuQ+FtK8E6hp6it2
         KnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639510; x=1792244310;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kXeit6qoeff5Pm79BGKCnhU5l8BDS7L4aPTjGtWaCVM=;
        b=ub1uJDCbGSOmCtPuPl27/nBdZVITcI3VxTSbUztTIBnk9gvL78zu6dFMEAA0DWOT4R
         GlpNWuYdp1hqRdKLt5owTnnjjvnB+S6AYpYltX6JDVgVeCOdL9gwpR/uPd6g0RmGT2Wp
         YjMXLKtHzjcUX61dY2e2MMGMQzGyDoc8lJbl9934Y+9MI+l5C3hS3+Pepx6FkLxtbUJK
         fOgIkblcAusI8IwiUrk8vsHCUmflcrwyu3SVy6R0T6eczPCUDnNyZfMKbaMyb6mb8Aur
         fIk3B0bJnzndCY8cb7mF+N9cRtuMWSXuHGPdYabboAxuJWePhRoOESZjKVLvdLi/lg4j
         7plg==
X-Forwarded-Encrypted: i=1; AKwUvBxzOLQwf0YN86+PGoIs6cFoscwEmCkUM/N8HzXpntM5FE+utbD390BXxk7HIOkqt6N/AmOnNa8aqHGRHuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3hv0eYt2Ho8iKhjnUVJJQgHygRUeeA5R/RIpH8JnjewgqTkxC
	NFw4SoO6pbltn1kSpr3XXjX5Kbc0WGIcV1fFlYAp7DOmufB7/jF00NluI5/UBng1rwLwC5TidBs
	6hYnqJvSTgBz8wzaeimKNgjHtYMrVeYOWe9OnrEX7iLw9L3ufLBmzaAbMRbC2O1zkIbY=
X-Gm-Gg: AYBFou2ygBFyisR9mqclfU/lqSlMImytS5Y8ZtGSbaazs0/erKO4Bzgm5aRlqNOZwSs
	kQ/QrP+EM73hESeuiXhtjshbWZcTHDsLzRz515t5+MGM20TFo924mXLjhi0tJra3+O3HwwYhSJS
	JRbMrDbPNjTZY78utZYUh/An377LCxgUhIWBrhWZPLL04oIfz1XnhDryG31TZ/uCbLOmBO90j1M
	WUhE/3gG8T5PLu7XkebkHSxZIQECuaEc2pFlgUknjlBn8udPSf8Qef1BmvElE52JY8oqXVIDGCV
	p7KVH7TCVZizRwf30IeyEzdU3mxSRSEpShbMJjogeYnuXXatbcJ+wHBmgxps65Jo2APJQOrqPcN
	iXcWmA0bOCHwLwu6sU5JFBeIjuQ==
X-Received: by 2002:a05:7301:1442:b0:351:7ebf:210b with SMTP id 5a478bee46e88-3537e08b08bmr5879777eec.17.1791639509803;
        Sat, 10 Oct 2026 06:38:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1442:b0:351:7ebf:210b with SMTP id 5a478bee46e88-3537e08b08bmr5879745eec.17.1791639509052;
        Sat, 10 Oct 2026 06:38:29 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:28 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm/dpu: fix pipe ordering for source-split planes
Date: Sat, 10 Oct 2026 19:08:20 +0530
Message-Id: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMw/ymoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3YLMgtT4/KKU1CJdC/NEC2NzQ/PEZJNkJaCGgqLUtMwKsGHRsbW
 1APYTD25cAAAA
X-Change-ID: 20261009-pipe_order-87a83717ac4c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=1510;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=+/FOiGAdA0/Ch5DAKflPF64XRT4LzaHU3EryfBCxt7c=;
 b=eAovf+M6Z/mGAQY0MPkZVpqdKdse630wZTZRfk/l2ybq5iki0zN4kJaWAgzhbiY34bix8HspX
 7NfzCPS73l0CANTCF9V02OpH5SqIt5OmZP8sFY4dREx8f/G8Et+Mf2M
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: ftI0HLYAdwP1t8fX84OtRc2oGzrqgLlL
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6aca3fd7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=56ZRaVNax5G-77lkfSYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX/6vlcj4edaMW
 pnGU/GlTeRiIHfLhSDeypIbGZO5CtQgODQRfNWf3WMJYQJ4U56VDkUgk3ZV2a4cBLeXNN5DXMgA
 WVePNvt+P5rPV4Xhjyr7SGy/mm6hRpnGkx5pVOGwa7KEWqcf9jrJucBSs2gokJktk8FSbzWNhmb
 +Mmx93wiqfNZeuUDxQpxXUGRbTyKVdvP8YG1/53NkLwV9qgaqjP9Jf3SEiRgQFA7woq/EU7RQv6
 m1ealtVphktG6DIEM1nDQAPYixJm18hviGq+qBTqTDreRjTWsrZh2v8BayCMBHjveyiYQL/u7wE
 8AwkuXEV7wY8RTGzp9/L7Ca2v163+30w9iMz0+fOf80t0Ek3IZf9i/aY5jmjgxn9a52SK+HgfjG
 9hA6TX0FQf1SXintZHZt/rb2V+rSO3nbP5Od5m44kJYFHYB71UDBLcCQJ7E81af4AUcV9XpeWZZ
 DfW90tojkSWLP+puqZQ==
X-Proofpoint-ORIG-GUID: ftI0HLYAdwP1t8fX84OtRc2oGzrqgLlL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX0vDDp6tOYra9
 0oCtE2hNoL+1YY9Pnq+vOb6DXm29+tXADYlPk/FBJs6POlulCIrj1j4Vz2bE9vDVVTEacRYXiQ7
 ahXpTvd4bruB+uS+v6Bc5e7Ivh8r7lA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100054

Virtual planes can use two SSPPs when a plane exceeds the single-pipe
width or clock limit and parallel multirect cannot be used. The pair
can contain different SSPP types, depending on resource availability.

This series handles source split ordering for those pairs:

1. Keep the higher priority SSPP on the left before DPU 5.0.
2. Add the SRC_SPLIT_ORDER operation for DPU 5.0 through 12.x.
3. Program the order from the destination X positions, clearing the bit
   for the left source and sources without a sibling.
4. Add the operation for the DPU 13.x SSPP rectangle banks.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Mahadevan P (4):
      drm/msm/dpu: keep SSPP priority order for split planes on DPU < 5.0
      drm/msm/dpu: add SSPP op to program the source split order
      drm/msm/dpu: program the source split order for split planes
      drm/msm/dpu: add source split order op for DPU 13.x

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c        | 19 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     | 35 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h     | 11 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 14 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c       |  4 +++
 5 files changed, 83 insertions(+)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-pipe_order-87a83717ac4c

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

