Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA38417BD2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204697; cv=none; b=GL0vNFn5wDaZD+Od7ClHIjuBfgeaNr7VkE3lxLE7c3B8NLDL43A0L44UWQEOE/Cjjszg4E/+Ty8Q9PyzOSLto/DtxLqJxbY1k/FbgVfc5o7J3zkSKedGwsCKmozNKisNHtDvdDd0kdE6NpRt6p9iQ6au89EW2lovLY64VqLRfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204697; c=relaxed/simple;
	bh=D5Wpjm5oN3dzkOYfCx8is3WGvUjqM+WV4ReOYryVGW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ak+PynitBOTMUnR3yuoDvFphxAcgDeDd7bRLzqqzMBcu48JhmXE5wJKTZ5rJMoliXwa7KrPw4gcO/QeVkx/+xY0v/BeTaCu9GPKFWaZd43NUFIxnkc5gYN7BmYWcswHEn/2UAzBFY+n63kBK0BrYVK9agwlMd9U7V71NskGm3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf90Jhwt; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf90Jhwt"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so49062066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789204692; x=1789809492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=STiZW/IcHvT4e1S/BFbyfQE4PgoHv6tak0bixvasDdQ=;
        b=pf90JhwtRtLEpH0z6Y5lJdcFxxB26/HGVIeK60q0J9YHSGK9VCctazDBh0zXd5V9NP
         Db9qgN1OCxg+bYDHW9Le3wl35xCHMw/fBTSI3txdCvI8mjpZIeBu7xXk2A3hQDQxAY8j
         MD/QscXwdbXdeVN99IBefcMOmCu1oaFCZXFoWk9xz8JlLLPotGo/CI+ux4gY7AyH0D6M
         W8eyBOuYwtFmruDKYNnAGjAVkwf5TcQukSgtOsewmx3g2K9VQ5x5L5nqnFk7Gzpg4Qm6
         ByxtfJGKv5K+U1I5CGO8wJ5gNX94FW7bsoqSY+zCobnQNIrFLh6GD9JKTZw87k0l5Ul5
         s9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789204692; x=1789809492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STiZW/IcHvT4e1S/BFbyfQE4PgoHv6tak0bixvasDdQ=;
        b=ZzlxmVvA1kzYpda5J01HFhL24gxWyvGBv6qDtxYVDUJ9dBbTxzps29pxlW1Tzsi0sV
         clWsHCaRjQ2FG48jwyP1AjX7xB1VzcpN5z3pwZsKFMpE00z6uZfbwxpnDXZV566K1IJn
         GsaSzGl4+8yL4gTGiTdXhqx/Tu897gHi19bWlA/B056hrRKp6f7H8CF/YCTxICxwfS1c
         5SOYYdx31uP0MbnOJbg4hD/1ON4HvQ7EMsoT3K8yDR2GgH0rB/Z4kYNtzjzDXQhDO7Hc
         9twov5H6pMlDpgCc6qvGO9/LQ/lMTCe0ZiBkcaBhgUTtrJrJacC9lYTEC7i5phWFLmy1
         2XAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/0ViXLPWVmSlsEzxbZUlPO6PIkAJVXVqtqSb3CmpSqRJLMzKDCYOqbINHoWyR0NX659HDlWUdssZQIwY=@vger.kernel.org
X-Gm-Message-State: AFuF++nM3dwSBhf8oF9gTkWg4EYYMj23wAK3IvG+UQHtBqQoGy51H0Qr
	iGm+oRVq0pdEgl8gkSi0eSoq8djk7sBw7+QDGZE0nchP+KLhOHP/UM3w
X-Gm-Gg: AYBFou0/JLfxXGf2NW8kw/qp+4e/tHgnt74Ni/H9FE2FI4nVwocM7Xq49BptTr/4WEv
	bGIcXETUFmcZTe//lC+1EYySMB45wRyxEaRbeQc793wkW87eM+fhwpvqgo0wVslxejV6o75+nr9
	AhaXGa+xLILozeTk3G+xewmEtyRcsiCCmcsFYByrh3gfbB15uCxU5U3PYdDK9Vv3VFTRfeRMk+L
	VaLk6+ya1aT/8qY7Ev6rfKcwPBnEnLVup0N2amE8UsNFYA6dhSopgAGn1HcrLUMCflsGzzYUJP1
	rJn1Vg5BRsl+uAf6zSyPCpNvXbsUS+aLTLaWIEVO2Q0YoBcI4F0h1iiBTdwG4Pal6Eq6spYZ3Ez
	GPlxypo962QLb/KgkGMVLFvHiKHrsIZcF5v9G6CVNLOv52p8c0bvoRbjROZ7ah8yGHdXRnTo/Kt
	4YreS9KvdK8bn7AODUeKO/TEHtf6zjkPNIXO6R3zGvW57P75mBF2sGQFXO/YQ6p8kqt6L9KuPJz
	kynY+jB6p3beWHDQZhe
X-Received: by 2002:a17:907:3c86:b0:c25:f7db:4bef with SMTP id a640c23a62f3a-c2962c9944bmr512031466b.21.1789204691464;
        Sat, 12 Sep 2026 02:18:11 -0700 (PDT)
