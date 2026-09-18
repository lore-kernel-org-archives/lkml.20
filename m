Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D368230D3F1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705423; cv=none; b=qh6dvXhdHmqpzgIQgBGsLJjMhMcoMSpviA989d7ISi50Z+9y0XtCezNiyWwQ/FG/Oe1GGW7XKYbKws1dLw9lBAchPAKqhTfdOvlUmWa6QDoVpbMpjkG9mCnJ+pKuo1OKDcPD/2aUYJn/jZsmf1R94GR+g2UjSasN3cqYn2sGyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705423; c=relaxed/simple;
	bh=CLW7hDPd69ZKqON9v5+I/+GeNtAIJUzPFUdWDgkIng4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WK2J82wWXLS4qtvQQytVYuvwQ8p6aufYj/GGpYOGpmhJKujgOY9Fu24PGLPo78UNosyJyW3IaIobRRxLegDfukXroBRReMeS2y00KgJKiXrDEWHyf+Nv6xvsT/31Gy+1cHEqcS5QShrbJlVDyOHvPH9wTDJ5JBtTfojDMdA4EPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNmxSofd; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNmxSofd"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a34908so322974b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789705421; x=1790310221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BEYrdPncK5+8wcIBCPJhFb06NPsWm4ypvW09xMw3CI=;
        b=gNmxSofdbqgxTk8YUjXaA87OeMKMsgm23/E8Oq6HxWairoccMuklBH5r/5VA4GXqwP
         pNaRUjZPSXL1WgycCZHtq4GGnUrUej8NirmlfvnkJJtH4u5m3UFnbzJ7b5SEluzo9J4e
         DY/3ZsyleXdXxVp1VgDsaxuo8iG6QGYe4H3DmF6tJ95+8OfcBaP+KX6azdaSXMJJejuB
         lGyYsFCGXfgdnGglefDPoGRVLTO9QhwVLjNLHqK7y1F2tlOtQOfx6rE6RN1umtAvhfZR
         uVivwf8PgpwIhl3kw5mlGdeJ4/i0JnW8753Y5DBPNDtut2aiFhrW+6WJ/ujdkF4hVb/W
         9X7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705421; x=1790310221;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BEYrdPncK5+8wcIBCPJhFb06NPsWm4ypvW09xMw3CI=;
        b=UCWdi0dD9F64JvZfSbqZcB1E0Qgr1Ulay3vBJlPvuM+LXxH3NOJTTRQTHv4bjrVWaZ
         Ihon+UeJHOZZOGJ6OwmLNGOY9TpikKZE4dAyohWvt5woaOR1tuBsi0mpSDlhRN9l0nxd
         VVIww/SSVJY1hM5+EgMFEBBPU/HsUKzGGtyUSPcgsr48cJ+2eXb60TLcZqStMi/BybXc
         aiHvKhCnOTS3ibdqMxc18sRAMJovjhBMnJ8V73wJJbZiObCf5JsisVSjjaBmDt8UpRAT
         /A4bExdDusgLAp4ImK1k0eHi9mfxbDmdGZujv6BygkDXjIbyFBYzifWRjqC0V5CQC/7H
         1/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBycHhQHKns2hAc2OybJImeNcIlo82gnKFj9KbEl3ABDV5DbSdC1anYs4GEwne9Kzca5AWsTNIC3hQxN1Pc=@vger.kernel.org
X-Gm-Message-State: AFuF++l2NV5UbIKoRGpn7ZMEkC63hMzGnnfpE1b9Fs+il6lrug9F5eVC
	Skkzew8wtYNxFSyl7F0OWANuiUl7LxUVkpPuZKMhzbSgNd0UPxrbQdzV
X-Gm-Gg: AYBFou1hDIoHm5DeSZtRHIyQK+d8vvBVbQNszryhoSRV8EXKBJTJpU4iqzIveokfBXQ
	JSmOxr3c1WwzoJMbbbYKOnQSooddfqGVlCdKAX7E7E7ubE+K9fl1ddYMLBKXOErd3Fn4DsUS8Bw
	u3k+hQftp280bCg2/TEM5GBfn2B9wDR8UXwNZORysBuvQZWkgl0uFTqAeLNMi/HzTdEaeHiA0kA
	D+fQ4zMFNIJliKtgvAc2iXZ9qMTmDWLToQEZtcDSEUFrHNSgXElQTewJmTZv9KL3/FFx+rje9f8
	8dN2aYZU2ELFafn77BkCzziDsCA8krvMQnry4kN+j21EAKPkgoWQYTgcjWEZxWLlRB5bv4lhkT4
	qJ1lCCgxMBF/7FhCz3Ym3VBI/kkri1jhqd21xzlvgPr2nnAyKw/hx6piiLvQS+aCfmcYHK6KBx4
	/Qq3U0jqqnEklxGaYnPbdSHBMJGWHcGgZDUpBwZs38oZ0rgZlOiWdAcyWjXgrU43V3lIhKSGtZ
