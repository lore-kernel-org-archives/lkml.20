Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0E478E56
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787783013; cv=none; b=nI39boZfBDh4aef4yKHtseds0AGFMV9CKoAYPnCFaOe6pPSODN1ptOiKa0yXwh/8eb+Ovh66CBiLz1VjTcsYR4Aom/f+n1qA7HaBFGS5/QV/93WN63PBqZLNwI+LFHE2YgpGz9e0f9hu1cDr0yPWDL9C1hUNe7XSBrZ0p4X820o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787783013; c=relaxed/simple;
	bh=GqndFSZk8fTM4Q3z/je+OwIp0v2J7tUgj9fTETnG4Z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIIY8DJqVRsWDQJlAv3lsrKUa4dLIIXfjRtO6+aRgk/iSbpKM+6mPgDuuwHjBgid8cfaDU1BdBWKblNKxp2LyeRy35N6mOJoepsfYqHQxzv4QhL3ByjQB0NQb/fzCIMOfadO9g3IGtCFyqvE8Uj7Dp2Ewb4clAT4FxSIuoUxw4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PeMmKu8i; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PeMmKu8i"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so893438a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787783008; x=1788387808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVnWg2iLmSAV51XI9dB+R2wGq0zBTwlXD7KgxikGiuQ=;
        b=PeMmKu8i/JcF2I1bC1hWYPUfiQTCHdR/vEMqde+nDw45vZPIdFJwBU0njE79Xh7h3b
         2vdYAUGstGJNxDvYcdbD7OAfBq7707SoCjPoGwbfDO0NQQq2m6jPe1WIwJV+BXkmyVjI
         ZJLHH3U5EYrc+75Pf4mcZkd8KHXwKs7Knu3bmP26hquwaA9Rlf2919VhCFnfOyLC+4uI
         HE3e/CYK/30YynXl8l/1CpwSjLTwpmn+pp9P1Tnq23rrfM5hmOW1uncRSPcqE8MnwX0u
         bua1eHWZHV0CpjvW2Zo/ShMepAudFjjjot+dHzwG+VrvYn+iCt93pyaHM188S9LM5d4b
         HZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783008; x=1788387808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVnWg2iLmSAV51XI9dB+R2wGq0zBTwlXD7KgxikGiuQ=;
        b=YFZ9eJKCJokSHgYWFA8ZtbtNjLdqZhFHb8buYrWVz7rm983KUPZmhFW2OApGEGmiby
         ntPQtcVoNh0ENjnIMq7ycKtQ41OHeqALVWV9eOAJb/8gcXWylmWnH8XM+N1qIddDFI3v
         w7oF18l2hr3YHfnRUy6K7DE6p00oJnCBMDv8W72FR8fsc1n/lYGv2+36b9lNGLyxc0y5
         xjiRzCjvN4hDE/CxJBYO9DMkAXYGs/4iRJxTFYQpKZTe7S3IGyfel0vm9zMJia/1o9+m
         zt5kcGzf78yvxQV7SqKDp4GlGOkUejViyZsCV8VXSxsTt1U3LMR4mcfKClbeLdVOaQ1T
         p7gg==
X-Gm-Message-State: AFuF++mdu/hFxNbYXKqKhG8GDpeJF2udCv8Wr/E77aa3CzWl8PFX7Hce
	t7WQnOPkcJJIlTFy/OHJm4v0OMEnJY5NTpSfc2srytunPw/nu+ASjGbS4KPM1zbYj1E=
X-Gm-Gg: AR+sD11NkfvXX/r+NTM2cVSzBhrgNNA5qtCXhPLD3CcVLESclTMS+LhTHtwet1gthyT
	ePQzpUmT+CrnqnboTgj8vqUIZqOPBQv5u/QvJHiTpfzdjm5z8pvxd/5nl2mOMF77Ly014j48RcI
	POvyQ0Oo6BRy9VvnG0pzZErHmoEXCeruTSPT0pyWdmhZ6RgoaNJuYgB4y8RdsYcgqBNJkaQKu7B
	Uea36UfE3t6XG12gihJ6fniQQTtBOw9prFucb+COqF/rcLYMRx04ZK4NErpANtd2AUMDuWW5w1C
	tPsnZ5rQRvuVu5n7QIfAAvD+MQroC6Tr3qr3PfCpiX/J5mhmAvI+qTX6y/L8bThPQxPh44s5TO+
	2uCBquOOp80tDzCZZx/LYyuO6pqTdP5I2Thvyw0d6UUKBQNUb92b41n0dWUYsVLc33kkSFxxxDG
	srpV61ZwaGi2G8UxG5HbtyaUJokSC8DaWHnP0jHIHv3eSQkM3yhdYVGMdTlf89H6rBpbs1
X-Received: by 2002:a05:6a20:4b93:b0:3d0:c5c0:d9b3 with SMTP id adf61e73a8af0-3d0c5c0dd51mr5408104637.18.1787783007967;
        Wed, 26 Aug 2026 15:23:27 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc1bec86171sm1469691a12.27.2026.08.26.15.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:23:27 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Wed, 26 Aug 2026 15:23:21 -0700
