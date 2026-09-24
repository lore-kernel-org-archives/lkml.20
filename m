Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF973C1985
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284777; cv=none; b=WxFqiCTRJko7rbW5ihaCSrA6OyyRZ8lELP9iBJYTdURTOxJ0x7oGf4rF9c2epV/d+O8wBySJq+EKysImG08tmCir7Uc22fw0FFcJ9SKGUlWs6H/QQnk64SVEFhjBb9Y3ZYn2o7WZQnDVzsih1zuaEy42eXUkmhGik6eUp0CEubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284777; c=relaxed/simple;
	bh=tXhA3L7GCRZ1UE/WtmGgQFami6NdIUfVMkOh4c5S0Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrbgpyQMnuPjmX/aaIPScczgXK0QHgjAGiKeDU57u1FapZXiBNVzsm3zmMjZtnfzTknysnkWdSCY2LvnEBhnC1obM9vVCfUuKQRkBE5mJe1R7rfwMPqUIvcZpbtrNCs8pUpVb/TqZea5gxCkEsjZkH7ML0C2RmUMo9aD4zGdXfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/LfIDO+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/LfIDO+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so895015e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284769; x=1790889569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3b2nna4xnlk7YBC6uF1VaaYbEm9ppYIUbn/RXDv0QcY=;
        b=k/LfIDO+38u1JVEI0wQ1JGoJajtGUPlUeDOULg9DRTUXilbyLD4e+wmwrUN/XDAAHj
         ds1ikX4x0hWoDKBaosH57excT0wBCbPJPi4rpFFqYs+IfDhuCAp4fMU3/hmbt+67N1DG
         KJazVyN/SlN6Qlg9bxlTWHIdWlseh1yt+jTs8hU0jfRF6AOwFfnMhKf1j2D0OvxbQtWf
         0MwnemIn/McHKuwTXXWWJoscaITh/DWNyOut7dUtG9S4cQoSM5MQsgCTm7dHKcwNnRYB
         nehcLb94zx3Y+17TeQngnB7njRPC8Fyqiwn4PYKdZxK60wOEqsHXOFW0o1gB8eqG3c15
         M/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284769; x=1790889569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3b2nna4xnlk7YBC6uF1VaaYbEm9ppYIUbn/RXDv0QcY=;
        b=TBtU3iK5wTfYa3azEWYS6Cj9hyFX4uo9diayqwETzQgL2Q52C9pdqw3RVmCAnkVkHy
         LBWWcrzi4crzK+jA2CEC38A80496pKeWsCHsxjJRqfrwo/NgQETWseKKjGZ9zjHdLDnZ
         GHYvNC6WvC524G9Vhg5636CVpvu8tRoiZ2mk2qDgs4XtEz9Rlqf5eu5hJ2+MbfQ4pkIq
         M4yiB8MeP8raoTpm+l2Iylz2B2TnCgQg28HyQg0MvRrK0qeFeonyFlHI8c0HWAjibuDJ
         bZhC4LS33hkz4caRT+w81nncoXzAtP0xko8Ihn/Gj/gv1KYy+0Ig+Urj7T/wBkJUKr36
         7Uzw==
X-Forwarded-Encrypted: i=1; AKwUvBzv6FOczotuF+DXkXZ8Hsf/+R1zPyDl7wKZd9YYnKjPa4ORilDR733ZnUd0e8M1Z/7zoBlQ+ECKm6RwwOc=@vger.kernel.org
X-Gm-Message-State: AFuF++lI5UEryPpoqHdAhkvwuj7oFB3XoDKE2lFRt3mb1gablQiR6jUj
	x0sJBcrmN57+Jkd+J5IOs77YzEVzAu9pGtNI8sXYcUMuhT/iRkbM6f2L
