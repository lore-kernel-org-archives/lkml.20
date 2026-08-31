Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE952480DC3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184993; cv=none; b=TaMRAuwfcS/gBWyV2pGF3qy2CZc6o7XA6KukegkKFwFSHqAlw+iOv9Gr9nTxGhoOsIMJ6yV3zABFnwHwPcAv72YYZSaQblKHivSmHeh7uZhHA1pPZDybnyXBxfkyyIbJ6lEGgNpxnkAPtEEumsuAW3TehBdruLIl2tLXlpYnllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184993; c=relaxed/simple;
	bh=+gc0pWN60wqj2qnk1kKnjo/gdXf5HK5doecPBdlNOik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2/gxJeivNMmDjHSN/mq1InTSehlIjGfXp157DuQURGQYqGguv1FwBUS/aSafy8znu6HFcr8ZtzJOrBRX+we3kq0d1Q3/Ovuy0jeEs40Uaf8K0UtkK3SsIHyAcckn9j6iVFybl1JCIeqCE7NoH62ymLSzp8yscEuMlkigxN+aqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dx4RThvb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx4RThvb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso28399485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184990; x=1788789790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6AX1MbXuyaka9uH0IjDSsOUW1ps0MxOUibXyKckmV0=;
        b=Dx4RThvbGG0JkG2nEYc3oWf61Y27YUxyJSVGNZ7Rf2Tq2OoLTerccHVvNuNEBHQi1P
         2bgMqzNGLjIeopxoND2ia3QYZ0H6sBR2jolL8Ht5cIjz3hVw4J4aUMhMzxU3nNAILiTo
         BONZEgJsi25ouCiLebsOAdkbf60wFA3RafPi/CVpGCFcqdNB5iyP1q2V6SOYEEJfar7B
         ID9lWIPb6Zi1qcJ4Bzv6gwjQEfrptaaSC0TCEpJjMHeoqCaapwfFvy30jMrPQwfaerX7
         SBimFhkQ0eKqwKNRXicBabAo3wFcwIJL6HpL9x2qtvoCSGYNUVR83ESJfsD1ICZwj6eI
         0erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184990; x=1788789790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6AX1MbXuyaka9uH0IjDSsOUW1ps0MxOUibXyKckmV0=;
        b=TR1ysIzLLbsp4SJNrPe81Z5x8avew0RRMt13zl82exCpl9GQaIaOVCm46G4jukMDYa
         SxuKXHzqp0gHwvtqs2NeukF+0F6qxPx2U3HOU0MNkFyj3ZkGlG6YU/QUVgfWpdIWJPWF
         DtgJHBSV7qx1BS6Mx8dMtWTYV424oAnnEqvcu+CIQwuZoC+3CAzRcaQnn+e4mao9FjCj
         eUIXhiiJ53qcNcpdc3gt85ALBFhFNLs7FwMyxoq35JLFKk7rgHAYxpaRChsuGe7Sbbrf
         MpmV5gx3oQZKeqY2bBCO0D7Da9h5oKs4YfE9COXxOgNQ04ZqRgxJn8M0XqF0S4GZKx8h
         8l1A==
X-Forwarded-Encrypted: i=1; AHgh+Rpn9b6WMV5jARdprymdlHEQbrCWWtaKIE28PndFaj14Q9yTVOaUDVx6DM5bvYuYED/LNNWmJwHOvCy80p0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXF1QZ8p81BULD4O3+FVcM70oU/WMJQKVtgAUYJTW6PozghYjC
	vT9e2CubQjFBHvtMGdjosViLUNfC/y4U40r6Ai8E6aqVkI3PUWqvSMw=
