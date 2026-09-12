Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061E3624BC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203610; cv=pass; b=ahO34P2xPs7MQARGs5QZAS4XZOehOjUmwnKIVV+8d0VeHCrfMQP05ve0K7+6ibuud4xo7YpoqIY+tSD23QSRcuzLELWeJZlCyhNY/6fDFT2LKGwjxZVtFEtYxwGYTvR0ncpO4zTOMgElpRg8//6h0oxvN7c2eh+wru06PgACdg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203610; c=relaxed/simple;
	bh=UQLn96xekyQ0qXoe6vf8gIvQ4fhAH5i4jtscaV6b1GA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sbbl/FT92NTDEV6LoTbn5veSWp4YuRPyDB/+ZSqaaITbteFffxnzeLAASgz4pfol9TBwjvE34vBUCgC97rCZKu7qNiPPNDId46bUUCna7xqMU0MWZIiC5hbaqfW9KcCAfBO9GIhXiBnuScqqR7sF0USCcmaaDMyemUBuZnuqhF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBi3WKA2; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBi3WKA2"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ff2313so48378466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789203607; cv=none;
        d=google.com; s=arc-20260327;
        b=rKtHpRmpap9GVMSrDLFkRGd3xTzkYpBMNJhYNiivqqIF2+gRzaEEzWEs5mUrCS8FDW
         rMiAdlo9us8y9D2Ow9gIEw0huwgpVgVfWiZZd+u8k9XNxpSqba3REMgUlcccVhik7QTn
         1c5Rdb5sxTtq7JqwwX1q5WXuHw7dBg8Thum5bOk+q1Ca/UcXUJDpN4AALXVL+Lbm1DS3
         fXWd05cQmDgEbc6NY5R5uCq+QPMuaNYMl7IJV9efu1XS92PNqQsYScHOERTMs7SWoA4v
         /O5bA2Vo6aSXlqga4ox0iF5imvaVcoQkmZfLwkj+m7ZzQhEhQ2VF0O49z76UK19fpkiJ
         o07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WCT0+gv9JmQdBqllyCgHijfl0um7k0RWeP6aTzXVQp0=;
        fh=6lqmrzJxhq+9V6z1ufLr8evhaxPPlWtxBOgFsOPXmMU=;
        b=LKmx4bB3w32x+yt8OAp+iwGLrjdCzFLEj/gakQZ7DXOTC9bdb1cOqdG2Jey9LDG8T2
         RY9FmQ4CLfSpy6M5nURcn/TRmlv/elFTTI+xKeutAHqp4gQQi4gAxLIKco/GXIfNBg+L
         Ad0ZTGpM7jVXRCvMaHUoKvUtWL2qGvNxOpUlwEtHhW7g34lw5S0whLNXgG4BN3WxTgNX
         Qo4NVkWQi+5H7enQZ+T6D7e4JRtm5BgRKMC1rlvY7u1Ht1HXmOsz0su+XW8Y612BYj+2
         djPIA9WkZMasiuc7a1tBTPhCE0G8mdgblOzcwBmG1lbIixsf1+ubzs0Slv87k3YdOhtJ
         t8Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789203607; x=1789808407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCT0+gv9JmQdBqllyCgHijfl0um7k0RWeP6aTzXVQp0=;
        b=mBi3WKA2N/Z3JeDQWaZrRtcpNU7NVR/ZV7HqZManvhGSeBiIXGKz+iRsq23FKV7l3A
         Xf5zlnwOxvE4Qouy4mnj2vlFNCa/sksZmvPmasDvyqr+aogpjoluBChajp59zCfBtFFc
         MtMSXMd45+Y8JaXajrmQKg8Yz2bhDtV1AiQm0p9ec1OWIZMX6EhMvL/20p6ScwtGzRSf
         0FbqoXqddxHnhDYm+BgcjvwlKuc1XqXVIi9z5RQBzuZ9bXR5DsHFW+KMiiD4djrzek+0
         Df/jyi3ARvmND53gwM148RYuG3EnpK22z/Eimn+qNNCddwz+tyg9zUxjYeT4X5jNVUQO
         XvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203607; x=1789808407;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WCT0+gv9JmQdBqllyCgHijfl0um7k0RWeP6aTzXVQp0=;
        b=SFYFOV1vJi+ue4l6wg1BC71v99DJk86c02+lhOg0BBvQknf3V8LqDlvHgGIrWEUOUF
         jWIlbt1dhEhhChKuKLY/9XTFFd5VKmlwkAqYwxMo7sxfqYzpG6hZo+7xhfLPZasozwdN
         RAlq/2yL6BsHmjjSEBrIN56YcoXvnndVVOeeCFQdwq4vFYZyjGjNQJYKPSrYSX8yix3l
         UXP58Rng67HQAyKsdXjrQ+L6SJobEmBOq8jsEq+N+rJNXYKRTM/Sibln+zxMSb4Q88VA
         uaeTHuEp2kLdN1mRkQGIslSncoO2EDj1KJp+A2fs6lFC+GV2LdAEBjvqRJXSekEodyPc
         Cx0w==
