Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657075;
	b=Xp/6bukV5pcz072Nmxy1ev3NccxIG9zE9LUNaK3EI1DL15zlsrLVDQADxNnJAP2LwbwH
	 17/1fee13fHvwGLn0hzqJce8KtK3FKmdhHPy9XoazhBS3WUINpNwFTD7JdAvFBmj8B8dE
	 TLyEsLJ7Hs/DjM/NWEqRIzHhOlMY2NqhenGVMI2yReVtvQFwu+6PeY7w3qwb6dUQFfz4C
	 Y+elXugx8aJqcne+pzCGT+Kn73W7scHbIpol1AHw17xg15/c6IOVar2d/NwqapdMKlm6q
	 1+cni11XI23PpGc12wMVMAq612cfa+0LozrQ0zUBY7fqEDcaRhQ3RB9/A50gf0LkY/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657075;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7iwNbSoHb/pclbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=;
	b=DZa2ilAmMUUH+blVTIGF1ebXtli43gL3cOtEt10rNYyefE/TUjvBvIGy164GEeqVYv2l
	 PuEJK1YjYlu7lSAbw2DNp6MnZEbiri0d4+q6VRCO+jyL+d8iiQrFQ2JYxQe8ZP/Fmawd2
	 sctt0DGkpkOAbsRiCUoNxdq81e/TAXGcIdOV39woEi2hO7XyvWDU1PwJzR1sDaTcbUmor
	 VTTTdue3YAzOCTb5rl81g5goKIz+HJxtIHvMWFkMIgqDiLHQY4k5Lsa1ONbzBLODsiXOr
	 2Tt66K0DcTOUYOfto/e84NbD4A4UVGs0bpn93QkCUVLXBIriU8TcrMN4MNljVS6p7Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3vt6U8H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wl6GJHOa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B6E606D80A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B6E606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3vt6U8H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wl6GJHOa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K67St3292591
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7iwNbSoHb/p
	clbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=; b=U3vt6U8Hpxaew0pjCKdmIopp8+Y
	jlIZNIX5Qg4I8Rls0iF/euhoEFTs/FmFPg9lqyXZPsTdp0KqObEhp+zJGdzLOXtR
	BYkxJwCwcq+DVVfLtMdXWK4KDOVzxb5RnJnaOYX5zEDq70eidltHtXBonKp8T2yH
	oG5aIXy+DSGqbx6CDE6PB9et+M53gaBfHjqUwW93Z3W6L5t52EP1hYgdCpSq+cB6
	vTFS6LvtrX1yRDCEElYuIjm7/UUh/1ASdbYRJN08+XS2+9MpwDN1G2lf/gwRfkF9
	vw2mvz+doEGGYl41j30F+7gFYwTAfYjcAmUT8eNc4Xs0XYzJkFZjQlgRAUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07egp6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9d52f684fso34991905ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657072; x=1794261872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iwNbSoHb/pclbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=;
        b=Wl6GJHOa+wUPL9B0mzXlNO/0qEggVsUPZB4VeEwILbv5vnNKlGVJ9uIquLeru8lJ/v
         Z/oSRyFGHY/X1TlFfiVWe8S6n5HjQp14eEtBoffoYfjU6po2oyPQqae7UYUkCNNenOeY
         11zkLpVd8fqR8jwk02YMpx+NqnRBl8Q/9TV4vgjDQ20o7x8ezK1PAT0lZ4Qxqj1bH8pH
         htJSqzVwtfbAfTe6AxPQ++CjA9+ORcpQAwT3LdDz3qqaZA3Fwfd9KmtciMK6jsHurA7P
         FnqjteMNJkNDWMvvhQuWi2UqtsZN1dHIXMFxWkw/V2fsQXmDnF0e0msk8cbWd72/7tmB
         P7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657072; x=1794261872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7iwNbSoHb/pclbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=;
        b=L7poU7M9RvAyszwZ7lAgNFGpu0pYJwIpLJaasHIrEPR1fynBqRN6xBVkKxt6SLKgcT
         k/7/0KXE3QXlUsQ3wzhvzMcvHzTcr2Zv9KuVBbGD9NlazEATEKjT5Sc06hKt+FRlEbG+
         sTtXkxizMPr753MJwc0+ZoqpUl/lasPd3yswoLvsxNiFAzJY13P73y0wUhefE4+bjoeY
         YhTMcTWyxFKSD1/wbh24PDWu9WZfAG4UCrKFeOPUyfiL6zS4MTuAHq/MKX/J8hPSWjou
         ECsqIFb6VPrLlOSQGuIgoDXgfSqqKZrGmd02M+r4spN4gM7ZZG9VRHBNytTtJfIQcGe+
         oB+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKKTV9fSAc2dtVoPR0GgGrqzI2fbIIZ0RHJdTM27hsNDUfqTfYL7xYfwPr+OSiBMteLTpplmTTXQt8MWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vz45aGRAvwqNjvtR04ApP/g3jFcVUc1G5+bzfgFhOIvHrrcJL
	GWhws1/g5YYZ96Ih4XgM8OOS84Yl9qPH1qoZdYKqqBdB2KiRUlwII116kGNbT+49obgpP4maou+
	WxGoDRL/RcJWLlJ/re+mpwsm+hQK00VTQniMd78R/Z0aZh+FpR0HVWXOgfUQT2KgIF7s=
