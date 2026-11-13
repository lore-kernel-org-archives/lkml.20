Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549464;
	b=tbWLXb/a/V4i+XrYRyws2NFJ9MaVeGeIBvRYbhztoglg6OGvQsRC/cqXFLz9dOhXoBfb
	 oF+jKKxpaLqL3Xqi5//ObS6LLpyVOIj/R0mpXAKozQA3iiyMoWC4z9ll1NTZH5t67/lbv
	 iucovnWYDt4NyFEtqb7JadPHKL3BXFo9tBFRYoVKN09i/a6NhgOE3gL9EvET7RMyfdoKr
	 APDvk25YaC4NJpCDI8qprAo1FuivNiazU1u9JaUgxFsO00U72yqL7wMrI+eOiGnSSHEHu
	 c3fFCo/XmkVemua26cx26Cds1GwTmbIM0mWytEisUVfBL9Fhaz+Mavtm/kLhGQjRNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SZhpgh6Yq01P39/1qSrQzNSaVxZcNgrejNPHx6b5Ek0=;
	b=Op2DQ1th5eX/leSucQU6HB1f5yLTFisdw30Stzjt1y/eO+sgNbZITz040EJTEJWSZD4G
	 PdKsnr5BVXvXSiDL41pKENkw6abwjn6djz6p7dtJb1Q0OAzAnxiMc5rxxM1czdQUt4/SE
	 p+MQBhSuhEnXvCgn9XnUD/xHYJIOltzXgzhpg4vCprLdSc6Dx7hmSfzfJI6PUCu8tickM
	 qIRFOyoYiCrlqvV523bS99VEVymWrpLpMjyNS447zjWMsMpRaBtz0euxugI53jwdMpBCx
	 PrSYF4Yyx16zoKPqljA+AIqfEKaXPos8ZJMHV6efDDrr8Rxx6k3FgHLPWDKydkoay/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=DHK9g3r4;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16058606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16058606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=DHK9g3r4
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 424DC4105A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794549461;
	bh=SZhpgh6Yq01P39/1qSrQzNSaVxZcNgrejNPHx6b5Ek0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DHK9g3r4ddk1k9N0M6ToMb+990a/BtpM8f66rMTPl60gOK3uzpBahVd+q8Eey6quW
	 FcusPpKKTxtqJsndm3oEzoxjdADD2r0kUxlYCpUfJSiTnOQLv8DwAH4Nc4N2WZLNOl
	 km7KT4HTJIWzX7gvSiTKYCYtB8UTcB33DVj5EoCqB8fyg7KBwoaeTmIil1xklWxC5F
	 q5mlsIrw8EqNdBRfT0xko4AsVQUWoQ63tnJMThnXV2Qcad0LFuCNMWQxXAjXMGr1R1
	 y+YkHAH2rcU5TViI3NQSiYXFnDyDxmCo8E9N22/NLkr6Vkf6lGddbJ9U6R25EWBXFI
	 bxYFFVIIyaiJuntbsEN6VhNo1Xc/qThW3eRy4MMJaaV2fpP+zYgJVNq7z9GtN5CxvO
	 SEkBDyOSO/fcw6X+/DC4twgKqYpT5fZJ+0NFtCztkEgo1bYlyi/KgKdINg/m0zkxwJ
	 caGSpyPGiUZpscaJVFZ3qoorwMQznG9IEt969/0ec1/9XJ5aL0LMhSJ8jBwWrLpdcJ
	 RFrRBeUM3IFHwg8QR8E+LzacyRy8f9EpOtMkZAVdJHVbEu28qWgMFQYbCs6DU49SYk
	 dXvbxompLP4zj2biK88edgnL3HwkjmrH9Gg0Zx3ODl0ZUcMbOryJXr0ksI/jK2dJ1C
	 uPUA9Hu8VzOdrJr2Ghvq0uMc=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b09a466295so435554a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549459; x=1795154259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZhpgh6Yq01P39/1qSrQzNSaVxZcNgrejNPHx6b5Ek0=;
        b=XH3JW9C0tLrSno3DUZXqLfsPmd7Xct1YgLSpElPablxaoAanfxG70burs2Jkr2XBlS
         UvDhFuYcxoHDyjc4Wfj1fmb07oQ47PEY6z1AdVLJrjCBrylG2Qmm57yt3IUKrehiLxrk
         q3jpxeH0R3q2egyoJQwP7uPNanzN1gNhO6DJRml5K+xLz9v6Q2EPsKoVVJ/zForDQ+oE
         6EQXxsPC/FGkV+W6WIvIrwNewvEJJ6UT+u1j66aPKfjJWdJQctdIM454dF/z6ybKY9rc
         EGZzeNP3cTbtUm/ucN/Pxn6BC9yqJNo/xx2NN68HVBXsXdAfROxGBZxSMHTvC6px3Jh+
         r1Yg==
