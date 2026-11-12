Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487504;
	b=05CAUDEoKRdg5lf4yl8QvrrEN5gvaQicC1UKoalWz1rLO4GXHxyz1y7oJNz0QhvqnomL
	 X1sMmpHw56qDXGU7rkA6U9U8pvgo3OqzFezhnBVqhCTMlp933aoTo/3AzXlnD2HQy9ny7
	 Pc2kORkkpqD18VypCnuT6TrW6+CHSlSe76V/k/1oDRX6mUv4+vZL0yCy5ytBKYvxbIEHE
	 G3d6wqjbQpI3oO67Np1ECkZw9zU6O44RKjV3oCdjSUWgYe+mtVXXk9QrFlECjniN2j5On
	 ooamL3Mjip/pxgjQTEhuW1oWgQkk8jKd4b4c293KOvJcYZtPeovpiCvQ//nNukupuXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487504;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=7paNoClChe+S0sCTY6Eke0tRfRLh1xl/GCfJ2aiVR6Y=;
	b=GdZjpRTNOKoZMcHndUlk7YwmlsOwrTexTxiT+xR6equGK0EAct1g52q6wsxLv5wIVMck
	 3AQKIFlvPw4o+avjUA9eYGJPrgm/6my2D30vnuZrx0CE65UKP7qZsC4FGofpGX3ni2bTz
	 AMSUz4IRoL3D+wPLz2Z3C7AmA/+ktbfb//i3lQxe03KHO0bSgHUuGF2e/VTcX1jufe3wQ
	 PKhLiC0CDsSLJs2eTNsZEHMZuvP2mndlKnCUp32shWZG6YIaBlAMQqrM03ASQzUwuPafq
	 QytYbhHkUR7EEIAIO0VSlDqmgEWy4w+o5+bmn0ieQMYDXvgN5kr6EK0oOk6ncclymMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.13
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF61606A88A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF61606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DB9C91A000D;
	Thu, 12 Nov 2026 13:45:01 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B9861A0007;
	Thu, 12 Nov 2026 13:45:01 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9D89E1800068;
	Thu, 12 Nov 2026 20:44:58 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v21 4/4] i3c: hub: p3h2x4x: Add SMBus slave mode support
Date: Thu, 12 Nov 2026 18:14:37 +0530
Message-Id: <20261112124437.3367252-5-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
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
X-Virus-Scanned: ClamAV using ClamSMTP

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.

The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
to support the receive path and forward the received payloads to the
registered I2C slave client through i2c_slave_event().

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v21:
 - Handle both receive-buffer flags independently, including on overflow
 - Acknowledge only the overflow flag to preserve buffer-refill events and
   report the affected port
 - Initialize optional IBI support before acquiring the routing mutex

Changes in v20:
 - No change

Changes in v19:
 - No change

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
 drivers/i3c/hub/p3h2840_i3c_hub.h       |  14 ++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c   |  51 ++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c | 298 +++++++++++++++++++++++-
 3 files changed, 362 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index 5eecc972514b..d477b0f8ec27 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -314,6 +314,10 @@ struct p3h2x4x_i3c_hub_dev {
 	struct i2c_client *i2c_client;
 	struct hub_configuration hub_config;
 	struct tp_bus tp_bus[P3H2X4X_TP_MAX_COUNT];
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	bool ibi_ready;
+	u8 *slave_rx_buffer;
+#endif
 	struct i3c_hub *hub;
 };
 
@@ -339,4 +343,14 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
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
index a070be32ffed..31d088a49b9e 100644
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
@@ -67,6 +75,16 @@ static void p3h2x4x_unregister_i3c_master(void *data)
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
@@ -140,6 +158,39 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
 		p3h2x4x_hub->tp_bus[tp].is_registered = true;
 	}
 
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
+
 	/*
 	 * Take the routing lock used by the hub callbacks so they cannot
 	 * observe always_enable before the route is programmed.
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index 247d0f4883b7..02b50d1eb938 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -3,6 +3,7 @@
  * Copyright 2025-2026 NXP
  * This P3H2X4X driver file contain functions for SMBus/I2C virtual Bus creation and read/write.
  */
+#include <linux/i3c/device.h>
 #include <linux/mfd/p3h2840.h>
 #include <linux/regmap.h>
 
@@ -15,6 +16,171 @@ enum p3h2x4x_smbus_desc_idx {
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
+		/* Service the receive flags independently of the overflow flag. */
+		if (target_port_status & P3H2X4X_TARGET_BUF_0_RECEIVE)
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i);
+
+		if (target_port_status & P3H2X4X_TARGET_BUF_1_RECEIVE)
+			p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i);
+
+		if (target_port_status & P3H2X4X_TARGET_BUF_OVRFL) {
+			/*
+			 * The helpers handle receive-flag acknowledgment. Clear only
+			 * overflow here, as a released buffer may already have refilled.
+			 */
+			regmap_write(p3h2x4x_i3c_hub->regmap,
+				     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+				     P3H2X4X_TARGET_BUF_OVRFL);
+			dev_err(&i3cdev->dev,
+				"SMBus receive buffer overflow on port %d\n", i);
+		}
+	}
+}
+#endif
+
 static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
 						 u8 target_port_status,
 						 u8 data_length)
@@ -220,8 +386,134 @@ static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, i
 
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
@@ -233,6 +525,10 @@ static const struct i2c_adapter_quirks p3h2x4x_tp_i2c_quirks = {
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