X-Gm-Gg: AYBFou3EDlFJOKJKKbSfx85X6eXnQjhy7Dw6s6bpwbb7MlwBytdAcidWcAg8p9+/fL/
	XC3HpGTV+C2XLxkgRjV0miaxq7/oOXf+DvbcG8qh2xUKberCQx5cmSJ5KSr+jCiFEoq6u6yStTR
	wzxtp49elBhCh57luClHY234gN/KaEGCGEgHIPKRMzDwYBQ30yfqB6l34DAz4uuvrVsm3nocCc/
	ecd3YfPWcAr1XgPr89LieR5gdgTbhQKCqvq5TdQjxjmoaZ1zjnHVC+K51sb7+0oRlqTXqutBcsJ
	Q00XDHbnFRpp+yQy55pb7PK186FQY+oN+7TQTXbzdh1FvX7Qu/DAviL41S56EFdZxiT1RCDbc9Q
	xduncxaKasALwW7P8wog4I+OtwU7DRz+Dx1WZCBuZvmQhu5VZyamnZs/uFkCaHzbexh+ySsHVUN
	sNJ+GKPUZAUzBgzCqG0gAm+oA=
X-Received: by 2002:a17:902:cccc:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb364a0091mr102594335ad.31.1793657072086;
        Mon, 02 Nov 2026 14:04:32 -0800 (PST)
X-Received: by 2002:a17:902:cccc:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb364a0091mr102594175ad.31.1793657071621;
        Mon, 02 Nov 2026 14:04:31 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm32390475ad.53.2026.11.02.14.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:30 -0800 (PST)
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
Subject: [PATCH v5 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Mon,  2 Nov 2026 14:02:50 -0800
Message-ID: <20261102220405.30730-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX/UGTM5r7YmMy
 V9Vqf0zBUlyHYXnp9pAzNsn7Uai/URYtF8QtnSdPp6Rc+QB8a19M52717g4trYyQMw7N2cBeyhN
 YLNNXLQAwaaabiPZ/9LsPZvsaue5+/LEaiG+jA2088r4NBqTaTPNgtziHSV2DCUwh7DrBRVtRoD
 AsPgZ1Y233xyUvkNVJbtJ4FkzDBfRmriarvgBH7GdyL2UE8wDb0UubwZzgR7uaSl4/3wPiNrw/+
 qw2m98LmOjkDDxFqyOABLZGYWnxHEE4WqbLAoosEMcrJXzbqF2ifc2ZbC/wRZKR8gEzrUtCDZ9G
 vrtWsXz6ZuKCkA/Or0lTG9iEHEOMlhwtmuw3D/CshZwrUPfbiL1Qq39h1ZhX//A7OMvJ7ljotMB
 bNFJ0U3ciYD16OrHFgCYwTlvcCpq4MtKyeWezhm1WOfjSKKRsLELagSitkyva3UJhehZc6QJVcc
 FIO7xFzRmHHcxWiIKAw==
X-Proofpoint-ORIG-GUID: Sle2Pxx-gwNmbU3Ag5_W8iNNi-_p8pB3
X-Proofpoint-GUID: Sle2Pxx-gwNmbU3Ag5_W8iNNi-_p8pB3
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae908f0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX5DO/P6z8J7gR
 nm2wpBY6rQSdMN4VPJKN6rc4+aL/hvx/+w6WIfQSZQQXQLTVv+pqkhp3S+Slh2yiDYfeMINTD7m
 PApnJN9M1M+Xgy9cGAp0pKc5KSdZ75U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

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
index 6b299bf1000f..59546fc636cd 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,6 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -389,7 +390,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
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

