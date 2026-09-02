Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59AF485CDD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359047; cv=none; b=tHo8nMU48TgtFrvUvj2rXgPGiPE40L7DMDMyRq34pdVkhghnyQdX+uFf0G+4AtHim7ay+jVQ1mOB6U2uQz9WccyYFcsrh1mFkA594EdHYgpFNcmpOQnvvlHwzOC/9bL7pwEHRTEGzJ2n0hk37zCrFdjmu+L//0Ew06tB8It5HJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359047; c=relaxed/simple;
	bh=dn5lfqglA93Cf4DCouOkQx4zA8810nNbg54kpC3NCv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY0KuWir/QbkHS+Q1rq/r2/7CU4cHKsqtMC1pjeiYehg5emRkKZWcW35eJMzuOw0ZeEZ4VgF/7kphH3HrzEtnbJ3+BllBkUu5+/sYw0xi38sYRWNiglm32mD6MbkcYw3yN0hsurz4JdzyNAkUZyYFMWoaTmfhpF+PH590gudmqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljT5ewZv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljT5ewZv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so13920665e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359044; x=1788963844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw0rLiQuiue9t66DwgUiBZvqp9/daLkRFkCzFJ0WIrM=;
        b=ljT5ewZvUuDWIOMeIIVre3afgQ1rVhR5YL3fqa16FjHo/pVzApQwZrZveHnHgkF1i3
         GlwWb9KimhGRyvk3bqxADfvO3Otx/sBrxzeZwFgixoGRBRF2aZ4a2/q1Uge5GDV02q6W
         CQ95Ls8BCG2YfxaXKJ2UDZRSfeR+c4b0Zyf7HK2kHEBXM7eKaQtiQkB4AxOwJxoG8I3V
         NHMLRQCN92H31QB+eV5ob8HuYhiFOTFva8kZLohJ4jDUrIqXJDgjbzcTDkoTc5hDrGWQ
         Acj6L5qlqKNbi2rljfW+fNCIMq7HTFxepq//IL0v4fX2MLxzKme/Z5UccBL7pMI2Z7T/
         OQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359044; x=1788963844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw0rLiQuiue9t66DwgUiBZvqp9/daLkRFkCzFJ0WIrM=;
        b=rau/LvneLhAvDf/BgOzu2HK4wV91TLRocTGWSoXQ+MMlda8+cHnjItD3LfPixf1j01
         JHbANTSgQGuCW4hEYzHu8tITPpXVSWHrnPjP72VsbnJ0fLKn6EjS0uG/c6m76wH1I0Hr
         bBIjsvQfWRTl+FB+tsBiaeII4oPXGTsIFKwZXbFDE4LWsvng7Nh9bM1dQWPGwzhM1HFp
         xCH40myotZzgGudXN92x5BDPNgwxDAPvASyCmmfEzwS/ByMUvehjLXyAK2a4t2vUjsDC
         aYFZmiikNpoR/W0GD/eJRlTN9GMpWnuXu60M0w4SU+iduuQhvQusZj7yDCmhmy/vDckO
         Iurw==
X-Forwarded-Encrypted: i=1; AHgh+RoyuT19BrYOp2gpdtd87TY9m9bq24YpayLXNCuGJz9TDJz3FrQp3Q2F2VMjMtd9sGvHAGNC4xOooLCQK18=@vger.kernel.org
X-Gm-Message-State: AFuF++njr9jwsxkWrbrznktc3cFrGSgr+y31YQ+XDQRUxps9AYacMkWR
	LlXpPlh50cDCfos5KbJOIuBtQCMrmpJ4E/5bSMljJ+dbiFPoaZAe+2i1
