Received: from ironport.ite.com.tw (itemail.ite.com.tw [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA2B4C33DE;
	Thu,  1 Oct 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850519; cv=none; b=fhLGNLn2CqD9Es/pYCT3W5u5e3dCQsqV7DMW/ik765TdOr/B3mhxdp99GoNUYDg2n925ssPEnxzN4ua7mw8VWaRIQNyBnqN8eV1HNYeX6wslf+VCPd/FZHjN2T6XkToiElPGov+DaJk10U3ZQE+vl0eyy/0gZvEA3Zcq1NNMDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850519; c=relaxed/simple;
	bh=e7TvL/9BbCJywLrK+4Ot7ZuHRLYJl2mnHvniSwTJCio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VypByDkeI00Yf0y+ZcNpmgSOcNVPiN7mlWJgeNEpj5rv6qv9vghRIpXFWK2yhpV5Uvz6pHL9FdUwPemf2E7mkKW9kctebM9YQN5HSsiZ9uky0/hyR2K57lX5I+JAJBokw5IGdEP7WV6hEQ3gsOxZeYhFhi0kd0HO8spJX9hrzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=DNUvRoQF; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="DNUvRoQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=YKRKR5Px+KL1qhDkv/LX+z0yQHFZLr3qaONQ/sWb8eI=;
  b=DNUvRoQFim6TOs9RogsKuagIiQiRA9vn71dj0qrhHBBDcaJWKLq5Onyf
   BC8GbBxd0UyRA5zT4kcLC4TMfcXowt/LbG+giKsH/9+KVqX/aX90EMrHG
   U/0FuyxyJ7VF6ioBGQW0+cMbMCwOVjQChZp6laz63D8AeyehCrllAO7hg
   AURg23ruNvbI8fUQ/w49YXUuwRlfY9OA6GnDLJ0SX2JIWXrFj+OW9Q+h2
   9mNd8N80fFydpFPCfr87/7C5jXp3moZyKJpFKwoZrKefR7mO4PXL+2i7b
   Hc2QhqxCWcAx0z8vBhydcsJzv9bzC+ynLn0J9ga2EekSKX3P8auK/+5IU
   g==;
X-CSE-ConnectionGUID: eW+YiQRuQ+Kp7WKlLL47nQ==
X-CSE-MsgGUID: tDUF0Y3eQiatpuvEt1RESQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 01 Oct 2026 18:27:16 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 691ARB8F070545;
	Thu, 1 Oct 2026 18:27:11 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id 29DDD2D58;
	Thu,  1 Oct 2026 18:27:10 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Thu, 01 Oct 2026 18:27:51 +0800
Subject: [PATCH] usb: typec: ucsi: itepd: Add DisplayPort alternate mode
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-ucsi-itepd-display-v1-1-f3de9baa2467@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NWw6CMBQFt0Lut01aGqh0K4aPPq56jUFsC4EQ9
 m61Jvo5yTkzG0QMhBF0tUHAmSI9hgziUIG7muGCjHxmqHnd8k5yNrlIjBKOnnmK492szHZKcWy
 F9MZBPo4Bz7R8pKe+cJzsDV16m76LgM8p11KZ/WK6Kikh/lOUmlotrLFHZVphlLBWzxL6fX8BC
 IWJ/MIAAAA=
X-Change-ID: 20260930-ucsi-itepd-display-b9770e613dac
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 691ARB8F070545

Add support for DisplayPort alternate mode on the IT885x and IT527x
series controllers.

The connectors are described as child nodes of the controller in the
device tree. For each connector, the driver gets the Type-C mux and
retimer and allocates a DRM auxiliary HPD bridge.

On a connector status change, the driver reads the current alternate
mode from the PPM with GET_CURRENT_CAM and checks that it is
DisplayPort with GET_ALTERNATE_MODES. The DisplayPort status and
configuration are then read with GET_CAM_CS, and the pin assignment is
used to configure the mux and retimer. The HPD state and HPD IRQ are
taken from the latest Attention VDO, read with GET_ATTENTION_VDO, and
reported through the HPD bridge.

To get notified about Attention messages, enable the Attention
notification whenever the UCSI core sends SET_NOTIFICATION_ENABLE.
All pending vendor interrupt bits are now acknowledged instead of only
the UCSI and VDM events, so that no event is left pending.

PPMs implementing UCSI versions older than 2.0 report the cable
orientation at a vendor-specific offset in the connector status, so
set the orientation from there.

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
This patch adds DisplayPort alternate mode support to the ITE UCSI
driver.

It was previously posted as patch 2/2 of the IT527x/IT885x support
series [1]. As requested by Heikki, it has been split out, and the
Kconfig prompt, help text and MODULE_DESCRIPTION updates for
IT885x/IT527x have been moved into that series.

This patch depends on the IT527x/IT885x support series v3 [2], which
has been reviewed but not yet applied.

[1] https://lore.kernel.org/r/20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw
[2] https://lore.kernel.org/r/20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw
---
 drivers/usb/typec/ucsi/Kconfig      |   5 +-
 drivers/usb/typec/ucsi/ucsi_itepd.c | 427 +++++++++++++++++++++++++++++++++++-
 2 files changed, 423 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 5e32ff20ebb5..c5eaf4967e4e 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -107,10 +107,13 @@ config UCSI_HUAWEI_GAOKUN
 config UCSI_ITEPD
 	tristate "UCSI Interface Driver for ITE IT885x and IT527x series"
 	depends on I2C
+	depends on DRM || !DRM
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  This driver enables UCSI support on platforms that expose an
 	  ITE IT885x or IT527x series Type-C Power Delivery controller
-	  over an I2C interface.
+	  over an I2C interface. It also supports DisplayPort alternate
+	  mode, including HPD notification through the DRM bridge.
 
 	  To compile the driver as a module, choose M here: the module
 	  will be called ucsi_itepd.
diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
index 5b39ba286db7..25dbe59ab770 100644
--- a/drivers/usb/typec/ucsi/ucsi_itepd.c
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -3,14 +3,24 @@
  * Copyright (C) 2025-2026, ITE. All Rights Reserved
  *
  */
+#include <linux/auxiliary_bus.h>
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
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
 
@@ -29,6 +39,38 @@
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
+/* CCI connector number is 7 bits, 1-based */
+#define ITEPD_MAX_CONNECTORS			127
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
@@ -38,6 +80,9 @@ struct itepd {
 	struct mutex received_lock;	/* Protects cci and msg_in */
 	u8 msg_in[ITEPD_MSG_IN_MAX_LEN];
 	u32 cci;
+
+	struct itepd_port *ports;
+	unsigned int num_ports;
 };
 
 static u8 ucsi_itepd_get_len(u32 cci)
@@ -115,25 +160,26 @@ static int itepd_process_event(struct itepd *itepd, u32 *cci)
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
@@ -148,7 +194,7 @@ static int itepd_process_event(struct itepd *itepd, u32 *cci)
 		}
 	}
 
