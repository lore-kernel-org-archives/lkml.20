Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609026;
	b=IbGWh/mzrSkqwdeJoru17PWqiMFi7GksdWnYMwN+xymGpPrzNzaPkd2In9gF5ize8nbz
	 pXkl9IyVtKQjdZI6FFGDeiBAysYJwMwh/19qdDOqoqrvIBo1llCr5YUUaye6FJALLKwpt
	 YZVCfb5oMWIIzu7L32xyslhcnVUWmD+t+5F5q4yNP5jCGVo7hszh2BAZu5aWULqubEqrG
	 H7A00QIi+uq9aJ2IMkuu+wvlnwe5InxrEqpLuQFquRV4AaVAiV1WddP1Z5VmLfifqjlrB
	 hHzxb7fx3xfC2gYu4aekWBkDlUA8VnihLuwQHERy9PuE8dB3UXl8LHwH61tj2aMVq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ogfEpVoNGCmkg6dBBDlzC30lc+A0Pk8UmaytNLyYguI=;
	b=UB8mgzzklfMVwwbxAoyo6jZyCCm/AO1Q+9ZUyQGHpknmNj7iRGf8Q7gUMQvYhupMm/Vo
	 /H/x8TMMxiMiuOffF8IRQ1LgqnR/iAItQME0lr1jQYlUhKzNSqdVrJ1hQmF7AVUA1XSie
	 +WerMMc81C14qZYPery9QGacMO2PeQCeXx41etUhCx7eN/xunUolSgxKtCroOgv59g+Sj
	 acBB0U007chAC1AWDeAYkM7DOIpiHOuRQRdoQsJK9Bn4WxunaLiiCO4svGypFE8Xx+SFH
	 ygurZ0yySnWPsZbpMeX2E2v+8k8nrgtM2gafXMflWV6zqIzlmQGwWj9SaL79ceA3Dcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tCh1eE2e;
	arc=none smtp.remote-ip=74.125.231.134
Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB5F606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB5F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tCh1eE2e
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-821480f0153so111653a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609025; x=1793213825; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ogfEpVoNGCmkg6dBBDlzC30lc+A0Pk8UmaytNLyYguI=;
        b=tCh1eE2e0+7jkZ1B1SoN7jAIA4z4NOzY1fgvUVyq/2JbD7Sq5KWN4ik3JjqI+/Y4j/
         VJPq+1yofQW3G1qFevcyKTDXc2RuPL6FhJUHMKZmAGZAsIJcONSXje0JoHo7wU14yBml
         sJKnACtCDolcxQshkLQlYOpi1GPsWsciY4pSpApOk5Pkb/3ONTswCctriFM5n2Wo3dQl
         shhRAuDapTUJC0O4oPZYZIQ1TlmRKzNMeY1CbEUBqFgfbZhxAJ5ctm8muZcKxGcs1svI
         zYc2EpkhQsw8oIxeR4m/knczJi4x0zees3VM+vtJptIpGedpVaDhTuYATBzrTdR+kXqv
         c76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609025; x=1793213825;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ogfEpVoNGCmkg6dBBDlzC30lc+A0Pk8UmaytNLyYguI=;
        b=OewBhJmJ5wTBREO/iSn4qAmlJsfownRZZoJmLUQVkSUz7W1yZhE311t+FAf5D45e2m
         fMscxn8zQnXqsq8wF7s/BPSjryMEXSEGMyBOid2OQTKsFeuoK3iT/pAf54B4/dssgje/
         lF4uL6oRwfYOo/ztpp1x9g2PztpoH+/5fWQWU0bRwvmkpmv7ymJOsYDYCIQ6kUmmUmjf
         Acjsg/YZo5T3EYB07aiend4ek2HIkRnehZg+2RTppP9eddSxDx3BVYrVq0SGLE10ZxDf
         zVxL3K6MDN2lbVVKg/OagpXzgds+sS3KkdK4Ru2lr6GCoVmbkqk+EzftINXAzviuNT0l
         vLLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFpcp26UoiArUlnRaUwQGbir9041wg/vmSF/gNLiOCEZ0ZtoLMnUUK8xxm6PH6FOVzbkI2Bk7G6wbkIgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7f4qp48f8av+p2AyCPTXdkxkyYb6DcRNlRtuql/zVEGJjACYV
	1pdRyNHZkutJ40LeQIOOXLcHwmwL5CepYsLsYLpOkpHxb0md0tyGzvij
