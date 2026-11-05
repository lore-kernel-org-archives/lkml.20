Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911235;
	b=JEm0SGyMPfskjSDKrrQeAuIoDW8RNlkoJXfopUm23XX+IezpggwrdxcYaKByM9RG2oae
	 MdWyI+TCmm0mEfqwuxEQAgL0KzyU3qQpq9L3qVcPuSSbe0CmAznAHeLtD4P8fRbpgS8op
	 ndFJf72If0wB0H3B53byFrH55vsYZAEt/W1LqDd6Fh0ZDeCraTcLOwX+8M9M9lGp6XJMa
	 DoWakTtp0qM1t37SSx4UHkb4jouV6376ecky3U9iDSU/4kTnXkyaon6Og2sSesXg+9bta
	 Pwi2302wuj9uWhnVnTB6yF1u0SI7glS/fKz+/ioBl5aBuJSBzgpa/yvT99gqiaXYUjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QFNvTKwj8PVEttRnGaTT/zX367b+0e2GeEloYfiwPaE=;
	b=cDuD6id2bvEUHXIWhWXkb7oIPPgl4tigJH5rrw8DjYDmqGf/YKtr63493tafKStn9RkX
	 lUrcqmeaNm9+M36qCAH98666qUkbrBbi7odYzVovnLWpre7A+W3LvNa+6IgnfTeFbr3Sz
	 jhh6ox4jkI0Cq3iW9x9zSpfyGVunJ7OUOhXVauPL9B8Kbh2ltLpn2YekjP9K7ydTajO4P
	 /t4UYIcFdEAZsm/R+dc5iLvP2+KofISTjUFicysJxDraKXvQ58dJsygXCbqhdNjXCQQTO
	 A4JG5yLuPz1Z62YABixgQquWUPBTS6YphSfzpx7kL+yzFcDqzXl4/F3cOi4kFuKwcvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IfUFlIF0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e4NuOdT4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93D6606EEA3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93D6606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IfUFlIF0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e4NuOdT4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hed9j924321
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QFNvTKwj8PV
	EttRnGaTT/zX367b+0e2GeEloYfiwPaE=; b=IfUFlIF05D2STh+UTqAZIsMpUGw
	SraiPofKJppu9dZLWFeb6KFG8wNBdLH/6PyfxQHCk9TYYQHRRBKz38Dx0S2VYzyC
	kNI5yFv+mNeBAq/j+t3/j536cqZ1dNVE6Y6N5FCKvDgHs9fpC52wdE/VMFSCWohj
	Q7UjsBLcky8fSm50XCbXVY+s/4yhiJEPV/RXUksFP9BZTqqpPQTPlnMOfubKSVAz
	Bw/wwrLGVYWD3+xQBJ8h1cRYuoZR9ENXyLJ+lTK1EzufY/X2Ds7skwNjGUF4Dp23
	Pmy3mk7AEdRbrZwOChvNYP+Z/b5/ZFg43u1s25POyyJ+3kcKMucCQgEynAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhktsef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf8ea208bso20585615ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911233; x=1794516033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFNvTKwj8PVEttRnGaTT/zX367b+0e2GeEloYfiwPaE=;
        b=e4NuOdT4vAMjfXTUV5i2oL9/ArbHxcGutCLDKMupb/lm19jcc5ogYjMH51HQL8nS4H
         E/Su29t42QHrlT841w0IjVGE670XSTlbiOVoP9qHkADNDNu+h/CUgytS7WBbDYXHwpNa
         HHzXOH0y4KG1qE3ahUBUMQlGe6sE2HI+Dy126cPghdRFOpI5NRSaEGayvKx27C4eU7kE
         OBdRq3T9Ex+bcoQYzcM2tmeHpQ9fhI8yfnJZBZyDsWJyjEw+ojQScB95D6fiK4A8Y5z7
         hy6luuQ49Yx/TWjy2Tli08ADpuSaORb3N5pFnojZWCg+KQh2cx6xifrIaKOngba1xz9O
         2MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911233; x=1794516033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFNvTKwj8PVEttRnGaTT/zX367b+0e2GeEloYfiwPaE=;
        b=iiwk7Kj2HCFVL6VCqoJ1LTRMpN1PwHGkcf23eiT3VxPiwHJeQp6UirNS5Fbbd4+AdF
         VnI4JSvy4aTc30/QI+j2/wur9UrJEmB+B9cF72Y+eXBZzOGeC4LE2r0x3jZyQaBVNNzn
         CHwLyWzCFIoxi6wuNo/k1F5yCqg0jmdQUXCL8JkEKevTkQOz93SX9XzxUuqnxF7pGO5g
         4RQImpleBGcwHhLU4akqIuvD1bVKRIyx/fXeIILtb3RMGMND64ri5TGkBHDdxsy6g/Wi
         4MyfxmzB5crWeb+kY6PxJkp8jqi+qzqlQ5lpDpAiodwkb7F1KI0bhTX6ZuEz+Hge7AsK
         B0vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhnVjQPD+yToZ9mr9wvwHfEqJ4mdozA3C2IOFSIJP8qqRXkvXJA675SrXlPRlwnDVZm8xfGebM55S7cmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uFsK4p8CP+FtIV4hsa3VgokjU6nSAAflF/YR1j4BQRLfwgNy5
	MR8sl8PsDFMTbmIamBqNqsm3TfN1H+qIM3ln50cwA1z9OsArDGOrFOwd597AtRculCUiNj9n65E
	7zceAXS4jDWKwQWBZSuQrfzS99kANOrPhjnUzu5c3u+rWjwNdTCrA2sOg0z6AeLuUOK0=
