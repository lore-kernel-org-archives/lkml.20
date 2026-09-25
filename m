Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6798285CBA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790308339; cv=none; b=LUdCKwS4EYhejYexR3k491w557ieauYY7qbu06Ag+Sd8CsMykiw4iLwg4xEvLSf6GVkwtVsVi8V7nwCKg4UlOnXWrR03TG9EG9NJbGXsClt5+w9c0EWXP6ljHqcvVV33RvNRVk7/82YmXa88He2SLC1oF15vGgFyaBhfEJrO0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790308339; c=relaxed/simple;
	bh=QPfdJbuQR/C9Wzg7UZd8bNUclGmIj/Bq0uURy195g9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oGSlkNcGL+Lthc+h4JOIiHsgwnbe/12yG5jZZCvqvw/hH1/zuGqdSvM0xzEjkrR1Jt5ZuRhEsG9i91kldyyMoYd30sxosESZmhk6YoXdyLCHUCQZ4Y4cd69+Pn9rHO/E5u6SPv/UyevxaktvbBjB203wZDHASkpT0bxbttT+kVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWp8TzKj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWp8TzKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790308338; x=1821844338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QPfdJbuQR/C9Wzg7UZd8bNUclGmIj/Bq0uURy195g9Y=;
  b=CWp8TzKjNG6IofU7yLMHUxz7Uv6GKbUuQ0yLNH06ZgquNArBFw5UF8b2
   0QQQgOgxngzPIfq8p2CUlCPdrhlXXwOcEj9PxIfnyAiEBKSxGBxO9GlEd
   aGw9an20viTEs3c8ojPzKtjtVvwH/dScdBqJumbtJCvtTFV6ccE+eH1Qb
   Eev01a63gax6YTngO9QWBFCd2hPP5f5qzFkG9DN8BneIcFusB06uV1p8Z
   y5usx/9qSt7DnF7+KL51McPnHEAGoHH3csPn5V37gUxhuq+P6wLer2304
   bJ5yvlWy7ZlEYKH0iEuplpsH3bxYrbQGIxZTxxZZfd/xtgs7kLaaqb5UB
   g==;
X-CSE-ConnectionGUID: D9iWTqBjTXOF9Af2Bs1t8A==
X-CSE-MsgGUID: Qc2bmRkrQHeJz6qOB2TqOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90051160"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90051160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 20:52:17 -0700
X-CSE-ConnectionGUID: TzrgFpDMS+m8IxO9vXdXNg==
X-CSE-MsgGUID: fZMOo/kUTIq0xScRRnv3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272798313"
Received: from gdsworo-desk4-x299-aorus-gaming-3-pro.jf.intel.com ([10.54.67.206])
  by fmviesa006.fm.intel.com with ESMTP; 24 Sep 2026 20:52:17 -0700
From: "George D. Sworo" <george.d.sworo@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	"George D. Sworo" <george.d.sworo@intel.com>
Subject: [PATCH] drm/i915/hdcp: Fail fast when HDCP Type 1 is unsupported via MST
Date: Thu, 24 Sep 2026 20:56:39 -0700
Message-ID: <20260925035639.2034315-1-george.d.sworo@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HDCP Content Type 1 requires HDCP 2.x support from both the source and
the downstream MST sink. A request for a sink that supports HDCP 1.x but
cannot use HDCP 2.x currently passes atomic validation and fails later in
the HDCP enable path.

Query the downstream sink through its MST remote AUX channel during HDCP
initialization. Cache the result only when the sink reports HDCP support
and either the source or sink lacks HDCP 2.x. Treat a missing callback,
probe failure, or no reported HDCP support as unknown and non-fatal.

Use the cached result to reject unsupported Content Type 1 requests with
-EOPNOTSUPP in intel_hdcp_atomic_check(), and propagate the error through
the digital connector atomic check. This keeps remote AUX transactions
out of the atomic check path.

Signed-off-by: George D. Sworo <george.d.sworo@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |  6 ++-
 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 50 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  6 +--
 4 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b66c2d4ba2b3..c6383e27e62b 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -123,8 +123,12 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
 	struct intel_digital_connector_state *old_conn_state =
 		to_intel_digital_connector_state(old_state);
 	struct drm_crtc_state *crtc_state;
+	/* Propagate HDCP capability failures during atomic validation. */
+	int ret;
 
