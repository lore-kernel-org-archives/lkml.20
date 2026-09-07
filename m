Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC921471265
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793319; cv=none; b=R2dws4Bv1HyQF6yDZXYlKifGO6EhtK4Bvft3zxS2/2FLwtDoE+00F7nHF88poCOHY/oQwtvBnAPn955IG37M6erHImCRwN78/Nay2LkgT20eqFZwb5Ke2TDFZhOSWJpA4cSoO6YKj2y2i/g/Y3WxmXqmX5wVUzm+wUWFWV0DK4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793319; c=relaxed/simple;
	bh=yP9RfVxzD8mok6o8UT0hT5i3xCcDqcxVYHZ0/CWI8CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhGDAsIOMqpaWO0gf++h6uVI3PbtwuaDqAGuQjpMsTqQ3GfQ7W3ESog+mRoZf8f0LPb6ig1D3zTbWT6xJfMBhOO6fWnQQ6OvGSJxdnl6iWUCag+JzLRIhMec4LNICp/W3NDKj6KtgVt179XHiUeQxpwdZOLJyVW9i2CnGlJTSzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=1XTWX0bR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="1XTWX0bR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso39095615e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788793316; x=1789398116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc/EAEQUnK6X7K+MUTGqGFOOzMk/azBNDSYL0Jyzjpg=;
        b=1XTWX0bRxoY5JBfXvG8h1zF0SSeaO2WTjOXNiZeBF70C0uAuTe/X569S/MhOgnEdbW
         uKH4VzLtMPuHrRZgnsBfU/0cBY7JBz7bxIQjN2KuzkfFQC/lQs+7yBIXmIPDyPK3LB3X
         6Lz6O28WSl5/0fEQOF1MY4Yd+vXkJarpgLzqG/e2OoAQQonvn9S0I9+JFT/L0qMnABAl
         u1fzgwmSZDuMfzaHx90/qhTBdWp7WjLRppL/h9krP0D7l8eIHyBInKi7ssMDlIb79pB/
         pVC74VgtV03g+nK4p+mbU2Rl9K/j5W+89I2DBqHUrdkLH6w87w48GN29ZZA5UBbp6dBD
         jUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793316; x=1789398116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cc/EAEQUnK6X7K+MUTGqGFOOzMk/azBNDSYL0Jyzjpg=;
        b=IL82iEvsNxWtMui7o/tIYUekikIEAlT9ZEImVZ8ETnjWDFW1gdYLijej4LUk+9xogJ
         PEVs21voTfaaKMMB7kceBA4RRQH61674LVFQ/434TtPalcic9dJ1gN9wyCzxUIGYHH7b
         EAukiDfUnwDH2VZRzrdIul1Kmn3nCaG0fvaup2uGzSMxDNkpBk5LUALwxwg1Jigw890i
         ToGZvbwSzFXwIKfQzw0vzlLDxD6xjliIYIN4lc6GTRwWMIwHRK/YtsWUIqEM3VtHmcvH
         LGB8niYwrU7VUptPAECqqKVb0HvHlILwiNf34gEwBNcZoyMi69+V0SmVjDmqZWMnhw26
         yoWA==
X-Forwarded-Encrypted: i=1; AKwUvBwgPsfg+IwXGlZlVa/CS8r7jjHTR21BHNpNdyzgPpc0h0b2EGWWTtgycMKjR03r3OKuPQ9MBr0ETWz1B4M=@vger.kernel.org
X-Gm-Message-State: AFuF++ndGxT0/v6Ci+eIAsQX3dqC+0kO9gKo+Ay8V/+5i5mceZcN9aq9
	jWjvrVVVh07iB1J/QMFzXpoxqu+mdlX4kfClie2gNU055EqE3dJum0XZJdb58d275q4=
