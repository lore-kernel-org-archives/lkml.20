Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1001C37646E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639518; cv=none; b=TT1oBhHDrRLKpL19R9Eb3KXOT7q+E4vmPDr7vy1aoWY4nxZzCTAZnndp7wyIa8aqyV4ljHO/MdZURXTuArr1pTW3D7fvuQg8qEkoqD0I2XJqa14pJ/vI7gqjBfjgYAPQgelQO/LOTcRRnSU+L1VSE4ZJwpESYq07BnBH2kzlkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639518; c=relaxed/simple;
	bh=+CKkvbiJj9FuNx/24dObi00QtFMeoykrjQaYCce+6/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4Es+K0AhHJTGT8UKDFJsijpHyqawlfHVsIE2Hj3iGegqPpJHw4jzj9o54XNIIGZ/BcfvIAte+8MzVR4ttR7BAGhcg/JwVZQGFKhcU9HzJFwTkKu2omSxEjotRDWUiWfG260hXJtDLpYb8p3x1pqXX9yjvUtm2Zv1pjCX31g/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tcgrjq2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxEVXOnH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tcgrjq2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxEVXOnH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACVIBj445202
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zWhe6RjYL57QfE53DmuiX8KGjzDUtqFTFh76kpPJSM=; b=Tcgrjq2IZYJIUMAF
	ypYu39+aOM20jB3x8KV5xA/ZUqcOYHTvqeK5TxWyR/CP0XcK6efuxaRVcGCSAQiR
	gDWj+gdhnFpjhX6jN1v9NfVIgX8uhRj60vCbJ/S8UVExWwJdkF3QOL5FsFonyDZr
	xOP8qGlv/h+RI3HJpI8tXZZuAjiCJQBQ727qFRhjlx3UBszhD+AOcXZtwy3EEX7g
	ecLk58qGgzeBrHZWtUU7dlVFNpCaRI+n4JprE2w6d7KMKBqnI5+TCt9e9Xh9CAs4
	I/7CbzxXMW4sJunpik35wN4hYrVpjYivzypd1WT8TOef1k5WZCdTYvxDXvt5kKDb
	91IvCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsg5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso721627eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639515; x=1792244315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zWhe6RjYL57QfE53DmuiX8KGjzDUtqFTFh76kpPJSM=;
        b=TxEVXOnH7/y9CQY9ilVzgGwo2iNgozwDInQnTWelq19p8+6XqQ8h1G3bRWQCAQn1zN
         nB282M4eEESQh1H4ODedNI3kA6Vc2DoQ+eEylMVwMNtAD36UOCIojfiRRFIuktFcTpMb
         x/rs8jklAPGuNJbP+WNaIFQBIXcKIM/Pti6kbFJQRcofGp7rrf+Xlr6vTCBNOlUqwT4B
         r/+81c+WiXbcLjvr2q6Vv52vWFDyQhtNmJP2IdjDnnHkCZT2v5/Bb1Sh/82OrkgMfWpe
         GzJjTlJNJjMjEJt94rnLxycF+nFJNZTjBAFZFs1dreEjucnqvk/jehYQhjsAZmUgUfOn
         J6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639515; x=1792244315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zWhe6RjYL57QfE53DmuiX8KGjzDUtqFTFh76kpPJSM=;
        b=OrhLMBWgdNv2MtE0Nlwkl/1zgMaa2cCsRKzfjDwVdL5iBfGn8fzYZsHfQkVBoEJp2/
         gcjownkxihi2edudkJ80jFfALHsnjW7FTF2HGTHwff4vbj4wXIby8HVNl613jXkCIlzg
         OvnPpjSPj8F7MqIEDRySw0ZE/S9iPMWS4wFcUOflmBbasObpwWSO+XVeDNSXH9RL0fsj
         oZ3EAIhKClU6mc1eEC7Wz9EfJ6FG6lh5/2Cwz4rn641sNOIVwYkPZfUo3MTp7Z1S/LCt
         HYArVjV4cphOViLTXrpqKS4Y4vEKnAG87MGnXhPi8X+L9MNHZLgh7ziy2QivQb8L6WQY
         Yn3g==
X-Forwarded-Encrypted: i=1; AKwUvBxwd9mgXpu8KboZpXzdKP/zzzO15ZgnE3fa6mdCTkK767EUr+siZZ57qKBD2g/mftpkAWCQ4A5oRpgIAYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8CPOw27U5Dpdv5GqnP1IdQ16QhOffIx1hHByndAlSu74KSm9x
	EYRr8Mim7ws6Zuuwx11HFwE2NvbI8kriz48RyvWPgaePS2xXhkCEglv343O/Wh1g78dUOVipc6C
	QIS/jjv2WQMPQMMGOCMetrY+016Yx195VA4rceeKSh54u1nkLwwRezjjIJIrnKa1gInI=
