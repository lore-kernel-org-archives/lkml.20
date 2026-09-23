Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8A3B0AD4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152646; cv=none; b=rCdXAEmulCfs0hIERq6IoSlRwKDAa78l/5/6o54boI2TBdMgFOPGMbArbRS8PKMRD5O3LsXVaoinKPDlJI1SKKcPllZW/hWKBxVd4XRe1Vxs15xJRQxzVNAjq8C39QzJBt03C/cGuyxegRzr87GFCP4AbvRImwtfbHrC5WN320w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152646; c=relaxed/simple;
	bh=+ATk8V91Ns1fAjup4I1sIEwMVzQuF1nsTTyvLC7L1cw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VKRt4QshaSAHBjPq7hp9y4o3x7nKgzNUW65LCdbJTFtz2WsD4bCA8r4V2xIp2PASeGRochrF4q19sb3616FoDLT+fEtuC/y0T7uF9z5zGtSOpFJwqd4HQnYBjB9DE8DSkaddDe+18thseyieeVfZD+GLbwmAKE+tndTdETmknds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=qkb3O4BC; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="qkb3O4BC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152639; x=1821688639;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4XQMf7fL8GqZ+hyH3y/jkvSb5OnhiiRm88OJeVNfblo=;
  b=qkb3O4BCWICL860XJw54+ZML8fxqbHDKT8QIManJoypg0plcZ9G6SuXb
   E5wOY9PNUukFrhrqSILqvyyaFFEdHYJEMonFCAs9zcyLA/xGDLIh8qjFD
   Q+yIDsps2bTiV01MhghlhBU70edpmtmoPoY5xgQ/omnXXQMf4nIEVfebR
   WvIQPnoBEasCXdkAd0Q+9+7c3DdY2n/KY18K1FnhqpifuJrsxvN2+/+z4
   Nk1pO3iubhjpXTGHpIAM9hqyjgRRpNvnc8LzDRgkTQSAfCwcBFlqna2qd
   9ebTRQ4qwKR4S6wfIhMf9tyixgIf/mHh0KDOVeTC1pW15gbRASW/f+xwI
   Q==;
X-CSE-ConnectionGUID: YAz1xdkPSGK+mW0YPGAcGg==
X-CSE-MsgGUID: TbPHEv0RQXiMJQEwCYt4ZA==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29200393"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:11 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:32074]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id 995c8aff-5054-40eb-a43b-590ecd4d2368; Wed, 23 Sep 2026 08:37:10 +0000 (UTC)
X-Farcaster-Flow-ID: 995c8aff-5054-40eb-a43b-590ecd4d2368
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:10 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:09 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 0/4] irqchip/alpine-msi: Cleanups and debug logging
Date: Wed, 23 Sep 2026 08:36:59 +0000
Message-ID: <20260923083703.38974-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This series contains a few small cleanups for the Alpine MSIX irqchip
driver, followed by the addition of some optional debug logging.

Patches 1-3 are trivial, no-functional-change cleanups that address
the coding-style issues checkpatch reports for the file: convert the
license boilerplate to an SPDX identifier, drop the redundant
<asm/msi.h> include (already pulled in via <linux/msi.h>), and fix the
missing space after a comma in a GENMASK_ULL() invocation.

Patch 4 adds an info message on successful initialisation and debug
messages on the MSI interrupt allocation and free paths, to make it
easier to follow the driver flow when debugging.

Build-tested for arm64 with the aarch64 toolchain and KCFLAGS=-Werror.
The driver is used by the Alpine V2, Alpine V3 and AL8 SoCs.

Eliav Farber (4):
  irqchip/alpine-msi: Use SPDX-License-Identifier
  irqchip/alpine-msi: Drop redundant asm/msi.h include
  irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
  irqchip/alpine-msi: Add debug logging for MSI allocation

 drivers/irqchip/irq-alpine-msi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.47.3

