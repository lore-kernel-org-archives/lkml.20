Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.83.148.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566713;
	b=uo3g7Fmh4oGKuHX2q8Yg+5PuQ4XS9MQ5lqSLWYd/oVQ27JmRNE3AVoBLiQlb3SHpqnAK
	 6akqQo4T0mI0wnALxQkn+LMx5xhrimHeBlPBLpnLTzvWI3uyPeNOVMKXRda5Pgt9NB4tO
	 UxcyT+Apawb8xc6f4zn3G5rg8myxYDZ1pxFZsYfP0PUhL0LSw5lAzUFT6tsKGtr+dE871
	 QnkqO3UovSed8Pb1fZdLXCqFBu7C2H40D+bE7wLYfxwL6YzbAbOnZqDC3cMEGllQ1JL2O
	 gtmA4E5PC0r09Z5ada7TMUhAZ4JfGH/3LqHXpHq5F6OuCcN42FkKSOjxSa2ekTbRkYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566713;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=gs+UuepNqLHIrDjqcnh+dZpS/BL6YEr1Y7mlWxYtZps=;
	b=RhmP9YqUiKpPN+kfJp0UotaBcyvGKNUeNhAOZqaQz4jxMGMVd68bX4ICKoN0LlwatIgX
	 hkhK2h04bywy+adislkcgAqfrKb8LZ58y1gOTkOz+ywq7hof+YEqQOZMPTeGmXSPoRlIK
	 EeoSZ0edHl61vx5yRdYXU+Uv588zhGLMsLeutowBj1AEkXaZU+wkRhBH8H3fT8qdXGAPu
	 VQjlVD7IBvGLMMkwCiMaSqwX/K0Mh0wUZpiWr9A6hxyBEoedd2bgvj9pzS2mdcKgS9Lj0
	 JuE9UawlSXxJ6G73xjS8X3aTX5fSqjRlV4ETcL7ZYmA01O8HJTsROmeQIyfTu+sjtUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Kw2+saYx;
	arc=none smtp.remote-ip=35.83.148.184
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73663606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73663606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Kw2+saYx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794566713; x=1826102713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gs+UuepNqLHIrDjqcnh+dZpS/BL6YEr1Y7mlWxYtZps=;
  b=Kw2+saYxfMSZ3EJUzQDXBpsJ/wfQmchsoGqpXjTJzoEwzRagjNe0+LGh
   gNP+AJp5vlXnZF+rIRjauMklnswfbfFVy5Yd+6T9n6i9rDl67nA7LcJpd
   G2E5L5YnRHYi6dL9ybHEadrfHLMO7JdVxuZtqN83qD7yxdaOxUGaVgLYc
   CwRDsxyyzwWROxQc1Bv7tkQPMGslhlGUwLb1DuNqTqzFLRi7E0CIeFd32
   RQ4OhGgHHjGljZpKTB+aEGH5UFZxZTFv8warlSU2zjqYgVmX6wmo6xBa7
   Qf0zd85/vqgN7LvTTzxuzvQtsTPpDLScmDQWIu4O8r0ztN5Wx8N7feo51
   Q==;
X-CSE-ConnectionGUID: Gg2yst1AT8+6nZqXzAsA6Q==
X-CSE-MsgGUID: mfnw/j0hT26KcS05RtzzWQ==
X-IronPort-AV: E=Sophos;i="6.27,211,1787011200"; 
   d="scan'208";a="33666144"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:45:12 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:5460]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id ffbc6af9-e4fe-4b4f-84cf-5e173592a49e; Fri, 13 Nov 2026 10:45:10 +0000 (UTC)
X-Farcaster-Flow-ID: ffbc6af9-e4fe-4b4f-84cf-5e173592a49e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 13 Nov 2026 10:45:09 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Fri, 13 Nov 2026
 10:45:07 +0000
From: Eliav Farber <farbere@amazon.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf
	<W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Eliav Farber <farbere@amazon.com>, Bradley Morgan <brads@mainlining.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Oleg Nesterov
	<oleg@redhat.com>, Petr Pavlu <petr.pavlu@suse.com>, Edward Adam Davis
	<eadavis@sina.com>, Petr Mladek <pmladek@suse.com>, "Cen Zhang (Microsoft)"
	<blbllhy@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 6/7] reboot: use devm_blocking_notifier_chain_register()
Date: Fri, 13 Nov 2026 10:44:54 +0000
Message-ID: <20261113104459.35839-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113104459.35839-1-farbere@amazon.com>
References: <20261113104459.35839-1-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Replace the manual devres_alloc() + register_reboot_notifier() pattern
with a single call to devm_blocking_notifier_chain_register(), removing
the devm_unregister_reboot_notifier() callback.

The removed callback wrapped unregister_reboot_notifier() in WARN_ON().
The generic helper ignores the unregister return value, so that warning
is gone. It could only fire if a caller had already unregistered the
notifier itself, which no in-tree user does.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v6:
- Rebased onto v7.4-rc1.
- Commit message: record that the removed callback's WARN_ON() on a
  failed unregister goes away, because
  devm_blocking_notifier_chain_register() ignores the unregister return
  value. No change to the code.

Changes in v3:
- Fix commit message to accurately describe the old code as using
  devres_alloc() + register_reboot_notifier() (Sashiko)

 kernel/reboot.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9a84401adde5..2fb8700c726d 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -146,30 +146,10 @@ int unregister_reboot_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL(unregister_reboot_notifier);
 
-static void devm_unregister_reboot_notifier(struct device *dev, void *res)
-{
-	WARN_ON(unregister_reboot_notifier(*(struct notifier_block **)res));
-}
-
 int devm_register_reboot_notifier(struct device *dev, struct notifier_block *nb)
 {
-	struct notifier_block **rcnb;
-	int ret;
-
-	rcnb = devres_alloc(devm_unregister_reboot_notifier,
-			    sizeof(*rcnb), GFP_KERNEL);
-	if (!rcnb)
-		return -ENOMEM;
-
-	ret = register_reboot_notifier(nb);
-	if (!ret) {
-		*rcnb = nb;
-		devres_add(dev, rcnb);
-	} else {
-		devres_free(rcnb);
-	}
-
-	return ret;
+	return devm_blocking_notifier_chain_register(dev,
+						     &reboot_notifier_list, nb);
 }
 EXPORT_SYMBOL(devm_register_reboot_notifier);
 
-- 
2.47.3