X-Gm-Gg: AYBFou3fQ25uobuNwZLPxBtqXLQHDW1NaqYgW6jvwzIk4suRvMLtFcnAzYWRCKHqcTf
	rlCvR2860w/1RoKd2lQe6k788IDcodeULU5n+4nzCoR8uarwuHMlrJRoHVwPDiZkLQZ/bmh1iXB
	AxTGxHKqdt/UsWlJTE40R0hHYkhp6iQG0nICiwkpMq1z4+7MNoKVgt9fLYxfJ6txnGIBgjVsIaZ
	bF4o7bjmJDHMlzLYxI0JxZmXkWrIH77NukDfb6XgBFniypqP2uQY9Yb6sAAG/na8P4UrX8zmxcg
	cWQPsAZBmF65Pqt/LlMgyAXTp+LSEPqE3pQTniqrrn8DH5VKJVHVnDduNU20FZNd1MSAL2NhadK
	BCtmJUBH9Oaa+rPSah/JwOAPK0TPiXMNfnkxS3NrTHyevKNYuwkvVr37/BdwTMbExyBfDhShylu
	fK18t0yIbMTPEj8ewW5C50SMlbqjvd3cQ956TfQiuVBG++Bz7OEERRes2Nkf4Ptkto3M+qnSCEE
	28FIucu57c6ugfe2sp9250N+5qh5zB8ry2pRbCp
X-Received: by 2002:a05:600c:1990:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49cf82524a2mr348015055e9.14.1788793315751;
        Mon, 07 Sep 2026 08:01:55 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm262992705e9.14.2026.09.07.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:01:55 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 07 Sep 2026 19:01:42 +0400
Subject: [PATCH 2/5] power: supply: core: Allow getting battery info before
 psy is registered
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bq257xx-init-v1-2-1a08b29e1a68@flipper.net>
References: <20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net>
In-Reply-To: <20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net>
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10290; i=alchark@flipper.net;
 h=from:subject:message-id; bh=yP9RfVxzD8mok6o8UT0hT5i3xCcDqcxVYHZ0/CWI8CE=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGqe0dyigbVIvbl5zZsiMDd32BxIu8uPObWbHxiDQzYGa6MH0
 4iRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmqe0dwbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlIhIA/iBckGczH19zVds8L5SXN35KiYZiOKoqgTiy8aWdBvI
 nAP9/vcBlHdtAfLfXF84QBQej6uGziahHEGBKftfEwvxxBA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Some power supplies, such as battery chargers, may need to program the
device parameters based on what their connected battery allows. Current
API requires registering the power supply to access battery information,
which is problematic because a registered power supply is immediately
available to the rest of the system, but the battery parameters may not
be set yet in the charger.

