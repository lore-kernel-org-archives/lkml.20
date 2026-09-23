Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF363F58D9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161460; cv=none; b=aU2nYcW83rehBpnWSHImAWSSPwIn1SOq9XUUKES7T6SKxk4pfBDEDEx5WiFukUz0m/xc1fHcJ8gZaD8eq4ZavN6x5L54slZGDcqdBfxmQ0ZZpe0u9f8AoRQyVBr8GBKKSGAnXFHv1rNbOjZ/QaInUBld+dvDObcHwNAOsVRMsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161460; c=relaxed/simple;
	bh=yLtX1PLwOVeGZoNLSkVb9L1mGOV3vsplzjV4KY6SlTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cb/qvhlqqFpv7CyYofoZ1IDgCIW3ZyLXK9aRIPNravf8u6oeBtK9Y+6LDbYst5rK2t7r3kRWYAkFS58V44y3OLVMMFQIEwCQOmkewxq5yqNKNLdW4HtOzAq88T7o/cs7jXJPz1cmidFsTC4Z5oXRuE8lXp4TstdQIUVAyxJmdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mj35o58y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ykt/TR9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mj35o58y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ykt/TR9b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2mmD3208851
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hN5pJW/1dD45B5iCpeN5mFbHHc4A9vSVhEzkczkQXlU=; b=Mj35o58y3QCMPbFC
	8TLkyTSI+6AL1RFwrM5de45RCbq33pugUXbp3RY17MNyytYmfW9RtgpVJ1hw1zaq
	kxHDPYfa4N2KnkcsGNlerxhoZFqgzj8gcrEAjY2PIb9hH/YePC2FnfmfsrBwEbpb
	yHeGIQbPi9uzgRRv+/I2jJDr8HVBZ8O6rBi7e+kogN5NVZgIMaBljiOx902l9j3U
	4BLILC+Bu5+MOezv29L4r9CCE191Wp0Z4DtW5uZm8uhsfP7lJdd2B4rOWUoTG10h
	a8iQA+/2wz1Wv9ZE1A5+cETJod4Pe86713+kRAq0QE/H3lx7pEC0u++j+0oG1o1+
	whh7mQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1msm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33baaba6371so1786733eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161448; x=1790766248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN5pJW/1dD45B5iCpeN5mFbHHc4A9vSVhEzkczkQXlU=;
        b=Ykt/TR9b84Vwe+LOUcZvePmDlIYuDEEVVEKxT73h/+AfHE9ZxuRMmaPmfIUunzeVO8
         6PI9isco9cj/AUQ5+MOuNqIfoibJLWol5bMQXpI89gotUZFXr6nvwoOXARzLs2txctwz
         DtXsVILvqZUcjTP0mUmYFmg4JBUijW985DfphdCdO5TmoFu+/mHHsjcHtRF+ah6QQY2b
         XQAeSJrrbaArC2rrUTlP+VqHEnabhN2Aj+m+jZDP/C+jfrYMpRf42QYPHZDYcxC7JNvp
         w8ccgz6cOoB39GHl2IiumIzXTULXfl7xvXK+6nWOLovHWynLJyq6Hy1IMCpm750P9C/6
         2bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161448; x=1790766248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hN5pJW/1dD45B5iCpeN5mFbHHc4A9vSVhEzkczkQXlU=;
        b=a2XaKYYECrpPq1nl6LvksSlMZyQrbSmddOMJ1CcRGmtBnehtMhwa2GPZ18AcuzrjRf
         RkqfE8MoxltIXpXA1WrFKHzWXdZsPAnEo5SIbnYmpy0yhswACOrWvbaScA9MHxFOHu+E
         0mL2bdUf7hQRlPl/+RDj46dVEgga59JbZ4PWHVZY4OQq1SH4UFSExrytADWImAnTiIuA
         lS/T08Q4afMdFmQs8t1uV8740B4WUUNjh2okqz6V/lW7y0ZXvmI4xcPlbr4s5ghggJox
         zl7+AazVWWzWlz489rT2bgMSELJigLzHvFW4AH4JMSjjjZcU6yJWaTSRiHjdSYXhVfKV
         S0Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzI5NbzwzqV/GU3e1D1WWvZPlYIz4Cfq9ZEFp+eEM46NS7MKv5gH4gEf91yLDgLmf15+3wxADXjcoVnDL0=@vger.kernel.org
