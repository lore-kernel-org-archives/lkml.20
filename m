Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894354;
	b=TjbMMpy4HCK2NuIWw/EAcO/jiVEo2GACSJ46d75ljKb6yTOAqppt1mBYVjN/+F60cWxf
	 BvsDDMREHpyp3NE56hO6gVe8FFUG1WuQHBtKc4vxnMALOay77gA9nj1fHBfBX0DfGYVN8
	 bQL6jlEP2sKCFRsoqMiiZU3kXNafaQ0h2nE5pHdNl35g+Sd+0Zxt+Fs40PBPdVYgDh5Cs
	 EUK+GAT+/swz8HwHwE+4akdIhTDGBx0draO5PeF6RmEgH56wmWsYwUcT4U0/0xDmq4bAE
	 pPaVQhOfz+WPYMwttyoCl4jqBFt+37hHbBRvUIZVX+nIxX9TNboA9/bbF7CuNxJY1uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ElH8bN6JTjuLqWVWYbW1NkF46LhanKZAURkkBZLJQj4=;
	b=w0vccmd6WHf+lEXRqPT8EvaOQ+paUdBrbSsdboeXI92QEz/yvEVmtY7uRxbVqNJ63Roj
	 o/YCA7vbJTMwkLY9mHlpC+nzWRThWxpHAr7VW5Gp8VaPqGrvXLS9z+8gQUwWxmx0wBHol
	 kjSPDS2iE74eljPugP2EqIedNjKYJvj8TzVa7mGrsnakedz5j+NaMiTXL4vvhhq3tBYng
	 OXCp6kurc1W1GBB2mKALLRRK5N0/IWA0v9ggwoNavCCOg9OJgXxKZLVTpplDp3xk7IscS
	 yysPEgdfYt4Hh5AgnedQqqwLvqLRZ5f1sVQRi3FWLYB1Cxp3p0kQRyrBhG0xuvOdwJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gbIWPAZM;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D26606B45F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D26606B45F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gbIWPAZM
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso325464766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793894353; x=1794499153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElH8bN6JTjuLqWVWYbW1NkF46LhanKZAURkkBZLJQj4=;
        b=gbIWPAZM5LMNdRl9Uav5j60lGqtYptPyEwhqs5hzAHHimBZrGj2OPcbInI9pAo7SW4
         emIKI1e2Q00X8h8mgvdbJx8wxhWJnFlEITOUs6rSqBQ2eCU/FxaBdVSM7ddcKmonFLWv
         ANpCSL/0N1IZf7xZh703ypOeEgpmZ5uw7nBJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894353; x=1794499153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElH8bN6JTjuLqWVWYbW1NkF46LhanKZAURkkBZLJQj4=;
        b=eFnNMdtqEHxo2VB6pFpGMC0LT70mjjJYd3hdEQnEBxWsXe6iKAZQtF6cW91IPhk/kP
         8153qG3yRR0HjGdgOefe2bFkMHWDmyl98+u4yUGRcq8CQjoraAiWabZvy49N4Ew5Ejkz
         onm4n/8U5snyaVkOW6Cvuo4SN/xBYdYZjyyHdP+p+/R56v800cev5hohJyAGZqY4N+7N
         YuSHsyjBAvJjuiOd1PZ/gYvTGmMhS/302bK4OkhkIyqUVcl4BtIYlycjxKZUvSOVbbpG
         abZcoPebBRlJVUDbRbTQrOznShfqPdDnQ6cXHGb2yy9u1VklLQCRAHWONojO2LLNHUiJ
         I1jA==
X-Forwarded-Encrypted: i=1; AKwUvBz/Ap5SW6ATGB7aGY4BwCrGdbqxoOE1npexxi6yGVGfmN+rd4Yz9MDvRQ+ssldt+Sb1+XCEbAXvj1UZdsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q0aGjY1KvjfZeShJsIb1QgGTKQAZBduS9Lv6nQNA3TRq+ckRy
	hD8JxjosEBIXkp9cM3HrtOsFAwfLwsvlBXipuV8QXHVwpMQ2+1Rq86UmqlXcYPlRZg==