X-Received: by 2002:a05:6a20:6a20:b0:3d2:2afa:d7d with SMTP id adf61e73a8af0-3dd8c52d98emr2724989637.18.1789705420877;
        Thu, 17 Sep 2026 21:23:40 -0700 (PDT)
Received: from G15-5520 ([103.246.195.50])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfc3df2sm2305851c88.5.2026.09.17.21.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:23:40 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Zhenyu Wang <zhenyuw.linux@gmail.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] drm/i915: use string choice helpers
Date: Fri, 18 Sep 2026 04:23:18 +0000
Message-ID: <20260918042325.17700-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prefer the str_high_low() and str_read_write() helper functions
over ternary operators with hardcoded strings.

No functional changes.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 5 +++--
 drivers/gpu/drm/i915/gvt/aperture_gm.c       | 4 +++-
 drivers/gpu/drm/i915/vlv_iosf_sb.c           | 6 ++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index dbebd7210848..b83f0afaa9b5 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -5,6 +5,7 @@
 
 #include <linux/log2.h>
 #include <linux/math64.h>
+#include <linux/string_choices.h>
 
 #include <drm/drm_print.h>
 
@@ -189,7 +190,7 @@ int intel_cx0_wait_for_ack(struct intel_encoder *encoder,
 		drm_dbg_kms(display->drm,
 			    "PHY %c Error occurred during %s command. Status: 0x%x\n",
 			    phy_name(phy),
-			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
+			    str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK), *val);
 		intel_cx0_bus_reset(encoder, lane);
 		return -EINVAL;
 	}
@@ -198,7 +199,7 @@ int intel_cx0_wait_for_ack(struct intel_encoder *encoder,
 		drm_dbg_kms(display->drm,
 			    "PHY %c Not a %s response. MSGBUS Status: 0x%x.\n",
 			    phy_name(phy),
-			    command == XELPDP_PORT_P2M_COMMAND_READ_ACK ? "read" : "write", *val);
+			    str_read_write(command == XELPDP_PORT_P2M_COMMAND_READ_ACK), *val);
 		intel_cx0_bus_reset(encoder, lane);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 253b41789be9..794fb50e48dd 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -34,6 +34,8 @@
  *
  */
 
+#include <linux/string_choices.h>
+
 #include <drm/drm_print.h>
 
 #include "gt/intel_ggtt_fencing.h"
@@ -76,7 +78,7 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
 	mutex_unlock(&gt->ggtt->vm.mutex);
 	if (ret)
 		gvt_err("fail to alloc %s gm space from host\n",
-			high_gm ? "high" : "low");
+			str_high_low(high_gm));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/vlv_iosf_sb.c b/drivers/gpu/drm/i915/vlv_iosf_sb.c
index 1f0332b4ad0d..fede1735bc08 100644
--- a/drivers/gpu/drm/i915/vlv_iosf_sb.c
+++ b/drivers/gpu/drm/i915/vlv_iosf_sb.c
@@ -3,6 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
+#include <linux/string_choices.h>
+
 #include <drm/drm_print.h>
 #include <drm/intel/display_parent_interface.h>
 
@@ -101,7 +103,7 @@ static int vlv_sideband_rw(struct drm_i915_private *i915,
 				    VLV_IOSF_DOORBELL_REQ, IOSF_SB_BUSY, 0,
 				    5)) {
 		drm_dbg(&i915->drm, "IOSF sideband idle wait (%s) timed out\n",
-			is_read ? "read" : "write");
+			str_read_write(is_read));
 		return -EAGAIN;
 	}
 
@@ -125,7 +127,7 @@ static int vlv_sideband_rw(struct drm_i915_private *i915,
 		err = 0;
 	} else {
 		drm_dbg(&i915->drm, "IOSF sideband finish wait (%s) timed out\n",
-			is_read ? "read" : "write");
+			str_read_write(is_read));
 		err = -ETIMEDOUT;
 	}
 
-- 
2.53.0

