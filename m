Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007411;
	b=02cPk495Ib3gkI1GmhAoxMnWD4/CwHwku6E8FzpvR0az2/I4qqU3xxEXW7xqVdBHs+yK
	 aYh8Qt008YPZesOPBwwbGJYfsziOrMeJ5pGs6GacokqlGBw8EnEZqu5m2j7PqOIrV3tij
	 tez1MAWQ37LXS1IlxkX0ElTJCXwHk+NiAk+LqTqZM857VO0Mld7CVfkcy3e6yPRQFgHYM
	 bBA2ZDHDS6VD2draCKTlrHSE4dNrfJba7q51KTSr98ksONjXn1Va9I9X3f/yhOa3twFuk
	 NkBJ9+5TaSeZ8c3H0Mwm7Ej0kGGyK2HoiVq3MCbAljvya+1f+IkaBqA5VeVWlJYkJ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
	b=Ackgc3zl2WJgwL4KiCz8Dvpqh/TQsWvCZiZBImv+yral9/plmD26fliV6BuQMehWg4Lr
	 flQvwbGxJsFwbWKoG9JUZL2nW5YjKdSEny7h6thnyvVJp9Wd9aQezMFqbJE9CLkGwyrG4
	 gJHuQ+zOlWIrRM5Df075f2s5eLeOxSVRkpd+j/6oYW/M1WdVoBKo6Rgo4OlsRsSDohKHm
	 rDccsGcpWUZxPf1C27FhXkK0CFqhGNVTi2t67EL9cXGAB5V0SBZvpGiTw30FB7yFaApO7
	 usQX5xPmtH1GS6CpuyVNEOPXs1dab8Vb9fbYrHaVT3ZG35eUpjkXq0g73K93Li/AEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7stuwK+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqKE2GwR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA2606D810
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAA2606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7stuwK+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqKE2GwR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoTOC1714573
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLNc8w9O9Js
	SERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=; b=b7stuwK+HVYAdAW6thWiwzyjFuY
	4ltk3YWAT3xXILLdbuRx1suBodg3lw1cSkZbejWhF3QunqaV9m8nBTMrn/BFt2lA
	GiMdvgOqbFJwyLR6EI6Lc+H7Gsq0KnR/oaY9IKnSKX/vCwZcKFh59STHNUvtC50J
	+ZggkgeO6r7p32BqWaASJUEDhr/64RQTDxqdtfPkKtpM+6CMGI4PModPZ+0TfcE2
	TEES6HQrXFdv+RFhJlt/EZ03hoL+mn2hp4PTPoncsYiMEMtpuie4qqKu+oHhCn0E
	v/4hbwNCI9xyxxNPRMnksSncxqXy7gFIDepc99FFkCC1egIDN6ptJnCdBVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmywrqsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:23:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso97828a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007408; x=1794612208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=iqKE2GwRsxMD8CmwdOSNJPpEeTHRM/lGOt7enjkGwMCUWgh6zzye5brzPd9CraFh2R
         RBVddTrxA8dm+rCiKmPCgJ2j0UTxtWn2+eIwgnja+rL1LpBCyj2ySpJoXPGfoI21fjBs
         VhrOTsmg2GFqN0w75xBnL/KngnivJchKlm1Xwe4YNXDz9KRajSCkIZBld5ETcAHZB366
         zlv0uZyxT3SF6t42GAc1pv8fv+W8LTxM5Rq+l4WJmQje4enswvhd8dGbnWXwtiQn43F1
         gNHe4ITFavz1WAqmakzNv6qMfwizURZY/UMKN2p+5VcwKWziyFrwWNU+KWTT2Z5CUFwk
         p6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007408; x=1794612208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=JzcGTxYfu9R5sIwpYZf2lsd6PSz4K+dOvGvzKh8nBUme01TzLb3Dqg+yiFvwnSFzRP
         baaw1OxpNP9dcVz7xpa3dWjp6al7kBu+JJKeVcs9WtvAU6jzjiVPCFRb1uMOJfhLWGTD
         uo8f5K0Xg9tAMvUDBadyn5um3cyCBETq4gKQbwki9hTvtCXQ5UgBoz4i+YGYFPQf4QLO
         YzqlMwEC2gcC+F+1vFwnkdXBVacBZp7W+A/QfbzZOcT1XbJyD+xyRGmih9GjJ+lpr7Ep
         EVCNoVXKwcl0vUwbAL+aAXFGby8tcd80u3M6pDxrXhtTtk6Z5wXl4d0KExDfKtmYsWe2
         /+Dg==