Received: from cartold.tail1da87c.ts.net ([77.213.69.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234e7sm170786066b.15.2026.09.12.02.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:18:11 -0700 (PDT)
From: Theo Andersen Carton <andersen.theo@gmail.com>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Theo Andersen Carton <andersen.theo@gmail.com>
Subject: [PATCH] drm/i915/ddi: add DDI A force 4 lanes quirk for Apple MacBookPro11,5
Date: Sat, 12 Sep 2026 11:18:05 +0200
Message-ID: <20260912091805.531666-1-andersen.theo@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On dual-GPU Retina MacBooks the internal panel is muxed to the discrete
GPU at boot, so Apple's firmware never lights up eDP on the Intel side.
As a result it never sets DDI_A_4_LANES, and intel_ddi_max_lanes() reads
back a source maximum of two lanes for port A.

intel_dp_max_common_lane_count() then takes min3(source_max = 2,
sink_max = 4, ...) = 2, giving 2 x 2.7 Gbps x 8/10 = 4.32 Gbps of link
bandwidth. The panel's native 2880x1800@60 8bpc mode needs 8.1 Gbps, so
every mode is rejected with MODE_CLOCK_HIGH and the connector comes up
with no usable modes at all -- the panel stays dark whenever i915 is
made to drive it, which looks like a hardware limitation but is not.

The lanes are physically there. Reading the panel's DPCD from the AMD
side, where amdgpu drives it correctly, reports MAX_LANE_COUNT = 0x84,
i.e. 4 lanes, and amdgpu's own link_settings shows it running the panel
at 4 lanes / HBR. macOS likewise drives this panel from the iGPU at its
native resolution, so all four lanes are routed through the gmux to
DDI A. Only the register bit is unset.

intel_ddi_a_force_4_lanes() already exists for exactly this situation --
its neighbouring comment notes that "Some BIOS might fail to set this
bit on port A if eDP wasn't lit up at boot" -- but it only covers
Broxton and Geminilake. Extend it with a DMI quirk so affected Macs get
the correct lane count too.

The DMI match is deliberately narrow. Other dual-GPU models in the same
family are very likely affected identically, but they are untested, so
widen the match only as reports come in.

Tested on a MacBookPro11,5 (Broadwell, Iris Pro + Radeon R9 M370X):
with the quirk, DDI A comes up as 4 lanes, link training passes at
link rate 270000 / lane count 4, and i915 drives the internal panel at
its native 2880x1800.

Signed-off-by: Theo Andersen Carton <andersen.theo@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c    |  7 +++++
 drivers/gpu/drm/i915/display/intel_quirks.c | 34 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 02a53c9848e1..f746287830b3 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4976,6 +4976,13 @@ static bool intel_ddi_a_force_4_lanes(struct intel_digital_port *dig_port)
 	if (display->platform.geminilake || display->platform.broxton)
 		return true;
 
+	/*
+	 * Machines whose firmware leaves eDP dark on the Intel side never set
+	 * the bit, so trust the quirk rather than the register.
+	 */
+	if (intel_has_quirk(display, QUIRK_DDI_A_FORCE_4_LANES))
+		return true;
+
 	return false;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 33245f44c0d5..feb28956a013 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -100,6 +100,20 @@ static void quirk_disable_psr2(struct intel_display *display)
 	drm_info(display->drm, "PSR2 support not currently available for this setup, applying disable PSR2 quirk\n");
 }
 
+/*
+ * Dual-GPU Macs boot with the internal panel muxed to the discrete GPU, so
+ * the firmware never lights up eDP on the Intel side and consequently never
+ * sets DDI_A_4_LANES -- even though all four lanes are wired through the gmux
+ * to DDI A. Without the bit, port A is capped at two lanes, which is not
+ * enough bandwidth for the panel's native mode, leaving the connector with no
+ * usable modes at all.
+ */
+static void quirk_ddi_a_force_4_lanes(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_DDI_A_FORCE_4_LANES);
+	drm_info(display->drm, "Applying DDI A force 4 lanes quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -142,6 +156,13 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
 	return 1;
 }
 
+static int intel_dmi_ddi_a_force_4_lanes(const struct dmi_system_id *id)
+{
+	DRM_INFO("DDI A is 4 lanes despite firmware on %s\n", id->ident);
+
+	return 1;
+}
+
 static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 	{
 		.dmi_id_list = &(const struct dmi_system_id[]) {
@@ -188,6 +209,19 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
 		},
 		.hook = quirk_no_pps_backlight_power_hook,
 	},
+	{
+		.dmi_id_list = &(const struct dmi_system_id[]) {
+			{
+				.callback = intel_dmi_ddi_a_force_4_lanes,
+				.ident = "Apple MacBookPro11,5",
+				.matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+					    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro11,5"),
+				},
+			},
+			{ }
+		},
+		.hook = quirk_ddi_a_force_4_lanes,
+	},
 };
 
 static struct intel_quirk intel_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 970a4fe52faf..d2b8e9183c62 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -23,6 +23,7 @@ enum intel_quirk_id {
 	QUIRK_EDP_LIMIT_RATE_HBR2,
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
 	QUIRK_DISABLE_PSR2,
+	QUIRK_DDI_A_FORCE_4_LANES,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.55.0

