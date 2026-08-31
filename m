Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BD3115AF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164257; cv=none; b=XNqWqatPykbuHYVlzPC3BCOW6wNN6j5HXNgAUMpwq2YTBo1FEkJDMMYTUIdV2O5qJCxzL2lyVaqwKkHvytAnEIhpXJSuiyIpyFutc9D7Q1xwEAAfLSQqDegvuj8qQUwjEQyarU203LfSUtnMOzlWYUdUTGdrTB9//Ngsl5LgkYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164257; c=relaxed/simple;
	bh=t+Q1qWhln3sjCSLlRA6F/QwwMt4akMg3L+tdEaits1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o0koacILdV+05XSBwoGEI9gAQDRQ+cvWfNvmyEccYrgQ/yWQxXcBpObFA/gr58raiPTeNYWnB7oxUFvnTYwU38h7OYEePRTa9NEEFsbEv+S0VHoLEUY/2FXL7gKpWrURalB0Oy3SFfyil1lueGsyNejo6un+Uvg6X3KQWCL4acA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Znhj7JfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/URx7Rp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Znhj7JfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/URx7Rp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xK3t2460302
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HX0TtP1Vb/NHM85LfX8GMg
	ydl3O6Uu01GFUhUZo+Tjc=; b=Znhj7JfRtT8Z3Dyj82nAC65teE70KHQmv2+ojn
	gxknWyG4QVrh+mtVG73kCigJknPS5C/gIAL0bIyyAZgC/IINXnWXB16aCwwLNmR1
	qKHOrkOqbSYiRJziVtSFVcqXirX9XydepDYCoDCRtZ5hobIUrNM3r/GAEF7in1+J
	Viq81GYD2Px3ZABHZnJggWo415vfE6d8n5LMvTjU10Bfn9/QW0oDRlHeQI6caHKs
	7AGk0H7Uh4G1VOkRlLmYwtdi7SyROWVtRaJyrtbJaGIm+wYhtlRfhb7rSSRyrEaa
	F70sjiWwJAq2QoAqMZ49VsoL4nPwZv/B8olzRMJdp/YL1LKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r6vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:17:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so416122685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164254; x=1788769054; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HX0TtP1Vb/NHM85LfX8GMgydl3O6Uu01GFUhUZo+Tjc=;
        b=E/URx7RpjUNPkj4sUCa/g8FTKy5EGF59nB9QFTI/GGlAfPgAsl8LrBgIDHve1Pg8vp
         9kIVHfkrU7co/pOco5cb84/9UslHjTRYUCHpsN8eZDwFTS6ysYv1PCKUCF3gr045R46U
         Y0c46bW+XJzytEUpTIWiuSpm7IPnHrF/wjJ5kCwZvA6gXATLWLEvIwTF9WDjNtm5gxvc
         AFI2CBY8PYZ325I8uxy/bb5WXcSe4PDup6cSBnLWRx5sp0IymG72Tj957gFIpgAadUhi
         uGqBtr4HwOBMB21fwHHjNy7CvRhettTYVhNV77EllHXDaNELZcLEqqs4Ci3YtX5x+JbO
         5jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164254; x=1788769054;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HX0TtP1Vb/NHM85LfX8GMgydl3O6Uu01GFUhUZo+Tjc=;
        b=ZHj9tROK3ylqWGPKwJlCk/oIdrZTWkQGAbdxoHtX2RLcPZyigQyBVSx6+sCEsvpkgE
         8+l0JQU5r6Gcm95WUtaTDt9ppqA0A0CJ0aQy81MUpVjT8kx0iPYJqir+9L6VE85bf7/v
         eFAD3xpkuJG+LP63p3g1KYF4JN/nwZzu7I/rZtZk1soECCMYaql/A1F4W9SxQqX/WA4S
         YoSWuDoy6XjfIh1sKo1JvkA/qOJdurnYrHcdqHJVL7bgHblbfsFDRWXcXoIBLx4BKGLA
         f5fnGcZTfbEmBgHPAoLLgyOtNh+TRfuU+cWAwrdGUdeaaAiFies7149vVcH8dbddxPKY
         oDdA==
X-Forwarded-Encrypted: i=1; AHgh+RrsDVs1KcZSYx6Le5AsYT2TGHd3CUd3nYI7JGlOcb0VJAlM5CZTdoXVBUo1Ac6ixIE5SQzHYTMusWz6fFU=@vger.kernel.org
X-Gm-Message-State: AFuF++kdEVQQEgEOH8AbVMpcIPi8ZCWtA8wTjKjN5ZX3yBWjiO5fV8Qi
	opCs0mfQ6Btlgf1cVjVUR+kjnuYpie2yELCGKHTXiRmeDFxQX4xU5uCO82UsvJKU2u4zTGoduwa
	ehb/1CRmyRc2LDaoQlv+w1oe091kCrBNub8wJOeBSrINzQrGpbUD48gKbwI1G9ikvv0Q=
