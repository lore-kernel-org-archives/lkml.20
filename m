Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777F3496D36
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946425; cv=none; b=szcELb5p0Sy6v3STCq8106B0NOx7IP7oYfxiagK0+rTg5xJwvS/dg1W2NrD0y2NRjlja5IOBsyyd/6qINkgDRX/okVNClI9YgFikPz0bi08JvSOY0H3UgiEh+HpZoHyLNdikI9sJEQWDKZ8nCfYpGI67nfuhzscnl9dE4DPnQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946425; c=relaxed/simple;
	bh=+5GIIt20Q3aLB8bSV44atJq4TQmo8GHA24TKF7BxpuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sixOVrq2gIukieOv3OGhdHV0bRiLxRE29qn020F5DxVRu+jgY/YI3WXi33Y9s0YOhK/aD9d+KE3B9tYDDbvf55DGujg9vkhpQztXvCFoElIKpTeP/UmCLBrnueTDbUdo3zyLXm/uLRNpuD7xBnLbAd8JUV9WE+l691Yar1zMd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7nsCaO4; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7nsCaO4"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d7111700so1336098a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946422; x=1791551222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DY2cwQpDJccuyfdSvxswtfH2eyWbZEDW7sPjJNa4T3k=;
        b=l7nsCaO4mF9NI93mpB2LEp6EM/NsUOnMJxU/XpB+BhoBKZc9IGPvK2lsISZm0xW3Yy
         UaZs3nYcpLsrscfoHIpvZ865oNfu/g14f7MiYGjuqG6oT01zh+bPlBdUd9C8Wiiq5/Ff
         c5eIK3lkDQxVUzY/Z2jlgS3nbw8kRruqEJIMEcQJjqauVMuLbMxhZFYDuEy4OwYMJyUG
         lyk7401OmanKoGC7ecFvyJc1HyBVxleMKw0lmyUs/N6fGPAoPGCCB3NhPPDLm0q/roxl
         9NAezPow5TTxLtM1Tcb/XIUgdB8/AK6nLX+V77U6qRKclbg83Qard2SxAsu9enUuv5ZZ
         m9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946422; x=1791551222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY2cwQpDJccuyfdSvxswtfH2eyWbZEDW7sPjJNa4T3k=;
        b=kweXOPqbt0w0KtJlr+KtIx0yXYJnsyo0pq9x55Wy97lLkWHrWKBXK94ncUuXkhcRfB
         H7fDIMh7ucx339s1m5in6VNLGxHeqGvvrfXcgf1u8mr4m+Z7MFFLz4CNCXwxwrr5J9t+
         /nioMUD4j9AKSbQFT/L7T+PV4G4obCaIklOx0/uK4ei0fH+lQzfzWd8E4+UZNXKz/aeL
         HHs5yrLUPGWnNLDwZCwbGVqUtSdzlcxkgIo8TjI10wymRNTjOqqGprRmba178VUJiKEl
         XL0asksiA2Cr6drkQUtRO3Hf5QH3hzIjifMWDF8Joavp8B+YmuUrDDVo6SEdaBLngHRW
         lFbg==
X-Forwarded-Encrypted: i=1; AKwUvBwgpm1Z8DKNBg5F7+XQAQllcoZ8DE12n09DMVMjQSAAFZR+/CeRS7aaS6Mth2gqMGn1lxzzeAov/tO3ELw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOznjZPgLUyqRH9TNC2tZuo42fj/33Z/01UWzPszoD5Fq/9x7k
	zNe4U9u1kLu76PHw0TYHzwb74DU2a5pN8UUaIzx5HjoCR/hW4LGtr29d