X-Gm-Gg: AYBFou37pceCIkfxBe4E5eUG2RFi4AvoJPPzSFlg7HrD0pRBwXXJ46p1iAt4bs2qVg0
	kTLMLCJsz8fepgDGBLi/GW4dqaj+H0B/w3QC+Uko8vQnOG3t4IItAyRaPIn5O/vpE1RB15H1dm3
	mYK0sIPD6PFPQgeuzS/tRhWqaSnsuDvzHKkQVJ/VWEWGG2BuTrFf0IFXC+YCd7Ry142g4zeq+jY
	epmQzuhAslLxqlnIoUoYlC3ZaEOuXew9YuC2dTBweyBXEd2VTfBgGF7XhABPL+HCUKacUCws7Bv
	t7SnAmBdHKRM+wiHGc/mXxWhZH+54Zi2c16WJICEW0JPrra43mSlOPXW+MXlHQJ2WorTm4cf8Lz
	IZthLZ2pMlBcG4XoB4tpnor+Fgl2+ZLo/vIfb/LY43zdqi+38pEQ2jBkEY1inwVY9KHVgB4Ru0H
	vifIr018GcKc9leV+CCF8Iut644rmJmoSGHWe7Vd5ddDJAL2gv5gu9u3FApCusuw==
X-Received: by 2002:a17:90a:e703:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b0db6dfb59mr146682a91.13.1793911233147;
        Thu, 05 Nov 2026 12:40:33 -0800 (PST)
X-Received: by 2002:a17:90a:e703:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b0db6dfb59mr146658a91.13.1793911232686;
        Thu, 05 Nov 2026 12:40:32 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm5033443a91.8.2026.11.05.12.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:31 -0800 (PST)
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
Subject: [PATCH v6 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Thu,  5 Nov 2026 12:29:32 -0800
Message-ID: <20261105203057.66520-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX9UvzyxG+yZKI
 dbNedvxzq45qcc3Nj1u280IHlErZW3PUdqxDprDCvr8ofuxIRPj72pLuc+b3AWROGzj8duYhrwt
 jPgzRlckLGK66EMVpQi8v5s1GKrR+nL3D5HatLk51kYNGOUjq0e0SdG6LzQnHbVE7014GDG2M/h
 ucvSZrjmDgfX/lezJ3/rNClp6zCryT6hee3er54o2JmLWcYCaXrLo0fkSqNaMmG/ijFn85hu2UU
 pR+NYJnT5zNwvuW5b/aHTLGvmvAjOx5g0A3EfVjJkuRWwoNoWqoHos9X7zF9aCh+Rnb2Lmiou3K
 p04Gtc4mBkyHXRIZ/kABdIx3c84jghg4aMwmmaNogXGNCc1F9zbseJ38ZuI0m/zM/bF3UPDCtOw
 hQJD/mXkxynIWsTOh2eKDCipfRixdfxStCcg0cYd1Q0DQiaK+iBLiRwDR8tzCG3vZL+yfWg9Dlp
 r4RigYAQEYiybjv2MbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX45SoQNQNHg+Q
 CeF/V7weej8cMLpTP+O6tl1KBROzKqRI8fE6fa/CZcryR78k20NtqSharRA7k9Urfqr6kmZkHgH
 6emU+Mw4Vrv3SL5nIZUoSHMojeiiCdc=
X-Proofpoint-ORIG-GUID: amy2g34fZeBwabCtW6yTMX3BssmAAbSo
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aece9c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: amy2g34fZeBwabCtW6yTMX3BssmAAbSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