X-Forwarded-Encrypted: i=1; AL+hErF8lPDvvL0/fs7FCOLRuSs+4poqpo8t/hS/W8rWD1jOdJo3kCngBllCRodVX22+ppZ04En2QFyUQtmaTYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tvTZjbgrSPE51k7ZVXxEshFrxVUK8txob8prbJrfjxDTexScg
	wbeaJFWapmELU8v8gtKdUEn9oXUlch2B1SpKJBuH/Q7fevxNjOtjEeQU5l1zYbAxBTESwYtvC8u
	SBR+VNJ+pjp1S27jzega/bVnNTQWvywoe0A/AMZRnV18d7ACtrONIAlih4+rBt0B98p0=
X-Gm-Gg: AYBFou1KNPQ5hC1BB1nV1jZ94TQFvePlruAP1co/UV4V3naIFIwoO7OTKMSWOigvDfl
	DfgBIryjkZL6KoNHI8/kSm/N38dZqtm5476i1HiB5ZQFj+DJkKWFdUn64MXx4noj6xzXUcc2PJL
	OUx0h3YWv3M7ZXtVIlbIm1XAMVr8KGSWnI0k5DYI+Z4mYbWFBndyzZtwcLqfvTwZoYSrcvd3LMB
	YulZz/Ds2BzgGeVlPIEB8Vs0qoXgTXL80NRqKlgRqoZTbw6r6ChOlBIV2lWwEdpl00yiZ3qG3Pk
	2A9mpiXMhwXiFzb/l1gXM6nkJcqrtyKMRT1wjOMNCUn7ChBqh6WcCdn9of++u/FQG38qGSWgEbz
	T5ulA4J8gYX5iTRqI+Q38XT+czwlYr36ywBV53YbBC9WBJMQSb3B02lVrJqet8waExO2nCHpvVL
	+ahYeNmhl4daSf/+WMCNy3feK8GcYdxrkSK73MFGgRd/EvW/QQRVolU5al3cARhg==
X-Received: by 2002:a17:90b:3f87:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b10637b0f9mr310989a91.28.1794007408336;
        Fri, 06 Nov 2026 15:23:28 -0800 (PST)
X-Received: by 2002:a17:90b:3f87:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b10637b0f9mr310966a91.28.1794007407850;
        Fri, 06 Nov 2026 15:23:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc27e829sm855983a91.0.2026.11.06.15.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:23:27 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Fri,  6 Nov 2026 15:21:07 -0800
Message-ID: <20261106232220.47602-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=A6j5rKWG c=1 sm=1 tr=0 ts=6aee6171 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX5aCHBIc0/RmW
 Fz2Z3fcMV/d8/3SCXbM0Zfpmed8AZTFcb/6+B39cqvpNK6CDJ7a8KPfzs1mBVNEgnRARNxY/oD7
 9xc5sOT24fhoVcLCuHf7QzMKk76kAOVFRT+3RBtGKIwt8jG482dhc7ZLVWkeBV2m+NuQWaJ3Xwq
 jlQrhTAs6EvBirBO+/ORFcVjmUmxnv/hdIlMr1XT+4CL8GcbAhar3qo3T6kuuixqq7QfuGESz2/
 4/w9HDtscDcqq3FmW4v+g0LvFewTfYdxJJJASVMPpAnWADh90SWxX1caRKQLTKSLIfuIcSlB/yf
 XITfJhBaEtFvZ5pzzSF7Sl4Nrb2IZdpc6vWydaHGhddVDby4ccyVxln/6dpcJpqW2LhVsz0gIQk
 ykTa5GCsSbpKOBBOro+Fv58BWj6Prc1guZwhw4ZBSdbS8nLmw6tXmsflOLiypX5MyYjvJZYgyI5
 6pj/bSi00xbIA5dfk7A==
X-Proofpoint-GUID: qwmI19ar1uYHXomfDM4lSk2Fk5VOSliJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXx3zhkW5pzW6z
 U4RjgpYZxCnZkP4ivHSfL0OZX6DuRSGYr0sRVtDBkyE6KnkBgrIEiYgk9NO0cdTDcmSIIx0cuaO
 RwOaRkmFclWgY2zsXSkcy/JqhnWN9rg=
X-Proofpoint-ORIG-GUID: qwmI19ar1uYHXomfDM4lSk2Fk5VOSliJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4c4b904a8657..c5c928c1b084 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

