Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2E484220;
	Thu, 27 Aug 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845889; cv=none; b=SthSiaD3t8OcVdp4F8uasT//VPsTy6HdRjBF5Kfjjc1pEVUTSoQsAkDeRsgoZ59TwIuOSxoWc+vyk0gXaaKcQXYnRvn4NejmuNjV56ATRa4WRfxfxRWLCl0lolv/Uo+pKyZ4+GLiFHrKQe5v6/gUERKBw5CUA3kJe0zZ4NncOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845889; c=relaxed/simple;
	bh=IFBIz/CJUudVZpZ9GfA5YS3dq79+i7KWAO8EhYGguRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSaobVXIoMQM7xfaFuMLptJGap1FIsqGQAa6tqpbHiTZ4WKWocvPGYGuZYHa8dGyuT7O1VM7PSmxm3en3hSJjgnWIv69hXfcCuRu3WldOXVmLsNznruvNvp7LMrCgR5OI5OkSYY40VJJQFwxGFNrQT2/Trio0/HeapSoKnoZphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDhDD6Wu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDhDD6Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787845887; x=1819381887;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IFBIz/CJUudVZpZ9GfA5YS3dq79+i7KWAO8EhYGguRY=;
  b=aDhDD6Wu7egRjyQyISCaZxXydDqLeboy2HXAuDrmE/x3JxL12ZTFKnER
   97R48KL3i4d95XGpm5n5548vV6AUdhTweUSeEmdJNz2JPRb/6W64nNv85
   sNJNKTaG6QvE4JX5XW8Y/T86mlRozGQYdMWHx+Z9FiFVYU5CE2SECC+V2
   gi/eUEsVDADnpsWHUUUW3R3/0Jsm1pyOHQ209qaxgnr5FK9jjzS6k5C7E
   EI1UwiPXijZVUtlU8c8KVLefVArhFT+1n59DcwT/W/z4ElNYaXoTQKVOX
   CrhcB9FJQcLooihYOOuYsBf1vXBbFScf4rqkzyECg93Be/M6ZDrzYj1tN
   w==;
X-CSE-ConnectionGUID: IvCl0qcxTfyDuf5GDmK5Tw==
X-CSE-MsgGUID: 7xbt1XWxSUaJCq6l0Faegg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99510545"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="99510545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 08:51:26 -0700
X-CSE-ConnectionGUID: Z896Bc9oTsShcrVyB+H0GQ==
X-CSE-MsgGUID: ZcyVbgBTQGCCUMTwjYGYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="297793924"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 08:51:26 -0700
Received: from ray2.intel.com (unknown [10.125.109.108])
	by smtp.ostc.intel.com (Postfix) with ESMTP id BA6D35E92;
	Thu, 27 Aug 2026 08:51:25 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] gpio: usbio: Remove bouncing maintainer
Date: Thu, 27 Aug 2026 08:51:27 -0700
Message-ID: <20260827155127.2334936-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email for Israel Cepeda is bouncing. Remove the entry.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24ca91ce5d865..7f147a95940ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13521,7 +13521,6 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
 F:	drivers/platform/x86/intel/uncore-frequency/
 
 INTEL USBIO USB I/O EXPANDER DRIVERS
-M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
 M:	Hans de Goede <hansg@kernel.org>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
-- 
2.43.0

