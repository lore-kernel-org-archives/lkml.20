Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286874;
	b=hNk/pd9559hZ0Q8Lzt769eeLnUKuUMphbWXvgoKNDSLKE3VfGRwUmzO6ryfWVBSc7pPE
	 dF6hwUKjo6qIFReBjBKQ6C6mMByDABMmGnhMtYnDxcClSRtqud0ooPRcOTCweOr0COr3x
	 2SkHOI4Mx0mfW+JzsgLnqGi9Xrib0cT6O/tARSPTvRg7GO6EzhKfqb53BQLrKbjgFJ1xs
	 EPpaWZKs2sXYu0Nmi2cfupo+T8JsMzolj7aT/u6VKxM5DJvGV8qIHbH3kutBJ1X/35fVG
	 0K39Ls6qZArc7iPP3WuCWzPYeWE++qifqy0VO1cTjsrlm9gnSmwECkiYaN3iPUwbmyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=656z9fhQ5cGnqtPuc95+Ef4gq6f7TVUGHYROSC69+kM=;
	b=eX+hO8y24vc+jjzE46Xdya28dFn/4aUWRQQIfyaClIuBCaEDszc7kheGRGIGAXlseChQ
	 ddGo2nq178Wr7QE48kXaCRfmh8v8IoCQjfO3T2BzbQ50bDeRkSmBzEECyV9Q/OeA9FIjU
	 FVGwBiXu8NUmPgwD/pPujZ+0D08HuGhzpJo7QOKX1aL5R8U2/u1YiObTxDSFbBkkP3+5y
	 k46bHZXXS4iAClSxOK2v+BO2HIyc6JudUTmxsbEkRozX5uWUuOWS2pglMsXTo1OvtL5JF
	 yC2//m6swPz3KZXNk6ykzxLqrYsuwel38YSIBNchqUjC+y4t0GySvxOeymsXVwTZ19g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pplmasxf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C11606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C11606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pplmasxf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1315922f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793286872; x=1793891672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=656z9fhQ5cGnqtPuc95+Ef4gq6f7TVUGHYROSC69+kM=;
        b=PplmasxfMVqu/03omaiPwWqfYhc/HSspGiptKX9Jplg5TBCNzqTg6WUX4QhaNgtbbO
         SUrL4uOWc5Qr/W5SQJy3L9OIMcirbqV1fJUAuEnIeu6ZOxAaylRpVT3WLImylqcpsmpA
         zm5b7yM4fZgLSjF4BJvlgmVPiCoOvhKPFG8tOrlRe2zbN+Uxbsllg4fhpqcmVqTknyI2
         2kLNYYGK4VvCJUBEIDSIrPzQ+09OFhLyh/uHu8PIJPxIU/lPQypNbcWGY/SRE5GrBx5h
         YBhrAAqekmtMpYAYLhTS+QdCbSC71gfnIencqH7VFIBXWdzgLzNYi97GER3NZIYeNTgg
         IvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286872; x=1793891672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=656z9fhQ5cGnqtPuc95+Ef4gq6f7TVUGHYROSC69+kM=;
        b=fWgtT804MeCNPA2zq+/Z2tjOV+7SifxJmxbm6LIp24ktjHWa8tD1b7eoYeqMtxXNmi
         7XtcocqB6ENSfq+GaG7Q0+P3kJcUFTXmEI6yCXkP1zG/7pLR03Pw2wAYA+vPQwb984b3
         tnfKazheQVntyToIZO5G35sLcJ9uOcwevpVoMNaPVD4XoGgSLis0wwSk/MSvWpyh5lHM
         IiMySHYQWxr0wWbOZBojPtuPF59m3odZdI/P2ukzoMx2/NXKmvFWxeR9LE4oH7SHfMay
         dtoP6vozeoiL0NORAYJ20+O391TuDapGnfqo0rMIB5IJ4h9d2c69dj4yeMqT0Q9o/1y2
         uE4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwstX1UEJNUW37Sw7Doe+RgEDhQZQRZ9kD814YDDtEkJcla1OuHpAiXxSOB+nxdmEqmUnhecPOj4zTpBjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ8u3o/NlxCHiVS2483kzQnw0TVV9OR2VVvG4DbeAENA6XwPfy
	tJYFoloEezNmoKq0tchzt1VUcRheZhAza5nJG4Yt1g4gOgoOplCSG5oLpCc2VzjbGA==