X-Forwarded-Encrypted: i=1; AKwUvBwOWrZqCpQb2pxGNj5Xq1jLyUmXrijZ2o7egCcmUh0qW0vN/hjySNNBPNe63m/wEReis3rZUXPz5x7sf/s=@vger.kernel.org
X-Gm-Message-State: AFuF++koHGEyVbVLRFqtUZMEw1X7BIjsFuXuriz+kyV5q7yIbZLnhbYh
	WlFLeU6sVXfWF/AZ/pqgS9++XVnXnDIB+1va+JuSQ3xZYVVBkjwFQtV04dcei7pzOvJPMkY6/FB
	dLoSGWPlqRwombu9EdUVL8p3IreSx7wY=
X-Gm-Gg: AYBFou1JXq2fUEuEaE2l/OLvQ7NvEQEb/QvtfSVncdto11yPrODyemp6tAdYackqCV3
	XlqcNOTKHM+Gm6+DkLZrUIlQJ9cajTHh7+q6JJZf2fCHykIBghsz5ShEHlM8vQ+Va/Cz4JIC/tH
	/d7pRjuyJfwRPA3//3CmJXWIy/TFU3es6CkAuuzWl7w2W1KMQYLRQGgz0g5fTyhXPwbr5WTSuDN
	Ouwr6v59aFy7ZsBdsgHRmNqB2YvKIQp4yKrRxMrzasi95hljITQphBQXMm3Ip347m/ULXQlour0
	Upf4XXYEeEMI3FXIvP6QrSSqKHLLTSctpZwrya745AvhiLiuK5IS2g==
X-Received: by 2002:a17:907:3f20:b0:c29:58ae:8327 with SMTP id
 a640c23a62f3a-c2962c8a439mr511541966b.19.1789203606684; Sat, 12 Sep 2026
 02:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Theo Andersen Carton <andersen.theo@gmail.com>
Date: Sat, 12 Sep 2026 10:59:55 +0200
X-Gm-Features: AcwNN1XIwcl6bWbN5jv4kI4IsYuPAdJ2UAe5lOJ64SbegT19zk8Ge8XZXviCxbs
Message-ID: <CANFnrspHiK7ii28XPdLkOMyhSZcJ9xz6CT-kNX+oiiF+8N-2Fg@mail.gmail.com>
Subject: [PATCH] drm/i915/ddi: add DDI A force 4 lanes quirk for Apple MacBookPro11,5
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com
Cc: joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com, 
	simona@ffwll.ch, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On dual-GPU Retina MacBooks (mid 2015 fx) the internal panel is muxed
to the discrete
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

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
b/drivers/gpu/drm/i915/display/intel_ddi.c
index 02a53c9848e1..f746287830b3 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4976,6 +4976,13 @@ static bool intel_ddi_a_force_4_lanes(struct
intel_digital_port *dig_port)
  if (display->platform.geminilake || display->platform.broxton)
  return true;

+ /*
+ * Machines whose firmware leaves eDP dark on the Intel side never set
+ * the bit, so trust the quirk rather than the register.
+ */
+ if (intel_has_quirk(display, QUIRK_DDI_A_FORCE_4_LANES))
+ return true;
+
  return false;
 }

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c
b/drivers/gpu/drm/i915/display/intel_quirks.c
index 33245f44c0d5..feb28956a013 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -100,6 +100,20 @@ static void quirk_disable_psr2(struct
intel_display *display)
  drm_info(display->drm, "PSR2 support not currently available for
this setup, applying disable PSR2 quirk\n");
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
+ intel_set_quirk(display, QUIRK_DDI_A_FORCE_4_LANES);
+ drm_info(display->drm, "Applying DDI A force 4 lanes quirk\n");
+}
+
 struct intel_quirk {
  int device;
  int subsystem_vendor;
@@ -142,6 +156,13 @@ static int intel_dmi_no_pps_backlight(const
struct dmi_system_id *id)
  return 1;
 }

+static int intel_dmi_ddi_a_force_4_lanes(const struct dmi_system_id *id)
+{
+ DRM_INFO("DDI A is 4 lanes despite firmware on %s\n", id->ident);
+
+ return 1;
+}
+
 static const struct intel_dmi_quirk intel_dmi_quirks[] = {
  {
  .dmi_id_list = &(const struct dmi_system_id[]) {
@@ -188,6 +209,19 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
  },
  .hook = quirk_no_pps_backlight_power_hook,
  },
+ {
+ .dmi_id_list = &(const struct dmi_system_id[]) {
+ {
+ .callback = intel_dmi_ddi_a_force_4_lanes,
+ .ident = "Apple MacBookPro11,5",
+ .matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+    DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro11,5"),
+ },
+ },
+ { }
+ },
+ .hook = quirk_ddi_a_force_4_lanes,
+ },
 };

 static struct intel_quirk intel_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h
b/drivers/gpu/drm/i915/display/intel_quirks.h
index 970a4fe52faf..d2b8e9183c62 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -23,6 +23,7 @@ enum intel_quirk_id {
  QUIRK_EDP_LIMIT_RATE_HBR2,
  QUIRK_DISABLE_EDP_PANEL_REPLAY,
  QUIRK_DISABLE_PSR2,
+ QUIRK_DDI_A_FORCE_4_LANES,
 };

 void intel_init_quirks(struct intel_display *display);
--
2.55.0
