Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870592;
	b=KSqZPIeX6wN4AP9+RKjDnvSY954QA8DSjq6w2dwOOmaA2uQbJ5Foat/niRwR1dZlDVad
	 0DYprxmivJVh80Gjt4zWUJDIEaLQz/f2XMCAXmhnSBmtdYHpEz5HtyjzzBExjEltRwkar
	 1gqklfSM/35KhGtghcM65k0/AsVDL7NsxUU0covGLPjs7ddYXN2D8zBv8D201hggNqUXW
	 FnxeFeZl83+85FkNnmka5zbv1Uk50F5fmSIJeYxeKPlkF597p5coVscd+72cOr9t3/ZQH
	 3Nv1AXTJjk16WxEaFx+99otguAlC5GB99EQQrM0MbsMOJkhxxvUiYObVTL3+4A5/4tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=59OMXqwTvXB1PPKI3PGs4yTKJRfoBlZHmNQLMZEk3JM=;
	b=z2fj7zobX6sRMQ945zqj7xr4sJinaTeu+O12rmwzHK+IHlWibV3NmwY9sq9StdoYcUFn
	 wEamKTvAH3NcDOP76Cu13otazknvka8Uo9QYGEWTVKopssjSoA0sxpQBrLt9RjABL37YK
	 m3dzIua2nEE8XRkSxa9HdYcd+jrsMfLWxKISqbZG92X+rwkJwAwl+jzHVOelKv0+hlzla
	 FAiZRm7DRxDMRyythJvoABOeAAZPGMnaJy8u9k/T7q4r/OcgZGsMST/ZsCTUPH02IPPwS
	 RUiUnT09vMdPaLDWfcmFZMOTAv29V+15pL4xGe8bkMJ9AOMe3uieSk047c+MXx5zQSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lq68MFpt;
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD902606A331
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD902606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=lq68MFpt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792870591; x=1824406591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59OMXqwTvXB1PPKI3PGs4yTKJRfoBlZHmNQLMZEk3JM=;
  b=lq68MFptgJup7QuqBH4WDXCSMrUIZfU/ScgGwxQySN2XrNVKosf4OB8r
   RJP4fqE1j8n+lGXBuATjQC4n2SzoOt9fWcxZiaVOeuf42n9yxfNnBV/vM
   qr7y0t+ypa2lw7Zbz/vh0V5tfORHPuyCZ2oWfeIrhB9L6tqYz+1/rOXft
   naYCvCurv87QH11sfea2epq/RAM5GmEzacm1fFfTYGqKCa7uMUX1jIO1P
   5mlsCjOfihzL+7k/20Rg2coyovjtCnDNXUPls1dmTtBR9mOA+gfK1Y2Md
   cUUmFIeNHapvkkudy3uFM32lDLIVMtgIJhSUvS/F8c50/NR0k4wiAF7K0
   A==;
X-CSE-ConnectionGUID: 0o3G7bNzSWC4jbC+0a1p+g==
X-CSE-MsgGUID: oc1V8vgSSF6DSNm0wevnrA==
X-IronPort-AV: E=Sophos;i="6.27,176,1787011200"; 
   d="scan'208";a="32157191"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:36:29 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:8744]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.250:2525] with esmtp (Farcaster)
 id b4fb8220-4d62-4ef8-9f16-b97a5bc326e6; Sat, 24 Oct 2026 19:36:28 +0000 (UTC)
X-Farcaster-Flow-ID: b4fb8220-4d62-4ef8-9f16-b97a5bc326e6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Sat, 24 Oct 2026 19:36:28 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Sat, 24 Oct 2026
 19:36:27 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH v2 2/5] irqchip/alpine-msi: Drop redundant asm/msi.h include
Date: Sat, 24 Oct 2026 19:36:17 +0000
Message-ID: <20261024193620.39999-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024193620.39999-1-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
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

The driver already includes <linux/msi.h>, which itself pulls in
<asm/msi.h>, so the explicit arch include is redundant. Remove it;
checkpatch also flags the direct use of the asm header in favour of
the linux one. No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-alpine-msi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 0d97abb85e16..20f1f7f7612b 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 
 #include <asm/irq.h>
-#include <asm/msi.h>
 
 /* MSIX message address format: local GIC target */
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
-- 
2.47.3

