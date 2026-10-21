Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615973;
	b=vDbjZgpXtFY7OFJ4nXbdUUpCZNhDeWREuC5dT37OXQjZ7rRxJk1Ku+6PkxobFpt6cxK0
	 SauFK/oZw1d3YT0WyFhfSLOmgM+6HJxZFauiJaSs30sF2jviNgew26wgQVIbQRAlxgt5Y
	 7omBJ9aHIvc7CPAzqC6Df/2Bp/5F1pA/Ix5YkV9YTMiILG0+l5mJPE32lv3mDx5Et4P1V
	 pThhtafxpILGISJRPjMxhMS/q8goSfHcZju9QK2exNM8cA5jtRZjvcbiZvBv23lF9IRAc
	 n9Et5kqlp1cAW0HbvC0q1n1b7nUPKt1P8UD6lGbg5W3nvXO8mTASiuuDNpQtPqUvY1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
	b=uEqRgK9k9PFDz6M2ajOU6Gphy/EDEuUjVryeBS4349NH5OokPLeRA32TxwBKajKWPVSn
	 Lq/ibp2uwOCAA8T9VI0ZKkuP5DmQMuoKUmXOzDd1Z9qgTBgLC1wLKPPAcEdkisBrctDvh
	 o2gq8Xjedyj+YaEFAc2ostxCvHfM3ft6O7nSqTSYGoJFWQcaPeKCd+6EM/Op5ZUkytCWL
	 HbteJJQjfNF4PB5u4v64hdHRam3fvmDtxrP8vc1xH1ES1mkJwbjkPlXKSA4+7LsnoXIhz
	 LRgpf/dxzMPQDXcfe2OjipwaxbbChBFHKrC/dgbKYb/eq+SPkkxrwKRI4mvnC5z9QcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oh5UQABZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1paq2KD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB5E606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB5E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oh5UQABZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1paq2KD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKelgV643414
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KmJhK2itx3o
	q5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=; b=oh5UQABZn8+7mi62HCOeGELqaz6
	w2COYGLt2+i+GbxbPH1GzIbU8Mt8889f2oGZ3xnYmsuLXIuGmsebzEUuUtA3M0q6
	jsR+MRZ3h7R37k1hp5/WklkHqtPTtwdfPzisJPUzfxPycX84f2SMNL0emUm8/Vx4
	JOkOrpgEJPAX1ntlfmhwjh+9ldytBN/JxmrYG0bGSXYAGEPa+RRpeEWRGj2Zwaty
	ZSGmSnS95QQgEy4z0yMECVhYmfy6PQgr2faIYqfF/gze+k37VzEE7ZkxogtHIRyk
	MvDb6db3BIrMOHnRabKXdUk2LoobnaTHQZZNq8vM3gI/4Vf1Gs390y0UbJw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q9tvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so1909760a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615971; x=1793220771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=X1paq2KD9aJCrGNg2yYW5vvNPxZftgGhGUMMTJaqMtYgpDKfwn0Oz4L3wb+0eyk65F
         pxMVUnmLsVTTZ453KJuypC/c/vZ/0bpBjRGXs7qdg3b2AE/fU2IpLA40sS9aOSLwu83i
         gE31y+sdH4DVDYl9ZXOJzMf9E8+k+Mjmyg6b+BKv1UtoM0CeJr5d/qwqCQ4kMYTWWGb6
         remImznMRmoMCtNNOxpvgaGfIBe7A85EByn+O7nIwNCS6u+okiHWhBVv4ZQDU2Nm3SH9
         yU5uMRYu+yjPt2keEahAt0YBifH+g3tlvIT6YZRYucZZuXMCQ1IlQhQRhXmt7wKCDV3Z
         HmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615971; x=1793220771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=EELPxuWNaprLZTj1+Zz1Ms/tNjkM1WFZcWG3KrmWFau44Cab/qB2otmPF6BCCiJvM4
         OKMVSovCHhHnbEfw2AQF6uqUQ+PMv39m1lPcsYMPSgh6DrVkKYihg9tm5hYinwQdAboo
         LyIPWkIjEthvP8N7vwK1ewdvItbQejfR5lixIqybTffdi1YbEvZjzJC+EwT77XFzYhPy
         PeEp382QD0DEAVjw/+jA6wG/DPhwrcl2Ow8BLpHCwftjuHqaF27jfZwzrVzsozuerJCH
         uD+ckNJiHY4aocY6NuKXC/nA3pjyMtuzQ/+vsyLL1MMeh6WLUj92Ub98Qi2zsauRLR1h
         Pj6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZ5ktsiV3K3WtTBWRCSz03y2HxE3TmxalNmS/1jJ/5exaEOUREeFHqWNYq83oSYdohg921kLgx3KjJicU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzUBRA2uHfG8mEGrj4DRHlw1bcQwis96AEXdt5RpFCwc60bEuG
	sVVeM07N+Zgd92GAM4+mqV+0fgs6pv85rZRfCiLWD+qN486eIHSpZdVyYov7st3kSc//tAzhSN4
	wa2FXjAihloa2XDSg0lV478ADhIBLufdAdVuOPIh+wj/wMtJbKTsSWmsO1UxUoLdVWho=
