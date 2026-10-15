Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD50A3BBFD0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042139; cv=none; b=Nx0pB7uMqFFXMpafRAVEIkoFiQ3QDvpN2DMQufGk42LoASmFwIVUpbR0g7p7rbAX1z49Yo7uVDAUedCF60MLYVwHSp+I2THXRaW4Y00nm7MB0JfXz5IJQiL9yOyG+gEA7bthODUMibniz9g1wnQJ5Wp/WTjLLVfb6lyx/ijBl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042139; c=relaxed/simple;
	bh=A97vlOYOPztpqkl/7WvApY4fo2D7MM+AAOuFU9WGDsU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMyzqGsGV5fy64MxUddPCrlmk+N4Lq/iZAWeqNbijReQI3kujmuYnoHehifMNeQtU2fbic86iQ0BwmsGYCvxgEqQ0QEEhv0yWDJaNjyE9tHAJJlf+t0OWa6Hmxvez3pW0Y/b5UnO65Gr660rcjqZSpgvzwZjLMzE3J08jeQ5h50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEqmiUGm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEqmiUGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792042138; x=1823578138;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=A97vlOYOPztpqkl/7WvApY4fo2D7MM+AAOuFU9WGDsU=;
  b=EEqmiUGmKVrDLAaAA3gVd4gwIsrqQ6/WQ74vCHnWeD0EqssDO2kuilHp
   VigYHhLcgyMkGVaVk5mpXvAXnrv4SHv46iBdXkyFjFy2AUKDXKoJ69YJU
   5l3F6O61+wAfQ0jXkbACtFx85vnycnmwMymavP5zwn6p246ATdqJbEa+e
   kS6khezvVLOq9TidF+bXn6z70wxrmt2NmeHnIjwszOScJa5CD4ipG3oNe
   teoPYv/e+EHUY9IU7bpmCLWiSEo0iej0GYkqcTdkVw7HxvAkA8SYRPJt2
   bItSKh9tNvBvpRgFhBOVvyWq77LSh8l4eTS24hycazgVFP9JvmsmJmA6/
   g==;
X-CSE-ConnectionGUID: kyNAAVl+TpWC+KVEdX8cSg==
X-CSE-MsgGUID: a5Gxjp5yStq77lft/l17Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="813092"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="813092"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:28:57 -0700
X-CSE-ConnectionGUID: spdjT8QTS1O8cziCvbvlvw==
X-CSE-MsgGUID: iSdMk6feSe6DAYMOGmJx6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1928827"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 22:28:55 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH char-misc-next 0/4] issei: runtime power management, dma
 and in-kernel interface
Date: Thu, 15 Oct 2026 08:28:40 +0300
Message-Id: <20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB3IKFraqxQJkoz2X5hKRkQQ7
 97U5bd47yTTDDV6VSdl3WH4pgKpKwqfMc3KiMXUuKYXJx3DTOHXxY8pemwTR3mKhPhoNTgq2Zp
 1wnEv3/9H5gUWOOmx0XBdP6IlGGRyAAAA
X-Change-ID: 20261015-issei_pm_and_itf-d1911cd73ec0
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Reuven Abliyev <reuvenab@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792042134; l=1353;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=A97vlOYOPztpqkl/7WvApY4fo2D7MM+AAOuFU9WGDsU=;
 b=/GjW9Db20Vjj+r3X+LMpLq9k/QQBox/18Pv8hCuxpfOHIMmkdQ7GOfJKVM6AIk/MtWrbfejgc
 rSecgudgHjRDrobh/VLnOcFRnUnc5936cScpHQerXp0ofADHCvWkzh7
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Pack of additions for issei driver:

1. Support for runtime power management
2. Support for DMA allocation on request from client
3. In-kernel interface that allows kernel drivers to communicate directly
   with issei.
4. Fix for power down flow

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
Alexander Usyskin (4):
      issei: save power_down flag while processing event
      issei: add runtime pm
      issei: host_client: add dma allocation support
      issei: add driver to driver interface

 MAINTAINERS                       |   1 +
 drivers/misc/issei/Makefile       |   1 +
 drivers/misc/issei/cdev.c         |  12 +-
 drivers/misc/issei/host_client.c  |  70 ++++++++++
 drivers/misc/issei/host_client.h  |  12 ++
 drivers/misc/issei/hw_heci.c      |  21 ++-
 drivers/misc/issei/issei_dev.h    |   3 +
 drivers/misc/issei/issei_device.c | 268 ++++++++++++++++++++++++++++++++++++++
 drivers/misc/issei/main.c         | 233 ++++++++++++++++++---------------
 drivers/misc/issei/pci_heci.c     |  21 +++
 include/linux/issei_device.h      |  84 ++++++++++++
 11 files changed, 612 insertions(+), 114 deletions(-)
---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20261015-issei_pm_and_itf-d1911cd73ec0

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

