Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894591;
	b=T9+UXn7MNgbv/S5iZSP64h8aVxsKBqOHZ44dA9C/3EcD7c7wz43A9WJ5OBdiADi0sfpA
	 Z+KFV1gTgAr97V5UpIvasxZPXtWbuHDqxseilqhy16gTwHdRTbSFjFqm7O3+AlZ5svQuY
	 /2djhB8y7DmGuW5xuVJkDg6+pY4ZLkQNdYw5W3S0DPkRQBSx24KE/SN4wFmRXgn3U00MB
	 7yR83Z4QKdiJQE6hOueAWBsq58QD1TnStB7ZWE2+sLQi6hgnoXm2gaOxL+B/Yu5r9WB9f
	 WxlsHczaKNc+0+simGpTraw6Gkna1U3/1wb+fxY1BpfI+NKVu9dVPpl2PUeKEOP6kGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894591;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S79orR8sh/VRy4ZBp1BOwCOaPxQC8KlPYB0b3TyEp7o=;
	b=ykdR/ze6eJE9RPitrU2tVFoQPnCOboiFnqoQOcxiI4Ywxn0KVSu/J8sYtyVgdUFQBZKv
	 0+ZN52yDxlqzNs7c8AQjgx3ihZnnCB3oKRmNt1wFZxLnst+gza1Ga5ATQ1i7eyLVePL6Q
	 O+8kK19rc4/oEBij4XRNYdXylfTuaRtrBgjVts6D9bA7n9D51cQ/gM2CwkBu1LzTZDGHJ
	 KKumE8ohGad0Etn/FDU7QGp0ouRJhthssXLp+n5vvV/o0FLC326EDy4AhkJ9cNbqI3yWl
	 0FrJVwkyJCFlEII9Ysit0RjSgvT3oiEUPU8HnNOHfzD37z5Zxufv3Yn3LAvlGwq7zJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xjm4H4Qm;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950DD606E54A;
	Thu,  5 Nov 2026 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950DD606E54A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xjm4H4Qm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894591; x=1825430591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yt+X6muNHMLgu1O1MKYqnePC8ViPj2x2LzLKslrnZLc=;
  b=Xjm4H4QmuxFv7zQdoUQURuDuP2qujxfChU2/OgK4/HmZjlrxGzow0YXL
   kZRYwfzxlXG/JaNuhO1wxWFTj1N46dALHTzRcTqToBbD5z6hVtIUIAHgr
   ydGl4221E7Cj8g5Jq4YK3rJ+PdI4BVBe7blaY4erZtRtX0BpbhNiMmzt0
   yaY4zJ0vEEelV4VavsQuEi34B+UmoQFsu48WFP5QrubqMSCNS5O6MVqbJ
   DjwSQeXKyRmHYPWHL5YxUMHVvWCaaAI2UYo+B8HuX37QYMJT0NKCFPBF3
   H4ahk8+gk86dgdNJnQS2D2zuWs/ZT6VJyo5gReg0k0T6yy3SbUC0HyGM9
   g==;
X-CSE-ConnectionGUID: QV9CZ57bSQuGo/2gImCpGg==
X-CSE-MsgGUID: G9vw86XdS22xYWHPrJ+h4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2706077"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2706077"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:03:10 -0800
X-CSE-ConnectionGUID: 6jYhGjCnSxauTpJ2FDMGJg==
X-CSE-MsgGUID: mso2wZdGSna/GDMgWlYX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8795694"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kvehmane-desk1.ger.corp.intel.com) ([10.245.244.200])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:03:04 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Hnyk?= <tomashnyk@gmail.com>,
	Wim Taymans <wtaymans@redhat.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH 1/2] drm/eld: Add drm_eld_set_port_id() helper
Date: Thu,  5 Nov 2026 18:02:39 +0200
Message-ID: <20261105160240.2850042-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ELD baseline block reserves bytes 8..15 for a 64-bit Port_ID that
identifies the source port of the audio endpoint. drm_edid_to_eld()
leaves the field zero, and no driver fills it in, so it carries no
information.