X-Gm-Gg: AYBFou2itNkKfoxrvDOc/5bg6QA8y1F54lx6KMwjyh75utL/iJN27z4BE+I/931QfzD
	JfjjgaunktnHeXkPdE2+DVeDgjFEv9vsqKVucNkk62xYc6HOsPC/GmtGBIL5mD0sk0gRvOBjAVf
	ZM81z2w0HnnE9hz8GWiOiTH1fIqqYk0w2Pittu46WygvUN4dzAHHPa0AIWt5b1/fzkAkSrWgnLR
	/IZGdM+3OQ7aiWIq8xLFn/Ivs0Zb3VG8UEiWVmZQcb/srb6m5tS9oiPZIZJDr+M4TAqrEEHaB8v
	ajgbivnUOICCxU7uYkA8B0L+BqlwuF/EV9DJ4uK8J2r48DAmyV3NrNlZFRRpdis3BnJIHjXhK2Q
	sjhLkQKZCX5oc/lNw9Odmf2f5BmZ1K0HjM8xgig8+lcKwx4sS
X-Received: by 2002:a17:90b:390c:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ad86c792aemr2590079a91.21.1792615971324;
        Wed, 21 Oct 2026 13:52:51 -0700 (PDT)
X-Received: by 2002:a17:90b:390c:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ad86c792aemr2590049a91.21.1792615970792;
        Wed, 21 Oct 2026 13:52:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83482f35sm2965909a91.1.2026.10.21.13.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:48 -0700 (PDT)
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
Subject: [PATCH v2 08/14] drm/msm/adreno: Fix PROTECT span length
Date: Wed, 21 Oct 2026 13:41:33 -0700
Message-ID: <20261021204244.67160-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX3NtBYwUj81jm
 Qf3C+OtYqBpAB+f0Dnar6ezzvw21J4IQnE05Ygi8h884ijFwNTyWGe9mtusJTyVmw4LA9Aqz4R1
 8EWsaC8Oc1LtQ8GavIRh1HhATJtZyXg=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad92624 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: odJGD8Zvf99etDo0UDuwXw-yFy7Q0z6i
X-Proofpoint-ORIG-GUID: odJGD8Zvf99etDo0UDuwXw-yFy7Q0z6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX9AD9Ea4bTp8W
 ODJKz6jHkK1xS3qnOp9NmedLQuDPZFG+ZLqg78LTiw9PbkVi9NhEkMPpq6pfkT3BZ6R/C6EgjLY
 JYqnzRe55sCsrAlQQ9br40RNE75MU07p1DJJ2eCiTTpV8jW0uoFOTA0nOZC5QMpOtRY8zrr342o
 tzjVXkgVnqxNv5lxk49OsgKZwDNORqNx0G3QOD2EnMhL1efb4t1w9wFrOU59zk3hoCrE2sbxAen
 gE5hFCBhyiEF0H/hAANcKhwQw5SwYwedYHRi1dy/cZatamwNIwQga07uCLOIwsQfeDUZxA2BfHG
 0fq1k1hbIFkQosL2ek9NMiUxfja/R1Fi3DJkUaWbsmOx/c3EO7jCRn0R1Vi1GpsEp3Zhov003G6
 M6T8IiWMQww/C9gdqXiR9p74L91gHTqM5gwk04EC5E6mP4ksBYy81BcOb4AsbW8YagxZkC5NzGO
 YEK2KxrjYCHxhtyPAmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

Don't let the length bleed into b31.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6b23d301c144..c49301be504b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

