Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469739;
	b=xduLYbeUObWvfi/ocbB9DVx8RKChaF1Nk0CZQweah43ogtcmGo3PxmF2I2rWuaR2hYHv
	 vFH9mnim6K7WQFEG+ANVdzH4DLq53+ZQWBBqDHn04+xizzMjBzm1dQBy0Ik6m6CObrXZu
	 aEK1yvRXGhmCCgf2hem49Is64xOPmVFnEkQeq4EPU41W8FO8sh4EHQdnjw4oxPjo6bdt5
	 fLO6m3eS1X/s4j+VtcNpQUAU/pP6E1FkzACPSrzpwfaRF+V46J5s283k8einvi0kDUxo7
	 YkgSMoxx7iYxO05/31lYSSpFrq1P/BGoXyqxcvYS3INro5jf/y8RIDrDBBDnz73+9nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UTxjwsGyPSnDcBcDCP67400BSKT3Lhs5REZ8Ih/HPr8=;
	b=oiMZsqaNX4skKvIMti+ieGa2tdwBA65iINpxm2GZk6o9kxWk0r+ocL0zelHYtxmqWF2q
	 6OFID74Lyr5fN13r5RqlF9+FxC8hNM5pjUy9B3X9nR3/uDKZqBN7uoI4mQLfaIyH6eNo4
	 rYaecF+kS3EpdtzMIvJJyn10NFIpB84ru/Nu3fAqL7Svoqlv7cgrNc5dJl9w7ffTJ8er4
	 +282wKkungt6sYBfYBQTR68jsB2VevcW0HJ4SAYq8dJpnUvjv1vSwfJ67t0hfmuMUZcfN
	 wzjzsDq4sD31gQhrDYcwUDSF+uvUnvhenUKox9ZmB6Iv/gDU8e5Sc8u5awIAqvWPAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gY3ByJLT;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355060A2638
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7355060A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=gY3ByJLT
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C42BF3F98B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794469736;
	bh=UTxjwsGyPSnDcBcDCP67400BSKT3Lhs5REZ8Ih/HPr8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gY3ByJLTNkog7/3ckyMKAjrUn/MFx4doGGwAvlIgNrR6FVX4MeoLjjvOPBPWWw0WU
	 wzKTkuJagB1k+/0cH7ezwc/BYY7sC1cHHk8ePZtOY2l/HEU1vGwwAh58sOuXW6wW7J
	 ZDgafu1qdEuXP4TI0u8d1f9OYf3isX2yum39qrNyGEODtn8rKvaU93C0b+Ef4iJOJz
	 +pRLAj6I112+dJsa6wC1XhLEo7rIpBDUcb/XkhuHLWDXQ03+97fB3x9YLI2okD3r2S
	 HPCgjatYMjtheDZjcNcdfb0ovwqWLYID6SJiItQ5hHdosBPyzQu+0q22XcQRQSQf2U
	 eLJgUXlXN/GJ4hC7qdB/+r1WIhMzivLLpROrvZVK4l9zmfXg4vUNr52NSyNaflSfxH
	 IWi1qObk/KyCgFag1qhOLCbAfDg9qG9fpqr43BJZ1BVuMDaqNSMGxV/QXN4WurnKeb
	 WbUIkHsrJyX6oJglUotOv613pVuGwOqGxWJEGuTmse4PrMSECd5N48Q6sDIYv4Mx7Q
	 yGnD5jqHY7SvOTnMjx66crXncK/YzEShB29K2ufFDvG2dD4oLUrEPXpLJnpIInXQLG
	 slWqwnCEBlpA+3UyeBr96K/qgW+9Sgyvur6KlWDkiePTvgFW+wTZuUdMXk/gfiuJ5B
	 p0V4prTRwcpytpDCpY5UnegI=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so307318eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469735; x=1795074535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UTxjwsGyPSnDcBcDCP67400BSKT3Lhs5REZ8Ih/HPr8=;
        b=pHG7OPvDXMP9C+HmrqWyublxg2Y+6joNSiPUORTTt+akR5dNc1ixBAZoEYJeQTVJAp
         EDt/pf4r0k9tIeufKvQ0gHlsJJli8KIIWq11E93qXEzaA2y7mpjDXBUWdE3hyqkOMvPy
         xVmJBAmhQrI8RCg5iukraPPNaKK4SIwnZ1221GBJh/5sdKSpPjGpmmBlRyq6A9T3zE00
         Y+RYYbtdiacFkTKYEX5qEhhNvJOqDz6Kqkorlq/TZTh6xVouXFgA2eMwuKd7NL18L7m9
         Vq+dxlcLjjxtbhy1gqRtyVZIybA0/2iAA16TCB/i3MMyatmVKSpiHTHAiUj+8OyQ9Jtn
         Jc6g==
X-Forwarded-Encrypted: i=1; AL+hErGJzGBxL1ZO+sdxNdIJcIk/3ci5OkHXzrpLsxz403tevglGOxvNGW1Lgn2rNdxn6mVLT65Fx1myRSXhMKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sj+rL596nwA08ECZgZoTfS6J/CdRTEG7v/noc1dQJxXYF2uIc
	DUDV1zAj3PRgY3J4MSLK/+yGVzyCx2We3DFbf5U3VaRgw3kAw15j4gbGbZMusEiOqu4iJCHz/ki
	J8jvW6rU1CJDOswPKMQItX0AIfT+A/fS+Y3+K/xY3NVbbjBxKaHUVzZ5imY38/LGbaFCcJrc5Q1
	yYSa63rw==