Given that the battery info helpers really only need a fwnode and a struct
device to hang devres-allocated resourses on, add a pure dev-based get/put
API alongside the existing psy-based one, which can be used to query the
battery information before registering the power supply.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/power_supply_core.c | 102 ++++++++++++++++++++++---------
 include/linux/power_supply.h             |   4 ++
 2 files changed, 77 insertions(+), 29 deletions(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 83769fc33575..855c89f712e8 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -725,21 +725,18 @@ struct power_supply *devm_power_supply_get_by_reference(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_power_supply_get_by_reference);
 
-int power_supply_get_battery_info(struct power_supply *psy,
-				  struct power_supply_battery_info **info_out)
+static int __power_supply_get_battery_info(struct device *dev,
+					   struct fwnode_handle *srcnode,
+					   struct power_supply_battery_info **info_out)
 {
 	struct power_supply_resistance_temp_table *resist_table;
 	struct power_supply_battery_info *info;
-	struct fwnode_handle *srcnode, *fwnode;
+	struct fwnode_handle *fwnode;
 	const char *value;
 	int err, len, index, proplen;
 	u32 *propdata __free(kfree) = NULL;
 	u32 min_max[2];
 
-	srcnode = dev_fwnode(&psy->dev);
-	if (!srcnode && psy->dev.parent)
-		srcnode = dev_fwnode(psy->dev.parent);
-
 	fwnode = fwnode_find_reference(srcnode, "monitored-battery", 0);
 	if (IS_ERR(fwnode))
 		return PTR_ERR(fwnode);
@@ -750,7 +747,7 @@ int power_supply_get_battery_info(struct power_supply *psy,
 
 
 	/* Try static batteries first */
-	err = samsung_sdi_battery_get_info(&psy->dev, value, &info);
+	err = samsung_sdi_battery_get_info(dev, value, &info);
 	if (!err)
 		goto out_ret_pointer;
 	else if (err == -ENODEV)
@@ -765,7 +762,7 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		goto out_put_node;
 	}
 
-	info = devm_kzalloc(&psy->dev, sizeof(*info), GFP_KERNEL);
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info) {
 		err = -ENOMEM;
 		goto out_put_node;
@@ -826,7 +823,7 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		else if (!strcmp("lithium-ion-manganese-oxide", value))
 			info->technology = POWER_SUPPLY_TECHNOLOGY_LiMn;
 		else
-			dev_warn(&psy->dev, "%s unknown battery type\n", value);
+			dev_warn(dev, "%s unknown battery type\n", value);
 	}
 
 	fwnode_property_read_u32(fwnode, "energy-full-design-microwatt-hours",
@@ -877,7 +874,7 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		err = len;
 		goto out_put_node;
 	} else if (len > POWER_SUPPLY_OCV_TEMP_MAX) {
-		dev_err(&psy->dev, "Too many temperature values\n");
+		dev_err(dev, "Too many temperature values\n");
 		err = -EINVAL;
 		goto out_put_node;
 	} else if (len > 0) {
@@ -892,28 +889,28 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		char *propname __free(kfree) = kasprintf(GFP_KERNEL, "ocv-capacity-table-%d",
 							 index);
 		if (!propname) {
-			power_supply_put_battery_info(psy, info);
+			power_supply_put_battery_info_from_dev(dev, info);
 			err = -ENOMEM;
 			goto out_put_node;
 		}
 		proplen = fwnode_property_count_u32(fwnode, propname);
 		if (proplen < 0 || proplen % 2 != 0) {
-			dev_err(&psy->dev, "failed to get %s\n", propname);
-			power_supply_put_battery_info(psy, info);
+			dev_err(dev, "failed to get %s\n", propname);
+			power_supply_put_battery_info_from_dev(dev, info);
 			err = -EINVAL;
 			goto out_put_node;
 		}
 
 		u32 *propdata __free(kfree) = kcalloc(proplen, sizeof(*propdata), GFP_KERNEL);
 		if (!propdata) {
-			power_supply_put_battery_info(psy, info);
+			power_supply_put_battery_info_from_dev(dev, info);
 			err = -EINVAL;
 			goto out_put_node;
 		}
 		err = fwnode_property_read_u32_array(fwnode, propname, propdata, proplen);
 		if (err < 0) {
-			dev_err(&psy->dev, "failed to get %s\n", propname);
-			power_supply_put_battery_info(psy, info);
+			dev_err(dev, "failed to get %s\n", propname);
+			power_supply_put_battery_info_from_dev(dev, info);
 			goto out_put_node;
 		}
 
@@ -921,9 +918,9 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		info->ocv_table_size[index] = tab_len;
 
 		info->ocv_table[index] = table =
-			devm_kcalloc(&psy->dev, tab_len, sizeof(*table), GFP_KERNEL);
+			devm_kcalloc(dev, tab_len, sizeof(*table), GFP_KERNEL);
 		if (!info->ocv_table[index]) {
-			power_supply_put_battery_info(psy, info);
+			power_supply_put_battery_info_from_dev(dev, info);
 			err = -ENOMEM;
 			goto out_put_node;
 		}
@@ -939,14 +936,14 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		err = 0;
 		goto out_ret_pointer;
 	} else if (proplen < 0 || proplen % 2 != 0) {
-		power_supply_put_battery_info(psy, info);
+		power_supply_put_battery_info_from_dev(dev, info);
 		err = (proplen < 0) ? proplen : -EINVAL;
 		goto out_put_node;
 	}
 
 	propdata = kcalloc(proplen, sizeof(*propdata), GFP_KERNEL);
 	if (!propdata) {
-		power_supply_put_battery_info(psy, info);
+		power_supply_put_battery_info_from_dev(dev, info);
 		err = -ENOMEM;
 		goto out_put_node;
 	}
@@ -954,17 +951,17 @@ int power_supply_get_battery_info(struct power_supply *psy,
 	err = fwnode_property_read_u32_array(fwnode, "resistance-temp-table",
 					     propdata, proplen);
 	if (err < 0) {
-		power_supply_put_battery_info(psy, info);
+		power_supply_put_battery_info_from_dev(dev, info);
 		goto out_put_node;
 	}
 
 	info->resist_table_size = proplen / 2;
-	info->resist_table = resist_table = devm_kcalloc(&psy->dev,
+	info->resist_table = resist_table = devm_kcalloc(dev,
 							 info->resist_table_size,
 							 sizeof(*resist_table),
 							 GFP_KERNEL);
 	if (!info->resist_table) {
-		power_supply_put_battery_info(psy, info);
+		power_supply_put_battery_info_from_dev(dev, info);
 		err = -ENOMEM;
 		goto out_put_node;
 	}
@@ -982,22 +979,69 @@ int power_supply_get_battery_info(struct power_supply *psy,
 	fwnode_handle_put(fwnode);
 	return err;
 }
+
+int power_supply_get_battery_info(struct power_supply *psy,
+				  struct power_supply_battery_info **info_out)
+{
+	struct fwnode_handle *srcnode;
+
+	srcnode = dev_fwnode(&psy->dev);
+	if (!srcnode && psy->dev.parent)
+		srcnode = dev_fwnode(psy->dev.parent);
+
+	return __power_supply_get_battery_info(&psy->dev, srcnode, info_out);
+}
 EXPORT_SYMBOL_GPL(power_supply_get_battery_info);
 
-void power_supply_put_battery_info(struct power_supply *psy,
-				   struct power_supply_battery_info *info)
+/**
+ * power_supply_get_battery_info_from_dev() - Get battery info without a supply
+ * @dev: Device holding the "monitored-battery" reference, which also owns the
+ *	 devres allocations made for the returned info
+ * @info_out: Pointer to store the resulting battery info
+ *
+ * Same as power_supply_get_battery_info(), but keyed off a plain device rather
+ * than a registered power supply. Chargers that program hardware limits taken
+ * from the battery node need those values *before* they can safely register
+ * their power supply: registering makes the supply callable, so a later probe
+ * failure would free driver data underneath a running callback.
+ *
+ * Release the result with power_supply_put_battery_info_from_dev().
+ *
+ * Return: 0 on success or an error code on failure.
+ */
+int power_supply_get_battery_info_from_dev(struct device *dev,
+					   struct power_supply_battery_info **info_out)
+{
+	return __power_supply_get_battery_info(dev, dev_fwnode(dev), info_out);
+}
+EXPORT_SYMBOL_GPL(power_supply_get_battery_info_from_dev);
+
+/**
+ * power_supply_put_battery_info_from_dev() - Release battery info
+ * @dev: Device passed to power_supply_get_battery_info_from_dev()
+ * @info: Battery info to release
+ */
+void power_supply_put_battery_info_from_dev(struct device *dev,
+					    struct power_supply_battery_info *info)
 {
 	int i;
 
 	for (i = 0; i < POWER_SUPPLY_OCV_TEMP_MAX; i++) {
 		if (info->ocv_table[i])
-			devm_kfree(&psy->dev, info->ocv_table[i]);
+			devm_kfree(dev, info->ocv_table[i]);
 	}
 
 	if (info->resist_table)
-		devm_kfree(&psy->dev, info->resist_table);
+		devm_kfree(dev, info->resist_table);
+
+	devm_kfree(dev, info);
+}
+EXPORT_SYMBOL_GPL(power_supply_put_battery_info_from_dev);
 
-	devm_kfree(&psy->dev, info);
+void power_supply_put_battery_info(struct power_supply *psy,
+				   struct power_supply_battery_info *info)
+{
+	power_supply_put_battery_info_from_dev(&psy->dev, info);
 }
 EXPORT_SYMBOL_GPL(power_supply_put_battery_info);
 
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 6a8c4b140a9c..8a999a18c843 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -864,6 +864,10 @@ extern int power_supply_get_battery_info(struct power_supply *psy,
 					 struct power_supply_battery_info **info_out);
 extern void power_supply_put_battery_info(struct power_supply *psy,
 					  struct power_supply_battery_info *info);
+extern int power_supply_get_battery_info_from_dev(struct device *dev,
+						  struct power_supply_battery_info **info_out);
+extern void power_supply_put_battery_info_from_dev(struct device *dev,
+						   struct power_supply_battery_info *info);
 extern bool power_supply_battery_info_has_prop(struct power_supply_battery_info *info,
 					       enum power_supply_property psp);
 extern int power_supply_battery_info_get_prop(struct power_supply_battery_info *info,

-- 
2.54.0