X-Gm-Message-State: AFuF++nx3vOWvQ6whnlI8noEYwlDP1vqMde+MNyVfxdqywDGlOTu046M
	XJn/I4kFxj9lmNJ6/J3/py9NP5kJwnIDXS/8OGebJLXIh0shgSgqRlZaFNw43xoLD4MtcGHGRSZ
	4BqumjMECj5PeTWEKuHXDIZ1qVCK8Z/bqkbrqmyAkA8C5FVN2YQ8DbrIFaAGPE6qsnKs=
X-Gm-Gg: AYBFou08szYCH1s/C4fqhFgxOYErIttPG1RmkMPslX6FEDoNi0e4wN0ctwKx+7WbcD/
	dwVxGh6rOPWc6uwKcmNDejkTsUicjZ0LZf6qxp3MBNGe5wM7ymVu0Y6yuubgZYr0QVKpW3i3kAS
	KXSwXW7ee5DElVa0hut18f+dOx/fOJA4iTZzxpn9iYUYsGq1dP4VXNlxDvYOmvqUmN4ChzL+6N8
	Qzy/PR6La7ARihIGt/4XDrS2gif0aFw/Kx9OtYRW60+nBhJl5uoC9+LeA0Go0KSHMg+bAg46oVv
	84Kd1vPFahYwfoZhCbggTeysk18NDp3jFQ0TDyAyyI1hA0D3KJz8you9hdDXN4D9PbY//Fz6h/x
	/2bESdHoaOIpx/VV+de0EQvHEsuQmOw==
X-Received: by 2002:a05:693c:415b:10b0:33c:e86:b2e6 with SMTP id 5a478bee46e88-33e8dec8339mr2609053eec.34.1790161448360;
        Wed, 23 Sep 2026 04:04:08 -0700 (PDT)
X-Received: by 2002:a05:693c:415b:10b0:33c:e86:b2e6 with SMTP id 5a478bee46e88-33e8dec8339mr2608989eec.34.1790161447319;
        Wed, 23 Sep 2026 04:04:07 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:37 +0530
Subject: [PATCH RFC 06/15] media: qcom: camss: vfe: Add support for VFE
 1190
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-6-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=5335;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=U3LMLhstlT1V1V+dKiCrH4zG6uZ933Im/cVt5rMYzoY=;
 b=50tDvHp6qbrXKfRTUBjaMEpKXHn8aB5o/S6Uk0OcCyUQrlJeYr/ZzpOQ7iJLQAQoe86hVDck3
 yNfTEx9VmNiB/plVaanSxvcTMdgA8+kkark4K/hiQKDDBK3OmScrmDJ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX3ZHW2T/kqEHk
 gCRY/EIBY8djiN2dTN/SWU+t84y6fmmWtDYE8ZQPp9KOhcmufh9JEtN3pAx+nrn9/spVdb9wq5e
 6G8qeibJ76jx3HKVobpeTDURw7oqZlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX8SEaTZLsJm95
 vhv2ef67rRMM2NdgSHlslWXeIuBDg1OytfP09/b9fSciA/BxT4i1qfkuZeKWQKeFERdlsCpn2tm
 VzUwNcH8OyKO4SRWRjbYnpHx3WTz32E5+Hvx82ycrNYFGJskduLL/fdIZ4mEa4ywSLrdPqhogGn
 ycsnVJP/njNxQ70nNVX54DTk8l5NcgyDfrvk47gKiBI+9Fc8N0aLgwxujdnLJwXpBQqCSh66w75
 OVCpe3lKPX1GywE0yNDeaakRB/xvAn1zIElpVRvnx9lukpiuSUbhIJ55l75Qk+qi+J0eLj4kTnI
 YSmb6/ac05FrTjkwqh1FQ90SvMd4wvts6qSOgU9YaATTnFDWOBgjSxjsSJimRQYSIjAs0eH7sM7
 URbHnWewqdgj5P69t6P1BE5IHDn1yLOG5wnyOW+l8OTL+0TV07dMSbQE6Cf5Lmd7s4s757WR0Rl
 Bm53BjPqKjItJdg0+0A==
