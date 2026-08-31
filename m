Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE33B9DB6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169384; cv=none; b=aKCBaFi4Tq2JHaiIzHkGMciAIimB++kO4VZKsd0MvbrQ7kGWoaeNPrlRm/0fx/Jt7dRXk3FzU3H9oB8fZDRgDzOqdvoRh/Rtg3wAuMfSNKwPFoDVox15fH8mFoEEUoaz/F7p7VwmSVhaXgF85XfoJwhuOfbZnLPMyhw+fUAyXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169384; c=relaxed/simple;
	bh=ko4cw16f99m3bXM3uqOEu5/e9zfYbbBGR8a/p6uy5j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpWDtUcqpKwqz4m/WXJFDxIBbOB69liY0ARSYKK35MzU64jUEuEsoEHoelWyO3Evb1cS+JLx91FW7OB+mne5GDTa/ZznIM1gyhcKkctF/QaoAOa/zIthPHfXIY3f+iGpodiCrrQ7IHmb9ts3LXiCFkS+cIGtSNxddeYN58b4jug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9PJXW/i; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9PJXW/i"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso19290285e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169380; x=1788774180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyxH6K2QecJlBQEE5JUS/GU1pODnZuTNjd4rRu1hR8k=;
        b=J9PJXW/iOJGPf1l35P/xvFyU3ltjc0WV47KFD44EXuTHDYkWN41aAEyUcHfnEoGQwh
         YRzrWEQzWwrL72DXcTRs8tRvHb8lXiIU4R9JScZph7/DXCYF8ZZW8MOQF8fxd5YhuH13
         BKt/oMNLcx4dDOqDICNU0fhWC/7tOcYnyy0ZDeSocmVcIlTq0muurMw59Omx0jsNlu7J
         MUcRBFo8Ci9pz2JXUM3Q1pZLJz9vnSt66rQz71005eWiMl39LuV39rorZexRtendwOm3
         frjDIuPtZZ4/CC6mQ7HA8+niF11LaraNYf7vnptrm1TZxlmzf2Nfs3EWZ86m3i7bZXgK
         AutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169380; x=1788774180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyxH6K2QecJlBQEE5JUS/GU1pODnZuTNjd4rRu1hR8k=;
        b=M8i1vROvBrfRM/SJt1gO6L0Qti7caJQ64qL8Yz+DZabxa7vxldcMbnHhYqXW8Leui0
         7etayfkYVgieiy6gGvhvTvfFNUU6njl94ZTsXgCNGFl69ARU4BOqZxFLwSZYuGwy7uZ3
         f5A7jnIigedxUbNc/BdA6eUZxtKhD4nG71VNuE9Nx8P2cM4tonkDqIaAh35ma/7EnGDR
         PvUzQA2lQ4w+kKUmt1aO/xWPf+lEo9JZA855VsiMBqtHXCKQUCmEKRkBG4eXyKUtEHoM
         akkiZg5wOlywwnjcMuXU8NKUkttbrv0Xkll11LEXUOadNTPnHHj5/L1qjGdY+11/O5oq
         gfcg==
X-Forwarded-Encrypted: i=1; AHgh+Rqk+Y8xWxAl1T3PediwYKM5lDNOlGfMVVwMhUTgANeTTy1AJNm/5ZgtzUvB0mxQysNp4PzLJykUUhb7Ig4=@vger.kernel.org
X-Gm-Message-State: AFuF++kHUMtNJeKIpMKQLke87MLF8WQfbX54uQ9FD/MbW4/bhZUl1XtA
	dptk2P6t9lr3aycMHtI01ORFFtMYT43uyzmo++Cr8Mf+lGgZIiIR7GEYhnKzyVN6bg==
X-Gm-Gg: AR+sD12IUIfgpdFdi9VDlh+aYo2mt0x2lfo9OWKItX6l+qemOBS/m85jnHRQCQmSXvj
	7DUqMtXsLPIgLc5JO6H7uIWgbKEaafQaONyemCveIMif6xZvjXKe86kw+r87U0kRbA2cGNBZKDJ
	oCI+px9OWYYqJGxhSDyKiShXCh7Jw9Q31dKbp1dqttQekCub8gWFUvCk41P4mW0JdsHPHn/XSqU
	z03oqMe5qGtj+oFT16alzjyQxWjmJQ4Fn07uCGOJW8B0/GHuePj7W4psJVUwAMRi9o9bt+1J4SJ
	ybOqu9dVEykdHGKATO6Xa+PjCekCCbp2NfpIzOI2SjZO0NlxqE4j+V1z2h47+l85bNwjSO5ATkm
	WSZTuuogRe37DtavT961MCzLQZBpUFtOEsyUp0N0zWX/Yv5JFtR5+IuGrvpehL3UwTzWJVjYWI2
	VbaYtwUd7tvP6G2MX8jntPwBMfAK+aOrd4O/DCEWJRNtRBHgDKbDxZ3F8w37meZI0QYEgEVZBdF
	wedCFxm1WmD5Kia1OnF2taPwPj6cNRmYJcEN77ei8XS
