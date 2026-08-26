Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69B3FAE10
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750564; cv=none; b=gOam54hKpY8+poqSSfjifAO8SHDylW3i4KL4xmHFM+hE7t+1QoBzPXMAUuIc1WGqJvTcQ96HQp+lM8T5K/ZB7OED+kVJPaHC99K85GWEOSZfOweiBmVS7pgpVxtG0ZhKXAuKot9lNq10ABxn9X64ZcDvSB00N20qfIWexe2G4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750564; c=relaxed/simple;
	bh=orykmKvUfd1dTPpdQ9Kdd88lE5tcBLc+5G3yGs84EF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SM89OnhRViPN91e/Yr0WhusMHI7y1Z4umIrbYeIufXhOcra/xlzoQ3bwyToU+sK48RV6YA6D/MmiK2vuglkJ3MtG2KIDDCPLtKZQeRkWGU5VI0dSlgZ8tSliJS9JeNLxIUh0kue0jmmUnUMdNQKiqxR8SyhHHSeO7+q11/2HfRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEseAi7i; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEseAi7i"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso1387749a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750561; x=1788355361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTBTkFehMJyurMqidmr0BaRU5VlANCTcz+Q1ejbj4tU=;
        b=aEseAi7iyWc9NmQgYOhnZ+udf+nMrMXiFSDbvJr+Y9aKX6FLTUiC6ouSucyT76O6R4
         +gfuJeaG8W343M4bCol/YDLI9UGljdZsJui1I/Q5jxLarBy1MwfWrY08Uv5pfjD3FOsL
         Xkn+XmZZ2pAvQrgq+eHVDuS9y6siJCg9EDZkyPZoe7FlXg7+P1GDBdCFn7SKRS0bHJ/9
         O+VeJbu3JGOFcwshJAwouY9CHGZ49kt2Ksk+GulsUA5BYvFU6QuAVtUEdJTbsrDTyeid
         /4UmyifOLX9s52h4NrZA+N04/pIwqFeC7CVGpYGDFbRTaEgvWDXQ9I8xYzga8H1QsxNn
         2WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750561; x=1788355361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTBTkFehMJyurMqidmr0BaRU5VlANCTcz+Q1ejbj4tU=;
        b=rx7VIRJ4xoSli5gd3kVey89Ia1/KQeV34vWXn4DEmG01hyAb0QrtyIUKNIVFRcZWs3
         T0Qx3m2Bsj8Dtdjv9+FQLa6f9mJndpZVrV7Q+3HWaCNSmxaWhtwUs2IJa6m2LBIv5ILq
         CtV4BHBsDRr7Q61ZLj5qY2O442uVOMfXRsmQSwNHE515+psSRv4ii9oP97fwPKk5XR/9
         U9jGj895jSz3UqbfgnrT6UMr9oc18xmCuGucavW7wqtAEo7PvT0RNOyBTo31OVsBijOw
         gJZ6TwYTYE1z61U0DjH53EfgoMlssnxUewzXW5WWphb6sPyyJ3aTS0BIy+NDKpqw61im
         HnKA==
X-Forwarded-Encrypted: i=1; AHgh+RqrM1S5e50x+dGVa6FiOvm5pcGCxgj2UVAofC6HwXgw44qJE4btfmmKFbCrgR9kqOX5vmifVLfN8hz3jAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kEPzUYEoaEOa8J7NfEZqhQgV1QganYkIqvzecNlDeojHT6NMNn
	Z+HdlS44PH9ZINPdLl79VxOvnYaXunHtdZHWSJfnPIbZPiGYbwHQj+5y
