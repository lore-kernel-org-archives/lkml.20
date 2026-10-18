Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366323A5E78
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315893; cv=none; b=IVJUybmzlOEXgkM3WcfGXSCaSZ6CpkjgS4GVn/FEu8LSqPUosjssxcflzeERMmxVk2u9V7nz0YMepi/aaR7qScsmKd0asCqPNQpTO74dVglUwKbGkgDpT2Q5kBebLyOGEZA2o6XzJM9J86HU5eZr3bW7x2PlPvP+yuNCFN7X+7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315893; c=relaxed/simple;
	bh=u3q1W7eUTnhzPQF3Ovki4vJaAe0fjjtoh5quFJ3/kbg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iIEgcL9Q/tkvAh1QQ7WRIASyXo4cxQBsw97g9G49AsEL781PgpkRlS6+WdOBgLNni7IdVR2/kYAT2UjZnIVhXRut5thS+JIVBYBJnFSHiYS2DQ10Y5QEQiWFvfAWetlJmne5n2rNgAgqT435yMgsY3YaVjrPkrPGNBZNBjr0k8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df7I4RKb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df7I4RKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792315891; x=1823851891;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=u3q1W7eUTnhzPQF3Ovki4vJaAe0fjjtoh5quFJ3/kbg=;
  b=df7I4RKbwT1f78orbYd62QopEa3F6wEQSEet90DJpAe5yrTt/991+YqJ
   7+0I464jtQjG4tzR5GJ4p+N7FEV49Y/ykCz2mLXVEH0fV2P7vikch5xvn
   x+veyPyxnD3ZDFvIer7oxMXACs1OvWNO+PTc2wZ4Tr251SGFV7JcqUxoI
   DcEBc3X7R6s2U0ZkD6AalMVVdhqe9W72Sas97K1jsXhlX089uM6PEmVbw
   jXUdFSrLPXzEZDcSDZ3G+PtqyRL3eU76uNPT7+hhsWYlC7TwCcRG684pC
   1CuimhRfWaMWuc8JBKxPnhoS3HCtwe14iAjp40EZLC+RbGrhRhN4e/UPG
   g==;
X-CSE-ConnectionGUID: p0uflhD+TwO6+XiXlukJWw==
X-CSE-MsgGUID: Mv1nv6+mSLmp0OAyDoO2Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="932706"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="932706"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:31:31 -0700
X-CSE-ConnectionGUID: 6Jgn/ZYfRjmTKBkd0PB4nw==
X-CSE-MsgGUID: tLId9zvnSSGtPRM2hx23kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4047674"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 02:31:29 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH char-misc-next v2 0/4] issei: runtime power management, dma
 and in-kernel interface
Date: Sun, 18 Oct 2026 12:30:51 +0300
Message-Id: <20261018-issei_pm_and_itf-v2-0-7a07452e3606@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23JRsrNX21P8oIiFZ60KNkg1iE
 f+9qfceHzPzZgOhyCRwLzaItLDwFDKYUwFusOFFin1mMNpcUWOlWIS4m8fOBt9x6pXHG6LzdUl
 OQ57NkXpeD+Xz54hqZHEq0JqgzfnAkqb4OR4XPFr/5QsqrRqDxpSNrWp7eXBI9D67aYR23/cvx
 JxpOMAAAAA=
X-Change-ID: 20261015-issei_pm_and_itf-d1911cd73ec0
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Reuven Abliyev <reuvenab@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792315888; l=1583;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=u3q1W7eUTnhzPQF3Ovki4vJaAe0fjjtoh5quFJ3/kbg=;
 b=6zxj3upWxq6u5Lwj7JHiPQUwkzh/ZLBhyET8G79nXFreADUwyXKfZBd7wV/y//7L865lz8sbv
 QuWFXjRl9VWA2+WcF1OoX6HcekcuD/3e0eDTc0+Ggd1ghFSs0uvqwcM
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
Changes in v2:
- remove the stub helpers in include file (Arnd)
- fix wait_event_interruptible_timeout return value handling (Arnd)
- Link to v1: https://lore.kernel.org/r/20261015-issei_pm_and_itf-v1-0-8212238a57a4@intel.com

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
 drivers/misc/issei/issei_device.c | 269 ++++++++++++++++++++++++++++++++++++++
 drivers/misc/issei/main.c         | 233 ++++++++++++++++++---------------
 drivers/misc/issei/pci_heci.c     |  21 +++
 include/linux/issei_device.h      |  31 +++++
 11 files changed, 560 insertions(+), 114 deletions(-)
---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20261015-issei_pm_and_itf-d1911cd73ec0

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

