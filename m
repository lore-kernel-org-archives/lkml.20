Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E244570DA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268603; cv=none; b=qSrA1QeO7fYenGba2U8+QgGi2eaCFDSWwp4co7c4gIPUI2wUCLc3KlA+0nkJMp2iGWm0h2JzBLuwU2cG3UzxoBBwpdiv8xSb6WFYVLjBk2SgBY/wgP8KswXRKa6uZMXqv+bc7TtN9AWo+70CxobgTkC89Thk1SS3W1EO7RDUDLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268603; c=relaxed/simple;
	bh=7z4Osn7hJonWi0eG7wk0Z2VVQPLittF51KXrjYDMhMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ay80i6IHWlcmR9l06WxjhAnuS3SD4pElIzSqhWeow5IaPQmcp/AoPujz34b25ji8KBopdmD1acw7Yh1d1S8HWr81Rnfkp4/fxt5u48NV0ds2crPz7UYqMBjkB1hpOhMzRHJa/P4xBk5ph/PmD4ly7c9/yZqywkVibVNB06dRMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMq9Jdrx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMq9Jdrx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso341915e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268600; x=1790873400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2IDmw9bTisJaYAh4s7sCq1aRiBz5dcPpXhx059abuQ=;
        b=UMq9JdrxffpIzVkH2LaTorc5um9b9EfkqueMa7qxj1T6Mr9Iiw8NAixiuzqrfSBS+u
         PwyVa6a6fijyOtbVSRWrMZ7zUb7+KRxSD/+L/hevEQHUylcKsXo7hctwg3O+BDJTcwHV
         2gB2HyZdbRf/W1utMvk8ynEcnU8QgFXBBf2gc39IPp4mw/ddLHwu+KoL7FCEFiI8SaVp
         Yo8fn9s4F+rJs0eXb2uCRMqaZktVnwBD2bUrfULM6UFKa5+05uK6Ayv3fRrZ+2Pwts3h
         x90lta2sHU6z0NJwAzSAj92gTK7wZLkl495HZivbmQciOCufAg7VaRJ+7HtLhjEOGkSl
         BT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268600; x=1790873400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2IDmw9bTisJaYAh4s7sCq1aRiBz5dcPpXhx059abuQ=;
        b=GQZhiLDmnMS8Fu2qOPggpWidW/HhO3Z5kN7tPMYo52DCNfBNGE2vRpNN3WxLzeP7QN
         JtryoEGuoiywNEPm8ujjFtQCewg3du7yoDfz+y9x6YTNnFbz4RoeXtxMQg32nHXvctvA
         4mTdsyui9C/FwNWME55YpLB5NSqjzXwBVHcD+5hZbuYmWVnCCky4DM47lNZ5malO7ub/
         UoxmS2k0FXrBWncVmi1m8hirqglS+Sd5i8YAFgo134FyKl/pQpottWVUw1r39SuwuFtc
         tBw7wYN7z3cbWSAPgw14hoktKiR3RJOLXXR6zIkNjXA2oPvY+P5adl9+PM75t6KqfhO/
         ExlA==
X-Forwarded-Encrypted: i=1; AKwUvBxsSIRTfWaUOSH9mNbo3H3SU0C06gGj6uI5BS/dhQ+2HqKCKxu4gy78PTqGtC9mXwGb01eSrRaluEspjX8=@vger.kernel.org
X-Gm-Message-State: AFuF++mVMT/ucS3T2zhc9s4w9Ls4vneDJXR0Tab4uSb5KLRws01oSNuh
	OpxaIOhseF6wJTMFWpl2ZqoRszdYF9N285izq2BUCJAwLSuNv5iBicdfHSX75A2O
X-Gm-Gg: AYBFou3TSklbxrkx1PyQwF12I+T6TpLgvTyIiGqUPMadGerdJjEf0wLNiqRhSrGMk6b
	0qHVyw4ZwwsvaMCqaZAsejoYvTGDJ5RD+jlYrqJbOKkt9MVwGxxzyiEIA0WK9jOExz+pq1Lo7TZ
	ouYXgcWHdxSib309LW0FUbx8E9cZ7tk9p9oyUHvCmAopFvFCZ4+5RV7HrTPOHGO0NqKQ+oSnXlv
	CoaeAPwfhTMUl5wx+TPLAWPOhrXiZpnZOoVEQg0OCLJafOoYQLqL8SmFByDk83qL5PpAwBqfN1D
	le39tQKq6LMkivYCZFD3Z9XqO9ovMuiu0eBUPTb+HPfjNTPxQQo/RJuRlJtMUUr6uBggBbfe2QW
	kyIDl63N0+/v++z3NpIIAaqY/Op0DLjPqnJ5LTdYkpYq46rELN78nafjIBSC2XTYwNxQlZc/lKu
	Ka6FLRbZ+07I15DDiN2FdVze2az1+kQ6W5Er37PpXsv+lBACqaBmyyakM7Raj0Y2aW9OdfjL4v5
	FdAEOwQ