When two identical monitors are connected, their ELDs are then
byte-identical, and userspace has no passive way to tell which HDMI/DP
PCM belongs to which DRM connector. The only workaround is to toggle
the connector audio property and watch which ELD goes away, which
disrupts the endpoint.

Add a helper that drivers can use to fill in Port_ID with a common
layout:

  bits 63:48 - PCI domain of the DRM device
  bits 47:32 - PCI bus/device/function of the DRM device
  bits 31:0  - DRM connector object ID

Userspace can read the connector object ID directly from KMS, and the
PCI address tells GPUs apart in multi-GPU systems. For non-PCI devices
the upper half is left zero.

The split between a 16-bit PCI BDF in the upper half and a per-device
display identifier in the lower half follows the Port_ID layout
documented for the AMD Azalia sink info registers in dce_audio.c.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 drivers/gpu/drm/drm_eld.c | 42 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_eld.h     |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_eld.c b/drivers/gpu/drm/drm_eld.c
index c0428d07de53..baebece7b4ed 100644
--- a/drivers/gpu/drm/drm_eld.c
+++ b/drivers/gpu/drm/drm_eld.c
@@ -4,7 +4,11 @@
  */
 
 #include <linux/export.h>
+#include <linux/pci.h>
+#include <linux/unaligned.h>
 
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 
@@ -55,3 +59,41 @@ int drm_eld_sad_set(u8 *eld, int sad_index, const struct cea_sad *cta_sad)
 	return 0;
 }
 EXPORT_SYMBOL(drm_eld_sad_set);
+
+/**
+ * drm_eld_set_port_id - set the ELD Port_ID for a connector
+ * @eld: ELD buffer
+ * @connector: connector the ELD belongs to
+ *
+ * drm_edid_to_eld() leaves the 64-bit Port_ID field of the ELD baseline
+ * block zero. Drivers can use this helper to fill it in with a value
+ * that identifies the audio endpoint, so that userspace can associate an
+ * ELD, and the PCM device it belongs to, with a DRM connector, even when
+ * identical sinks are connected to multiple outputs.
+ *
+ * The Port_ID is stored in little-endian byte order, with the layout:
+ *
+ * - bits 63:48 - PCI domain of the DRM device, truncated to 16 bits
+ * - bits 47:32 - PCI bus/device/function of the DRM device
+ * - bits 31:0  - DRM connector object ID
+ *
+ * For non-PCI devices bits 63:32 are zero.
+ *
+ * The connector object ID is only stable for the lifetime of the
+ * connector, so userspace must look it up at runtime, and not store it.
+ */
+void drm_eld_set_port_id(u8 *eld, const struct drm_connector *connector)
+{
+	struct device *dev = connector->dev->dev;
+	u64 port_id = connector->base.id;
+
+	if (dev && dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		port_id |= (u64)(pci_domain_nr(pdev->bus) & 0xffff) << 48 |
+			   (u64)pci_dev_id(pdev) << 32;
+	}
+
+	put_unaligned_le64(port_id, &eld[DRM_ELD_PORT_ID]);
+}
+EXPORT_SYMBOL(drm_eld_set_port_id);
diff --git a/include/drm/drm_eld.h b/include/drm/drm_eld.h
index 0a88d10b28b0..de0478720721 100644
--- a/include/drm/drm_eld.h
+++ b/include/drm/drm_eld.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct cea_sad;
+struct drm_connector;
 
 /* ELD Header Block */
 #define DRM_ELD_HEADER_BLOCK_SIZE	4
@@ -80,6 +81,8 @@ static inline int drm_eld_mnl(const u8 *eld)
 int drm_eld_sad_get(const u8 *eld, int sad_index, struct cea_sad *cta_sad);
 int drm_eld_sad_set(u8 *eld, int sad_index, const struct cea_sad *cta_sad);
 
+void drm_eld_set_port_id(u8 *eld, const struct drm_connector *connector);
+
 /**
  * drm_eld_sad - Get ELD SAD structures.
  * @eld: pointer to an eld memory structure with sad_count set
-- 
2.43.0

