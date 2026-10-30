Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395191;
	b=XNE5UJaRx3XOt0O3b9DSRvB+OOOz1Q0MGL4yW4K/o1pEseeMJuq+FDtCD2B7/8ryulhY
	 J18gfGuP6A4XgvPR85k05k/5aTlq3sEthvc0ujWbtFJE+5eIKe4mv+IotpQB6FR6RjxJK
	 oNdXiyXJGHZ5rF15SL34aszijg9rC0+LnwSytGtqCm6Rf5iGjsYQaoq6koN6rFeuaMoH+
	 aFuMGZ+FQb5eq/Fw5lVk+RRiN+Xr9yPsWuCzwzIPV+qW1LTIYiwgWYwe4+Of6ihR5ThsF
	 KReZQQQJCKQEZffpk+c1dLPRQNmPet7K1YioMwxIjgBJFSRAWF/L7MetzYVUmIK2NBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uy4egUIXFTyN8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=;
	b=xhVSADlnzGHcOZxVhrDucE9eUoeG9SZwn3KYp4UtP4Co/sj8aQ1jlqFEkLP1SpaFuWVg
	 EkLOZcK+W1kJ1axrB2VyKv4Qz9QH5VTfEP5u6uHz/L/Fm5telId6LZ7vN7yHiIB0kVaVb
	 JuRHPzUYnaoKmtCEKPKS2pOq8n5cRW+Oy+PSeyopsYJDhaH0XF8wWlc7S+q7/JJo7Mv5Z
	 eOUJ0MZkNOL9FgZ0MiAfOuEDPSOjRkjpLpdeo3y/MMRH+F7aEsUYr0cbDLwMTY6JJl7s4
	 SLD10DgthqFRO1VoXMD00dIBaFrMsxWyaF5ac15noJQAdo1ggAydLQ/hCgI+PqwUkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvUkgvx9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqhAxRZw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvUkgvx9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqhAxRZw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAuGj236596
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uy4egUIXFTy
	N8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=; b=VvUkgvx93RWms59lZ+U3D82kzMU
	+YTUBiwDFAg94CWA9zOVFCdQHFEqIqeNtIELdGxtTvUQCwWqO/VxBRoUUHpaJe7K
	pZmvCAUflCVqzmRipQq4o+BLfuiJeOb9OCll7eEUq5ygexG6APCHs5N0gggLX77O
	2XQGHaUoDgaT/tMJ8WBCJ0XOhQxl24L04Bz3dvUJNCcE58vsrAIJ9ykqaVa0E75K
	BCQyl7YNG9aVqdwF9X/KODUeLg/QiEf4nRWEN7BlI7Q3Y6tK3JFUu8PseUjEs5NY
	fXctSE+V+VCzfA/qCQSyJmomTQ5yllsgsoM76ytZBu465cMGoYlcmDnlIvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x001ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso989654a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395189; x=1793999989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy4egUIXFTyN8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=;
        b=HqhAxRZwQIu/Z89645orEkrCIlGgq68fBqHKcTleszuDIxW1IGhNiFO08ZHsXVAamj
         ETKclPDA5cQUqDeaOoeETsjNvxiV0+st9LLSMViAyLvSIt3ZUqQNwZKxlUaAH9y3N7ko
         J+FyrnPx12tjU/7QIZ/RH7EG3pl8ME6Wea1lklycO3ZBuuUlMWNzye/JTDfU37OsaK5r
         AJo7b7pGe6x1zBAKd8DFn9HMIae10elKurUGdWxlD0NB6pPpzrDDMZD96IKvs32Y/Qd3
         09Asm5dvMWM1cjcA3pinsxUIsw3aMfufNjACPP76TsizpAjWIbci4o/YMpNU3T85OIaD
         k59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395189; x=1793999989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uy4egUIXFTyN8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=;
        b=pnSIVWE9bp+pe+a36jGiMPr2mvi/Ferno0LIIPvuX5kaBwF5L4s6MLBSo3RLHySz1A
         GBC9Uu3kE2L0txpi0aQGTl+OFwXNVbG3EXjSpUr0BBv4ZIFg2gZx1/+lO2UXPKtU8Fmi
         BKboIXMP7F/TaKSm95+KW1redJyrty5nqqM1kAKKMcFeJai8E7j+OU62xVAg79RTSi8P
         rMv77gscaa1OMM5tEi+wkQ89SVIYcbkaktShzxI+NuxDbHShzMfCNQ7Q1y3yGe4HLv40
         yHRuZT4nfGMRiMKTcEqr6pVwu4yq3SuuaN2irilbyViY88u4qkh6n7xw609L17qYUBFP
         PHFQ==
