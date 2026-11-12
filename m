Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493169;
	b=G+mr50qeI5islKtD9GjoWba53wZ2/chbRYobAcrAC8xhhNscTNDhioqe/wuhEOnFM9UR
	 FhY/JiHldxWkK9vY4Ofsbb/r+V/XdPNCO25ZAAWuVnii/Kr24omVU09E+KclJ3yxqGj/V
	 0WKBKD87LO+WFe7FZ9BnWbfQcPIqetEZIaFTedFeBlNelYrKh7+Ik5KVECIHBFzRZZppc
	 QyJKwcccgfqc1Dq90qUugdRigOpkU96dNvNH+t8/HHfIEE/8MW6SHtLyP/fLQz8Zvafit
	 /NL81zAiBkoJdX8C6cZhIx/D6MPQEn2dbZog0eCRt9t+/i3aYtDD4AMT3qR2okNmFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493169;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Qrab5ZFjFMYytZiJyGN3w/QXHi/fU6bhjvwr0O2dHGw=;
	b=Itrip7Qln5uSo0VWZPsXhsbHSe1SK4VBUcQ03uVeMAt1rLSeSkzc09vSlS/C9xOx6PKa
	 m4QHpMG/QU7MC+NFT2igsC+5JftPPcrtI8mVw6Uqnsj2OkOnQel3oYnN47jsejyHgrUgB
	 8g2THaRwDLrtSrvX81tiK1NOtDMflzNwV02fnUslvWozi2R3qozNMG2LitJqBn3kUXLTy
	 PKXMXSxR5nwQVS1MdH4SjjZuZc0hPXbmSB1JKjtBU+WIKcO06IlxXQTMQ7UZqx2udW6pE
	 Abqj3k+Lpf5hYo9hlnhsO8/lWSD6aGuN0Couy58kJnrWRBLHU4wlThuzSpcbIiNl4zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vb6kv3uC;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCCC6071143;
	Thu, 12 Nov 2026 14:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCCC6071143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vb6kv3uC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493169; x=1826029169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=By5QVjAwVUI1AeWsBe/qA6d0stQBpsl90fAMtId96As=;
  b=Vb6kv3uC7mUzZI2rKKZLlEhjHdCLbfuvhoFfr3ZRyqr/CKMz6oN2iDZh
   zuZ+KNh28V8HlFZI8iE5mYRNaj+/C/RXHJq7UKGmJdLaFr8fekbzfZnIS
   xQNiTVicWePxxG6hsRfvxbbkXaNwqt7T/XEjKc9ieiTQZd5oOLF6T0MIH
   fFNcuxc+293baWVLhIL+Cph/OTf4MNVTo2CKsICUsfSVxvKVCc5m3EAFp
   4N+/x0sAksLZL9VVfOFxX0CAFJe5rFKLebPb1NQxN9yo8CRmKNZQIuVL4
   5a/o6MecvfYogrKFnt+iwcK8Wq1KlOuPn9bg1RmBJ8Ugq0fXb2VRatPYt
   w==;
X-CSE-ConnectionGUID: CqhbW+cqRrKh28g43tpjzA==
X-CSE-MsgGUID: r+LtvyPoSpib9mRjMsEdmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3377848"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3377848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:29 -0800
X-CSE-ConnectionGUID: Qe45rsQ7Q1WEaMghipPW3A==
X-CSE-MsgGUID: vCCqcE7kS/uNbUUXfP2A5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8668793"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:28 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v3 4/5] soundwire: Include the current stream when preparing again
Date: Thu, 12 Nov 2026 22:19:04 +0800
Message-ID: <20261112141905.1372770-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
References: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
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

