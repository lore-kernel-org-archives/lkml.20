Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE94A4EE2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466866; cv=none; b=qyPWwjZI16vl+AChb9r38t+iHSpNXMDlHhP8z0z8IH4lcHUFKAt2LDOSq32BXm60J+Zv/Ap2Txtqp1dCkT4n2prPd2lLvU8RrQvYxhUYlfc7wWVa2yATjcCeNjbZXaPr6Ij32zrTkUg73bpWLXGaEGr2hWUmLqwNOsEtRhujFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466866; c=relaxed/simple;
	bh=OkmbdjllVJ09hxRLCcdjDYmv3ytvVrVwErt1QzjeAuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfsnoBAhNqFNb0EnZwHxJyV8O2br5X35sWIq1+EEk1ls2oYVX0jTGDuKBCA6gy3UqhpZf+NYQd98p3W3F7M4h5K8ei4r4cskqkh+r7Ep5X0mrsrd9gW1pyfAJGPs+992IaquMyLbrSAvhjn3y7ICyvP2pV22X0oDoeVm66wGuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SMjsqGHv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SMjsqGHv"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so729483866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791466863; x=1792071663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYmZqPJ22KPbrJa3Ej6igDX2C7LId5rL2UWN0e7yKE=;
        b=SMjsqGHv59B0gOhGJ6EgZ9WC3cdeXyO/iMS2DktfeVZow5ErQxO8hr0SzdB3ogMPBa
         YAfIVSZl5DVQ6Fw5EPFtGslLNsE+OM1QD9smd24BzDAC7iqclhFQ1FQy5fap34+dZMVL
         CNZg3ZpdM+st9cR2VwNu+PLS7k5noN04Wi66s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466863; x=1792071663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYmZqPJ22KPbrJa3Ej6igDX2C7LId5rL2UWN0e7yKE=;
        b=IrkRiKKVVMwNyb0dZnvaqZeF7BVcm3mnwx1ks+pkzLGGvy2rZ5g9T2smh7UDwFwQtS
         cnLEPk7UCXq+liNCwUa8daL2pNV7sPgTWA7F2UKPCXMvkrYWSpomRkX0UFx7c4vt4KCd
         l+vMvQmYaUuz4mVOfGyApRhuSmr4Eo8L34/wDZhb4Pweksub68utjAXu9MF0RGZLqBkI
         JAe/Dasm7a7V2BLIo5VlplcKrhWhKErr5hc0XBhJCujAq9JPiykBgEHET9NjnM269Gg1
         DUXdQkcZPSsnk7H4dQdp+uzPloanAUbdNVdy57VTgLb5PsW0sEpoE1niee325H/ZjnYb
         6uQg==
X-Forwarded-Encrypted: i=1; AKwUvBzHcMOiyE9kLZP8/wAAs9XpPvBXsCuAcb3hBQI+qEGTki6TVV7PeZGkrr8SCS0LykXBQq7bSoj/5u6Lam0=@vger.kernel.org
X-Gm-Message-State: AFuF++nwSFDam/OE39/DXWZo5tQv2yQs5dBYQtkR7KO8/p5q7r841KHs
	N+RDHKBmTApFiYXX3Tw/X76nRs4lqanFfPRTT1cQuVbaEqxxFxTKrpXYeR0DnBkGSQ==
X-Gm-Gg: AYBFou3eTBN/KF2/7ljmdLOYrhTFIxMR3MSNQRq19R+e3HN4m5/5iGM8VUWrlXzqUXK
	CRIxzMxs/rrEtZG1zcAOCLfcmCzdIXTOCDQ0WPtH3oaXnxuh4pvl1EO9dmnq5s7xQXG7glKiNI6
	S8pVnLDI/LVMyc+EQm4L3g3+/W5JKWsyNDQWEdxbUD3WuOafEizXTl0yr0fBNl9sqDmkKvU1u0h
	UsTowp0yj/NltSpb7E1/9PcsXDuB1dMpivCyewlX/TcF/XvYgI4eOb9Fp0ub4a9X7sZ3l5KoNvf
	YaNBkJ2cE3Z+adLVt9Oudta/hlfyny9RG9RYs8uObTTXNOieTYhY0h4KyLg4XfxPdPCHcIP6ggw
	dAuwZLW931/gZ9sCMyKxCXTgfVCKKoE+la6TgM0q3oHNbPMbyeevDVdOPd/KwNZ0xvvRvMMNrtm
	cN/d0u51peClvZXWmPMr2ShSxVoDDCMwFGJ5LPTT6nzTXg13wlgVxfWJLQlzpbyfd8ws5o3Feo/
	YfbeJv9MC/IDsgHWiGGijisiQA//rte0W9rWnLDGw==
