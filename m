Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4393E9C19;
	Thu,  3 Sep 2026 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416495; cv=none; b=NQu2PWYNztQ5YRiuF6M9pWd/fZ7XULukC1xbXTJidiEXa11QuZEJp9fb1+SXSTHMUZYoJlcyTwmRurSxkhDxg+pQ1P6CaahLGeACwGD9uvWk+J5vc9g6bHBBIFDzqwJfNry4kR8QC8I0ZNBAJlYeIUPkFpo/SH2M/XA1Nm/Rvjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416495; c=relaxed/simple;
	bh=IconsgVkC13AQ9v6890p5lulZOPc1ZEaWKUZ8H/5vPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lJmIVEouubgyAWyHefHtUbgFqz2M6kkIvRG6TnZNmreLUZvr5OhfDh1vHxnVreMUU3QhbGX6bclbD0PfNOVl4Ps7935xpiUsJjFmqXZSAk/xmPGjvLMqLxsMacBZGqoideciGfhGlku2rTX7+T/bTXggeCM274OlPFArWZCBDfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 032C920021E;
	Thu,  3 Sep 2026 08:21:31 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 96B6E200211;
	Thu,  3 Sep 2026 08:21:30 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2C858180006C;
	Thu,  3 Sep 2026 14:21:29 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v18 8/8] i3c: hub: p3h2x4x: Add SMBus slave mode support
Date: Thu,  3 Sep 2026 11:51:08 +0530
Message-Id: <20260903062108.2712296-9-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.

The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
to support the receive path and forward the received payloads to the
registered I2C slave client through i2c_slave_event().

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v18:
 - Rebased onto v7.3-rc1; no intended driver behaviour changes

Changes in v17:
 - No change

Changes in v16:
 - Always clear the software slave state on unregister: even if the hardware
   IBI-disable write fails, log the error but still set bus->tp_smbus_client = NULL
   and return 0, so a later IBI cannot deref a dangling client and call a freed slave_cb
 - Use a heap DMA-safe buffer for the SMBus-agent RX path
   instead of a stack buffer passed to regmap_bulk_read() over I3C
 - Advertise I2C_FUNC_SLAVE when CONFIG_I2C_SLAVE is enabled, and reject slave
   registration with -EOPNOTSUPP unless an I3C upstream device and working IBI
   path are available (hub->i3cdev and hub->ibi_ready)
 - Validate the IBI payload length and bound the target-port loop by
   num_target_ports

Changes in v15:
 - Retrieve the hub context through the shared MFD data instead of replacing
   the I3C device's parent driver data
 - Rework SMBus slave registration and unregistration to use the shared
   protected-register lock
 - Report protected-register relock failures separately from the original
   enable or disable operation

Changes in v14:
 - Clear receive-buffer flags even on SMBus receive error paths to avoid
   repeated IBI storms
 - Decode receive-buffer status using FIELD_GET()
 - Fix overflow status value and explicitly clear overflow after reading both
   target buffers

Changes in v13:
 - Make IBI setup optional and robust: avoid probe failure when IBI is unsupported and add proper
   cleanup using devm actions
 - Fix SMBus slave receive path: avoid over-clearing buffer status, handle unregistered ports,
   and ensure correct event delivery
 - Improve safety by adding proper locking around shared state

Changes in v12:
 - Add devm cleanup for IBI request/enable path
 - Fix NULL pointer dereference before tp_smbus_client check
 - Clear tp_smbus_client before disabling SMBus-agent IBI in unreg_slave()

Changes in v11:
 - Improve SMBus slave mode payload validation and parsing

Changes in v10:
 - Split SMBus slave mode support into a separate patch
---
---
 drivers/i3c/hub/p3h2840_i3c_hub.h       |  19 ++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c   |  54 ++++-
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 306 +++++++++++++++++++++++-
 3 files changed, 377 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 7a1345924e3f..0e59351e7b6d 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -123,6 +123,11 @@
 #define BUF_RECEIVED_FLAG_MASK					GENMASK(3, 1)
 #define BUF_RECEIVED_FLAG_TF_MASK				GENMASK(3, 0)
 
