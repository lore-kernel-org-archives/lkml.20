Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043E521893
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804642; cv=none; b=Ed9cV6xz1KDUMZ7D8r2JLp45B8fbxkkCFqyminVjUlwwvXZRNrzQydA79Zdnj4JVS2PIuD9LhnIe9ugHFQ4A/zw+JCnOijaJmXFzADzaXKEuHC4LFHBB7N1esyO9PpI9Q/KEPeYFORdWWvOddt1ejv+BKbxxG0cHfj8dYQcfSvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804642; c=relaxed/simple;
	bh=n5rhP85eyAVowFGBZ44n1IyXNOtUn7kXNnJTMsxqjOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sS/PNFzbTv/NIuejs4CBMGTFpxOnbRFasQ2BtJCt8PcL6aY3OrKS2bV+aJD7PN42IcFF0bR9KUogbR/LFcJFEZik4xGyil21odGZ69BKVihTtB8LIAItySLFeO+jmjPn8z3nweswvbt1IKJmw1OWbfZZex8yjqlPnC8plrafe+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBPx6uUV; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBPx6uUV"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c6bfce73so874766a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804640; x=1791409440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6cWGMpNdC2ygc1fzeq8wRAKitGkWhVyImvzt26Ozi0=;
        b=EBPx6uUVcbm7Lgq0YGL65Z8opYKPS7DZ0beejqbPUhPMyvvr81DfpsTCOI9lN7MbjT
         FHIElY4f2YsE7pGw740zxQEkvB8W/jG1IHOSOUkeAVrEkOGxor8/S48TlWXSsSVnrK86
         FaAPK22o6D1pVnRD0wawcpRwxYnQHxJvM7IE0jily3ggw/buidJ7TYx8fo9yurnp/pAq
         d50hLn7CugT3EYDP1jaUHRf+4bZnh2N0jf0toFkhgpfQxpWaxhx2VVQeEpt82JpO8yVE
         /gktyB32ad5gimBOmGOiPUn1mjJSWsMEWg+vPqCpjzHH3tdFSLvlZALabRdDtXXwjK9q
         3D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804640; x=1791409440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6cWGMpNdC2ygc1fzeq8wRAKitGkWhVyImvzt26Ozi0=;
        b=ZiEKQtVhhLXW5ONHvkRONV7N8RgE8JVYybDeuYciywMr1CCq1KXSYZit2BIAXSTEPX
         vJPC1vnWBzAIjfpbaN9de4ILAYhi2o5VbcWV1miiEDhGgtXaXla67chlkM5i+U7Y7wjW
         LFejTtm93gO7mv8Kxh/r3NarIh2sJF8xExOSh486+TXarjkfKF86UF19nm6p+QVQYagN
         yY52iCl2J55p1m5rZYJAY1c+3WzYpZh98q6p1zmsBGKa9fHTKPQ8TzGljveC6gaClsad
         NBAu+UkL8vwWXbd8t4tQpAUkEjEwL6cbtWlVvEr4qjwhXUX6Uz00w9wpg+x9r4VcygRr
         OAmQ==
X-Gm-Message-State: AFq9FYIy7vBbzkPVaLLXbGGDjzXFriySkAG9F/dCViB5E8JttrC0EaKM
	jGaae3JMn3ZkyA+3zpeT5rlE7E+pUpLaYofO9w9auF8vOKxNye1CP1hugsuXrtZ2
X-Gm-Gg: AYBFou3/ZbnsEIGth5O08F6Fe81jiTfMjJAuG2iEJ7XstNMduiel875n/7Bp8DAZXbK
	FbqFAZW+PWH031P3xHB2H254JNA/r7Gn9Yk+M1lZoa0iVY1IzPF8nGvvF/aLEGfKjbEnj3CqIxy
	KQxacbKP9UHa+WCWfvwN/npm2Gni748ndpK28ZqFsv8TTnV1fvVzFim1gwt84G7BSkamCZK8vaT
	JN8WHNEcFbi+qc52TlqYmvw5srbI/JnyzWJZpnIpt9dkjDrWmkETaxI6ft6mZJMgtA1XhAVeL1W
	9QotouAZ772+usE6L1GCD1OsYP4wCxXVUTd886sWtWC+V5rodIMDVxzi/kwyG/g/6gDH+HMcKXg
	RclF2CGDffUSOA8/JWFG6tfnL7NTciCbvBUpu4XJvWrSPkjhaK1GOaZ/r3NS9+Ge03OLZ4ElBxq
	as+1azyVBhI+Ewi+G0CrF1EDCCChsasecHJ9NcIS32v9RocMLxH8TMrdvdDPZf0rduato=
X-Received: by 2002:a17:90b:35c8:b0:39d:ec1b:9651 with SMTP id 98e67ed59e1d1-3a4f661542dmr482548a91.13.1790804640076;
        Wed, 30 Sep 2026 14:44:00 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:59 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 9/9] media: ov8858: add ACPI device ID INT3477
Date: Wed, 30 Sep 2026 14:43:21 -0700
Message-ID: <20260930214321.600863-10-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..d106cad6f 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] __maybe_unused = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

