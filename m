Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6DA426697;
	Fri, 11 Sep 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121920; cv=none; b=WUaIwEFI12vgHVZHYzr3p54U++8/H/xoIbgZCBLAcRw5A7pkizSH4NJO0VCRDOxiWWFjOUgvRox46j9EEAayFpbH562tNVEUVoArWGOIReP3MHXhneWzqaEkGJJCBTDMtSU2uMOBXEfZrvfp6MZz0eQxlPGyBb7brVUSEo3cq0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121920; c=relaxed/simple;
	bh=zEN+Tlxtey5v+y9a+kQZs5q9CFva50G1DDtURICKYSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzN71uIGrPzAjv/nz6gIiQLpOTiR8+gBegY4fxxrNgcaI3ey+h6W5hOyNX/zR1eMiLRBeEQ37IKnd4GhaYLDCktIDG5YSkSmqF2kG4dfpYNwIIr0Ww6pIlkw9sMbrGIU+JnllvAP32qw0NZzcJPe9sFtVexk7S19YEH1kYGdBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=gBc+E6zr; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="gBc+E6zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vqwU2csTHS0N+MHmJUX0kCytmGs4GMAAcZapWYnZC9g=;
  b=gBc+E6zrGcpDnnEmXx0JOEnwRFmH5ZmhhoVDtTKV4FLgm9vIWksO0xWc
   bo9sJONMFRWaF8ZxvhGx7NnK2wSYGZZg2t1xJkxSd29uQQDoIijbAPaRU
   0IZG+FBmv7T/Cv4VcGoPlG3I548sgrcfudJkbn+FqxCrij1uGDOPXHuoM
   LtUCEOLHoRK3NAsLG+29vX+uMD1gW1fp+l5rBp5vdhKqZk254YId7iHsG
   MocjybjQN197sW5NGqrm2xZpy7DRLLzyIOqW8YyY5Ce/a2X8ER2MQc9cy
   +PkZkMbeILUZZAIzefzQe92/78lrptAB+KzGNg/R5ji6ABCxv1tBXZzai
   w==;
X-CSE-ConnectionGUID: XmHgJjstSS6xEvtVYcmDiQ==
X-CSE-MsgGUID: iooRoSlPR0GawMfz2hFYwg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 11 Sep 2026 18:17:21 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68BAHGws037147;
	Fri, 11 Sep 2026 18:17:16 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id 7EE6D2D5C;
	Fri, 11 Sep 2026 18:17:16 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Fri, 11 Sep 2026 18:17:58 +0800
Subject: [PATCH 2/2] usb: typec: ucsi: itepd: Add DisplayPort alternate
 mode support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ucsi-itepd-it527x-v1-2-14c8041afb53@ite.com.tw>
References: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
In-Reply-To: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 68BAHGws037147

Add support for the ITE IT5271 series controllers and for DisplayPort
alternate mode. The driver retrieves the current alternate mode from
the PPM, configures the Type-C mux and retimer accordingly, and reports
HPD state and HPD IRQ events through the DRM auxiliary HPD bridge.

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
 drivers/usb/typec/ucsi/Kconfig      |  10 +-
 drivers/usb/typec/ucsi/ucsi_itepd.c | 405 +++++++++++++++++++++++++++++++++++-
 2 files changed, 402 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 0f10dac9b34b..309ee82a166c 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -105,13 +105,17 @@ config UCSI_HUAWEI_GAOKUN
 	  called ucsi_huawei_gaokun.
 
 config UCSI_ITEPD
-	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
+	tristate "UCSI Interface Driver for ITE IT885x and IT527x series"
 	depends on I2C
+	depends on DRM || !DRM
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  This driver enables UCSI support on platforms that expose an
-	  ITE IT8851/IT8853 Type-C Power Delivery controller over an I2C interface.
+	  ITE IT8851 or IT5271 series Type-C Power Delivery controller
+	  over an I2C interface. It also supports DisplayPort alternate
+	  mode, including HPD notification through the DRM bridge.
 
 	  To compile the driver as a module, choose M here: the module
 	  will be called ucsi_itepd.
-
 endif
+
diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
index 50a9eae656ab..8f7f40677767 100644
--- a/drivers/usb/typec/ucsi/ucsi_itepd.c
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -3,14 +3,24 @@
  * Copyright (C) 2025-2026, ITE. All Rights Reserved
  *
  */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitmap.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
+
+#include <drm/bridge/aux-bridge.h>
 
 #include "ucsi.h"
 
