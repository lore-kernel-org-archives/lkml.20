Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402335;
	b=AvJrrK/zlbkG6YMeAIEPTjf7E0P5wQwWePbuivYKUrhN/GQzImh79z7P6rAhlSGHP3mh
	 2FElAjG1PDxOavFtnWI9M6iA/Wz4I3ZWXovv8bzYCq58qMCWVYjCx5BdyTPEQakLhzQQr
	 oVkv8837MBoJawhWPhqx0R1q659Cf6JqMWTPSzbwW+MD1xllFuTTiSprjE3kDckheDvaG
	 p7YKOdwuJiYN8nakxyqTb3G5KgUEYPBVIMh7UA7ONBofZPRI2h39JbhF/V1+dNSk1exOy
	 cwI2wVpThnyiBYBV2ZOaW0oQ/6vFhJgjJtQsHUbbGz9Iyb2ZFCVe4XWj54vG5DoYidw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6ovnIEyc2J8D+ybmpj/3V5WAu/+92pfJIfGhuR0QfCc=;
	b=0F5e2EfOq/qnaL1piA1u9D4l5lkpehPswGLoTS5sppDbXzs36lrz7Iw+qin1nRie2FKV
	 azSnmbnR7bj8ui1sS64v2KPp+31pjUPFNN4Wc1fh4k07ySXfvKA2K2/0uCJmTnsHhsuhy
	 nH1501/yeCR72k6A6KAwQ5rkmDOXl4aIVDASmwv05iHeEPKwCgZPe2GYZJl6CiqHEC3xx
	 EXMQSXEh2O6rZQvEJkolXSPgzDffvY+a5CKXiiTaTD2XwgG01uKdXxRTVGZEgSrJdRZnR
	 HDnjiheQlhlzah3b0SRmOyqGR87He4dJ86MGRb9JMnwxDMWoQGUGZRo8R1JtfGa53Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dE9/VK19";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1LTwCR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13676606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13676606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dE9/VK19;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1LTwCR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYt2a1806572
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ovnIEyc2J8D+ybmpj/3V5
	WAu/+92pfJIfGhuR0QfCc=; b=dE9/VK19NVGmAophCknixC+JA8zw2F7eBn/a3J
	z7k3NiY2sd+Tjoek3WhPYPUeT6hZd2kclK+u4k2/WVEzmM6RbCBqGeWj0B4EeGAw
	5h9cLlDe7dzyRk+/esLyeI0NN7dh/jCZJ2dUiR30RqHM1PbBivhEQX2atQ/s8GA5
	VMfqUfzf32fMLRLPnWXzRyTP6jHoXH4rp5LEzra2rH4GP+cMhQ2OJ2pbqx4tOQLF
	ohil2VuLREnraiVT4ubFAQQYr4SXnu3pBt0TRG82sRbW9hQvAE5XgJeMbm3UFS0n
	F+0GxnlsuzH7EqvNh4OAfGLodOFeAAPfhEmqN5kROjpYBhew==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj7wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so2425370e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402333; x=1795007133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ovnIEyc2J8D+ybmpj/3V5WAu/+92pfJIfGhuR0QfCc=;
        b=cH1LTwCR+cCjeCU0p9eYQ7vBEnIao+z+l5FL4PRrD7aaJSlJtxrIe+1p5NpwWLOJQp
         N4ZJdLJJFfV/JZ1Y3/ADrNfdNaw+e+zfytrG2VusZjyGG122puDmnjm4pBbR/WxsteGG
         T1CrwXX5d9RNZTOEsieXA/I99Dz0Th46u90RGCJvge9E0xefA9M4BA6W+Dm1wGmJQyik
         AsfsR0B/1HzsQor3ypMOcy+zSycAX3lRT0aNfeMFHkY0Xlo7yV1rm7ncofYlphA7Rh5h
         PYaYOl+/a6TYMpAuKsCpyx3iDmSr0cF99ZNLjtEfeW2GVk1lAroBRTg1rzh6667PWnBr
         zTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402333; x=1795007133;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ovnIEyc2J8D+ybmpj/3V5WAu/+92pfJIfGhuR0QfCc=;
        b=ubCfX0er0+wwDmyk4sYtYHxul/AWyPUyYpBLNTmFZU9dUOX+70WKWHiglMRz5JTRpl
         dSrFZSLLu13od6eeIddHua+6+tfoS7CdBB04KrWYSpmhKw6LXpm3NAigMU9yl35+Vhy5
         h9FkP+ZWSDSzf3tqGpIINeSA+Tzpdegg9XVeNXEc1GCCkpzKQFPfBDhNyUI9wC8UHApW
         h0fvNsP2J/Gurqec1q8vcsvaTSdoH5v+z7XpC98kEXwqAazIb7kZzyCIwqnYH20O+cbK
         YV3PXsUfFolBowtrZreTeno2GYGSJwaVtamCZU8xxECi7NySal49yh6X/eWrV67x1SS+
         Yy9Q==
X-Forwarded-Encrypted: i=1; AL+hErHwILZwvmCIvlXx2eeBAcVKxZan9G7Xo2AOuoHOgw3ok+XG5ImtEBRWgoiaaG07CSf2oNVv65/glwkXn4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/+mP/n3gWyoCs8JKkykE/Tz6zXg0tLPSk5/bA43b/c//UAPY
	A7Mni1xfe3fgYj9U9UpiM6dVpvV6F3AV8fxF1AzoRLkadTFiUFCLVeANVOdC5BxtJ+bAImTQaiX
	WvKDyBcV2PE0x/uCWLmH2JDBYIaGvEFHOadFzkv5ketlOkK1l2CBwWO5n2xcTWRPQXP+hP0fwaK
	w=
