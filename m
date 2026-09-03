Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347853E168F;
	Thu,  3 Sep 2026 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416486; cv=none; b=aMUsIDrYqUiGvn7wJ2gcTIuoy2yXoxHXOhZJJ5YWCbwEmRakS8s2RxGpoSAFILLGcQ9qMwb1F7aioHjw/14vf/M0j1itaFLUxZcR77szdEgpnU4pJRelAXO/nw+ZvG6LkWK4t4gA6tFqLxQnZjmuk+O/qxXQEVu3hE3SeDWgGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416486; c=relaxed/simple;
	bh=ob43G58GOcy2q73A+pu3SKP9O+LCh4RMVTHE0gDYYlE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k7MUVOsht6lZelBX0K+7Ck1RGJwH0MPod8r1GjMaw6sz5W1LAUxJqz9Yrl50YlyE8Obw3Vi1htQH/bfku6d+KO462Cxao0dR7Apaunjj/rg+Rfd95uNNlKIoK/5BxUa1XawbHJEe76pBePrag9VJ9qc4IXtBd5Q5udtgjamLTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8E0A41A036E;
	Thu,  3 Sep 2026 08:21:22 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2CB321A023A;
	Thu,  3 Sep 2026 08:21:22 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BAAC9180006C;
	Thu,  3 Sep 2026 14:21:20 +0800 (+08)
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
Subject: [PATCH v18 2/8] i3c: master: Add controller-only device operation helpers
Date: Thu,  3 Sep 2026 11:51:02 +0530
Message-Id: <20260903062108.2712296-3-lakshay.piplani@nxp.com>
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

The generic I3C device attach and IBI paths perform both core-level
bookkeeping and controller-specific operations. An I3C hub, however,
maintains a logical device descriptor on the virtual downstream bus and
a separate parent-facing descriptor used by the physical parent
controller.

Add controller-only helpers that invoke the controller callbacks
without updating the bus device list, address-slot state, or generic IBI
lifecycle. This allows the hub framework to keep the logical descriptor
associated with the virtual controller while using a permanent
parent-facing descriptor for operations handled by the physical
controller.

Add helpers for:
  - attaching, reattaching, and detaching a device from a controller;
  - requesting and freeing controller IBI resources;
  - enabling and disabling IBIs at the controller;
  - recycling controller IBI slots.

Refactor the existing generic core paths to use these helpers, keeping
the current behaviour unchanged for regular I3C devices.

Also release the generic IBI workqueue and state when the controller
request callback fails.

The helpers are declared in the I3C internal header because they are
intended for use by the generic I3C hub framework rather than by
individual controller drivers.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v18:
 - Rebased onto v7.3-rc1; no intended driver behaviour changes

Changes in v17:
 - Document the calling context of i3c_dev_recycle_ibi_slot_controller():
   it runs in workqueue context without the bus lock held, while the 
   controller owns and synchronizes its IBI pool
 - Retain the request_ibi capability check to preserve the pre-series
   behaviour for regular I3C devices

Changes in v16:
 - Rename the controller-only device helpers with a "_locked" suffix to make
   the locking contract explicit (caller must hold the parent bus lock)
 - Route i3c_master_handle_ibi() through i3c_dev_recycle_ibi_slot_controller()
   instead of calling master->ops->recycle_ibi_slot() directly
 - Destroy the generic IBI workqueue when the controller request_ibi()
   callback fails, avoiding a workqueue leak on the request error path

Changes in v15:
 - Rework the patch to introduce controller-only attach, reattach and detach
   helpers for use by the I3C hub core
 - Add controller-only helpers for requesting, freeing, enabling, disabling
   and recycling IBI resources
---
---
 drivers/i3c/internals.h |  14 +++
 drivers/i3c/master.c    | 239 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 225 insertions(+), 28 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86a36b951e0d..416c37e2f75a 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -22,6 +22,20 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
 int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev,
 			    struct i3c_xfer *xfers,
 			    int nxfers, enum i3c_xfer_mode mode);