X-Received: by 2002:a05:600c:4592:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49b91c290c1mr290212825e9.7.1788169380078;
        Mon, 31 Aug 2026 02:43:00 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9267c369sm189932125e9.3.2026.08.31.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:42:59 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Mon, 31 Aug 2026 11:42:55 +0200
Message-ID: <20260831094257.29398-2-dmanresa@gmail.com>
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
never unregistered: sensor drivers and the fwnode graph keep references
to them, so they are left registered when the ipu-bridge module is
unloaded and a later rebind is intended to reuse the already registered
nodes.

For that to work, nothing reachable from the registered nodes may point
into the ipu-bridge module image. Most of the data already lives in the
dedicated, never freed, struct ipu_bridge allocation: the property name
strings in struct ipu_property_names are character arrays copied into
the per-sensor struct, the node name strings are likewise character
arrays inside the struct, and the data-lanes array is a struct
ipu_bridge member precisely so that "it survives if the module is
unloaded along with the rest of the struct".

Two references into the module image remain, though:

1. The values of the "link-frequencies" endpoint property point at
   cfg->link_freqs inside the const ipu_supported_sensors[] table in
   module rodata.

2. The name of the "lens-focus" device property is a string literal in
   module rodata.

Both dangle as soon as the module is unloaded, while the properties
that carry them stay registered and readable. In practice, after
unloading and reloading the IPU modules on a Surface Pro 7+ (IPU6,
ov8865 + ov5693 + ov7251), re-probing sensor drivers read poisoned
link-frequencies from the surviving nodes and fail to probe:

  ov8865: failed to find 360000000 clk rate in endpoint link-frequencies
  ov5693: supported link freq 419200000 not found

where 419200000/360000000 are exactly the values the bridge had
originally published for those sensors, i.e. the properties no longer
return their original contents. Depending on what happens to the freed
module mapping, reading the properties can also fault. Similarly, a VCM
lookup through the "lens-focus" reference can no longer match (or
faults) once the property's name pointer is dangling.

Copy the link frequencies and the "lens-focus" property name into
struct ipu_bridge, next to the data-lanes array kept there for the same
reason, and make the registered properties point at those copies, so
the nodes survive module unload intact. These were the only remaining
references from the registered nodes into the module image (the
sensor->vcm_type pointer into ipu_vcm_types[] is only dereferenced
during ipu_bridge_init() itself and is not reachable from the nodes).

Developed with the assistance of an AI tool (Claude)

Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 14 +++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e..4de42ed 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -503,7 +503,8 @@ static void ipu_bridge_create_fwnode_properties(
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
-			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
+			PROPERTY_ENTRY_REF_ARRAY(bridge->lens_focus,
+						 sensor->vcm_ref);
 	}
 
 	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
@@ -516,11 +517,17 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
+	if (cfg->nr_link_freqs > 0) {
+		u64 *link_freqs = bridge->link_freqs[sensor - bridge->sensors];
+
+		memcpy(link_freqs, cfg->link_freqs,
+		       cfg->nr_link_freqs * sizeof(*link_freqs));
+
 		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
 			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
+			link_freqs,
 			cfg->nr_link_freqs);
+	}
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
@@ -943,6 +950,7 @@ int ipu_bridge_init(struct device *dev,
 
 	strscpy(bridge->ipu_node_name, IPU_HID,
 		sizeof(bridge->ipu_node_name));
+	strscpy(bridge->lens_focus, "lens-focus", sizeof(bridge->lens_focus));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
 	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac76..4e91ec3 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -164,6 +164,15 @@ struct ipu_bridge {
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
 	u32 data_lanes[4];
+	/*
+	 * The software nodes registered by the bridge are deliberately never
+	 * unregistered (see ipu_bridge_init()), so every string and array
+	 * they reference must live in this never freed struct rather than in
+	 * the module image, so that the nodes stay intact if the module is
+	 * unloaded.
+	 */
+	char lens_focus[sizeof("lens-focus")];
+	u64 link_freqs[IPU_MAX_PORTS][MAX_NUM_LINK_FREQS];
 	unsigned int n_sensors;
 	struct ipu_sensor sensors[IPU_MAX_PORTS];
 };
-- 
2.43.0