X-Gm-Gg: AYBFou1xQ+myBtlaYm7dDggRTEDm9xT+NuEolLVL2Fy4oZT4+JS64JHP3apR9lZZzS6
	RsXLPU5Zj/TpqyAd2yD5woD5AQYKSO4ItKxoe/s4yQD9JIGYbqB7hhKOxs6Epvg8Jw3ogK2mS6J
	0flbI1ncMP+kDOEbTTNls3PkRL0ofVspJgbc/+x9eFfSf8eoLgr4GqwuSFubtdWDGkynQ+MxzeV
	Nvl2j9GsedDyvh1R54DihSjdxP5sdKvzGGrpSwyWxZ1aoFZTRg0E5adIUkTxRM5GTSLXA8xkRE3
	kUEAYdMmjyidzR3H3B4xUcoPECkAGIB6yHAqkyfG57D9JK3A6WL7BODmThhopC2Mi9CmQli65sq
	1EIGjVLarb0outjOO4bedljq35Qbr2ILLOshluEjSTYaOd14m88d1jVrrbohXpj5wcO/stS2qNC
	+yYEYco92XS64ygYrm/A+jQRH9bj4J1JlYYup4S7oI1Ltl2zuwl6JPwHP+JEUlVg==
X-Received: by 2002:a05:6122:1d12:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee1bf5e39cmr746992e0c.0.1794402333300;
        Wed, 11 Nov 2026 05:05:33 -0800 (PST)
X-Received: by 2002:a05:6122:1d12:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee1bf5e39cmr746924e0c.0.1794402332787;
        Wed, 11 Nov 2026 05:05:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm/a3xx: follow the msm-3.10 kgsl CP setup
Date: Wed, 11 Nov 2026 15:05:13 +0200
Message-Id: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAlo9GoC/yWM2wpAQBRFf0Xn2SlDefAr8sDMxlEuzaAp+XcH+
 221W+uiAC8IVCUXeZwSZF0UTJqQHdtlAItTpjzLS6PjtoiRe4k8g7veFCgtHKwjNTYPfb5a3fw
 cjm6C3d8E3fcDbhvg0W8AAAA=
X-Change-ID: 20261111-a3xx-fix-me-bf13e6cedecd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUAj3e5OQiOBNMj5siOdfFBEyuSsNIZAllewi8t3uIg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9aXDP4J/157b1z/K/PlrU3VvTt7QierN6Rm2RvvcJuUa
 WK7Y5FxJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsriW/Z+yh5iDxGs/3Qot
 pbUqMWrWi55N5V0WJz2pc6r40hqWxfU6b5fX3Z26sICpuEsgxLpNZD3Tt+kTBf8zMRSbaXf0Btg
 YuyzdL1jz12n6im0/ndQXn5CyreEUY/F/+/KzvTRP1Lc/138m/ooN0TRU2TfxbcdxuePNKTcy/V
 YHZ0fs/sCnVrYp0N1d3fxmckese+sHVTP7o8+/pCo9bQjaJ7MwcK/aCv5MAe9JErsnPTL9WuisE
 ffwwH6ObycnfP/8Z2ULa/QzZtfK4OQgvvKrD6z7tv1RjnonV9t5ivPmlGv5G3REv/3Scghe/Uo5
 1Z558T9jtwnWn/2OSU8wXnUhlrV4epxulZVCVaXw4/2HAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXy+e1AWJD/4Vb
 pq+JmaQe03dVyRrF0nqfzBbYmQDl8jDa8JXQoSP6LBi4apobcPnMG9Z5bkuAvMHv36rzeErXKe/
 qimPgGgGbdcwKwzXL7ChPWjFMICzFg4=
X-Proofpoint-ORIG-GUID: nyfN-hR5n2Sru4LMaaGZcWN5PinER-eV
X-Proofpoint-GUID: nyfN-hR5n2Sru4LMaaGZcWN5PinER-eV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXzNZqikuMwhZ4
 6gZfrTU1D2rvDEYX5ZCjT46eAfkGt6jZlYB24WoHJMF2P5nS0nxiyyCkqD2Oh9xfDKSV21FIBI7
 IOFcWp2axTil1UuFrvxXWWzb4+3D+yBayB1Ubp3jLAExgs+0Gk2WocYGn0mWcbdGElLe+nMRi8G
 4Bdncz/F+Z3p/EKxitZktA/HrM08EZC0FiPd9IL3r4wNczTo9+ywAGbnW29HyF6ongANJa4/ON6
 2Cp5xWZh8nvhA2Dq5wTh1yyuA78zk4hBGQpurjgIAg1CY7aa5tn2+Ef+wMNcFxfc/CLm47w2ojx
 G6cshmcHlWTQPXhM3ti9rS2NK2FAN9LXsCQmzO8Iba6CZN48wisZMkYgcEhrAFhhs16puvTRdSL
 SQt26fZh8DZjPSaRrJR1L0uj+Q0PA8Fg74I0fQtOVewBhai0ci91SO+Ykr4oNfzQK4vEVWvLnYJ
 uyMkD9cq+6mFD+BsP1A==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4681e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qa_B_Q5AuH6_wmrwAUAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

The a3xx CP setup in msm still matches the msm-3.4 downstream driver,
and a3xx_irq() silently acks the CP error interrupts it enables, so a
CP error only shows up as a hangcheck timeout. Report those errors and
bring the register range table and the CP_ME_INIT data in line with the
msm-3.10 kgsl driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      drm/msm/a3xx: report CP protected mode faults
      drm/msm/a3xx: update the CP protected register ranges
      drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)
---
base-commit: bbfe1d58f42ad2cb56a01f5717355901698075e4
change-id: 20261111-a3xx-fix-me-bf13e6cedecd

Best regards,
--  
With best wishes
Dmitry

