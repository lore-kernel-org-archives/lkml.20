Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E04A49BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465992; cv=none; b=u4ggDd8cnzB/uWvHGFUW9vr673b4Mn4ODOYM3r6JSj4F9vcfjj2qo9Vg0fRYy4DaZGVjq8tUv3UgcWZlXSVVt55kS06CSLz5R/inQAv+FzIgcZoLlLG53eDYKeliwJI0qVBLd/F2t9lVF8OEhx/CeCGWLjCKvei4N+uJnslMpYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465992; c=relaxed/simple;
	bh=8ZTTcvJ6pMLKzEcbB5RE4trvo0lhMVk+f9x9P8nhzcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etB0JL8EqiCqzQ0Rw95eAOZV2KjC/JC/06ttJEhnNy/+fFyO+PbhwkVoccVDswElZ6f4KrKkS9Q/98UEHnFs40ez5AlCGNBYU48wq2cTwKNFgqYWBu+aWLaVc341eY8Y784Zjv1Tmu0qYD09TOeLYog9YscspsFk/S/04xWWXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiL4VIJ9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiL4VIJ9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-487048857f6so2629535f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465981; x=1792070781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrpJoFjsD8GO+k4lY1Fdpbp0OUi5skMrml0Ia9JAUZI=;
        b=iiL4VIJ994jRrTAiZGGgHpZJspiZw152bX5+z/8ax35ZudBs3/6mHU2MhiCZqj8IXn
         jtIc52a5B77xTJSjnO+gUHWn+gVexdngXH+27pJmibyBbM60ovxr/sGjSKqTYLWSBw/9
         qARvKe8y4ITQ+qJ8rEqevXkVXGDN0AZsdcSSQWxPN0/TPBEWQz//a1vR4o5Zl/3rmhdm
         ldOvEvEa/XT+vmhKP7RqWCAvVE30Yo4wL07lkdz/Gh/Z9tMPoIzsovkoyQ3jKIBTTE7H
         tfaZYpa7AQmvzOZLFDPnoZY+ocMuhVuKNYmd8L77vZS0pGtZHXqNza5Y4EeNULDWYG8z
         sXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465981; x=1792070781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrpJoFjsD8GO+k4lY1Fdpbp0OUi5skMrml0Ia9JAUZI=;
        b=KD2lXK4yE9pTVAL3zeCD+CL1HhlroFvDnU1/l/o8IyFNMQseKAFPjXP6jzQj8Jko2e
         uEdxgMgWNpjkcGJdptKXqJuWWVJw+hzRn/xeelEJ8sQ5frPjDdd9ptd63rYAe/ixpR4R
         tmdTqK8NHK74cOWsHQFSp9QjDqc0/Z8++zErOoA81B9Qul4lzfzIH+RSNZEB4Wxn6Bjr
         RH+R6YZHEOwkWp/IDoC4LMEQMwQvelMr2EtGERGIoR9q6oK4JADPCC9DL68RXlwi3TjK
         /v+4g/EW16cr5B1ogQzDWl2Um1tJ7zTBPkNLIMCQFjZbtMs20TjAWkqJlH/I16zxa+bK
         OOlw==
X-Forwarded-Encrypted: i=1; AKwUvByP8wwKiwvkanIvE6BEVZHLvF0MZOuH5n7nJowt0MUvaVdzP40oQAvsE0fj/CoUbQ0w/j+xAe/26Ghm9S8=@vger.kernel.org
X-Gm-Message-State: AFuF++kfaooG0A+KjwH8fqx6DgIssNqU8YgQwL0VEtXWNJnCkqjChVp+
	sRxUW+UYPAEpHz5zTlgHwrsLtqlu1TXyntP8HM9B2SGBjy9GzZ9Wfa8=
X-Gm-Gg: AYBFou3EmzJVxW/jYT0GSqA4ZlxPUtNQQg2M6BYQkIqPfOXZyhNX5kGZfeQk4r5oVxN
	Cl8ZEo19RHmmsEd/TT+RzIe37l+49aiVxJ1vCROgt4rFfOsNbzTmzTsUZC4CWWTRm9N4Zogvbcy
	KPfICObturx2tiBZE6s2sZuvi+roeBxOO6KH9V+nnghfO0T7R63h1cjI4t4T3/9qxBrViwflahn
	89u1Ix4mwwaPVhn+lKqYO+1aQMEfc+7z97BKS8iQoK6hUaYUT4ZwOlzafvKvwiFb7fuJnjlUZnQ
	7HYrTZh/TWLfVEZf43/yXG+pbxOFTtQpM73NcFg+uySh6lEvfhfhcUiyIzBsDzOI1iV1IiX8atG
	MQKcsiVr6+mNjUiibUKTUBBHtkJPw2g47Crb66X4Prg3b7hU8g27yeX5OODIHt5O44gnQUFUiyA
	CstLF5Ef2DyfPo2eF9tBr/nFU1PhrXARnwnCQ8GI+pe5OtDYp3n1qfHN4GlvJ/stwFCYpvwRTGr
	um0U2BRKRKutv8vQQoK9XK25eAFUhLcJ5DW5kFAeNPtLE5/uCP4sI4=
X-Received: by 2002:a05:600c:154a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18043b5fcmr98401565e9.16.1791465981008;
        Thu, 08 Oct 2026 06:26:21 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a349bsm71479105e9.2.2026.10.08.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:26:19 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Thu,  8 Oct 2026 15:26:14 +0200
Message-ID: <20261008132614.2456716-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008132614.2456716-1-dmanresa@gmail.com>
References: <20261008132614.2456716-1-dmanresa@gmail.com>
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
index b9779c3..f0fadc0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -1099,6 +1099,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
+	const struct software_node *ipu_node;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -1109,6 +1110,29 @@ int ipu_bridge_init(struct device *dev,
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

