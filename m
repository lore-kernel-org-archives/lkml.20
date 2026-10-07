Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB974766B3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378822; cv=none; b=MIHVktiztn1nMzlvMXCz4myUETdYpijLtCZ08P2b6cHc5XrWeNWbYXuIfRHakkRzgiHuJNx3BPfONiVlDPDkFsEK9B4fKs7lG3bp/c17EW7fVMiiaPSVqaa3uyqT3NC9NtokbLGonbvYtwSmhyJD91dgsTrGtT470Nfx8TFALRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378822; c=relaxed/simple;
	bh=Bc2EPc2J1vWRkGDES2rWosgTe2iOIoNiE121XtYVIIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTogi5vXh4fLfTgHlIUWngfCzCnci/SHG5OrcU2LjZHvH6TLJ0EdmWZQz4XIibln/zk8lgcz4uAEMN4+fA4e96ozgTICIY0alxOLeoGWM06Bq3HAIz/+HD50Dhbf+v3Z4f3YnS5BC200Gm7ziPfhdT3Md9SBxTmjkyN0eWJGFvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9IajAsC; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9IajAsC"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso1617423e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791378806; x=1791983606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHXWb/yE7fhA7aF15l/F01Ze1XYkmrkzVKkvR/gzDUc=;
        b=T9IajAsCYClT1SiT+HRskpsj4fOyfewGLuQUhA+T+Gck3L0/7B2g37wbI5y3TjMId7
         eihsIf/qhuKLceH9/HKf9ngHisSstUtWAQ2hnlBQRHMHriZ8GkNzIWeBh/VBYooogmPW
         WgqCZZUjoaUS6ispefpjAAFPvmd16Rz+aKR/jV+8rT4b4rRZU76m7opLDRSFtrybMUUc
         w4v3bdYTapKL3JHHj1Up0TB/SmMn/NPy43ZZsSLnYErN1kEbslyzn2FaIhO1yG/sQyVd
         wzKZ1KV0xCT6XPCFmxhzJ6l42unCcdtSHrh4RSriYUSKt0I6anqRMGinWX6Z6tJJIt70
         ebyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378806; x=1791983606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHXWb/yE7fhA7aF15l/F01Ze1XYkmrkzVKkvR/gzDUc=;
        b=M0pMmIv/+0bAtUF2KOx7kNQAWj2KQKdyJ0hcGBL+Ujd3GIzuwkB8OmWyPtmDfxF1eP
         yEDLWZinfflG3rnCImPBAsVOmR9cq+MGH6qH0q2SjAdSzgOpp3mPdwJlIFzkquP6eqqK
         Hq1gB79lXEm32NrEFtOvIR8I/q+UjjI//t7GJtfTjsHo1t7kwNDxto0hThkAv4v+GtQS
         BOBDZad6LSP7Qk/h80keGzGrPuxiGRttmEH5dwAQYbaNaKfXN9IjcIyVsYefvzpa0/rB
         Cj4ChayGlRV4yS5lqEHNQAk3L590BKKZA49X+IFOLYGksy8+PVx/kt/a8BQ4PeXsMuiy
         x67A==
X-Forwarded-Encrypted: i=1; AKwUvBw17u7ylx5Aoo/K4Kp9KyLlIUc3fzDtmhQfhlJ4c6FP5/jZ4SRu+eOxJlUGk/tkMRXco4uYz24D5PDhfqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEvd1zUVM1Yub9bHOGk7+3+wCZLZtzjiSIOM+/Zh9umVrH7ds5
	3YzqEBTN0RtorFGCcv5a1Co8SZnXgQKW7WlRweyYKp1mqWk94/FtQ7+Q
X-Gm-Gg: AYBFou0oRLpPS7HrIuNWNwKTWG/4J8f0Lf9TGdvDLdgt/DqT/8gLyQnTNn+vEnJrQvK
	Qg4ddUs+3P9kGadbg7MOQVbJqSsw4LeHWyaWkbm9W5Yu8pIpVcE6d5+vUWD8tKOaAymIgcGJend
	Klhka56oXc+41GicFKEfFBXgCHP/3IDGbQmY5lh8rZ9v+CyjijgqA5r8TBbch0Gl43rmRHxkyi2
	DY1X5F4jfGlgCh8pYSisYgoh8lNZjrqncCngB+Fi8pz2wfjp3wj8e5O8r9WtqLZdODDGzy3ynQ0
	2HMZAzxWymTj4ixmfF+Nmav8qoNld3wM7VPVneyHC9Gvg1q4rqrZZY1opFLieW0RWduXGBwJzg6
	xfbgUVlG+zTmhE17K7VMqFxa7cI3yfO/IQmAcyJVVMwxvZLduF4NJe04WE21jBzDkqYnXon9teT
	2756SJ3M5JIhD8BYIICZG1KZ5RlTTkx0AKvzJnaC0wi8vv78RSYsCYJuuQfmZE6hdKeLuCAIWFt
	TccdzXAvh/Pf9tX
X-Received: by 2002:a05:651c:1547:b0:3a7:7cb7:6fc1 with SMTP id 38308e7fff4ca-3a99432d1c2mr14198961fa.18.1791378805693;
        Wed, 07 Oct 2026 06:13:25 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d32eb1sm6158821fa.8.2026.10.07.06.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:13:25 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Ray Wu <ray.wu@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>
Subject: [PATCH 5.10/5.15] drm/amd/display: Fix out-of-bounds read in dp_get_eq_aux_rd_interval()
Date: Wed,  7 Oct 2026 16:13:12 +0300
Message-ID: <20261007131314.120362-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Harry Wentland <harry.wentland@amd.com>

commit e8b4d37eba05141ee01794fc6b7f2da808cee83b upstream.

[Why & How]
The aux_rd_interval array in struct dc_lttpr_caps is declared with
MAX_REPEATER_CNT - 1 (7) elements, indexed 0..6. However, the offset
parameter passed to dp_get_eq_aux_rd_interval() can be as large as
MAX_REPEATER_CNT (8) when a sink reports 8 LTTPR repeaters via DPCD.
This leads to an out-of-bounds read of aux_rd_interval[7] when offset
is 8.

Fix this by growing aux_rd_interval to MAX_REPEATER_CNT elements to
accommodate the full range of valid repeater counts defined by the DP
spec.

Assisted-by: GitHub Copilot:Claude claude-4-opus
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit a55a458a8df37a65ffda5cf721d554a8f74f6b04)
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-53330

 drivers/gpu/drm/amd/display/dc/dc_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index c8c2ba7e7b05..6cce8dd64bff 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -433,7 +433,7 @@ struct dc_lttpr_caps {
 	uint8_t max_link_rate;
 	uint8_t phy_repeater_cnt;
 	uint8_t max_ext_timeout;
-	uint8_t aux_rd_interval[MAX_REPEATER_CNT - 1];
+	uint8_t aux_rd_interval[MAX_REPEATER_CNT];
 };
 
 struct dc_dongle_caps {
-- 
2.53.0

