Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286964A2608
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200360; cv=none; b=QFUK2viBGxxZLl1MbPbYEe6gKTfYxG+bX3rxa26cCTpMO5FLqIEqbLI2geSV5HQ3v9CJmd7aKX8bN11sqUTP4Ox0ATTdPqAMtnl9mIT3Fu9oXMIpUrwjFIAi7NgGrVpPmWh8Ih9OwNgaYe/7mtbiQT6wYp/LdNpkE4422JzJWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200360; c=relaxed/simple;
	bh=FztbYciuUu/xBl4EtmM8UJG3T8usV0MXM/d6deYWyo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVXqE61ND4eXqx0M1HQD7pY3xFHCfK7Ah4OFv5kbebdvRVeoCHF2FbrWFbPUkNhfhbpYQtC+jbMC9GSLukcJtuY7gqxsc3UcCpGmkhvaPdY6ED/UrHywAlzsdolrzOu578dH0WJneiDgahb8B7fmBQ3m5UqrnHkKr7gPUgrBprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rM1HRszv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rM1HRszv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso24258075e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200357; x=1788805157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsl1K9EFVIiMJCG+9Qgue9j3QGOqyAit8togwWpGNDY=;
        b=rM1HRszvxblm7QOtDWz4Xeqi7ZKigWiihmbhVoCxGq8NdxgqdZjjAOAob+NrZ40UTy
         czCuZG+Wac0wvTfHBuHfPCevY6d9tlRR8s+uvMXgCKGfNVRlQZQ92POoC6hNJNGjE77F
         UK9BSv8CTrOkgTMdmKT/+RZhzgKv/FZ+CpMFx3eMx0AsVjK9VnIoJJ/Vy1sVrlLf0rt+
         jJInhcnWMLo8/f3mrpvfZNCZgo0f6almUfLRQB2KlTW2yinLRpVaT69bSxTM+Nf8alf1
         KjWkHbbtPErMLIycC/Qt+bYORIdldolrdw0/dB0LiUxZnOTmlst/l7hbCuYVjR5Ng5RM
         LLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200357; x=1788805157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fsl1K9EFVIiMJCG+9Qgue9j3QGOqyAit8togwWpGNDY=;
        b=d/xvru5axs7eZYVhUnoh+x89ROLIttBJKFgYU/6nHrmGRfGdtUmseAYvs1LD42urDN
         TLpPTWDjxDEuR4tw3UPs2h3zffV3xqqITnXyFahmPE6aZ8SWXtm7NTeim5kekcgqg8TY
         TpWMZFLdHb7hEO3NAHRxu8mgRffj1OdhUQCxeX2YcjNoJWZtdiCS12Oj6T5tGnkv3oR+
         cLslUklYQFa05WdQ9hDZY4fE7bMSDgSDYdyOQsfZrTD0pxypr5kq1zZKwPkTxJsmibdM
         kylGEtYWXpFAVbEXV0ELnusMPYUrE6RAc6t54k8y+ML4Y7rOMvzFzvXW4SGoWSAaQ0hG
         gnQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqT10aVzzighZRoS1q/hgLk/sbTn8O8+W8AqarQV5URzJLGEgzHeQN9lpToKJiPBD9vmleupI8yASwRaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nzDHzDpbBvh+gpHgF1cHvVX8tGMJ/NKQNPmkt57f+IKhZzZSKQ
	S5+s8nSrKn3E+ezYhu0wR1bcc+f2Xe7rXfcMSdrksJovcyrwFRHjXe3G
