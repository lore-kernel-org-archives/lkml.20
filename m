Received: from mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AF6498E13
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193093; cv=none; b=l1dQQGJ3vaMMNLMGqZJd0cKtqiORF3ZhTLHmPNbLnRpPDlnYwIMOp9WjeR5rISp0gYVQ/kRa2cXgZwfPhbaxZWElzxYoTZkyo41VzR6O3ih9U2BC/vGUtt8Mwjt0gV5l0RvQOo6SMAlxrRsXeZUZYnt/68W/x1aID9ShR9KJ0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193093; c=relaxed/simple;
	bh=qXfS154Z4JVvTvxDfKsOgpe1Dj/eBwroixxp03SQtjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgq0gBCiGKmlx9n+fzQWkchpua8HBM5VH4dtxAEtD3sodHTOjaYDsqOBgEdnz3zS2BoKtZETWgNyqXGA1NH14psqugGYXhINQM/L3A9k9uPxYI3ePEkbit4zE7E4bx29GUtVzRC/w4JtD9VhgSnDJAgzu2lEXeJpNUUaNshu+VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Te1CssUV; arc=none smtp.client-ip=95.215.58.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Te1CssUV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qXfS154Z4JVvTvxDfKsOgpe1Dj/eBwroixxp03SQtjk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792193088; v=1; x=1792797888;
 b=Te1CssUV4/fGgl/N3Wvjg1qPXWPRpvS2OXPcAKzvogTbjBsvYRuXi2m6tJIQoQmrT3CGJb7E
 2Ln/vPoGGuQWnYV5UiUvXAzqbQNj1biYdRsSBwaRLhfco8vPwvJdkCzwP+asORjvqPwUC32Xy03
 rT3Y8u8MeQKXszqM1sNNAh2o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4bbbaa2158be8365;
	Fri, 16 Oct 2026 23:24:48 +0000
X-Mizu-Trace-ID: 4bbbaa2158be8365
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ASoC: tas2783-sdw: use the BIOS speaker ID in the firmware name
Date: Fri, 16 Oct 2026 16:24:13 -0700
Message-ID: <20261016232416.2628603-4-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards have TAS2783 firmware in linux-firmware named
SSID-SPKID-LINK-0xUID.bin, with a speaker ID ahead of the link ID (the
HP 8EA1 has its amps on link 0 and ships 8EA1-{0,1}-0-0x*.bin). The
driver only builds the three-field SSID-LINK-0xUID name, so these boards
never load firmware. On the ASUS ROG Xbox Ally X20 (SSID 1954) the BIOS
provides the speaker ID in a 4-byte SPEAKER_ID EFI variable, and only
the four-field 1954-*-*-0x*.bin files exist.

Read SPEAKER_ID once and request the four-field name first when it is
present. Boards without the variable keep the current names, and the
unprefixed three-field name is still tried if the four-field file is
missing.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/tas2783-sdw.c | 42 +++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index a57230e01f755..db234c54aa2ac 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -46,6 +46,8 @@
 #define TAS2783_PROBE_TIMEOUT 5000
 #define TAS2783_CALI_GUID EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, \
 				   0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92)
+#define TAS2783_SPKID_GUID EFI_GUID(0xaa61eaaf, 0x6e83, 0x7523, 0xb0, \
+				    0xd0, 0x7d, 0xf7, 0x4b, 0xb2, 0x4a, 0x81)
 
 static const u32 tas2783_cali_reg[] = {
 	TAS2783_CAL_R0,
@@ -104,6 +106,11 @@ struct tas2783_prv {
 	bool fw_dl_success;
 	/* use fallback fw name */
 	bool fw_use_fallback;
+#if IS_ENABLED(CONFIG_PCI)
+	/* UEFI speaker ID, read once */
+	int spk_id;
+	bool spk_id_read;
+#endif
 };
 
 static const struct reg_default tas2783_reg_default[] = {
@@ -1156,6 +1163,26 @@ static const struct dev_pm_ops tas2783_sdca_pm = {
 	RUNTIME_PM_OPS(tas2783_sdca_dev_suspend, tas2783_sdca_dev_resume, NULL)
 };
 
+#if IS_ENABLED(CONFIG_PCI)
+/* BIOS speaker ID that selects the SSID-SPKID-LINK-UID firmware name */
+static int tas2783_get_spk_id(void)
+{
+	efi_guid_t guid = TAS2783_SPKID_GUID;
+	unsigned long size = sizeof(u32);
+	efi_status_t status;
+	u32 spk_id = 0;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
+		return -ENOENT;
+
+	status = efi.get_variable(L"SPEAKER_ID", &guid, NULL, &size, &spk_id);
+	if (status != EFI_SUCCESS)
+		return -ENOENT;
+
+	return spk_id;
+}
+#endif
+
 static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t size)
 {
 	struct sdw_bus *bus = slave->bus;
@@ -1170,9 +1197,18 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 	for (; dev; dev = dev->parent) {
 		if (dev->bus == &pci_bus_type) {
 			pci = to_pci_dev(dev);
-			scnprintf(name, size, "%04X-%1X-%s%1X.bin",
-				  pci->subsystem_device, bus->link_id,
-				  fw_uid_prefix, unique_id);
+			if (!tas_dev->spk_id_read) {
+				tas_dev->spk_id = tas2783_get_spk_id();
+				tas_dev->spk_id_read = true;
+			}
+			if (tas_dev->spk_id >= 0 && !tas_dev->fw_use_fallback)
+				scnprintf(name, size, "%04X-%X-%1X-0x%1X.bin",
+					  pci->subsystem_device, tas_dev->spk_id,
+					  bus->link_id, unique_id);
+			else
+				scnprintf(name, size, "%04X-%1X-%s%1X.bin",
+					  pci->subsystem_device, bus->link_id,
+					  fw_uid_prefix, unique_id);
 			pci_found = true;
 			break;
 		}
-- 
2.56.0