+#define P3H2X4X_TARGET_BUF_0_RECEIVE_VAL			1
+#define P3H2X4X_TARGET_BUF_1_RECEIVE_VAL			2
+#define P3H2X4X_TARGET_BUF_0_1_RECEIVE_VAL			3
+#define P3H2X4X_TARGET_BUF_OVRFL_VAL				7
+
 #define P3H2X4X_TARGET_AGENT_LOCAL_DEV				0x11
 #define P3H2X4X_TARGET_BUFF_0_PAGE				0x12
 #define P3H2X4X_TARGET_BUFF_1_PAGE				0x13
@@ -315,6 +320,10 @@ struct p3h2x4x_i3c_hub_dev {
 	struct i2c_client *i2c_client;
 	struct hub_configuration hub_config;
 	struct tp_bus tp_bus[P3H2X4X_TP_MAX_COUNT];
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	bool ibi_ready;
+	u8 *slave_rx_buffer;
+#endif
 	struct i3c_hub *hub;
 };
 
@@ -340,4 +349,14 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
  */
 int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
 
+/**
+ * p3h2x4x_ibi_handler - IBI handler.
+ * @i3cdev: i3c device.
+ * @payload: two byte IBI payload data.
+ */
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
+			 const struct i3c_ibi_payload *payload);
+#endif
+
 #endif /* P3H2840_I3C_HUB_H */
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
index 3c5db7db48aa..b069467afcc6 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
@@ -10,6 +10,14 @@
 
 #include "p3h2840_i3c_hub.h"
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static const struct i3c_ibi_setup p3h2x4x_ibireq = {
+	.handler = p3h2x4x_ibi_handler,
+	.max_payload_len = P3H2X4X_MAX_PAYLOAD_LEN,
+	.num_slots = P3H2X4X_NUM_SLOTS,
+};
+#endif
+
 static inline struct tp_bus *
 p3h2x4x_bus_from_controller(struct i3c_master_controller *controller)
 {
@@ -63,6 +71,16 @@ static void p3h2x4x_unregister_i3c_master(void *data)
 	i3c_master_unregister(controller);
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void p3h2x4x_free_ibi(void *data)
+{
+	struct i3c_device *i3cdev = data;
+
+	i3c_device_disable_ibi(i3cdev);
+	i3c_device_free_ibi(i3cdev);
+}
+#endif
+
 /**
  * p3h2x4x_tp_i3c_algo - Register I3C virtual masters for I3C target ports.
  * @p3h2x4x_hub: p3h2x4x device structure.
@@ -122,5 +140,39 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
 		p3h2x4x_hub->tp_bus[tp].is_registered = true;
 		p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
 	}
-	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	p3h2x4x_hub->slave_rx_buffer = devm_kzalloc(p3h2x4x_hub->dev,
+						    P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE,
+						    GFP_KERNEL);
+	if (!p3h2x4x_hub->slave_rx_buffer)
+		return -ENOMEM;
+
+	ret = i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
+	if (ret) {
+		dev_warn(p3h2x4x_hub->dev,
+			 "IBI not available, SMBus slave mode disabled\n");
+		p3h2x4x_hub->ibi_ready = false;
+	} else {
+		ret = i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
+		if (ret) {
+			i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
+			dev_warn(p3h2x4x_hub->dev,
+				 "Failed to enable IBI, SMBus slave mode disabled\n");
+			p3h2x4x_hub->ibi_ready = false;
+		} else {
+			p3h2x4x_hub->ibi_ready = true;
+
+			ret = devm_add_action_or_reset(p3h2x4x_hub->dev,
+						       p3h2x4x_free_ibi,
+						       p3h2x4x_hub->i3cdev);
+			if (ret) {
+				p3h2x4x_hub->ibi_ready = false;
+				return ret;
+			}
+		}
+	}
+#endif
+	ret = regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
+
+	return ret;
 }
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index a3324cc36595..7fdfa79dfeb6 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -3,6 +3,8 @@
  * Copyright 2025-2026 NXP
  * This P3H2X4X driver file contain functions for SMBus/I2C virtual Bus creation and read/write.
  */
+#include <linux/bitfield.h>
+#include <linux/i3c/device.h>
 #include <linux/mfd/p3h2840.h>
 #include <linux/regmap.h>
 
@@ -15,6 +17,178 @@ enum p3h2x4x_smbus_desc_idx {
 	P3H2X4X_DESC_READ_LEN,
 };
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
+					    enum p3h2x4x_tp tp)
+{
+	struct p3h2x4x *p3h2x4x = i3cdev_get_drvdata(i3cdev);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	u8 target_buffer_page, flag_clear, temp = 0, i, addr;
+	u32 packet_len, slave_address;
+	struct i2c_client *client;
+	u8 *slave_rx_buffer;
+	int ret;
+
+	if (!p3h2x4x || !p3h2x4x->i3c_hub_priv)
+		return;
+
+	p3h2x4x_i3c_hub = p3h2x4x->i3c_hub_priv;
+	slave_rx_buffer = p3h2x4x_i3c_hub->slave_rx_buffer;
+
+	switch (rfbuf) {
+	case RCV_BUF_0:
+		target_buffer_page = P3H2X4X_TARGET_BUFF_0_PAGE;
+		flag_clear = P3H2X4X_TARGET_BUF_0_RECEIVE;
+		break;
+	case RCV_BUF_1:
+		target_buffer_page = P3H2X4X_TARGET_BUFF_1_PAGE;
+		flag_clear = P3H2X4X_TARGET_BUF_1_RECEIVE;
+		break;
+	default:
+		return;
+	}
+
+	target_buffer_page += P3H2X4X_NO_PAGE_PER_TP * tp;
+
+	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, target_buffer_page);
+	if (ret)
+		goto ibi_err;
+
+	/* read buffer length */
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_LENGTH, &packet_len);
+	if (ret)
+		goto ibi_err;
+
+	if (packet_len)
+		packet_len = packet_len - 1;
+
+	if (packet_len > P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE) {
+		dev_err(&i3cdev->dev, "Received message too big for p3h2x4x buffer\n");
+		goto ibi_err;
+	}
+
+	/* read slave  address */
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_ADDRESS, &slave_address);
+	if (ret)
+		goto ibi_err;
+
+	/* read data */
+	if (packet_len) {
+		ret = regmap_bulk_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_DATA,
+				       slave_rx_buffer, packet_len);
+		if (ret)
+			goto ibi_err;
+	}
+
+	client = p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client;
+	if (!client)
+		goto ibi_err;
+
+	/* notify slave driver about received data */
+	if ((client->addr & 0x7f) == (slave_address >> 1)) {
+		addr = slave_address >> 1;
+		i2c_slave_event(client,
+				I2C_SLAVE_WRITE_REQUESTED, &addr);
+		for (i = 0; i < packet_len; i++) {
+			temp = slave_rx_buffer[i];
+			i2c_slave_event(client,
+					I2C_SLAVE_WRITE_RECEIVED, &temp);
+		}
+		i2c_slave_event(client, I2C_SLAVE_STOP, &temp);
+	}
+
+ibi_err:
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
+
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, flag_clear);
+}
+
+/**
+ * p3h2x4x_ibi_handler - IBI handler.
+ * @i3cdev: i3c device.
+ * @payload: two byte IBI payload data.
+ *
+ */
+void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
+			 const struct i3c_ibi_payload *payload)
+{
+	struct p3h2x4x *p3h2x4x = i3cdev_get_drvdata(i3cdev);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	u8 payload_byte_one, payload_byte_two;
+	u32 target_port_status;
+	const u8 *data;
+	int ret, i;
+
+	if (!payload || payload->len < P3H2X4X_MAX_PAYLOAD_LEN)
+		return;
+
+	data = payload->data;
+	payload_byte_one = data[0];
+
+	if (!(payload_byte_one & P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS))
+		return;
+
+	p3h2x4x_i3c_hub = p3h2x4x ? p3h2x4x->i3c_hub_priv : NULL;
+
+	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
+		return;
+
+	payload_byte_two = data[1];
+	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
+
+	for (i = 0; i < p3h2x4x->num_target_ports; ++i) {
+		if (!((payload_byte_two >> i) & 0x01))
+			continue;
+
+		if (!p3h2x4x_i3c_hub->tp_bus[i].is_registered) {
+			dev_dbg(&i3cdev->dev, "IBI for unregistered SMBus port %u\n", i);
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     BUF_RECEIVED_FLAG_TF_MASK);
+			continue;
+		}
+
+		ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				  &target_port_status);
+		if (ret) {
+			dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
+			continue;
+		}
+
+		if (target_port_status & P3H2X4X_TARGET_BUF_CA_TF)
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     P3H2X4X_TARGET_BUF_CA_TF);
+
+		/* process data receive buffer */
+		switch (FIELD_GET(BUF_RECEIVED_FLAG_MASK, target_port_status)) {
+		case P3H2X4X_TARGET_BUF_0_RECEIVE_VAL:
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
+			break;
+		case P3H2X4X_TARGET_BUF_1_RECEIVE_VAL:
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
+			break;
+		case P3H2X4X_TARGET_BUF_0_1_RECEIVE_VAL:
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
+			break;
+		case P3H2X4X_TARGET_BUF_OVRFL_VAL:
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
+			regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     P3H2X4X_TARGET_BUF_OVRFL);
+			dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
+			break;
+		default:
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     target_port_status & BUF_RECEIVED_FLAG_MASK);
+			break;
+		}
+	}
+}
+#endif
+
 static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
 						 u8 target_port_status,
 						 u8 data_length)