X-Gm-Gg: AYBFou2AyLJ6ZG8u58apjRe8Kr7Lhc23WkjjZZYKsyL+MG38cq2S1BXGB/OxpsiZL7z
	6SsrBDNkwHo97X3sM7EZmFMJnlh+gyPqN2gBWW9Hxy+EHHtsLvz7HlHMjvooqzbFoBfMWfV3IuO
	ul0S7nx7hHWdtv2k7QIaVzWIZniv94uxIJgVQz23xikCy5jtWlWZ1LMD7SKrJiBIdsm6s0GjIuH
	bsfydrAIp7a1os/Ix3mfuxKChQ0K4eegLvqIKtGC6rEXPpoa5MBoKMFnEcRH/QAWbGUFocNh1t1
	ttS8wxpfroYUVhptJdkwTyaFdjiqIRBLdiphVy5GIHzO51SZkXjlYpjroZTxxxD7UcD7xdkS5nc
	p+zQJepNysfcjr7wjp/yM1vuPYQ==
X-Received: by 2002:a05:693c:2516:b0:359:2acb:a68a with SMTP id 5a478bee46e88-3592acba940mr223151eec.13.1791639514584;
        Sat, 10 Oct 2026 06:38:34 -0700 (PDT)
X-Received: by 2002:a05:693c:2516:b0:359:2acb:a68a with SMTP id 5a478bee46e88-3592acba940mr223109eec.13.1791639513959;
        Sat, 10 Oct 2026 06:38:33 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:33 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 19:08:21 +0530
Subject: [PATCH 1/4] drm/msm/dpu: keep SSPP priority order for split planes
 on DPU < 5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-pipe_order-v1-1-9d8bd29fd78a@oss.qualcomm.com>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
In-Reply-To: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=1274;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=+CKkvbiJj9FuNx/24dObi00QtFMeoykrjQaYCce+6/c=;
 b=jPzQqRLXY4oSTEb1UtWBhrvdRJwRVZGC3ezh09qGE1dARJaWLDvzvK0Ts3d4KAmNJHKBmmCCF
 8QsUH21EKI2ATdEDGGpjz/2i5zSGDPwRuKhvJuoXBAgHaMzqTSqVLI7
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX5+YTGkjA5Bbc
 Y3SAwGmwk5EMKXN1yFiXTO/6G8j4/E7qOsAk5mAbKfIz3bqXVSYuyuJ8uEg44PPUGomoHFFaT6e
 mAW74JQmUT7+sHGD84XiVA7Ic2F8zKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX+1F8g5P/ImTb
 AhzZoSR+4O7GrZRBqvYcGHc9u2G4tdpJWk1E/9FXia/7Km9NKtVrzOCP7zkQ3pAoZ3IZmLXk+nQ
 NRMu6+u1KvcOFYN/ZB1hDF6vmUbxuUjKYtmI49Lsz867kE3st5NW1NKkxkKowxW2eUiRCamcksX
 kveUGyd/Vb0gU8GyWApExoLteuFQtPAHjnVdBRuaV+E9Wv6ljc+TPFn3Y3xM2Ba8bBayGarjPRB
 5NmC5syo6XwynGdLs6zkLTIV5DNKpglwihqUoW9DV8jz+Zc60bYixKHlHHzOxkswzFf4hVrhAoZ
 QF7AObt9BOsEXMUtf207jVO4MBidBSldTUxK8F8E9CCe9e4t/vIV8wT0+iiqS9OIWBedXiZbNpF
 57rAXAnWH4Xl5JqE48hjP9kLCsrZ945w1hAG6WN56ZIv6ElUxVq1bClKPVj4/S9RYT4v/23VmvB
 tYirWDKcpPVcdcb0VRg==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca3fdb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5Iu11NBQVLxP1iIiDlsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ybXv_STm5HCr1lMwEpP1G5gNRrvEcSLq
X-Proofpoint-GUID: ybXv_STm5HCr1lMwEpP1G5gNRrvEcSLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100054

Before DPU 5.0, the layer mixer places the higher priority SSPP on
the left of a source-split pair. Priority follows the SSPP index
(VIG, RGB, DMA), while allocation prefers DMA, RGB, then VIG.

Swap the two SSPPs when the right one has the lower index. Both are
reserved with the same requirements. Same-SSPP parallel multirect
already puts RECT_0, the higher priority rectangle, on the left.

Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1a471cdf767b..fe43ea9ae864 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1245,6 +1245,10 @@ static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
 	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 
+	if (dpu_kms->catalog->mdss_ver->core_major_ver < 5 &&
+	    r_pipe->sspp->idx < pipe->sspp->idx)
+		swap(pipe->sspp, r_pipe->sspp);
+
 	return 0;
 }
 

-- 
2.34.1

