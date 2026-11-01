Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555364;
	b=gCZQsrtOr+Iu4fXXiTmvh3D9pfe77Mu4MYFBEcKo+Zzc6heCmDwVKTkuOrCJGVX2Gw+u
	 HqVucQJLIX44sS8f0hvMOnV9/RhNpFF1S5Q4Hyl4v90aDSEOdqJwMzr1g/+i2fs+jYnar
	 OJEWoeXH1vjIljTmv8dSLSOHPsWJflUovY8X3xjLitN/CVLys18+ExWRq41USNNoAK0WY
	 tJ12z5vY6ZOBJid/ey7PJiv4S8WzOtXoYkRYNIdXzTabkuOEmaQ8nPzZHOxDZ0b++qlsH
	 /AkRa0xVygkBXLqZZZp2physLYIelbm3eL89xEpulxSWwzC3FeOFHyF8c2T5xpT5BsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yywh0hDJ/pjpr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=;
	b=zkGHaDgKJruhEfGdEDeGywDEPxznBilAhlH8sxhjKrJRqqM1e0B+J35jyGq5jjc7pgHd
	 /jt7yHEv7Y6TLsdHJ0vhnTXU2Cx6+6Czh/8aU5WeUMZz6HZdFiXuwOSaTQP0Htwh8SdqA
	 DIWu8oKPx5JnlfzOJx7EmWqqzjsUnChVfrHU9v2img1yluBQwlf8n/dpna0Ndie+M7Hlw
	 gQQmPiLaF3O4VZVqmyCVAYkc3op8/BbLSwT1hEtq2vSx3rPO2lJKRgV7p3Cmj/G0d2kJa
	 dnNxdbad76y7Gw12JHZJCK9AfOKT6J6KcJFn/rjixe04J4JwBSp+DGSBpJ4A8/7n8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+Rhihmo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRZThYMX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA3606A33F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CA3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g+Rhihmo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRZThYMX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQLQ91452791
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yywh0hDJ/pj
	pr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=; b=g+RhihmoOTsgP4hvhBu5oyBIo6b
	8AT8EQk/67JJs23ySehvLA3TJk+R/kH3LjiL9jz+dysMXOc6dS50YaNIJBfygA/I
	rZd3Rfz9R0+K4MSfDzpzIyqZWjqUNqeGAQyl3enTsRxoWXksFO+BiTK623o4UwEd
	dOGRfIrgDpWn9xrQTs+UFKaCgcAr6otilS4SyVnj4LohD6G1/oNJE22BM0T0sT7L
	zBby7d6e7iiGFyHLkFcUCVO5dIxtY7RrQEfHOZW41VfmJj+VjSZnk4avZxBqRSWC
	QOf8re4XJfV+Oop58a3i+J8lq8283G7rN59kxsbVXuSPThGKGgnr402IwAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkm8gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:49:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb1f470a57so14875275ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555361; x=1794160161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yywh0hDJ/pjpr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=;
        b=CRZThYMXgcMPKqylAHZTI4WjXalAZbt4CWkXWv/O14/aTY/XwWMHERY0FawzK1o9lx
         xpO2PgVpet5sfgveRSCKpBdWkC5Q+EB2SdwO67ovuNYEhPV505/7JZmHBqMiXTmeJQC/
         XNe+d3XB2OzOP9xvnzAehgFid/+Rgm8DFLrln+9gr6WXdGxhgRrZ61DgU6UOjNqNAaqC
         jSb9XVP2pAujfwzZav8jyxKZOv2pyT7cADgXAEoO57RjjmDu+pojmbUA9y7z9tAp+ENx
         WThlmvqgHHynr0e9TJeaMzHbw1oc3Ti4rhjA+4sN+A0BtCRl7uu/ZAM8yEzRyRBQoGbQ
         cKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555361; x=1794160161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yywh0hDJ/pjpr1YR/EkxrAqjq95tRwDr0CnZD4CFXzM=;
        b=Oa+t40HEKv45akj9tpdS6q5G8t+q54ZMN5Bzs/Zz5545U6JAihOemZpXtExHFoXZOr
         xNVbhO52TkgTMzVd6bMgeEr/i0qUJiUsrvAZvutWVdjVxUOOi4U01GoeGUQsqi8HX/LN
         99P9p0OfD1NMqjWxpMHRJEBxePGfWigm/2SM4QZ3PtnVoGM/x8yVwr5pnyKzJpjK3VaL
         BCbkCvsAFuwMvwlcUBGLeO0zw0pLlPRpsMI5AlXfRg6MhpvYtYNGwSVpNgG71kVFnjQs
         2hdIZuzqm8vzfkYNXLV6107RKskmqey2Z4bUezAOU9eNWQEnSTiZ5X0mo9foXsPKrPvR
         3x9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhmEQRaHJMpoLSjU/H7IIN6wNt+xfJzSI5LvFcYIaEjJn6Bx0pggxAuSjSQ6QtpRufpApEWNGbwqCu6e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RqDD2GLL5G89uTSy/vpEDK/hZGLLwB5Vt8arltZtyLWc1Y9Lx
	2kgYYqvjd+Ztvg3jL9FfMQuFaOBw9qQvxveJ/x+CXw4p5PjNnot4XcCnSM1jsMJIxT5wdzhIaRV
	rIcybyRu1u0+18UwTWGf98RMqU7wyUHcO5NqXo56bneaKQhBOubOcVsZZMNW+sHwC8JI=