@@ -29,6 +39,35 @@
 #define ITEPD_EVENT_NONE	0
 #define ITEPD_EVENT_UCSI	1
 #define ITEPD_EVENT_VDM		2
+#define ITEPD_EVENT_OTHER	3
+
+#define ITEPD_CONSTAT_ORIENTATION_OFFSET	86
+
+#define ITEPD_CAM_CS_INDEX(_i_)			((u64)(_i_) << 24)
+#define ITEPD_CAM_CS_LEN			10
+#define ITEPD_CAM_CS_STATUS_OFFSET		1
+#define ITEPD_CAM_CS_CONF_OFFSET		6
+
+#define ITEPD_CAM_NONE				0xff
+
+#define ITEPD_ATTENTION_VDO_LEN			11
+#define ITEPD_ATTENTION_NUM_VDOS_OFFSET		2
+#define ITEPD_ATTENTION_NUM_VDOS_MASK		GENMASK(2, 0)
+#define ITEPD_ATTENTION_VDO_OFFSET		7
+
+struct itepd;
+
+struct itepd_port {
+	struct itepd *itepd;
+	unsigned int index;
+	struct typec_mux *typec_mux;
+	struct typec_retimer *typec_retimer;
+	struct auxiliary_device *bridge;
+	struct typec_mux_state state;
+	struct typec_altmode dp_alt;
+	unsigned long mode;
+	bool hpd_state;
+};
 
 struct itepd {
 	struct i2c_client *client;
@@ -38,6 +77,9 @@ struct itepd {
 	struct mutex received_lock;	/* Protects cci and msg_in */
 	u8 msg_in[ITEPD_MSG_IN_MAX_LEN];
 	u32 cci;
+
+	struct itepd_port *ports;
+	unsigned int num_ports;
 };
 
 static u8 ucsi_itepd_get_len(u32 cci)
@@ -115,25 +157,26 @@ static int itepd_process_event(struct itepd *itepd, u32 *cci)
 {
 	u8 msg_in[ITEPD_MSG_IN_MAX_LEN] = {};
 	__le32 le_cci;
-	u8 event, ack;
+	u8 raw, event, ack;
 	u8 len = 0;
 	int err = 0;
 	int ret;
 
 	guard(mutex)(&itepd->event_lock);
 
-	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, sizeof(event));
+	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &raw, sizeof(raw));
 	if (ret)
 		return ret;
 
-	event &= ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
-	if (!event) {
+	if (!raw) {
 		mutex_lock(&itepd->received_lock);
 		*cci = itepd->cci;
 		mutex_unlock(&itepd->received_lock);
 		return ITEPD_EVENT_NONE;
 	}
 
+	event = raw & (ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT);
+
 	if (event & ITEPD_ALERT_UCSI_EVENT) {
 		err = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci,
 				     sizeof(le_cci));
@@ -148,7 +191,7 @@ static int itepd_process_event(struct itepd *itepd, u32 *cci)
 		}
 	}
 
-	ack = event;
+	ack = raw;
 	ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &ack, sizeof(ack));
 	if (ret)
 		return ret;
@@ -169,7 +212,8 @@ static int itepd_process_event(struct itepd *itepd, u32 *cci)
 	*cci = itepd->cci;
 	mutex_unlock(&itepd->received_lock);
 
-	return ITEPD_EVENT_VDM;
+	return event & ITEPD_ALERT_VDM_EVENT ? ITEPD_EVENT_VDM :
+					       ITEPD_EVENT_OTHER;
 }
 
 static int ucsi_itepd_read_version(struct ucsi *ucsi, u16 *version)
