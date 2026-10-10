Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD97353A8E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639527; cv=none; b=Se53+yKEO0MUDY9bq7CqdZu6gbyWip4rjvUNKdo0pk34kWYEX6fO0deYMmFG6tayOxtZLAZVLA2yY4JypE29GdHcJXi99tkiWvZ0EczYE3UKDF8nWInX9G0TX5/TbfopUmsz/RtS/FJZIHSCK96R3vg4LQjrWFSmqEgO8uW9vaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639527; c=relaxed/simple;
	bh=p2JPtZc0aH2VqHHjrjpm5Ky/B1p6VEk1UEgl8YRNRVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5lJFQbWzoDaqsnheliZbk+Ct/o49GpKAu+n2XrtDN+sXd1dFYuCjBeVWH4c2sMGC/jZaHYtPNl+uSNrXqaUN7NaM44VVt7EpK+P37HSubXXGUOFkAGRKhHUABjvCDIgJx8dol8V4WnCjoExtkUQHGJ2bAChVr2+PXw0vLKRmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icTViPJY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZLlvudz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icTViPJY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZLlvudz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUWHA3959000
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVuepAtG3yFBy75PO2yidtbiFp0Pms1pBm5Hoccl02A=; b=icTViPJYJ8oZPqu7
	sF/InkucD+9yOsQPitDkhQM2SG6g54Vqkx5Go2Uu1/kCser23O0MJ2exEDsoK5R2
	x2mMyq0WvCplChqEFNulus8AFRX7MlrGAQ2NdK3GULHGMIUaOSZx54nRpRDnNRhj
	7v0UzFpDvPP5f3w6Qx3l9rPPzqajuK2U1IjRzlFCwseQxUcB9d9miCXega6Q7716
	T4IK82yGrL1iJIHGgKzc696jPyfVDRGSvUJiuzO4QgUNqappOgKGY3CKuV+D2yul
	ztOg5Gwk6i4p29YeJGd4Bb5bqv8vufBehzZbix/KrXnUOAotb3nv5qlSdZ5V81eT
	WlLuaA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9rxa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:38:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35158d674e1so2776924eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791639525; x=1792244325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVuepAtG3yFBy75PO2yidtbiFp0Pms1pBm5Hoccl02A=;
        b=NZLlvudzl7lR6y4TJPkAf9POnKDyYmID04i+qpsJHbV0WqSHUB1TgACmfPgBwwcy+M
         z0WVLTFHox1PUkPHPolQRJAXlId9vEXpO5uV1j0YRRYo1uoESQ0BOoV56HL8BfyZY698
         t/rX9ulE7SS+kuhreMBjcpm/TH/wlldfj2PPL5FP8NcMlQ9TCbUxMmPl6Zj33bNRV8iv
         Q8QzvDLeZyN5k/VbSpbRhPBnrEoZVY7o68qTaU6phTltPM59qI+nkfCugDfI7kbXl4Ad
         u2x9w7NrxIalF0iDso93FwV7bNAGm1ZUtuF/I4TMn6M3GDmjgVFo7vW4Atvn/XYHwgJY
         KoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639525; x=1792244325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVuepAtG3yFBy75PO2yidtbiFp0Pms1pBm5Hoccl02A=;
        b=E4tQ+YE0zQLG6b+UJ1fDsgnH22bAXes8ui+slW1gVnThQ9VXqQC68I1EsbZ4D/HZ1u
         rZfT0CXUkFQQSHHe2X8bLg7HcgXj4NY463W2KAFwnrm4L2lf4mBmdI628d9upp/fK7Vk
         XeviRAddEGmePOKpUv9A+MCmJeZW8uytmLLATgxuJXdlpQo3HndDxdQ33HcXLltWkmzv
         /IvroR5l3Lp8shWF/8mxrbeZ/iVPG7MnnqlEya0FzFUnNVv9/7VX1DIKUeIs+3IAlVzS
         L07oKgWRVXG+nF6+zzLsmxCwoNnvvFqxv37VgxG10JmAJylknpGcFYQRNRAOoUyYa4Ob
         ae4w==
X-Forwarded-Encrypted: i=1; AKwUvBwrtIIty8L23vRtsGTlqeaALcLI2OYjkwiztq/KOc5HNaPj85QOkDRozoK+7puzyNb/agKdWqM/zvgrP/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo3pwWkf/WMJ0DhSjA8sv/jYUFVr5QoOEA7Hl/Q6e0K20MYxBy
	hyFJ50nMWdzrRIrGnJwx3EvjxSEM1kdFhgXMn7Pd5fvapEfaXrkqktk5zeAp3ox7UwzCEHh6eK8
	5PBuE0fW1W1N7S7jifAMBggTw+WKrPGr0u/RtIh7OAYrnWd7gdgDfjeEs2YY0gxnuK0Y=
X-Gm-Gg: AYBFou0VCjy7eZA/7e+k9E/15Rw4Rlc9/LQJy9PGzMKn2KDdf+lQCNeKaReNlN7npPs
	gU17vRnS6yv6zZNgUnRNvPBhm1MqMaW5TvCI652f0Ox7u/+QloRecZzuJpr7Rluxa7Weq7F4v9o
	CbzAoucCcJyuApRZMryuBTMzdlvJNhM5PFIHvTJSbKWlueh3nUUEPwg/456YaV6iEbXUp8bCx3P
	qOusVnaEHfP9Kut4g4MbqqIyDYLVEKcOf/cA6FD30xwy6a3lo7nvZOs9ZupDuBELxnvgNLgMW1W
	vVgcbDB0ZTAmRi2YTAXdkabAgbKDR1eIlnKfZV406ka821KNL0F0Ev8UQmWBT4wlnsY01XSar46
	d7ohHuU/2AvFQeshucJkKh2Lu1A==
