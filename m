Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE5E3CB2E5;
	Fri, 25 Sep 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341871; cv=none; b=urBy3zxwuD8UwXGAqeFaKpBytDgGOooaoMsVvqkyS1/u2rkDfwpumywfZ7ZIZjZadvM2soMk3QaNrWYnqiCcqCtnqda0FkDs5SEfrPdePGVS+3JMYuH81dBqT6WF4o1zWbhloVVrY14n3ff2rub7NBL8BblSaYcwXxZy+PAf3YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341871; c=relaxed/simple;
	bh=3uAzuFE+b9SS9OZZiv6hNHmPaAwSzPB3bSnF9LQw35Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxffcmGMLu7oe4VGecphpCyuByUM/usRxTOhuSfjbGWcOkyOIOxm+LUwjMxISNC30C7TpGdPTiBj/B7SqFqMn4Mx7NeSedk24DIdHMRju81ACDUoNfGg5lmsZnZJUW9vakQFIXDonAMNIf9Oxg29xByHozkjj1Ye9kGXL2rUwkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3JV0TDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3JV0TDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E7B1F000FF;
	Fri, 25 Sep 2026 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341870;
	bh=SR+fn6Vy4sh/JaT+8eQ71WUN7UGOcZwBf1BAODLFDoY=;
	h=From:To:Cc:Subject:Date;
	b=k3JV0TDuZpuT4T6ThBXMjh1gNhHlbnzLsnfkzzqoEmJDdmF5Y4YPmeysPu1iIoQKc
	 Lt86YNvx/vgJVkYQCTClfNjX3M9EfY+ifVAnvytoSeLKtCArQouA3jpaOeLPe000+D
	 6Na+DZABZAQpNiUXCId424aD73vORDaqWdaFDUcOU1V48jjK58gI5PHHMkeU+YUPqq
	 +DgkIsR9exwdqAjZgmiGQ2iI6/geTCYgKBFqXod5LgeqBXS0HfIUwHfX2E7OujhnLG
	 UXfPuaBKx4QkFOdsLzMuYcCCeRUawf5ZWHg0S/KfPgfYLbYbNxRHAncMgRgW6bk1DG
	 nImSi3Y9ZqYtA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mario Limonciello <mario.limonciello@amd.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: amd: fix building without CONFIG_ACPI
Date: Fri, 25 Sep 2026 15:10:57 +0200
Message-ID: <20260925131104.118993-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When ACPI is disabled, this driver runs into a build failure:

sound/soc/sof/amd/acp.c:1374:13: error: call to undeclared function 'acpi_find_child_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 1374 |                 pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);

The code block is already guarded by an 'if (adev)' check that
can only be true if ACPI is enabled, so add another #ifdef
to match this.

Fixes: 203ea76c4b0a ("ASoC: SOF: amd: add ACP7.B/7.F PDM controller scan and pdata propagation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I also tried adding ACPI Kconfig dependencies, but that quickly
got out of hand since the acp module is selected by a number of
drivers that then all need the same dependency.

It may be possible to work around this in the ACPI code by adding
a stub macro for acpi_find_child_device() that does nothing.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/sof/amd/acp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index b059039c9e0d..4b2d7cb244c9 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -1059,6 +1059,7 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_resume, "SND_SOC_SOF_AMD_COMMON");
 
+#ifdef CONFIG_ACPI
 static void acp_sof_scan_pdm_devices(struct snd_sof_dev *sdev,
 				     struct acpi_device *pdm_dev)
 {
@@ -1083,6 +1084,7 @@ static void acp_sof_scan_pdm_devices(struct snd_sof_dev *sdev,
 	}
 	fwnode_handle_put(child);
 }
+#endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_AMD_SOUNDWIRE)
 static int acp_sof_scan_sdw_devices(struct snd_sof_dev *sdev, u64 addr)
@@ -1299,9 +1301,7 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct acp_dev_data *adata;
 	const struct sof_amd_acp_desc *chip;
-	const union acpi_object *obj;
 	struct acpi_device *adev;
-	struct acpi_device *pdm_dev;
 	unsigned int addr;
 	unsigned int irqflags;
 	int ret;
@@ -1369,7 +1369,11 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
 		adata->is_sdw_dev = true;
 
 skip_soundwire:
+#ifdef CONFIG_ACPI
 	if (adev) {
+		struct acpi_device *pdm_dev;
+		const union acpi_object *obj;
+
 		/* DMIC ACPI child address is 2 on ACP7x platforms */
 		pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
 		if (pdm_dev)
@@ -1379,6 +1383,7 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
 					   ACPI_TYPE_INTEGER, &obj))
 			adata->acp_sof_signed_firmware_image = obj->integer.value;
 	}
+#endif
 
 	sdev->dsp_box.offset = 0;
 	sdev->dsp_box.size = BOX_SIZE_512;
-- 
2.53.0

