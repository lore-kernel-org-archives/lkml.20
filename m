Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234EF194C96
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759077; cv=none; b=a5ZAFw6ZRvr4A5sC44uH+mq5R0aCNsO6ks32mkIdb74LbTP4MFrxG9qqkRjHyj7PJV7ghU92nQHaStGYc7SIfP80dd49o5vO28MqTWtLkErIgCgCLg5cQfExUgbxmvhhM9LqJ5cdZqPJLYv2UBO3NkyIF/ctDzj5gstbf+GxKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759077; c=relaxed/simple;
	bh=crc9UaVmLql8ukSezMFN93JJ24pHEzgBFMr4z+eHLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogCs/4znLkmstdbJeUVGuJzDErVzUg0jJ2PCR0qqcRrs3ZitJVsImwgN2xTtI+VsIPkly+GP2SeREN5o8ykPbwjMbmjd8NE/8HHqZ+OlXHHL/Mc7jYlE41I+YOHn2M8uIRpqil/Ujx6LaC8E+GWKGJSRRc6NX4KPpfM0uR9xCiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0lM46SY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0lM46SY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759076; x=1822295076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=crc9UaVmLql8ukSezMFN93JJ24pHEzgBFMr4z+eHLXM=;
  b=m0lM46SYDwq83KEof+HxwOiwMd5QGSNhI1UxoFbykNa2Bz3ByvUa90SA
   lnfBzzTUXlpBOfMqnIkgM68sdLL61bkhtHtvhKMchEeIy6UiwAYpVQsr3
   FMZaH7Ss2my0SBEwqOhkbTIMtreGgGRA7V5MxJFV3wUCKkWpFQm2DZdaR
   Ua1PuhXkYhAjDfWBX51C//HQFEMb1FooOyBXP61j5yxNzaW+1kOLngd7X
   yoP5jslMgNmGXBLxCP+CnhOguME8/P00pWd1yz6BUkybH4jE9rDYqSNoc
   t7R39dfm3xFQiDjbjrYbY3ZrHuPtxFK3E1Z37qZZ5kr6j6B4IZWB7eW2b
   w==;
X-CSE-ConnectionGUID: Epr6E+0rRvaV2APbrqpMdQ==
X-CSE-MsgGUID: v0mqHeSEQ7y0fCSb6vsZ0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621822"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621822"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:04:35 -0700
X-CSE-ConnectionGUID: c5r9PKDGT4KpNOk6SxQpWQ==
X-CSE-MsgGUID: KeIQ6OgtRrCSxu5OAVwIZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188634"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:04:33 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 1/7] media: ipu6: update ipu7 InSys ABI to 1.2.1.20251215_224531
Date: Wed, 30 Sep 2026 12:01:42 +0300
Message-ID: <20260930090148.3980652-2-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930090148.3980652-1-divyamani.tripathi@intel.com>
References: <20260930090148.3980652-1-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the retired IPU_INSYS_RESP_TYPE_PWM_IRQ response type and add the
mipi_fn field the firmware now reports in its place, matching staging
ipu7's ABI bump. The boot-ABI and psys message changes from that
commit don't apply here: this driver has no equivalents to touch.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
index d5289f6add8c..6b72560b0a15 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
@@ -4,6 +4,8 @@
 #ifndef IPU7_FW_ISYS_H
 #define IPU7_FW_ISYS_H
 
+#include <linux/limits.h>
+
 #define IPU7_FWLOG_MAX_LOGGER_SOURCES		(64U)
 #define IPU7_INSYS_MAX_OUTPUT_QUEUES		3U
 #define IPU7_INSYS_STREAM_ID_MAX		16U
@@ -24,6 +26,9 @@
 #define IPU7_ISYS_NUM_RECV_QUEUE		1U
 #define IPU7_INSYS_SEND_QUEUE_TOKEN_FLAG_NONE	0U
 
+/* Value of mipi_fn below when firmware ABI < 1.2.1 does not report it. */
+#define IPU7_INSYS_MIPI_FRAME_NUMBER_DONT_CARE	U16_MAX
+
 #define IPU7_LOGGER_CFG_CHANNEL_ENABLE_SYSCOM	BIT(1)
 
 #define IPU7_ISYS_MAX_STREAMS	16U
@@ -107,7 +112,6 @@ enum ipu7_insys_resp_type {
 	IPU7_INSYS_RESP_TYPE_FRAME_EOF = 8,
 	IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE = 9,
 	IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE = 10,
-	IPU7_INSYS_RESP_TYPE_PWM_IRQ = 11,
 	N_IPU7_INSYS_RESP_TYPE
 };
 
@@ -198,7 +202,7 @@ struct ipu7_insys_resp {
 	u8 pin_id;
 	u8 frame_id;
 	u8 skip_frame;
-	u8 pad[2];
+	u16 mipi_fn;
 };
 
 struct ipu7_insys_resp_queue_token {
-- 
2.43.0

