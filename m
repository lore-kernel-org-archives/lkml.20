Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062759E334
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898043; cv=none; b=SptNIcZ+pwlcwtxvUsw85/dUnsn0FsNUooCSZOpUL9gWcpaWDdwatUI1zd89r8zEZrDLUk+O1xP3n79pumKjBEnS5t6+lzTdfdjaa9ro34lQO0J3LKr7MeVM+ZVMHpV9CuegtWjWzSbq9C6dDmqDJma00E3FntgWir/iMkcHnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898043; c=relaxed/simple;
	bh=greMdNN8ftu5kh92FD9tloglUl7E4xNgVO5CufLeLQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=km3ASXyZ7k7vfbS+0DF1jjAYMkTPVWyEnDeb3B511iCWksVo2kwqFibH66WXH72HqFq4ij8QQ6l0npIkeYhXWnD1zJJibQS00SXp9JjKPmqMLNts6Il2Lm25/p9YenoEAsg9OINgnWVC7RWGxKk6qZVfcsYc+nGnsbx8XjurfJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=IsGe1pGR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="IsGe1pGR"
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 170142FC008B;
	Tue,  8 Sep 2026 22:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1788898033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7o/89PLTN4U51tEmLs7Y8nmhdGxBiG8G10SgvfZEyj0=;
	b=IsGe1pGRz2pjAljjYyLmBLdHTwqhdOlKHwiH5yWyvwhZroQjJb6Ekpbs7T0em+w/0MDdlR
	LOU1mL+qpxYcj6h32WqR+sfTaE7HQlMI772tX1Rd7e13bin/QmwNp9fkK6o5UvsOlOUsXU
	Iv3a6OsQ/+Lk3omJ9tUEVbeEsJJHp/c=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/intel: Add quirk to disable rc6 on some TUXEDO devices
Date: Tue,  8 Sep 2026 22:05:29 +0200
Message-ID: <20260908200707.65516-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908200707.65516-1-wse@tuxedocomputers.com>
References: <20260908200707.65516-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some TUXEDO devices have random rare hard resets during video streaming.

Disabling rc6 fixes this. Until the root cause is found this is a pragmatic
workaround.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 11 +++++++++++
 include/drm/intel/pciids.h      | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 2f03f95945f1b..a52b56bedcf4f 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -687,6 +687,16 @@ static const struct intel_device_info adl_p_info = {
 	.dma_mask_size = 39,
 };
 
+static const struct intel_device_info adl_p_tux_ibp8_quirk_info = {
+	GEN12_FEATURES,
+	PLATFORM(INTEL_ALDERLAKE_P),
+	.platform_engine_mask =
+		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
+	.__runtime.ppgtt_size = 48,
+	.dma_mask_size = 39,
+	.has_rc6 = 0,
+};
+
 #undef GEN
 
 #define XE_HP_PAGE_SIZES \
@@ -863,6 +873,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_DG1_IDS(INTEL_VGA_DEVICE, &dg1_info),
 	INTEL_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_info),
 	INTEL_RPLU_IDS(INTEL_VGA_DEVICE, &adl_p_info),
+	INTEL_RPLP_TUX_IBP8_QUIRK_IDS(INTEL_VGA_DEVICE, &adl_p_tux_ibp8_quirk_info),
 	INTEL_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_info),
 	INTEL_DG2_IDS(INTEL_VGA_DEVICE, &dg2_info),
 	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 7a4a5658942d2..e4f74916a62c2 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -712,6 +712,28 @@
 	MACRO__(0xA7AC, ## __VA_ARGS__), \
 	MACRO__(0xA7AD, ## __VA_ARGS__)
 
+#define INTEL_RPLP_TUX_IBP8_QUIRK_IDS(MACRO__, ...) \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA720, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A0, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7A8, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AA, 0x1D05, 0x130F, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124A, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124C, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x124E, ## __VA_ARGS__), \
+	MACRO__##_SUB(0xA7AB, 0x1D05, 0x130F, ## __VA_ARGS__)
+
 /* RPL-P */
 #define INTEL_RPLP_IDS(MACRO__, ...) \
 	MACRO__(0xA720, ## __VA_ARGS__), \
-- 
2.43.0