X-Gm-Gg: AR+sD13VVEkg7GI4D7f5aIWKiwEH6MsuQvAG3SYCQoMRBFUAPhkNUekHYpgB7b1ppD1
	7+FxHWHfGgNEoirZvkfvT0T2zaT8oQtoneqcrEh+1Qmn9pphoomvruQj/VHRr9xhpxwLiVdcy90
	QPBtd/8xFyNCVTw2C6olGMblIWG4anbqPHLhbsUKTBOzn7bdQxLBKd5L+IaWL2bjP8P/fW8XCfx
	1nWixcBxT+ukcLEpAFoqMjE6WNun3WU2yl07oLqzeY9hXCe6R3uPHCNfkWIAomtCYT5JyjyZezK
	i57/udjNg+yhN5vuonlsN8vPsX+5tge7u71Dzk/67vccMqAdynd51NmqTwFXcWso6farW8akITl
	P00tY7k52NjSnwioGQ/5ktH+rnHQc8oJHJL2hL7fFIy+tR4CmFJicZW4LXNMVjt/XYXO/rxWESa
	srGSY1gmaJVznyNvundhL/Ove9S8+TnSEZMEd3+oj22D39knKFie2MjhE7O5gwi4pyMgjAaiGDc
	K5CgP3lwXCZYThD3W19gj1BCHXVWsuW8tfLwugBASg=
X-Received: by 2002:a05:6402:a506:20b0:6a5:f081:1d0b with SMTP id 4fb4d7f45d1cf-6a5f0811e4amr2392515a12.16.1787750561328;
        Wed, 26 Aug 2026 06:22:41 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm1689857a12.17.2026.08.26.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:40 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 1/3] platform/x86: x86-android-tablets: Describe Yoga Book haptics
Date: Wed, 26 Aug 2026 15:22:31 +0200
Message-ID: <20260826132233.3342481-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI enumerates the Yoga Book YB1-X91F/L haptic controllers as
DRV2604:00 and DRV2604:01, but omits the mode and waveform-library
properties required by drv260x. Both use LRA mode with the empty library.

Attach managed software-node properties to the existing I2C devices.
Hold references until removal, reprobe after adding properties to cover
an earlier built-in probe, and remove the nodes in reverse order.

This has a runtime dependency on the drv260x optional-vbat change.
Functional haptic feedback remains a hardware validation requirement.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../platform/x86/x86-android-tablets/lenovo.c | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..413d3633b2e6 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -114,6 +114,12 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
 	.properties = lenovo_yb1_x90_hideep_ts_props,
 };
 
+static const struct property_entry lenovo_yb1_x91_drv2604_props[] = {
+	PROPERTY_ENTRY_U32("mode", 0), /* DRV260X_LRA_MODE */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	{ }
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -283,9 +289,70 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
+#define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
+
+static struct device *lenovo_yb1_x91_drv2604_devs[2];
+
+static void lenovo_yb1_x91_add_haptics_props(struct device *dev, int index,
+					     const char *name)
+{
+	struct device *haptics_dev;
+	int ret;
+
+	haptics_dev = bus_find_device_by_name(&i2c_bus_type, NULL, name);
+	if (!haptics_dev) {
+		dev_warn(dev, "cannot find %s, haptics will be unavailable\n", name);
+		return;
+	}
+
+	ret = device_create_managed_software_node(haptics_dev,
+						  lenovo_yb1_x91_drv2604_props, NULL);
+	if (ret) {
+		put_device(haptics_dev);
+		dev_warn(dev, "failed to add properties to %s: %d\n", name, ret);
+		return;
+	}
+
+	/* Apply the properties if a built-in driver already attempted to probe. */
+	ret = device_reprobe(haptics_dev);
+	if (ret)
+		dev_warn(dev, "failed to reprobe %s: %d\n", name, ret);
+
+	lenovo_yb1_x91_drv2604_devs[index] = haptics_dev;
+}
+
+static void lenovo_yb1_x91_remove_haptics_props(int index)
+{
+	struct device *haptics_dev = lenovo_yb1_x91_drv2604_devs[index];
+
+	if (!haptics_dev)
+		return;
+
+	device_remove_software_node(haptics_dev);
+	put_device(haptics_dev);
+	lenovo_yb1_x91_drv2604_devs[index] = NULL;
+}
+
+static int __init lenovo_yb1_x91_init(struct device *dev)
+{
+	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
+	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
+
+	return 0;
+}
+
+static void lenovo_yb1_x91_exit(void)
+{
+	lenovo_yb1_x91_remove_haptics_props(1);
+	lenovo_yb1_x91_remove_haptics_props(0);
+}
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.init = lenovo_yb1_x91_init,
+	.exit = lenovo_yb1_x91_exit,
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */
-- 
2.53.0

