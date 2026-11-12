Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493167;
	b=M3wfiz4Hqfzr08bWlNAK9+83o5mgk4a6MUxbZMKHfTmWk4tdpOAMY2KgSuFBqTSs3ez3
	 NZZB3mahNmUqR4vjHKPrz1LAQssYj8MReiFweXftPwD0YtUm/yRbH+Hycjjk3vGtIpxn4
	 O0+OgnaxbTlRKEA0OSFA1s+U+6QTD3jrf2stSi+y28hr1jcNwP1gDoh9E/nXALFkLOcBq
	 MMEekhTM05n0LIo7hzIuBd30kvKJ77URKs/NEeKgyrBnBq1qZSVOYrClot1xMliiJN2X5
	 HGw0lw1WDlZ9A9KlR7I3ndaiLmhSjOxt5vXEggbZRgHar+FNQ/vd+yB6aGkRRSZix+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493167;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wbsxR481pCrvxHGQEQ3zdwNuMuY6RhmxchmgjYRuRZo=;
	b=MFfYHiMlPU946//pkHdMPiiIk+A63HcbSurABKopP5uBwyUgiX79h4r5YuHYlRupb6bT
	 De7yvjbJgzyInMSF21z/fEUL2JTZ/u7/RQDwCQJ5daCTspTAjUaAiEnHgpUbVqM/Okgr7
	 nYjzl4R0L9wIdlmR+zbd2Lbh2r+HfqMzkgmEwDUjVeYX0//b4kO5yMbyPhlJADsZz3RID
	 iHj74/RBJWMKpibBgxeFH90LcOyuvJsEipB0UAIAXdYqkHIJIkQrjI1ySeE9ou1wEh7i9
	 hC6R4yoPDR4iWf+hDxyuWoNfrNvqdekUoquD/DkpKkBlTb4Yx6gbDrof2csEI85srRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=carDYvEj;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E382606A8AF;
	Thu, 12 Nov 2026 14:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E382606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=carDYvEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493167; x=1826029167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RX8Tk3LqR8rE6OuMIyTxAv5wN2o3UMpiKuJ03JYmYlA=;
  b=carDYvEjoNn2ROot1+lzyaEDdZpzrJKbS/j8bsxuLSCPRPgAS5+0PH+p
   /hvs7gr51KCnKkc4/BcvpFev1rlnf4ySEs/eB5Ci9lRlE79D8a8eZjX8u
   ub1qDxEwXWnrjGQktzjtYRuymI91r5cE8Z3MTX/f5+RAykYvg9hGcZb82
   BH5Pqj7ihyIO6sNUMQoLZguQ3ZVI0FMsdyvdvqtd1v0wFmxXf/K6I3/R2
   RcmRTtlrdOlNah5Ms+uoMRB/I3V97FkuwOAwW6cTICMNsL/igVsHsD2SE
   dH7ReKQA9E2vyto50pyf/gRQgiO9l8B3ZcaYQoiNZSP0pSYieojmCFuVY
   g==;
X-CSE-ConnectionGUID: 1bbfCJn0TOK/mA377GeWlg==
X-CSE-MsgGUID: l0kNlV8/TrqFcwyovKRNLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3377836"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3377836"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:27 -0800
X-CSE-ConnectionGUID: RjstRJoyQuySAR+8sViA+A==
X-CSE-MsgGUID: 7BbXvJlpRnOOPOcf0ybLuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8668780"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:26 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v3 3/5] soundwire: Select the correct runtime for lane allocation
Date: Thu, 12 Nov 2026 22:19:03 +0800
Message-ID: <20261112141905.1372770-4-yung-chuan.liao@linux.intel.com>
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

When multiple master runtimes exist on the same bus,
sdw_compute_bus_params() selects the first runtime for which an
additional lane is available. This can select an already running stream
instead of the stream being prepared.

Changing that runtime's port lanes accounts for its bandwidth again.
If preparing the new stream fails, restoring the bus parameters leaves
the active stream's lanes inconsistent with its bandwidth reservation.
Depreparing the active stream can then underflow the lane bandwidth and
leave lane 0 bandwidth reserved.

Pass the current stream and prepare context to sdw_compute_bus_params()
and restrict lane allocation to that stream's runtime during prepare.
Skip lane allocation during deprepare, when its bandwidth reservation
has already been released. Keep clock recomputation and the existing
group and port filtering unchanged.

Fixes: 7a30292ffa2a ("soundwire: generic_bandwidth_allocation: select data lane")
Cc: stable@vger.kernel.org
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 1250fe21a3ff..e8e68dbe180b 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -536,8 +536,11 @@ static int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt
  * sdw_compute_bus_params: Compute bus parameters
  *
  * @bus: SDW Bus instance
+ * @stream: SoundWire stream being prepared or deprepared
+ * @prepare: True when preparing, false when depreparing
  */
-static int sdw_compute_bus_params(struct sdw_bus *bus)
+static int sdw_compute_bus_params(struct sdw_bus *bus,
+				  struct sdw_stream_runtime *stream, bool prepare)
 {
 	struct sdw_master_prop *mstr_prop = &bus->prop;
 	struct sdw_slave_prop *slave_prop;
@@ -580,6 +583,14 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 			break;
 
 		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			/*
+			 * Select only the current stream's runtime. Check prepare
+			 * to avoid computing m_lane during deprepare, when the
+			 * stream's bandwidth reservation has already been released.
+			 */
+			if (m_rt->stream != stream || !prepare)
+				continue;
+
 			/*
 			 * Get the first s_rt that will be used to find the available lane that
 			 * can be used. No need to check all Peripherals because we can't use
@@ -627,8 +638,8 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 			}
 		}
 		/*
-		 * Set Manager lanes. Configure the last m_rt in bus->m_rt_list only since
-		 * we don't want to touch other m_rts that are already working.
+		 * Set Manager lanes for the stream being prepared without changing
+		 * other runtimes that are already working.
 		 */
 		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
 			m_p_rt->lane = m_lane;
@@ -665,7 +676,7 @@ int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
 	int ret;
 
 	/* Computes clock frequency, frame shape and frame frequency */
-	ret = sdw_compute_bus_params(bus);
+	ret = sdw_compute_bus_params(bus, stream, prepare);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0