X-Gm-Gg: AR+sD12BWiwtN/OfNmPu0MYfX1ANShM768lsroBeOv6r3GweLWStgYvBlkdy/PYLZIY
	L7RKiN+wDTCmlb3pemKPxLCjSbC7TjneBZ3yBawgJkzgWQe4s3oPImWPZTCORbM2BFFgafloEQp
	ojggzLI4puXT3ky5gYwGBBjtVi2djHotN0ZD7bOvpPa7iztQvXPllrdZgG/n8neQjpm0l+3e4DR
	sZfG5w53kdSWCxI6YSMdwfyv7VA4TS+Nw69FsaWn+DuK93a6cGVaBjbrGemVi3Zl0VkZJ5QKKc9
	yZtzccy+m6iizhZ02J6tyI/AwJjYqA/ZMsTpE0eSqRVdQ0Juln7S6h0rKfhbtQrH+scZvMlAoWZ
	k+FP+jT0OfKFmE+PkLNCGQgFVHxzjEFvUc7ys27CyL6uUjPXs2bNXhEoi/s3HxJ4=
X-Received: by 2002:a05:620a:630f:20b0:937:3a1d:175a with SMTP id af79cd13be357-93913794454mr2100549185a.3.1788164254027;
        Mon, 31 Aug 2026 01:17:34 -0700 (PDT)
X-Received: by 2002:a05:620a:630f:20b0:937:3a1d:175a with SMTP id af79cd13be357-93913794454mr2100545985a.3.1788164253378;
        Mon, 31 Aug 2026 01:17:33 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v6 00/29] drm/msm/dp: Add MST support for MSM chipsets
Date: Mon, 31 Aug 2026 16:17:17 +0800
Message-Id: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI04lWoC/23OzW7DIAwH8FeJOI/KGHBIT32PaQc+3BVpaVpIo
 01V3n00PUyTesDob8k/+y4ql8xV7Lu7KLzkmqdzC/TWiXjy50+WObUsEJDAKJBjHWW6tG+W2io
 NgdgFZ0QbuBQ+5u8Ne/945sLXWzPnZ1MEX1nGaRzzvO9YAyE51N4A9Wgj4xBib2NwHA31SbNij
 SQe1inXeSo/252L2bBXJy1GggwIVrnEvr3DVOvuevNfj627VjZtsX8C4fBPsE1QyTlMAyg8mhf
 Cuq6/5g9rCDkBAAA=
X-Change-ID: 20260410-msm-dp-mst-35130b6e8b84
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=9704;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=t+Q1qWhln3sjCSLlRA6F/QwwMt4akMg3L+tdEaits1Y=;
 b=ooWIYyJOLoQg5UH59drn28lbAvPscbzaSpPBKc6nM1sPlCs+IXEzog3QWzNE+gwUAgcJp9TN1
 nu36N1iyJBGCkAh+6AZsTKV+QlKYW3/0IYme/fqywdpcWqlub4Sb3W+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX8c9gDIwoEsei
 OMjRB9JFSUT9885zX5S53LVQLqmguC9Aueth5c23kCh7ClJEorYC97jQCO4qymYnoP/VIB0a+ci
 hK1LzIpwahTcfSUZUU5guDAJlS3QtzI=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95389f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=HzqZzwtbLOXzCu1XSVEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XOVzKKWpkZEjvtF2z7mhr6xShgh9ycgd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX7Tm69s1PZnQN
 JtT1O5YaXEgfxedERh4DLcUWto6wNPR/a6RNMdU5toObo1YRUQZrBvTE2pN5ZUc1Jv7MA302q9I
 jCmQAkHX8RXs6Igc/jnwsYDq7xsstPKxM3cIreuVewmp1oKX3A7Vyttqe6wGphK8HXzgt7TvqmV
 gcXSnHDCOLm4qalisc0SyAANt117XLCwY7PFRWq9EwpTxwcKDusIseLqjsNyeZhR6mFko0dCXrp
 fpDciHdLcU/bjwll8n11TduNxwOGMV3m/AXHlvG/uLQgyBXnpoPwtxkfdpyD6Ctki7VDD2XgS9/
 ZsthlW50X3lOl4s8be8tfjBi4XLGLTlLusDsNJVZiCCG+rH4KdoferZ0So/stdWDj5IRbEUk1Kt
 fHE/8sHEPNi1/EbUxSEAsl5dewZyVLOQzt7t0pePiIywwe7SYQn0gg4G5uBJ2l+I0FUll21mbNG
 +1yBl8JL7APyXKDfnpw==
