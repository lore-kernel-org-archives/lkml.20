Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007368;
	b=xF2887V70K20MaCoHMpOGpqDwbStBdMhBQttAIGQW1upVwspjiU497XAMqlGvkqPVji3
	 G9xWsyOfMyss3XIL8J68K5KTTPAEkIlP+sLDq9046LOwGDYyulk9pZjFfLAK1DGLd6EpQ
	 gPAC5+DYlQ962Gf272EVyCA8Bi9c6iOkABt90+Vj5+THNgO2hP1IdrbjMY0nTRDzEOHB7
	 qGfrk7paIBV2tjFrNMEd9iQeaxUpQm+U+3ozxYbzo4AItZEpgIgXWH/2OTp3dqFRBrx7z
	 iVU/5InBEEEP7l9nmZa4Dby4bhBOxnlviUYiNiz1WRsfwIixvS05LGni7YZypo+/xtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
	b=SKWW4VcPIWKKFQEnEZoHrfVaZJ2eBpcAhK95QzkufWXU1dxUlXAxcH2scN5NrlCIKnFI
	 BGynjMwGJ/1E5AyG94/ypCoNg9ScF1KNpe/UAmFkrYI/TvfM9DXEF3/tt7EWwExAGig3Z
	 B7b4Zxv8AwkS/xd+DRN6boUkA1Ue3W3WZlOJKtqEOC4L2V3FbWJSnsrZ2RW2uAOGAWGwP
	 ULOKU50H9Lq3p2/t85V+mXNbCjGgVa4nFVKmXn3sVUS3rN1gmGc23CsxbLCCCEy0VmxC7
	 /XhQrARDUKBhxKSaB8V22chnxpbTiVisPRYT5ptwgpAFviCgU3CyjClFMWWfXKbduAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DXvajpiA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DuOJ5vPd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634D606A339
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0634D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DXvajpiA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DuOJ5vPd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo8L03696176
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=srWWDrFCDRP
	ROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=; b=DXvajpiAJZ8KK3v7j5nbZV3MxHh
	vWzxQvQNKRb4S5U5aBbbJd3LCIob8sLwzn7vkYC/rim/0A1L2cRjvGWMBnRPdTmE
	LsJc8IflLn9JLm8ornSuKxhqI404CwO02EaO9/7CdKiiWm4j86R67d5Eu8wdqTcZ
	cjT95H9YvpAj42PDvL4w+JEgIXMx3m4ELtkT9/VL4V+c3eP2tK9JXzz3uiW4fifF
	45x6h/b9dLlZN0AJ8uaWqOHPbYpifOFetXie5oeF/PDOfHl1dtN9tED0bfP/eAPy
	5Fl0/9j2KAcdU5xe7VLi5myYR7oy8XBoe1F06mD+G5NCP6irY1cCtvnV5DQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqrr4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1127170a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007366; x=1794612166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=DuOJ5vPdflT+qoyGVYuVdrCN9cHVAUfYcTJN4SCXpAKGlAK3eLvolvPkknWcc78tWd
         MOZKmT12wgDyvykQO/Sziun0JZfJsroSQZuMl4ATEFTO7eS24Bn8gr72FYxJaC9Cn4FS
         ETpxMA5u9uMUrUPMsBKkw/2J8Oq6VSepGR2KLXciMuEDisslu0Xfu2c1yMosYpJZF56b
         1TyozV8ALexe75KPYJxT3rG5YUNlvvP4CIlaF1JvWwKlIQacH1R6WY7A25apreEPTW5d
         xVFUCuLK/r1GExs/EP1pottKwwmFMrhtTL+KGz2rwDBrVKdThyz3mVX2YNuaEJnjD48H
         clmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007366; x=1794612166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=R6bP6tcJZuf3S6K2tnc29IeuGsxWlf1EjuDKcWS7+vtJKvDAmdeuIN0/+zZ2WKlCWs
         3W8ROxvWYNGCL/HWjt1ybZLnDiuf/WPkajzrtSW1puRXmi+aUk054NUhgmlHvaHpe/2e
         O/34tsB7z4+oLLuuVyKUpqSnZdBrFOvcYw2j6CQt6XAZzMVmA6dhW/KAGWXCqkxHmtG4
         idWF1nKlYftxxjRApwL0h2MkMop2r2MtGVBd4Krxtoa0G/3n4lrNVrHbXU5S+SQOORqP
         1lvn8XiIR8pPmELvrMYD5Kbr7Xf4IQ/33UTQwSt3Tb+5a9LtCdol7GWQZoqOinWp1jyY
         0edg==