X-Received: by 2002:a05:600c:4e86:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fe66c8e13mr51367875e9.3.1790268599645;
        Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6ced69sm1219015e9.0.2026.09.24.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH v2] drm/i915/display: Replace bw_constrained with max_link_bpp_x16
Date: Thu, 24 Sep 2026 19:49:53 +0300
Message-ID: <20260924164953.28066-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919161927.98829-1-mail@taterr.org>
References: <20260919161927.98829-1-mail@taterr.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In intel_crt.c (VGA displays) and intel_lvds.c (old laptop displays),

both files were using a legacy boolean flag crtc_state->bw_constrained

to guess if the display link was bandwidth limited.

To fix this, replaced the bw_constrained boolean checks with direct

comparisons against the max_link_bpp_x16 fixed-point API.

Signed-off-by: George Karagounis <mail@taterr.org>
---
v2: Remove the dead bw_constrained flag definition and writer entirely,
    as pointed out by the sashiko bot reviewer
 drivers/gpu/drm/i915/display/intel_crt.c           | 5 ++---
 drivers/gpu/drm/i915/display/intel_display.c       | 1 -
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 -
 drivers/gpu/drm/i915/display/intel_lvds.c          | 6 +++---
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 5b8968197fbc..3da9547f2c6e 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -459,10 +459,9 @@ static int hsw_crt_compute_config(struct intel_atomic_state *state,
 
 	/* LPT FDI RX only supports 8bpc. */
 	if (HAS_PCH_LPT(display)) {
-		/* TODO: Check crtc_state->max_link_bpp_x16 instead of bw_constrained */
-		if (crtc_state->bw_constrained && crtc_state->pipe_bpp < 24) {
+		if (crtc_state->max_link_bpp_x16 < fxp_q4_from_int(24)) {
 			drm_dbg_kms(display->drm,
-				    "LPT only supports 24bpp\n");
+				   "LPT only supports 24bpp\n");
 			return -EINVAL;
 		}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9dfd095f325f..fa6b11c4df47 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4767,7 +4767,6 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 			    "[CRTC:%d:%s] Link bpp limited to " FXP_Q4_FMT "\n",
 			    crtc->base.base.id, crtc->base.name,
 			    FXP_Q4_ARGS(crtc_state->max_link_bpp_x16));
-		crtc_state->bw_constrained = true;
 	}
 
 	base_bpp = crtc_state->pipe_bpp;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 43d53a98dae7..2166c84596c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1146,7 +1146,6 @@ struct intel_crtc_state {
 	 * required. This is set in the 2nd loop of calling encoder's
 	 * ->compute_config if the first pick doesn't work out.
 	 */
-	bool bw_constrained;
 
 	/* Settings for the intel dpll used on pretty much everything but
 	 * haswell. */
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 872753478cf2..6bbd13ab5da7 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -443,10 +443,10 @@ static int intel_lvds_compute_config(struct intel_atomic_state *state,
 	else
 		lvds_bpp = 6*3;
 
-	/* TODO: Check crtc_state->max_link_bpp_x16 instead of bw_constrained */
-	if (lvds_bpp != crtc_state->pipe_bpp && !crtc_state->bw_constrained) {
+	if (lvds_bpp != crtc_state->pipe_bpp &&
+	    crtc_state->max_link_bpp_x16 >= fxp_q4_from_int(lvds_bpp)) {
 		drm_dbg_kms(display->drm,
-			    "forcing display bpp (was %d) to LVDS (%d)\n",
+			   "forcing display bpp (was %d) to LVDS (%d)\n",
 			    crtc_state->pipe_bpp, lvds_bpp);
 		crtc_state->pipe_bpp = lvds_bpp;
 	}
-- 
2.55.0

