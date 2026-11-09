Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234088;
	b=NHjPS5bfI4P+o+h4XHV+UTx8M5HTwGttrijo2DxS5n93nRjIHv/K6pPh36k1hdoV+3P7
	 K+2qSy0Dng14ZMFZbl8RJTIlpp3mK16KkU9B+utobhs5sO4YQc2MvvbFFBNu5doWe9rny
	 m5nRqVlAYjNu+omp09nLsKc432nfeclEX8MNO5QghbYTXc8Dkf3mArAc+zLq3jFK4ryZH
	 +hXFEDXnMl6/r8SvxUFxTUuWdVPHmrUd3wZIGZ/DxVH3cb14AfpeaBe68L5gGf52o+Xn9
	 LKIjEP1dtzwT2gspxSDu/h9kNhRkrJvh4kkfDb3QHpxJPib42JgvTst6YT0Bs1kvtPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
	b=J3M8WYDK6B2n4mzUPT8hb4rFLYnLAFugtm7Ekx8RkfWjgNe6Rr7Ijao+qWOtShj4/oVK
	 DNkYes1f/SVODIF/ztVuP3WewayQNdEIjrs27f0d4v37aS2yA1d8XQ7TWB8yYudiVQl5B
	 RKTfEliKgDyHJzGmUlKDo+a8tZsyOuU3cW1V1BeMIphqVF50gMBA+EPIvFXqDSaqRmA57
	 Q6V1Vg9l5rLjrjtFXEL+cgmYQh4phex7GCviAv3ytD160ZJlTy6PYZ6FiJw58B1E3i7gR
	 gcSByTm8zpFxXD/sn95dDBecKL3hLsPLp2lyO//T8IY1BsIBxCOTAXoMTHRa4XPE0BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kXxHoCG+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLTwVmOT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8242C606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8242C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kXxHoCG+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLTwVmOT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF3851323340
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPgnV+/icpo
	FhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=; b=kXxHoCG+Xttwc8hCkIJVvGo7EQs
	w+kN3W/7RVITeOjWsYXS63qrJKHzJlAiYaxsR0w4rhNZaH4QJB5CEaoekDie8Jg1
	qfTnJr8VRfvmEWIKjnlVQuVpecC0vkxJILMS7bYAnRUGfGNP8jmCfvmLtdE4d1eb
	SQvc5LNqmKcoNlYOhsWL69BDdenNWKff4pRBugTBjo6QwY3RmTK76zJrxf2JZndW
	bv0ox3Y6Tih+IGDBimxTcITqmeNg/kJpOdiY44uzUDURkgemlnkKD84O4pP8zGmC
	bxXO3XC7IQYZ7Wl/zRihV7q6/kMiYK0+xKqy768KCxZJHVjdmSy0fjhKXWw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrdqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso807988a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234087; x=1794838887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=gLTwVmOT+O32+xxc+HIg4w9FkhRJ2ms4g3HorRVpQiJsS31ISpigoDFpRZL3nMRqFM
         rfiJTAZsMYT437lrzSCCllm5A3NXb3u+osh318oQhN5Fd+dHxYQ6KvJr45pWWDGsOore
         OIqGw/z0msqWUIay+SNqJ35rKqoZ7jUB8Y82EqIY1mut/20IadkvB55lBY9yMdKbk1Ry
         MIfo1l4I7sp+G1UbG+CFLuC7hHGdTajLRLgnxJ8bK6JDc1x/8xwASjXKnBJzjpWvo1bv
         YlNIn5TMI/KtIG+JfY0wLLpNj+Xndd0yF8M7f9SCNbu0zKMNS48p3hP+XcZupA2Rj0N+
         XTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234087; x=1794838887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=rbdvuj6ElleXQ4qkZRGqIMTKp59v9KP4YSjcSux7baW32JLUIa0mdmtYIHdQnhI5N5
         Tdw9RQpc6cGdsL4Qtr1MFVWz2V5/AY8PQMpZkIMotahls+MrD0rvvvhCPVWfP8lsGj2o
         5YGqOWrQKPOFhGNnSMMF+NSga5kYpD0bIGYlIO6aLpsYeJ8QUHq4fMhrUV9cTy6vf2gD
         fCAsJG9ZDPwlN1emBwXgAhadr8ipzA6Ag8rnVLjSINYLZGhlARMbsWY3j3rV/a5GgEm5
         kUiq7OcgKMP58bQumGeGJCv8ZGCL3mTPvUljeSeF+paGLGCGFiZMzluTnkYNjQNzmBtD
         5qMQ==