X-Forwarded-Encrypted: i=1; AL+hErG1BKyJfTVyVuCVxXIx0Cd5bk6nLtVUMWF8n2BO5tbHBE+TlZR9BLsaICsyVEzKnwKg4QIr6cJwDodxr7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BFigMta76AKkF83r0vvqXhuYTSBRJTcs14PBpiH/e8wwfT8ex
	QZj8P4If5GOUKwJGU36qxz77o97RVWYHuLOj3EE/qreGgDrn94XswIMPBEuTJ/NrMrww84A8WBZ
	QU7oIbLqxY1bgN4UozrTJdS4yh4KZ9t08dWWqW46NqSVxPkdFRwyRFpfeXseeejZLxaw=
X-Gm-Gg: AYBFou2BzepfFk+UIigJ+kT66D1CcYwmfv6bpL63kqc6xlI4sYB/8jgEGkGY5UWFmvL
	C1r16oC5o/pebMCF0tI9VL3urVKJJ3DtTCGhqYmlBCWf5nbD7TsSpHtJmbhPZ1Rs8OLr0XBpkG8
	7VjkSi0BjMQCNo1xbYVp8+iIfy44XE0/yJxaPDmIrOf2C9w8E+p2M9WGdf2DeIB6pdMYgHLNDZ3
	939EI7WaVbtjLkCNy0vx/YaOHYTQkd7W2BGZWSsALxXe4Wd4/bk0iv79KrcudVbBKTFltjRvZOq
	oC/2jCxmf/DwSp+D4jItMZVHPw9cikJ1xFLXRbMhyfDyxu0yF2KDbPtXypbq9/2W8YRrYz18t0s
	GJiFYopeW4ZBnpX0M8xX3d6MR0i+HKQREKgzPzSAgAgi+CU7MEd0rfyE1xlyPa6/R83mHqrkDFa
	Mnci7G4MwiJcWsz9bVnwlPmXFedlpWWyw4A0jvDDaUfFqc9/ggpKgSWBxbzS8o9A==
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr3882671a91.29.1794007366481;
        Fri, 06 Nov 2026 15:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr3882652a91.29.1794007366006;
        Fri, 06 Nov 2026 15:22:46 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm1010142a12.15.2026.11.06.15.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:45 -0800 (PST)
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
Subject: [PATCH v7 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Fri,  6 Nov 2026 15:20:58 -0800
Message-ID: <20261106232220.47602-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: aaVCS65NYOPkOgmMF3Xq1DNNV4V-hv2Q
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee6147 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX7D0oBldQMfOY
 wbXc9yY5HDEcm685LUN1KjqmLCqDLCUbhuvdBgYey6Tsbns7/6TXAuDBqumO16vtRZfhk6M2nMl
 HhJtDHEPZbKvRWaMGQ5gIQhUr5v2PEM=
X-Proofpoint-GUID: aaVCS65NYOPkOgmMF3Xq1DNNV4V-hv2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX1AxTWf+Jg4QU
 11zxzCmetkPMSdnIpdvD24/z0JLCjcPXCUFK/x4hbD3+8nQBWkxk9Y7mgjkMnwLq+CwGno8o0cf
 +YCPrGf8GhBWchOLsDW9JnSliy+xHUebZZGsmk5EmB0LZuZb2N0EfcnDjidiOQCcLQWJADVkpMi
 DzHcTVGyPkkMTm5Saya190Kd34RmYHvxQekQwOIoVikYfDM3w2HhC/E51g+TgIIHkq3+Y+h7WOi
 EvkN1BvhBwFJVW9qHOZTBaxYXKtNPS/49uYc6D85wXrbrtNnOc76P+7MtWWNc1H9mZn94yajqnX
 /r8z6yAF92jfHMHrvLZkkZeBEmD69gRPmI7MgST5SbKsJlPdFKcCjzn3FnXLz8WiwhI+oaGfroA
 RyyDMYm6ahaaA2+eE0VR1Na0Ln92RDyz/oJpmxy0+fEvK71dgjz1nE0q9wGm+31E4jb/e0jOpgn
 3Y3YXJubEOM31Nerl4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a29f8149493c..59898b49a201 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -373,6 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -392,7 +393,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

