Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468087;
	b=ALKiz6zGpkkOP9kIyNWuUUOc6zKLetq75jRsUVqfffnvm7j1Va5ONQGo01u8EtV0DLOL
	 QDQw3RpSg3Lme2zhK7f+BnGCcGZq2uPAO7/WMOl+VeZVysN0e6xCk/FYE0XPdfZ1vaE7B
	 SVAV0Jh+LtC9cA6laFvVtvUXqaK0/ytY8xp9OcGz2mu0e5DdokdI8x0JkLBOv8XCtjotV
	 4581pLh+5024q+jBKoPwHdaZuw0QJ4AV+HH0shaV8Qur3wLYF31VgqrWU/LtCbsBMPdjw
	 elgjM7pAes9a6izZr9wtoHdZ1RyEx2wxHbWI8bEGesMphLq+Y/UstrBZTGDJbz9DnYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Qrab5ZFjFMYytZiJyGN3w/QXHi/fU6bhjvwr0O2dHGw=;
	b=pJcgp3zRB/M0kUWA6uY9KB5kOR+fqGJ9+gJ9nF8UM3puXQwY7+ARRu46W6l3YFVX2l2/
	 WLxDZEbKSekRf7HL97nhVCIJEoeuiDVM4Eq23Euf+CQoaq1ilJEDX14jJXl54hrS/lkhK
	 fLxAZ6l591iGY3ype+Xbyoi3Q9NorCnfo/P8LlkawO8/vmV3uqmZ2ZW4LBAAQgyOWnaue
	 F9bRy8mvsVY3pxAwqdFffvR7OUquYCMVsnmsrqN79tqYut+qV6WigEdFLOH/SV1a1Xc9+
	 ZBTfa/FNCCNxswjbEQdFrxlzZpL05wdg7VsTAjcvZ/4QIjNb11S+3W/WWG2Acd9GKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glRgQU3M;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547060A2612;
	Thu, 12 Nov 2026 07:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3547060A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glRgQU3M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794468087; x=1826004087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=By5QVjAwVUI1AeWsBe/qA6d0stQBpsl90fAMtId96As=;
  b=glRgQU3MCrIFQ3w1YNk7UlkA7lh6+2vYjLE6xEFCzD7k/bM3Jpq/18c5
   rq1ZdWxOANUrpU68AVIU3nheXc8Bg8Eya0EtMcUMpl+L/mSkYTAPN+ETB
   eVRsahL/EiGJtM7KGArBFBnj7s5KwZefUtNu94QHrVTB2a3mYR73K0P0J
   S2oHGXrV/5jN7d41pYSf+yF6cSOikJMsiSyvTLIqHh6J6lxenwQIOelVr
   3LKMXCUY8RSXzg9OCcJUNJEWEojNkLlN+jG2O1NIaI+g0/EJwoou26y7x
   fh4o27GWTFRfYh9Of6o50WSXWJcr6uxo+JFNLiOtSNaex9CCpEeAV1RUX
   Q==;
X-CSE-ConnectionGUID: tLWWmNv2SbuTP3q5ud7e2w==
X-CSE-MsgGUID: hklAKv8qRyikktfWTN//Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3142262"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3142262"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:27 -0800
X-CSE-ConnectionGUID: rS6yzvLcSImYNIRbDyDX7w==
X-CSE-MsgGUID: Ejd6bmB3RCm4g8k2y2xrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10318077"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:25 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 4/5] soundwire: Include the current stream when preparing again
Date: Thu, 12 Nov 2026 15:21:04 +0800
Message-ID: <20261112072105.1296515-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
References: <20261112072105.1296515-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sdw_prepare_stream() accepts a stream in the DEPREPARED state without
changing its state before parameter computation. However, the generic
allocator excludes DEPREPARED streams from rate groups and port
computation, and only includes a CONFIGURED current stream in group
payload calculations.

Consequently, preparing an existing stream again can reserve bandwidth
without computing the corresponding transport parameters. The filters
need to distinguish preparing that stream again from depreparing it.

