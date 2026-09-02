Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9249C4CD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359052; cv=none; b=h/z+rb9ssOeU5Y/Y6bbjl+CrY4r/cU6KFxBZ+u6CQQGluWcw120pokEQztFjVBBi/TLI8GqVp6s+XyzC4+nEt5x1etPeO/rOo3SIiPJUjmBP7l9+p1j75ymS1dorcF7Ki8eBoV4tKqFjLV7UI4cCl56vLXHA3oeqrRA77a8WFFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359052; c=relaxed/simple;
	bh=oBxlFptKem+KpXxrIbNTiYDFtt+gGdaL+7vQwWccpoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVaYY0TQPojc8MrMM62ZQAr4m2D9dqx7gBOtGtLxW704HcaBgkEq5xEq7tZDX4K8fIFDJDdd13hkeYJb6rNvnVvVCGn3Ums04VyejhZ08YyBJO/Omvp77Zt1rvQhKVqrrrononCwtowK3k7V6y9dDHemdZRQDL3m0PM1Ich0Elg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icgBMhe5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icgBMhe5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b965570d7so9147015e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359049; x=1788963849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B/kcq/oQaNYThkEivmQMh6hAFUzMhpSs6Yp0oogSCA=;
        b=icgBMhe5f9Pg8mES8sF0a8bGR6+iKeKe2RrlyVnog/B3XBKJ9yYGN0JoIZrf1Aegfi
         o0nNh/qDvSVFqxbw6mijaMPjnFKj3V4CEj+F8Sti854ZErMynPt4qnAi3foGn5LTdzSt
         HQLxP7RJ3be/4XfSVneaK2ASNeHLA4JXpVMyDqqovGglEWg1zlkHRn5AUpqQ++VXFHEr
         IVpfPof/x8HDbm55mvCyNayF2sj4qYDRIv1gi2iL15vRVxn0QuaAN41WKI1wHOR2nCmo
         sp2monm2m9rRipAr1OO3Rfqol84OWqoNRgMCDD3pN2ZJEwjub/nqiHxjlsXLJYEQ2krm
         71bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359049; x=1788963849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4B/kcq/oQaNYThkEivmQMh6hAFUzMhpSs6Yp0oogSCA=;
        b=R+0C3HTx9ESsooNw1iujSZO1j8G4pOHHcFbBuvmSxrz0BJXtYANW4B3NWcBqNp4gu9
         DvThWYXCFWKT0WybEKplV2Pl/ZTNIGVJu2Bcw2v7RQBu6kL4wjSwDW7nLQ8RpzshJeor
         exneO3j4Ld6+a+/X4xU8RqWpXS2Is19N/u1pNfTr6e/CHFSCEYdBDgJ7XFo9mnAr4MVO
         JqXe9zqWU0Ombv73HcX4yN/gUSj4x+JbbY/EYF25ZHtK08CptfAwyn/I+RxDEdiOoZuj
         0gUb4ho9DWx+OTYAis+hK1AWNXQ6EdTOS8nlaonUS1Hg0W1h+j+R79flEN/isZi+f/+L
         G8+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkN9LQoX7HcJA3t7+ptXgb6x4mH6+ypNLwBPQ9hNF8mmgN4LBfwXcRfmHxA1Xm5s3Lc5gNnKUT3msvnac=@vger.kernel.org
X-Gm-Message-State: AFuF++nBHK8fQNP21Fe8JXY4ajwskFM5yiLkJKWvaJincLTtmL9C9f5c
	CCMZVg+Mf0WBjZxfKqRSA0QiuL1SPvJ2JfbD5IotFMZQymjJ2vquiDVAnfUhpQ==
X-Gm-Gg: AR+sD11TCc3KA8ft8x4lm2/xGQc0Hjg7K6zlHeU0131nJo3jk3+NXxSZz3IyHx84woe
	sYhSIdJNhEf5HHSMQYyQaby6tk4BZ1X+Wzm2wdd4mFh5bKs3DgFrE0m1eWhHxDaesCDHokCMwlY
	WXVnou7SPfkwRiVGMfn1688fEgthcSCIVvsfjnqQg3WvCYJc5jMcryxt6PjWrCLYgddwKntQe9C
	VGDsw++t1F46PfqbrFvLqVVv7s+3PdBueEw3hBfm8pF2w9E/4GRMYBb5GzunYsWHeJXYjzgQXsN
	NhRq3SWDiDS4x4MEvW1Q6QQ/g7R49cR28jculuR6w11S/7zJQKc0CG2HHB2xLw/+1zsQY7VrLQR
	MyxxHdCti0jI6uGZox5XXltarzSclB/vutBt3sWwhA9RnGaINKj3kIPObuaaedL7Q9k4ayqGmLB
	I3HXsJGxXY6O0lZW8ep8/MkFflP88BrAZfefVxWWcL1qowH2YNJ+yUfzTugvpac7m3kvFvFPy2V
	ljgMEWjy3aEwSB2JwRnsTUqZF2iVCiBdKTCCQ3lryKvLd8AJ3FaaPaXAo4=
