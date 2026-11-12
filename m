Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493166;
	b=07IxyA0EaPnLaFdNKbsRGt4HPiCMnlQ6eLSTIQCdsoJBqme3inCcGjVmqus3Z82Em3Zr
	 S6F8UqjoG6xv9WbtAdLfwMRWHG9AkzaY0dUb99zyd5BAQA0sVxThTL56YwNZJOhbAj3Xc
	 ZSd/2bQ4dLlfKECVDlwbAQvcYSsre5t5Em2Glg1laNK3yfhvJ7Mpv5I+HJjkkLZc0giOB
	 S4WA99lO2vFX/Z9l2l9Cs4JCyENcRmBjjF2COflHxp8tooF9Q1BRhdZEejHbYMTL8gP0h
	 zzVNns9QVzm96cni1XDgWVVGNyfde6C2aNznapRXyXpjbgwxgbDQz7MISKG5P3N2jmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493166;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vVEw64Qgn+N8CLDRHbBJ3vSYbgbA6PZt+q/2f0iYTnk=;
	b=CJKCx/watAvrOc1cnx/E+5q+pXA8Mv4LsSGi/9Ag6UgKDUt436E83/5wt3Tx4EeO2Z39
	 PY6RrRh6D/DxgUlwu+xhOLaxYht2qtoCFEclBsJ+ep0f992VmXP++PxezBwz/Rjf7mevs
	 FhAxtqzE3nAWytcVSSm6+8kltHnGQwV4tibCSAS5pk0K4DF4Dd2kuE0i5jgltcdFyNYZK
	 7s/D+38X9FLiZXrUCeBrGqxmYhEokN/230a+yy06ONJdZwimqBSyetD9BBfVFI3t3pLyT
	 iyX1atX1B3xN9TOYgLgKcdUoeHR/RqPBcGySNnHdxijF+w6MwUe84Sv1r6vdfFyAH+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cHacF3ux;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B37606AE19;
	Thu, 12 Nov 2026 14:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B37606AE19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cHacF3ux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794493166; x=1826029166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DTFswADvEmWeLCiAMLXdJKa6z2juxV0AkQ0SMqeudkk=;
  b=cHacF3uxxiQW71YxRTwOpvM93WM+Q1htMMar3ynYgIn38r63vC8WUmSp
   FpXwHbQtsMkwGZ44auI3DiVWLUIdVwQ1uWTmSHFiBtYH9IT6POiTI/LUM
   k+dT2klyGle4G6IGquJHdAgTZg0VWpPj3KGx572LBn3kBaVWCQpl9cdGz
   8qXyMh9ItL8xI9y42cbLVqbO+d3dfgi9D2et9KGfRCi2c7Qb6BzXdENjR
   TKMLWvFuiIhpoNcJu07CVbee9m1s6x0UeTP8/QPTBaC1+YKwYjctRUs7p
   /k46H98VkTiqQ/QR7aAUqeEiGsPPII+dObp7H7sfZfFJROBC9FwO34SVc
   A==;
X-CSE-ConnectionGUID: dc2HrRYsRPWoBT2vxcsnwQ==
X-CSE-MsgGUID: 3m043YkPTSGXrV6bFs4OSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3377828"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3377828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:25 -0800
X-CSE-ConnectionGUID: O9DYl+ONQ4eWI/jHJ8551g==
X-CSE-MsgGUID: hUtgbYltQkyyqIuaYJzQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8668768"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:19:24 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v3 2/5] soundwire: Pass prepare context to parameter computation
Date: Thu, 12 Nov 2026 22:19:02 +0800
Message-ID: <20261112141905.1372770-3-yung-chuan.liao@linux.intel.com>
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

The compute_params callback is called from both stream prepare and
deprepare. A followup commit will make it perform different actions
depending on which operation invokes it.

No functional change.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/amd_manager.c                  | 3 ++-
 drivers/soundwire/generic_bandwidth_allocation.c | 4 +++-
 drivers/soundwire/qcom.c                         | 3 ++-
 drivers/soundwire/stream.c                       | 4 ++--
 include/linux/soundwire/sdw.h                    | 9 ++++++---
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3316efdf8ac..f40a3af4351f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -465,7 +465,8 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	return slave_stat;
 }
 
-static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
+				  bool prepare)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
 	struct sdw_transport_data t_data = {0};
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 3d6b9c895e46..1250fe21a3ff 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -657,8 +657,10 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
  *
  * @bus: SDW Bus instance
  * @stream: Soundwire stream
+ * @prepare: True when preparing, false when depreparing
  */
-int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
+		       bool prepare)
 {
 	int ret;
 
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..73d3bdc4afc2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1215,7 +1215,8 @@ static const struct sdw_master_ops qcom_swrm_ops = {
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
 
-static int qcom_swrm_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+static int qcom_swrm_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
+				    bool prepare)
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	struct sdw_master_runtime *m_rt;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1d74aa982a4c..06f051f03a21 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1502,7 +1502,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 			/* Compute params */
 			if (bus->compute_params) {
-				ret = bus->compute_params(bus, stream);
+				ret = bus->compute_params(bus, stream, true);
 				if (ret < 0) {
 					dev_err(bus->dev, "Compute params failed: %d\n",
 						ret);
@@ -1804,7 +1804,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 		/* Compute params */
 		if (bus->compute_params) {
-			ret = bus->compute_params(bus, stream);
+			ret = bus->compute_params(bus, stream, false);
 			if (ret < 0) {
 				dev_err(bus->dev, "Compute params failed: %d\n",
 					ret);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index fff30bb2d9ed..0e37b7d5ec48 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1019,7 +1019,8 @@ struct sdw_stream_runtime {
  * @controller_id: system-unique controller ID. If set to -1, the bus @id will be used.
  * @link_id: Link id number, can be 0 to N, unique for each Controller
  * @id: bus system-wide unique id
- * @compute_params: points to Bus resource management implementation
+ * @compute_params: points to Bus resource management implementation; the prepare
+ * argument is true when preparing a stream and false when depreparing it
  * @assigned: Bitmap for Slave device numbers.
  * Bit set implies used number, bit clear implies unused number.
  * @clk_stop_timeout: Clock stop timeout computed
@@ -1054,7 +1055,8 @@ struct sdw_bus {
 	int controller_id;
 	unsigned int link_id;
 	int id;
-	int (*compute_params)(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
+	int (*compute_params)(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
+			      bool prepare);
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
@@ -1069,7 +1071,8 @@ struct sdw_bus {
 struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name, enum sdw_stream_type type);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
 
-int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
+int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream,
+		       bool prepare);
 
 int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_config *stream_config,
-- 
2.43.0

