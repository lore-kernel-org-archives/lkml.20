Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD634BC007
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281821; cv=none; b=jCaEogq5WM+oDoF2/w4AP/yodF/HgTgvh5C2MFWXYJtyGTGykH62oMQkt11svEGoF+3wCivyG3t8MO2iM/7nj7v6hdWqYDDSZXt2v5sCBL0Ewfc/B4qm1Osek+dVbDCSSk/F9W3ycrVc2xYFrOhTqCXfC4aLTNoWPU176tknHGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281821; c=relaxed/simple;
	bh=y9WUYmjiye06xVLv8oTcIaVbAEDADxGs04QKHSw49AM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGahpdPolYwEcB2Fgx3n7NmkRFERcGTwNdKCfJmEwI8Gctt0M0pRqQK5uheEEfbmT4flZteAbeqJRnOvZr+g4e35kGiWjG0R5byqzmxIibIqODIi64De0COb7yuL4HRCZg4SaTWmSvCbk9aZWp9a1qqt+jdlKtPefmwdgxz55oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Avdq+uWr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Avdq+uWr"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so914665ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790281811; x=1790886611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjFM95nzoBopbHKT7ySWE4QE4ldDwC98rFYcBccdX/g=;
        b=Avdq+uWrSLTJueqiW/FolrcYOtB9y9bygXQHy10LwbPw6t9uzO8auN7Zt8BfUPCtMw
         tgdK8+mLFFpJm6cQ/YBLRzM8McwPI/kTwUsJAFdGNXCjrAp53IHEPQCB9CLTL4nIky0V
         4KtGgYAtqRgCmkH4Oy6nAS6AqV0bGf/FbyERzK6u2CXD0jmEOONJFNCmSWz62yGoU2Q9
         uvBgnaJorlSQHnOxkx1BJfHA/2ucSJUNW4TUteZBBeAHvJU9PRzP9XqQcbNNgqvUfXRl
         RbD32P4dgLt9hzdC371/nzsQBwZ671Hf7c1Gwn/9lWORkG72DNWEEfBo1Y4M0ksV5s/g
         shJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281811; x=1790886611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjFM95nzoBopbHKT7ySWE4QE4ldDwC98rFYcBccdX/g=;
        b=dIXQR7vYGWrxz9sRTk44TlutlKcdVb826D01VbvsQsCWRv2EiWAPBb/oWkHRcqu4/Q
         +pAG/8oL06c3f2NHg++1r5k0rqOrJeWHnNtTuKdqqOyCvJ1+AqyLqAvCPy4W6DUJwG59
         BjLiSK8/51C1TD+LNtZB6CXii6kuNZ9qTvRx2FU3Xif8uJZgq1I6OEcrETfaHRD92kjF
         v0XUvNPOVXg/t5lSgvlsCZ7f7Mn2DCbMtz4UrJUgzCYZ/DWvc6/k30MKYjNsqjcvsZQr
         Ddl+/XtI69pANTDDnN2ruwu6HA/29Z/07QmObB1saiyEcNOKlGMFi8rXw4PRuXsOgUQz
         08tA==
X-Gm-Message-State: AFuF++lIyIwHhhQXFmqALOJwGa7SyyPHCbDPPK5b0zTeIqo+vGZtaSot
	o2GjOWL9L2bFMpZDylBcr3zCfpRDW82yj+e/MawCERtu/vKjZm4U2zPXzqd51RiCUxq62Xi8lvr
	JBTXj
