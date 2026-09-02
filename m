Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D364483A5;
	Wed,  2 Sep 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344993; cv=none; b=ASIBUw4pOVzXH6QkbT4DfiGElTHTJPYKXRQIjt2usbty2LW4VF28FpBNYJwKsuBdU3pP/ldSDqNXKQTCJzttgCnA0G+npgLLjLkgMWqQz4BAahSOOJ0G+9UVd2ffAjr94fT9CB7BMnXEzbRnW7IdW0baIDJ0Exnz7xug7SXNKWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344993; c=relaxed/simple;
	bh=qnT1GXqIyVKYm1gVGBJ6P37LsEARE/1KVLzDfToZsgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jacaygpDYlThrFNGcg+IeNSc3+znUN4Vu5Hu/5QjsZCruCRGYD0C0o+dtMLWflN4Ob/hCJzyV+jWv0rjnXPeQXPTUXMapeh5TmlIDQ6ZBF38Xqw0aqHPkTYS0Hv95JdkH9/QXVaTlNw+hdPcB2083JwfLejBkgmG4tewQZPrqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A95A61A0117;
	Wed,  2 Sep 2026 12:29:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 45DDC1A0112;
	Wed,  2 Sep 2026 12:29:38 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ECD1A180006C;
	Wed,  2 Sep 2026 18:29:36 +0800 (+08)
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
Subject: [PATCH v17 1/8] i3c: master: Add APIs for I3C hub support
Date: Wed,  2 Sep 2026 15:59:22 +0530
Message-Id: <20260902102929.2268307-2-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902102929.2268307-1-lakshay.piplani@nxp.com>
References: <20260902102929.2268307-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add CCC helpers to check CCC support and send CCC commands, address slot
helpers to query and update I3C bus address slot state, registering virtual
masters with an explicit firmware node, and exposing the bus maintenance
lock helpers.

These additions prepare for I3C hub support. A hub driver needs to reserve
and query parent bus address slots, forward CCC commands, register virtual
target port controllers using the target-port firmware node, and serialize
operations against the parent bus maintenance lock.

The hub also forwards private transfers via i3c_dev_do_xfers_locked() and
serializes its IBI and private-transfer paths against the shared lock, so
the normal-use lock/unlock pair is exposed alongside the maintenance-lock
helpers.

i3c_master_register_fwnode() allows virtual I3C masters to register using a
firmware node different from their parent device node without temporarily
modifying parent->of_node.

The new helpers are:
1) i3c_master_send_ccc_cmd()
2) i3c_master_supports_ccc_cmd()
3) i3c_bus_get_addr_slot_status()
4) i3c_bus_set_addr_slot_status()
5) i3c_bus_maintenance_lock()
6) i3c_bus_maintenance_unlock()
7) i3c_master_register_fwnode()
8) i3c_bus_normaluse_lock()
9) i3c_bus_normaluse_unlock()
10) i3c_dev_do_xfers_locked()

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v17:
 - No code changes
 - Added Frank Li's Reviewed-by tag

Changes in v16:
 - Rewrite the commit message to match the code, It now describes only
   the helpers actually exported

Changes in v15:
 - Drop the direct attach and detach helpers that also modified address-slot
   state
 - Export these APIs:
   - i3c_bus_normaluse_lock()
   - i3c_bus_normaluse_unlock()
   - i3c_dev_do_xfers_locked()

Changes in v14:
 - Add i3c_master_register_fwnode() to register virtual I3C masters with an
   explicit firmware node
 - Export i3c_bus_maintenance_lock() and i3c_bus_maintenance_unlock()
 - Add runtime PM get/put around i3c_master_send_ccc_cmd()
 - Make i3c_master_supports_ccc_cmd() return false when the controller does
   not implement send_ccc_cmd()

Changes in v13:
 - Fix address handling in direct attach by using i3c_master_get_i3c_addrs() and
   adding rollback on failure to prevent bus address collisions
 - Fix detach path by clearing master_priv and releasing addresses to avoid use-after-free
   and stale state issues
 - Export address slot helper APIs and add kernel-doc for them

Changes in v12:
 - Add address check in i3c_master_direct_detach_i3c_dev_locked() to skip
   detach for unaddressed devices.

Changes in v11:
 - Convert i3c_master_supports_ccc_cmd() to return bool and align
   semantics with CCC support checks used by the I3C core

Changes in v10:
 - Rename i3c_master_direct_attach_i3c_dev and i3c_master_direct_detach_i3c_dev
   APIs to *_locked, as these APIs must be called with the bus lock held in
   write mode

Changes in v9:
 - No change

Changes in v8:
 - No change

Changes in v7:
 - Update commit message to clarify purpose (prepare for I3C hub support)