X-Proofpoint-GUID: XOVzKKWpkZEjvtF2z7mhr6xShgh9ycgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

Add support for Multi-stream transport for MSM chipsets that allow
a single instance of DP controller to send multiple streams.

This series has been validated on sa8775p ride platform using multiple
MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.

With 4x4K monitors, due to lack of layer mixers that combination will not
work but this can be supported as well after some rework on the DPU side.

In addition, SST was re-validated with all these changes to ensure there
were no regressions.

The prerequisite cleanup series [1] has been merged into linux-next.

Type-C MST support depends on the DRM IRQ design which is still under
discussion, so it will be updated in that series first and folded into
the MST series once the design stabilizes.

Overall, the patch series has been organized in the following way:

1) First set are preparatory refactors to decouple link-level and
stream-level operations for MST readiness.
2) Prepare the DP driver to get ready to handle multiple streams. This
is the bulk of the work as current DP driver design had to be adjusted
to make this happen.
3) Finally, new files to handle MST related operations, DPU encoder
integration, and SST/MST connector state management.

Note:
Validation for this series has so far been done on the latest linux-next
on LeMans, covering both FB console and Weston.

[1] https://lore.kernel.org/r/20260528-dp_mstclean-v9-0-f094cea8ca24@oss.qualcomm.com

---
Changes in v6:
- Rebased onto linux-next 20260828; drop already-merged prerequisite
  cleanup patches.
- Reordered patches for better logical flow.
- Patch 01: Also move power_on=false into display_unprepare.
- Patch 02 (new): Split from old patch 04.
- Patch 03 (new): Split from old patch 04.
- Patch 04: Squash num_pixel_clks into this patch.
- Patch 05: Use loop for snapshot; skip inactive streams before adding.
- Patch 06 (new): Split register definitions out of old patch 04.
- Patch 07: Rewrite old patch 04; replace stream_id special-casing
  with transparent msm_dp_read/write_link() helpers.
- Patch 08: Fix REG_DP_MST_ACT register placement.
- Patch 13: Drop defensive start_slot bounds check; rename
  channel_alloc -> update_timeslot.
- Patch 14: Guard link training with active_stream_cnt == 0.
- Patch 16: Add locking annotation; group link_ready with status
  variables.
- Patch 17: Drop redundant stream_id >= DP_STREAM_MAX check.
- Patch 18: Consolidate msm_dp_mst_attach_encoder() and
  msm_dp_get_mst_max_stream() definition, declaration, and usage
  into this patch.
- Patch 19 (new): Split connector/topology callbacks out of old
  patch 23+24.
- Patch 20 (new): Split dpu_encoder_get_intf() refactor out of old
  patch 21.
- Patch 21: Squash stream_id condition; reorder before MST encoder
  patch.
- Patch 22: Use thin wrappers instead of renaming/exporting core
  dpu_encoder functions; use suggested for-loop style.
- Patch 23 (new): Split atomic stream enable/disable/check out of
  old patch 23.
- Patch 24: Add hpd_irq_lock; use %*ph for ESI debug prints.
- Patch 26: Defer SST-disconnect-on-MST-cap to new patches 28-29
  to avoid bisect breakage.
- Patch 27: Add comment for clear-before-write DPCD sequence.
- Patch 28 (new): Split from old patch 14; handle boot-with-cable
  SST bridge detection.
- Patch 29 (new): Handle SST connector status when MST is enabled.
- Link to v5: https://lore.kernel.org/r/20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com

Changes in v5(fix comments from V4):
- Dropped early refactoring patches (v4 01-12); restructured as
  "move link-level teardown", "factor out _helper variants", etc.
- Dropped v4 39/39 (platform MST stream list); use DT pixel-clock
  count instead per Dmitry's request.
- Patch 02: Remove artificial max-stream limitation check.
  unify register naming (REG_DP1 vs MMSS_DP1).
- Patch 05: Calculate ACT wait time dynamically from mode parameters
  instead of hardcoded 20 ms.
- Patch 08: Replace start-slot loop with direct math; fix commit message.
- Patch 09: Add locking annotation "Must be called with
  msm_dp_mst::mst_lock held" to msm_dp_ctrl_push_vcpf().
- Patch 17: Rename prepared flag to link_ready.
- Patch 22: Move drm_dp_mst_atomic_check() call into msm_atomic.c.
- Patch 23: Replace bridge-based MST DRM model with encoder-based
  approach; remove redundant bridge layer between encoder and connector.