X-Gm-Gg: AYBFou2pv0X0Xw8QYDm4XUA6OaqYCgC8fhf1xx7Lj0g1IuodJRVbdAWs5Rg7iMH9X1c
	ZGL1WniEIWViORYj7ukgXy2QDi9unIh6QlbzxBQX+p2Ct9zdYm3V+y6mkFccH+jrmttz7fXHeSz
	VvekMs/y2UJmK/AYwBYa4oQ7JoktHrU69tMcU/fFkulp0p9pITgjLFtCm1eIKBDH5g7PRDgbp+f
	MjHvs/MyXqZhIKJyDuHDDwwt9kq3eZ3Jzuk5upatBML9yYDf/anoucNvEyKeSePura+AYEdZHAG
	fsAr+KKkIczDoU9x32GtQGcK1Lep9+fi9H5aa1wH+MIIl2mHnK2YmZwQuNa89MxQ2CcQCslmvpL
	CXejInEdryolpE5ODlc8sLGgpyoas2Fg23M+CJkFK2QH4PYlmin3+Iq3GkG7LNSTkGewCIwRqXW
	NH7utPJk6Wx64W9j2HIPdK4utX5KTM5t2JsRduFjRik7Ntq8lJUXFPojuBX3m/7kvPJD8=
X-Received: by 2002:a17:902:f707:b0:2dd:c100:9439 with SMTP id d9443c01a7336-2df7e65c38dmr29472265ad.55.1790281810795;
        Thu, 24 Sep 2026 13:30:10 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2df90fbc951sm1354305ad.8.2026.09.24.13.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:30:10 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Date: Thu, 24 Sep 2026 13:29:58 -0700
Subject: [PATCH v6 3/4] pmdomain: core: add genpd_for_each_child() helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-topic-lpm-pmdomain-device-constraints-v6-3-a69a4856252b@baylibre.com>
References: <20260924-topic-lpm-pmdomain-device-constraints-v6-0-a69a4856252b@baylibre.com>
In-Reply-To: <20260924-topic-lpm-pmdomain-device-constraints-v6-0-a69a4856252b@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=y9WUYmjiye06xVLv8oTcIaVbAEDADxGs04QKHSw49AM=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBqtYhOyQ2PiteWewCyn13JlLBbX4dgmDi/FKVuo
 1z9RKoVNpuJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCarWITgAKCRBZNxia0/vG
 ZYL5EACh7BjxR0UyJ+Tg9XHjSKNWdiiSyz010AV5JrIB4l1zjX8CLUGPdA3rpLq4WGQcAMSIrAP
 ceQDE7GVFWo8cfZ6tIOIbrZHIax8N8/ezBttFZs7PQPk7pDQyrG4uci4oI/neFk0DC6U/VB+SuE
 OT8eAZdhJ7fLjnPC5/+83nvCmtAag47i4OBrF6/MpjCQL2jgjDQgrthpkSJLLpALOk6eMNDc+5+
 6A71JjCr+CXOeWNJFsozny75+ZEFmnnQPeLuKi7anvnwz1HsPXKQytJLu9U7G6RK9mPEv3ic4ao
 JFa2qN0aZflPpaN0HWt5pNVIVq1RiVdloa36CndUOogZ1PqtZlS1f1+IjuuZQDrMxgNnvm6dxMj
 s91mfLpxRKeIUOmVprDQ6zmqSJ5FAPlCj2M5qYd+1umR3rQAuP4ud2vG0SyhdoI672kaT4Hh+0K
 B8IHaCG8HpRFJMmowBit1tlMsIWQ1KZIjxGekQF5FqNTRc6ARl10f27kaJ7EcaPccjLh4RJAvW5
 jDlaRqV1Y5Nm57OnQVHg0ebovLSlirmHBajcu0rFJbt07hrMuArMs+fZbYjAO7l/0CJZZ3ErQIG
 GPMNZGwmD/XpYirAVlWdXFMZthars1crmPOm0EX2nrmg7A80BWP6781shKYzpwsp4Hu5a+q3PYy
 pyX/9NQe0cP2Ajw==
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
 drivers/pmdomain/core.h | 18 ++++++++++++++++++
 2 files changed, 63 insertions(+)

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
index 000000000000..d1df535a834a
--- /dev/null
+++ b/drivers/pmdomain/core.h
@@ -0,0 +1,18 @@
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
+struct device;
+struct generic_pm_domain;
+
+int genpd_for_each_child(struct generic_pm_domain *genpd,
+			 int (*fn)(struct device *dev, void *data),
+			 void *data);
+
+#endif /* __PM_DOMAIN_CORE_H__ */

-- 
2.47.3

