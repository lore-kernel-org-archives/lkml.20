Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.163.59.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468746;
	b=eipXW0ob/E1geq3AVD9qHfZRE8tQJPJpX+68fxVRBpVdKAAcix2UII8HZyl/VSFzxKuH
	 cZ8KU97CA4m79No2BwUWQm1V83Yxzy35bwYRHpd6VyH9TWPeRmCLoi4po9SX9hRhCPABy
	 GtsFpU0X00+H9oWG1ZmNsJagoBgYlFwKyRknic2Vwi/1IAldD/NbSesjEd0zJVdLegzyn
	 TBzdNDAKK0/gVLqClut3fuTlP5ek6uyzBJYuui69ojVVpN1xqvbJE6kXJhPHFVFho5jul
	 sn2vNzRLq3cIvXMpXv1/mScZup5uiq6MWkmiDX3nBAku7Ha86IB9axbycRRwiDCo2Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468746;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Mailru-Src:X-7564579A:X-77F55803:
	 X-7FA49CB5:X-87b9d050:X-C1DE0DAB:X-C8649E89:X-D57D3AED:
	 X-Mailru-Sender:X-Mras;
	bh=t4fbglAcPrxA2vRFmF/rTmX9yQxyaIe8aXQiugqJF7U=;
	b=Wojv34XcAz7LWBs+pBMLpFG8W9eIs8j32B3g3QLAsAu66NJ2rQX6shdfOuWfrkkG44N8
	 C2roiGmv0VXDNccznPPCGvPPPLT7Hlhr0jmSTuNTgDTJtl6qOk8SjVLDJLD8Ge2KRRAOr
	 lKEitH/NGsX5hSl5sFzsLBp5mGxJmnesHc/lHE8dKLXbQ7lN3gEf/H56whaDPxtNlL0Wt
	 /vloMER67dwZTU1H6AYmGyZIUOOCNZpFAIs7psKg+V9aM8kjCaUtuhvqNi3fswqAdTmoe
	 mu71WIQk6L+oSlCEQY+RANsdz/kj7txgaF198WqcVYmPZ6R1Vi7+Ow2tgY8Ib5qGQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ru;
	spf=pass smtp.mailfrom=mail.ru;
	dkim=pass header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=2sBlJa5F;
	arc=none smtp.remote-ip=95.163.59.80