@@ -215,8 +389,134 @@ static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, i
 
 static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+	u32 funcs = I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	struct tp_bus *bus = i2c_get_adapdata(adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+
+	/*
+	 * Only advertise slave support when the upstream IBI path is usable.
+	 * Otherwise reg_slave() returns -EOPNOTSUPP while functionality()
+	 * reports I2C_FUNC_SLAVE, which is inconsistent for callers.
+	 */
+	if (hub->ibi_ready)
+		funcs |= I2C_FUNC_SLAVE;
+#endif
+
+	return funcs;
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
+	int relock_ret = 0;
+	int ret = 0;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (!hub->i3cdev || !hub->ibi_ready)
+		return -EOPNOTSUPP;
+
+	if (bus->tp_smbus_client)
+		return -EBUSY;
+
+	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
+		/* Unlock access to protected registers */
+		ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+				   P3H2X4X_REGISTERS_UNLOCK_CODE);
+		if (ret)
+			break;
+
+		ret = regmap_set_bits(hub->regmap,
+				      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+				      bus->tp_mask);
+
+		/* Lock access to protected registers */
+		relock_ret = regmap_write(hub->regmap,
+					  P3H2X4X_DEV_REG_PROTECTION_CODE,
+					  P3H2X4X_REGISTERS_LOCK_CODE);
+	}
+
+	/*
+	 * A relock failure does not undo the IBI enable, so report it
+	 * separately and keep the callback result tied to the IBI operation.
+	 */
+	if (relock_ret)
+		dev_err(hub->dev,
+			"failed to restore protected register lock: %d\n",
+			relock_ret);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * Publish the software state only after the hardware IBI has been
+	 * enabled successfully.
+	 */
+	bus->tp_smbus_client = slave;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = true;
+
+	return 0;
+}
+
+static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
+	int relock_ret = 0;
+	int ret = 0;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (bus->tp_smbus_client != slave)
+		return -EINVAL;
+
+	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
+		/* Unlock access to protected registers */
+		ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+				   P3H2X4X_REGISTERS_UNLOCK_CODE);
+		if (ret)
+			break;
+
+		ret = regmap_clear_bits(hub->regmap,
+					P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+					bus->tp_mask);
+
+		/* Lock access to protected registers */
+		relock_ret = regmap_write(hub->regmap,
+					  P3H2X4X_DEV_REG_PROTECTION_CODE,
+					  P3H2X4X_REGISTERS_LOCK_CODE);
+	}
+
+	if (relock_ret)
+		dev_err(hub->dev,
+			"failed to restore protected register lock: %d\n",
+			relock_ret);
+
+	if (ret)
+		dev_err(hub->dev,
+			"failed to disable SMBus agent IBI on port %u: %d\n",
+			bus->tp_port, ret);
+
+	/*
+	 * Slave backend removal cannot be rolled back. Detach the
+	 * callback-visible state even if disabling the hardware IBI failed,
+	 * and return 0 so the core completes teardown; the failure is still
+	 * visible in the log above. etx_mutex serializes this with the IBI
+	 * handler, so later events are acknowledged without invoking the
+	 * removed client.
+	 */
+	bus->tp_smbus_client = NULL;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = false;
+
+	return 0;
 }
+#endif
 
 static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
 	.max_read_len  = P3H2X4X_SMBUS_PAYLOAD_SIZE,
@@ -228,6 +528,10 @@ static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
  */
 static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
 	.master_xfer    = p3h2x4x_tp_i2c_xfer,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
+	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
+#endif
 	.functionality  = p3h2x4x_tp_smbus_funcs,
 };
 
-- 
2.25.1

