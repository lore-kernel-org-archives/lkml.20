Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379DA443A86
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292301; cv=none; b=eFZzWkxoiYxStCjQv6fcbX6QYni6mIDn8touHt2GyFeAZyNRLcAqJrytLUFJaQri6bOkbwhR0u0gNiQdIVxduoN5fmtRK/oKh6LUZnsRcgbJKkgbbrhPfmfsDiRqFlPHR3HXd6cWWNDTaf55kYHqvA0bXYuXu5sJQC+NXmk4G5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292301; c=relaxed/simple;
	bh=jngS6x+tIf4czuIBq+LweYf0mEUL/modiUynUQ9e7Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJPlluqoEwFkqyq/IQSc2HNfNGUFiYQNcI4hCRErgcAWD49X9HfMn2/mEBB6WgeSVL2uA5SGlzzT0uVuQ0dmhfQCWpfFWAnq7ulUxfT0+8tDyTnL3nsaxrBmo2cIj4he6sRLa6Xql3FfGTP6fUeJ6RSV8+XeIfyoEtdfH4/d13A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICd/UeuP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICd/UeuP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso1293435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788292297; x=1788897097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xYO5+e2rLJr7nQr6IUR30t9mLQPc96NvTA35d5T/wc=;
        b=ICd/UeuP2/+rdRQMeAR884JF6BdAwGHiGEU2hEcYaF5cdmsytMZ6upS2FbK8Zzjf5I
         HI0a40LqUPO/IC9AMmKeNfPj4JCOUrtvuWZIvm9oblUKMOtsH0Hdr+99TPJwDyXQTpja
         Yqr/8AxORd/bjiCv9UyHpiqlzW+5ytkSOkOXzMd4iTBaY3xQqS5LGNLWW50TTHQB6PnW
         LRZCSe8gEU8eOXOQLdjpBHPe5pzNdnE/6t9c1XaXxdwY+/aOvRD199z7sx2UI5/FP6w8
         L1oCaLsjCAq6jRFy9PV8QlaNXj/q+cJWs4kxHvxOSCw9tKRFeE7rnrPPJsklL3qe2T41
         38KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292297; x=1788897097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xYO5+e2rLJr7nQr6IUR30t9mLQPc96NvTA35d5T/wc=;
        b=Uo/89Gf9ZZWiGu0T25DCxolm7ACPpeERNFrdfrj5xfVVfFVB+IlLjyUc00CQygiiMv
         uvKGq0OUfsg+ANf+slB1zadCiKbviYhZUa2Uw3TfboFp9xZCvyJBnB58CGE7qTePhLNf
         NCRQ4WMeMJXmjEAsCk1j+92eXxsSudVvGcT0Dutt7FVGOxpcbE1pQNSMPeejlFTx+PrK
         pyXqdyjIrGig0q3ZxRnEIui8ZRi+hnqxUhYWLjKZeFd3io9x9ipw8JyK9O+o7PxZHAmZ
         NNxfkXFcSYROv5fls7cj3pw84kCgq6ip0GdeoLPiTx9JqDk4G1CrvBuimvpNbBd2w3QX
         liaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZlA5LqgEzWA2QHMz0wtEii9mbRozmGtJ8cD61U8bD+6XHN2nQW9s7N/cveyfavMDfKrQ3WzPBotaQIpI=@vger.kernel.org
X-Gm-Message-State: AFuF++kwD/QpCdHl+6i8yEV6laxUJUtj/rzz0o64wyQ1v1XD1vpJwfSa
	Y5V/X509xObgHKUIWC9UODryxdtkIa7Cdzx6wZqhd/p8JOFi3gAHNkE=
X-Gm-Gg: AR+sD12vybyKO0JTBJXPkbLG8MXxI/e/5raEo/7zY4HB17TiZhHlQYlinWX0JlqOt6b
	69sLW7EPPLE8Yv+R5XAuEeGWsvL9DV6snvBx1d3UlrVeY15Hcud5BK2GvVjjO7XPtYpcVhCMQHs
	9yweL4qU63pH8qHOWfaX5rvoqKphM2zAziWrKSoEZeg7EzbRJcuvpx5fxPuqqcjBEJiZ4Y4bJHS
	8pOZ8ukyAIRCxIF+M83dnVDoT1ZWjLsR8Ce0/W5zPvFw7oNqVLz+XnfD+lknOL/W3FB/So7yqdP
	OxRs5gZF/R3Om0LcLOVs5gVBvARNIdB8fGkn47tFap2VrXejegMZ4hE6lS+ReHe7Fswcy0v+1gi
	h7vFyqX3rwa9A4ge2CfOn3VCrgmYkKdM3DhqPmyG9x80EABVO58/9SR71ZqT7xsZVSToOAHrRYe
	u3iVVGKe3fLBJTZRci6IDa5MFKPpWHRXlVxB/8EU9whb+ByoPiIl5W+LqsO3fWhsm+V+ggwsjBw
	JtpmP7p5ISeDc1H0C1iT/2oGJFnRXXKRUJ3xmxUIsYYKAs54WcTvPtDZICXexV1Vzt4lE7P+g==
X-Received: by 2002:a05:600c:a086:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49ce5815dddmr66415e9.11.1788292297027;
        Tue, 01 Sep 2026 12:51:37 -0700 (PDT)