X-Gm-Gg: AR+sD100V6/NnV/+I0NoZYP79JWxDLC7r21ecVtXL1xAuTtewGwTPWRWQseOakxB5fA
	vdoTh8U7QWk6hvNlaQj09qSl3j45yHggy7RFv9gfCf+h5AtBaAOuzRzAbgilQ5rX2PHaX4yBdgV
	AbDViEwI8Co+2ohCniEKmJrgFquBpEFH8Tiy0LPpoZxbY/WXOAxCM17RPapFKcyn+TOy4SdWKX7
	BKiQcKeG1p2bnFxzpRu6U+nB6Fc9RnKhLXFmfWQ4NmfXtPwFYh60xpJnPLJLnMyf0EIDnNjGvm/
	3X17jp0YnNUo7WL/yMD1qkm8e5i8Z5NGUmhD3qm+YIs1x8HpCEOTIeJDVmy40T75FSmLDi5QiTv
	XTA6RJ0Ml+NRAWM7zA0A7JJ4nMKWYIks8XrUPWvPM2+dhFN0sE8b+jr7U+bJkW1Djy0KObfFe5h
	sjBHDC6UXgFF+9sYYghk8QJ2CAztQB1DPdYKd8Qadd+ijYGTeXFjmRW567uRC2Wycejrl5/HVds
	MAdTFqOYSapDwL8y3B9Oz5UbhvMQgUUBEuhiEAseZXHDC0ZzlYqjW4cpgQ=
X-Received: by 2002:a05:600c:3485:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49ce7c26ecfmr39084775e9.5.1788359043774;
        Wed, 02 Sep 2026 07:24:03 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:24:03 -0700 (PDT)
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
Subject: [PATCH v5 5/7] media: ipu-bridge: Assign endpoint property indices dynamically
Date: Wed,  2 Sep 2026 16:23:19 +0200
Message-ID: <20260902142322.73523-6-fernandorimoli11@gmail.com>
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

Index the ep_properties array dynamically instead of plain numerical
values as is done in mipi-disco-img.c.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
---
 drivers/media/pci/intel/ipu-bridge.c | 27 ++++++++++++++-------------
 include/media/ipu-bridge.h           | 19 ++++++++++++++++++-
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 131c70844..eb7d1611b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -451,6 +451,7 @@ static void ipu_bridge_create_fwnode_properties(
 {
 	struct ipu_property_names *names = &sensor->prop_names;
 	struct software_node *nodes = sensor->swnodes;
+	unsigned int i = 0;
 
 	sensor->prop_names = prop_names;
 
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
+	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
+		PROPERTY_ENTRY_U32(names->bus_type,
+				   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
+	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_DATA_LANES)] =
+		PROPERTY_ENTRY_U32_ARRAY_LEN(names->data_lanes,
+					     bridge->data_lanes, sensor->lanes);
+	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_REMOTE_EP)] =
+		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
+					 sensor->local_ref);
 
 	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac7654..06701d151 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -64,6 +64,23 @@ enum ipu_sensor_swnodes {
 	SWNODE_COUNT
 };
 
+enum ipu_bridge_ep_props {
+	IPU_BRIDGE_EP_BUS_TYPE,
+	IPU_BRIDGE_EP_DATA_LANES,
+	IPU_BRIDGE_EP_REMOTE_EP,
+	IPU_BRIDGE_EP_LINK_FREQUENCIES,
+	IPU_BRIDGE_EP_NUM_OF,
+	IPU_BRIDGE_EP_NUM_ENTRIES
+};
+
+/*
+ * Get the index of the next property in a property array, with a given maximum
+ * value.
+ */
+#define IPU_BRIDGE_NEXT_PROPERTY(index, max)		\
+	(WARN_ON((index) > IPU_BRIDGE_##max) ?		\
+	 IPU_BRIDGE_##max : (index)++)
+
 /* Data representation as it is in ACPI SSDB buffer */
 struct ipu_sensor_ssdb {
 	u8 version;
@@ -141,7 +158,7 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
-	struct property_entry ep_properties[5];
+	struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
 	struct property_entry ivsc_properties[1];
-- 
2.43.0

