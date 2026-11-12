Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468083;
	b=Nj9AhGMR0Rl9gAk6GFB03Cy8PFSPA1GU6ZeJ84VzlmLKnqzE98SOlkXYQBdcYOARAaN1
	 pb+SGiZgOKNY1yn3uttJ9FdC49OPjxu9O6vGPGUVaE1syqBVB4RoQp0CAYgf8N3SjS7CK
	 kqbyM2th8kUV0v7NqLY5egA6SiJGqywUNapg1fkEoz/wBY1ISFopyucbjNa0ITcVJvjXE
	 XJRtpXemFzztghJtwP/nTzs4XDb9wbOsP5cOEqsIawOCvDP1fPPhoiSkSZeQNNbNXQDe3
	 8ypguC6RgttkG7hJfIQ1RIcETLAZPk8n1P/zsjMi5LUHClDvaSCrQSJ79GiF6uGDKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vVEw64Qgn+N8CLDRHbBJ3vSYbgbA6PZt+q/2f0iYTnk=;
	b=hTRDIDp0GQyd7zg9lmRNXZKOoyaId/Kn3Z2UE012ohf9jKnLahU75MhZL1W5wnEucU8m
	 2gy4ddxwQLoKaEJMgNxFBmIAlt7frU8fFc26iGwEnR19bLOB3JL56eEgzJzUzrXoI+N1G
	 2pJv7DCNBkf7UgZuJNftEmhb7P9/TM6w9S0Zr21QdQDKtwUBKdy8SBVGZb6SMQ8ySUf0U
	 XD1sWwbJKuZinQUvqh4ftvPBqpFb4S9Wafvf82rx4H+qlZXFxnoX8kSP5OB1FRpGRJZkw
	 DJw7+oJVfSFPkNNDq6/KJyWbJzyQ/Y8UjBntsKOl+JbrkfiWmjSBGW8/hJE1KpSjwhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fTIbDFiz;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615EB606A8A4;
	Thu, 12 Nov 2026 07:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 615EB606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fTIbDFiz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794468083; x=1826004083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DTFswADvEmWeLCiAMLXdJKa6z2juxV0AkQ0SMqeudkk=;
  b=fTIbDFizMX8mYR6nWSiqtQj4b9YICutNDbIBemPRDoe3WvroxZp1CEX1
   jVJPyWr7vlh2YepkjY4veM/Qg7WbjGvrc4Jyqauf3Gcla7fYICzw60w7r
   lZniCpF3G0hwwYd+BsvJDQATZmb3CatHG5J0Vp9snhToqW61uuusX/lgn
   YMSRQmPRZGd9FB4NBM6Ypz0FSoZchvoyTIvZmoeIHax6gSV7Z7wfw5Mcq
   k3Am50dg+Pn2/yQuA+NzvV6aRvrVKMFlweZC7Y1/6RmPQkEDgjuVzRonD
   ojK7yrGYM6/SGNCRMIJ8GQ3Ds3yeL++RnDwuQYf6CVYVzvs2ew3Gspa9W
   w==;
X-CSE-ConnectionGUID: 4hfNsgd6T32/qJmKoMfLlg==
X-CSE-MsgGUID: ptzHBD2aQoqRdNZvKQyqvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3142254"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3142254"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:23 -0800
X-CSE-ConnectionGUID: wc5uGZ9eReGZlmP4EzLVqg==
X-CSE-MsgGUID: EuQ0OJvkSmCfB9f2jVcN8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10318068"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 23:21:21 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 2/5] soundwire: Pass prepare context to parameter computation
Date: Thu, 12 Nov 2026 15:21:02 +0800
Message-ID: <20261112072105.1296515-3-yung-chuan.liao@linux.intel.com>
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