-	ack = event;
+	ack = raw;
 	ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &ack, sizeof(ack));
 	if (ret)
 		return ret;
@@ -169,7 +215,8 @@ static int itepd_process_event(struct itepd *itepd, u32 *cci)
 	*cci = itepd->cci;
 	mutex_unlock(&itepd->received_lock);
 
-	return ITEPD_EVENT_VDM;
+	return event & ITEPD_ALERT_VDM_EVENT ? ITEPD_EVENT_VDM :
+					       ITEPD_EVENT_OTHER;
 }
 
 static int ucsi_itepd_read_version(struct ucsi *ucsi, u16 *version)
@@ -220,18 +267,248 @@ static int ucsi_itepd_read_message_in(struct ucsi *ucsi, void *val, size_t val_l
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
+	if (pin_assign &&
+	    __ffs(pin_assign) <= TYPEC_DP_STATE_E - TYPEC_STATE_MODAL)
+		mode = TYPEC_MODAL_STATE(__ffs(pin_assign));
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
+static struct itepd_port *itepd_get_port(struct ucsi_connector *con)
+{
+	struct itepd *itepd = ucsi_get_drvdata(con->ucsi);
+	struct itepd_port *port;
+
+	if (con->num < 1 || con->num > itepd->num_ports)
+		return NULL;
+
+	port = &itepd->ports[con->num - 1];
+
+	/* Not described in DT */
+	if (!port->itepd)
+		return NULL;
+
+	return port;
+}
+
+static void ucsi_itepd_update_connector(struct ucsi_connector *con)
+{
+	if (!itepd_get_port(con))
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
+	port = itepd_get_port(con);
+	if (!port)
+		return;
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
@@ -239,6 +516,8 @@ static const struct ucsi_operations ucsi_itepd_ops = {
 	.read_message_in	= ucsi_itepd_read_message_in,
 	.sync_control		= ucsi_sync_control_common,
 	.async_control		= ucsi_itepd_async_control,
+	.update_connector	= ucsi_itepd_update_connector,
+	.connector_status	= ucsi_itepd_connector_status,
 };
 
 static irqreturn_t itepd_irq_process(struct itepd *itepd)
@@ -256,6 +535,9 @@ static irqreturn_t itepd_irq_process(struct itepd *itepd)
 	if (ret == ITEPD_EVENT_UCSI)
 		ucsi_notify_common(itepd->ucsi, cci);
 
+	if (ret == ITEPD_EVENT_VDM)
+		dev_dbg(&itepd->client->dev, "VDM event\n");
+
 	return IRQ_HANDLED;
 }
 
@@ -266,6 +548,127 @@ static irqreturn_t itepd_irq_thread_fn(int irq, void *data)
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
+	unsigned int num_ports = 0;
+	u32 reg;
+	int ret;
+
+	/* Size the port array by the highest connector number in DT */
+	device_for_each_child_node_scoped(dev, fwnode) {
+		ret = fwnode_property_read_u32(fwnode, "reg", &reg);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: missing reg property\n",
+					     fwnode);
+
+		if (reg >= ITEPD_MAX_CONNECTORS)
+			return dev_err_probe(dev, -EINVAL,
+					     "%pfwP: invalid reg %u\n",
+					     fwnode, reg);
+
+		num_ports = max(num_ports, reg + 1);
+	}
+
+	if (!num_ports)
+		return 0;
+
+	itepd->ports = devm_kcalloc(dev, num_ports, sizeof(*itepd->ports),
+				    GFP_KERNEL);
+	if (!itepd->ports)
+		return -ENOMEM;
+
+	itepd->num_ports = num_ports;
+
+	device_for_each_child_node_scoped(dev, fwnode) {
+		/* Already validated above */
+		fwnode_property_read_u32(fwnode, "reg", &reg);
+
+		port = &itepd->ports[reg];
+		if (port->itepd)
+			return dev_err_probe(dev, -EINVAL,
+					     "%pfwP: duplicate reg %u\n",
+					     fwnode, reg);
+
+		port->itepd = itepd;
+		port->index = reg;
+		port->mode = TYPEC_STATE_SAFE;
+		port->state.mode = TYPEC_STATE_SAFE;
+		port->dp_alt.svid = USB_TYPEC_DP_SID;
+		port->dp_alt.mode = USB_TYPEC_DP_MODE;
+
+		port->typec_mux = fwnode_typec_mux_get(fwnode);
+		if (IS_ERR(port->typec_mux))
+			return dev_err_probe(dev, PTR_ERR(port->typec_mux),
+					     "port%u: failed to get mode-switch\n",
+					     reg);
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
+					     reg);
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
+						     reg);
+		}
+	}
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
@@ -286,6 +689,14 @@ static int itepd_probe(struct i2c_client *client)
 	mutex_init(&itepd->received_lock);
 	i2c_set_clientdata(client, itepd);
 
+	ret = itepd_ports_init(itepd);
+	if (ret)
+		return ret;
+
+	ret = itepd_bridges_add(itepd);
+	if (ret)
+		return ret;
+
 	itepd->ucsi = ucsi_create(dev, &ucsi_itepd_ops);
 	if (IS_ERR(itepd->ucsi))
 		return dev_err_probe(dev, PTR_ERR(itepd->ucsi),

---
base-commit: fe40296ebc69252949874d636faf805dfc065acd
change-id: 20260930-ucsi-itepd-display-b9770e613dac
prerequisite-change-id: 20260911-ucsi-itepd-it527x-5b87a61a71bb:v3
prerequisite-patch-id: 988219409db7ac096bc9e81e9bcbd4634f73e9ff
prerequisite-patch-id: 20e67d80cb6f04a8d9832850d1220d932432552b

Best regards,
--  
Amber Kao <ite_pd@ite.com.tw>