@@ -220,18 +264,233 @@ static int ucsi_itepd_read_message_in(struct ucsi *ucsi, void *val, size_t val_l
 static int ucsi_itepd_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct itepd *itepd = ucsi_get_drvdata(ucsi);
-	__le64 le_cmd = cpu_to_le64(command);
+	__le64 le_cmd;
 
-	if (UCSI_COMMAND(command) == UCSI_PPM_RESET) {
+	switch (UCSI_COMMAND(command)) {
+	case UCSI_PPM_RESET:
 		mutex_lock(&itepd->received_lock);
 		itepd->cci = 0;
 		mutex_unlock(&itepd->received_lock);
+		break;
+	case UCSI_SET_NOTIFICATION_ENABLE:
+		command |= UCSI_ENABLE_NTFY_ATTENTION;
+		break;
+	default:
+		break;
 	}
 
+	le_cmd = cpu_to_le64(command);
+
 	return itepd_write_reg(itepd, ITEPD_UCSI_CONTROL_REG, &le_cmd,
 			       sizeof(le_cmd));
 }
 
+static void itepd_port_set_state(struct itepd_port *port, unsigned long mode,
+				 struct typec_displayport_data *dp_data)
+{
+	struct device *dev = &port->itepd->client->dev;
+	struct typec_retimer_state retimer_state = {};
+	int ret;
+
+	if (!dp_data && mode == port->mode)
+		return;
+
+	port->dp_alt.active = !!dp_data;
+
+	port->state.alt = dp_data ? &port->dp_alt : NULL;
+	port->state.mode = mode;
+	port->state.data = dp_data;
+
+	retimer_state.alt = port->state.alt;
+	retimer_state.mode = mode;
+	retimer_state.data = dp_data;
+
+	ret = typec_retimer_set(port->typec_retimer, &retimer_state);
+	if (ret)
+		dev_err(dev, "port%u: failed to set retimer to mode %lu: %d\n",
+			port->index, mode, ret);
+
+	ret = typec_mux_set(port->typec_mux, &port->state);
+	if (ret)
+		dev_err(dev, "port%u: failed to set mux to mode %lu: %d\n",
+			port->index, mode, ret);
+
+	port->mode = mode;
+
+	port->state.data = NULL;
+}
+
+static void itepd_port_notify_hpd(struct itepd_port *port, bool hpd_state,
+				  bool hpd_irq)
+{
+	if (!port->bridge)
+		return;
+
+	if (hpd_state == port->hpd_state && !hpd_irq)
+		return;
+
+	port->hpd_state = hpd_state;
+
+	drm_aux_hpd_bridge_notify(&port->bridge->dev,
+				  hpd_state ? connector_status_connected :
+					      connector_status_disconnected);
+}
+
+static void itepd_set_orientation(struct ucsi_connector *con)
+{
+	if (con->ucsi->version >= UCSI_VERSION_2_0)
+		return;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
+	if (bitmap_read(con->status, ITEPD_CONSTAT_ORIENTATION_OFFSET, 1) ==
+	    UCSI_CONSTAT_ORIENTATION_REVERSE)
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_REVERSE);
+	else
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NORMAL);
+}
+
+static int itepd_get_dp_cam(struct itepd *itepd, struct ucsi_connector *con)
+{
+	struct ucsi_altmode alt[2] = {};
+	u64 cmd;
+	u8 cam;
+	int ret;
+
+	cmd = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(itepd->ucsi, cmd, &cam, sizeof(cam));
+	if (ret < 0)
+		return ret;
+
+	if (cam == ITEPD_CAM_NONE)
+		return -ENODEV;
+
+	cmd = UCSI_GET_ALTERNATE_MODES;
+	cmd |= UCSI_GET_ALTMODE_RECIPIENT(UCSI_RECIPIENT_CON);
+	cmd |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
+	cmd |= UCSI_GET_ALTMODE_OFFSET(cam);
+	ret = ucsi_send_command(itepd->ucsi, cmd, alt, sizeof(alt));
+	if (ret < 0) {
+		dev_dbg(&itepd->client->dev, "con%d: cannot verify CAM %u: %d\n",
+			con->num, cam, ret);
+		return cam;
+	}
+
+	if (alt[0].svid != USB_TYPEC_DP_SID)
+		return -ENODEV;
+
+	return cam;
+}
+
+static int itepd_get_attention_status(struct itepd *itepd,
+				      struct ucsi_connector *con, u32 *status)
+{
+	u8 data[ITEPD_ATTENTION_VDO_LEN] = {};
+	u64 cmd;
+	int ret;
+
+	cmd = UCSI_GET_ATTENTION_VDO | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(itepd->ucsi, cmd, data, sizeof(data));
+	if (ret < 0)
+		return ret;
+
+	if (!(data[ITEPD_ATTENTION_NUM_VDOS_OFFSET] &
+	      ITEPD_ATTENTION_NUM_VDOS_MASK))
+		return -ENODATA;
+
+	*status = get_unaligned_le32(data + ITEPD_ATTENTION_VDO_OFFSET);
+
+	return 0;
+}
+
+static void itepd_handle_dp_altmode(struct itepd *itepd,
+				    struct itepd_port *port,
+				    struct ucsi_connector *con)
+{
+	struct typec_displayport_data dp_data = {};
+	u8 data[ITEPD_CAM_CS_LEN] = {};
+	unsigned long mode;
+	u32 status;
+	u8 pin_assign;
+	u64 cmd;
+	int cam;
+	int ret;
+
+	cam = itepd_get_dp_cam(itepd, con);
+	if (cam < 0) {
+		/* Partner is in some other alternate mode, keep USB alive */
+		itepd_port_set_state(port, TYPEC_STATE_USB, NULL);
+		itepd_port_notify_hpd(port, false, false);
+		return;
+	}
+
+	cmd = UCSI_GET_CAM_CS | UCSI_CONNECTOR_NUMBER(con->num) |
+	      ITEPD_CAM_CS_INDEX(cam);
+	ret = ucsi_send_command(itepd->ucsi, cmd, data, sizeof(data));
+	if (ret < 0) {
+		dev_err(&itepd->client->dev, "con%d: GET_CAM_CS failed: %d\n",
+			con->num, ret);
+		return;
+	}
+
+	dp_data.status = get_unaligned_le32(data + ITEPD_CAM_CS_STATUS_OFFSET);
+	dp_data.conf = get_unaligned_le32(data + ITEPD_CAM_CS_CONF_OFFSET);
+
+	pin_assign = DP_CONF_GET_PIN_ASSIGN(dp_data.conf);
+	if (pin_assign)
+		mode = TYPEC_MODAL_STATE(get_count_order(pin_assign));
+	else
+		mode = TYPEC_STATE_SAFE;
+
+	itepd_port_set_state(port, mode, &dp_data);
+
+	if (!itepd_get_attention_status(itepd, con, &status))
+		dp_data.status = status;
+
+	itepd_port_notify_hpd(port, !!(dp_data.status & DP_STATUS_HPD_STATE),
+			      !!(dp_data.status & DP_STATUS_IRQ_HPD));
+}
+
+static void ucsi_itepd_update_connector(struct ucsi_connector *con)
+{
+	struct itepd *itepd = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num < 1 || con->num > itepd->num_ports)
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void ucsi_itepd_connector_status(struct ucsi_connector *con)
+{
+	struct itepd *itepd = ucsi_get_drvdata(con->ucsi);
+	struct itepd_port *port;
+
+	if (con->num < 1 || con->num > itepd->num_ports)
+		return;
+
+	port = &itepd->ports[con->num - 1];
+
+	itepd_set_orientation(con);
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		itepd_port_set_state(port, TYPEC_STATE_SAFE, NULL);
+		itepd_port_notify_hpd(port, false, false);
+		return;
+	}
+
+	if (!UCSI_CONSTAT(con, PARTNER_FLAG_ALT_MODE)) {
+		itepd_port_set_state(port, TYPEC_STATE_USB, NULL);
+		itepd_port_notify_hpd(port, false, false);
+		return;
+	}
+
+	itepd_handle_dp_altmode(itepd, port, con);
+}
+
 static const struct ucsi_operations ucsi_itepd_ops = {
 	.read_version		= ucsi_itepd_read_version,
 	.read_cci		= ucsi_itepd_read_cci,
@@ -239,6 +498,8 @@ static const struct ucsi_operations ucsi_itepd_ops = {
 	.read_message_in	= ucsi_itepd_read_message_in,
 	.sync_control		= ucsi_sync_control_common,
 	.async_control		= ucsi_itepd_async_control,
+	.update_connector	= ucsi_itepd_update_connector,
+	.connector_status	= ucsi_itepd_connector_status,
 };
 
 static irqreturn_t itepd_irq_process(struct itepd *itepd)
@@ -256,6 +517,9 @@ static irqreturn_t itepd_irq_process(struct itepd *itepd)
 	if (ret == ITEPD_EVENT_UCSI)
 		ucsi_notify_common(itepd->ucsi, cci);
 
+	if (ret == ITEPD_EVENT_VDM)
+		dev_dbg(&itepd->client->dev, "VDM event\n");
+
 	return IRQ_HANDLED;
 }
 
