Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58D40097E;
	Tue,  1 Sep 2026 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231808; cv=none; b=hJKDTJHAy1f5T9LmMaA0Wdif9ihoMDdsRvZg9G5/Q2a/w4qVTwTQlDEDh0Rami9Qvg0zDk2/C6kQEliimgYTYqCfyeNkqTfyJZMFfpje3CCDVsgqMiynag/vkrrtypUdb7EFSLj5wMoiiwwKecTj/m7KffgnDGo+5vW4KusqN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231808; c=relaxed/simple;
	bh=GTmRIAn2P363Oep1gxLQSdSM1FNmlsGBpeM84HegzmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oOm4IHD4uM8W3CLqD1TZrfVvQPtrM/trn1k+/eIC+1QfR1cF/DpRlwS2LWeEJPko4YK60a6OAMaPzAz650s1EMgBMYnFVITXXySYvVVKEpD+iVoeHigtUHEyJbGUFJHCUgK2yh0Cr6dSHsyEkmdAcxzbrjP2NNyTzjMS5cEC9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+MQT804; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+MQT804"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788231807; x=1819767807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GTmRIAn2P363Oep1gxLQSdSM1FNmlsGBpeM84HegzmI=;
  b=k+MQT804gObqIwYpwjQyOjc8SGcjtuTx3N+FhkPzYT3abLmE+biml4H1
   DSvS80NxSN6aCur9VX1XvpJ5J0Gg3Xme/DJvP7BCVC06QjLDthJzHLFoY
   uXo6/XatDAsqvpg6lQQ1zrd2gt27EUmosBHJelfUXfHOuBZtHf7HvlYlp
   /lymWtTII/Lg9aVdvTzhSsT5gG/kwJxIuj3ynMDehiMr53MtBk9Z03CRQ
   7koKSKDiosabnergH5sES9EeMNT/wBODyH75Xw8SWko1NZjoYNzTS4J//
   evyfa7jgmf9OEL/61t9HsPHLSjDykUJjhyNN8z62HuvhYnh29yPqXf9gA
   g==;
X-CSE-ConnectionGUID: JD+BPQg3SMexlsjB4PXksw==
X-CSE-MsgGUID: PBJd4bgoQPCZcnGsO8dAnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87785643"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="87785643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:26 -0700
X-CSE-ConnectionGUID: NVWdQ38SQ8W7KYg0Ce346Q==
X-CSE-MsgGUID: xDa8jGtHRoa0d3yXQ4+UxQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 20:03:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 2/3] soundwire: Intel: add wake_enable parameter to stop_bus ops
Date: Tue,  1 Sep 2026 11:03:10 +0800
Message-ID: <20260901030311.232823-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
References: <20260901030311.232823-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we assume the bus is wakeable when the bus clock stops. But
in some case like system suspend, we want to stop the bus but keep the
bus unwakeable.
No function change in this commit.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/intel.h            | 6 +++---
 drivers/soundwire/intel_auxdevice.c  | 6 +++---
 drivers/soundwire/intel_bus_common.c | 8 ++++----
 include/linux/soundwire/sdw_intel.h  | 2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 86abc465260f..7a2e7e73ad63 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -188,10 +188,10 @@ static inline int sdw_intel_start_bus_after_clock_stop(struct sdw_intel *sdw)
 	return -ENOTSUPP;
 }
 
-static inline int sdw_intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
+static inline int sdw_intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_enable)
 {
 	if (SDW_INTEL_CHECK_OPS(sdw, stop_bus))
-		return SDW_INTEL_OPS(sdw, stop_bus)(sdw, clock_stop);
+		return SDW_INTEL_OPS(sdw, stop_bus)(sdw, clock_stop, wake_enable);
 	return -ENOTSUPP;
 }
 
@@ -261,7 +261,7 @@ int intel_start_bus(struct sdw_intel *sdw);
 int intel_start_bus_after_reset(struct sdw_intel *sdw);
 void intel_check_clock_stop(struct sdw_intel *sdw);
 int intel_start_bus_after_clock_stop(struct sdw_intel *sdw);
-int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop);
+int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_enable);
 
 /* common bank switch routines */
 int intel_pre_bank_switch(struct sdw_intel *sdw);
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index a8407560bf4f..77e09e0e9953 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -670,7 +670,7 @@ static int __maybe_unused intel_suspend(struct device *dev)
 		return 0;
 	}
 
-	ret = sdw_intel_stop_bus(sdw, false);
+	ret = sdw_intel_stop_bus(sdw, false, false);
 	if (ret < 0) {
 		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
 		return ret;
@@ -696,14 +696,14 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
-		ret = sdw_intel_stop_bus(sdw, false);
+		ret = sdw_intel_stop_bus(sdw, false, false);
 		if (ret < 0) {
 			dev_err(dev, "%s: cannot stop bus during teardown: %d\n",
 				__func__, ret);
 			return ret;
 		}
 	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET || !clock_stop_quirks) {
-		ret = sdw_intel_stop_bus(sdw, true);
+		ret = sdw_intel_stop_bus(sdw, true, true);
 		if (ret < 0) {
 			dev_err(dev, "%s: cannot stop bus during clock_stop: %d\n",
 				__func__, ret);
diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index ad1f8ebdbfc9..fa35eb2fc763 100644
--- a/drivers/soundwire/intel_bus_common.c
+++ b/drivers/soundwire/intel_bus_common.c
@@ -202,11 +202,11 @@ int intel_start_bus_after_clock_stop(struct sdw_intel *sdw)
 	return 0;
 }
 
-int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
+int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_enable)
 {
 	struct device *dev = sdw->cdns.dev;
 	struct sdw_cdns *cdns = &sdw->cdns;
-	bool wake_enable = false;
+	bool en = false;
 	int ret;
 
 	cancel_delayed_work_sync(&cdns->attach_dwork);
@@ -216,7 +216,7 @@ int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
 		if (ret < 0)
 			dev_err(dev, "%s: cannot stop clock: %d\n", __func__, ret);
 		else
-			wake_enable = true;
+			en = wake_enable;
 	}
 
 	ret = sdw_cdns_enable_interrupt(cdns, false);
@@ -231,7 +231,7 @@ int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
 		return ret;
 	}
 
-	sdw_intel_shim_wake(sdw, wake_enable);
+	sdw_intel_shim_wake(sdw, en);
 
 	return 0;
 }
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 9c9435009537..9710f2dc04e2 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -424,7 +424,7 @@ struct sdw_intel_hw_ops {
 	int (*start_bus)(struct sdw_intel *sdw);
 	int (*start_bus_after_reset)(struct sdw_intel *sdw);
 	int (*start_bus_after_clock_stop)(struct sdw_intel *sdw);
-	int (*stop_bus)(struct sdw_intel *sdw, bool clock_stop);
+	int (*stop_bus)(struct sdw_intel *sdw, bool clock_stop, bool wake_enable);
 
 	int (*link_power_up)(struct sdw_intel *sdw);
 	int (*link_power_down)(struct sdw_intel *sdw);
-- 
2.43.0

