Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A243B3E3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971276; cv=none; b=E3yfR6dNKg3QK/Lz4GFoT4i8qXWUN+Gjg8p+7q7Q6QvIYA+Mg+e4HUJCLJFVC8fqLLR/YXSlPAhehFh1EdKG6M8pKFPTLtDeSakU/mSC2sQIEX9050F5b5X5L2WTknJnH7OEaPFIwIk4eaMwMi9CyVWOCe2pCkAaEPbFKxun49Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971276; c=relaxed/simple;
	bh=xYd3Pn7xwPntUxM1xr+2z/L7TOcW6nT3FOYomMjm6fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aT+dW38Zo5mPXkdHJ1G5/QowQMRP7qVjmrl3DcX9+4g7WFIW72bmzEsMyq8Tz0iwUc7xLBQUjApBn1ytRkgLFmiHBqdoE9AwUbuBonJWe2HkBdgE1yGgaKV2q/HXoe+UmpJwAUj7APeaXisuJNs6lxGse2pd7xmG2fM66MaTK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6FO3Zm5; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6FO3Zm5"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfc58ed04so338975085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790971274; x=1791576074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWKhQl8VCZeFEKO2nQY2AimaMpesWlwedfHQWqbVEAg=;
        b=d6FO3Zm54hmkaE24RErO3yyMa2UvmMn4zW7nQufxu1h0zqK6X1ByFkb90T0k5RnGnL
         u5RCZIhYhcLdueW2rfAMplku2Lxc7rSsoNLGHFfXGhjOjKSsBnlFo21bkY3Q0Ad/N3N2
         59j/A9YYsQ+Mg2XqQPGYuA4eqjvx+ha9aqKLN0FlTt8s2QmxdA3Da8vyFQIYjtMmliQv
         WtCm+NG0xGGAsK3CXP81A6lRMR+qIp63uuHmGFUcnrAv94+LekO9HR4ldZaeA03+zmKA
         z8woCCcKKteiLeOswJmf1CgnNq6BIWx/SNsxyC6NLg1hXLzI41xwFWRM7oXDqOzL3ZZ2
         HWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971274; x=1791576074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWKhQl8VCZeFEKO2nQY2AimaMpesWlwedfHQWqbVEAg=;
        b=xBKoTlsEXc6Ni4BTbrXlAS6lh5GV7lKZG/Y1EJeMU/uPFJqupADV2471v8DXtpkagU
         U7UoHollr5NT/Zqmq2usIGEpYvZd74gK9x7B0bVd3yciEOqKYoG69VaCb8w23EeZMN9S
         C2CmXsREIIDFfJV4A1mPGxszDJP5Yw06rXyIgJSBmNQbCLDeRGECLMlGz4MNuRtWxEA5
         7r786u3qP47yL+uLX5ucA6dySPXOThzRNbV1pDhJxrVjMe6YFgH0xIZWfdsB4IxCZjNn
         4IT3YsEKupVn8+wFibCHNMapTcU8bfEyxmSOrOyhD3e6OS6GCLOGs5CDS2tlhl4rZWif
         4+yg==
X-Forwarded-Encrypted: i=1; AKwUvBywfx65my67cQtp8H6pZ6fa/JTtR4+Ir54jmDoHpFmtf2G7XDbuBBE27RKnqnY7Cih/kFpVQN/xpMefj8g=@vger.kernel.org
X-Gm-Message-State: AFuF++nLgbLFV0MoMQ6wmjarchJqScFg3mA+Zq24syGL1to5pTsgY1OJ
	TnWxiS54tCMmSbjNzGJcfG1WWD54+ULpmbylrjAYPmTU6x0FI1xeihg=
