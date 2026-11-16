Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792357;
	b=uyLIrL/5K351/RNvXRrgSxz70exKzgOTeSkyLtQy8U//h5T/B3Rrr5aEtcnBt3Y0q4/3
	 1l8fmzhn+oUdW5bT7j7uUaNpkE4JiEioDKeQUH3JjicIO1dyVi3Fs5NESYCUzGMMFt33W
	 51PoJ44G5yq50FSlYXmQKEBzdajsThReRIcPWGG9BYTskWzigDHiUhMTrbNP6m0kdp2cn
	 9ZPEn4huCs2uU7xWGafi+fGN07h7JFbZllnFlInLjNSOSzFJxgRE1fjlE6AwMiPPIFvDY
	 CVnT22/JIG4FFC0saVoLfpXEMNw7DcBrnNZA2xiy/B5lXBDIWZIBA6XhOnuXEW6+7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9pFgXqOLUsyULNYEH+TfJeavs1uRj17nfhJg98jFPmo=;
	b=HZzhNUBrJN5f3OvndJcgli5JThWsn9ENyFMYQ37M2IN4EXkb02FEmvm4/Sj74wkkajC8
	 W1kGkUa1YCWALfjWX/WmSzbasQH69bugoTpWNK2wk2K9rm9DSwZTPsDetNvXRzOd2BP9d
	 zIiA99NtPSaOXHGupxV5xtlbEqQGH0DkOBxhpdJl6wKQVlK+Nm2js9A5862FMngJnOjlX
	 tyvt7zlr2Ho77G8eSS71COcuSmrTZYht2kz2yPKKOrKhI2rKqba/fqE7yJDZ57IS7bzlf
	 Himb767M1AyEj6r5++cC1T15ap1kJXOn3q0E/cBimGVzjvtt1vqcUbMdt/wOvFQFr9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dDu6bUYY;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA688606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA688606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dDu6bUYY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794792356; x=1826328356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8gzuBwMEItY6O5A/Sh2ReXTprxrj8eld9GNWTTlo7Y=;
  b=dDu6bUYYL5ppNlayfsPm6zFLPYGQfiomVPH+oDjs/t0GtITZRtP8lPNL
   LNQIOcJ1aPCF/EfotyIudaOeOeQgCoEEweqmQ39pO22X6vp8irThFML/g
   N7EGFSkCw/eN5lpkmKVHOeqKtSUirjqCeUTuNTwGFsrjeDeA9Yy2kqFgv
   ozYcXLY/BAZZXhT8gc9HRuCpLCtifHbtIi5JGV37vZhmmyKSL2npI1ZwP
   yeFsW1Wb6KumCuooFLhrM6zY8n2PF+zngXcCoe0OitieAB9Jm+8d0lOih
   u/VHtZjIu5yspmVi4w1vTaUbfsRovvI6EizF2TQ+ZRtWXkD53lMIfLjXA
   g==;
X-CSE-ConnectionGUID: SoD5zOR3R9yVajSvLR/eYQ==
X-CSE-MsgGUID: tGfdx7c/QQaDVT/Ld1oGAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3398656"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3398656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:25:56 -0800
X-CSE-ConnectionGUID: 9kfoSp3SQwGwNkvdVpLemA==
X-CSE-MsgGUID: o2oL/Q4jT2G2X24/vDNTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9295515"
Received: from emr-371.sh.intel.com ([10.112.106.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:25:53 -0800
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andriy.shevchenko@linux.intel.com,
	Baoli Zhang <baoli.zhang@linux.intel.com>,
	Yanx L Liu <yanx.l.liu@intel.com>
Subject: [PATCH 2/3] drm/i915/display: Let the drivers free the KMS objects
Date: Mon, 16 Nov 2026 09:15:03 +0800
Message-ID: <20261116011504.3910139-3-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
References: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
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

intel_display_driver_remove_noirq() frees all the KMS objects through
drm_mode_config_cleanup(), while userspace may still hold the DRM fd
open with references to them, e.g. framebuffers it created. Such
objects must only be freed with the last reference to the DRM device.

As a first step, move drm_mode_config_cleanup() into the new
intel_display_driver_mode_config_cleanup() and call it from i915 and xe
right after intel_display_driver_remove_noirq(), so each driver can
then move it to the right place.

drm_mode_config_cleanup() now runs after the rest of the noirq teardown
(DP tunnel manager, overlay, GMBUS, workqueues and FBC). After the
previous patch the KMS object destroy callbacks no longer depend on any
of that.

No functional change intended.

Tested-by: Yanx L Liu <yanx.l.liu@intel.com>
Signed-off-by: Baoli Zhang <baoli.zhang@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_display_driver.h |  1 +
 drivers/gpu/drm/i915/i915_driver.c                  |  2 ++
 drivers/gpu/drm/xe/display/xe_display.c             |  2 ++
 4 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index d513cfc881069..62a4d95d78b53 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -160,6 +160,18 @@ static void intel_mode_config_cleanup(struct intel_display *display)
 {
 	intel_atomic_global_obj_cleanup(display);
 	intel_encoder_remove_all(display);
+}
+
+/*
+ * Free the KMS objects, including the encoders torn down by
+ * intel_display_driver_remove_noirq(). Userspace can keep referring to them
+ * until the last reference to the DRM device is gone.
+ */
+void intel_display_driver_mode_config_cleanup(struct intel_display *display)
+{
+	if (!HAS_DISPLAY(display))
+		return;
+
 	drm_mode_config_cleanup(display->drm);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 1ae2ad7e95f6c..88d9028e86e4b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -23,6 +23,7 @@ void intel_display_driver_register(struct intel_display *display);
 void intel_display_driver_remove(struct intel_display *display);
 void intel_display_driver_remove_noirq(struct intel_display *display);
 void intel_display_driver_remove_nogem(struct intel_display *display);
+void intel_display_driver_mode_config_cleanup(struct intel_display *display);
 void intel_display_driver_unregister(struct intel_display *display);
 void intel_display_driver_shutdown(struct intel_display *display);
 void intel_display_driver_shutdown_late(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index aeb7b24c81c8b..d29b37ab2833e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -906,6 +906,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	intel_display_driver_remove(display);
 	intel_irq_uninstall(i915);
 	intel_display_driver_remove_noirq(display);
+	intel_display_driver_mode_config_cleanup(display);
 	goto out_cleanup_modeset;
 out_cleanup_irq:
 	intel_irq_uninstall(i915);
@@ -951,6 +952,7 @@ void i915_driver_remove(struct drm_i915_private *i915)
 	intel_irq_uninstall(i915);
 
 	intel_display_driver_remove_noirq(display);
+	intel_display_driver_mode_config_cleanup(display);
 
 	i915_reset_error_state(i915);
 	i915_gem_driver_remove(i915);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 506f26e9c59a8..d33052a98d942 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -73,6 +73,7 @@ static void xe_display_fini_early(void *arg)
 		return;
 
 	intel_display_driver_remove_noirq(display);
+	intel_display_driver_mode_config_cleanup(display);
 	intel_display_driver_remove_nogem(display);
 	intel_display_power_cleanup(display);
 }
@@ -110,6 +111,7 @@ int xe_display_init_early(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_early, xe);
 err_noirq:
 	intel_display_driver_remove_noirq(display);
+	intel_display_driver_mode_config_cleanup(display);
 	intel_display_power_cleanup(display);
 
 	return err;
-- 
2.43.0