X-Forwarded-Encrypted: i=1; AKwUvByqLHgx8Tdw77w1G5Lr7jzuPAQDE8jQohkC8EoZP2ZROr/nVUOi5RJjXClXNPEA44FmkTZjNLyZdEuU3Ag=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8Tzk2IdklHRe8EkgTlXiE2vYZZ4HVnzzE/KZTM1Um7FtSa4Px
	7gI1BZxpHFoPGnzioELpFOW+18NgTTCxG6wa8R5/CHab0Vt4bppT6Tu5wN0swnSMRRONoTixJts
	tK9JDgnBVew9zI/YT03gVuAr1+NZ6xmQw0KFoy9dRJDsMBEAyOH6TKW3wqeE3qS0dl04=
X-Gm-Gg: AYBFou10KC1mjClTC66kJhTPfRkCr/y3CGlt6tqckQWv8BhLyBrb+rq2vUYr9rDOBjd
	W/Ip9UDh3VyhprOLUOfXuRpX1UAlLxUof+sZo+5rCtKzrxLvVJwIdwbXn3gFW4Z8rKP+POrEcep
	8v3k4XaHT28wYi2WNmHFAD4bSQrlK+JqlshBK+8q1Ml1kpqjEiKwk//XkOuzD04oDlVHidrdw8u
	rlwujNRFONCMzxYhP3gEtNOCGLwHnjMTlfALrl6A5FSgFjZWBQKLsSC/Idwlou5S5s3RJHPH/YC
	IZYJGowxm6Ef7MKT/y4shFpqjAoTrINCRlpovnnKeigXxgXrPKoFSL28JaBciKzpO94nGg6O82f
	5Eni/VL1XuHvrkDCwxot6J7VR7yKdNezgII8zq701hOUBM3b3HfAjY/gYS2drpThi0P47iHmnvO
	3lV8yP1/lwfmLGgwZHhrKDlao=
X-Received: by 2002:a17:90a:f6c7:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3ae89536bc3mr1943624a91.1.1793395189429;
        Fri, 30 Oct 2026 14:19:49 -0700 (PDT)
X-Received: by 2002:a17:90a:f6c7:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3ae89536bc3mr1943605a91.1.1793395188916;
        Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm5376432a91.7.2026.10.30.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 08/19] drm/msm/adreno: Fix PROTECT span length
Date: Fri, 30 Oct 2026 14:18:10 -0700
Message-ID: <20261030211928.45761-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXwFoAEnyr87JF
 DxrrAmP5OAbhrnntqojsblCoMuaAK41r74zaxKN0YXvo0DOgDnZNqfP51MHGHfrNzOJnN4X5MrM
 HpKec5duF0vKE0dFiE1igyC7Xuwm53E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX0vr18R1Gg9EO
 c8soNnGH+6fU0fyE8RfHbTwU+TdCwxdHziv4hp9oUnHZZRSWmBokMmUsAIbitovK3kVCJjlt9ct
 TaJdz6o+I/abWdFJ/eYI+MBkjnZr7zgEPU4TGKXC9EH/wcYKuvOYNR81KSHaX9XJgE9SyS32yoe
 p/cSUGneW4z6JSs+RlSOga5ZRmaN7M5cFT2HHV11b6Cd9FSp2NkzTFMoP4dheTkkeLzn47eqUrT
 webtJ9w8PHOrw4oBE1xRZxEJm/xkXkZBo0P1z5ZLY8+pxV965MZzu6Cn7FNwdptYYYZB4UH0BWM
 Ko7BTSogkjtjvVxwsE9FZGz5YZadEPOkC52qLCQlR1+VVbV5Ig6l1xhuScUIrQAiazR2LZ5Xu2Z
 PdPG2pEzxF/JmcBstcYConMdUaDiXA==
X-Proofpoint-GUID: oDvwbh8lYOSEsyRg73lXV7pu2aa7mBnQ
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae509f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: oDvwbh8lYOSEsyRg73lXV7pu2aa7mBnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

