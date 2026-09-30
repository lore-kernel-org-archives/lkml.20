Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2445041A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759101; cv=none; b=gnZyxV7DJPqFrW9EAyVM8ZhBnGFPu37V7aw/gvRSkxoxReEl4+pFxuBNxDGxl/vLkewFdyldOy+7OgHilvDXRsyTEn6wmoJackiixGwZm2DbETLU4x7EirHvf64QFW1h1hrky7TvN1IKz/AYdJFdlwPIR6c1Tfb9NNgndamDd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759101; c=relaxed/simple;
	bh=gaxr4yKGdjRjG/Jv41s6laP+4DgqnbcAhvkfnP0/isQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLycZa1ybgYK7lr+2g4nRO9pu7sD6eyOQ1o5AssfYe3MVWzaxSpf9yGxtwWptzvvMyXOge1guRtql6VchMpm4Ya6jXgaFccx4o/85iCQVMAHwxDEcpo1gwrc4/h1YAbJnqkNHln7N3ZyVfEmH9KTQVDo5MZc4xxVFL6SNfRxqtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+tH1RH2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+tH1RH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790759100; x=1822295100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gaxr4yKGdjRjG/Jv41s6laP+4DgqnbcAhvkfnP0/isQ=;
  b=n+tH1RH2Z0gq0uKJPzxiuszWKhq5GLxHJjvmCxIHa95wXr5omiV4Gfwe
   8IUyTUn9dP8atxHk++cbqP4S/9WpRTsDwZmsKv0hQXGxRdQ7BL+sRWcJn
   qIGondVQ4v1pMN6AyiSkVs66t4EypuIASLsLCcp6uHM0nfeHXGTdX5Crt
   DzQKEYxWMXHlpdYGEGubOU0kq9F1cUSHJbNKhlLrdSebSd7W2hm8mXKDi
   2B+baoyD3qhkSTf4wpk1YYmd/9Tni3itBVJ7cP9/CNG8dzlAQGTkEOKxr
   7JbfEiRNKOTWxLohDDVjcrsSySrQZjCrfOlwVRdqKvsEFcbOCOaxk0B2u
   Q==;
X-CSE-ConnectionGUID: fjTEzBdaSSa0iY9piloSlw==
X-CSE-MsgGUID: 8bEU3UV8S0uDW8D2wtDyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90621844"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90621844"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:04:59 -0700
X-CSE-ConnectionGUID: ywpLiy2VQTKYXEH0RvY7Ug==
X-CSE-MsgGUID: m0uADQuAT4edxqRYgZsCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="275188678"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 02:04:54 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 2/7] media: ipu6: add IS_IPU8() macro
Date: Wed, 30 Sep 2026 12:01:43 +0300
Message-ID: <20260930090148.3980652-3-divyamani.tripathi@intel.com>
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

Add IPU_VERSION_8 and an IS_IPU8() accessor mirroring
IS_IPU7()/IS_IPU7P5(), plus the IPU8 firmware/model name defines, as
the baseline for the rest of this series.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 72c5063d5198..20ffbb4a9934 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -18,6 +18,7 @@ struct ipu6_bus_device;
 #define IPU6_MEDIA_DEV_MODEL_NAME	"ipu6"
 #define IPU7_MEDIA_DEV_MODEL_NAME	"ipu7"
 #define IPU7P5_MEDIA_DEV_MODEL_NAME	"ipu7.5"
+#define IPU8_MEDIA_DEV_MODEL_NAME	"ipu8"
 
 #define IPU6SE_FIRMWARE_NAME		"intel/ipu/ipu6se_fw.bin"
 #define IPU6EP_FIRMWARE_NAME		"intel/ipu/ipu6ep_fw.bin"
@@ -26,6 +27,7 @@ struct ipu6_bus_device;
 #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
 #define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
 #define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
+#define IPU8_FIRMWARE_NAME		"intel/ipu/ipu8_fw.bin"
 
 #define IPU_VERSION_6		BIT(0) /* TGL */
 #define IPU_VERSION_6SE		BIT(1) /* JSL */
@@ -33,6 +35,7 @@ struct ipu6_bus_device;
 #define IPU_VERSION_6EP_MTL	BIT(3) /* MTL */
 #define IPU_VERSION_7		BIT(4) /* LNL */
 #define IPU_VERSION_7P5		BIT(5) /* PTL */
+#define IPU_VERSION_8		BIT(6) /* NVL */
 
 #define IS_IPU6_TGL(isp)	((isp)->hw_ver & IPU_VERSION_6)
 #define IS_IPU6SE(isp)		((isp)->hw_ver & IPU_VERSION_6SE)
@@ -42,6 +45,7 @@ struct ipu6_bus_device;
 				 (IPU_VERSION_7 | IPU_VERSION_7P5))
 #define IS_IPU7_MTL(isp)	((isp)->hw_ver & IPU_VERSION_7)
 #define IS_IPU7P5(isp)		((isp)->hw_ver & IPU_VERSION_7P5)
+#define IS_IPU8(isp)		((isp)->hw_ver & IPU_VERSION_8)
 
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
-- 
2.43.0