X-Proofpoint-ORIG-GUID: by6e3wFkgkvVyDvJxUK3TNJk8ImsfLYl
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3b229 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K2FGoDgSqdHUgQQgPRsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: by6e3wFkgkvVyDvJxUK3TNJk8ImsfLYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the Video Front End (VFE) on Hawi SoC. VFE gen4
has support for VFE 1190.

VFE 1190 uses a different bus write master register layout from the
VFE 1080/980 variants: the per-write-master register block has a
0x200 stride based at 0x1000, and several individual registers sit at
different offsets. Parameterize the bus register macros on the VFE
version so the gen4 driver can serve VFE 1080, 980 and 1190.

This change limits Hawi VFE output lines to 3 for now as constrained by
the CAMSS driver framework.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 49 ++++++++++++++--------
 drivers/media/platform/qcom/camss/camss-vfe.c      |  2 +
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710a2127c606ac8459a1d8c747a2f7c..eece3c8698e66d739dd870d79b549dbba8e52ad1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,36 +13,51 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_1190(vfe)	((vfe)->camss->res->version == CAMSS_HAWI)
+
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
 
-#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
+/* VFE-gen4 Bus Register Base Addresses */
+#define BUS_REG_BASE_1190	(0x800)
+#define BUS_REG_BASE		(IS_VFE_1190(vfe) ? BUS_REG_BASE_1190 : \
+						    BUS_REG_BASE_1080)
+
+#define BUS_REG_OFFSET_1080(n)		(0x500 + (n) * 0x100)
+#define BUS_REG_OFFSET_1190(n)		(0x1000 + (n) * 0x200)
+#define BUS_REG_OFFSET(n)		(IS_VFE_1190(vfe) ? \
+						BUS_REG_OFFSET_1190(n) : \
+						BUS_REG_OFFSET_1080(n))
+
+#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + \
+					(IS_VFE_1190(vfe) ? 0x4 : 0x8))
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
 
-#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
+#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + \
+					(IS_VFE_1190(vfe) ? 0x144 : 0x128))
 
-#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
+#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + BUS_REG_OFFSET(n))
 #define		WM_CFG_EN				BIT(0)
 #define		WM_VIR_FRM_EN				BIT(1)
 #define		WM_CFG_MODE				BIT(16)
-#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
-#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
-#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50C + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x4)
+#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x8)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0xC)
 #define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
-#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x14)
 #define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
-#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
+#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x18)
 
-#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
-#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x30)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x34)
 
 /* VFE lite has no such registers */
-#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
-#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53C + (n) * 0x100)
-
-#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
-#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x38)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + 0x3C)
 
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + BUS_REG_OFFSET(n) + \
+						(IS_VFE_1190(vfe) ? 0x64 : 0x60))
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + BUS_REG_OFFSET(n) + \
+						(IS_VFE_1190(vfe) ? 0x68 : 0x64))
 /*
  * IFE write master client IDs
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 826ab85a44a14e611ff9918f6c8de40edf483fb8..92dbd59477ad6cfe2d2e7e663397dde0271a5c16 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -353,6 +353,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_HAWI:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
@@ -2017,6 +2018,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8550:
 	case CAMSS_8650:
 	case CAMSS_8775P:
+	case CAMSS_HAWI:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;

-- 
2.34.1