X-Forwarded-Encrypted: i=1; AL+hErFk8UZ3Rj5k1Ed84eatc04QCsBHlTRetvJg4h8r4pqpRtqXyjb2CpkbQ11hK+wTXxAwa1ZuRN4oyJfqP8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wg+bB9RwwY8k//Kk3ovtGgZkxRRXu5GFgAS8NIwlIo/4ltcNV
	w9YE67eoece5tjoQaSnMo8hY7IqaTTgT0j4BIoS7Vos+kSwTEBl/znbaRCnpJr+dD4WS4f4KJcy
	9FDGEVQC3BLO1MVCuyStmnTuyXJez/Od7QIvU2QHCBQWtkko2B5ABcJoUWkfSvWyrIBI=
X-Gm-Gg: AYBFou3xNhT0jYEm+xgcJOUsMJNXQvjvTPqDOmWsTcdRcjs4ZmntNAyElTol77D833S
	bii5WVFkD/+QF5Zkm4w/renbanedwoJZUADzh2+iDyrhsOmStYQFNkMigpj1Kc8cVVEw5kuXa+E
	/PS1sc+IatcClgR2l6pSOV0hrb0bQPD4tDtmHEHbVxRWqYJnBb567md00KM9Zy3jSVv/9rTf//O
	SV8XumE0z+RjakvdQlr3TAazLScoRYI226c8IANsSEL5F0vSqsmHdiysw6AdeqavmzBXdIhYiIq
	xsd8RMCBUIRoBQQBO9YybzTqceabxdzq/496Yl2IRu4c+mQ6UdjnWdrZQ7frmXAdYyn4lip+jj8
	/4WrDabVcFmCO5Lp1ISqyyZXc1gz9D5sr/xED2Bh46embszXTFN9ti4AFz0BI/ua3U64mZz5k8j
	BvwYd3zbnc3yn0Cek/CuH4GrSGi5enlXwe/+cme70fuSvDLkFO9jnkAY6sRTiA
X-Received: by 2002:a17:90b:28c3:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3b12cb3ecffmr3221582a91.0.1794234086943;
        Mon, 09 Nov 2026 06:21:26 -0800 (PST)
X-Received: by 2002:a17:90b:28c3:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3b12cb3ecffmr3221535a91.0.1794234086356;
        Mon, 09 Nov 2026 06:21:26 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7b29sm11045249a91.10.2026.11.09.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:25 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Mon,  9 Nov 2026 06:19:51 -0800
Message-ID: <20261109142111.256630-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXxZ64BtpLShbA
 iAHHqu4zelitn0hptOUpLdJqJAio4lPBAiOERklRlF2xcxOSWZ0U86SBBaP+Yk24Cx6BtPaIRyz
 ItbXUal2bGiZY0JAzAAq8UhtayODTJ/4r8k+kak0P3KWAghXPNg17H5NUbKxZc5Oo9nOlO0Gngn
 2r8RjyK8lYrCALisIeJIT/7drhcbZxBQ1/WVIbIeNm/hFrcszMgW8jk9pNzohXS+0AXC9xjuWYT
 K4WTYGch3Oo1Zd/wOkY/ri7QhN7bERTKpOyZJE3kMSrVi5CrHMljrHZgU8uHef3T9gXq139E8Xi
 cpsHhU7rcypYwWctB4XFh4dqecMQoh1C60qJsPkHfDtKWunkJvKxjKQsTnQmHcmqmy/r7YeNX1S
 f2dJ4ob1EYx1ptG2zKnLvTCj0JDN0/Pggyyh0njxN3fK2NUO4BtmOqPvLvE8AIodfIu74YoEgaz
 ArPPcYqj+pbEgQg2gUA==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1d6e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 14wX-tpT1PTc16PEbGfSiyV2yiFmdfUJ
X-Proofpoint-ORIG-GUID: 14wX-tpT1PTc16PEbGfSiyV2yiFmdfUJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXwqDh7o0eEeIt
 tJjZTbO+wFTbeqDDlSPD1sq4RQbPG+tgCxzd3MKSokBxU1dJknT5KCj8lXg4508R32HQAYfOOGj
 7yyYQ/47SQmPzevg7oS4evqaMz1lO/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a3eab0307529..dd1a5ca91812 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
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