X-Received: by 2002:a17:907:9618:b0:c31:6929:b25a with SMTP id a640c23a62f3a-c317c171f72mr531431266b.46.1791466862884;
        Thu, 08 Oct 2026 06:41:02 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c31a100e771sm452566b.83.2026.10.08.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:41:02 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Thu,  8 Oct 2026 13:40:55 +0000
Message-ID: <20261008134056.3816556-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261008134056.3816556-1-akuchynski@chromium.org>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver sets mode_selection bit for each Alternate mode, thereby
preventing individual altmode drivers from activating their respective
modes.
Once the registration of all Alternate Modes is complete, the driver
verifies if USB4 mode is supported by both the port and the partner and
activates USB4 mode. In cases where USB4 is not supported, the driver
invokes typec_mode_selection_start to initiate the mode selection process
based on mode priorities.
The driver communicates the current Type-C mode to the mode selection
process via typec_altmode_state_update.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      | 39 +++++++++++++++++++-
 drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7b..718d06fa24132 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -27,6 +27,11 @@
 						BIT(DP_PIN_ASSIGN_D) | \
 						BIT(DP_PIN_ASSIGN_E)))
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 {
 #ifdef CONFIG_ACPI
@@ -325,6 +330,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	if (!port->partner)
 		return;
 
+	typec_mode_selection_delete(port->partner);
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	typec_partner_set_usb_power_delivery(port->partner, NULL);
@@ -421,7 +427,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
-		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
@@ -742,6 +747,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	enum typec_orientation orientation;
 	struct cros_typec_altmode_node *node;
 	int ret;
+	u16 active_svid = 0;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
 			  &req, sizeof(req), &resp, sizeof(resp));
@@ -782,8 +788,10 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_TBT_SID;
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_DP_SID;
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
@@ -799,6 +807,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	if (port->partner)
+		typec_altmode_state_update(port->partner, active_svid, ret);
+
 	/* Iterate all partner alt-modes and set the active alternate mode. */
 	list_for_each_entry(node, &port->partner_mode_list, list) {
 		typec_altmode_update_active(
@@ -900,6 +911,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			desc.svid = sop_disc->svids[i].svid;
 			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
+			desc.mode_selection = typec->ap_driven_altmode;
 
 			if (is_partner)
 				amode = typec_partner_register_altmode(port->partner, &desc);
@@ -940,6 +952,31 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 		goto err_cleanup;
 	}
 
+	/* Once all partner alt-modes are added, we should also trigger
+	 * mode selection.
+	 */
+	if (is_partner && typec->ap_driven_altmode) {
+		bool usb4_mode = (port->caps.usb_capability & USB_CAPABILITY_USB4) &&
+			(PD_VDO_UFP_DEVCAP(port->p_identity.vdo[0]) & DEV_USB4_CAPABLE);
+
+		if (usb4_mode) {
+			ret = cros_typec_enter_usb_mode(port->port, USB_MODE_USB4);
+			if (ret < 0) {
+				usb4_mode = false;
+				dev_err(typec->dev,
+					"Unable to activate USB4 mode, port: %d\n", port_num);
+			}
+		}
+		if (!usb4_mode) {
+			ret = typec_mode_selection_start(port->partner,
+							 mode_selection_delay,
+							 mode_selection_timeout);
+			if (ret < 0)
+				dev_err(typec->dev,
+					"Unable to run mode selection, port: %d\n", port_num);
+		}
+	}
+
 	return 0;
 
 err_cleanup:
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 66c546bf89b53..116329dd113f8 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
 		container_of(work, struct cros_typec_altmode_data, work);
+	int ret;
 
 	mutex_lock(&data->lock);
 
-	if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
-			      data->vdo_size))
+	ret = typec_altmode_vdm(data->alt, data->header, data->vdo_data,
+				data->vdo_size);
+	if (ret) {
 		dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);
+		typec_altmode_state_update(data->port->partner, data->sid, ret);
+	}
 
 	data->header = 0;
 	data->vdo_data = NULL;
-- 
2.56.0.360.g66cac248cb-goog