X-Gm-Gg: AYBFou3FN2DMyn3fUK4u3g5f8THAMsZFp/5GmkE+Q8vydHh7nGGGB6M0EapWfSnZHfn
	miZxOrcMKc+ePFGW51pTtkdpEA8w2DkyEd9QzAhUqwZPS2ccqZzCA4hqI56vAAD6QsUyX1QdWKL
	0o4Fj1S7xHH68N9XzarOIqi0JJIBG+8qbY8tO7EDU04yKxrR4+PODb1bGIwZ1g1Rd1wKk+YWLE5
	dos4WGx27hcoYOZWMCp4wXNKJrC19HmOu7im7VsMCXv/gNOB5zilo1oa54g9NHtVhu7mALPAbdM
	vE0LwP2TH2RayekW79SoVOIHdQOEmjDlIMm1j1F14/kxHLc5CepGSX9A+nYYKDtl63mKPVRB3P7
	4KdED8k9hhtbNEcaV61qohd+qDnVQmCobqOdqVtWp1uhe0aadFPbmlgIzE0manyfCJoYtYUuvAP
	Hsg3U767CfX87BQ2XfIQjt6YBvYQo1amZUwtUQXbvPTCX+J/SGe+5SuI//JI/vZsthoXvLoQCXR
	38V5jtV7wDG0ncn9jwDMpEI0BzyaciJiB96xw3Wkpa6uwG/tYAVDnVNtYBvOVQiUOxeNjwzQn75
	n2RlpaNsXNypp43uToAe1R/Ucd71yTKAF1WXp3WO90vQKi4OpyZrod/7G27e9J78pB1Ry9LqqXl
	pXXjM4DbjCTSVbrdUVviL/A==
X-Received: by 2002:a05:6000:161d:b0:48e:641b:477a with SMTP id ffacd0b85a97d-48e641b47bamr5341390f8f.52.1793286872058;
        Thu, 29 Oct 2026 08:14:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm30191373f8f.26.2026.10.29.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:14:31 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: amd-gfx@lists.freedesktop.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: superm1@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu: handle broken dGPU hotplug GPE on ASUS ROG Strix G513QY
Date: Thu, 29 Oct 2026 15:14:22 +0000
Message-ID: <20261029151422.56791-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029151422.56791-1-mike@fireburn.co.uk>
References: <20261029151422.56791-1-mike@fireburn.co.uk>
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

The AMD CPM D3cold table on the G513QY (BIOS 335) handles the dGPU
hotplug GPE with:

  Method (_L05) { Notify (\_SB.PCI0.GPP0.VGA, 0x81) }

On this board the Navi 22 sits behind its on-package PCIe switch, so
the dGPU node is \_SB.PCI0.GPP0.SWUS.SWDS.VGA_ and every hotplug on the
USB-C DP alt mode port while the dGPU is in D3cold logs:

  ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.GPP0.VGA], AE_NOT_FOUND
  ACPI Error: Aborting method \_GPE._L05 due to previous error (AE_NOT_FOUND)
  ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_L05]

The notify is lost, the dGPU stays powered off and the external
displays stay dark. Masking the GPE (acpi_mask_gpe=0x05), the usual
workaround, removes the errors but also the hotplug.

On boards listed in a DMI table, and only when the notify target does
not resolve, install a handler for the GPE in place of the _Lxx method.
It requests a runtime resume of the dGPU, which re-detects all links and
sends a hotplug event, and re-arms the level-triggered GPE from a
delayed work so it cannot storm while the dGPU powers up. If the
firmware is fixed, or the path is supplied by an SSDT override, the
firmware method is left in charge.

Other boards using the same CPM table may need adding to the list.

Link: https://forum.endeavouros.com/t/boots-into-black-screen-unresponsive-amd/49430
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 103 ++++++++++++++++++++++-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index deb63122828d..d8a7fea8be9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -642,6 +642,9 @@ struct amdgpu_device {
 	bool				accel_working;
 	struct notifier_block		acpi_nb;
 	bool				acpi_dgpu_notify;
+	bool				acpi_hpd_gpe_installed;
+	u32				acpi_hpd_gpe;
+	struct delayed_work		acpi_hpd_gpe_work;
 	struct notifier_block		pm_nb;
 	struct amdgpu_i2c_chan		*i2c_bus[AMDGPU_MAX_I2C_BUS];
 	struct debugfs_blob_wrapper debugfs_vbios_blob;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index a4041f90b374..182791f4cc86 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -25,6 +25,7 @@
 #include <linux/pci.h>
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/dmi.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
 #include <linux/power_supply.h>
@@ -1297,6 +1298,103 @@ static void amdgpu_acpi_dgpu_notify(acpi_handle handle, u32 event, void *data)
 	pm_request_resume(adev->dev);
 }
 
