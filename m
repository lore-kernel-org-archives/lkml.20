Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305078;
	b=P7+7LYIY5f9lOK6iJ8/2Rkn3kNSbZGeqP+2uBWfaqhoiHpVwo3EkTdLPyCIBh6T7GwSV
	 ToNVJnMFtgt9w/0BdX8Qjw2TbV1AkcdSv4wtDarJBpeNeENQ1aF89xWKAswN0tf0LVlah
	 o5AGjH09JZ4ul3apoFnKmox6rBaTD9ECVVMzYkJW3aFf0DyTNe7RDrMkDHDPP8jkGVmRB
	 ChmU4wH6QgGhxTZjwWq5cZIWwaK3AFRyk8YfKq/w9OwBBNT8tqvbtaHzovS5CVuwyruLg
	 etUns7yGT357v4/MdhZBJR2YnmRBy6SXErTTLS3NWx0sY5VhEU+qwGp3VbrXtSAgIdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
	b=nDAW1gEjMlIwBbZgayjNlz5A07ZvktQ+wRABgX+LKOsP1JpG+dy/esgK+SrbUXPpsA72
	 v2FFNYMcM8O6Qjk5lsVj3DsEmxBS/WFrXR2R839dDEh/vuLNTFfVSDUEm1cGGQsB+FXxY
	 lW/5+ywbOZ08ZvZxMjK/QlJakiZyLetQ3nmLSThazlreBGUOvUIAvl/4p6g2CYn5HyF7j
	 3o+w07lAP7QtX8aKiKdj1uRJp7QDhNwpjqPlbBez4PsfoRYlSqTCdeeDmOy4KLiockKFm
	 06mANrJ4RZn7g5UDYl6dX8ZZChudWKiMfRZCQr25YO2UeqJOd3qAk5sZkFNayan2WuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NmmR/M/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPHpF70J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840DA60A262D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 840DA60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmR/M/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aPHpF70J
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjQEb1131907
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jo2sX9VXnBm
	xIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=; b=NmmR/M/+w3RD5xPAX4n3dVPA9gt
	Oc/tgfh0e3BypCgwElLAhl8KFKdpwbxnHCykv15KBSdrnY5lIbiaooNzPzs+IW/D
	+nlq1Ho9xyO9bfSm0xPkzckpNH7d3MIYeNsiMWbkFFESpWjm4IHTb1rSnigeBPPM
	da/LSwjIdjCIncJnaLf8LMcaWPjb+GZEfucv/l6oK3l9jNqxXL42e/zc3O4Bxp7q
	dUlpK0llhhoGzu4pp8E07YZj0tXr72vp9ARndn/2m/B1In+0WJwD52v3OGa0FI78
	oHBRysCaUecyZY+D0kIO5DkFl9R0L6SMwNE/TrfJaNKk7jAMzuu1sg866bg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmbeas20b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so1369500a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305076; x=1793909876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=aPHpF70JpvxhP/oz3juMb4Zqu7Uls+ZpZ8BLqFlYSbyR8uJuD+I5ryD8lJKI/qmsvL
         Mz8LysV3q3ZEwnkKGCX7HW19WU4VENu0XAGoUSLoiGIDsjGrLqscFJm9iWlwMEXAji3N
         LHXRaF4rXy0FmZwAG6CCMsnn48Cn3rCH1MDxz4nCNLwiLdPPdtZUOTTGQ6tUbNTrWawY
         yOMsnMHcDc/iCNL+NBUF4CjL5aARrfX7IBJ/457ZiEAyJR543GwbxQ3ZW5NqbFc7f7XN
         5EamHFDZsVu50rALOMwxEgzfjGmMpkg8u6EvpJgcmY2kTtVMIvaPw3UTIxloNqhsI9yZ
         FnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305076; x=1793909876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=AbZLAQ9bxOmK857rLhh3WB19aV1FbUl9YQpkQqXPUwDQJtVipTXyyVDs7YoNr0rkph
         2CmbodQqDpeiE88p0BS59eT5tpUy5ILPlPuNVlgRMg546JdhOltUVLFG/oY/SbAK7FBV
         N6OTxddsb2hx4yS6erXyFYvY0uVW80E3exLAIsHDxBQ+Wy3H+OMqPomYuL03F3trF91u
         kohmygMNzqZ256GI6WNzgm/2RtCjxSgmgE2MVYHNG0rHKAsRqPX76wmDY597sn2cLakk
         rTmvP1UaWXMB2x2nBXtNI4xC2F7Ba5gF/hLwP4Fg2GzUk/2PsZHyGq3qLl3HJlY0BQ9T
         3vhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsXK0inj4zSinOU2tWVDnikqgUHKboo2RYdtAhMV2APHWd++/bNCk2F76DLhMs+2u4H6ycJfGpYxj0QNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7hce4zDSxOa2X3ayvp4ArYGMIlwZKWjqi7z1YFWMi830anC0k
	/m7oJB0HpugzG9OSl5FAvQfgHnCCZAID/LEiz+JzeiqJLY8RuE8LA/GhGMuyMnTItXyztaLhGKk
	niZhecfhm+s4cdVgRRKnbv3fvVqQ2H+JvaLrrgDlpt9TaDgbSvPH0rfCBT92ToZQptCo=
