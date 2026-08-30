Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE73033E3;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121184; cv=none; b=WTpQpIZEnRwT7DUw1/as6+vX0BqljP/qNyigkGUZNWq5m2C9Ax8i3bf1mPKS3sO4V3aJmeJhP4IKEmpM32WIAF/mzG+wEVaVN1FFsZBDUxQCGYn/7QkGW7wfE7QSCcEnmlUK90QbUnReU1yp1WzSsYJsI8tICpu3eDIsmSJHYJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121184; c=relaxed/simple;
	bh=q5r1Np3eUnTrcGkauW7sWKDIVR3AiUTcYWTLnTecjRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZOyfRNS0YlfGfnB06oMh85ZB7opDUd+alCUOQII/umAiJJfQYTnei+kU2BclKBB2fnTW+0pho8S5GfBoQ22wZ6T8gUkTG1IcbISXY46Q7rHn37JGbMC32NxB+r5aTiwBhINf8YQmRoFaDSEpThIpEN/DjphwE/5OjESs0HBCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/0hoQqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/0hoQqM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E69C6C2BD00;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=q5r1Np3eUnTrcGkauW7sWKDIVR3AiUTcYWTLnTecjRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A/0hoQqMWvuDHEBCBUQfEehc/0HPvx1YdDvn1Pe3wJRJgr7IIIkd7pyXIz7rpHf8+
	 HhjqeA3tpxGqsRgMomY0JCexiuhPocIx7rgHQuF/MBhjTs4VI2521K/c/YsuawJ3s1
	 OTYsuQyvvrwvwJiA4bZOSRXSPu+lhRwhcPwIsjmBZtn5VmSHPwrAnxO1ZaS3f/mMnQ
	 1/QzEawK0X+QnWQd1OVekrA/VmIY6L65lcTtWX2SA9pN+Yxv+CExUIYuFVTgLGY0vr
	 Sci12T4FnhBwU0Bsaoghsw1IHx8NM6kmyi00WXRvBQkodioPzIvf9plYnNIMJCP5sO
	 zQs6CxL2ioo2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8542C61DE1;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:21 +0200
Subject: [PATCH 03/19] usb: typec: tipd: Hook up Thunderbolt switch for
 CD321x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-3-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5456; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=q5r1Np3eUnTrcGkauW7sWKDIVR3AiUTcYWTLnTecjRk=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCcEvz8Zqf/RaeGPtVz3fzT37LhzIDzx/7okus8bvZ
 rM/a9itO0pZGMS4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQAT2S3B8Jvt8rrFP/3YZKd6
 zJme18FY+uiBcf2mqjmJdQFubg+UuxYwMnQV3U8OTAtjz5IzcoqU3JwielmIabrcoY+/DJOy1y4
 qZwQA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Look up the Thunderbolt switch for CD321x ports and forward cable details