+
+int i3c_master_attach_i3c_dev_controller_locked(struct i3c_dev_desc *dev);
+int i3c_master_reattach_i3c_dev_controller_locked(struct i3c_dev_desc *dev,
+						  u8 old_dyn_addr);
+void i3c_master_detach_i3c_dev_controller_locked(struct i3c_dev_desc *dev);
+
+int i3c_dev_disable_ibi_controller_locked(struct i3c_dev_desc *dev);
+int i3c_dev_enable_ibi_controller_locked(struct i3c_dev_desc *dev);
+int i3c_dev_request_ibi_controller_locked(struct i3c_dev_desc *dev,
+					  const struct i3c_ibi_setup *req);
+void i3c_dev_free_ibi_controller_locked(struct i3c_dev_desc *dev);
+void i3c_dev_recycle_ibi_slot_controller(struct i3c_dev_desc *dev,
+					 struct i3c_ibi_slot *slot);
+
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9ea4726495ff..b864fcbb1a59 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1898,6 +1898,30 @@ static int i3c_master_get_i3c_addrs(struct i3c_dev_desc *dev)
 	return -EBUSY;
 }
 
+/**
+ * i3c_master_attach_i3c_dev_controller_locked() - Attach device state to
+ *						   controller
+ * @dev: I3C device descriptor
+ *
+ * Invoke the current controller's attach callback without changing address
+ * slot state or adding the device to the controller's device list.
+ *
+ * Context: The caller must hold the bus lock.
+ *
+ * Return: 0 on success, or a negative error code returned by the controller.
+ */
+int i3c_master_attach_i3c_dev_controller_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	/* Do not attach the master device itself. */
+	if (master->this != dev && master->ops->attach_i3c_dev)
+		return master->ops->attach_i3c_dev(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_attach_i3c_dev_controller_locked);
+
 static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 				     struct i3c_dev_desc *dev)
 {
@@ -1915,12 +1939,10 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 		return ret;
 
 	/* Do not attach the master device itself. */
-	if (master->this != dev && master->ops->attach_i3c_dev) {
-		ret = master->ops->attach_i3c_dev(dev);
-		if (ret) {
-			i3c_master_put_i3c_addrs(dev);
-			return ret;
-		}
+	ret = i3c_master_attach_i3c_dev_controller_locked(dev);
+	if (ret) {
+		i3c_master_put_i3c_addrs(dev);
+		return ret;
 	}
 
 	list_add_tail(&dev->common.node, &master->bus.devs.i3c);
@@ -1928,6 +1950,31 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
 	return 0;
 }
 
+/**
+ * i3c_master_reattach_i3c_dev_controller_locked() - Reattach controller
+ *						     device state
+ * @dev: I3C device descriptor
+ * @old_dyn_addr: Previous dynamic address
+ *
+ * Invoke the current controller's reattach callback without modifying the
+ * controller's address-slot state.
+ *
+ * Context: The caller must hold the bus lock.
+ *
+ * Return: 0 on success, or a negative error code returned by the controller.
+ */
+int i3c_master_reattach_i3c_dev_controller_locked(struct i3c_dev_desc *dev,
+						  u8 old_dyn_addr)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	if (master->ops->reattach_i3c_dev)
+		return master->ops->reattach_i3c_dev(dev, old_dyn_addr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev_controller_locked);
+
 /**
  * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with a new address
  * @dev: I3C device descriptor to reattach
@@ -1958,25 +2005,39 @@ int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
 						     I3C_ADDR_SLOT_FREE);
 	}
 
-	if (master->ops->reattach_i3c_dev) {
-		ret = master->ops->reattach_i3c_dev(dev, old_dyn_addr);
-		if (ret) {
-			i3c_master_put_i3c_addrs(dev);
-			return ret;
-		}
+	ret = i3c_master_reattach_i3c_dev_controller_locked(dev, old_dyn_addr);
+	if (ret) {
+		i3c_master_put_i3c_addrs(dev);
+		return ret;
 	}
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(i3c_master_reattach_i3c_dev_locked);
 
-static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
+/**
+ * i3c_master_detach_i3c_dev_controller_locked() - Detach device state from
+ *						   controller
+ * @dev: I3C device descriptor
+ *
+ * Invoke the current controller's detach callback without releasing address
+ * slots or removing the device from the controller's device list.
+ *
+ * Context: The caller must hold the bus lock.
+ */
+void i3c_master_detach_i3c_dev_controller_locked(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 
 	/* Do not detach the master device itself. */
 	if (master->this != dev && master->ops->detach_i3c_dev)
 		master->ops->detach_i3c_dev(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_master_detach_i3c_dev_controller_locked);
+
+static void i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	i3c_master_detach_i3c_dev_controller_locked(dev);
 
 	i3c_master_put_i3c_addrs(dev);
 	list_del(&dev->common.node);
@@ -3520,7 +3581,6 @@ static void i3c_master_handle_ibi(struct work_struct *work)
 	struct i3c_ibi_slot *slot = container_of(work, struct i3c_ibi_slot,
 						 work);
 	struct i3c_dev_desc *dev = slot->dev;
-	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 	struct i3c_ibi_payload payload;
 
 	payload.data = slot->data;
@@ -3529,7 +3589,7 @@ static void i3c_master_handle_ibi(struct work_struct *work)
 	if (dev->dev)
 		dev->ibi->handler(dev->dev, &payload);
 
-	master->ops->recycle_ibi_slot(dev, slot);
+	i3c_dev_recycle_ibi_slot_controller(dev, slot);
 	if (atomic_dec_and_test(&dev->ibi->pending_ibis))
 		complete(&dev->ibi->all_ibis_handled);
 }
@@ -3640,6 +3700,29 @@ i3c_generic_ibi_alloc_pool(struct i3c_dev_desc *dev,
 }
 EXPORT_SYMBOL_GPL(i3c_generic_ibi_alloc_pool);
 
+/**
+ * i3c_dev_recycle_ibi_slot_controller() - Recycle an IBI slot through
+ *					   the current controller
+ * @dev: I3C device descriptor
+ * @slot: IBI slot to recycle
+ *
+ * Invoke the current controller's IBI slot recycling callback.
+ *
+ * Context: Called from the generic IBI work handler in workqueue context.
+ * No bus lock is taken here: the controller owns its IBI pool and is
+ * responsible for synchronizing access to it. The generic pool
+ * implementation uses its own spinlock.
+ */
+void i3c_dev_recycle_ibi_slot_controller(struct i3c_dev_desc *dev,
+					 struct i3c_ibi_slot *slot)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	if (master->ops->recycle_ibi_slot)
+		master->ops->recycle_ibi_slot(dev, slot);
+}
+EXPORT_SYMBOL_GPL(i3c_dev_recycle_ibi_slot_controller);
+
 /**
  * i3c_generic_ibi_get_free_slot() - Get a free slot from a generic IBI pool
  * @pool: the pool to query an IBI slot on
@@ -3951,6 +4034,32 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 }
 EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
 
+/**
+ * i3c_dev_disable_ibi_controller_locked() - Disable IBI in the controller
+ * @dev: I3C device descriptor
+ *
+ * Invoke the current controller's IBI disable callback without waiting for
+ * pending IBIs or updating the generic IBI enabled state.
+ *
+ * Context: The caller must serialize access to @dev->ibi and the generic
+ * IBI lifecycle.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int i3c_dev_disable_ibi_controller_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	if (!dev->ibi)
+		return -EINVAL;
+
+	if (!master->ops->disable_ibi)
+		return -EOPNOTSUPP;
+
+	return master->ops->disable_ibi(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_controller_locked);
+
 /**
  * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific device
  * @dev: device on which IBIs should be disabled
@@ -3963,14 +4072,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_do_xfers_locked);
  */
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 {
-	struct i3c_master_controller *master;
 	int ret;
 
-	if (!dev->ibi)
-		return -EINVAL;
-
-	master = i3c_dev_get_master(dev);
-	ret = master->ops->disable_ibi(dev);
+	ret = i3c_dev_disable_ibi_controller_locked(dev);
 	if (ret)
 		return ret;
 
@@ -3984,6 +4088,32 @@ int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
 
+/**
+ * i3c_dev_enable_ibi_controller_locked() - Enable controller IBI resources
+ * @dev: I3C device descriptor
+ *
+ * Invoke the current controller's IBI enable callback without updating the
+ * generic IBI enabled state.
+ *
+ * Context: The caller must serialize access to @dev->ibi and the generic
+ * IBI lifecycle.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int i3c_dev_enable_ibi_controller_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	if (!dev->ibi)
+		return -EINVAL;
+
+	if (!master->ops->enable_ibi)
+		return -EOPNOTSUPP;
+
+	return master->ops->enable_ibi(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_controller_locked);
+
 /**
  * i3c_dev_enable_ibi_locked() - Enable IBIs from a specific device (lock held)
  * @dev: device on which IBIs should be enabled
@@ -4000,13 +4130,9 @@ EXPORT_SYMBOL_GPL(i3c_dev_disable_ibi_locked);
  */
 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 {
-	struct i3c_master_controller *master = i3c_dev_get_master(dev);
 	int ret;
 
-	if (!dev->ibi)
-		return -EINVAL;
-
-	ret = master->ops->enable_ibi(dev);
+	ret = i3c_dev_enable_ibi_controller_locked(dev);
 	if (!ret)
 		dev->ibi->enabled = true;
 
@@ -4014,6 +4140,35 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev)
 }
 EXPORT_SYMBOL_GPL(i3c_dev_enable_ibi_locked);
 
