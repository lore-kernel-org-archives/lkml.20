Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723085;
	b=HnoyYrM4zQlucn/xUoQoyW7RPa2JhKjXnNac25030LTRG8FWTstf7nrwEmTYpEM3bisI
	 mTodRtcKBuISVl7PzQGvlkHYTdYoKuI00z/aX4PoS/pWhdWZ/plYbIt5dI/6+UJJ38lHR
	 c1MrxKEuaXDLUaVIiGJ9HQPB2P/clZWgdInih9qG+6OepfObWDP9cae9gK3tNznqd4TU/
	 P9bKzjarLcG6sMhAzZmpWp8zBEUGW5UDD05/8yiR4xAgo7HAH8eta8chLVc4vVj6aAKDI
	 xfGxrJ1asvgwd14FGbX6kAKAl9XVnhYkJV255bu8jaxrxObbSKuityZJe5LhvPOF9bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
	b=Jgr5KCiohpd2gYJt/BbXVnCj/RG7plRHNOJy9Cfw2Yhiwhg0DapcqxyInGU2x6EXNEST
	 jJJbHYhfluekphJGNKYd1WdGpsV7Run+3RgkUWKipNK8vK8yQ8uYhyndROqR73qvQDTET
	 lA7lSYNcJpEJEHU1AYcyB7q7lYjjmuDSzkB15os8OqDWi6+47C938xl9mFQE4zujR9yGs
	 UFvXP6xSz6fAOM846//Sjqv4u33ydhH06FS8jf4EPoDS65jFLRgR2ZM/7rq/PM88TBkXb
	 8Gm8a++sTZmD3aRljf+MEf2OHDwKDUznEhGsbIRfUjYuO/NVKpancpsBS8o2bEUAsJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmW+6zp6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDCF606A88B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CDCF606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmW+6zp6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so26900085e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723084; x=1795327884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=cmW+6zp6Xlgj7izVi43T2QLLWs2jvIaPcQUPoRlSRkHod2Hmkj7I8GGdIIqaFzdhOj
         joQvuzWrVSE1V+VHc0M/sRQrh07V/dbdLY61bkG16VaaqEwGt7i6bWvdjX9TClsE2zJ3
         m2bG5HcGk9z+H5FtEnpdZgiVtoPukWHjrvmv9bq/m+tCCCWxz3Iix7zVn4mF3sJRFejy
         afo9TsJlp6gf6DQahAZBoLLxXLIL+cO8E0NWGkyWYliib0MU8oMApBluqOnijy/hhvUl
         3kpFDip1bzDGViHejpON6vvBeFc1SGA4LLbGj4H1Mf+gLBoCRX4+LdvpMq7bfpqlR4M4
         xfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723084; x=1795327884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAc8EDwX+oraDK+6dFO3Rvp07/tBaltgJEnu0lCCOi8=;
        b=sdmhTFtmg1HiEpOprHvMJydeeuZsnQkgyy4OL+5H8HfuR27itDv79eeGN7b5HCbrVi
         beqo6G7JPBOIUTizub+LMgHbaC4rc+S2G2pVy0xeoecOcOnO+J45HIVZkzVOEQrkUZ36
         WO85ccoM7a0oehZbE739xGOhQBnCJjD3RlRXp3oE5WGIPJJnOhTZDwOPloN27P0hy5VV
         o6SOk1WIAVfeuyvKZKilgrtG45JeVWFeoJlvcI2Q4wRlgO57mtWHi07nAIWH33WmQuQ1
         KEmtJcz0cC0V26EaqheZUeFiT/nC5IVPNFI0x+xdtTSXCItHr+S4jHGTDk8kxt8LUba0
         2WcA==
X-Forwarded-Encrypted: i=1; AL+hErFCyY9rPC5WadSoDBbf/CEiigvUwCsDjQdL2099DuszZZIqDv9njtvv2E9R52snFhRv6D52Q6hXKLrIHXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pn/i44F28Gc1rUvyVe1uOC4fPFQU363m6PhelUsULOnT+pByS
	MEXe6g/AvHATzFAHbHpaV5LnYQK9AzGl8iCLhhuYSSWlB65oVmAU/hvBTYnZLBfy
X-Gm-Gg: AYBFou3AiGsDSCjP07H+eCTkQqPH6fS2QFcsn2wlk0qDHyZRvP7JRLf0GhrFHzVKMVl
	FY1mju1HjQLCHr8HxT/9sD8Dw9/4OEhb9idtYX0mZttW0JwAGnjkxV0MnEu8p+nIO+Q4/+OWiL0
	YVviOHbwt6iYtE9voioJFHnNqjeL70b930OBNCZVsgUO4mykXKCgdXTtDjqeMLU6z9SKQzTNkj8
	2r0/kUEgxKGcz5BNW7z2khs3GvBG/JAC/rEJn5B145EvT7QLO8K3MAjS2fOW8Nb1W4XeO4FsRpQ
	ihXCM9WKk/K0yFkFRsOzqyeIVCAKyOX3In8rnlMejBt9LTbUXo0GLA5ujWjVV4ScK41y66BgBDr
	Blorqico+sxefEIeQNlekqoMc1xI7p3IpZIDNqVnlVFaShHz0OKjPd8hpCEJkCkVJ5mHnWH7I0s
	eNVk4E5fzJpHx/CKTI5cmAGwvnhhcIucAuuo4rLBCb0CziykKW8FbeT2h+E+sMzeiizHO3aC2Cw
	vN2VWti1DDOX8uPrcPAE9hNqDpjyAs7j5UbTO0dkCL056ggRVB5t9s6tWIFd4qy3ifWu/99VIdI
	Lfft4i9x2hXNlK4EHZIZpF7quEfWEoyyWHrT9j8OQPZPccgHxe6N0mapiuOyrKM7NKYF1wwSW41
	sD+KQGiHI0Z0/pddU5OrwUfxs02kPMtjw9C0wGVqjCFDlKPAgfb9hSxnzWjefoDAIPdiRr/zgdS
	jk6a94qChr6/CRUAZQEwJkr6G+nkZ48gAj02XHrpN46bIzYBX6zX04TrHqQ3t6JOTM9h5s5jxyE
	cTt9RtC0iE9oA==
X-Received: by 2002:a05:600c:4f90:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4bb55a47680mr145173255e9.7.1794723083470;
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:23 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sun, 15 Nov 2026 07:10:56 +0100
Message-ID: <20261115061102.229680-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

The DE33 clock driver presets the plane mapping, which is not something
that a clock driver should do. Remove that and export the mapping
registers through a regmap instead, so the DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 43 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..f17570efafaa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -283,6 +284,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.43.0

