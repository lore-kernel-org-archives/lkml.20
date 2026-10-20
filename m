Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529278;
	b=VFG66T9hiT+IH3BJkIQ/Ej3r0zoZeYfW86zsDoUxSVVdY3s6nAade+kqPuPGK/CUbtIr
	 sNDANotkVZjdXYLYalWF2EQLLVT60M4uFRpfVmb8UXKlPAyiqceemJilBIx0YL5nn3x5Z
	 wbQk42rriGUbytDna9FN6JzfFYVJThD6Vzt00TpftfmKH5hfIIvKt++2A5Fo1Mmv9dck7
	 Dorui4D9cMF6mvrfmzqntFq+VMXaW34BFT3EMYBrCMj9yyTNwjWbaX4rOJ87XiQiHsjyG
	 DAU69yajJ2iiDtsZeI0HOVTffuzXtENduIPaHV/woM7YhwATnA/9MGWno1omPGHF78g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
	b=r99pjdkpTWfUF/SSlDSuhL60Mbd0S1Bv1ZxjxGmID1fodxQOIjyJ6KOmCBlYrc1QmV45
	 QKFQUkOb9ixQVObeBAx12tzNaogO2sEOhqKCIBaKM+zqEuSCv/r8/IKzGuj3tYVaaOjwU
	 /5y740CAay3xq5CoeYO2/sUpBSYPOf338XtPYLZ7kpLbeQHX0FNcjejd2cqNYR7MA4IYS
	 Mi24gcwcoMLsSECQJ4uatk6ouTN4eh1iQtwJjwBaIzsMh80VJuvq/7biDkdZ1A7/qtBCR
	 QfaqbUuLPfHCJNCJ5wjkeo0lYTYYQFMQuid6b/lJw/xXCv3vufNwTqSep9CW1mS+wxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNdeDNc8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XFIIhtS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284DC60A2636
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284DC60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dNdeDNc8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFIIhtS/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI71Cd1862524
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocDu9x7a94S
	WPcpzxK16LgiMD4smeVd0t/ViadjFsRc=; b=dNdeDNc8GXRM7M8sFkBYIMZEaA+
	r9lhCv6xgWQLw9rIHRTR7V/RRVgjKVpC+HhXGMGqrSnyZCmtEb97623n+0Aohq7y
	evjAB8HNFK546Owob+djgpxi8Gvdoxsg8doOQx5981p2FlxK+7PdJ5sSI5z57UR9
	C722fXjG75szQaAmfyWT7soGrkF5ry2v5lnk4teksl5yj+Kg+hxbkdJW5IuQgF2o
	h+6FesyC6gqE3FmX1IGFCo2K47yzecuPSIxs4XB2OsgMZGSk1yZoMBYjQsc8id3m
	EoK5yQqqXWKN+H2+Ej2KTg5ik7j/vaYatCNz++QSXZcTq0FLTF2tGgcgH9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0ghhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so61323a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529277; x=1793134077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=XFIIhtS/3UiFDdFwby9/OTZkfXe5WlmNI/LcsCDn8+FQK77MlVZv4wF1q8qDGLZYHx
         eKUiwD22B7yVQAFFiOda0t3hq7Xu2Nmy07+NDfmXlsHz+5yiUjaWQA7bcZG8pR+ZTRi6
         rm8UAVzXkLruhB6osv0E2CgVhlN35GoLDLLG/9bA8S8wWBrRL4m3NcgcnqFp+3w9MPfc
         ZPWq5PBVsnQesKh7zyEMwUWeDAiPwUAP+Q2aYpQH6UrAAgtNIWLV4tmK7HUeTH9yQ5FY
         0JFteSforDcToG5YI7zN9flXLUs+So0zSNrC58afPXViZK4BhEnw2IDHAFEU7N7bHpSb
         OsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529277; x=1793134077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=xZaOVRZGh2PsOtHKMhFeaLr7AKpuUqzLQAMdHb6c0zL9ZWnrKlH5kPyI1G/j17JldU
         Sf5Vs4h58P+p/tTsE4hO4Z2pKR8aKM9ZVZUdurvsWq2WAiE7vb7o8KirV7Kf6UEm5Ym4
         5B62m3I7M2nWWPKeYTgPbZbU4ovQ674f6gSOc5LJKeQPdsm7rzUPppbVgz1Gedhoxzow
         2j5L9psUNPHTw4fbQ9+HuGJcKO2o5znEwWK/JR7+xBpooX4z+uuU2Yhv+aai4+q1DGBD
         Xplb6KzKXRJh9s+LoQLM1VxH5tNij+nF5OsrADBXAFXGUKAksQ/tWWgcUj5fYYAbN0Ha
         D9LA==
