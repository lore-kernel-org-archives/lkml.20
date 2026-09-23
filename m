Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59659486BA2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159255; cv=none; b=PoFHTO9C7ordnVemlj15rbn8E3byTWAa/02S/ksQe3GL5VCzZQh+3uUB/KkMQh3AsbhhkGE1axT1WK9GbMOny3N1iF8Z3Wi9lkegiUpKFXgdZ8blqF0a2hLZLtgB7rU23rSvGlWYw5C7HXFVCpCKIhwYFr2N/Muo0geMTqY/IqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159255; c=relaxed/simple;
	bh=O2yorgcn3qac5YPOIKJIjFkqQ44IcBuyGyxTWHOGoWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBExH5Km+TfArpj5ovDtGHMRIEeGxHb2XpoCcTTe6QTOQEC8mXbBPzb8qX3vDw0jNs26k0iT9YWEBB16Xw4HzA6AMiprQPXvA7wkQ/sfmnxrVPCLT6ffGxr+i5nxVRdKgGufLEUTSOV5NoK8BRimBJ+gk3y9N6WGGAzBFcAjKLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DV1VdyOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgjbgNSu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DV1VdyOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgjbgNSu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2eg92821196
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yxbd1teNaRbJSFaMhYA9X3rNQohP5W5z/04iNpPpazI=; b=DV1VdyODE0YWYkIB
	ukyh7QsX52cM88lGOKWJJxJcc7EK4o3hxvld5sfME6JNM/FunHuW4hSS8zzKfWf+
	+6ssZKh0Jl5uHQDs+ZH3m5xErBHw2/3H9QCg/+pARVRPS8ESIUxmDMP0ut80+F9u
	P2BsoAMJ6iicc50J8P2p3Lyb06vlzevC95f8D/jyStWL3pMah4uWBbeUwHUbme1r
	q+Lqbb+f3h3ujF6hKAkleyf0dCDaz2BYxfV85539lSh3IMTyXC8deik7sFxVM8rr
	ZHMRRX6Kde1Z2gcCDqlrk1DZtlzmGK+z5SMw2gky+X9ipsvAYAktsy6jL7pRMlI6
	D03iUw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwaramw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso902065eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159238; x=1790764038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yxbd1teNaRbJSFaMhYA9X3rNQohP5W5z/04iNpPpazI=;
        b=FgjbgNSutvpf+niySvGHaXn8rPvHJfFvsodWslddAQdng4lgZU5EgI8dSU8WGeHQ6Z
         CQXBoPvPY/x79+tIocp1YgxBziMHp1L6ANFJBYBEDd89FVFMM/bcSsR5DufdyPeVsO1f
         V8dVTkJz2KAyzXC4Brpu1tm2aGf6aIHKC0onqKlnbCQLnw/hck+9gIP19N2qnaVbBBIk
         hiNFk3qWJxr5ckNSxZ+wpQmBOxeIQ3QZ5Zg7dPn4dg1uMhLnSeOv8ETVeG4Axkly+O24
         2D7TYJ9EAb4/EzaRAjYZc/h1b1n2ubPGLAM4m6DIUUKRAcKzjt7QSm4Su26zluUX1kpH
         YkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159238; x=1790764038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yxbd1teNaRbJSFaMhYA9X3rNQohP5W5z/04iNpPpazI=;
        b=FBEBN5hUxCSKQwgD6UnLc/UuXeJuJBR3yTCcrnNtAVN+gVf+CvKLHGohZDH9sEKCCB
         +lt/DVWbwnbcFuY8z74IJ6mhyX71UxxJu3OiRtLHOeL5dy94FRGo6jliGaLb0zS477AO
         TfMtEnaTCafVbxbmuw7KbXxANIj8yOiX8T3ZywJnBRhYyKdvaxwcbQtMPrS4DfIeNXq5
         fEOWcnQiXRUdVd/h1me2JQLvqgfgRu9SrqRwXzJPfK7zQDBK7TT2nSo40rl0wqm4sI1O
         968FpGXE3c+j5es/q8btHFnFE0gsrdmZffx05qT+C0E/usUvGgNHxdOxfZ6+NAqaBzFm
         rcQQ==