X-Gm-Gg: AYBFou2Bi5rQHYyavMb4n+xn51WMH47BvkwVsdqWaOrwAuyEG2ylRAZsOe9vtvy3T5V
	vc6RFErTtAsNw9VKGfj1JX3H80Jcw33NMc20Ri1iMSrnhZteBqVTa/eMQdQqs4pzG4GrG/eJDNU
	rgiqug4EKux+c5U+xF5+mGVb3PJjP5nnFEBrWy/MOy2cpzSuK1ruwEJnqFb0XkiYnR9VZdCbsuQ
	p67uWzp72lEE8xrmiFBhiGmag+awn/0wyGi1oHsUCRycecX3aIVDsrLLh9FFlV66yEG2mg0FINA
	i3uDSQhOg2642EcnskS5qsF9/BV62j0baQ/OQklOWZ09dHst+I5Hnq7P3srEfYH7T9H+/EYh4nZ
	t6TAa9w3dLlLg9PaijkMkNtbwGgyMJcpcTh1bbFw7ElBJA1MvOZj1GivsP0fzeERvzcnNy9a8YJ
	8n+7zGdJZ1H1IoNf/3bO/F3Z6Zd9cKsq+sjaq2m5+LcygRZ89CY+/qrLoyljnOHDtoGSbIKojT1
	J+Aqw+eJEW3+zY7HIwzbgsCXhH/RSCmAPV6Pnrkyt0rxy2BywPKOyydlD0RsN0NAeRXf5JY+asr
	KtFxGmVHLc2FJWFU62c4gi17ocbhBI8bSXKKiJFGFWlS3XHO
X-Received: by 2002:a05:6830:8294:b0:805:620e:4d40 with SMTP id 46e09a7af769-84d065d1b57mr2227487a34.2.1792609024618;
        Wed, 21 Oct 2026 11:57:04 -0700 (PDT)
Received: from [10.10.121.179] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd8cb051sm3067290a34.22.2026.10.21.11.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:57:04 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 21 Oct 2026 13:57:01 -0500
Subject: [PATCH RESEND v3] pci: Add broken-GPE quirk for some Lenovo
 Legions with Nvidia GPUs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-broken-gpe-legion-v3-1-097226ba8383@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>, linux-pci@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792609023; l=5681;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=bQF3AmZL0YQ5DEicF3r2yu3cYqe9iEy3BSx14DhZw3A=;
 b=DekNitr86qPxU/aAbNNYOk/Nfyn4jbglpC2dOf8MZQ/bJoqkhBXvLow6iBmnY4H7KkF4Ayx6C
 D9sXCQuvFF1DMwEVfzVuLR1J9Kaw+7muPDp4jJg77Zpv4Ze3krF/wkc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

From: Lyude Paul <lyude@redhat.com>

On certain Lenovo Legion devices (including the 16APH8, 16AHP9, and
15AHP9), the firmware appears to enjoy firing a GPE on the parent PCIe
port of the nvidia GPU very shortly after the GPU enters D3Cold. This means
that every time the GPU is runtime suspended, ACPI firmware immediately
wakes up its parent PCIe port, which then wakes up the GPU. Once it falls
asleep again, the cycle repeats.

Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
nova as well, and it even seems possible for this to happen without any
driver loaded.

This seems to simply be a bug. Luckily, there is nothing that we actually
need ACPI wakeup events for on the GPU. Events such as display connector
hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
affected by this quirk.

