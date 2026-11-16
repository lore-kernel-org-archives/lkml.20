Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837161;
	b=GP8IcI6AnxXTWzyg2XTsG+GKHCwi1uOmcP+D67QfhgsBwy4IuXlmsNCqFnl4V9b1h/ET
	 CbBE3ryqilRFISeio/iQaikISgZVrTHiV/fZl6JMPeulluUkAwWYwXKWtBNfYlKZ/+Ckf
	 Zsi7d+e1onjCAVVWCnP8Ee9X2ov14zJy1nV+4RbqGxy/24hLd5wtiJ/6o3xR3p/h6RudM
	 72vJsZ502cqPZixup9HZJ8QBW8bGR+JXPzNS0oW1bgl2c2Z0unUj4ntEbUzNbztCNsA8d
	 jcPEbM/eOBUGbnqqL5INvEZnJVCPW44R63fBNnTquFjMdpk2H55fhwJcIZ7r5ksyu3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837161;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=10tSiQq9qCU62IQsmnIT5keO6pddi/erCeijrEXvMUI=;
	b=zBTtu3wjDDKlTyEYetxXctvUrDvUBX7FbInlHOp4MuUjvWQ/dD+aS13vILZ0HkZ88FdK
	 IXS4Qt4hkUxzIGhMO39SZO276bcXTX8sBNDX3bqPF7elxNqIwgwPjLXyvCHCB+H2ixfxO
	 ArrYg+ghrLaRr+0F/ElREPlrqRWb3pLia8WlArvAyVaBgGc/62GFgdkRNTDGFmcimkRVY
	 ETbHaIK9NmgW1tdLYm+RIzSddVXqQw7XmGVYenTvEMG/Ghi7UYjqgHJXsaOtH3tz49oXF
	 eVaWzRLrG0f9jkPvOfQq0eU6urJvdRlFg5j34JOjpQGuonKJadMs6T7mIgHT7U8dA6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OLlXulJj;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6180606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6180606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OLlXulJj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37C244E41602;
	Mon, 16 Nov 2026 13:52:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 056976023F;
	Mon, 16 Nov 2026 13:52:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDA3011BC183B;
	Mon, 16 Nov 2026 14:52:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837158; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=10tSiQq9qCU62IQsmnIT5keO6pddi/erCeijrEXvMUI=;
	b=OLlXulJju5sf2hao84stt3rkKFJvqK95+EnO56KnPj2rNCAJZbDrz8dJRMcR5dD+OJxtwK
	IHT0DgrX6R77Z/1uodoHDoinyx3ZlpqbY2rqS+kx3oR1BM4ZtwACOriuJwlY7U/rambTGA
	8DcPfFvTFu/cIIrvK0gWMBmdie0Hq+j380SAkFwKSZUIx5LuWdeyFEAOpDYQnPi3gsucvu
	1kcuDgKAXO66QcX+cNp/JOJrv+d0673nutQcuZMiDeZ8QXkTLmPMJN9k5DJXLBWmKR/Fcd
	pzO4+6uxAys6CSEmg0q45kmxTUCFtB6ogB0XbLCEIEkHOPwIn6iFf9+Tx6X0aA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 2/2] ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources
Date: Mon, 16 Nov 2026 14:52:17 +0100
Message-ID: <20261116135217.37038-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116135217.37038-1-paul.cercueil@bootlin.com>
References: <20261116135217.37038-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

ACPI 6.5 introduced a clock input resource descriptor, which allows to
specify in the ACPI tables what clocks are connected to a given device.

This patch adds support for the most basic clock resource, which is the
one that represents a fixed clock. The new code will then create a
clk_hw for each fixed clock resource, which is then made available to
the device drivers, that can obtain it through a regular call to
clk_get(NULL).

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v3: No change

v2:
- Use the calculated clock name in devm_clk_hw_register_fixed_rate()
  instead of the device name
- Make sure clkres->scale is <= 2. The field is 2 bits but the value
  clkres->scale == 3 is not defined in the spec.
- Compute the fraction numerator using 64-bit math, to make sure it
  won't overflow on 32-bit systems.
- Initialize clocks only when the device_type matches
  ACPI_BUS_TYPE_DEVICE.
- Use a shorter name for clocks as the hard limit is 16 characters
  including the terminator.
---
 drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index 80ea7121744d..71322cdcf0dd 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -10,17 +10,27 @@
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/ioport.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 #include "internal.h"
 
+struct acpi_clk_data {
+	struct device *dev;
+	unsigned int idx;
+};
+
 /* Exclude devices that have no _CRS resources provided */
 #define ACPI_ALLOW_WO_RESOURCES		BIT(0)
 
@@ -130,6 +140,57 @@ static unsigned int acpi_platform_resource_count(struct acpi_resource *ares, voi
 	return AE_CTRL_TERMINATE;
 }
 
+static int acpi_add_fixed_clock(struct acpi_resource *res, void *d)
+{
+	static const unsigned long clk_scale[] = { 1, HZ_PER_KHZ, HZ_PER_MHZ };
+	struct acpi_resource_clock_input *clkres;
+	struct acpi_clk_data *data = d;
+	struct device *dev = data->dev;
+	struct clk_hw *clk;
+	unsigned long rate;
+	char name[64];
+	int err;
+
+	if (res->type == ACPI_RESOURCE_TYPE_CLOCK_INPUT) {
+		clkres = &res->data.clock_input;
+
+		if (clkres->mode) {
+			dev_warn(dev, "Only fixed rate clocks supported for now.\n");
+			return 1; /* keep going */
+		}
+
+		if (clkres->frequency_divisor == 0 || clkres->scale > 2)
+			return -EINVAL;
+
+		rate = DIV_ROUND_UP_ULL((u64)clkres->frequency_numerator * clk_scale[clkres->scale],
+					clkres->frequency_divisor);
+
+		snprintf(name, sizeof(name), "%s-%u", dev_name(dev), data->idx++);
+
+		clk = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		err = devm_clk_hw_register_clkdev(dev, clk, name, dev_name(dev));
+		if (err)
+			return err;
+	}
+
+	return 1;
+}
+
+static void acpi_platform_init_clocks(struct acpi_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct acpi_clk_data data = { .dev = dev };
+	LIST_HEAD(list);
+	int ret;
+
+	ret = acpi_dev_get_resources(adev, &list, acpi_add_fixed_clock, &data);
+	if (ret < 0)
+		dev_err(dev, "Failed to add clock resources: %d\n", ret);
+}
+
 /**
  * acpi_create_platform_device - Create platform device for ACPI device node
  * @adev: ACPI device node to create a platform device for.
@@ -196,6 +257,9 @@ struct platform_device *acpi_create_platform_device(struct acpi_device *adev,
 			}
 			acpi_dev_free_resource_list(&resource_list);
 		}
+
+		if (IS_ENABLED(CONFIG_COMMON_CLK))
+			acpi_platform_init_clocks(adev);
 	}
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
-- 
2.47.3

