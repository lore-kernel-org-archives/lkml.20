Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E15948CD7F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936066; cv=none; b=CtFfP/xOkpl8XvVb6RQ0PgFr2jGgC0F/6LHmd0ESp3KHlDAw87WTrEe4jzG0FcDSO4Qd1KZX6qdVaez1Mqw9a0csodgnCZQH19J8B2UiiPP3g7Xq3J6jG8FKrqMi3o3kiDyk94CU+IhNNV/3NZJzTNxqdfY6KpSgrt4DdnVoVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936066; c=relaxed/simple;
	bh=0QePxZNL6Jte+OE0yi8WBRwTSwskGD5NLUUjq3ayQIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifkYuHZI9ppjYXB2t38+NWjp2QVIBjro+vB+D+znIgkmPxMRniYt0YT1SU1tdBsXcGvB6zRimW48CGIqKyq86OrcYKIkO3f+UdngzARhj0gJYp7TXp35SsAGAJCcjCfDHPECsDHFhED5E8F7ulF7qMhSgZw+Ux5FJ/pWasUcTQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEqgVQ8A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEqgVQ8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8428E1F0089C;
	Fri,  2 Oct 2026 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936064;
	bh=Yq8ejhA0IS8TdxqLNzywYDdyxibLKoh0oK1/PLAFCnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OEqgVQ8A9nr2vv2viQGKO4r7sqRTnivvq4NQd6rkBVACjJ+BxxewaNXNQKTbwuQAs
	 ifhScvm4o93ixj7skEEogKdm28y+YG0ixzdrCwILT/KiaDSzJWtptyz91a01FTZ19q
	 vTYMINC0DVN8lG5KzOklflCD/IJiaOh08AQM46d7f7b5fBUGn1Z8E/MjOma8WEnQbJ
	 fZk8AKwHUJ0InLjbA6mOdHvXbxiUjYO4UiGIHtBawSMbADkwxnvRYgKB56kyPKvbV+
	 nbPuS3d3SCtFtExpoRhnXMj0IwHhulGA9Sd6HgrNjEBEQkYCuq/OrUsUSWJqBGq7Fb
	 ZsMbLG0qn4Bdg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 9/9] nvmem: protect nvmem_device::ops with SRCU
Date: Fri,  2 Oct 2026 11:13:52 +0100
Message-ID: <20261002101352.1084447-10-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

With the provider-owned data split out into a separate 'ops' structure,
we can now protect it with SRCU.

Protect all dereferences of nvmem->ops with an SRCU read lock.
Synchronize SRCU in nvmem_unregister() after setting the implementation
pointer to NULL. This has the effect of numbing down the device after
nvmem_unregister() returns - it will no longer accept any consumer calls
and return -ENODEV. The actual device will live on for as long as there
are references to it but we will no longer reach into the consumer's
memory which may be gone by this time.

Nvmem cell entries are destroyed in .release() now as they may be still
dereferenced via the nvmem_cell handles after nvmem_release(). The
actual calls will still go through SRCU and fail with -ENODEV if the
provider is gone.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/core.c      | 44 +++++++++++++++++++++++++++++++++------
 drivers/nvmem/internals.h |  4 +++-
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 8f4f65139966..0a7a9e8fa1a4 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -57,7 +57,12 @@ static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			    void *val, size_t bytes)
 {
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
 	if (!ops->reg_read)
 		return -EOPNOTSUPP;
@@ -68,9 +73,14 @@ static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			     void *val, size_t bytes)
 {
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops;
 	int ret, wr_ok;
 
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
+
 	if (!ops->reg_write)
 		return -EOPNOTSUPP;
 
@@ -289,7 +299,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
 
 	umode_t mode = 0400;
 
@@ -333,7 +343,7 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
 
 	/*
 	 * If the device has no .reg_write operation, do not allow
@@ -560,7 +570,7 @@ static void nvmem_release(struct device *dev)
 	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
-	kfree(nvmem->ops);
+	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
 
@@ -920,7 +930,20 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->dev.bus = &nvmem_bus_type;
 	nvmem->dev.parent = config->dev;
 	INIT_LIST_HEAD(&nvmem->cells);
-	nvmem->ops = ops;
+
+	/*
+	 * Must happen before we assign the release() callback in
+	 * device_initialize().
+	 */
+	rval = init_srcu_struct(&nvmem->srcu);
+	if (rval) {
+		ida_free(&nvmem_ida, nvmem->id);
+		kfree(ops);
+		kfree(nvmem);
+		return ERR_PTR(rval);
+	}
+
+	rcu_assign_pointer(nvmem->ops, ops);
 
 	device_initialize(&nvmem->dev);
 
@@ -1035,7 +1058,10 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
+	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
+	synchronize_srcu(&nvmem->srcu);
 	put_device(&nvmem->dev);
+	kfree(ops);
 
 	return ERR_PTR(rval);
 }
@@ -1048,13 +1074,19 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
+	struct nvmem_operations *ops;
+
 	if (!nvmem)
 		return;
 
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
+	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
+	synchronize_srcu(&nvmem->srcu);
+
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
+	kfree(ops);
 
 	device_unregister(&nvmem->dev);
 }
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 2c3645a27272..bc7a99f5aefb 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/srcu.h>
 
 /* Hold pointers to callbacks owned by the nvmem provider module. */
 struct nvmem_operations {
@@ -16,6 +17,7 @@ struct nvmem_operations {
 struct nvmem_device {
 	struct module		*owner;
 	struct device		dev;
+	struct srcu_struct	srcu;
 	int			stride;
 	int			word_size;
 	int			id;
@@ -33,7 +35,7 @@ struct nvmem_device {
 	unsigned int		nkeepout;
 	struct gpio_desc	*wp_gpio;
 	struct nvmem_layout	*layout;
-	struct nvmem_operations	*ops;
+	struct nvmem_operations __rcu *ops;
 	void *priv;
 	bool			sysfs_cells_populated;
 };
-- 
2.53.0

