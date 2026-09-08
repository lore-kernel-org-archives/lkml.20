Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D285A5159
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898043; cv=none; b=NVg7AKV1Et86jiTAckL/nGPyz3nZEKHdRgexbzzUNZYS7BRxGEJK2oXP+gzAIEPfinoK8rQpxwZAsGesbMbXbEDO+fyx3p3S/LvYYgaNcC5sLCLK/a1oAG0Ba68tQRktl4cpEs0GMNHYfaFU/Wib9baE2aLwFGhm1vpSMrKqSr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898043; c=relaxed/simple;
	bh=svsMQexDJ+mrFjZZ2r/mt1kVT/0rkUofReDbklUM84c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXaUZS9/s+wX9wirMXIoeb41sCDXnBjZJDFCAzxN9jggYO5s0V359SG5GJdBPNHyiXJRayO7RuVr7zlIHkhYLR4+KnxWjRd83tqDzvRe8N2bpre+vr62Az5TscqkT24e27oOzjCIYrfBh/N3eD+wvroNmuRMSwevVu/bRfG6ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=DzegxdjM; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="DzegxdjM"
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 22F572FC008A;
	Tue,  8 Sep 2026 22:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1788898032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tJh7oIHd1OG30e5MZpyMaDewB+zPIeuZm1jBsMBTEcY=;
	b=DzegxdjMqhq8SYznp89XG4EiXmKtKbUqvOZvPQ7nUpd/VRGml1RbrAhqlJBFEbIknXpURo
	/UzzbDmgK3FUbDA5udfAPkxaMmHKH8GLQhC4xbdvGHzVgxsQIwf87CQJS8gOiZ0VXKDGiz
	I8b5ROpfY4w6g8J+wleESC+f4J3pr4E=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/intel: Generalize PCI ID macro for subvendor and subid
Date: Tue,  8 Sep 2026 22:05:28 +0200
Message-ID: <20260908200707.65516-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize INTEL_QUANTA_VGA_DEVICE macro by introducing a
INTEL_VGA_DEVICE_SUB macro that takes subvendor and subid in addition to
id.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 include/drm/intel/pciids.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index dff389b56eb3b..7a4a5658942d2 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -37,9 +37,8 @@
 	.driver_data = (kernel_ulong_t)(_info), \
 }
 
-#define INTEL_QUANTA_VGA_DEVICE(_info) { \
-	.vendor = PCI_VENDOR_ID_INTEL, .device = 0x16a, \
-	.subvendor = 0x152d, .subdevice = 0x8990, \
+#define INTEL_VGA_DEVICE_SUB(_id, _subvend, _subid, _info) { \
+	PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, (_id), (_subvend), (_subid)), \
 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
 	.driver_data = (kernel_ulong_t)(_info), \
 }
@@ -180,7 +179,7 @@
 	INTEL_IVB_D_IDS(MACRO__, ## __VA_ARGS__)
 
 #define INTEL_IVB_Q_IDS(MACRO__, ...) \
-	INTEL_QUANTA_VGA_DEVICE(__VA_ARGS__) /* Quanta transcode */
+	MACRO__##_SUB(0x016A, 0x152D, 0x8990, ## __VA_ARGS__) /* Quanta transcode */
 
 #define INTEL_HSW_ULT_GT1_IDS(MACRO__, ...) \
 	MACRO__(0x0A02, ## __VA_ARGS__), /* ULT GT1 desktop */ \
-- 
2.43.0