+/**
+ * i3c_dev_request_ibi_controller_locked() - Request controller IBI resources
+ * @dev: I3C device descriptor
+ * @req: IBI setup request
+ *
+ * Invoke the current controller's IBI request callback without allocating the
+ * generic IBI object or workqueue. The caller must ensure that @dev->ibi has
+ * already been initialized.
+ *
+ * Context: The caller must serialize access to @dev->ibi and the generic
+ * IBI lifecycle.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+int i3c_dev_request_ibi_controller_locked(struct i3c_dev_desc *dev,
+					  const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	if (!dev->ibi)
+		return -EINVAL;
+
+	if (!master->ops->request_ibi)
+		return -EOPNOTSUPP;
+
+	return master->ops->request_ibi(dev, req);
+}
+EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_controller_locked);
+
 /**
  * i3c_dev_request_ibi_locked() - Request an IBI
  * @dev: device for which we should enable IBIs
@@ -4056,8 +4211,15 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 	ibi->num_slots = req->num_slots;
 
 	dev->ibi = ibi;
-	ret = master->ops->request_ibi(dev, req);
+	ret = i3c_dev_request_ibi_controller_locked(dev, req);
 	if (ret) {
+		/*
+		 * The controller request callback failed, so tear down the
+		 * workqueue allocated above before freeing the IBI object.
+		 * This is the owner of the workqueue, so it must destroy it
+		 * here to avoid leaking it on the error path.
+		 */
+		destroy_workqueue(ibi->wq);
 		kfree(ibi);
 		dev->ibi = NULL;
 	}
@@ -4066,6 +4228,27 @@ int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 }
 EXPORT_SYMBOL_GPL(i3c_dev_request_ibi_locked);
 
+/**
+ * i3c_dev_free_ibi_controller_locked() - Free controller IBI resources
+ * @dev: I3C device descriptor
+ *
+ * Invoke the current controller's IBI free callback without destroying the
+ * generic IBI workqueue or freeing @dev->ibi.
+ *
+ * Context: The caller must serialize access to @dev->ibi and the generic
+ * IBI lifecycle.
+ */
+void i3c_dev_free_ibi_controller_locked(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(dev);
+
+	if (!dev->ibi)
+		return;
+
+	master->ops->free_ibi(dev);
+}
+EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_controller_locked);
+
 /**
  * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handling
  * @dev: device on which you want to release IBI resources
@@ -4096,7 +4279,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
 			dev_err(&master->dev, "Failed to disable IBI before freeing\n");
 	}
 
-	master->ops->free_ibi(dev);
+	i3c_dev_free_ibi_controller_locked(dev);
 
 	if (dev->ibi->wq) {
 		destroy_workqueue(dev->ibi->wq);
-- 
2.25.1

