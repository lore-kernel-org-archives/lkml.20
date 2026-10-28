Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178582;
	b=Yc45eLzD2bwBV5ZxGc1LVv7vYztGOiMI5BOhryKSbXBy1J3EXOQFxvJWW/SKM1EgO4zD
	 D8CUmT2sSIdlJd3JGbIW11/ROoSmGln/Y2W0BoiBVrvCAPgAia5sK2M/MVX6LXWMHJKKV
	 hoO4Xx6siKj3I27vdwBF5DILcpgiAzhknQ3fhd2bwP2LkqDzmA3BWAXvlQBXwCQ7ibPtW
	 vmOzsxrgQn500tWgGkKh0MZU+vG5E+yHNuO/W9eqMaI8GPX1uK3Q12CjlVzkIcEJmYlj0
	 ApsDEZM7jiRXpndF36g23foLTFxFTsG3s5mAqD76bK5vaWuZ1kfZIsWi3mWPDgr6A7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9x+PRrcVltVfpkTQNZRX5xz8D7o9ObLUDqYS0LHH94=;
	b=gnIviLXQr8S0QYjMj+MPKxUWjX1elSC+CLK017ZywnTeluQtD550KHcEIZVt/1MwZmJN
	 2mYhg0PA7tt0qngWl7Z314XViSk8kNg2twhLvcH0TwAgl7koVQsPCp7az6rw8azitGoBY
	 TYg8ZJq9uv8E29gA4sm7hf/a0uSLpgFhVDMZzIU+9+VomT0fF/ctjhWnxCbQI3hi/Q2ZU
	 5D1XCzfUzuKdsVe0q0jSwNp4xAw96CLblIPKSHKr6q02MklS+IYZGIqhE4HX1+GrdDe7g
	 HnDlUS3RtPoY15ByAPJSVYlu7l8N3n2Rboehibpbpc7ycubXlpQN/Vy61t6ar3YgtGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEO5pn2u;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PEO5pn2u
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so1311147a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793178580; x=1793783380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9x+PRrcVltVfpkTQNZRX5xz8D7o9ObLUDqYS0LHH94=;
        b=PEO5pn2uPA9gOG/y6Ey9SeHVi1T9q5E+QkzrEWhzMOV8D74Y9JwSuClSV7coLLPfFv
         H95dcrjfLYvgCwaOA03cScJrI8C7gD0fyq3E3i1yW9ETgYYSeB4n7DU1FJI9ENCHZaps
         GI+Fv2wuRN0YuKRRlenKtpiCOI/HFUqEb+mEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178580; x=1793783380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9x+PRrcVltVfpkTQNZRX5xz8D7o9ObLUDqYS0LHH94=;
        b=w9rS9rKuz9ikNqo3krzraYEo4DIhM1lKKbkHDA8O+shzs79Xi39ofb0BSnytP5zVlr
         rCwst9j65hxk8iVAnlPzk13wJhlB0cDxvogJGZ24LBU3VrsQa8zcPTIP/IDepgTdT358
         JUrLYNlB2a+1aqba0LYqlRD3uZCYGG/ZxL9OGm2FhZbHlPJcwR/F3am96nvDabauwc5k
         fAdxXPZ56D5mIGnYubwelBNbu55ZnrVVKLdZrOTvrwVPm1EiQlwe461xYzMuHfHuCukK
         upQoZYDkesyKUPbauQrudqn13+i9E/+I3S4ARMEfkFra/9bQhXcIvJOTRnS8Bus/fDta
         ia4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBIBJ77GW56cvVEFE0j4aAUm2fEOVWGiEPl3iveUK7t+86Xk4K5Ker1GHvRlh4TdsBmTyYDxktnbQPdGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ85G4P5MXUtXJD+0udoJGJvWxel9Gk0wYDbaNhuhousLNxHoeJ
	zY/iFp+KRuPlFXUTnmfUg2ljjssIn0KYs2Ya3Hbd8DlkGZanPbO2CkZww6LImCubgA==
X-Gm-Gg: AYBFou2809vGr/O1xnVrWNOE2AZWGXIe1pXKln/7ya+VNU+XLOtzn0LeEWV3Kn+wXu/
	c+0S1ZmLbJVo7naJk1YMg+NU3OVohJymmmEkm2cu+db8b8JF1nfth4iT5AIuBdL+/BZcSnWEQnt
	RpgGO7mJzx6kuStDqgxpa61wJUbSRIG2KV+uoGRz/ng0ujBIMw3DpgAiqz+dio3seN4ZWi+a4o4
	La4Z1zKkGY7HJBqNnsrDLtP2Hpqifd9w4u5fVI+mZy9y8tsO2y2TBA5LzlrCWyXtnXxfDeyVRfW
	Ab3lbBdKsHivtP8sKQPHYj89dxuksOHJqgtEWBbsY2ktb0oOUU3PVjStvtYFAUPhhr0J2yFydhD
	d52fRr2Qx7BL0KGN/PD5tkL3wX+hFSPCVTpEdJZeyNtaoQ1CrH2uO1Q5jN0aJ2qFPg3lJOccBjO
	rkt8/nplMT8cKtgS3vdHmG0t5FVMMdtNVO/7HuyVa2LPHpL30bRkHcnExtwCllqRKWmwelXFY55
	8qD0Qri56a5/BXoujNKVnkBAQ2/+ID8VPZOUO/lhSLyA9l2JoWGgQ7nGax7PhWD0cxPRPXGGTR2
	/u54e80w7arePKe8xyZhnqbWgO3CiNbJhOPfdzKpmwCLapqI7dT2HbP6535LV766gw5vE9h3
X-Received: by 2002:a05:6402:13d6:b0:6ac:934e:a9ca with SMTP id 4fb4d7f45d1cf-6b49cabef38mr1100021a12.0.1793178580047;
        Wed, 28 Oct 2026 02:09:40 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6b49640ebadsm1193994a12.18.2026.10.28.02.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:09:39 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Wed, 28 Oct 2026 09:09:31 +0000
Message-ID: <20261028090932.27053-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261028090932.27053-1-akuchynski@chromium.org>
References: <20261028090932.27053-1-akuchynski@chromium.org>
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
 drivers/platform/chrome/cros_ec_typec.c      | 40 +++++++++++++++++++-
 drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7b..89d29ef040879 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -27,6 +27,11 @@
 						BIT(DP_PIN_ASSIGN_D) | \
 						BIT(DP_PIN_ASSIGN_E)))
 
+/* Delay between mode entry/exit attempts, ms */
+#define MODE_SELECTION_DELAY	1000
+/* Timeout for a mode entry attempt, ms */
+#define MODE_SELECTION_TIMEOUT	4000
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
@@ -940,6 +952,32 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 		goto err_cleanup;
 	}
 
+	/*
+	 * Once all partner alt-modes are added, we should also trigger
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
+				dev_warn(typec->dev,
+					 "Unable to activate USB4 mode, port: %d\n", port_num);
+			}
+		}
+		if (!usb4_mode) {
+			ret = typec_mode_selection_start(port->partner,
+							 MODE_SELECTION_DELAY,
+							 MODE_SELECTION_TIMEOUT);
+			if (ret < 0)
+				dev_warn(typec->dev,
+					 "Unable to run mode selection, port: %d\n", port_num);
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
2.56.0.385.gac671c819a-goog

