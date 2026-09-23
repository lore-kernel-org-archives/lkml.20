Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801553D9DC0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152661; cv=none; b=QukTMqEAQ6FAr/1f5KDGieBuZnW8EFSzeGPf9Sfz4SSZnTXrYKtZiYjO4TIlbCaxXrGWENfii9KsfA0CKjyED/TNdxvPHZ/gYBhV25BJ6UDw3gM5XQBh41Hhupl9MXaAFPjaAA3OYS45RV+tygNpzAPAgAKSQCuEDefVDD+kb88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152661; c=relaxed/simple;
	bh=eyroH2GTt9T28KyKhz2amoaw3CsBR61+qaqQQFgNM88=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGfRuCNGuKCOzOPngwDAQAohPhI+WRJUySPxnJ8V8/jJBYT/C8G+gtSCjH9IjYI1uh73pA5FkGoTMIHh0dWyVJwz3GABhyZhPQtTOgi22ZJwSFSPHBhwU2ziFgGrcgWWPNnVg+MAO3xyO3hkNLUlSRojDegBzt6FaKq+4OMADqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=H7FRMDQ7; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="H7FRMDQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152653; x=1821688653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jSDbvU+sSMPsR3FEFzrekZHW/2D9icHxMI/p6LU5cc=;
  b=H7FRMDQ7fzHTXR/rb8ADd3zDxywSFAr1O48GLrm0DhO9Lh/P52ykhAxA
   616koHvNodw+DkkrrCYz5i3bpmXC89SJ+46+IS7vh1bbSVlID1Q3lblFQ
   FXu9MN4IWj8DIXUfPkp6RRMstY6SdR9vxX6QgXQpPhm+HzXgmGw9VkKsZ
   0WTntb/lytrWuqsTA596fSBHket1G15/Zm2iaVC5F58WUVpS+nobhzVvl
   bzMI0bso3CbtYgCxoHb602OugqOyxSQzBTqXCe+E9aNKQajrzRdAriNmB
   AJbg43ofSUKh7w/NP5//sWTGJXF2jxTHtaUZfr7DU7Il+fDfRLsgNNeTW
   A==;
X-CSE-ConnectionGUID: ZTYL8/TwQVGnN2kzN0LScw==
X-CSE-MsgGUID: fylhUUF5QD2JNtkfbl1ZLg==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29208088"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:13 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:25436]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id ec2c215a-e1d5-4a75-8e4e-823d276dbc87; Wed, 23 Sep 2026 08:37:13 +0000 (UTC)
X-Farcaster-Flow-ID: ec2c215a-e1d5-4a75-8e4e-823d276dbc87
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:13 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:12 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 2/4] irqchip/alpine-msi: Drop redundant asm/msi.h include
Date: Wed, 23 Sep 2026 08:37:01 +0000
Message-ID: <20260923083703.38974-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
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

The driver already includes <linux/msi.h>, which itself pulls in
<asm/msi.h>, so the explicit arch include is redundant. Remove it;
checkpatch also flags the direct use of the asm header in favour of
the linux one. No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
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

