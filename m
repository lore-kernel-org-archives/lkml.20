Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870589;
	b=kz//J7KA7s8wZO/SuOU+Mqb9a25EIiY9s1kamwFMv8nsgBVDtL05Lr3O2l4dGr7tDqjs
	 ea0T+BHxITn3Md1brlgqihX4NZ8fo08wBN9o6YkkBNvwpNjeyAQDvi/fZPLYA9Iex5AvM
	 9nE6W+p2mQl/35F0v9itwxjsIiE5UVEL4mp6rNziBMHN92aoJsPHqLuWK34OcCSoG/RRd
	 l/S4j7S8uDJW0Yhu0GADQnsBJhFbWVWR6rJYcqmnsE9QimXxFhyjig7eDixotCsZY2ssq
	 MLEvBOd+9dNLxHbUEPNHS1djRkm23GYbEpQttSI5Os0J82u+spsmYiIMAfItNq94wrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870589;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=i/eSNZ0iOeZ23He1SMGd7qc88ESlcmv15eX4fDnlw/o=;
	b=jNEmWiAd/mSY1EVTKxKZRnK7wudwEn0ZQ0JfMgVRO405XYiKww8wdkvm+cTdHkbcLT+7
	 3B4sVjKw6+WAaJyg0zZ0Xd+qDi7OLYN+2b8BysvWCzf6HIkAdzzRlzisqZmzGM+mqyoDz
	 mVCec10AR1VkmeIaxRy32CTUzVXKEFzsKM6YAIwG6JY8fQh3SvakYNDO/pD2ogBf7Pizl
	 GYk44edMTK6PCyDtN/XsiCysDS6QqyNOvZfKtqpSwJ5A/ePn7ARsERwN+1AsKyDrud+Hu
	 w/ehfps+CXUEqaVVqiw0jZ1tf+WVnRx9X3KHIbePcagE1I/S/XVaAf4JWHRWF/pNuSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sOYevR1g;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53880606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53880606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sOYevR1g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870589; x=1824406589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i/eSNZ0iOeZ23He1SMGd7qc88ESlcmv15eX4fDnlw/o=;
  b=sOYevR1g2JBU1zjMt1B5nlCawYBzpR7XahJxuhdNd0jdu78Dm5GBhgww
   gRt8SB9TF574K+M9XkG0EpaL68iXZ3UrvHAh5JjIKqJehuEET4m1F4yyG
   dCh+CCmRKIyAud1SpL/18GK9dT4p25yhWGgfB0egqsZpKZOwfBxlbTIM2
   ub8IBdBy8+gP6nYF6Gv1LTmvozS6MnSCpT8PjdWETTFeuJoNIIzos/TL9
   i31LQw15Muj4737Ab/bK4AAJVKV2N/TZ4lc0w+3gFZ+FTPPRa4PKwb8Gy
   YQyzNiyW1PNCI8GOSmsrPQ4lLIpaC/I4ITiQw4QKmLmtyeVfnavfCsi99
   w==;
X-CSE-ConnectionGUID: p4aL8ta6TWGkTcJzkDvR3g==
X-CSE-MsgGUID: q825xlkIQpiJqtz3GJ9y+A==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32180774"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:36:26 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:8716]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.165:2525] with esmtp (Farcaster)
 id 8c2e6b8c-3405-4d6d-9fab-8f40645f2305; Sat, 24 Oct 2026 19:36:26 +0000 (UTC)
X-Farcaster-Flow-ID: 8c2e6b8c-3405-4d6d-9fab-8f40645f2305
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:36:26 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:36:24 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 0/5] irqchip/alpine-msi: Cleanups and debug logging
Date: Sat, 24 Oct 2026 19:36:15 +0000
Message-ID: <20261024193620.39999-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This series contains a few small cleanups for the Alpine MSIX irqchip
driver, followed by the addition of some optional debug logging.

Patches 1-4 are trivial, no-functional-change cleanups: convert the
license boilerplate to an SPDX identifier, drop the redundant
<asm/msi.h> include (already pulled in via <linux/msi.h>), fix the
missing space after a comma in a GENMASK_ULL() invocation, and use %u
for the unsigned values in the existing registration debug message.

Patch 5 adds an info message on successful initialisation and debug
messages on the MSI interrupt allocation and free paths, to make it
easier to follow the driver flow when debugging.

Build-tested for arm64 with the aarch64 toolchain and KCFLAGS=-Werror.
The driver is used by the Alpine V2, Alpine V3 and AL8 SoCs.

Changes in v2:
- Collected Reviewed-by from Radu on patches 1-3.
- New patch 4: use %u for the unsigned values in the existing
  "Registering" debug message and fix its wording (Radu).
- Patch 5: use %u for the unsigned values in the new messages (Radu),
  and write MSI/SPI in upper case to match patch 4.

v1: https://lore.kernel.org/r/20260923083703.38974-1-farbere@amazon.com

Eliav Farber (5):
  irqchip/alpine-msi: Use SPDX-License-Identifier
  irqchip/alpine-msi: Drop redundant asm/msi.h include
  irqchip/alpine-msi: Add missing space after comma in GENMASK_ULL
  irqchip/alpine-msi: Fix format and wording of the registration debug
    print
  irqchip/alpine-msi: Add debug logging for MSI allocation

 drivers/irqchip/irq-alpine-msi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.47.3