whenever a Thunderbolt or USB4 connection comes up or goes away.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 522f56742aa9..5016f9dba956 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -216,6 +216,8 @@ struct cd321x {
 	struct typec_mux *mux;
 	struct typec_mux_state state;
 
+	struct typec_thunderbolt_switch *tbt_switch;
+
 	struct cd321x_status update_status;
 	struct delayed_work update_work;
 	struct usb_pd_identity cur_partner_identity;
@@ -677,6 +679,9 @@ static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
 static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status *st)
 {
 	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+	struct typec_thunderbolt_switch_data tbt_switch_data = {
+		.state = TYPEC_THUNDERBOLT_SWITCH_OFF,
+	};
 
 	if (!(st->data_status & TPS_DATA_STATUS_DATA_CONNECTION)) {
 		if (cd321x->state.mode == TYPEC_STATE_SAFE)
@@ -684,6 +689,7 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.alt = NULL;
 		cd321x->state.mode = TYPEC_STATE_SAFE;
 		cd321x->state.data = NULL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		typec_mux_set(cd321x->mux, &cd321x->state);
 	} else if (st->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
 		struct typec_displayport_data dp_data;
@@ -723,6 +729,7 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.alt = cd321x->port_altmode_dp;
 		cd321x->state.data = &dp_data;
 		cd321x->state.mode = mode;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		typec_mux_set(cd321x->mux, &cd321x->state);
 	} else if (st->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
 		struct typec_thunderbolt_data tbt_data;
@@ -738,6 +745,13 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.mode = TYPEC_TBT_MODE;
 		cd321x->state.data = &tbt_data;
 		typec_mux_set(cd321x->mux, &cd321x->state);
+
+		tbt_switch_data.state = TYPEC_THUNDERBOLT_SWITCH_TBT;
+		tbt_switch_data.tbt = tbt_data;
+		tbt_switch_data.orientation = TPS_STATUS_TO_UPSIDE_DOWN(st->status) ?
+						      TYPEC_ORIENTATION_REVERSE :
+						      TYPEC_ORIENTATION_NORMAL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 	} else if (st->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
 		struct enter_usb_data eusb_data;
 
@@ -752,12 +766,20 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.data = &eusb_data;
 		cd321x->state.mode = TYPEC_MODE_USB4;
 		typec_mux_set(cd321x->mux, &cd321x->state);
+
+		tbt_switch_data.state = TYPEC_THUNDERBOLT_SWITCH_USB4;
+		tbt_switch_data.usb4 = eusb_data;
+		tbt_switch_data.orientation = TPS_STATUS_TO_UPSIDE_DOWN(st->status) ?
+						      TYPEC_ORIENTATION_REVERSE :
+						      TYPEC_ORIENTATION_NORMAL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 	} else {
 		if (cd321x->state.alt == NULL && cd321x->state.mode == TYPEC_STATE_USB)
 			return;
 		cd321x->state.alt = NULL;
 		cd321x->state.mode = TYPEC_STATE_USB;
 		cd321x->state.data = NULL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		typec_mux_set(cd321x->mux, &cd321x->state);
 	}
 
@@ -771,6 +793,9 @@ static void cd321x_update_work(struct work_struct *work)
 					    struct cd321x, update_work);
 	struct tps6598x *tps = &cd321x->tps;
 	struct cd321x_status st;
+	struct typec_thunderbolt_switch_data tbt_switch_data = {
+		.state = TYPEC_THUNDERBOLT_SWITCH_OFF,
+	};
 
 	guard(mutex)(&tps->lock);
 
@@ -821,6 +846,7 @@ static void cd321x_update_work(struct work_struct *work)
 
 	/* If there was a disconnection, set PHY to off */
 	if (!new_connected || was_disconnected) {
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		cd321x->state.alt = NULL;
 		cd321x->state.mode = TYPEC_STATE_SAFE;
 		cd321x->state.data = NULL;
@@ -1328,6 +1354,12 @@ cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 		goto err_unregister_altmodes;
 	}
 
+	cd321x->tbt_switch = fwnode_typec_thunderbolt_switch_get(fwnode);
+	if (IS_ERR(cd321x->tbt_switch)) {
+		ret = PTR_ERR(cd321x->tbt_switch);
+		goto err_unregister_mux;
+	}
+
 	cd321x->state.alt = NULL;
 	cd321x->state.mode = TYPEC_STATE_SAFE;
 	cd321x->state.data = NULL;
@@ -1335,6 +1367,9 @@ cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 
 	return 0;
 
+err_unregister_mux:
+	typec_mux_put(cd321x->mux);
+	cd321x->mux = NULL;
 err_unregister_altmodes:
 	typec_unregister_altmode(cd321x->port_altmode_dp);
 	typec_unregister_altmode(cd321x->port_altmode_tbt);
@@ -1356,6 +1391,8 @@ cd321x_unregister_port(struct tps6598x *tps)
 {
 	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
 
+	typec_thunderbolt_switch_put(cd321x->tbt_switch);
+	cd321x->tbt_switch = NULL;
 	typec_mux_put(cd321x->mux);
 	cd321x->mux = NULL;
 	typec_unregister_altmode(cd321x->port_altmode_dp);

-- 
2.55.0


