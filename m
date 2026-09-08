Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FC3563298
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874297; cv=none; b=rSCRZetpwpWo5v9CanbANSy/+On6+ZIB/O2G1FnhVbstpZ+soKlI2qCi6WadisO4247tKw9edPPndpREmBbxzG4OFLpH8vqXAf62mqTxClwPuBydnKVNZ3t1CV4iwpL4yO5+Vcm/Xs6PRyU6kZQK/hXm5k9GOGEyjfT7Mpv9swA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874297; c=relaxed/simple;
	bh=Ka8lArvdDS0XqOpgdDmGFHcaj1D7gKWmNYMqT3uuuLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQyWkusEIGtSQbag7hF87Ke4THDl3SeSss4TJ2DoyP9aIWI3JBjztovjBJFWtjruHOcq5JSTRjLTSrr5PjcR97JY/6vjajySslRNpsoD8KsdYaSwXA9gavuGVDQXpEmYbmJGXjr7+/fBP2qMMfBIbwSCwcHkj7MuLcUF5AIzI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcW3+qxT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcW3+qxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788874275; x=1820410275;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ka8lArvdDS0XqOpgdDmGFHcaj1D7gKWmNYMqT3uuuLI=;
  b=KcW3+qxTlsH6uOP/PQ9DHrTW5iwbP822e310SUTR+gyICNlXnjNx9gKU
   CxZNIUr+/9krM+lOnARy6ZxDsJoq9yDho/W93GPHGwEgknYJyNvnjg8ZO
   cb7zh1zeVNUvZk9D6HiZN+UeqlBebjpf2T4Bj5jufPJ17dqW4BqeavsPC
   B9OqSyh4q60PL7aJX8U4rWacdc4oJiT3qpmOtF/+ey3hNQ/TmwsVMfYlq
   BsyRtbWk9uExtJRayMR2DTYWmS+LYZ/OekoBYdQh7qkCeAPJLQdUqcGu2
   7b6vMvl4cRBv6kfJKCJ0hkMprLXnBARE9jzwQnzYtp7OMa7XRvrNEEnpU
   g==;
X-CSE-ConnectionGUID: gkVjmfbARpyshnoUrbdHzg==
X-CSE-MsgGUID: xJf+xnVwQ6qrZLbdyun/1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93096532"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="93096532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:31:13 -0700
X-CSE-ConnectionGUID: xO7XYgh2RfihgJ5fkCasYw==
X-CSE-MsgGUID: 6mk0me+gSSuz9RbbdmrXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="269671453"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 06:31:11 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/dp_mst: Track allocated_pbn from ALLOCATE_PAYLOAD down-reply
Date: Tue,  8 Sep 2026 21:28:44 +0800
Message-ID: <20260908132844.2309047-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DP MST ALLOCATE_PAYLOAD sideband message returns the payload bandwidth actually allocated by the branch in the allocated_pbn field of the down-reply. That value may differ from the requested PBN when an intermediate branch applies its own constraints, so the source should keep track of it instead of only relying on the local request.

Store the allocated_pbn returned by the ALLOCATE_PAYLOAD down-reply sideband message and use the larger of requested PBN and allocated PBN for the MST bandwidth limit checks. Also carry the value across dependent atomic commits and clear it when releasing the payload, matching the lifetime of the remote allocation state.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 17 ++++++++++++-----
 include/drm/display/drm_dp_mst_helper.h       | 10 ++++++++++
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 7ce9e2127..86a42c5e2 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3120,6 +3120,7 @@ drm_dp_get_last_connected_port_and_mstb(struct drm_dp_mst_topology_mgr *mgr,
 
 static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 				   struct drm_dp_mst_port *port,
+				   struct drm_dp_mst_atomic_payload *payload,
 				   int id,
 				   int pbn)
 {
@@ -3166,10 +3167,14 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 	 */
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
 	if (ret > 0) {
-		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK)
+		if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
 			ret = -EINVAL;
-		else
+		} else {
+			if (payload)
+				payload->allocated_pbn =
+					txmsg->reply.u.allocate_payload.allocated_pbn;
 			ret = 0;
+		}
 	}
 	kfree(txmsg);
 fail_put:
@@ -3285,7 +3290,7 @@ static int drm_dp_create_payload_to_remote(struct drm_dp_mst_topology_mgr *mgr,
 	if (!port)
 		return -EIO;
 
-	ret = drm_dp_payload_send_msg(mgr, port, payload->vcpi, payload->pbn);
+	ret = drm_dp_payload_send_msg(mgr, port, payload, payload->vcpi, payload->pbn);
 	drm_dp_mst_topology_put_port(port);
 	return ret;
 }
@@ -3298,7 +3303,7 @@ static void drm_dp_destroy_payload_at_remote_and_dfp(struct drm_dp_mst_topology_
 
 	/* it's okay for these to fail */
 	if (payload->payload_allocation_status == DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE) {
-		drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
+		drm_dp_payload_send_msg(mgr, payload->port, NULL, payload->vcpi, 0);
 		payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
 	}
 
@@ -4575,6 +4580,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_commit *state,
 	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
 	if (!payload->delete) {
 		payload->pbn = 0;
+		payload->allocated_pbn = 0;
 		payload->delete = true;
 		if (payload->vcpi > 0)
 			topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
@@ -4670,6 +4676,7 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_commit *state)
 			new_payload = drm_atomic_get_mst_payload_state(new_mst_state,
 								       old_payload->port);
 			new_payload->vc_start_slot = old_payload->vc_start_slot;
+			new_payload->allocated_pbn = old_payload->allocated_pbn;
 			new_payload->payload_allocation_status =
 							old_payload->payload_allocation_status;
 		}
@@ -5352,7 +5359,7 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 			return -EINVAL;
 		}
 
-		pbn_used = payload->pbn;
+		pbn_used = max(payload->pbn, payload->allocated_pbn);
 	} else {
 		pbn_used = drm_dp_mst_atomic_check_mstb_bw_limit(port->mstb,
 								 state,
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 27658bfb5..1a9430a62 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -572,6 +572,16 @@ struct drm_dp_mst_atomic_payload {
 	int time_slots;
 	/** @pbn: The payload bandwidth for this payload */
 	int pbn;
+	/**
+	 * @allocated_pbn: The payload bandwidth actually confirmed by the
+	 * branch device in the ALLOCATE_PAYLOAD reply. Each MST branch along
+	 * the path overrides this field to the maximum of the requested and
+	 * its own constrained value, so the value received by the source
+	 * reflects the tightest bottleneck along the entire path.
+	 * Used instead of @pbn for bandwidth limit checks so that the source
+	 * accounts for any per-hop adjustments made by intermediate branches.
+	 */
+	int allocated_pbn;
 
 	/** @delete: Whether or not we intend to delete this payload during this atomic commit */
 	bool delete : 1;
-- 
2.43.0

