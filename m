Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426F4348C75
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225170; cv=none; b=QTJXlgQcZV7Pl+ufHOZ81vI7XXJUZXkqc8//aGe4wGL9ZuwcZqhQhjv2oUgizu5a5pU0IYBH7ZecrdChSokE4sI5pPu0zdtwp75EGRn2NcWzc1uNXYReRWBSGhN/x+8tHdNWNQeWRkjBPDp62KMbEsFtWwjGe9hpsBbdbwaYZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225170; c=relaxed/simple;
	bh=s+J+DB3T2OYS4cexx/6gamGsabNdYDCNqoTXrneeivY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbsmKDaJAxJ/zw/ZMlr3lAv+SicjopCtAmBsQcnOeW6BMHGFsGS0prUS70dt0/IGhJKm627h/ke7OIuBDN4MBtPz6HDKkW8mjKm1fFy9vFaxmmnyyi/ncy+WnLpHPZY6DkUCAd3jtXZQDRy0R/shiGDE5hHmQGOdrED7mF6/GBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8l3qoA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJvKbJ2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8l3qoA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJvKbJ2U"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEeVuF3472659
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3o6Eb4jJTSo
	LrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=; b=S8l3qoA+GRBPBBxSSdwuMtvF0cg
	8Wt7j+7nu7b4J44GoppgA5hRKV4FU8vmzmQjRViCjhPhS0P1EmAdtOpprzvxJJxB
	63qZX3Jchpk1Fz2+cIzznEn/+SQ6vQc8zUaLsea+tQus5T0CS28TB/NhA8UONckd
	vF7eWfilYjJ5EQBlvTpqHzqoQvAoUvDt5O4TnWSTWA9BpanSCz1tlLmc1EZiApAC
	Dx7dQgocdBrKZwDi+GUa7zJMe4MD3pE3l7TL8ayZCVEuV9/8TOy5LBBhpMxYFKOR
	RFw8fxu8hJTJU2oIt6Z3cN3xAnzb+MpPHge2uND7ZHTU3Aa+EpDn3vexF2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c979g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso1863605a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789225167; x=1789829967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o6Eb4jJTSoLrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=;
        b=gJvKbJ2UZgFCxz2t28eAiciMeTEoaYSSQPazz8Aqx7LuUz0WDMIiu21MO0ZEcU0wFy
         p30BXV4QcU2ePmHypMdKJ58pPYSy4T4zK+Dr3xpLJ45rqoH7ZRh9gUWBH16lEMDlgnR5
         SpPkx2zlOO4rOrr74SapNBT/dodfLdKz0b4bTiEpYQidtEplq6QB/aOmFsEbPiX9DTjd
         3FFk7Jd8q235C1oEwflG49LNfvmgJ4em/NqmCSZUogBkiyiBcv9nYPPQWD2KnPOp2fCV
         M8KhiPPUVDp+IKu/U9VTgQU3NzknicWXru1fdI3wF815Lydur7a405SaJjls9J4sRflB
         p+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225167; x=1789829967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o6Eb4jJTSoLrrYSQ6/wTkfaq0oEFAS72SV9H1raKQo=;
        b=JPJvtnZp5XIqkGBEBz526cKNiVE9dQNTgqhl7V+qowPDgqJe/6exn3R5y92KkF1Agl
         NSP0IgwqumlNJeoysmjtkatxzdo7XKWDor+zH34hsQpextVnm/Pfjh19Pe3sxX6sfr4X
         S3Av3ETrC1ft2xwuzMk4yH1tUQR3i3JDXHUEC1UO2nkcU6o0p+ih6nhksp4Q+qht9HWU
         OR8mGlcs3TijGkx0eWMsZCsCqCbYGJWdGmG7y2UJocAj8wwJVXXwsuLs4ohBMTnY9DMT
         5+Okyzig00xVQzu5eYPluxVwGgBMIaCz8sgAY17lg74MQAjBU36FzcTSwAQDWyYieOyB
         zfSg==
X-Forwarded-Encrypted: i=1; AKwUvBxafCsMo6cpTA2eBLRCr1VUvI6Ae6z7pNfQhlVqHv/CfpxpVn8FFhn6RrS2zYsgbRqhH5GVqC8RLRGyVrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mx+yqowcCZq+g1hPOD04yXNZiqYlx2VwZqnfARB0BDIcV3oJCp
	owdqkQxP5v9ajXcduZiTVu7VUAGXO40DQHhCysCIzTeCtzAnU8yDweu5WG+N3eQKvjFKhCLga1V
	xU4MQSCdUy+qGAqsxEKkIDztKq/aNoJiKjeQVbX21rK5aP5jiu/p+XkFsjpQvUvRvfAU=