Changes in v6:
 - Split the patch into two parts:
        1) expose the existing API
        2) add new APIs.
---
---
 drivers/i3c/master.c       | 155 +++++++++++++++++++++++++++++++------
 include/linux/i3c/master.h |  17 ++++
 2 files changed, 149 insertions(+), 23 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f1be38a640ca..03fb41f0786c 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -44,10 +44,11 @@ static BLOCKING_NOTIFIER_HEAD(i3c_bus_notifier);
  * logic to rely on I3C device information that could be changed behind their
  * back.
  */
-static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
+void i3c_bus_maintenance_lock(struct i3c_bus *bus)
 {
 	down_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_lock);
 
 /**
  * i3c_bus_maintenance_unlock - Release the bus lock after a maintenance
@@ -58,10 +59,11 @@ static void i3c_bus_maintenance_lock(struct i3c_bus *bus)
  * i3c_bus_maintenance_lock() for more details on what these maintenance
  * operations are.
  */
-static void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus)
 {
 	up_write(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_maintenance_unlock);
 
 /**
  * i3c_bus_normaluse_lock - Lock the bus for a normal operation
@@ -83,6 +85,7 @@ void i3c_bus_normaluse_lock(struct i3c_bus *bus)
 {
 	down_read(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_normaluse_lock);
 
 /**
  * i3c_bus_normaluse_unlock - Release the bus lock after a normal operation
@@ -96,6 +99,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
 {
 	up_read(&bus->lock);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_normaluse_unlock);
 
 static struct i3c_master_controller *
 i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
@@ -385,11 +389,19 @@ i3c_bus_get_addr_slot_status_mask(struct i3c_bus *bus, u16 addr, u32 mask)
 	return status & mask;
 }
 
-static enum i3c_addr_slot_status
+/**
+ * i3c_bus_get_addr_slot_status() - Get I3C bus address slot status
+ * @bus: I3C bus.
+ * @addr: I3C address to query.
+ *
+ * Return: Address slot status for @addr.
+ */
+enum i3c_addr_slot_status
 i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr)
 {
 	return i3c_bus_get_addr_slot_status_mask(bus, addr, I3C_ADDR_SLOT_STATUS_MASK);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_get_addr_slot_status);
 
 static void i3c_bus_set_addr_slot_status_mask(struct i3c_bus *bus, u16 addr,
 					      enum i3c_addr_slot_status status, u32 mask)
@@ -405,11 +417,18 @@ static void i3c_bus_set_addr_slot_status_mask(struct i3c_bus *bus, u16 addr,
 	*ptr |= ((unsigned long)status & mask) << (bitpos % BITS_PER_LONG);
 }
 
-static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
-					 enum i3c_addr_slot_status status)
+/**
+ * i3c_bus_set_addr_slot_status() - Set I3C bus address slot status
+ * @bus: I3C bus.
+ * @addr: I3C address to update.
+ * @status: Address slot status to set.
+ */
+void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
+				  enum i3c_addr_slot_status status)
 {
 	i3c_bus_set_addr_slot_status_mask(bus, addr, status, I3C_ADDR_SLOT_STATUS_MASK);
 }
+EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);
 
 static bool i3c_bus_dev_addr_is_avail(struct i3c_bus *bus, u8 addr)
 {
@@ -2548,6 +2567,59 @@ static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
 	}
 }
 