X-Received: by 2002:a05:600c:3f06:b0:49c:ee1c:d582 with SMTP id 5b1f17b1804b1-49cee1cd69emr1761085e9.14.1788359047796;
        Wed, 02 Sep 2026 07:24:07 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:24:07 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Lucas Lis <lucaseze.lis@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 6/7] media: ipu-bridge: Match sensor configs per IPU and add config flags
Date: Wed,  2 Sep 2026 16:23:20 +0200
Message-ID: <20260902142322.73523-7-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sensors need different treatment depending on which IPU they are
connected to, so the ACPI HID alone is not enough.

Match on an optional list of IPU PCI product IDs. Entries for one HID
must be adjacent, IPU-specific ones first, so the generic entry is
skipped once a specific one has matched.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
---
 drivers/media/pci/intel/ipu-bridge.c | 35 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           | 26 +++++++++++++++++----
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index eb7d1611b..5efdcb9c8 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,6 +8,7 @@
 #include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -853,8 +854,28 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	return ret;
 }
 
+/*
+ * Whether a sensor config applies to the IPU this bridge sits on. A config
+ * listing PCI product IDs only applies to those IPUs.
+ */
+static bool ipu_bridge_config_matches(const struct ipu_sensor_config *cfg,
+				      struct ipu_bridge *bridge)
+{
+	const u16 *id;
+
+	if (!cfg->pci_ids)
+		return true;
+
+	for (id = cfg->pci_ids; *id; id++)
+		if (*id == bridge->pci_id)
+			return true;
+
+	return false;
+}
+
 static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 {
+	const char *done_hid = NULL;
 	unsigned int i;
 	int ret;
 
@@ -862,9 +883,22 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
+		/*
+		 * Entries for one HID are adjacent, IPU-specific ones first,
+		 * so the generic entry is skipped once a specific one has
+		 * matched and the sensor is not connected twice.
+		 */
+		if (done_hid && !strcmp(cfg->hid, done_hid))
+			continue;
+
+		if (!ipu_bridge_config_matches(cfg, bridge))
+			continue;
+
 		ret = ipu_bridge_connect_sensor(cfg, bridge);
 		if (ret)
 			goto err_unregister_sensors;
+
+		done_hid = cfg->hid;
 	}
 
 	return 0;
@@ -948,6 +982,7 @@ int ipu_bridge_init(struct device *dev,
 		sizeof(bridge->ipu_node_name));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
+	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
 	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
 
 	ret = software_node_register(&bridge->ipu_hid_node);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 06701d151..aca76ff71 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -17,13 +17,24 @@
 #define IPU_SENSOR_ROTATION_NORMAL		0
 #define IPU_SENSOR_ROTATION_INVERTED		1
 
-#define IPU_SENSOR_CONFIG(_HID, _NR, ...)	\
-	(const struct ipu_sensor_config) {	\
-		.hid = _HID,			\
-		.nr_link_freqs = _NR,		\
-		.link_freqs = { __VA_ARGS__ }	\
+/*
+ * Sensor config specific to one or more IPUs, identified by their PCI product
+ * IDs, with flags describing what the sensor needs there. Entries for one HID
+ * must be adjacent in ipu_supported_sensors[], with the IPU-specific ones
+ * before the generic one.
+ */
+#define IPU_SENSOR_CONFIG_MATCH_FL(_HID, _IDS, _FLAGS, _NR, ...)	\
+	(const struct ipu_sensor_config) {				\
+		.hid = _HID,						\
+		.pci_ids = _IDS,					\
+		.flags = _FLAGS,					\
+		.nr_link_freqs = _NR,					\
+		.link_freqs = { __VA_ARGS__ }				\
 	}
 
+#define IPU_SENSOR_CONFIG(_HID, _NR, ...)				\
+	IPU_SENSOR_CONFIG_MATCH_FL(_HID, NULL, 0, _NR, __VA_ARGS__)
+
 #define NODE_SENSOR(_HID, _PROPS)		\
 	(const struct software_node) {		\
 		.name = _HID,			\
@@ -132,6 +143,9 @@ struct ipu_node_names {
 
 struct ipu_sensor_config {
 	const char *hid;
+	/* Zero-terminated list of IPU PCI product IDs, NULL for any IPU */
+	const u16 *pci_ids;
+	const u32 flags;
 	const u8 nr_link_freqs;
 	const u64 link_freqs[MAX_NUM_LINK_FREQS];
 };
@@ -177,6 +191,8 @@ typedef int (*ipu_parse_sensor_fwnode_t)(struct acpi_device *adev,
 
 struct ipu_bridge {
 	struct device *dev;
+	/* PCI product ID of the IPU, 0 if it is not a PCI device */
+	u16 pci_id;
 	ipu_parse_sensor_fwnode_t parse_sensor_fwnode;
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
-- 
2.43.0