Received: from chateau ([148.69.202.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm5567285e9.0.2026.09.01.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:51:36 -0700 (PDT)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Sergey Zagursky <gvozdoder@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Tue,  1 Sep 2026 20:50:36 +0100
Message-ID: <20260901195036.7648-1-gvozdoder@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901194526.6369-1-gvozdoder@gmail.com>
References: <20260901194526.6369-1-gvozdoder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU
bridge driver") the internal camera no longer works on laptops where the
sensor sits behind an IVSC, for example a Dell XPS 16 9640 (IPU6,
INTC10CF, ov02c10):

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras
  ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: mei-csi probed
      without device fwnode!

No sensor subdevice is registered, the media graph has no sensor entity
and userspace finds no camera at all.

ipu_bridge_get_ivsc_csi_dev() first looks for the platform device named
"intel_vsc" and returns its mei-csi child. That device is created by
mei_vsc, which on this machine only appears once the LJCA USB bridge and
its SPI controller have probed, about a second after the IPU6 probe that
runs the bridge:

  07:59:29.297  platform INTC10CF:00 created (ACPI scan)
  07:59:41      intel-ipu6 probe -> ipu_bridge_init()
  07:59:42.391  platform intel_vsc created (mei_vsc)

The commit above added two fallbacks for CVS which match on the ACPI
companion alone. They are reached for every entry of ivsc_acpi_ids[],
IVSC IDs included. The IVSC ACPI device has two physical nodes:

  INTC10CF:00/physical_node  -> platform/INTC10CF:00  (no driver bound)
  INTC10CF:00/physical_node1 -> platform/intel_vsc    (mei_vsc)

so bus_find_device_by_acpi_dev(&platform_bus_type, adev) returns the bare
platform device. ipu_bridge_instantiate_ivsc() then attaches the IVSC
software node to that device instead of to the mei-csi client, the bridge
reports success, and the probe is never retried. mei_csi later probes
without a fwnode, the CSI-2 link is never described, and the sensor ACPI
device, which has an honoured _DEP on the IVSC device, is never
enumerated.

Before those fallbacks existed the lookup returned NULL here, the bridge
failed with -ENODEV and the probe was retried once the IVSC device had
shown up.

Restrict the two fallbacks to the CVS IDs. CVS binds a driver to the ACPI
device itself, so matching on the companion is unambiguous there.

Fixes: c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU bridge driver")
Link: https://lore.kernel.org/linux-media/20260901194526.6369-1-gvozdoder@gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Sergey Zagursky <gvozdoder@gmail.com>
---
Tested on the affected machine (Dell XPS 16 9640, IPU6 + IVSC + ov02c10) on
top of 7.2.2, where drivers/media/pci/intel/ipu-bridge.c is byte-identical
to v7.2. Without the patch libcamera finds no camera at all; with it:

  $ cam -l
  1: Internal front camera (\_SB_.PC00.LNK1)

  $ cam -c1 --capture=5
  202.794954 (30.05 fps) cam0-stream0 seq: 000003 bytesused: 8386560
  202.828224 (30.06 fps) cam0-stream0 seq: 000004 bytesused: 8386560

The media graph gains the entities that were missing:

  - entity 349: Intel IVSC CSI (2 pads, 2 links, 0 routes)
  - entity 368: ov02c10 21-0036 (1 pad, 1 link, 0 routes)

and the restored retry is visible in dmesg:

  pci 0000:00:05.0: deferred probe pending: intel-ipu6: IPU6 bridge init failed
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras

"mei-csi probed without device fwnode!" is gone, ov02c10 binds to
i2c-OVTI02C1:00, and eight v4l-subdev nodes appear.

This patch is against v7.3-rc1. The version tested on 7.2.2 is the same
change without the INTC10FA entry, which 7.2.x does not have. Building
drivers/media/pci/intel/ipu-bridge.c with W=1 produces no new warnings.

Not covered: I have no CVS hardware, so the CVS path is only reasoned
about, not tested, and I have not booted v7.3-rc1 itself.

This patch was produced with the help of an AI coding assistant; see the
Assisted-by tag above and Documentation/process/generated-content.rst. The
bug report this replies to describes what the tool did.

 drivers/media/pci/intel/ipu-bridge.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..2c3b9efb0b2f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -232,6 +232,15 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC10FA" }, /* NVL */
 };
 
+/* The subset of ivsc_acpi_ids[] which are CVS, rather than IVSC, devices. */
+static const struct acpi_device_id cvs_acpi_ids[] = {
+	{ "INTC10DE" }, /* LNL */
+	{ "INTC10E0" }, /* ARL */
+	{ "INTC10E1" }, /* PTL */
+	{ "INTC10FA" }, /* NVL */
+	{ }
+};
+
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
 {
 	unsigned int i;
@@ -283,6 +292,17 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
 		return csi_dev;
 	}
 
+	/*
+	 * The lookups below match on the ACPI companion alone. That is fine for
+	 * CVS, which binds a driver to that very device, but not for IVSC: there
+	 * the ACPI device also has a driverless platform device, which would be
+	 * returned instead of the mei-csi client. Return NULL for IVSC so that
+	 * the caller fails and the probe is retried once the IVSC device shows
+	 * up.
+	 */
+	if (acpi_match_device_ids(adev, cvs_acpi_ids))
+		return NULL;
+
 	/* Try to locate CVS device on the I2C bus */
 	csi_dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
 	if (csi_dev)
-- 
2.55.0