X-Gm-Gg: AYBFou2Uh/UKMueg5/USCakD4KDsW46puIXhrVtyQ2ITvpHy0L0nbzTaTxSU8VF8XOA
	sOT/ZrDPYpqkNTsYNNI4eX14DDfnAVzerF9mPBlyltMHSzVe2zmu2kFb/F7bU0BBDxNXcRH437g
	9deQb6V2L0e2KlNo3Q0MRUfdgs5/N+teAINrhkAxRg5vE5mVemxTjr/a0jsROef0aUA+smXZzMY
	nCAzED1BwJB1ikbb9CqeYz1q4kT+wJWIEgVpTaTL13RxOR4Fmkq8qKOu9cT88PDjXHn79LWOUWz
	7Tdom7J/Ftvkyc+nCx2xBnELrQvl0QaC76tX/xheaKTZ46bQ+JQ0TMYmGrNs1iws3SgSXeQm7m7
	xBIMX5VQSRU4b7OAncXJJe2GRTRRizmgu39q3EfEVkC3wS0MyrAeNudVu0I6VsccKU6OzuF+c8X
	qJNIQah5eDgLx9dcSPZMcm/+Ng35b5QNmSSvdIrkxFv1aG4NNEE/xgtlt4WeG3AjcKDiWg6csUA
	O5l+jCm85nr6A==
X-Received: by 2002:a17:90b:4acb:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3a6ce95932bmr2677617a91.26.1790946421716;
        Fri, 02 Oct 2026 06:07:01 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88e4sm4474906a91.13.2026.10.02.06.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:07:00 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Subject: [PATCH v2] drm/msm/dpu: compute the CRTC bandwidth from the state being checked
Date: Fri,  2 Oct 2026 22:06:56 +0900
Message-ID: <20261002130656.50577-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_dpu_core_perf_calc_bw() is called with the new CRTC state but sums
plane_fetch_bw over drm_atomic_crtc_for_each_plane(), i.e. the planes
of the committed state. When the CRTC is re-enabled (DPMS on, system
resume) the committed state has no planes attached, so the check
computes bw_ctl = 0 and the display runs without an average bandwidth
vote on the MDP path until some later commit changes a plane -- which
may not happen for a long time on a static screen such as a lock
screen.

Seen on a Lenovo TB323FU (SM8850) through the interconnect and DPU
tracepoints: after DPMS off/on or s2idle, dpu_perf_crtc_update reported
bw_ctl=0 and qnm_mdp was left at avg_bw=0 (peak 800000) instead of the
3728793 kBps voted before, until the next mode change.

Iterate the plane states of the CRTC state being checked instead.
drm_atomic_crtc_state_for_each_plane_state() falls back to the current
plane state for planes that are not part of the commit, so the result
is unchanged for commits that do touch the planes.

With this, bw_ctl is 3728793600 right after DPMS on and after resume.
Only tested on this device.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v2:
- Drop the code comment that repeated the commit message. [Dmitry]
- Link to v1: https://lore.kernel.org/all/20260929130633.977-1-26rote@gmail.com/

_dpu_core_perf_calc_clk() walks the planes the same way; it is not
touched here since I have not seen a wrong clock vote from it.

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index fea173e37464..9fa55904dba1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -54,24 +54,19 @@ u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
- * @crtc: pointer to a crtc
+ * @state: the CRTC state
  * Return: returns aggregated BW for all planes in crtc.
  */
 static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
-		struct drm_crtc *crtc)
+		struct drm_crtc_state *state)
 {
 	struct drm_plane *plane;
-	struct dpu_plane_state *pstate;
+	const struct drm_plane_state *plane_state;
 	u64 crtc_plane_bw = 0;
 	u32 bw_factor;
 
-	drm_atomic_crtc_for_each_plane(plane, crtc) {
-		pstate = to_dpu_plane_state(plane->state);
-		if (!pstate)
-			continue;
-
-		crtc_plane_bw += pstate->plane_fetch_bw;
-	}
+	drm_atomic_crtc_state_for_each_plane_state(plane, plane_state, state)
+		crtc_plane_bw += to_dpu_plane_state(plane_state)->plane_fetch_bw;
 
 	bw_factor = perf_cfg->bw_inefficiency_factor;
 	if (bw_factor) {
@@ -131,7 +126,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, state);
 	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	DRM_DEBUG_ATOMIC(

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