X-Gm-Gg: AR+sD10SjECFZdxyiY7B6AGhbn6n/xAhIE3VGsfEAEr35BZn6ZVivTqRmox6HHhgGos
	9nN69Xl9G35VMdKBCxyre/UxjtwUJsvI0410CJDOVTnIeksLhYnix3P75wLGS71vYDCPRfyDzRG
	J4soxGlBCL4wHrB3+9IyKCNj7LE7F2ODPfrCSlOqFYRghuLg1bhHxS7CCW7BGm3MHn9i8mxxJRZ
	/tDnpqY7GZ6pf4ZskOOzYhrTT2oLqGbn1jMd0ChvJC5azLxxi39RpmHZYti39jfdY9fbJ/gxwMC
	GOi9eMfyodKLwDIaXIL9LBq2n+rOiDZFoq84NT7vgvFXkGN0pwv7caxq4vGE7BbyXOVbb0fhhMh
	9iLjQo64oBGyA+8Sq8HYyreTvudKF7Cu+bpq1tQdVx9ACPhfwKmTqrv1ibpXZAmLsADJqLP4pEa
	q1SJpdcdmJAOtVxLCqbO2t4FZfvYR71jEIcL96fLsNz4jXRJiwd7PWixArBW1fdbIBhNNaw2/i/
	UOS2kgnsq4g
X-Received: by 2002:a05:600c:4e86:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49b91bd43a7mr385786455e9.0.1788200357210;
        Mon, 31 Aug 2026 11:19:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:16 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 4/6] media: ipu-bridge: Assign endpoint property indices dynamically
Date: Mon, 31 Aug 2026 20:18:56 +0200
Message-ID: <20260831181858.325109-5-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The endpoint property array is populated with hardcoded indices, so a
property that is only set conditionally has to be placed at a fixed slot.
As the array is NULL-terminated, such a property is silently dropped when
an earlier optional slot is left empty: "link-frequencies" is skipped for
configs with nr_link_freqs == 0, which would truncate the array before
anything following it.

Name the endpoint property slots in an enum, size the array accordingly
and assign the indices through a bounds-checked running index, as done
for the MIPI DisCo for Imaging properties in mipi-disco-img.c. No
functional change intended: the same properties are set in the same
order.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 27 ++++++++++++++-------------
 include/media/ipu-bridge.h           | 19 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 131c70844..cd3c36d44 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -449,6 +449,7 @@ static void ipu_bridge_create_fwnode_properties(
 	struct ipu_bridge *bridge,
 	const struct ipu_sensor_config *cfg)
 {
+	unsigned int i = IPU_SENSOR_EP_BUS_TYPE;
 	struct ipu_property_names *names = &sensor->prop_names;
 	struct software_node *nodes = sensor->swnodes;
 
@@ -508,21 +509,21 @@ static void ipu_bridge_create_fwnode_properties(
 			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 	}
 
-	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
-					sensor->prop_names.bus_type,
-					V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
-	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(
-					sensor->prop_names.data_lanes,
-					bridge->data_lanes, sensor->lanes);
-	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(
-					sensor->prop_names.remote_endpoint,
-					sensor->local_ref);
+	sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
+		PROPERTY_ENTRY_U32(names->bus_type,
+				   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
+	sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
+		PROPERTY_ENTRY_U32_ARRAY_LEN(names->data_lanes,
+					     bridge->data_lanes, sensor->lanes);
+	sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
+		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
+					 sensor->local_ref);
 
 	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+		sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac7654..61e10cef1 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -64,6 +64,23 @@ enum ipu_sensor_swnodes {
 	SWNODE_COUNT
 };
 
+enum ipu_sensor_ep_props {
+	IPU_SENSOR_EP_BUS_TYPE,
+	IPU_SENSOR_EP_DATA_LANES,
+	IPU_SENSOR_EP_REMOTE_EP,
+	IPU_SENSOR_EP_LINK_FREQUENCIES,
+	IPU_SENSOR_EP_NUM_OF,
+	IPU_SENSOR_EP_NUM_ENTRIES
+};
+
+/*
+ * Get the index of the next endpoint property in the property array, with a
+ * given maximum value.
+ */
+#define IPU_NEXT_EP_PROPERTY(index, max)		\
+	(WARN_ON((index) > IPU_SENSOR_EP_##max) ?	\
+	 IPU_SENSOR_EP_##max : (index)++)
+
 /* Data representation as it is in ACPI SSDB buffer */
 struct ipu_sensor_ssdb {
 	u8 version;
@@ -141,7 +158,7 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
-	struct property_entry ep_properties[5];
+	struct property_entry ep_properties[IPU_SENSOR_EP_NUM_ENTRIES];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
 	struct property_entry ivsc_properties[1];
-- 
2.43.0

