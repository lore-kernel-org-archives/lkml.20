Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467810;
	b=d1CJN4AHNt7LJO4w5O3JuVMcr+pLfptlelR14x9TmI0JUP18aqXrP0Q0d+ldgNg+ayRo
	 +E4IJX4CINPYN5Pi9Xj5rhjwtqGFM5zQzpAa48xj3Wc8TYSpcOaFXJBDNESewqioRYZvD
	 5+1pEoOz8/MBprYgL9Dl97qzS9Dw+pn/HTcGgFKQe8CAPNVWFbctZ+raljZ6nDdeIAOqA
	 4W/h5Uk0HvBOH67kUMMA1SmxaEj1DqFyJaU+WtLrCa6gQEWBNvzd8+LXQSgvLtloB5QNN
	 qM/6/u4lpvLG3tjxr1HBwEtEhAT/U79h9oYEHuIYSVWSTQ/4mRa1Lo0O42VpzlZKa9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467810;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ooFT16lxzV+jRku2qa+cnHxrKULQH6AWF/pCH2gDZ4=;
	b=Xfux+r/Idzrz0xQHAPMgoM9pzTL52Su2E8ItkvIhp7CfvOtuQa632SP7vuKtxqRwAFm5
	 xl+Qb3sB+dF7etB99r83909z/8c408VH92PxWECF2qCemF2UW4zvIzfCKKbOZ4AWroVZ7
	 BKI+HygHAb8pimBA1ZTOiVBrPJCcBOABsZRpXg4uN69gnWkqu6YSCwABnnQofLXpfpaEE
	 kPMQ4nUKZ/ashZUv7sbEKsBcCXxWi65taQfhPh/AOtcGi0vwnPasz9HYcI/7yQm5dUBUp
	 U1YaQswEPSpg9YGGqXw/aM6oCB6jNvlUFUcZyMAQJuQ7cSY8CXqMs68cWFUdF6aRbKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jLjZ2J7G;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BF0606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29BF0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jLjZ2J7G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jLjZ2J7GF4B76ipgM1dZ3SDDu3PFWl6aTK7pL8UFonywsgYafSX3qdwl1amixR+kUtshBMRB3kVXv
	 wlYxYt0/HeWQYYmg0S7/WauTbipwBr3uOjVve2eM6McprIk3tzhA9Nj4gpY7xwQpcw9W46Qhuspmek
	 z3uCtdWxVT5YjVs0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af567dd3cd-dfe3e;
	Thu, 12 Nov 2026 15:16:47 +0800 (CST)
X-RM-TRANSID:2ee76af567dd3cd-dfe3e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af567dd2ae-f6810;
	Thu, 12 Nov 2026 15:16:47 +0800 (CST)
X-RM-TRANSID:2eea6af567dd2ae-f6810
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: liviu.dudau@arm.com
Cc: sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] bus: vexpress-config: Put bridge nodes after checking their phandles
Date: Thu, 12 Nov 2026 15:16:46 +0800
Message-ID: <20261112071646.154452-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

vexpress_syscfg_probe() obtains a config bridge node for each config
bus and only uses it for a pointer comparison. Neither the matching
path nor the continue path releases the reference.

Use scoped cleanup for the bridge node so each loop iteration releases
its lookup reference.

Fixes: a5a38765ac79 ("bus: vexpress-config: simplify config bus probing")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/bus/vexpress-config.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 9f57f6581b54..516a54fae850 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -390,9 +390,8 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 	}
 
 	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
-		struct device_node *bridge_np;
-
-		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
+		struct device_node *bridge_np __free(device_node) =
+			of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
 		if (bridge_np != pdev->dev.parent->of_node)
 			continue;
 
-- 
2.51.0



