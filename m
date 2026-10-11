Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3142B431E47
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724527; cv=none; b=tGbY27YRnKgtKB4cNZD0PhcnRnlQ6wgl7D8/8x7gTe2Q7fGGwaQ2sU8WRGiDLGymALI5nv/Reu1Llb9qLI6LKBnqFBdyScaqzJ8OvCC9wD9iNpLVxaXtylEUjHjMVbzi0mLm3s1dIzcBDEoaBg7oH+x3fHdU6kKnJbNt0IMCdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724527; c=relaxed/simple;
	bh=9B9X/gIi5DrIUQeFLc+juPsb6YF4O294TU63QHC/mw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oqAscP0rnERTTuwXUKKnSeusmUiyplosdWaCfHeDHYXvQD6PGF/nLX8eQHVb+hXVAlzW3byRBuFiSxxsPrrwdidV0L6ishMTva8+PZ/k6BJaHWqljWsItX26bJRk/BjkJ0OynXzor3YfRHw9r6gxhtATqCKuWEZiBsD1/uFtzo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+qjTGbr; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+qjTGbr"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afb0d2a586so1966391a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791724523; x=1792329323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6tSFeETOL0w0YG7EtJiKwNHh1JrtAxAwON5yzkpP6k=;
        b=P+qjTGbrEVSI9Z/xYVdhSc2Kkt6fxjlTjlSBBUtd5+0Mv6yQXzoeXRP0aB9p11/mNq
         LaQx0FmnZw4/NyUwrU9PqXkMLATPQC4iUnGiz2sSyVQSbWUTQR4wqkzWlLFLliEo8nBe
         bRAJmOTKKrHBkhlNcUxQ9hGU25aGC0r/Di1Ma8xUw0rzj0WVMiUiK0AQrs+cXnWzxswN
         ZXIPKHMml9i/oviTeAg8XbNzhfnAFVnqXvOvZ8vRcsemURSVfm4QsWGSyUCR+EQE85iX
         DhfK1c9216QYJM5xvyOwBAM5PubOAotmSoGnQiDxSF40FR8OMEAtJB2xeqLk4r9EXGyR
         JV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791724523; x=1792329323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6tSFeETOL0w0YG7EtJiKwNHh1JrtAxAwON5yzkpP6k=;
        b=yIhfxJaTiqA3ptM84qPkDYvjSdn3w/e4cc3VcUelZ2Bx7omeHd0Yt71s4/bGsthaQ9
         sVpzs8nhojy9GbD6xU4mFfmWps5d7Tx/JDr2tAzx1wRiZUzys+fQN02X7UnOpoRH1YRs
         40Jx4nniI0fqe+yx+SmGT1PAZ25HJN2HISPSlDIsMAnUEcxZfRxaVxcg2dAKEkfYDie/
         WO8H1dd8IJZtM2jLFSGozUAZ1J1UL6z9hKlX83+RCjW5b8yyQgvCkEl4BgOiWs87vN5V
         UwYiHjyqkH8/NqIuLifOUyWm9qkVAGW8auU9WBi3AO392548P9a6shh0Hf0hLcVOcyVE
         HkRg==
X-Forwarded-Encrypted: i=1; AKwUvBzrgzl2UTJWICVtGvdYC3LK+nsz/3MSGfLPRLhSgJ4jgiZdiYqGkmYCRjrpRrpmMxBHrOI1HFhDuSsq+6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaoD2yYyJegyWxYuRP9V4mILGbMYUxEigc+R1tER3QK6fiubN5
	2CWjwkt0v8SL0+0OHB6mwBTTuo0ycRCaGLvASqkVQOdZNuIGpbk4yvYl
X-Gm-Gg: AYBFou3wPEI9OJXkBLl1Ogwd5njxBGFbYwa60jZgjuMfc1PXjImgs/KD3jxadvjnCrm
	oYTINfF80WLMWerNufqmioZozCX5O0+BIOXYIH49vSi5+S78Fsmc2ANvO7eAaJ+5loCHE5qwAs3
	DPW5ysHPDV84jVIko5P8CfbE/g9haHJliK8E/Yz6seA1ZXFWdRlNi4row9d7quw8yFzeePYggV/
	jNIXUyGfpgH4iUXyzpj2wo4lccD2TtFj44FbvgN3G4uJ1iuNVu26sSiVIxBCwP4PAvMh49PTg9Q
	nqECkMRgAzC+PGcYlStF+2alctwZOcVJ1Hd1jOBcabe06rok4PHvsZT6mgEhsM7RKj8r/ZN2fSY
	TLQFijBAS9wMDET5mtrpzi65FCbLwt70JDNUlXULA/wBK+v6CM3owEYMRXYXCdU4mrOWOBuFUYf
	j2QCMZYfutD272D00SXhkPMVSW436w70aPp3UVyDqBc6QiKyLhX3/tDBguWzuw9re92J6RjYuc3
	5h1IYxcTyxwtXE=