-	intel_hdcp_atomic_check(conn, old_state, new_state);
+	ret = intel_hdcp_atomic_check(conn, old_state, new_state);
+	if (ret)
+		return ret;
 
 	if (!new_state->crtc)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 79f30660c2b6..1c169849e502 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -605,6 +605,8 @@ struct intel_connector {
 	struct {
 		struct drm_dp_mst_port *port;
 		struct intel_dp *dp;
+		/* Used to reject unsupported HDCP Type1 requests during atomic check. */
+		bool type1_unsupported;
 	} mst;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index e56df337dc6d..7490fc0fd96a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -312,6 +312,26 @@ static void intel_hdcp_get_remote_capability(struct intel_connector *connector,
 		*hdcp2_capable = false;
 }
 
+/* Determine whether atomic check should reject Type1 for this MST sink. */
+static bool
+intel_hdcp_mst_type1_is_unsupported(struct intel_connector *connector,
+				    const struct intel_hdcp_shim *shim)
+{
+	struct intel_hdcp *hdcp = &connector->hdcp;
+	bool hdcp_capable = false, hdcp2_capable = false;
+	int ret;
+
+	if (!shim->get_remote_hdcp_capability)
+		return false;
+
+	ret = shim->get_remote_hdcp_capability(connector, &hdcp_capable,
+						   &hdcp2_capable);
+	if (ret)
+		return false;
+
+	return hdcp_capable && (!hdcp->hdcp2_supported || !hdcp2_capable);
+}
+
 static bool intel_hdcp_in_use(struct intel_display *display,
 			      enum transcoder cpu_transcoder, enum port port)
 {
@@ -2421,6 +2441,10 @@ int intel_hdcp_init(struct intel_connector *connector,
 	if (is_hdcp2_supported(display))
 		intel_hdcp2_init(connector, dig_port, shim);
 
+	/* Cache the remote capability before atomic checks can run. */
+	connector->mst.type1_unsupported =
+		intel_hdcp_mst_type1_is_unsupported(connector, shim);
+
 	ret = drm_connector_attach_content_protection_property(&connector->base,
 							       hdcp->hdcp2_supported);
 	if (ret) {
@@ -2684,10 +2708,11 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	mutex_unlock(&hdcp->mutex);
 }
 
-void intel_hdcp_atomic_check(struct drm_connector *connector,
-			     struct drm_connector_state *old_state,
-			     struct drm_connector_state *new_state)
+int intel_hdcp_atomic_check(struct drm_connector *connector,
+			    struct drm_connector_state *old_state,
+			    struct drm_connector_state *new_state)
 {
+	struct intel_connector *intel_connector = to_intel_connector(connector);
 	u64 old_cp = old_state->content_protection;
 	u64 new_cp = new_state->content_protection;
 	struct drm_crtc_state *crtc_state;
@@ -2700,7 +2725,20 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
 			new_state->content_protection =
 				DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		return;
+		return 0;
+	}
+
+	/*
+	 * Fail fast if userspace asks for Type1 but neither the platform nor
+	 * the downstream sink can do HDCP 2.x, instead of only discovering
+	 * this once intel_hdcp_enable() is reached.
+	 */
+	if (new_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
+	    new_state->hdcp_content_type == DRM_MODE_HDCP_CONTENT_TYPE1 &&
+	    intel_connector->mst.type1_unsupported) {
+		drm_dbg_kms(connector->dev,
+			    "HDCP Type1 requested without HDCP 2.x support\n");
+		return -EOPNOTSUPP;
 	}
 
 	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
@@ -2725,10 +2763,12 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
 		if (old_state->hdcp_content_type ==
 				new_state->hdcp_content_type)
-			return;
+			return 0;
 	}
 
 	crtc_state->mode_changed = true;
+
+	return 0;
 }
 
 /* Handles the CP_IRQ raised from the DP HDCP sink */
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index efe86808e17e..34661b074784 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -22,9 +22,9 @@ struct intel_hdcp_shim;
 struct seq_file;
 enum port;
 
-void intel_hdcp_atomic_check(struct drm_connector *connector,
-			     struct drm_connector_state *old_state,
-			     struct drm_connector_state *new_state);
+int intel_hdcp_atomic_check(struct drm_connector *connector,
+			    struct drm_connector_state *old_state,
+			    struct drm_connector_state *new_state);
 int intel_hdcp_init(struct intel_connector *connector,
 		    struct intel_digital_port *dig_port,
 		    const struct intel_hdcp_shim *hdcp_shim);

base-commit: 999838292166407bbe911a41dee23112c49e9d44
-- 
2.43.0