X-Gm-Gg: AYBFou2z7hbguePyARnlWq6anYFBXNdCsk+caaRcFO1+Zbc+UsJh6nLKP9OGhI5j1Xo
	fDSya08OJVKoQcSIuiKzp43EDh+LUTcfJCqz6Kc7k/Y0QhR/MLQDiRRCuec1piCJWz6urB1oM55
	EQViNmhA7Yio86w6c6ej+pCMl5F6gaIx5y+2DY0jG5sBQWo7tR6dqC2CUmJbHqsEtK/r9zkm0Fl
	a/BFL74ZrAMfmLvQdgD0N/C6lijxoovvmbv1cUyN/zw7uwEKFcIRgKq3m+17YpH6F3f2xkvRLBT
	K0nr1Abbr18/v/ChAIxuyOi6qS//Osynz6pJXdCR5M2GzEnEpmtHySaEHY+o+0ZAFyGf+6pnq5R
	ytYucGhtIC3Y2JEg3KWKOS+nQdScqCTVt/gsRCpl00U00M6yigYTpztYg56f+PQvdtDKpc+3xZH
	bMieN/WRl1NZfD8s+g0sAPsvkDXxep0mmddlHZnAYej4U4d4/Za5VWBjXdacu88Yk8idOzXzOR9
	g4IU42tJ2pnu/Jx8WlKxZv4ujRPl+opmjCnyxp+oXOXkTmvTiJfT3q5vfaCHtT/HmfiZrJz3zOD
	k5sryTmg9qMOMklDfzTsGPoy1wTG9iJtFhKdPYvOj2NVf3c=
X-Received: by 2002:a05:600c:c096:b0:49f:f099:6f92 with SMTP id 5b1f17b1804b1-49ff0997108mr2146345e9.9.1790284768860;
        Thu, 24 Sep 2026 14:19:28 -0700 (PDT)
Received: from tulkas.localdomain (95f12971.skybroadband.com. [149.241.41.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5f876esm6403155e9.2.2026.09.24.14.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:19:28 -0700 (PDT)
From: Conor Svensson <conor10@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: Conor Svensson <conor10@gmail.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/dp: Configure protocol converter only for TMDS outputs
Date: Thu, 24 Sep 2026 22:18:09 +0100
Message-ID: <20260924211852.436787-1-conor10@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
References: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel_dp_configure_protocol_converter() currently writes the HDMI/DVI
output-selection control for every DP 1.3+ branch. The write is only
meaningful for a TMDS downstream output; a native DisplayPort output should
not be switched to the HDMI/DVI protocol-converter mode.

An Anker 565 branch (Synaptics OUI 90:cc:24) changes its downstream port
descriptor from DisplayPort to DVI immediately after this write. i915 then
derives a 165 MHz TMDS limit on the next hotplug probe and drops the
monitor's native modes. Skipping the write for non-TMDS outputs prevents
the transition.

The existing dfp.min_tmds_clock classification is nonzero for HDMI/DVI
outputs and zero for native DisplayPort outputs, so retain the write for
the protocol-converter cases that need it. Colour-conversion controls are
unchanged.

Tested on a ThinkPad L14 Gen 4 with an Anker 565 A8388 hub and a Dell
S3422DWG:

- native 3440x1440@59.973 after DP recovery
- three USB-C reconnects on the first USB-C port
- one test on the second USB-C port
- suspend/resume on the second port
- HDMI through the hub at 3440x1440@59.973, with HDMI-specific modes
  present

On the unpatched control kernel, the live descriptor changed from
08 f0 01 1e 00 00 00 00 to 0a 42 00 00 00 00 00 00 across the 0x3050 write.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180

Root-cause findings and validation details were added to the linked issue.

Assisted-by: LLM Codex GPT-6

Signed-off-by: Conor Svensson <conor10@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ffddf4b33..cdc3d7786 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4422,14 +4422,17 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 	if (!drm_dp_is_branch(intel_dp->dpcd))
 		return;
 
-	tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
+	/* HDMI/DVI output selection only applies to TMDS downstream ports. */
+	if (intel_dp->dfp.min_tmds_clock) {
+		tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
 
-	ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
-				     DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
-	if (ret < 0)
-		drm_dbg_kms(display->drm,
-			    "Failed to %s protocol converter HDMI mode\n",
-			    str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
+		ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
+					     DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
+		if (ret < 0)
+			drm_dbg_kms(display->drm,
+				    "Failed to %s protocol converter HDMI mode\n",
+				    str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
+	}
 
 	if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		switch (crtc_state->output_format) {

base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
-- 
2.55.0