+/**
+ * i3c_master_supports_ccc_cmd() - check CCC command support
+ * @master: I3C master controller
+ * @cmd: CCC command to verify
+ *
+ * Return: true if @cmd is supported, false otherwise.
+ */
+bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				 const struct i3c_ccc_cmd *cmd)
+{
+	if (!master || !cmd)
+		return false;
+
+	if (!master->ops->send_ccc_cmd)
+		return false;
+
+	if (!master->ops->supports_ccc_cmd)
+		return true;
+
+	return master->ops->supports_ccc_cmd(master, cmd);
+}
+EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
+
+/**
+ * i3c_master_send_ccc_cmd() - send a CCC command
+ * @master: I3C master controller issuing the command
+ * @cmd: CCC command to be sent
+ *
+ * This function sends a Common Command Code (CCC) command to devices on the
+ * I3C bus. It acquires the bus maintenance lock, executes the command, and
+ * then releases the lock to ensure safe access to the bus.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd)
+{
+	int ret;
+
+	ret = i3c_master_rpm_get(master);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	i3c_master_rpm_put(master);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
+
 /**
  * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
  * @master: controller
@@ -3195,34 +3267,31 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 }
 
 /**
- * i3c_master_register() - register an I3C master
+ * i3c_master_register_fwnode() - register an I3C master with a custom fwnode
  * @master: master used to send frames on the bus
- * @parent: the parent device (the one that provides this I3C master
- *	    controller)
+ * @parent: the parent device providing this I3C master controller
+ * @fwnode: firmware node describing this I3C bus, or NULL
  * @ops: the master controller operations
- * @secondary: true if you are registering a secondary master. Will return
- *	       -EOPNOTSUPP if set to true since secondary masters are not yet
- *	       supported
+ * @secondary: true if registering a secondary master
  *
- * This function takes care of everything for you:
+ * This helper is useful for virtual I3C masters whose firmware node is not
+ * the same as @parent's firmware node.
  *
- * - creates and initializes the I3C bus
- * - populates the bus with static I2C devs if @parent->of_node is not
- *   NULL
- * - registers all I3C devices added by the controller during bus
- *   initialization
- * - registers the I2C adapter and all I2C devices
+ * Only OF-backed fwnodes are supported for now, because the I3C core still
+ * stores the bus node in master->dev.of_node and populates the bus using OF.
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-int i3c_master_register(struct i3c_master_controller *master,
-			struct device *parent,
-			const struct i3c_master_controller_ops *ops,
-			bool secondary)
+int i3c_master_register_fwnode(struct i3c_master_controller *master,
+			       struct device *parent,
+			       struct fwnode_handle *fwnode,
+			       const struct i3c_master_controller_ops *ops,
+			       bool secondary)
 {
 	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE;
 	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
 	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
+	struct device_node *np = NULL;
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
@@ -3234,8 +3303,14 @@ int i3c_master_register(struct i3c_master_controller *master,
 	if (ret)
 		return ret;
 
+	if (fwnode) {
+		np = to_of_node(fwnode);
+		if (!np)
+			return -EINVAL;
+	}
+
 	master->dev.parent = parent;
-	master->dev.of_node = of_node_get(parent->of_node);
+	master->dev.of_node = of_node_get(np);
 	master->dev.bus = &i3c_bus_type;
 	master->dev.type = &i3c_masterdev_type;
 	master->dev.release = i3c_masterdev_release;
@@ -3352,6 +3427,39 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_master_register_fwnode);
+
+/**
+ * i3c_master_register() - register an I3C master
+ * @master: master used to send frames on the bus
+ * @parent: the parent device (the one that provides this I3C master
+ *	    controller)
+ * @ops: the master controller operations
+ * @secondary: true if you are registering a secondary master. Will return
+ *	       -EOPNOTSUPP if set to true since secondary masters are not yet
+ *	       supported
+ *
+ * This function takes care of everything for you:
+ *
+ * - creates and initializes the I3C bus
+ * - populates the bus with static I2C devs if @parent->of_node is not
+ *   NULL
+ * - registers all I3C devices added by the controller during bus
+ *   initialization
+ * - registers the I2C adapter and all I2C devices
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_register(struct i3c_master_controller *master,
+			struct device *parent,
+			const struct i3c_master_controller_ops *ops,
+			bool secondary)
+{
+	return i3c_master_register_fwnode(master, parent,
+					  parent->of_node ?
+					  of_fwnode_handle(parent->of_node) : NULL,
+					  ops, secondary);
+}
 EXPORT_SYMBOL_GPL(i3c_master_register);
 
 /**
@@ -3412,6 +3520,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 
 	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
 }
+EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
 
 /**
  * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 4d2a68793324..32c686ae5d62 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -627,9 +627,18 @@ DEFINE_FREE(i3c_master_dma_unmap_single, void *,
 
 int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
 				       u8 old_dyn_addr);
+int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
+			    struct i3c_ccc_cmd *cmd);
+bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
+				 const struct i3c_ccc_cmd *cmd);
 int i3c_master_set_info(struct i3c_master_controller *master,
 			const struct i3c_device_info *info);
 
+int i3c_master_register_fwnode(struct i3c_master_controller *master,
+			       struct device *parent,
+			       struct fwnode_handle *fwnode,
+			       const struct i3c_master_controller_ops *ops,
+			       bool secondary);
 int i3c_master_register(struct i3c_master_controller *master,
 			struct device *parent,
 			const struct i3c_master_controller_ops *ops,
@@ -752,4 +761,12 @@ void i3c_for_each_bus_locked(int (*fn)(struct i3c_bus *bus, void *data),
 int i3c_register_notifier(struct notifier_block *nb);
 int i3c_unregister_notifier(struct notifier_block *nb);
 
+enum i3c_addr_slot_status
+i3c_bus_get_addr_slot_status(struct i3c_bus *bus, u16 addr);
+
+void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
+				  enum i3c_addr_slot_status status);
+
+void i3c_bus_maintenance_lock(struct i3c_bus *bus);
+void i3c_bus_maintenance_unlock(struct i3c_bus *bus);
 #endif /* I3C_MASTER_H */
-- 
2.25.1