X-Gm-Gg: AR+sD10UrP9W1bQ67Jh5v0KrEpKJe3j2Hq9f8MWF4kc+NIyKb0cOH0DhOGYn/xebct+
	7hauuks9zdNTp9NUsvsYEYsBirH2WyEMmYxEt8p6ufrpEeasGFaVwtK7QgegLaD0KDgds+MPSoc
	r/unDCRdBgMXDsmkwHjG7htvKW5D7AKpd1iN0RypwuOomuZy91Vl5GZnnzUvHHHecn7iYOHr9D2
	20vzGX1X1L6FkVn/XE0UnyoKHmqr111ROqeCFARP8oYbPM1czspNZGXtb7cCgVGQMdKK3U7heka
	h5kL8VoT0WoFizUseNLwl9B5PDPa37uzn8v2C5Tg1twX/z6UoVfm40GsdFCOjkffLir3D8ULD0X
	cOZ/EF2KNR70UA9kpCTSLsVrK/+hp2Gp84lQxYtRttDcvt+r3tRgyIeG6bsyk3VuSRiun1Id1FR
	zXSm9a7GgY5z2Dm3crVH0Hw70wJt7bkVQ0J9jeYaY7NuyjpMGu18ovpBMasc70lcekk7B7aDaI+
	CGv94snB5oyniuCOao7o5xwCTOND0RToCr8xXfPw+UR
X-Received: by 2002:a05:600c:699a:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49cd5312c62mr164142885e9.2.1788184989594;
        Mon, 31 Aug 2026 07:03:09 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm173851415e9.2.2026.08.31.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:03:09 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH v2 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Mon, 31 Aug 2026 16:03:03 +0200
Message-ID: <20260831140304.45940-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831140304.45940-1-dmanresa@gmail.com>
References: <20260831094257.29398-1-dmanresa@gmail.com>
 <20260831140304.45940-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes registered by ipu_bridge_init() are deliberately
never unregistered, and the intended design is for a rebind to reuse
the already registered nodes. That reuse path however only exists for
the case where the IPU device kept its secondary fwnode link, which the
fwnode graph check at the top of ipu_bridge_init() detects: then the
function returns early. When the link is gone, ipu_bridge_init()
unconditionally registers the IPU HID software node again, which fails
with -EEXIST on the sysfs name (the node from the previous bind is
still registered) and the IPU driver fails to probe.

That is exactly what happens when the IPU PCI device is removed and
re-scanned: device_del() unsets the ACPI companion, and
set_primary_fwnode(dev, NULL) then clears the ACPI fwnode's ->secondary
pointer, so the fwnode graph check on the next probe finds no endpoints
and falls through to registration. Observed on a Surface Pro 7+ (IPU6):

  echo 1 > /sys/bus/pci/devices/0000:00:05.0/remove
  modprobe -r intel_ipu6_isys intel_ipu6   # ipu-bridge unloads too
  echo 1 > /sys/bus/pci/rescan
  modprobe intel_ipu6

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6: probe of 0000:00:05.0 failed with error -17

after which the cameras are unusable until reboot.

Add the missing reuse path: if the IPU software node is already
registered, look it up with software_node_find_by_name(), point the
device's secondary fwnode at it and return success. That is all a
rebind needs: the sensor, IVSC and VCM links live on devices that
survive an IPU unbind, so nothing has cleared those.

software_node_find_by_name() takes a reference on the node it returns;
drop it right away since the node is kept alive by its never dropped
registration.

Assisted-by: LLM

Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 4de42ed..6fa1c3c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -930,6 +930,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
+	const struct software_node *ipu_node;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -940,6 +941,29 @@ int ipu_bridge_init(struct device *dev,
 	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
 		return 0;
 
+	/*
+	 * The software nodes registered by a previous ipu_bridge_init() call
+	 * are deliberately kept registered when the module is unloaded, and
+	 * the sensors' ACPI fwnodes still have them as their secondary
+	 * fwnodes. If the IPU software node is already registered this is a
+	 * rebind, e.g. after the PCI device was removed and re-scanned,
+	 * which drops the IPU's secondary fwnode link. Registering the nodes
+	 * again would fail with -EEXIST, so instead reuse them and just
+	 * restore the IPU's secondary fwnode link.
+	 */
+	ipu_node = software_node_find_by_name(NULL, IPU_HID);
+	if (ipu_node) {
+		fwnode = software_node_fwnode(ipu_node);
+		set_secondary_fwnode(dev, fwnode);
+		/*
+		 * The node stays registered, it does not need the reference
+		 * software_node_find_by_name() took to stay alive.
+		 */
+		fwnode_handle_put(fwnode);
+		dev_dbg(dev, "Reusing the previously registered software nodes\n");
+		return 0;
+	}
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for IVSC to become ready\n");
-- 
2.43.0