X-Gm-Gg: AYBFou3jvE1e12GlTuTu1QAfdv116CDd8nVZxeAdnkI26TSRAtalr0ApYX52CJpzIuS
	DYhxtZnq7l60KbR/MABq5Ke8bwupD/RsOA07IK/7K6awWzn+FsvIxfa/INOTTJyr+Vvm7hNZr8L
	2r3hTjMr93QPhO0SP3E5PcPOTokjObHbgA3V6CH3AMMuM2d0IlqZVhfe5W/Xep3hvvLsmoeLzC/
	+Gb+0Vvx6BcFskfW/DPoEzyih4I4qqmWuICAt7Fskoboxqn0f3xE8ub/ADpzcZV/+DNNHqF/HBT
	m+gTaLcMwcOPHcUYun3nk8jJLYveliGECG3+X3Oy73K9c7+bWTGT7DsTeebPI+ZNZSA94YhidKc
	ADy8I1WR65XWDItIA1Xm1PQADBPDjYdnwZDE2kHOR/L1/KS6pD7l34T8MrjaXzhHAhDvqRig1dT
	qBMH8K60qJ4k9G4MHWjmh1CJNnbPLe2lIWtW4d8EWAYJUzA8YQr/akFRjezFqhsde1CYjzqpypS
	2fVELSnoebHbaJWNoZ/zMTudxdAdlU/90BVAjJw8hqTkqaTssaVyzDkKfSgZVxwlMJcOcTbgbXM
	yG1fWMcbBOebl5xgpThGwnDZJxzP
X-Received: by 2002:a05:620a:688e:b0:93c:58bb:7214 with SMTP id af79cd13be357-93cf19db19fmr657960985a.31.1790971272471;
        Fri, 02 Oct 2026 13:01:12 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca21d8fcsm309147885a.26.2026.10.02.13.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:01:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mhun512@gmail.com,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: Stop altmode work during partner removal
Date: Fri,  2 Oct 2026 16:01:08 -0400
Message-ID: <20261002200108.399258-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DisplayPort and Thunderbolt port altmodes queue work to deliver VDM
responses. Partner removal and port teardown do not drain this work,
allowing it to race with partner driver removal or access freed port
altmode data.

Disable and drain port altmode work in the common partner cleanup path.
Partner drivers can still queue responses during removal, so keep the
work disabled until they are gone. Clear pending response and DP status
state, then re-enable it for the next connection. Cancel the work before
unregistering port altmodes during final teardown.

Allocate list nodes before registering altmodes so allocation failures
also use the common cleanup path.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Quiesce port work in cros_typec_unregister_altmodes() before removing
  partner altmodes, covering disconnects and discovery cleanup.
- Re-enable work after resetting pending response and DP status state so
  port altmodes remain usable after reconnecting a partner.
- Cancel work in cros_typec_unregister_port_altmodes() during final port
  teardown, following the review suggestion to use cancel_work_sync().
- Allocate list bookkeeping before registering an altmode so allocation
  failures use the common guarded cleanup path.
- Drop the v1 Reviewed-by tag due to the reworked cleanup paths.

Previous version:
https://lore.kernel.org/all/20260917204209.97699-1-mhun512@gmail.com/

Validation: apply checks, whitespace checks and static source review.
No build or runtime testing was performed for this revision.