X-Gm-Gg: AYBFou1PRbpC919vaI9YlPH4qu4xqMAPjOGEQk6G3LkuqETy4q0WLqWf5/bqEFbBUIh
	wBvz5vcNboCEcb9s2HF5AR8x5mzyTbiMxcdU7hs2ICM/DkFg+AsrLQp8Lb8i7oODPWs0DDiv5JX
	ubE8eyFQsKVeq6oaPf+cRUEAgQTtb4vaL4k5lvD/GoBfjy4vTRNEB9BH9+ndoe4yyRrYxb9YUO2
	mUHZzObJavftkWw08ftTuV+EZvgJ7hIkmpLIyVf3DxC5wBKVru3iXCDLtEHu+fzpCjwHqoHglUa
	jopcrzhQbW6PHT3zL0lyTtyGh2IZsMkEW+1OfzPn5ca+XpX3Sb079vht99TMm7XvFF4xhxHcptX
	SVx/57R4c3wnhHDXNbZoXSuRdkwqZ4KWdGoK2VlWFv5DEPa96azpgBZCXwVhrm/1iDPYqthKa/T
	9K41tGoFs4OCuBCcCfEHHzN7c=
X-Received: by 2002:a17:903:1251:b0:2e9:8510:6aee with SMTP id d9443c01a7336-2eb36331b0bmr73784345ad.0.1793555361100;
        Sun, 01 Nov 2026 09:49:21 -0800 (PST)
X-Received: by 2002:a17:903:1251:b0:2e9:8510:6aee with SMTP id d9443c01a7336-2eb36331b0bmr73784255ad.0.1793555360662;
        Sun, 01 Nov 2026 09:49:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09703b2asm2121905a12.19.2026.11.01.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:49:20 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
Date: Sun,  1 Nov 2026 09:49:09 -0800
Message-ID: <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gPkZOOq8lf3WmGHNfMBJa3et8JVfJA1s
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae77ba2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IPD_lQuv09rAGqqMs-UA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX6bHF9K5c8wj9
 Gvq4KSx9wqWEpQ9SDDzbQI23RBlSImjjf4ZmT/qYokECDZ36fOBjbSterl6evYHY6oxugbi3LIq
 2RE3OK+MRhcZ+Q0DLq1c63mWPn3Zo9o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX3r+bAGO3bMvv
 EKBV20IHbSFiOzRGyFb1oblTbUaF5Q3lUUYKTXpaGeBZkbTpB9WLRiDWQbNV0A52hjrNx2DdNYg
 1EbhGn+njDnXFZ4rySPAjRY3liNAmZbNmDaWDum1kRgF2GHxX1AwQmFC1ee/8Q7BGk9d6WnM20a
 NTxaKHTkr9RdrDWNQFXRK+9HOjmOCnS/m5jQhGE//qJW7rIaoSqdF8Nm2Us/hH0Wu2W9LbeVHP8
 56WY5eoaiOGsILG0arQ5uc6Yuo4So8Mu0+WM6sTk5Wi5czfPtjaugJr+X/TgimhPQ0+/GxKbsqL
 7Sc8Idy3H7CibRfOoCf0Tt4paC21MA8Tz9qhDpkmOhvCcZMeXvO9bRwvIRjeeluicqQ8/sR6wNs
 vVI//d4ezsWlXlHSob9HjyuOWTA+7blk0l0qdBTApx/frqpBEaw69sAgC0IrOAWFX7UCj/1YlIP
 GGOIj6v3GALr146aKMA==
X-Proofpoint-ORIG-GUID: gPkZOOq8lf3WmGHNfMBJa3et8JVfJA1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010070

Use size_add() to guard against overflow.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f687a629629d..16b3870d5e90 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		op->obj = obj;
 		cnt++;
 
-		if ((op->range + op->obj_offset) > obj->size) {
+		if (size_add(op->range, op->obj_offset) > obj->size) {
 			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
 				   op->range, op->obj_offset, obj->size);
 			goto out_unlock;
-- 
2.56.0