X-Received: by 2002:a05:7301:6494:b0:341:225b:d6f with SMTP id 5a478bee46e88-3537dfd8d79mr7074546eec.19.1791639524452;
        Sat, 10 Oct 2026 06:38:44 -0700 (PDT)
X-Received: by 2002:a05:7301:6494:b0:341:225b:d6f with SMTP id 5a478bee46e88-3537dfd8d79mr7074504eec.19.1791639523691;
        Sat, 10 Oct 2026 06:38:43 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm15232827eec.4.2026.10.10.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:38:43 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 19:08:23 +0530
Subject: [PATCH 3/4] drm/msm/dpu: program the source split order for split
 planes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-pipe_order-v1-3-9d8bd29fd78a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791639504; l=2679;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=p2JPtZc0aH2VqHHjrjpm5Ky/B1p6VEk1UEgl8YRNRVA=;
 b=jYsetJYzPBSCcEqXgN4RMOUE3NCK5Z67bnYMoYhCpSgesyRXkRNlTDuYahkh4EHWtdwaU1UJQ
 f383vCv6vAxAQCq2H8sQ4fx4S8mtxQGFlSdMghlO3tTV2BBb2gMsoCg
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6aca3fe5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MVEwI48i6TzORs2vkrQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: oZ64QzF0ZqENRjQsW1vkHwrUql1w2Ulf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX6UTCqlirbNCX
 4etHGVnMhck32+DFU/NyE7x9crfuKc+6Rw5MSOFe+RDuALc+/qKFJczXk8NsrzT0GMG2R4RU1mk
 O44jlwisJ4jzorKhhxkTGZMVc1FnvrxXcPAjPAnzWP/RtTl1RRA7l5zmu5cxe1m/eWUDeGqIHff
 xhrxfJZivaxuX6Z+IDcDOF5wZagCXP79DzEVrxqHeZfGp8FrifTqPtpfAjGC4kpMwwUWTrKjmOD
 5ojMk2PjbPwpMUuOCXZd/uil8yPmTwzOnEWHR7MYFPvqGrsWCAXDB664aH3bneVEaGX7d7QL1TY
 FMZ55C0kQrOtJ5oSByFRugp0rzkl3WaVx9KjmLdXOG++mWK2iyg8GMAoWasCpSJYR66QTpA9e97
 MyIMhTe2630xi4+KAgI45AHT6VaRYB1P4pbgjFJlYfT/fG1OoLJ8i+mwIoZgE7n0XoKGyRosMRL
 LuD5nvocGgGdpCLbzgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1NCBTYWx0ZWRfX5NtoVN1+B6of
 eGiQ/VHox4+JrgKw35gJwY6Fe/IoBWaggtOJHX1HZ8aBPDej4zbXhE/O8Sqq4SrIb0Xs7jF6p0L
 dQk69ddlsVIvDPjjEhzQ9OjLrN/zJpg=
X-Proofpoint-ORIG-GUID: oZ64QzF0ZqENRjQsW1vkHwrUql1w2Ulf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100054

Virtual planes can use two SSPPs when a plane exceeds the single-pipe
width or clock limit and parallel multirect cannot be used.

Program SRC_SPLIT_ORDER during mixer setup from the pipes' destination
X positions. Set the bit for the right source and clear it for the
left source or a source without a sibling.

Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77a2d1f6700d..91152d937ba3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -434,6 +434,18 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
+static bool _dpu_crtc_pipe_is_right(const struct dpu_plane_state *pstate,
+				    unsigned int pipe_idx)
+{
+	unsigned int other_idx = pipe_idx ^ 1;
+
+	if (!pstate->pipe[other_idx].sspp)
+		return false;
+
+	return pstate->pipe_cfg[pipe_idx].dst_rect.x1 >
+	       pstate->pipe_cfg[other_idx].dst_rect.x1;
+}
+
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
 	struct dpu_hw_stage_cfg *stage_cfg)
@@ -443,10 +455,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct drm_plane_state *state;
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
 	struct dpu_plane_state *pstate = NULL;
+	struct dpu_sw_pipe *pipe;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 	u32 lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
+	bool src_split = test_bit(DPU_MIXER_SOURCESPLIT,
+				  &mixer->hw_lm->cap->features);
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 	DECLARE_BITMAP(active_pipes, SSPP_MAX);
 
@@ -475,6 +490,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 				pipe_idx = i + head_pipe_in_stage;
 				if (!pstate->pipe[pipe_idx].sspp)
 					continue;
+				pipe = &pstate->pipe[pipe_idx];
+				if (src_split && pipe->sspp->ops.setup_src_split_order)
+					pipe->sspp->ops.setup_src_split_order(pipe,
+						_dpu_crtc_pipe_is_right(pstate, pipe_idx));
 				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
 						  PIPES_PER_STAGE);
 				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_fetch);

-- 
2.34.1