Remaining review point: an in-flight port active sysfs callback may still
queue work after the final cancel_work_sync(), before the port altmode
is unregistered. Please confirm whether that ordering needs additional
synchronization.

 drivers/platform/chrome/cros_ec_typec.c      | 27 ++++++++----
 drivers/platform/chrome/cros_typec_altmode.c | 46 ++++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  9 ++++
 3 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 50a68819ceb7bbfbd888ca919d678d4c75237c26..2d6cbb7f51445fde4b4e8339081e921a9a143a92 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -282,11 +282,19 @@ static void cros_typec_unregister_altmodes(struct cros_typec_data *typec, int po
 	struct list_head *head;
 
 	head = is_partner ? &port->partner_mode_list : &port->plug_mode_list;
+	/* Partner drivers can queue port work until their removal completes. */
+	if (is_partner)
+		cros_typec_altmodes_set_enabled(port, false);
+
 	list_for_each_entry_safe(node, tmp, head, list) {
 		list_del(&node->list);
 		typec_unregister_altmode(node->amode);
 		devm_kfree(typec->dev, node);
 	}
+
+	/* Port altmodes are reused when a partner reconnects. */
+	if (is_partner)
+		cros_typec_altmodes_set_enabled(port, true);
 }
 
 /*
@@ -366,8 +374,10 @@ static void cros_typec_unregister_port_altmodes(struct cros_typec_port *port)
 {
 	int i;
 
-	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++)
+	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++) {
+		cros_typec_altmode_cancel(port->port_altmode[i]);
 		typec_unregister_altmode(port->port_altmode[i]);
+	}
 }
 
 static void cros_unregister_ports(struct cros_typec_data *typec)
@@ -901,24 +911,23 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			desc.mode = j + 1;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
 
+			node = devm_kzalloc(typec->dev, sizeof(*node), GFP_KERNEL);
+			if (!node) {
+				ret = -ENOMEM;
+				goto err_cleanup;
+			}
+
 			if (is_partner)
 				amode = typec_partner_register_altmode(port->partner, &desc);
 			else
 				amode = typec_plug_register_altmode(port->plug, &desc);
 
 			if (IS_ERR(amode)) {
+				devm_kfree(typec->dev, node);
 				ret = PTR_ERR(amode);
 				goto err_cleanup;
 			}
 
-			/* If no memory is available we should unregister and exit. */
-			node = devm_kzalloc(typec->dev, sizeof(*node), GFP_KERNEL);
-			if (!node) {
-				ret = -ENOMEM;
-				typec_unregister_altmode(amode);
-				goto err_cleanup;
-			}
-
 			node->amode = amode;
 
 			if (is_partner)
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 66c546bf89b532d3bae1de322a1cfb1205e0190f..4b255cabac60a406ea359788604a6bf21d87e08d 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -37,6 +37,52 @@ struct cros_typec_dp_data {
 	bool pending_status_update;
 };
 
+void cros_typec_altmode_cancel(struct typec_altmode *alt)
+{
+	struct cros_typec_altmode_data *adata;
+
+	if (!alt)
+		return;
+
+	adata = typec_altmode_get_drvdata(alt);
+	if (adata)
+		cancel_work_sync(&adata->work);
+}
+
+void cros_typec_altmodes_set_enabled(struct cros_typec_port *port, bool enabled)
+{
+	struct cros_typec_altmode_data *adata;
+	struct cros_typec_dp_data *dp_data;
+	int i;
+
+	for (i = 0; i < CROS_EC_ALTMODE_MAX; i++) {
+		if (!port->port_altmode[i])
+			continue;
+
+		adata = typec_altmode_get_drvdata(port->port_altmode[i]);
+		if (!adata)
+			continue;
+
+		if (!enabled) {
+			disable_work_sync(&adata->work);
+			continue;
+		}
+
+		mutex_lock(&adata->lock);
+		adata->header = 0;
+		adata->vdo_data = NULL;
+		adata->vdo_size = 0;
+		if (adata->sid == USB_TYPEC_DP_SID) {
+			dp_data = container_of(adata, struct cros_typec_dp_data, adata);
+			dp_data->configured = false;
+			dp_data->pending_status_update = false;
+		}
+		mutex_unlock(&adata->lock);
+
+		enable_work(&adata->work);
+	}
+}
+
 static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065af709643ad653df487a9987780da4..bcfd8fed2073dad1e95bfba807e1af7a4dbe91e2 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -11,6 +11,15 @@ struct typec_altmode;
 struct typec_altmode_desc;
 struct typec_displayport_data;
 
+#if IS_ENABLED(CONFIG_CROS_EC_TYPEC_ALTMODES)
+void cros_typec_altmode_cancel(struct typec_altmode *alt);
+void cros_typec_altmodes_set_enabled(struct cros_typec_port *port, bool enabled);
+#else
+static inline void cros_typec_altmode_cancel(struct typec_altmode *alt) {}
+static inline void
+cros_typec_altmodes_set_enabled(struct cros_typec_port *port, bool enabled) {}
+#endif
+
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
 cros_typec_register_displayport(struct cros_typec_port *port,
-- 
2.53.0
