Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C848BD4E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936064; cv=none; b=ISHBjNnWcEQrOSWFySWuF/u+Bj6buvMZP28RNeKuXej3MG0+Ywn83zHu08o19OEbETe/P4HiWusUUhfwgwo8x2bl20eIOQG/G6dBOr3KXY/9ZAmkimWu2mJEHjV3jsm9geb6IjIJeyZRO1ryL8ewit3pz8LmsgavRkbej49IZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936064; c=relaxed/simple;
	bh=YrkDArRhG03sP5kSOLoSfdtFFFUykzFm24clUJVset0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEVGfdN6oJqWHT8LGJssA2zJS7SOSn558GzF6z5ymcdWpcXlS2kEAshrcpySTYO4NKIrVSIV/GS3VFyChtXrxCzzusolwPlHiZuI7Db/W0vd3L0owDKal8Ui1jSY7WCjfH24Gps6ijuVnrmNQyLxi+AyW0cRZOdlnzOjxo95WPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abEEZqI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abEEZqI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9511F000FF;
	Fri,  2 Oct 2026 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936063;
	bh=WcOD9A1CC73k4wIK5W/U6AqVvv6v46pN4dfMaWdFWZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=abEEZqI5U+my13RL/qmZEahB6MUi79MhhXw0+7TGoVDkK0yCXQ4Kcvmy2U4A2rARv
	 2Fv8f3XnwkqQkbhExqNnTltB6bCfb6HNOnJi5fXJRwvFGxzhT/TnfwJrrkGqTduDNh
	 9xZ42rIr+30DM7qjBfQ585k9LakjTMYNBOnpdg4Pz9IaJHEGfG+848e3hML3BDqLaM
	 WdNUgxwI5PfFHcPbqq0uenNLOH5juC8Z5xUVAPlo/y+dDnTd+XCtYYGE0IyNik6U6E
	 Tkh7RkUPFCab8tr2GZA2r+mWxlFL6xbS9sz32USDnKlB0aAm4lWYWUB7Ky1GNOfItL
	 vGUHcWNUQiSXQ==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 8/9] nvmem: remove duplicated reference counting
Date: Fri,  2 Oct 2026 11:13:51 +0100
Message-ID: <20261002101352.1084447-9-srini@kernel.org>
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

Commit c1de7f43bd84 ("nvmem: use kref") introduced reference counting
with kref to an already reference counted nvmem_device structure. We
only need one refcount so use the one provded by device's kobject and
drop the kref field from struct nvmem_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/core.c      | 80 +++++++++++++++++----------------------
 drivers/nvmem/internals.h |  1 -
 2 files changed, 34 insertions(+), 47 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 19edc9ab0282..8f4f65139966 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -535,24 +535,6 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
-static void nvmem_release(struct device *dev)
-{
-	struct nvmem_device *nvmem = to_nvmem_device(dev);
-
-	ida_free(&nvmem_ida, nvmem->id);
-	gpiod_put(nvmem->wp_gpio);
-	kfree(nvmem->ops);
-	kfree(nvmem);
-}
-
-static const struct device_type nvmem_provider_type = {
-	.release	= nvmem_release,
-};
-
-static const struct bus_type nvmem_bus_type = {
-	.name		= "nvmem",
-};
-
 static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
 {
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
@@ -571,6 +553,25 @@ static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 		nvmem_cell_entry_drop(cell);
 }
 
+static void nvmem_release(struct device *dev)
+{
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	gpiod_put(nvmem->wp_gpio);
+	nvmem_device_remove_all_cells(nvmem);
+	ida_free(&nvmem_ida, nvmem->id);
+	kfree(nvmem->ops);
+	kfree(nvmem);
+}
+
+static const struct device_type nvmem_provider_type = {
+	.release	= nvmem_release,
+};
+
+static const struct bus_type nvmem_bus_type = {
+	.name		= "nvmem",
+};
+
 static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 {
 	scoped_guard(mutex, &nvmem_mutex)
@@ -918,6 +919,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->dev.type = &nvmem_provider_type;
 	nvmem->dev.bus = &nvmem_bus_type;
 	nvmem->dev.parent = config->dev;
+	INIT_LIST_HEAD(&nvmem->cells);
 	nvmem->ops = ops;
 
 	device_initialize(&nvmem->dev);
@@ -931,8 +933,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_put_device;
 	}
 
-	kref_init(&nvmem->refcnt);
-	INIT_LIST_HEAD(&nvmem->cells);
 	nvmem->fixup_dt_cell_info = config->fixup_dt_cell_info;
 
 	ops->reg_read = config->reg_read;
@@ -993,20 +993,20 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (config->cells) {
 		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
 		if (rval)
-			goto err_remove_cells;
+			goto err_remove_compat;
 	}
 
 	if (config->add_legacy_fixed_of_cells) {
 		rval = nvmem_add_cells_from_legacy_of(nvmem);
 		if (rval)
-			goto err_remove_cells;
+			goto err_remove_compat;
 	}
 
 	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
 
 	rval = device_add(&nvmem->dev);
 	if (rval)
-		goto err_remove_cells;
+		goto err_remove_compat;
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
@@ -1032,8 +1032,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #endif
 err_remove_dev:
 	device_del(&nvmem->dev);
-err_remove_cells:
-	nvmem_device_remove_all_cells(nvmem);
+err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
 	put_device(&nvmem->dev);
@@ -1042,21 +1041,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 }
 EXPORT_SYMBOL_GPL(nvmem_register);
 
-static void nvmem_device_release(struct kref *kref)
-{
-	struct nvmem_device *nvmem;
-
-	nvmem = container_of(kref, struct nvmem_device, refcnt);
-
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
-
-	nvmem_sysfs_remove_compat(nvmem);
-
-	nvmem_device_remove_all_cells(nvmem);
-	nvmem_destroy_layout(nvmem);
-	device_unregister(&nvmem->dev);
-}
-
 /**
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
@@ -1064,8 +1048,15 @@ static void nvmem_device_release(struct kref *kref)
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	if (nvmem)
-		kref_put(&nvmem->refcnt, nvmem_device_release);
+	if (!nvmem)
+		return;
+
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+
+	nvmem_sysfs_remove_compat(nvmem);
+	nvmem_destroy_layout(nvmem);
+
+	device_unregister(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
@@ -1126,8 +1117,6 @@ static struct nvmem_device *nvmem_device_match(void *data,
 		return ERR_PTR(-EINVAL);
 	}
 
-	kref_get(&nvmem->refcnt);
-
 	return nvmem;
 }
 
@@ -1243,9 +1232,8 @@ EXPORT_SYMBOL_GPL(devm_nvmem_device_put);
  */
 void nvmem_device_put(struct nvmem_device *nvmem)
 {
-	put_device(&nvmem->dev);
 	module_put(nvmem->owner);
-	kref_put(&nvmem->refcnt, nvmem_device_release);
+	put_device(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_device_put);
 
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..2c3645a27272 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -19,7 +19,6 @@ struct nvmem_device {
 	int			stride;
 	int			word_size;
 	int			id;
-	struct kref		refcnt;
 	size_t			size;
 	bool			read_only;
 	bool			root_only;
-- 
2.53.0

