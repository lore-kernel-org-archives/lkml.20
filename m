Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCF13D413C;
	Sun, 18 Oct 2026 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323154; cv=none; b=R51TiZ+ugPN1LLVZLQmo4j+H8p3YAGgZXvMDKo7GPYEzr2gRNobgIZ4ErIHULkUiC+BN1y4u6kYQcJMpztTY8E6Ahj2UNopFj9/TfpHv8y4v65RQjAWdOfaarF4RmNLrHAkfHQUSDS4zonn2bm0lgtyfBaHLkYm3J8y/DyAf5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323154; c=relaxed/simple;
	bh=MQq9ADgQWiGuQzkVEsBKp7U18zP2rrLono/lWeu/51g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHhk89JJxDfLA+SKdSOocWoWNTNi1FIXy8r+mHULySHqCXDdQb9biWW1UaFUHhcQ41dwnTGGuLF9fv0ediLTkrdOKACEfKq4jrnRHHtpoa5kcSQqhxpyLR/m3WgXSPlz/ExHLZGoemvN9M8jKWpTbQiqkgV6vOgOnvjQ4d7x5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn; spf=none smtp.mailfrom=stu.shzu.edu.cn; dkim=fail (0-bit key) header.d=stu.shzu.edu.cn header.i=@stu.shzu.edu.cn header.b=Jy60XXw/ reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.shzu.edu.cn header.i=@stu.shzu.edu.cn header.b="Jy60XXw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=ozqSh9JK1n
	yOMM8ypPRSDWtpdjXb18AAz1T8hQhdEdk=; b=Jy60XXw/uVfDeDncTgcUGy7CEB
	hbtUxoqfVsLmvzegQYlplS4dOZy8G4pFGYF28Bo1TsQUczUqdMILBcX5bS7W3AsM
	RPjaYEn0+UOEt2oC6voEHvDwkrQufUT59lsaJtM/V4iGy0xv9NAeHAEG9PhopMfK
	ZdhMRj8090L4qOBh4=
Received: from localhost.localdomain (unknown [36.148.174.64])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkAGSwA9rtRqes+zAA--.63473S2;
	Sun, 18 Oct 2026 19:32:14 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	YuanZhe Liu <25031212351@stu.xidian.edu.cn>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [RFC PATCH] media: dvb: retain selected USB parents until frontend release
Date: Sun, 18 Oct 2026 19:31:58 +0800
Message-ID: <20261018113158.1314-1-20221010117@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkAGSwA9rtRqes+zAA--.63473S2
X-Coremail-Antispam: 1UD129KBjvAXoWfWrW8XF13XFykur45uFyDJrb_yoW8tFyxZo
	WxKan3Ww4rJ3yjkryktF1DtFy2gws2ga15Ww43CFWDZFWxuFs8Jr43WwsxX3W8Wr4kKFs8
	t34DtrZxJw48JrWrn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYm7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
	x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE
	52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJV
	WUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAK
	I48JMxkF7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bwHUkUUUUU=
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAgUKCWrTkb1e9wADs7

An open frontend retains its frontend object, but fe->dvb points into
the allocation owned by its USB driver. Disconnect can free this parent
before the final frontend close accesses the adapter fields and locks.

Introduce an optional adapter reference and release callback. Hold an
adapter reference from frontend registration until final backend release
has completed, so an opting-in driver can retain its enclosing parent.
Keep the framework or probe reference while disconnect tears resources
down, and free the parent storage only after its final reference drops.

Enable this lifetime contract for GL861, ttusb-dec and GP8PSK. Balance
the USB device references and registration-error paths, including old
DVB-USB frontend cleanup if later initialization fails. Keep hardware
callbacks in their existing teardown contexts.

Local tracking: KERN-028, the GL861 frontend-close parent-lifetime
problem. This single patch consolidates the four previously reviewed
commits without changing their resulting source tree. The ttusb-dec
and GP8PSK changes address the same source-level lifetime gap in those
drivers. KERN-029 through KERN-032 remain separate investigation items:
their individual archived failures have not been conclusively linked
to this gap and are not claimed as fixed by this candidate.