Pass the prepare context through the group and port helpers. Include
the current stream during prepare even when it is still DEPREPARED,
while preserving the filtering of all other runtimes and the behavior
during deprepare. This supports preparing again without temporarily
changing stream state.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index e8e68dbe180b..9bacde2c67a1 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -188,7 +188,8 @@ static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 }
 
 static void _sdw_compute_port_params(struct sdw_bus *bus,
-				     struct sdw_group_params *params, int count)
+				     struct sdw_group_params *params, int count,
+				     struct sdw_stream_runtime *stream, bool prepare)
 {
 	struct sdw_master_runtime *m_rt;
 	int port_bo, i, l;
@@ -209,9 +210,12 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 				/*
 				 * Only runtimes with CONFIGURED, PREPARED, ENABLED, and DISABLED
 				 * states should be included in the bandwidth calculation.
+				 * Include the current stream during prepare even if it is
+				 * still in the DEPREPARED state.
 				 */
-				if (m_rt->stream->state > SDW_STREAM_DISABLED ||
-				    m_rt->stream->state < SDW_STREAM_CONFIGURED)
+				if (!(prepare && m_rt->stream == stream) &&
+				    (m_rt->stream->state > SDW_STREAM_DISABLED ||
+				     m_rt->stream->state < SDW_STREAM_CONFIGURED))
 					continue;
 				sdw_compute_master_ports(m_rt, &params[i], &port_bo, hstop);
 			}
@@ -224,7 +228,7 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
 static int sdw_compute_group_params(struct sdw_bus *bus,
 				    struct sdw_stream_runtime *stream,
 				    struct sdw_group_params *params,
-				    struct sdw_group *group)
+				    struct sdw_group *group, bool prepare)
 {
 	struct sdw_master_runtime *m_rt;
 	struct sdw_port_runtime *p_rt;
@@ -242,7 +246,7 @@ static int sdw_compute_group_params(struct sdw_bus *bus,
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 		if (m_rt->stream == stream) {
 			/* Only runtime during prepare should be added */
-			if (stream->state != SDW_STREAM_CONFIGURED)
+			if (!prepare)
 				continue;
 		} else {
 			/*
@@ -331,7 +335,8 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 }
 
 static int sdw_get_group_count(struct sdw_bus *bus,
-			       struct sdw_group *group)
+			       struct sdw_group *group,
+			       struct sdw_stream_runtime *stream, bool prepare)
 {
 	struct sdw_master_runtime *m_rt;
 	struct sdw_port_runtime *p_rt;
@@ -352,7 +357,12 @@ static int sdw_get_group_count(struct sdw_bus *bus,
 	}
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
-		if (m_rt->stream->state == SDW_STREAM_DEPREPARED)
+		/*
+		 * Include the current stream during prepare even if it is still
+		 * in the DEPREPARED state.
+		 */
+		if (!(prepare && m_rt->stream == stream) &&
+		    m_rt->stream->state == SDW_STREAM_DEPREPARED)
 			continue;
 
 		rate = m_rt->stream->params.rate;
@@ -383,14 +393,16 @@ static int sdw_get_group_count(struct sdw_bus *bus,
  *
  * @bus: SDW Bus instance
  * @stream: Soundwire stream
+ * @prepare: True when preparing, false when depreparing
  */
-static int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+static int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
+				   bool prepare)
 {
 	struct sdw_group_params *params = NULL;
 	struct sdw_group group;
 	int ret;
 
-	ret = sdw_get_group_count(bus, &group);
+	ret = sdw_get_group_count(bus, &group, stream, prepare);
 	if (ret < 0)
 		return ret;
 
@@ -404,11 +416,11 @@ static int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtim
 	}
 
 	/* Compute transport parameters for grouped streams */
-	ret = sdw_compute_group_params(bus, stream, params, &group);
+	ret = sdw_compute_group_params(bus, stream, params, &group, prepare);
 	if (ret < 0)
 		goto free_params;
 
-	_sdw_compute_port_params(bus, params, group.count);
+	_sdw_compute_port_params(bus, params, group.count, stream, prepare);
 
 free_params:
 	kfree(params);
@@ -686,7 +698,7 @@ int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
 	}
 
 	/* Compute transport and port params */
-	ret = sdw_compute_port_params(bus, stream);
+	ret = sdw_compute_port_params(bus, stream, prepare);
 	if (ret < 0) {
 		dev_err(bus->dev, "Compute transport params failed: %d\n", ret);
 		return ret;
-- 
2.43.0