X-Gm-Gg: AYBFou01Aqk68ROYOd2T0O4y1shxdrUuyKm2Mq2PC65D1fp8F5OYXfOntM9z+MyQRMP
	kfnV+unC0WSQuIpxwkUYQ5K1g7SlWIc0BRyIHL+0kY4q0uKLfuGLyrU69UKaGlMvVuFfBlIzGK6
	I9RSXrssHTgrQtzSeKc2W40huCJeHiGlmOg4QQmIomOPOH8SszhrbncvM/1vaIsHp7IsC52jjQP
	mO9XLs6j4tqSxbb18347SQgGI6QPKNn8me5dCRZygmyLXiB88fMF/2TStgxD5L+PQxa2wZxC6LR
	6hz7MJ8elKVzjoc39L7gdfuDPzQL8gmNJYwgrfYrNmgyLq8QWTbYdCU/eavv7POkVNSdNdYdp8M
	r1VmeqFR8ceuWJgBh22aeLIKS+dCwLmvliFrjMlvm3kPp1quwkSr+HymDqS5aeUtA+ZDbRpFfQM
	85IYInScCnU3Fv3WNfVTmlNiAFtC+Q8QearDKs9z453BhW86wycIASBXfJ7jXh/B7ut8SXjcdNd
	zrO7dnilqQI4IUVZeaEnzrV2nW3DeMuLqz/HgBXQsSyEv1tJ6XNZXfjbMsl4ae3C6fw9yGd/q+C
	878GE7WRufcWxKI=
X-Received: by 2002:a05:7300:d941:b0:372:1be6:110b with SMTP id 5a478bee46e88-376861826d1mr4459569eec.15.1794469734927;
        Wed, 11 Nov 2026 23:48:54 -0800 (PST)
X-Received: by 2002:a05:7300:d941:b0:372:1be6:110b with SMTP id 5a478bee46e88-376861826d1mr4459550eec.15.1794469734214;
        Wed, 11 Nov 2026 23:48:54 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm44595188eec.29.2026.11.11.23.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:48:53 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Thu, 12 Nov 2026 15:48:23 +0800
Message-ID: <20261112074823.853819-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
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

ThinkPads expose battery charge thresholds and charge_behaviour through
thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
charge_behaviour and charge_types on systems advertising those WMI
capabilities.

When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
duplicate charge_behaviour sysfs attribute and unregisters its battery
extension. Conversely, registering or updating any power_supply_ext on
the same battery runs sysfs_update_groups(), which removes standard
power-supply attributes not owned by power_supply_core and wipes out
thinkpad_acpi's charge_control_start_threshold,
charge_control_end_threshold, and charge_behaviour files.

Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
table check when the corresponding driver is enabled in Kconfig, and
update the force_load_psy_ext description accordingly.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
Changes in v2:
- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
  device IDs, method pairs, and driver configuration checks, as suggested
  by Derek J. Clark.
- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
  instead of relying only on ThinkPad ACPI device presence.
- Check whether the corresponding driver is enabled before looking up
  its ACPI device, including for ideapad_laptop.
- Update the force_load_psy_ext description to cover both drivers.

v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/

 drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..14b2c3f4cc7ae 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
 static bool force_load_psy_ext;
 module_param(force_load_psy_ext, bool, 0444);
 MODULE_PARM_DESC(force_load_psy_ext,
-	"This option will skip checking if the ideapad_laptop driver will conflict "
+	"This option will skip checking if the ideapad_laptop or thinkpad_acpi driver will conflict "
 	"with adding an extension to set the battery charge behavior and battery charge "
 	"control end threshold. It will also skip checking if the BIOS reports that "
-	"those features are fully supported. It is recommended to blacklist the ideapad "
+	"those features are fully supported. It is recommended to blacklist the conflicting "
 	"driver before using this option.");
 
 /* ======== HWMON (component: lenovo-wmi-capdata 00 & fan) ======== */
@@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
 	return AE_CTRL_TERMINATE;
 }
 
+struct lwmi_psy_deconflict {
+	const char *hid;
+	char * const *methods;
+	bool driver_enabled;
+};
+
+static char * const lwmi_ideapad_psy_methods[] = { "GBMD", "SBMC" };
+static char * const lwmi_thinkpad_psy_methods[] = { "BDSG", "BICG" };
+
+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
+	{ "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) },
+	{ "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI) },
+	{ "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI) },
+	{ "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI) },
+};
+
 /**
  * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
  * @priv: Pointer to the lwmi_om_priv drvdata.
  *
- * Checks if the ideapad_laptop driver is going to manage charge attributes first,
- * then if not, hooks the battery to our WMI methods if they are supported.
+ * Checks if the ideapad_laptop or thinkpad_acpi driver is going to manage
+ * charge attributes first, then if not, hooks the battery to our WMI methods
+ * if they are supported.
  */
 static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 {
-	static const char * const ideapad_hid = "VPC2004";
-	acpi_handle handle = NULL;
 	unsigned int props = 0;
 	int ret;
 
@@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
-	/* Deconflict ideapad_laptop driver */
-	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
-	if (ret)
-		return;
+	for (unsigned int i = 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i++) {
+		const struct lwmi_psy_deconflict *entry = &lwmi_psy_deconflict_list[i];
+		acpi_handle handle = NULL;
 
-	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
-		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
-		return;
+		if (!entry->driver_enabled)
+			continue;
+
+		ret = acpi_get_devices(entry->hid, lwmi_acpi_match, &handle, NULL);
+		if (ret || !handle)
+			continue;
+
+		if (acpi_has_method(handle, entry->methods[0]) &&
+		    acpi_has_method(handle, entry->methods[1])) {
+			dev_dbg(&priv->wdev->dev,
+				"ACPI device %s manages battery for device\n",
+				entry->hid);
+			return;
+		}
 	}
 
 load_psy_ext:
-- 
2.53.0