X-Forwarded-Encrypted: i=1; AKwUvBys/Re1VjA2dNDfGKHTT5ieSiri04VO0Mv5zhFDOURkfvoR3iTbm9bJorEY+haoyGj51B606kosWgIZ2xA=@vger.kernel.org
X-Gm-Message-State: AFuF++naLRVf/pFDXU8K2oRyMfFZq6O9mUkRD99b3onQXovcUIx41sYf
	yF/rKyqKZeee5IcmS3EgegrhHlUiQohTvB0QOxR/WohKpj3V0DSdw/WuhWINWAvi3JQZJ8P3uAY
	odHPdH2g15Um5k785DGdq2p5+VDPh4x7yIK9oRt2HqaDkMiI6OEU+ZROxTUmNKMj1fRw=
X-Gm-Gg: AYBFou0jR8VmQn+SOSngSJJ5FcGnBhPtw6sCRyvUpqn6z2QJgSRQhIhu1goNDetWoB/
	/AHOK3k35K6SRjyE1X41gvkLOPzVMykyE6QiN6hLpzk3++1gisxkxjBuuhDY5nC0oRr2VBGObbE
	sYPp7Z57yX2CWNajrQqH8q4q3gXTWkZgYW3BT5jxz3AQklS8gQb78swwup03iBpl9LuZfakfaFV
	0cltl2k+TDA/FYCw2C1ZzTZXihlif3eShjZeuDA9HdFWoqv980XTt4b6/POFx00MwCOxPIGlv5n
	h0gkYX/mv31mlEfxI9WGicuYawNr92xTMnXRvPRMNezpOQknCgOFE9oMO7ocoE7QBFORxoiGGXO
	p5jfkE1eumW5CBo9gT/XZ2lA=
X-Received: by 2002:a05:7022:7f0c:b0:144:c113:cbcb with SMTP id a92af1059eb24-144f91b1bc2mr2239517c88.24.1790159238308;
        Wed, 23 Sep 2026 03:27:18 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0c:b0:144:c113:cbcb with SMTP id a92af1059eb24-144f91b1bc2mr2239481c88.24.1790159237667;
        Wed, 23 Sep 2026 03:27:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:49 +0530
Subject: [PATCH 09/15] drm/msm/a8xx: Add Adreno 845 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-9-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=9244;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=70Ju2nkAHaw3hv05wG4v0gJzVI08hMnW1AdqyDuiY88=;
 b=cfdNNl8f/mMPGChuN7ylC3fvUC/lHNivbJuFm82zKyWgselnj8CqmOFFFXimAmhgFEffFRhRk
 1SwemI99V8QDxN0GOGW4qEhzwEBJJMtdxyYFbJk/orhWMSMXbYeFbUq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX15dddE07a5A9
 cUxIFQaBKi5HNsYbsv7no6g/4ir7R0E2FDJwBAhVsur6hi9GfV6qOps0luxwYOz79JIvaLZvmqR
 mvV6RS+i39Sd4EX/u03+Xwu68c0e3cKQOHX02FZEPpc+0nkMvTgb4hrbCMq5fWN1v6T/vbuCaYS
 Vcq4nHtizlWFxyclQX+SHmmhYva6Ze94SiCTxUpYFhi4IbQ1Hrw/awccZn/JLwra1qJDCOW8CT9
 3dhCLLDdJBfApNbTZ1ypFs14cRYzbl0JqbBpKTC0YvJtkzGgSEJs6jDz1/pi05fvY/dXClsAyNu
 poJY7C8tk3VnWMpUQ+RSnqHzmw3mUyxyy+2aFW9eIi0JykSsN0E64Pl+b7dAgaR8YdGDFuvm5Vn
 t1i42ky4eCdzgic0inDynDVvMoA4PUHzdN6PuDPJCgnWi3a2sWc6Ej2khd4/xkDuRU2jI3cg+Dw
 fhFa6LvRRdP42yPpJoA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3a987 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=efTGCE8BwS5gw3xw1XkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _tk_LMIvIH7HDyEfHVlCcBMsrBws6HIQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX0QQLhU2TOLlj
 GBm2XpYQBKQRh8sHvJ/sYVHxNa5EWYV3eVdNKJxzfnAQArEJGsYvnzCilU7hjXQ5RPSwUQwAU/j
 A0ccLjpU1A9DIsntUjerCL3AU6boHeU=