Received: from send241.i.mail.ru (send241.i.mail.ru [95.163.59.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E56606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=2sBlJa5F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=t4fbglAcPrxA2vRFmF/rTmX9yQxyaIe8aXQiugqJF7U=; t=1793468743; x=1793558743; 
	b=2sBlJa5FS2Gc2onvDBoVwgXsGlP3IrfhRoxJQZ8j8NezHrEeHEb367c6FJJcsTsCEusj1UrY5Fp
	1SnjKX1dttYH6fcfLSuuK/+JvlSueVAuHE4YwVYvVilNqGQbfNCvdFePo36ipaYKDq8rIySd9oOND
	fcHvtUpx/FgWNFFaScsA7xiAA9R9yTekoH72NF3ZXvOuQYK3nOv8JfQ1eJRZOkNb318h33/NXgpus
	mLVjM13pjtHwsRfjPdiqHGUjktBx7dvcOL/BFN1761CUs7Ru6AD9CRmpffpX4QhXSjOA7W0uKSZvw
	R2JnusbkIOXiDLuOAbYTGE5pcz2XZrZewhig==;
Received: by exim-smtp-675c6798c6-72zrn with esmtpa (envelope-from <s.mavlenkov@mail.ru>)
	id 1xND93-00000000Tgp-3J5C; Sat, 31 Oct 2026 20:45:34 +0300
From: bitey <s.mavlenkov@mail.ru>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <pjakobsson@suse.de>,
	bitey <s.mavlenkov@mail.ru>
Subject: [PATCH v4] drm/i915/display: Add quirk for interlane align bit on CH7511
Date: Sat, 31 Oct 2026 20:45:18 +0300
Message-ID: <20261031174518.10004-1-s.mavlenkov@mail.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260608082500.45902-1-pjakobsson@suse.de>
References: <20260608082500.45902-1-pjakobsson@suse.de>
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
Authentication-Results: exim-smtp-675c6798c6-72zrn; auth=pass smtp.auth=s.mavlenkov@mail.ru smtp.mailfrom=s.mavlenkov@mail.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD943C6AEBB953A11868B9A05538DDD48EA808D1CAF36FB1EF61313CFAB8367EF908E2BE116634AD74DC962550A7C05FB5FA421357250EF31ADBFFEA52BB3F27CA9C5E31B7A8E739F68224C9A2F61B97637
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE776377A057133B646EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375667B1596EEF16A891D10C3F914A2355645963ACA32F3B8FBED51E18396E974CB7C8EEF46B7454FC60B9742502CCDD46D0D062BEEFFB5F8EA3EF6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C0D75EB778CE7D8A0C68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C747589E6AAA3516243847C11F186F3C59DAA53EE0834AAEE
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A54C44E028246F950C5002B1117B3ED696436D8E3A28293F4530C8F815570A35303610D81D389A125CDE35189EBF2DEA281E618B5D5F965AFD1BF51D96AE4B494FB2D1C9E48B6DC60AE2A7E19323554B12787CBDA4B9FA07ACF6AAE36F1AF2432B4EAF44D9B582CE87C8A4C02DF684249CC203C45FEA855C8F
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6599222D52304DBDCD2AE65DB698DCA296A16A405D620AC03824236FA4ECE01622BE78B892AF3917F36B8341EE9D5BE9A0A102C3DC83FFE6E1A4B51B2A63FEF6BF09B8D2FF1C041D53752EE4E5D9E54FDA4F44A2BDFCEC9DBD838705C4085B645248947CB5EE6AA4F0FCFECA0A3B40025F483DB18EBE73F7D69
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4ZrlAo0bq3TDyw5v+G6YiroYwgTYgFAQi6fY=
X-Mailru-Sender: 689FA8AB762F73937C9FA53A4753B3133054573B6CB812E8357DCD99F990607D4A8B2E7A85DF2F57F3CDC8BC78C4DE7BDA68109F586B92E9CCFD498835386E8A2DDEA15287B001569AA14EBBF425EE34BC7555A253F5B2000D4ABDE8C577C2ED
X-Mras: Ok

When disabling pattern training after successful link training the
CH7511 bridge incorrectly clears the DPCD link status bits: not only
INTERLANE_ALIGN_DONE, but also the per-lane CR_DONE, CHANNEL_EQ_DONE
and SYMBOL_LOCKED bits. This is interpreted as a link failure when
rechecking the link status and triggers an endless loop of retraining
sequences.

This patch adds a quirk to pretend the bits are still set and no
retraining is needed. The quirk is matched on the Chrontel IEEE OUI
(F0:02:2B) and the device ID "CH7511" on any platform.

Tested on Ivy Bridge (HD Graphics 2500, device 0152) with a CH7511
DP-to-HDMI adapter on kernels 7.1-rc1, drm-tip and 7.3.

Fixes: 3b3be899fc81 ("drm/i915/dp: Recheck link state after modeset")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15744
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15994
Co-developed-by: Patrik Jakobsson <pjakobsson@suse.de>
Signed-off-by: Patrik Jakobsson <pjakobsson@suse.de>
Signed-off-by: bitey <s.mavlenkov@mail.ru>
---
Changes in v4:
- Also force the per-lane status bits (CR_DONE / CHANNEL_EQ_DONE /
  SYMBOL_LOCKED). On Ivy Bridge the CH7511 zeroes the entire lane
  status registers after training (ln0_1 = ln2_3 = 0x00), so forcing
  only the INTERLANE_ALIGN_DONE bit is not enough to stop the retrain
  loop.
- Rebased on top of v7.3

v3 changes:
- Match on all devices with a CH7511, instead of only VLV
- Rebased on top of drm-tip
- Additional "Closes" tag
---
 .../drm/i915/display/intel_dp_link_training.c   | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.c     | 17 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h     |  1 +
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 9a692f4..a2d5b04 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -43,6 +43,7 @@
 #include "intel_hotplug.h"
 #include "intel_modeset_lock.h"
 #include "intel_panel.h"
+#include "intel_quirks.h"
 #include "intel_psr.h"
 
 /**
@@ -2515,6 +2516,22 @@ intel_dp_needs_link_retrain(struct intel_dp *intel_dp)
 	if (link_recovery_autoretrain_pending(link_training))
 		return true;
 
+	/*
+	 * The CH7511 bridge incorrectly clears all link status bits
+	 * (INTERLANE_ALIGN_DONE, per-lane CR/CEQ/SYMLOCK) when disabling
+	 * the training pattern. Force them to indicate successful training.
+	 */
+	if (intel_has_dpcd_quirk(intel_dp, QUIRK_IGNORE_INTERLANE_ALIGN_BIT)) {
+		u8 lane_eq = DP_LANE_CR_DONE | DP_LANE_CHANNEL_EQ_DONE |
+			     DP_LANE_SYMBOL_LOCKED;
+		int i;
+
+		for (i = 0; i < (intel_dp->lane_count + 1) / 2; i++)
+			link_status[i] |= lane_eq | (lane_eq << 4);
+		link_status[DP_LANE_ALIGN_STATUS_UPDATED - DP_LANE0_1_STATUS] |=
+			DP_INTERLANE_ALIGN_DONE;
+	}
+
 	/* Retrain if link not ok */
 	return !intel_dp_link_ok(intel_dp, link_status) &&
 		!intel_psr_link_ok(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 7d7db77..359bca4 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -94,6 +94,14 @@ static void quirk_disable_edp_panel_replay(struct intel_dp *intel_dp)
 	drm_info(display->drm, "Applying disable Panel Replay quirk\n");
 }
 
+static void quirk_ignore_interlane_align_bit(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	intel_set_dpcd_quirk(intel_dp, QUIRK_IGNORE_INTERLANE_ALIGN_BIT);
+	drm_info(display->drm, "Applying ignore interlane align bit quirk\n");
+}
+
 static void quirk_disable_psr2(struct intel_display *display)
 {
 	intel_set_quirk(display, QUIRK_DISABLE_PSR2);
@@ -289,6 +297,15 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
+	/* Chrontel CH7511 DP-to-LVDS bridge */
+	{
+		.device = DEVICE_ID_ANY,
+		.subsystem_vendor = PCI_ANY_ID,
+		.subsystem_device = PCI_ANY_ID,
+		.sink_oui = SINK_OUI(0x2b, 0x02, 0xf0),
+		.sink_device_id = SINK_DEVICE_ID('C', 'H', '7', '5', '1', '1'),
+		.hook = quirk_ignore_interlane_align_bit,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 970a4fe..7fcc396 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -23,6 +23,7 @@ enum intel_quirk_id {
 	QUIRK_EDP_LIMIT_RATE_HBR2,
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
 	QUIRK_DISABLE_PSR2,
+	QUIRK_IGNORE_INTERLANE_ALIGN_BIT,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.56.0