X-Received: by 2002:a05:6402:24a5:b0:6a7:ee55:dcc9 with SMTP id 4fb4d7f45d1cf-6b17c29d39dmr6011742a12.24.1791724523262;
        Sun, 11 Oct 2026 06:15:23 -0700 (PDT)
Received: from pythagoras.home ([178.226.135.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1aaec1b9dsm1026665a12.0.2026.10.11.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:15:22 -0700 (PDT)
From: Eduardo Ruiz Duarte <toorandom@gmail.com>
To: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	djrscally@gmail.com
Cc: andriy.shevchenko@linux.intel.com,
	heikki.krogerus@linux.intel.com,
	tian.shu.qiu@intel.com,
	lixu.zhang@intel.com,
	linux-media@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduardo Ruiz Duarte <toorandom@gmail.com>
Subject: [PATCH] media: ipu-bridge: hold a reference on the IVSC software node
Date: Sun, 11 Oct 2026 15:15:18 +0200
Message-ID: <20261011131518.48838-1-toorandom@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu_bridge_instantiate_ivsc() attaches the IVSC software node to the mei-csi
device with set_secondary_fwnode(), but never takes a reference on it, while
the driver core unconditionally drops one when that device goes away.

device_add() calls software_node_notify(), which does a kobject_get() on the
swnode behind dev_fwnode(dev). device_del() calls
software_node_notify_remove(), which does the matching kobject_put() -- and
that put sits *outside* the "if (swnode->managed)" block, so it runs for every
device whose fwnode is a software node, managed or not:

	sysfs_remove_link(&swnode->kobj, dev_name(dev));
	sysfs_remove_link(&dev->kobj, "software_node");
	kobject_put(&swnode->kobj);

	if (swnode->managed) {
		set_secondary_fwnode(dev, NULL);
		kobject_put(&swnode->kobj);
	}

csi_dev is the mei-csi device, which the MEI client bus has already added by
the time ipu_bridge_instantiate_ivsc() runs. The add-side get therefore never
happens for this node, but the del-side put always does.

On hardware where the MEI bus resets -- which it does on every s2idle and S4
resume on a Dell XPS 13 9340 -- mei-csi is destroyed and recreated each cycle,
so the node loses one reference per resume. INTC10CF-N starts at 3: one for its
own registration plus one for each of its two port children, since
kobject_add() of a child takes a reference on the parent. The third resume
therefore frees it, software_node_find_by_name() starts returning NULL, and
isys walks the fwnode graph into freed memory:

  refcount_t: addition on 0; use-after-free
  WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x7e/0xb0
   kobject_get+0x94/0xb0
   software_node_graph_get_port_parent+0x89/0xd0
   fwnode_graph_get_port_parent+0x70/0xd0
   fwnode_graph_get_endpoint_by_id+0x93/0x280
   isys_notifier_init+0x92/0x180 [intel_ipu6_isys]
   isys_register_devices+0x3c9/0x4e0 [intel_ipu6_isys]
   isys_probe+0x3df/0x500 [intel_ipu6_isys]
   auxiliary_bus_probe+0x4c/0x70
   ...
   deferred_probe_work_func+0xa5/0x110

followed by an underflow and a saturate on the same kobject, and the camera
never comes back.

Take a reference so the attachment owns one, balancing the put the core will do
when csi_dev is destroyed. Where csi_dev is never destroyed this leaks a single
kobject reference, which is what the lifetime of the node already assumes.

Found while making the camera survive hibernation on a Dell XPS 13 9340
(ov02c10 behind an INTC10CF IVSC); with suspend-then-hibernate the first cycle
burns two resumes, so the failure consistently showed up on the second
hibernation. Tested on 7.0.0-1015-oem: two consecutive hibernations with the
node alive throughout and no refcount warnings, where before the second one
hung the machine.

Signed-off-by: Eduardo Ruiz Duarte <toorandom@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -765,6 +765,15 @@
 	if (!fwnode)
 		return -ENODEV;
 
+	/*
+	 * Balance the kobject_put() that software_node_notify_remove() will do
+	 * on this node when csi_dev is destroyed. That put is unconditional,
+	 * while the matching get in software_node_notify() only happens at
+	 * device_add() time -- and csi_dev was added before we got here, so it
+	 * never ran for this node.
+	 */
+	fwnode_handle_get(fwnode);
+
 	set_secondary_fwnode(sensor->csi_dev, fwnode);
 
 	return 0;
-- 
2.51.0