- Patch 24: Add drm_edid_free(); add FIXME for bpp negotiation.
- Patch 25: Use dp->plugged flag instead of link status for MST plug path routing.
- Link to v4: https://lore.kernel.org/r/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com

Changes in v4:
- Fixed most comments from V3.
- Rebase onto HPD refactor V5.
- Fixed casing/formatting issues, for example: “mst”.
- Drop .mode_set() and set_mode in .atomic_enable().
- Rewrite commit messages that are unclear.
- Use the same API for MST link and SST link writes.
- Use the new drm_dp_dpcd_read_byte() / drm_dp_dpcd_write_byte() interfaces.
- Remove some unnecessary payload fields from the MST bridge.
- Remove some defensive NULL pointer checks.
- Reworked the patch order to make the series easier to follow.
- Add support for more platforms.
- Link to v3: https://lore.kernel.org/r/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com

Changes in v3: Fixed review comments from Dmitry
- Fixed lots of comments from series V1/V2.
- Rebased onto next-20250808.
- Rebased onto Jessica's HPD-refactor branch.
- Fixed formatting issues in commit messages under changes.
- Removed unnecessary one-line wrappers.
- Relocated MST-related .atomic_check() calls to their appropriate positions.
- Removed the logic related to slot checking in .mode_valid().
- Link to v2: https://lore.kernel.org/r/20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com

Changes in v2: Fixed review comments from Dmitry
- Rebase on top of next-20250606
- Add all 4 streams pixel clks support and MST2/MST3 Link clk support
- Address the formatting issues mentioned in the review comments
- Drop the cache of msm_dp_panel->drm_edid cached
- Remove the one-line wrapper funtion and redundant conditional check
- Fixed the commit messgae descriptions of some patches
- Reordered the patches and renamed some functions and variables
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-0-f
8618d42a99a@quicinc.com/

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

---
Abhinav Kumar (16):
      drm/msm/dp: move link-level teardown from display_disable to display_unprepare
      drm/msm/dp: introduce stream_id for each DP panel
      drm/msm/dp: add support for programming p1/p2/p3 register blocks
      drm/msm/dp: add support to send ACT packets for MST
      drm/msm/dp: add support to enable MST in mainlink control
      drm/msm/dp: no need to update tu calculation for mst
      drm/msm/dp: always program MST_FIFO_CONSTANT_FILL for MST use cases
      drm/msm/dp: add support for sending VCPF packets in DP controller
      drm/msm/dp: add support for MST channel slot allocation
      drm/msm/dp: replace power_on with active_stream_cnt
      drm/msm/dp: factor out _helper variants of bridge ops accepting a panel
      drm/msm/dp: add msm_dp_display_get_panel() to initialize DP panel
      drm/msm/dp: add HPD callback for dp MST
      drm/msm/dp: mark the SST bridge disconnected when mst is active
      drm/msm/dp: enable MST on capable sinks
      drm/msm/dp: mark the SST bridge disconnected when an MST-capable sink is present

Yongxing Mou (13):
      drm/msm/dp: refactor msm_dp_ctrl_config_msa() to take panel
      drm/msm/dp: drop redundant config_ctrl_link() from msm_dp_ctrl_on_stream()
      drm/msm/dp: add MST stream register definitions
      drm/msm/dp: add stream-aware link register accessors
      drm/msm/dp: add link_ready to manage link-level operations
      drm/msm/dp: introduce dp_mst_drm module
      drm/msm/dp: add MST connector creation and topology callbacks
      drm/msm/dpu: pass msm_display_info to dpu_encoder_get_intf()
      drm/msm/dpu: use stream_id to select MST interfaces
      drm/msm/dpu: add per-stream MST encoders
      drm/msm/dp: add atomic stream handling for MST
      drm/msm/dp: wire MST helpers into atomic check and commit paths
      drm/msm/dp: mark the SST connector disconnected when MST is enabled

 drivers/gpu/drm/msm/Makefile                |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  51 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  27 +-
 drivers/gpu/drm/msm/dp/dp_audio.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 479 ++++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |  19 +-
 drivers/gpu/drm/msm/dp/dp_display.c         | 414 ++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h         |  26 +-
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 538 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  16 +
 drivers/gpu/drm/msm/dp/dp_panel.c           | 205 ++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.h           |  19 +-
 drivers/gpu/drm/msm/dp/dp_reg.h             |  69 ++++
 drivers/gpu/drm/msm/msm_atomic.c            |  14 +-
 drivers/gpu/drm/msm/msm_drv.h               |  41 +++
 drivers/gpu/drm/msm/msm_kms.c               |   1 +
 17 files changed, 1727 insertions(+), 199 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260410-msm-dp-mst-35130b6e8b84

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