X-Forwarded-Encrypted: i=1; AKwUvBxmqzVRYDpM6z+c+QDB8gankv5g8ZfVrKKRUx6fKns8hMZ2O2/49mmsFjBU2nX80DPcfhPu3PHuRIpdtao=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHmjxlLhnpcd5NEOIlgDp140p0BVYhD14D4oKvIPDQ9ucPpwcx
	W8XrUsj1CERKOvysJ58yr8NUeBYKUQuleHX9JyBkOFPnKYrdaPZ3Q8s+71nf0jyo5heuai4KYAu
	8SOfCtAuMPbzuKcxTV8E5ojUrIcVNrA7cGlX2skEmXGMKP1LLYYkbsBA2FIFr665pMcE=
X-Gm-Gg: AYBFou1q7FHMABMh7iBu1HfzqFgMclwoWIWiph6EsnujNtjKKvCYdXoyHpQBIrIqrEu
	JCRcLC2jYvuYnUKrjo0m6aFEnUnIn+uR3Qsu0/iW6hpkeGJj3W0LyaU88bJdbHCTWBu5Hr18nRY
	PvImI+tsBytePgYJ0xYVbrFfvCwltF4UUDBjsk+C7DXSY5EOJYbIXdggdf95vBHiXlblDhouded
	5KNcoG8wQUvKO9Yt8+Ta+NxM37B/nKWtzF3rcrHpYTZ+BM5ULXh/pTleH6qr6QBrdBTOak19C9v
	x2RRq+BgK64eCLbL7pgNGyrv0IbokL9/t8MuXFzmHBnh/W/tcmYmke5n0GcRQEQ4leNSL5pt+RU
	3zoWoP6IyQDfQxBCEpl57nE4GOWKUggyc3P+DsPVrH6eeO3JltQ==
X-Received: by 2002:a17:90b:2250:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ad86cf2bf0mr99480a91.26.1792529276777;
        Tue, 20 Oct 2026 13:47:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ad86cf2bf0mr99461a91.26.1792529276327;
        Tue, 20 Oct 2026 13:47:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303567sm1036388a91.14.2026.10.20.13.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:55 -0700 (PDT)
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
Subject: [PATCH 07/12] drm/msm/adreno: add temporary __maybe_unused
Date: Tue, 20 Oct 2026 13:46:21 -0700
Message-ID: <20261020204728.28844-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX5dKT3iwrePlg
 8SfuyCDRWQv4aX5N1iJ2HV+cXwu5d77x/O9F4xsdmKSfvH1lkdSdRe249rSmgyklhpE4n5DMTNH
 ABE/k8/oLiw4qDofCZSNMZTE/u9IKlvWe7uI/HF/DDFIlhWVePJN2bb9uEtxDGFcdLcSRhlrL28
 9ghs5dNxPa+7jsYN+rWAQjGcFz2FjgOL1q3wP9TY2DXaTk2hGx/PUwfNi7ZM4cSw65mCKCIHi/J
 Um+bvIwG5OBHr4JztR8T0p61L7pDyakIVejkX6OX0p2hRkwbjnZtEffp80+HdjKgWI/ICoztAfd
 m0lrhIyag7X5T+WJNa+5WuNnCc3G/MCTsOenfV7KZP0+h6fp+MsTcJXelifsFFvhfWFVhIKaKOo
 4NJSr7IwlC0SjNB0Wkxfj9hA6aHy5oDR3aLDDkNA5nc3SfGc1olNn5sBYy/BlzBtK/mrm/pufpx
 +xZ52YP4MEj9UP7opAQ==
X-Proofpoint-ORIG-GUID: qlDVMK-fCc7E1N8015A09CjU11R3bpat
X-Proofpoint-GUID: qlDVMK-fCc7E1N8015A09CjU11R3bpat
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXyzv7MTm+9wDt
 T1TyhCLJTmWZ9ZdqVtALcfGVyga2JjRgCCLiAxpeH9V5+XMXX+PKRm0wMBGtLc2R0dh6PLeUcm0
 tsmmSWCBPzt+yzbnx8XgUyu6uYYoa/0=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad7d37d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