X-Gm-Gg: AYBFou103yg/Cmt4Ih9m1Bh3A7l0fCTBMwixwU6JHqnb7ccJBzHekamUqGIM2wxdG4L
	3JZ8hK6vKpEVsq8GjUCJmJrb/srVMRIOY2bKOMhNwBHSZQQ60CZjupBlfoM8Oq21mcrYOqhcA4m
	X0Jm3QIWbUVMTIkdKrmSYGi40dgcFUsocgQpE7NsROd7F8NfziEI0jJlL78fu/ekaMlrVBdkMZP
	aFXxo0jow+GlPAWEz1sBF3Pbe3QrgtE3n3WaDd7mJeaMHK1m13MBQOaGakTwBpPgDz0YO/sm43l
	noC31k8vjqG/yPTUti0G8ooiiwox5uPkejqEbse/CRYLS1uCp7jRukIoQd7B8pmtDbay6FYzg80
	XA/RMQClw3MTwDqsWd4L+tcovZPcOeBNE9VMkNWuZkcnCkDkXSeMboUrSvPvQjZ2KDy/cKx5Hzs
	7WpqXHV17dmHuc6wxiUjRvdKgU4mcB67/UxlDLRbPCO2refEyXYM8fLCgKks3O5mo2m8Gt3+FWz
	g46mjSaYISp4ZqRo7jPlMVp2XxZoCvuLiF/soyBsjXQcFMBFM9xkUAwP5g8ZFlS83jZ9nE4Bawm
	9/E8prcunRHkw340Gm5pa7bVKfgfP5DU0306MJb5l0OOK7AiJGPlccscFuluJ+POdBHxPIGZ
X-Received: by 2002:a17:907:7707:b0:c4d:2888:f373 with SMTP id a640c23a62f3a-c4d2888fc8cmr120685666b.41.1793894352761;
        Thu, 05 Nov 2026 07:59:12 -0800 (PST)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c4d0e4693d7sm189182366b.60.2026.11.05.07.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:12 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 1/2] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Thu,  5 Nov 2026 15:59:05 +0000
Message-ID: <20261105155906.2670094-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105155906.2670094-1-akuchynski@chromium.org>
References: <20261105155906.2670094-1-akuchynski@chromium.org>
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
 drivers/platform/chrome/cros_ec_typec.c | 42 ++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 5871fe031f14d..aeb3de4f09934 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -39,6 +39,11 @@
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
@@ -363,6 +368,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	if (!port->partner)
 		return;
 
+	typec_mode_selection_delete(port->partner);
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	typec_partner_set_usb_power_delivery(port->partner, NULL);
@@ -459,7 +465,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
-		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
@@ -780,6 +785,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	enum typec_orientation orientation;
 	struct cros_typec_altmode_node *node;
 	int ret;
+	u16 active_svid = 0;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
 			  &req, sizeof(req), &resp, sizeof(resp));
@@ -818,10 +824,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		if (!ret)
+			typec_partner_set_usb_mode(port->partner, USB_MODE_USB4);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_TBT_SID;
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_DP_SID;
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
@@ -837,6 +847,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	if (port->partner)
+		typec_altmode_state_update(port->partner, active_svid, ret);
+
 	/* Iterate all partner alt-modes and set the active alternate mode. */
 	list_for_each_entry(node, &port->partner_mode_list, list) {
 		typec_altmode_update_active(
@@ -946,6 +959,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			desc.svid = sop_disc->svids[i].svid;
 			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
+			desc.mode_selection = typec->ap_driven_altmode;
 
 			if (is_partner)
 				amode = typec_partner_register_altmode(port->partner, &desc);
@@ -986,6 +1000,32 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
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
-- 
2.56.0.398.g882cbad275-goog

