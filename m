Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382855;
	b=UVp6H2yUj8WrY4e0IoQDqMXMrPUJqeD5L0OCW1VvS+GOoC3wBFL8vm/dKPU4AzXCovvv
	 bTzuDRSjb7Rhw6HCrkpVEa4zmPMbtexrDZm9SZxBN2X2j1cF9X9ZVHHqwY4NEQIJu7q8L
	 QtkgD92VYqDCPkPy5Ek1IndIhWwPRUxOTODRV7gr2J2MvpgEpq57KNz/44Byd65SwNvlO
	 p+vF1Kt9XJLzAJ/DnYOC0+waFkeEPGxO5DbcQtI+OQmuZLMFoGdTTNkch9GQSwdHgymHl
	 LnGLvukHrvSJsm0l7QeHjnvZrTSfCzGpJfY3GqYoeREG7iQLvtnl6WfbAIlj3ph8EvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=nkQxoHdOueAQdzZHRd+b9EKTqCHn37MgW5PhsGKle4g=;
	b=nKZWzOcAiR6UbJTD+AtfejlfwgrEi/Xb3PzEfO/iabRl/our0T0O1DiOipVJqvYN0sLA
	 u8YHRdIpNCtnEjfMuH2u181ka/c6z7hLR5svwcZjy9iW55K/2oi8ufvUTjMR9oRqcJcaL
	 XSXNDu/FlqEdL6o21tBcID/9ChiXIHR9bfOqW5AEYwB/xfSii519wN+kyB+sNHwMJ2mRs
	 9wIWVeYIKzkl6IY+538Tnbdr2ea2HR1by9BVdOKftdKEh0vA7kJgBN4DM/eOpz1tq/THf
	 Z9Ldg0pZfT55kJUDqO6Hgnc+8PFqlIPSx/KwxUr713k8FmVYMCEM7I9Y2EHC+C9n6aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRzzsqjs;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4335B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRzzsqjs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794382855; x=1825918855;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=YAwTxhSZ+YHhES4PIVDSYrfwwLjEoMo0ouSc06I6P8Q=;
  b=TRzzsqjsZuvmXO/UBCsHpHV2CwpZui1wi6G26SzIH7c+eeAeLm32y0tc
   N0A9xKREkyBzG3ov8beJvtus5Pjp03asok1Rrvgwl0XVR/zNTYUjTTjlV
   vZ1VO4asSnFgROsgvjLX1iCTevvHLhx49zbOKHtkBsVb+Htd4zEtIB6yA
   NAM8jLgYPVWSA1zH25yVIrdBJ0T0s3ZZpKQFKadnac1RXX0no0AqsHWm+
   tcXuHHHST9XhWt6OTe3stsJk+KNI21+K3XImfhMT+B58pjtZK+f6koNAz
   SiSFlkmvEEoJ8W+xZtYHNN5kPiWGVlQ/mXuLfYkjACEJ6v9GnVDhdIdlW
   g==;
X-CSE-ConnectionGUID: yk51XMDfRU6agrpOMc9LLg==
X-CSE-MsgGUID: MdCHrZEVR+aKpy0AYCuXIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3050827"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3050827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:55 -0800
X-CSE-ConnectionGUID: MEFv7j97TdK1+38jHSmLig==
X-CSE-MsgGUID: 1mV2bIoKT+qGZJPK8+4gXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8923835"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:40:53 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH char-misc-next v3 0/4] issei: runtime power management, dma
 and in-kernel interface
Date: Wed, 11 Nov 2026 09:40:29 +0200
Message-Id: <20261111-issei_pm_and_itf-v3-0-4f4f6d626ff3@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQqDMBAF4KtI1k3JjxrbVe9RioRkrAM1ShKCR
 bx706xctMvHvPneRgJ4hECu1UY8JAw4uxzkqSJm1O4JFG3ORDDRcsYbiiEA9svUa2d7jAO1/MK
 5sUqCYSS/LR4GXAt5/xqeThgMdbBG8sj3EUOc/bssJl5a//HEKaOd4ELITjdK1zd0EV5nM08FS
 +IIdD8AkQGlmaobAbJl7RHY9/0DQpsxSwEBAAA=
X-Change-ID: 20261015-issei_pm_and_itf-d1911cd73ec0
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Menachem Adin <menachem.adin@intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Reuven Abliyev <reuvenab@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794382852; l=1719;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=YAwTxhSZ+YHhES4PIVDSYrfwwLjEoMo0ouSc06I6P8Q=;
 b=iY/dxNWpQE4Lqemae9fWlMI9pwsj6+m0Ma2OJXYBV7WzI4h9G2UZqAr4IbcGVV1xRliM+yYex
 sIe7fdJMUc8BgdUzqkkFw0JiagCjHAHRYvys/MO3h6Y3XU0HvRdwLv4
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
Changes in v3:
- fix print specifier
- Link to v2: https://lore.kernel.org/r/20261018-issei_pm_and_itf-v2-0-7a07452e3606@intel.com

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
base-commit: 37a87cdaa3e2f10bb83ebee847fbc4761ac531af
change-id: 20261015-issei_pm_and_itf-d1911cd73ec0

Best regards,
-- 
Alexander Usyskin <alexander.usyskin@intel.com>

