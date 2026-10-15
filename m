Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6F52269C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069109; cv=none; b=pd/MMBw3jr0wM0s0nC0MnTK5gkgfgNfoSXGoKIvqU/vx9vAmWcBd4OV/G1acQM+AhP0M3TkCl1ngISNezseGq55j/yoSMJaYdR0HHo5Y8+E0uq/A0K2bWdUo3BGFpb2Txa+ZaebyVeIeDGY2Cnm3hXxyvvq8KX/9PVGupSBz4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069109; c=relaxed/simple;
	bh=sml2KZ49LgUX0TH0i//KiMPpt+xLyhZ2EZNA9prH/BA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TaJKU35IHu7z01+4V2lKXF0mXWlZgoD74AGa7uDL2/4s+hnZlPdTiYh7ZR2LvsFKK3q2xdiDejWXidWt0La2MmsDvr3L7qhaiOvaknEpZFJQhvH4vs+l6UOhv6/uzVSNhDaB/+mTkGo2fT8X0Ob0OtlrdmsP8dC1TVxnPL36tp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/kiYzAB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/kiYzAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792069107; x=1823605107;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=sml2KZ49LgUX0TH0i//KiMPpt+xLyhZ2EZNA9prH/BA=;
  b=i/kiYzABelFJg/3+QSEiOcMsqPx34I+UjvhaAtxhGV3ecyCup6FQUjAV
   1DdQ5U1VEzqY/I6rULxYu6hKpaJ+bpAB7cfnRqHdKpT3rHstjhNfE2z9x
   jufycoV1gYzkwEhaRj2qrAfnH5dVDdvlZg7IGiLx5fOwewssvgU5Ct8wS
   GiLDblSiFix4xY9oyKNVKs4DJTWWmIR0WEvGHiGbDHXgmA0vqOWKpG4be
   GfEc1WxNxS2O9P18XGpa3R9AxdW6RVpacVRiuXdssi8pGzEi/yBhqdkTi
   prJQp1AuvozY8s6bGQCf1zM1zuoUeN8jlrkB3xKl9oAbQKqmhk8KwM4dg
   g==;
X-CSE-ConnectionGUID: LVPIBpYTTX+KtnYoZqZF2A==
X-CSE-MsgGUID: xFUlp6DuQ0qNklHfLhcz8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="732967"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="732967"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 05:58:26 -0700
X-CSE-ConnectionGUID: Jogc6unSRnOLcPbHIHKFvw==
X-CSE-MsgGUID: mH14OLV1QHWDuaCXR10aeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2014961"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 05:58:24 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Thu, 15 Oct 2026 15:58:14 +0300
Subject: [PATCH char-misc-next] mei: stop rescan work before bus cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-stop_rescan_work-v1-1-3445fa3d7a1c@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDuQKGrxKqWIpr91KCYyI60g3
 r1pl9/ivYMMKjDqioMUbzFJMcNfCgrzEJ9geWRT6crGO1+zbWntFRaG2H+SvviKxo0OmNqqppy
 tikn2//L2eygvYoEj9o3u5/kF+BsYNHIAAAA=
X-Change-ID: 20261015-stop_rescan_work-8e60b0eef735
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069103; l=1079;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=sml2KZ49LgUX0TH0i//KiMPpt+xLyhZ2EZNA9prH/BA=;
 b=6cneIdCBj5TTGuWLYd+lAGtZORiMC9/CceFpbUcc8bV+xxzX2KgnxpUWgQ6O8IRFp4Myysy0T
 a8moA1F4tH9CT504urGs9WSbktFyec6hVXPnnDHDXeOSc/vxzr21iMv
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Cancel workers between setting driver state to MEI_DEV_POWERING_DOWN
and bus cleanup routine to ensure that stray bus rescan work
would not clash with the bus cleanup.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/mei/init.c b/drivers/misc/mei/init.c
index 82444d67db2a..56ecfccb9544 100644
--- a/drivers/misc/mei/init.c
+++ b/drivers/misc/mei/init.c
@@ -310,6 +310,10 @@ static void __mei_stop(struct mei_device *dev)
 	mutex_lock(&dev->device_lock);
 	mei_set_devstate(dev, MEI_DEV_POWERING_DOWN);
 	mutex_unlock(&dev->device_lock);
+
+	/* Cancel background work items (including bus rescan) before bus cleanup. */
+	mei_cancel_work(dev);
+
 	mei_cl_bus_remove_devices(dev);
 	mutex_lock(&dev->device_lock);
 	mei_set_devstate(dev, MEI_DEV_POWER_DOWN);

---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20261015-stop_rescan_work-8e60b0eef735

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

