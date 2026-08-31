Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E356E489889
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184992; cv=none; b=nAQeDpAN6Vz8wZqhQphGVyxnkq7o+YYtMzU5i+8z3x/YQWXJH8UO44zWhSAjVQ3M1krs0MuIoH1ZhNcIbq/1BdqCi+obQ1fiIkT4//tC2VoEOaQxRysC6jafburIF7ZcE5redr38XQhYpwfNEfnuRHFctGR0N764IpfkAX7mgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184992; c=relaxed/simple;
	bh=HHRTeQq68YYSROEqNarnY5aOAuhGg9O8lQQqTFTQLLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ya/AbwMfcGulIwMbuPsRECPoOqZd8c6YRI/oIFXQcgZt+rIiiuBR5tG9zoFsi87fOhgLN9cjJeZ2cRXiNnCI/yxlNHTmNtvMR7E51cH+I7F2Y59+5ISewsA1GP8krddyx3j3wBXQfq3Wq8DmxCh+9yOySTO4JDmxHQU68GalkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ikx8HMuJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ikx8HMuJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so34314585e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184989; x=1788789789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trjoNClLkDQZEUCU1E1Tse0Xqk7Csi6X5xklKB/lHWw=;
        b=Ikx8HMuJCCAFCy+J6siybbxNrAz9yWtUtxnwoOmNzAV9HPd08MKoiXQbX1tCsYpEu8
         vcRvmBit0xF8qywRDR6gN1m7HldJErv1tIvmc5+tX2AGmtBsuyhKUeVG0nSOmFQZ3zIf
         9nhfgaq7hOUNXDJXXqIEu4mS63j7bFqlU3AwBkF5iZCZ9qgBwQZmfw20KJSzh9dYG14X
         MDokkFxuiciPQdPp4cNC6d/JKaEIIYIp2PWp96KF06F6LL9NOJZzk/v1ttdd4uPYErMq
         KlEkxB0s6IyhEEm6WkLk5lp3uL50tDqvomspIKmAGPniPDCDYYR6/c3+SYHO0xK6HjK+
         05Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184989; x=1788789789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=trjoNClLkDQZEUCU1E1Tse0Xqk7Csi6X5xklKB/lHWw=;
        b=Vm6dulaMiIYQj2If/6wrWNODa5HKXM0HY6N9K/dGwq0Fl1SjoOOgr8eqojgqMTTw39
         uPsyz3wvNGjI8ydfKMPLbnlk+KnYE6nKHIX14EU150d5kPjhXaOwvzDL3OWyZG1QX6pR
         XrrmsB6cvHe7q25NSFtRBbzP0+VvJlCw/BaDwXzaM6t/CndeZaI0nr0HVLpoVgdyfgSU
         UbpBOxO/XnMCu8DAeeTUJucSuIz8Q2NHut606RKhmb4R0JhVui29BfAR8YV3YvuSI4Km
         VenhDmcHFkF3i8Cl60gzDXKKqVR/LU25ev0DKm6UM2e8t+pKCSu8KKHsDNIfkYUQf/+O
         YMkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbL9gLrRYiDJeesjF4XxFzqtcSVnezOJkts4WqckuUnR5PJvD1bbDNZXPoXoTf/5yx/nB7ZbrwU+UVLXk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyrEqx00jadSvEIAEqtpndW/mTRa0wX/Yk9fcKZ/4Yh+XmsH4E
	oEYw1A7rQrOY9nMDm/N6EryPHielnTSh0mV9JIRA0gMUqRsjO3wsM94=
X-Gm-Gg: AR+sD11GQ8kUAX8rpd/75zWOEccWi0m6BKfNK0fxcpkIfa2oHAgw5osfgcnRK3FwrEm
	O1ArjWnnyWRiSZyx6w6+4Qu1PjvD9lvtU/XxCGkG7Tuxb3Bl0bjBDj2UQnhykrGDVfq/7pJYXdz
	u+u6I24s6bqjdgRjMJxKaYi2miuyzrUJYNqvmiEp6zKEeATeSnWXmDVT094ommskBsEblRzCUBs
	7MQC7JQn1nD1T44PiFI4AQXoORcQ/7ChyDuizpnknFuZSkxQqOB2/0yd6QCjAAFWaSUa5yXBv5E
	0W/dBPjcEm/owENmMh17h9kQ3s5Lnfk/vnM/OHFERrZOr2q2zy5Mh0eAF/HznL4plJhSIfJSwsX
	Nx9GHU5Gy9m9X+CeZfV8TPAUGipnIIw0vcVXKZvPiz5nPRJfu8nq8jDvK5WKLQjrOhuCsJm+2RF
	OPg1OuZjW+FzOrcQUMjS0eYbpGjw+kazAc7JyG8DXCYfdW61HgWbSCsaZmrgaMatvk4IQ1ZdZpt
	0Hh83+iYV3l6Ypwjd7rIOGdKysMqU0q75tumT17KAJhYvUBP49oYFA=
X-Received: by 2002:a05:600c:5490:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ccf18498emr250344645e9.12.1788184988616;
        Mon, 31 Aug 2026 07:03:08 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm173851415e9.2.2026.08.31.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:03:07 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH v2 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Mon, 31 Aug 2026 16:03:02 +0200
Message-ID: <20260831140304.45940-2-dmanresa@gmail.com>
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

Assisted-by: LLM

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