X-Gm-Gg: AYBFou2ojcKslyLGfTS4EMEDxZGhfhp3ALMx5xUOfXFhzRttV64f+8Hm+k+9QefRvj7
	v8TTbfK6x3olkfkL0XrxWu2MtkUltsr/mm0EJ2Bgiw1CBTxXiL9gZc+a2ZrhOWA3T63Jbfj9dC/
	CZ/M/RoIVid1DOZhsuoA2fZSe7ROjn9yGOLT7B1MRWWCH5V4rujte2wSZj9e+YLFXgYEPzbYkje
	OYwbdulOnTOCHE+rAqK3U59OkNUQc9q0rH/97zrmQYxstGqyPAsoucfIAI2uopkprgsxGQt3O/h
	6hzSazNOBUWiq4lkzLbiRHGGDrochhS5xOHnJveIX34ppiP6D7gitLtnTVPeG60RNcx6nsQlHeP
	r+E1RwmaY1lhyDCT9DWcq26qxaotI5IDm5US+IRz9iAkEyurEiY+QI0Nze32B1xk737n5ibxH2X
	/HI7gOXtZtcGmVlc70x5DStA==
X-Received: by 2002:a17:90b:1e42:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3ae897ce417mr63822a91.32.1793305075459;
        Thu, 29 Oct 2026 13:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3ae897ce417mr63800a91.32.1793305074970;
        Thu, 29 Oct 2026 13:17:54 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm339928a91.0.2026.10.29.13.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 05/16] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Thu, 29 Oct 2026 13:16:15 -0700
Message-ID: <20261029201730.151754-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UejE26SN c=1 sm=1 tr=0 ts=6ae3a9f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=h-8skOKhzxl6Lr9m04UA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: lhBxVVrEHoADQVYI8E2FrKLrUWfbM-Xg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX/TOKJzBLsoz3
 UsoxQheIiBh6e5gLtBomNaT+7SBh8DrLYn3HL/ukXLSCjT5ZR1uMopAWobCzFmeylj4yoWLFN8z
 VtmoVMtGApWaO/L59L7rHtBkVoUXpoawo6nW77OEHewfJdoKJwNfyg5pqu2j6ktjWCAPzkAueHJ
 qDuOp7+sL4GIKTPnMtmhoIh9RDVpBkt2refnwvfAstnQTFwQnQKEPIGTn1FjuZVO6vmTxJMr6Cz
 6vs5gH2vHb9yTj0feQ7B1gtwaLNxSsL7Ebd2Uicw944in4GWOBb0Gw0mDjDuRkyrHO5dkTZDon8
 GVtJHDtHJdava+VNGXFjL89G7lW9R2PZf9XniRWhIrkr9NrEWgqeGbYC2zN68n41VT+Iz7nX2j0
 2/x87LCr7F6iTqhPAvyyKEG/mWeKp6M766Z47g3Cb7F8qCIW2NJ2fy1ghAcJApoVbuFtsP3bmp/
 vT6lKFnl9I5LR9jxDXw==
X-Proofpoint-ORIG-GUID: lhBxVVrEHoADQVYI8E2FrKLrUWfbM-Xg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+Mv2Dbl30Q94
 0ZqDu1ierCHqo2PlEx2NmP4rnTBlLJ2SU+BEEJ+CqOhBEh0mKw6VCrYFrMDnErVqhkYkjiAecVP
 XN6TJ/Qq1f6eqY5K7rhY6U+ywbdo4zM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

We want to save/restore all of the CP_PROTECT regs across IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