X-Forwarded-Encrypted: i=1; AL+hErFjQ8NO/dUEapOIU2qrApvAawfstmiejh9+92fkVWJoQ+Zy99ki90l/4dRsUczlHrznwHrsZv2gArQzmF4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+sRBv3LUWQZVa7xY45uQrDcB4JuY7Xv2Vsb4AYfNuquymAF1F
	PRpUZNeKhovefwUwtiKmPzZwW0wf9dxySrsR/MDhlPO23sx3rYV232pUWQexxIuAS7rMq5M04XW
	hZ/4ccYPhusG4z2tSDeYYLWqxTwhnWkwAdjIbfKVktK1dqp71zVDpvFXTmxI/LXFaE8tu55Udrc
	ESVBtLbQ==
X-Gm-Gg: AYBFou3j0HSg/Yl+0Gl9TFTWkdbQFzxciHYpXafoPL00O4Dghoj4EGgXVebSXefSYPH
	gKpZluBqNEz4ZuT6DQVoko/Ts4sV6tT5DoUI8MrQcxSJsDzXwusegMQL5ORHIHya/v+MuvQdnrt
	5Xh+Pj/3RkhLCysSm5FyMTcjMEYd92+ki0U13kz08nYwsofNes6ECZIsM6EUDpYOUEvDp6YnrBt
	1lhRmA/TkFzsCLEDIs6kJvvX2I+0Q8l/CkGIpYzl0SW+OCH4ocexp8iogLMGKkS7UK2kmn1J9Dk
	WUFs3GBgbOFhRVUD4Aoe9XBfuafv0MB/xFgRdPa/Ne5DDlfPQ+mY5yimHMGAcOrsFmq6fj5J7or
	rKMtHcV1PsKKFDcG262cL56IIb0rwaT3k482RsR3o0GkWAQXONDb2U/r9z+DteE9t15sKyJzQ1f
	qFTPfTkmyUPIKkmdsOeUj0S6qWDyhbBxmh8gNDKIPbmLZ0HTCiVKgjlXDVJKhGqRRabBgjDAKvX
	yyptcqVddIi/+/SXOgvgHA6ZfugaqpWJGsuPBhJyaTkT4VxKYge79QGVpHSPThYEpbWv2tSgMLG
	P6DIFiav4YI1PA==
X-Received: by 2002:a17:90b:2251:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3b1b0a408bamr1337229a91.22.1794549459291;
        Thu, 12 Nov 2026 21:57:39 -0800 (PST)
X-Received: by 2002:a17:90b:2251:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3b1b0a408bamr1337206a91.22.1794549458569;
        Thu, 12 Nov 2026 21:57:38 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm756324a91.3.2026.11.12.21.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:57:38 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Fri, 13 Nov 2026 13:57:26 +0800
Message-ID: <20261113055726.952551-1-aaron.ma@canonical.com>
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
per-driver table guarded by IS_ENABLED() in Kconfig, and update the
force_load_psy_ext description accordingly.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Co-developed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
Changes in v3:
- Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
  driver_enabled, as suggested by Rong Zhang.
- Group deconfliction entries per driver (HIDs list + methods list).

Changes in v2:
- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
  device IDs, method pairs, and driver configuration checks, as suggested
  by Derek J. Clark.
- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
  instead of relying only on ThinkPad ACPI device presence.
- Check whether the corresponding driver is enabled before looking up
  its ACPI device, including for ideapad_laptop.
- Update the force_load_psy_ext description to cover both drivers.

v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-aaron.ma@canonical.com/
v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/

 drivers/platform/x86/lenovo/wmi-other.c | 66 ++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..340159df5f7cc 100644
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
@@ -905,17 +905,41 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
 	return AE_CTRL_TERMINATE;
 }
 
+struct lwmi_psy_deconflict {
+	char * const *hids;
+	char * const *methods;
+};
+
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_ACPI)
+#define LWMI_PSY_DECONFLICT_STRS(...) \
+	((char * const[]) { __VA_ARGS__, NULL })
+#endif
+
+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
+	{
+		.hids = LWMI_PSY_DECONFLICT_STRS("VPC2004"),
+		.methods = LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
+	},
+#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.hids = LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", "IBM0068"),
+		.methods = LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
+	},
+#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
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
 
@@ -928,14 +952,30 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
-	/* Deconflict ideapad_laptop driver */
-	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
-	if (ret)
-		return;
+	for (unsigned int i = 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i++) {
+		const struct lwmi_psy_deconflict *entry = &lwmi_psy_deconflict_list[i];
 
-	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
-		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
-		return;
+		for (unsigned int j = 0; entry->hids[j]; j++) {
+			const char *hid = entry->hids[j];
+			acpi_handle handle = NULL;
+			bool has_methods = true;
+
+			ret = acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
+			if (ret || !handle)
+				continue;
+
+			for (unsigned int k = 0; entry->methods[k]; k++) {
+				has_methods = acpi_has_method(handle, entry->methods[k]);
+				if (!has_methods)
+					break;
+			}
+			if (!has_methods)
+				continue;
+
+			dev_dbg(&priv->wdev->dev, "ACPI device %s manages battery for device\n",
+				hid);
+			return;
+		}
 	}
 
 load_psy_ext:
-- 
2.53.0