This is a follow-up proposal for an already reported issue. The 2022
frontend series described the generic gap; its waiting-based core fix
was later reverted. Related old DVB-USB and as102 proposals also exist.
The reference here covers the complete frontend lifetime, including
the parent-adapter accesses performed by final frontend release.

https://lore.kernel.org/linux-media/20221117045925.14297-1-imv4bel@gmail.com/
https://lore.kernel.org/linux-media/20230609082238.3671398-1-mchehab@kernel.org/
https://lore.kernel.org/linux-media/20261015161134.10425-1-25031212351@stu.xidian.edu.cn/
https://lore.kernel.org/linux-media/20260805074220.7396-1-a0yami@mailbox.org/

Base: 6c377d19d4a5116d9bec5203aa3c6c11523e7898. This public reference
is not a recovered exact original crash binary. The original full SHA,
vmlinux and matching runtime configuration remain unavailable.

Validation of the unchanged source tree: independent application and
per-commit tree comparison passed; MC-enabled x86-64 built bzImage and
modules, and MC-disabled built the affected media directories. Both
make commands exited zero. The consolidated patch is checked again by
isolated application and comparison with that same compiled tree;
the prior actual compilation evidence is reused without a new build.
No crash reproducer, test kernel or candidate module has been run.

This unsigned RFC requests technical review of the parent-lifetime
approach alongside the related public proposals. Human DCO sign-off
has not been added; it remains to be supplied before merge submission.
---
 drivers/media/dvb-core/dvb_frontend.c       |  5 +++
 drivers/media/dvb-core/dvbdev.c             | 24 +++++++++++
 drivers/media/usb/dvb-usb-v2/dvb_usb.h      |  6 +++
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 44 ++++++++++++++++-----
 drivers/media/usb/dvb-usb-v2/gl861.c        |  1 +
 drivers/media/usb/dvb-usb/dvb-usb-common.h  |  1 +
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c     |  4 ++
 drivers/media/usb/dvb-usb/dvb-usb-init.c    | 26 ++++++++++--
 drivers/media/usb/dvb-usb/dvb-usb.h         |  6 +++
 drivers/media/usb/dvb-usb/gp8psk.c          |  1 +
 drivers/media/usb/ttusb-dec/ttusb_dec.c     | 31 ++++++++++++---
 include/media/dvbdev.h                      | 23 +++++++++++
 12 files changed, 153 insertions(+), 19 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 0286da57f..46b88ad75 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -94,6 +94,7 @@ static DEFINE_MUTEX(frontend_mutex);
 struct dvb_frontend_private {
 	/* thread/frontend values */
 	struct dvb_device *dvbdev;
+	struct dvb_adapter *adapter;
 	struct dvb_frontend_parameters parameters_out;
 	struct dvb_fe_events events;
 	struct semaphore sem;
@@ -135,6 +136,7 @@ static void dvb_frontend_invoke_release(struct dvb_frontend *fe,
 static void __dvb_frontend_free(struct dvb_frontend *fe)
 {
 	struct dvb_frontend_private *fepriv = fe->frontend_priv;
+	struct dvb_adapter *adapter = fepriv ? fepriv->adapter : NULL;
 
 	if (fepriv)
 		dvb_device_put(fepriv->dvbdev);
@@ -142,6 +144,7 @@ static void __dvb_frontend_free(struct dvb_frontend *fe)
 	dvb_frontend_invoke_release(fe, fe->ops.release);
 
 	kfree(fepriv);
+	dvb_adapter_put(adapter);
 }
 
 static void dvb_frontend_free(struct kref *ref)
@@ -3065,6 +3068,8 @@ int dvb_register_frontend(struct dvb_adapter *dvb,
 	init_waitqueue_head(&fepriv->events.wait_queue);
 	mutex_init(&fepriv->events.mtx);
 	fe->dvb = dvb;
+	if (dvb->release)
+		fepriv->adapter = dvb_adapter_get(dvb);
 	fepriv->inversion = INVERSION_OFF;
 
 	dev_info(fe->dvb->device,
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d3295..d1792912f 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -914,6 +914,7 @@ int dvb_register_adapter(struct dvb_adapter *adap, const char *name,
 	}
 
 	memset(adap, 0, sizeof(struct dvb_adapter));
+	kref_init(&adap->ref);
 	INIT_LIST_HEAD(&adap->device_list);
 
 	pr_info("DVB: registering new adapter (%s)\n", name);
@@ -943,10 +944,33 @@ int dvb_unregister_adapter(struct dvb_adapter *adap)
 	mutex_lock(&dvbdev_register_lock);
 	list_del(&adap->list_head);
 	mutex_unlock(&dvbdev_register_lock);
+	if (adap->release)
+		dvb_adapter_put(adap);
 	return 0;
 }
 EXPORT_SYMBOL(dvb_unregister_adapter);
 
+static void dvb_release_adapter(struct kref *ref)
+{
+	struct dvb_adapter *adap = container_of(ref, struct dvb_adapter, ref);
+
+	adap->release(adap);
+}
+
+struct dvb_adapter *dvb_adapter_get(struct dvb_adapter *adap)
+{
+	kref_get(&adap->ref);
+	return adap;
+}
+EXPORT_SYMBOL(dvb_adapter_get);
+
+void dvb_adapter_put(struct dvb_adapter *adap)
+{
+	if (adap)
+		kref_put(&adap->ref, dvb_release_adapter);
+}
+EXPORT_SYMBOL(dvb_adapter_put);
+
 /*
  * if the miracle happens and "generic_usercopy()" is included into
  * the kernel, then this can vanish. please don't make the mistake and
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb.h b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
index ecdc20d45..f364ca793 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb.h
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
@@ -11,6 +11,7 @@
 
 #include <linux/usb/input.h>
 #include <linux/firmware.h>
+#include <linux/kref.h>
 #include <media/rc-core.h>
 #include <media/media-device.h>
 
@@ -188,6 +189,8 @@ struct dvb_usb_adapter_properties {
  * @driver_name: name of the owning driver module
  * @owner: owner of the dvb_adapter
  * @adapter_nr: values from the DVB_DEFINE_MOD_OPT_ADAPTER_NR() macro
+ * @refcounted_adapters: retain parent storage until final frontend release;
+ *  requires frontends whose storage follows the DVB frontend reference count
  * @bInterfaceNumber: usb interface number driver binds
  * @size_of_priv: bytes allocated for the driver private data
  * @generic_bulk_ctrl_endpoint: bulk control endpoint number for sent
@@ -226,6 +229,7 @@ struct dvb_usb_device_properties {
 	const char *driver_name;
 	struct module *owner;
 	short *adapter_nr;
+	bool refcounted_adapters;
 
 	u8 bInterfaceNumber;
 	unsigned int size_of_priv;
@@ -354,6 +358,7 @@ struct dvb_usb_adapter {
 
 /**
  * struct dvb_usb_device - dvb usb device object
+ * @ref: parent storage reference count
  * @props: device properties
  * @name: device name
  * @rc_map: name of rc codes table
@@ -373,6 +378,7 @@ struct dvb_usb_adapter {
  *  in size_of_priv of dvb_usb_properties).
  */
 struct dvb_usb_device {
+	struct kref ref;
 	const struct dvb_usb_device_properties *props;
 	const char *name;
 	const char *rc_map;
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d2504..0c713d3da 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -19,6 +19,23 @@ module_param_named(force_pid_filter_usage, dvb_usb_force_pid_filter_usage,
 MODULE_PARM_DESC(force_pid_filter_usage,
 		"force all DVB USB devices to use a PID filter, if any (default: 0)");
 
+static void dvb_usbv2_release(struct kref *ref)
+{
+	struct dvb_usb_device *d = container_of(ref, struct dvb_usb_device, ref);
+
+	kfree(d->priv);
+	usb_put_dev(d->udev);
+	kfree(d);
+}
+
+static void dvb_usbv2_adapter_release(struct dvb_adapter *dvb_adap)
+{
+	struct dvb_usb_adapter *adap = container_of(dvb_adap,
+						struct dvb_usb_adapter, dvb_adap);
+
+	kref_put(&adap_to_d(adap)->ref, dvb_usbv2_release);
+}
+
 static int dvb_usbv2_download_firmware(struct dvb_usb_device *d,
 		const char *name)
 {
@@ -419,6 +436,11 @@ static void dvb_usbv2_media_device_unregister(struct dvb_usb_adapter *adap)
 {
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB
 
+	/* Adapter initialization may not have reached mutex_init() yet. */
+	if (!READ_ONCE(adap->dvb_adap.mdev))
+		return;
+
+	guard(mutex)(&adap->dvb_adap.mdev_lock);
 	if (!adap->dvb_adap.mdev)
 		return;
 
@@ -446,6 +468,10 @@ static int dvb_usbv2_adapter_dvb_init(struct dvb_usb_adapter *adap)
 	}
 
 	adap->dvb_adap.priv = adap;
+	if (d->props->refcounted_adapters) {
+		kref_get(&d->ref);
+		adap->dvb_adap.release = dvb_usbv2_adapter_release;
+	}
 
 	ret = dvb_usbv2_media_device_init(adap);
 	if (ret < 0) {
@@ -912,16 +938,17 @@ int dvb_usbv2_probe(struct usb_interface *intf,
 		goto err;
 	}
 
+	kref_init(&d->ref);
 	d->intf = intf;
 	d->name = driver_info->name;
 	d->rc_map = driver_info->rc_map;
-	d->udev = udev;
+	d->udev = usb_get_dev(udev);
 	d->props = driver_info->props;
 
 	if (intf->cur_altsetting->desc.bInterfaceNumber !=
 			d->props->bInterfaceNumber) {
 		ret = -ENODEV;
-		goto err_kfree_d;
+		goto err_put_d;
 	}
 
 	mutex_init(&d->usb_mutex);
@@ -933,14 +960,14 @@ int dvb_usbv2_probe(struct usb_interface *intf,
 			dev_err(&d->udev->dev, "%s: kzalloc() failed\n",
 					KBUILD_MODNAME);
 			ret = -ENOMEM;
-			goto err_kfree_d;
+			goto err_put_d;
 		}
 	}
 
 	if (d->props->probe) {
 		ret = d->props->probe(d);
 		if (ret)
-			goto err_kfree_priv;
+			goto err_put_d;
 	}
 
 	if (d->props->identify_state) {
@@ -994,10 +1021,8 @@ int dvb_usbv2_probe(struct usb_interface *intf,
 	dvb_usbv2_exit(d);
 	if (d->props->disconnect)
 		d->props->disconnect(d);
-err_kfree_priv:
-	kfree(d->priv);
-err_kfree_d:
-	kfree(d);
+err_put_d:
+	kref_put(&d->ref, dvb_usbv2_release);
 err:
 	dev_dbg(&udev->dev, "%s: failed=%d\n", __func__, ret);
 	return ret;
@@ -1021,8 +1046,7 @@ void dvb_usbv2_disconnect(struct usb_interface *intf)
 	if (d->props->disconnect)
 		d->props->disconnect(d);
 
-	kfree(d->priv);
-	kfree(d);
+	kref_put(&d->ref, dvb_usbv2_release);
 
 	pr_info("%s: '%s:%s' successfully deinitialized and disconnected\n",
 		KBUILD_MODNAME, drvname, devname);
diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index 0538170cc..f9c54f9bd 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -212,6 +212,7 @@ static struct dvb_usb_device_properties gl861_props = {
 	.driver_name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
 	.adapter_nr = adapter_nr,
+	.refcounted_adapters = true,
 
 	.size_of_priv = sizeof(struct gl861),
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-common.h b/drivers/media/usb/dvb-usb/dvb-usb-common.h
index 70f4eedd7..98ae30666 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-common.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb-common.h
@@ -30,6 +30,7 @@ int dvb_usb_download_firmware(struct usb_device *udev,
 			      const struct dvb_usb_device_properties *props);
 
 extern int dvb_usb_device_power_ctrl(struct dvb_usb_device *d, int onoff);
+void dvb_usb_adapter_release(struct dvb_adapter *dvb_adap);
 
 extern int usb_urb_init(struct usb_data_stream *stream, struct usb_data_stream_properties *props);
 extern int usb_urb_exit(struct usb_data_stream *stream);
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 029dad86a..341051fe5 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -154,6 +154,10 @@ int dvb_usb_adapter_dvb_init(struct dvb_usb_adapter *adap, short *adapter_nums)
 		goto err;
 	}
 	adap->dvb_adap.priv = adap;
+	if (adap->dev->props.refcounted_adapters) {
+		kref_get(&adap->dev->ref);
+		adap->dvb_adap.release = dvb_usb_adapter_release;
+	}
 
 	ret = dvb_usb_media_device_init(adap);
 	if (ret < 0) {
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 6d2672bcc..ebe29501e 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -23,6 +23,23 @@ static int dvb_usb_force_pid_filter_usage;
 module_param_named(force_pid_filter_usage, dvb_usb_force_pid_filter_usage, int, 0444);
 MODULE_PARM_DESC(force_pid_filter_usage, "force all dvb-usb-devices to use a PID filter, if any (default: 0).");
 
+static void dvb_usb_release(struct kref *ref)
+{
+	struct dvb_usb_device *d = container_of(ref, struct dvb_usb_device, ref);
+
+	kfree(d->priv);
+	usb_put_dev(d->udev);
+	kfree(d);
+}
+
+void dvb_usb_adapter_release(struct dvb_adapter *dvb_adap)
+{
+	struct dvb_usb_adapter *adap = container_of(dvb_adap,
+						struct dvb_usb_adapter, dvb_adap);
+
+	kref_put(&adap->dev->ref, dvb_usb_release);
+}
+
 static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 {
 	struct dvb_usb_adapter *adap;
@@ -111,6 +128,7 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 	return 0;
 
 frontend_init_err:
+	dvb_usb_adapter_frontend_exit(adap);
 	dvb_usb_adapter_dvb_exit(adap);
 dvb_init_err:
 	dvb_usb_adapter_stream_exit(adap);
@@ -148,8 +166,7 @@ static int dvb_usb_exit(struct dvb_usb_device *d)
 	if (d->priv != NULL && d->props.priv_destroy != NULL)
 		d->props.priv_destroy(d);
 
-	kfree(d->priv);
-	kfree(d);
+	kref_put(&d->ref, dvb_usb_release);
 	return 0;
 }
 
@@ -284,6 +301,8 @@ int dvb_usb_device_init(struct usb_interface *intf,
 		return -ENOMEM;
 	}
 
+	kref_init(&d->ref);
+	d->udev = usb_get_dev(udev);
 	memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties));
 
 	desc = dvb_usb_find_device(udev, &d->props, &cold);
@@ -301,7 +320,6 @@ int dvb_usb_device_init(struct usb_interface *intf,
 	}
 
 	info("found a '%s' in warm state.", desc->name);
-	d->udev = udev;
 	d->desc = desc;
 	d->owner = owner;
 
@@ -321,7 +339,7 @@ int dvb_usb_device_init(struct usb_interface *intf,
 
  error:
 	usb_set_intfdata(intf, NULL);
-	kfree(d);
+	kref_put(&d->ref, dvb_usb_release);
 	return ret;
 }
 EXPORT_SYMBOL(dvb_usb_device_init);
diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 550006a8d..c1b9c90d8 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -15,6 +15,7 @@
 #include <linux/usb.h>
 #include <linux/firmware.h>
 #include <linux/mutex.h>
+#include <linux/kref.h>
 #include <media/rc-core.h>
 
 #include <media/dvb_frontend.h>
@@ -249,6 +250,8 @@ enum dvb_usb_mode {
  * @priv_destroy: just like priv_init, only called before deallocating
  * the memory pointed by private field of struct dvb_usb_device.
  *
+ * @refcounted_adapters: retain parent storage until final frontend release;
+ *  requires frontends whose storage follows the frontend reference count.
  * @num_adapters: the number of adapters in @adapters
  * @adapter: the adapters
  * @power_ctrl: called to enable/disable power of the device.
@@ -293,6 +296,7 @@ struct dvb_usb_device_properties {
 	int (*priv_init)(struct dvb_usb_device *);
 	void (*priv_destroy)(struct dvb_usb_device *);
 
+	bool refcounted_adapters;
 	int num_adapters;
 	struct dvb_usb_adapter_properties adapter[MAX_NO_OF_ADAPTER_PER_DEVICE];
 
@@ -428,6 +432,7 @@ struct dvb_usb_adapter {
 
 /**
  * struct dvb_usb_device - object of a DVB USB device
+ * @ref: parent allocation lifetime reference count
  * @props: copy of the struct dvb_usb_properties this device belongs to.
  * @desc: pointer to the device's struct dvb_usb_device_description.
  * @state: initialization and runtime state of the device.
@@ -459,6 +464,7 @@ struct dvb_usb_adapter {
  *  in size_of_priv of dvb_usb_properties).
  */
 struct dvb_usb_device {
+	struct kref ref;
 	struct dvb_usb_device_properties props;
 	const struct dvb_usb_device_description *desc;
 
diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
index 96a255500..b36c709e1 100644
--- a/drivers/media/usb/dvb-usb/gp8psk.c
+++ b/drivers/media/usb/dvb-usb/gp8psk.c
@@ -337,6 +337,7 @@ static struct dvb_usb_device_properties gp8psk_properties = {
 
 	.size_of_priv = sizeof(struct gp8psk_state),
 
+	.refcounted_adapters = true,
 	.num_adapters = 1,
 	.adapter = {
 		{
diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a38759..900513641 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -17,6 +17,7 @@
 #include <linux/crc32.h>
 #include <linux/init.h>
 #include <linux/input.h>
+#include <linux/kref.h>
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
@@ -88,6 +89,7 @@ struct dvb_filter_pes2ts {
 };
 
 struct ttusb_dec {
+	struct kref ref;
 	enum ttusb_dec_model		model;
 	char				*model_name;
 	char				*firmware_name;
@@ -1452,6 +1454,21 @@ static int ttusb_dec_init_stb(struct ttusb_dec *dec)
 	return 0;
 }
 
+static void ttusb_dec_release(struct kref *ref)
+{
+	struct ttusb_dec *dec = container_of(ref, struct ttusb_dec, ref);
+
+	usb_put_dev(dec->udev);
+	kfree(dec);
+}
+
+static void ttusb_dec_adapter_release(struct dvb_adapter *adapter)
+{
+	struct ttusb_dec *dec = container_of(adapter, struct ttusb_dec, adapter);
+
+	kref_put(&dec->ref, ttusb_dec_release);
+}
+
 static int ttusb_dec_init_dvb(struct ttusb_dec *dec)
 {
 	int result;
@@ -1647,6 +1664,7 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 		return -ENOMEM;
 	}
 
+	kref_init(&dec->ref);
 	usb_set_intfdata(intf, (void *)dec);
 
 	switch (id->idProduct) {
@@ -1663,7 +1681,7 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 		break;
 	}
 
-	dec->udev = udev;
+	dec->udev = usb_get_dev(udev);
 
 	result = ttusb_dec_init_usb(dec);
 	if (result)
@@ -1675,6 +1693,8 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 	if (result)
 		goto err_stb;
 
+	kref_get(&dec->ref);
+	dec->adapter.release = ttusb_dec_adapter_release;
 	dec->adapter.priv = dec;
 	switch (id->idProduct) {
 	case 0x1006:
@@ -1692,10 +1712,10 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 		       le16_to_cpu(dec->udev->descriptor.idVendor),
 		       le16_to_cpu(dec->udev->descriptor.idProduct));
 	} else {
+		dec->fe->frontend_priv = NULL;
 		if (dvb_register_frontend(&dec->adapter, dec->fe)) {
 			printk("budget-ci: Frontend registration failed!\n");
-			if (dec->fe->ops.release)
-				dec->fe->ops.release(dec->fe);
+			dvb_frontend_detach(dec->fe);
 			dec->fe = NULL;
 		}
 	}
@@ -1715,7 +1735,8 @@ static int ttusb_dec_probe(struct usb_interface *intf,
 err_stb:
 	ttusb_dec_exit_usb(dec);
 err_usb:
-	kfree(dec);
+	usb_set_intfdata(intf, NULL);
+	kref_put(&dec->ref, ttusb_dec_release);
 	return result;
 }
 
@@ -1736,7 +1757,7 @@ static void ttusb_dec_disconnect(struct usb_interface *intf)
 		ttusb_dec_exit_dvb(dec);
 	}
 
-	kfree(dec);
+	kref_put(&dec->ref, ttusb_dec_release);
 }
 
 static void ttusb_dec_set_model(struct ttusb_dec *dec,
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index e5a00d126..deb6ff26f 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -23,6 +23,7 @@
 #include <linux/poll.h>
 #include <linux/fs.h>
 #include <linux/list.h>
+#include <linux/kref.h>
 #include <media/media-device.h>
 
 #define DVB_MAJOR 212
@@ -78,6 +79,10 @@ struct dvb_frontend;
 /**
  * struct dvb_adapter - represents a Digital TV adapter using Linux DVB API
  *
+ * @ref:		Optional adapter lifetime reference count
+ * @release:		Optional callback for the final adapter reference. Set it
+ *			after registration and before publishing any frontends,
+ *			and keep it unchanged until the final reference is dropped.
  * @num:		Number of the adapter
  * @list_head:		List with the DVB adapters
  * @device_list:	List with the DVB devices
@@ -103,6 +108,8 @@ struct dvb_frontend;
  * @conn_pads:		pointer to struct media_pad associated with @conn;
  */
 struct dvb_adapter {
+	struct kref ref;
+	void (*release)(struct dvb_adapter *adap);
 	int num;
 	struct list_head list_head;
 	struct list_head device_list;
@@ -244,6 +251,22 @@ int dvb_register_adapter(struct dvb_adapter *adap, const char *name,
  */
 int dvb_unregister_adapter(struct dvb_adapter *adap);
 
+/**
+ * dvb_adapter_get - Take a reference to a reference-counted adapter
+ * @adap: adapter with a release callback and an already held reference
+ *
+ * The driver must keep the adapter and its enclosing allocation alive until
+ * the release callback runs. Frontends retain this reference until their
+ * final release; other adapter users need their own lifetime protection.
+ */
+struct dvb_adapter *dvb_adapter_get(struct dvb_adapter *adap);
+
+/**
+ * dvb_adapter_put - Drop an adapter reference, calling release on the last one
+ * @adap: adapter returned by dvb_adapter_get(), or NULL
+ */
+void dvb_adapter_put(struct dvb_adapter *adap);
+
 /**
  * dvb_register_device - Registers a new DVB device
  *
-- 
2.47.3