+/*
+ * Some AMD CPM D3cold tables handle the dGPU hotplug GPE with
+ * Notify(\_SB.PCI0.GPP0.VGA, 0x81), but on boards where the dGPU sits behind
+ * an on-package PCIe switch the node is \_SB.PCI0.GPP0.SWUS.SWDS.VGA_, so the
+ * _Lxx method aborts with AE_NOT_FOUND and the dGPU is never woken. On those
+ * boards take over the GPE and do what the notify would have done.
+ */
+struct amdgpu_acpi_hpd_gpe_quirk {
+	const char *notify_path;
+	u32 gpe;
+};
+
+static const struct amdgpu_acpi_hpd_gpe_quirk g513qy_hpd_gpe = {
+	.notify_path = "\\_SB.PCI0.GPP0.VGA",
+	.gpe = 0x05,
+};
+
+static const struct dmi_system_id amdgpu_acpi_hpd_gpe_quirks[] = {
+	{
+		.ident = "ASUS ROG Strix G513QY",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "G513QY"),
+		},
+		.driver_data = (void *)&g513qy_hpd_gpe,
+	},
+	{}
+};
+
+/* GPE handlers run in interrupt context; the GPE stays disabled until the work re-arms it */
+static u32 amdgpu_acpi_hpd_gpe_handler(acpi_handle gpe_device, u32 gpe, void *data)
+{
+	struct amdgpu_device *adev = data;
+
+	pm_request_resume(adev->dev);
+	schedule_delayed_work(&adev->acpi_hpd_gpe_work, msecs_to_jiffies(500));
+
+	return 0;
+}
+
+/*
+ * Re-arm after a delay: the GPE is level triggered and may stay asserted
+ * while the dGPU powers up, so this bounds the rate at which it refires.
+ */
+static void amdgpu_acpi_hpd_gpe_work(struct work_struct *work)
+{
+	struct amdgpu_device *adev =
+		container_of(work, struct amdgpu_device, acpi_hpd_gpe_work.work);
+
+	acpi_finish_gpe(NULL, adev->acpi_hpd_gpe);
+}
+
+static void amdgpu_acpi_hpd_gpe_init(struct amdgpu_device *adev)
+{
+	const struct amdgpu_acpi_hpd_gpe_quirk *quirk;
+	const struct dmi_system_id *id;
+	acpi_handle handle;
+
+	id = dmi_first_match(amdgpu_acpi_hpd_gpe_quirks);
+	if (!id)
+		return;
+	quirk = id->driver_data;
+
+	/* Firmware (or a table override) already provides the notify target */
+	if (ACPI_SUCCESS(acpi_get_handle(NULL, quirk->notify_path, &handle)))
+		return;
+
+	adev->acpi_hpd_gpe = quirk->gpe;
+	INIT_DELAYED_WORK(&adev->acpi_hpd_gpe_work, amdgpu_acpi_hpd_gpe_work);
+	if (ACPI_FAILURE(acpi_install_gpe_handler(NULL, quirk->gpe,
+						  ACPI_GPE_LEVEL_TRIGGERED,
+						  amdgpu_acpi_hpd_gpe_handler,
+						  adev)))
+		return;
+	if (ACPI_FAILURE(acpi_enable_gpe(NULL, quirk->gpe))) {
+		acpi_remove_gpe_handler(NULL, quirk->gpe,
+					amdgpu_acpi_hpd_gpe_handler);
+		return;
+	}
+
+	adev->acpi_hpd_gpe_installed = true;
+	dev_info(adev->dev, "handling dGPU hotplug GPE 0x%02x (%s missing)\n",
+		 quirk->gpe, quirk->notify_path);
+}
+
+static void amdgpu_acpi_hpd_gpe_fini(struct amdgpu_device *adev)
+{
+	if (!adev->acpi_hpd_gpe_installed)
+		return;
+
+	acpi_disable_gpe(NULL, adev->acpi_hpd_gpe);
+	cancel_delayed_work_sync(&adev->acpi_hpd_gpe_work);
+	acpi_remove_gpe_handler(NULL, adev->acpi_hpd_gpe,
+				amdgpu_acpi_hpd_gpe_handler);
+	adev->acpi_hpd_gpe_installed = false;
+}
+
 /* Call all ACPI methods here */
 /**
  * amdgpu_acpi_init - init driver acpi support
@@ -1343,12 +1441,14 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
 	register_acpi_notifier(&adev->acpi_nb);
 
 	if (!(adev->flags & AMD_IS_APU) && ACPI_COMPANION(adev->dev) &&
-	    adev->pm.rpm_mode == AMDGPU_RUNPM_BOCO)
+	    adev->pm.rpm_mode == AMDGPU_RUNPM_BOCO) {
 		adev->acpi_dgpu_notify =
 			!acpi_dev_install_notify_handler(ACPI_COMPANION(adev->dev),
 							 ACPI_DEVICE_NOTIFY,
 							 amdgpu_acpi_dgpu_notify,
 							 adev);
+		amdgpu_acpi_hpd_gpe_init(adev);
+	}
 
 	return 0;
 }
@@ -1369,6 +1469,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
  */
 void amdgpu_acpi_fini(struct amdgpu_device *adev)
 {
+	amdgpu_acpi_hpd_gpe_fini(adev);
 	if (adev->acpi_dgpu_notify) {
 		acpi_dev_remove_notify_handler(ACPI_COMPANION(adev->dev),
 					       ACPI_DEVICE_NOTIFY,
-- 
2.56.0