Reported-by: Ryan Brue <ryanbrue.dev@gmail.com>
Link: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
Co-developed-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
V3:
* Add the Lenovo LOQ 15AHP9 to the quirk table (@jindalpratik on GitHub)
* Also match Nvidia RTX 4070 Max-Q (0x2860), which similarly refuses to
  stay in D3Cold (@inigo001 on GitHub)
V2:
* Don't forget to actually use parent_adev with acpi_remove_pm_notifier()
* Check if parent_adev is NULL (could happen if booted with acpi=off), just
  consider it a no-op if it is.
* Base the patch off Linux master instead, I based it off drm-misc-next by
  mistake because I'm too used to working on DRM drivers :).
---

Tested on all the modified Legion devices. The Nvidia dGPU properly goes
into D3Cold with the patch, whereas without it, the dGPU will wake up
shortly after going to D3Cold. See the linked open-gpu-kernel-modules
issue for more details.

Lyude gave me permission to send out the v3 with modifications, as she has
been busy.
---
 drivers/pci/quirks.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21f..f0ea0a722183 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6169,6 +6169,94 @@ DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x13b1,
 			      PCI_CLASS_DISPLAY_VGA, 8,
 			      quirk_reset_lenovo_thinkpad_p50_nvgpu);
 
+#ifdef CONFIG_ACPI
+#ifdef CONFIG_DMI
+static const struct dmi_system_id nvidia_dgpu_broken_gpe_quirk_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "15AHP9"),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "16APH8"),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "16AHP9"),
+		},
+	},
+	{}
+};
+
+/*
+ * On the Lenovo Legion Slim 5 16APH8 and 16AHP9, the firmware appears to enjoy
+ * firing a GPE on the parent PCIe port of the nvidia GPU very shortly after the
+ * GPU enters D3Cold. This means that every time the GPU is runtime suspended,
+ * ACPI firmware immediately wakes up its parent PCIe port, which then wakes up
+ * the GPU. Once it falls asleep again, the cycle repeats.
+ *
+ * See: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
+ *
+ * Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
+ * nova as well, and it even seems possible for this to happen without any
+ * driver loaded.
+ *
+ * This seems to simply be a bug. Luckily, there is nothing that we actually
+ * need ACPI wakeup events for on the GPU. Events such as display connector
+ * hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
+ * affected by this quirk.
+ *
+ * So, workaround this by disabling wakeup events for the parent PCIe port of
+ * the GPU.
+ */
+static void quirk_nvidia_dgpu_broken_gpe(struct pci_dev *pdev)
+{
+	struct acpi_device *parent_adev;
+	struct device *parent_dev;
+	int ret;
+
+	/* Just to be extra safe and make sure we don't try this on an eGPU */
+	if (pci_is_thunderbolt_attached(pdev))
+		return;
+
+	ret = dmi_check_system(nvidia_dgpu_broken_gpe_quirk_table);
+	if (ret == 0)
+		return;
+
+	pci_info(pdev, FW_BUG "GPU PCIe port has broken wakeup events, disabling\n");
+
+	parent_dev = pci_physfn(pdev)->dev.parent;
+	if (!parent_dev) {
+		pci_err(pdev,
+			"Can't find PCIe parent? Your Nvidia GPU will have broken runtime PM\n");
+		return;
+	}
+
+	parent_adev = ACPI_COMPANION(parent_dev);
+	if (!parent_adev) /* No ACPI? That means no GPE, and nothing to do here. */
+		return;
+
+	/* The spurious GPEs will be sent from the ACPI device for the PCIe port this GPU is
+	 * connected to, so remove our PM notifier to turn them into a no-op.
+	 */
+	ret = acpi_remove_pm_notifier(parent_adev);
+	if (ACPI_FAILURE(ret))
+		pci_err(pdev, "Removing PM notifier failed: %d\n", ret);
+}
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x28e0,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x2860,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+#endif
+#endif
+
 /*
  * Device [1b21:2142]
  * When in D0, PME# doesn't get asserted when plugging USB 3.0 device.

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261005-broken-gpe-legion-9c9f87a5898c

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