X-Gm-Gg: AYBFou3NQ2XNWXbZwtzBNZmTRnHEGvNL7uy24OuzRaVnIQW95MyWvSJida+7kUA3ER4
	g2E4n26PlB1derunORVpt+p0d6/WoTrTHYZTHf8ycRmLqvP/YGIjmsfYY79GOQM9f+pxJ6JXzM1
	yWhbQrZ0DFtyKlFqNc1zCtrInPxbSC9jcmYp3GWD3b8qNYiW1ACfcNp8Oo/ANmKVwkzVty0ygnE
	AeivdkjknnkS+gfLhm3euiOLpFgCDK42G+guzJnclJngl/e91Cqrf9asHC7orW2zBydj51W8dfK
	P4gdKVcDcQX/KGuJaPnf+/X6Kbd54G51k+olh4GAIj2zdkWJj+VTokv+ojndE3aJpKUUJCT8x0J
	RmHGmL36sr1dksLaU6pMxr5QbjGYdJIoOIAVVySd0zUhj8rA=
X-Received: by 2002:a17:90b:384c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d9b99384dmr14378710a91.0.1789225166904;
        Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39d9b99384dmr14378658a91.0.1789225166443;
        Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm12533511a91.2.2026.09.12.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/gem: Add modparam to disable shrinker blocking
Date: Sat, 12 Sep 2026 07:59:22 -0700
Message-ID: <20260912145922.24115-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
References: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa568cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RQ8Jhd0wILkaI2gFI60A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxNyBTYWx0ZWRfX+IqUddMcR5ha
 TDhgjAFF4p7WEg85J5CFgSCw708NDFivcrA/sifXVysSM+COPkN/2OH29CMXXPjio75iF/48ZD0
 k3DqySHw0aK5jpL3obwPlGuNAKmUZ2M=
X-Proofpoint-ORIG-GUID: gCOQtHKlIAOyEW8wsQ-PCMdivmmwzOYM
X-Proofpoint-GUID: gCOQtHKlIAOyEW8wsQ-PCMdivmmwzOYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxNyBTYWx0ZWRfX9n/HWPkxL32n
 MGVCR48Z3MHe8sTpwDRiTnt18wEWZMu9pLt8sGJRuNwVvBm/fmoSjcAYZzWLXSjfTBPgZiShNlr
 AswIyGl532vevVcEaZY061Ss8IVcG85tiUCM+T8+JSBR25+Wg2XYmxvNwoqlRB/wd3goRPmb8N6
 dFH34Niz8uShAEfl/yNs2nhWLWxMoo4qiQ6LsqK0I9ejIicFPdNpNxkYH5nGvWWBtyHx3mTYf13
 H7hPyyeLWtNtUzykAlpZMfDdEyyXTGX3P5daYlwHYShutpvRvQf0YtFjs8gTvOONnzxpjromNVx
 MLX5WuOJytL7p2r4bAgzB1Up70nDJVOVIkW/3vNbEqD2doHE9EoLBpjo5wBnfxBYeqdvIxVbz4j
 23xFXKylp70lo3Oj1lD8SI5X3K1XtbB1+Do4FweD1Dcl2ot+1DHDJkfe9362stuRz1nkRYp+V3e
 mUWB3FADDUFfOboCyaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120217

Normally if we are under enough memory pressure, the shrinker will
eventually start waiting for BOs to become idle.  In some very latency
sensitive use-cases this is undesirable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 3514d5c84989..83ee032cb21d 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -19,6 +19,10 @@ static bool enable_eviction = true;
 MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
 module_param(enable_eviction, bool, 0600);
 
+static bool eviction_can_block = true;
+MODULE_PARM_DESC(eviction_can_block, "Enable blocking for GEM buffer to become idle for eviction");
+module_param(eviction_can_block, bool, 0600);
+
 static bool can_swap(void)
 {
 	return enable_eviction && get_nr_swap_pages() > 0;
@@ -26,6 +30,8 @@ static bool can_swap(void)
 
 static bool can_block(struct shrink_control *sc)
 {
+	if (!eviction_can_block)
+		return false;
 	return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
 	       (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLAIM));
 }
-- 
2.55.0