@@ -266,6 +530,117 @@ static irqreturn_t itepd_irq_thread_fn(int irq, void *data)
 	return itepd_irq_process(itepd);
 }
 
+static void itepd_put_mux(void *data)
+{
+	typec_mux_put(data);
+}
+
+static void itepd_put_retimer(void *data)
+{
+	typec_retimer_put(data);
+}
+
+static int itepd_ports_init(struct itepd *itepd)
+{
+	struct device *dev = &itepd->client->dev;
+	struct itepd_port *port;
+	unsigned int count, idx = 0;
+	u32 reg;
+	int ret;
+
+	count = device_get_child_node_count(dev);
+	if (!count)
+		return 0;
+
+	itepd->ports = devm_kcalloc(dev, count, sizeof(*itepd->ports),
+				    GFP_KERNEL);
+	if (!itepd->ports)
+		return -ENOMEM;
+
+	device_for_each_child_node_scoped(dev, fwnode) {
+		ret = fwnode_property_read_u32(fwnode, "reg", &reg);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: missing reg property\n",
+					     fwnode);
+
+		if (reg != idx)
+			return dev_err_probe(dev, -EINVAL,
+					     "%pfwP: reg is %u, expected %u\n",
+					     fwnode, reg, idx);
+
+		port = &itepd->ports[idx];
+		port->itepd = itepd;
+		port->index = idx;
+		port->mode = TYPEC_STATE_SAFE;
+		port->state.mode = TYPEC_STATE_SAFE;
+		port->dp_alt.svid = USB_TYPEC_DP_SID;
+		port->dp_alt.mode = USB_TYPEC_DP_MODE;
+
+		port->typec_mux = fwnode_typec_mux_get(fwnode);
+		if (IS_ERR(port->typec_mux))
+			return dev_err_probe(dev, PTR_ERR(port->typec_mux),
+					     "port%u: failed to get mode-switch\n",
+					     idx);
+
+		if (port->typec_mux) {
+			ret = devm_add_action_or_reset(dev, itepd_put_mux,
+						       port->typec_mux);
+			if (ret)
+				return ret;
+		}
+
+		port->typec_retimer = fwnode_typec_retimer_get(fwnode);
+		if (IS_ERR(port->typec_retimer))
+			return dev_err_probe(dev, PTR_ERR(port->typec_retimer),
+					     "port%u: failed to get retimer-switch\n",
+					     idx);
+
+		if (port->typec_retimer) {
+			ret = devm_add_action_or_reset(dev, itepd_put_retimer,
+						       port->typec_retimer);
+			if (ret)
+				return ret;
+		}
+
+		if (is_of_node(fwnode)) {
+			struct device_node *np = to_of_node(fwnode);
+
+			port->bridge = devm_drm_dp_hpd_bridge_alloc(dev, np);
+			if (IS_ERR(port->bridge))
+				return dev_err_probe(dev, PTR_ERR(port->bridge),
+						     "port%u: failed to allocate HPD bridge\n",
+						     idx);
+		}
+
+		idx++;
+	}
+
+	itepd->num_ports = idx;
+
+	return 0;
+}
+
+static int itepd_bridges_add(struct itepd *itepd)
+{
+	struct device *dev = &itepd->client->dev;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < itepd->num_ports; i++) {
+		if (!itepd->ports[i].bridge)
+			continue;
+
+		ret = devm_drm_dp_hpd_bridge_add(dev, itepd->ports[i].bridge);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "port%u: failed to add HPD bridge\n",
+					     i);
+	}
+
+	return 0;
+}
+
 static int itepd_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -286,6 +661,10 @@ static int itepd_probe(struct i2c_client *client)
 	mutex_init(&itepd->received_lock);
 	i2c_set_clientdata(client, itepd);
 
