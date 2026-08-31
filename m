Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A41E3E00B5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169385; cv=none; b=a/6OwV171Xp+fvxGsUxe2fnvtgQ3JyAQ271/4HgX4Ohw4XWvSf4vkxpgDuD+3rAODdJUE9FS2wrvpBtmKOognBTBLICsNcm7GlKlE/+UeLVC21EunTW97BSy0yMOwSRKQDOS8iCAlw7E7YWkMeIApxf/2gQoKt236p3tX2z7IVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169385; c=relaxed/simple;
	bh=LuYj6EwIqV6NwexPQcbrO0D0onCO94TVcOKZPJJBWb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwq0yQT/nbVLhc9VnGz43rRUWl9U4W5NyzRO46lfXsg1Yn5tFGcSR9y9IVKqaN5q+lGebyI1FU+NBYv+u6pRHsSddwDJXEBRZfMgK4LjDhkxOT0+w5I4GHMPqUaGxbeR67Sb4R/Fa78N8EpsfrUXmuh2L9PfGz9OS+UliDO7GF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp9oxMo9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp9oxMo9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so23312785e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169382; x=1788774182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNQxdTkzGD83pNFUYAGZDFb9hsIN1sZQHskMcBDnWv4=;
        b=jp9oxMo9aphNlZnBGXpZTBVDAGlj83XN6Cu77NXc9JiuvHYqmQSYFb5zsNHVrn1kU5
         5zq1vR+vUNAhEPSIYn/bq5JtxU+isqQ8uB9G/3+1BEJn+9GzVLSgExs/CVwE6NTHXCh8
         cxc+fSV+r/kp7dqAGwLCj5I+M9OgMj/XmDcL1p228LmNY9GZaiG97ft8zHq+LBz0ptCz
         kkPvDQONtV4K3EaimDy4tCwyJDbgd8RTpvoWAi8IuJFAg38QuIcSN5SuUL4CIOv9B5KK
         aBsQJe8p1enkD/3xLzfKQv4INmvg/57rj85OAcdJaE3bgz2FCookRaW4vfxaaDx+xdup
         qFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169382; x=1788774182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNQxdTkzGD83pNFUYAGZDFb9hsIN1sZQHskMcBDnWv4=;
        b=RZL5lTewBaC0WeQEnwMt235VN0JTE9UGXGCBIv1IKrBIY8BZyaZCkHYhTjG2YiWGe+
         xz1Z4eB5u7gjG29a/gd1Fk3N2xeWF8hDNxXFNancp0bhtJj5sDLZPegbw219H1lOMGmo
         RUXtjYa9t24Jh/YcCm1eWAKil/WJRi4fFg7uGw6G29MH0TuR2/xNssUYdR51YgjtRwh/
         JRWgDNaGD5lGqpFncaPsO3qWcPkiwWt4K2hTxvldir8SYsKfhPM1DcZgp1SKz9QObjri
         0tXgCN4I7V9ku42PqPwa5Gkb/28UPfW8UCDvFtEOhOO6L0cg6DhmhKlIow0X89zyAF2x
         pDPA==
X-Forwarded-Encrypted: i=1; AHgh+RqN+LkX5kSBi/FFLwkPksc6aUfTovmJv3D2Q7binirUTtHCVihLZGwmT1UAV7DLMIqqHwtE2/sIhoHvydo=@vger.kernel.org
X-Gm-Message-State: AFuF++mwn6MiXdkctljUGXof8y+ypQMR2ATGpON+adPTRIaW18x/YsNU
	cLfAarLQHO9dD3SngqI2Qdz+G6a/1zNDDoG9oQMp/xAZAdqI2PMYjos=
X-Gm-Gg: AR+sD12puE3ww/ZZAS4fTT3QHgJwbQmNh70itjTrZapWOa9cxm2RftdvPvb1p4gyQM9
	6qtpVmapW9TOMjwMpOCqqD3RTetiWtQZHkk4WOviWOcodOOIZCD9HnEAnCIuRJAXe6LiFib9PRg
	mZrIDc0vSXG5uvRf53QvvPBnl4eoPVcrsFo+mkiyhwXz+t4BSbjl4agxO/wMxiGdAjbtCF8+vVK
	UnD6/Ta57QBHp4vRJPHCgZ/RP4i5CZh+tY6cgaC/kV528GWiOpJpKqPPyQz1uONcJn6jmw8Y/dU
	sFNGxvCE1273oj39Q0SDXNlbfxbDOBCALPRLY6CEslHQ10A2yfmgGRTyre/OwE7SZpE2CWm0PFB
	zmllXSWGmooKCto+7Yg0fqFFBH8rfGeuWH2SbVZkG/a+SA3jBvhxUpxYvrercjvaBoA4+XSV+1E
	v8FLc+ky21wXBBRneUMClTxrhkAhpQyUYvCEs56AjZVyXTI5eROenEaCtCzzR/yiZJFZ5pH9bv0
	t3FHA/5wxYCiPiP5atIF5h2qinAlxwYOaPduGVUrzx9
X-Received: by 2002:a05:600c:3b01:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49cd943d074mr34361125e9.8.1788169381375;
        Mon, 31 Aug 2026 02:43:01 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9267c369sm189932125e9.3.2026.08.31.02.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:43:00 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Mon, 31 Aug 2026 11:42:56 +0200
Message-ID: <20260831094257.29398-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831094257.29398-1-dmanresa@gmail.com>
References: <20260827232636.93145-1-dmanresa@gmail.com>
 <20260831094257.29398-1-dmanresa@gmail.com>
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
device's secondary fwnode at it and return success. Restoring the IPU's
secondary fwnode is all a rebind needs: the sensors' ACPI fwnodes still
carry their secondary fwnode pointers from the first bind (the sensor
devices are not removed by an IPU unbind, so nothing clears those), and
the IVSC and VCM links likewise live on devices that survive an IPU
rebind. The previous commit made the registered nodes self-contained in
the never freed bridge allocation, so their properties are still valid
here. The IVSC readiness check is intentionally skipped on this path,
as the IVSC links were already established by the first bind.

software_node_find_by_name() takes a reference on the node it returns;
drop it right away since the node is kept alive by its never dropped
registration, matching the reference handling of the initial-bind path.

Developed with the assistance of an AI tool (Claude)

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
+		dev_info(dev, "Reusing the previously registered software nodes\n");
+		return 0;
+	}
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for IVSC to become ready\n");
-- 
2.43.0