Subject: [PATCH v5 3/4] pmdomain: core: add genpd_for_each_child() helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-topic-lpm-pmdomain-device-constraints-v5-3-28cbf43f7e38@baylibre.com>
References: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
In-Reply-To: <20260826-topic-lpm-pmdomain-device-constraints-v5-0-28cbf43f7e38@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3687; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=GqndFSZk8fTM4Q3z/je+OwIp0v2J7tUgj9fTETnG4Z0=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqj2dcl8uQBtCqpcUHycoSoVH/amfmT/xCaoO2q
 Kye8rp/InKJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCao9nXAAKCRBZNxia0/vG
 ZT4zD/sHm9vr2c33S8xj29Skq1lkfALxLbmiE+fHTAc36Oq6mxiGnMtJubFU0t4oolW0yeeqm0i
 A1DAnoo9IZx0MGX02ixxoifbaRFsbZh9pvfUYtinnJnss5jBoLlI6WuiKpt+MXiOBpCU0OiPKP7
 7L6hse1JFXlYBbevqr0F5nZqJ3IzSEnSpaCNM1fjx/9SFN/tjUZUWgm7qIrTGQflXNRlOgX1Ryb
 2QaDQrQxTJsw2l2XLOSd7BUM2CnVKJD7xokG7gr1jMX9OU8T23PdKb9PYTTdow3mRX1Z8hvrPBM
 u7lST5LEgv6dKLMSiEw8IIVaskj3Ky9JOWh6z2cRn6lmLQ3hKtEcKN7NsGemJU5aZB/6hmhQSRS
 ewZjGGGudq3q3N2TA8CEuYCW5s7DSvzweVMMElRxANSeVtpn/MDm9FQfE6WdK/+OaOrpauo6rz5
 lcJJJGZcH/jqTOT3Dw1AWze5uzSTceLPN726L+GqAq5p7wcLzNNZ792ki7boJLFcYnOQOLlCqTo
 QMlPhQdSKmprlX22q5Nz9yKgpbqcXrpcxq/XlQumX4nszuPOE9iE8gGFkYQ+aJFBaoBtVEjOgeP
 2GZ+ROjiPJG2HrhKNcr2W5DMkbDR+W043nCIUvnrRbmRNbwSnufZeJ7Mo9cTi3VPPx1LiDYAp4C
 5lookvHC8zD36MA==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665

Add a new internal helper function genpd_for_each_child() that recursively
iterates over all devices in a PM domain and its child domains (subdomains).
This helper is useful for governors and other core PM domain code that needs
to examine or apply operations to all devices within a domain hierarchy.

The function takes a callback that is invoked for each device, and supports
early termination if the callback returns a non-zero value.

The helper is defined in a new internal header drivers/pmdomain/core.h and
implemented in drivers/pmdomain/core.c, making it available to other PM
domain subsystem components.

The first user of this helper is the cpu_system_power_down_ok() governor
function, which uses it to check device QoS latency constraints across the
entire domain hierarchy.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
 drivers/pmdomain/core.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/pmdomain/core.h | 17 +++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..ff27369d9a97 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -24,6 +24,8 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 
+#include "core.h"
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -276,6 +278,49 @@ static void genpd_sd_counter_inc(struct generic_pm_domain *genpd)
 	smp_mb__after_atomic();
 }
 
+/**
+ * genpd_for_each_child - Recursively iterate over all devices
+ *                        in a PM domain and its subdomains.
+ * @genpd: PM domain to iterate over.
+ * @fn: Callback function to invoke for each device.
+ * @data: Data to pass to the callback function.
+ *
+ * This function recursively walks through all devices in the given PM domain
+ * and all devices in its child PM domains (subdomains). For each device found,
+ * the callback function @fn is invoked with the device and @data as arguments.
+ *
+ * Note: this function is inteded for use by the core and governors,
+ * not for pmdomain providers.
+ *
+ * Returns: 0 on success, or the first non-zero value returned by @fn.
+ */
+int genpd_for_each_child(struct generic_pm_domain *genpd,
+			 int (*fn)(struct device *dev, void *data),
+			 void *data)
+{
+	struct pm_domain_data *pdd;
+	struct gpd_link *link;
+	int ret;
+
+	/* First, iterate over all devices in this domain */
+	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
+		ret = fn(pdd->dev, data);
+		if (ret)
+			return ret;
+	}
+
+	/* Then, recursively iterate over all child domains (subdomains) */
+	list_for_each_entry(link, &genpd->parent_links, parent_node) {
+		struct generic_pm_domain *child_pd = link->child;
+
+		ret = genpd_for_each_child(child_pd, fn, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *genpd_debugfs_dir;
 
diff --git a/drivers/pmdomain/core.h b/drivers/pmdomain/core.h
new file mode 100644
index 000000000000..a296134d4005
--- /dev/null
+++ b/drivers/pmdomain/core.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Internal header for PM domain core
+ *
+ * Copyright (C) 2026 Kevin Hilman <khilman@baylibre.com>, Texas Instruments
+ */
+
+#ifndef __PM_DOMAIN_CORE_H__
+#define __PM_DOMAIN_CORE_H__
+
+#include <linux/pm_domain.h>
+
+int genpd_for_each_child(struct generic_pm_domain *genpd,
+			 int (*fn)(struct device *dev, void *data),
+			 void *data);
+
+#endif /* __PM_DOMAIN_CORE_H__ */

-- 
2.47.3