+	ret = itepd_ports_init(itepd);
+	if (ret)
+		return ret;
+
 	itepd->ucsi = ucsi_create(dev, &ucsi_itepd_ops);
 	if (IS_ERR(itepd->ucsi))
 		return dev_err_probe(dev, PTR_ERR(itepd->ucsi),
@@ -310,8 +689,14 @@ static int itepd_probe(struct i2c_client *client)
 		goto out_free_irq;
 	}
 
+	ret = itepd_bridges_add(itepd);
+	if (ret)
+		goto out_ucsi_unregister;
+
 	return 0;
 
+out_ucsi_unregister:
+	ucsi_unregister(itepd->ucsi);
 out_free_irq:
 	free_irq(client->irq, itepd);
 out_ucsi_destroy:
@@ -330,6 +715,7 @@ static void itepd_remove(struct i2c_client *client)
 
 static const struct of_device_id itepd_of_match_table[] = {
 	{ .compatible = "ite,it8851" },
+	{ .compatible = "ite,it5271" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, itepd_of_match_table);
@@ -352,6 +738,5 @@ static struct i2c_driver itepd_driver = {
 module_i2c_driver(itepd_driver);
 
 MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
-MODULE_AUTHOR("Amber Kao <amber.kao@ite.com.tw>");
-MODULE_DESCRIPTION("UCSI driver for ITE IT8851 and IT8853 Type-C PD controllers");
+MODULE_DESCRIPTION("UCSI driver for ITE IT8851 and IT5271 Type-C PD controllers");
 MODULE_LICENSE("GPL");

-- 
2.53.0