X-Proofpoint-ORIG-GUID: _tk_LMIvIH7HDyEfHVlCcBMsrBws6HIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

From: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>

Adreno 845 GPU is present in the Maili SoC. It is very similar to Hawi GPU
(A850), except that it doesn't have a MALU unit. Add the necessary
register lists and a catalog entry to support this GPU.

Signed-off-by: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 102 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  11 ++++
 4 files changed, 117 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 83c6f257f478..ed77cd40ca5e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2397,6 +2397,65 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
 };
 DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
 
+static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
+	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+	{ REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x01000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000803, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_5, BIT(28) | BIT(30), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
+	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_CHICKEN_BITS, BIT(24), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_CHICKEN_BITS_5, BIT(3), BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, 0x04000000, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(1), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_HW_DBG_CNTL, 0x01410000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00080020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL, 0x00080004, BIT(PIPE_NONE) },
+	{ },
+};
+
 static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 	{ REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -2825,6 +2884,49 @@ static const struct adreno_info a8xx_gpus[] = {
 			{ 242, 1 },
 			{ 221, 2 },
 		),
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x44041400),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen81100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen81400_gmu.bin",
+			[ADRENO_FW_AQE] = "gen81100_aqe.fw",
+		},
+		.gmem = 12 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a850_protect,
+			.nonctxt_reglist = a845_nonctxt_regs,
+			.pwrup_reglist = &a850_pwrup_reglist,
+			.dyn_pwrup_reglist = &a850_dyn_pwrup_reglist,
+			.ifpc_reglist = &a850_ifpc_reglist,
+			.gbif_cx = a850_gbif,
+			.max_slices = 3,
+			.gmu_chipid = 0x80e0000,
+			.thinmem_config = 14,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 32 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 13564 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 0xd8, 0 },
+			{ 0x11c, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x44051401),
 		.family = ADRENO_8XX_GEN2,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f766e5e4c7b5..662f09bec9d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -150,7 +150,7 @@ bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
 	 * register to ensure correct GDSC and clock status reporting even
 	 * when the GMU MX domain is powered off
 	 */
-	if (adreno_is_a850(adreno_gpu)) {
+	if (adreno_is_a850_family(adreno_gpu)) {
 		val = a6xx_cx_misc_read(a6xx_gpu, REG_A8XX_CX_MISC_GFX_PWR_CLK_STATUS);
 
 		return !(val &
@@ -658,7 +658,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	if (!test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
 		return;
 
-	if (adreno_is_a840(adreno_gpu) || adreno_is_a850(adreno_gpu))
+	if (adreno_is_a840(adreno_gpu) || adreno_is_a850_family(adreno_gpu))
 		bitmask = BIT(30);
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a5b5e4286e4e..3170ba6ef5a0 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -737,10 +737,10 @@ static int hw_init(struct msm_gpu *gpu)
 			apriv_mask = A8XX_BR_APRIV_MASK;
 
 		/*
-		 * A850's BV pipe raises a spurious RTWROVF fault interrupt;
+		 * A845/A850's BV pipe raises a spurious RTWROVF fault interrupt;
 		 * mask it off to avoid false fault recovery.
 		 */
-		if (adreno_is_a850(adreno_gpu) && pipe_id == PIPE_BV)
+		if (adreno_is_a850_family(adreno_gpu) && pipe_id == PIPE_BV)
 			int_mask &= ~A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_RTWROVF;
 
 		a8xx_aperture_acquire(gpu, pipe_id, &flags);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index f99cf5962344..1b05a4760e02 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -612,11 +612,22 @@ static inline int adreno_is_a840(struct adreno_gpu *gpu)
 	return gpu->info->chip_ids[0] == 0x44050a01;
 }
 
+static inline int adreno_is_a845(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44041400;
+}
+
 static inline int adreno_is_a850(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x44051401;
 }
 
+static inline int adreno_is_a850_family(struct adreno_gpu *gpu)
+{
+	return adreno_is_a845(gpu) ||
+	       adreno_is_a850(gpu);
+}
+
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);

-- 
2.55.0

