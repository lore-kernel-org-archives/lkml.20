Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736436;
	b=lxnFpn6Q5URwk/+mU04rccGP78RFwGyU3pxYnNEZ+vbSR99PLS9S28Svd2TCvpkjErjL
	 62SMGPlcgBrG9mikGrWeW1dFM4H0fcbt/gOL3AK0Z0fEbXsEiIt/u3JTQIHayBxQI5Rw/
	 TmbUT4cRyv32MkByx7YVsqiFmN61hqdxw1ANYC0KkXei9FB2gcwawsYKbpLetxXZg2q8G
	 e5abo3YYpy945Ms+KDUGzmY49vgrGnR/Qy+EbKoEXSQiPxuMmQ9AC0lrhnGcARH1R+vSI
	 EqpppfevKAK1x7QTglNzcpFXqGr7FxIjqLxOyHzPCqrgkdLMT1H/4go4WtxXdqCFP8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736436;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=th/Ww1P5uDF1PBXrWbYrYf165uKvlwjcDlmrWyut+Y4=;
	b=4LcvLJDpp9KJFFozW9IpcUNNRPMpc/mVd2m+RHMtoYpACgfENAy7hvFvpAiUbWYiGumq
	 1HINPmqA9XJOyedIuft1iruX6MsQQR7hfedrStqMmIsT7wmQEaO7ghIyXrAfXsslGZIBl
	 g3774g/QAuUiML+IB9zCOJ1HxX8mdz8dt5Gx5zXlFuzrrI5vgg4gJzGch0d/15BSp9lE+
	 lo4jBKIsS7LlaMTsnBvjLNOHxN3K16U1veY9bjNOLXNqwAfKYoLrkXrOGzlp13QldpR6V
	 87uzcgjHGnv8xHoNOP5MJDwaYXaImhd08jvvvOWyBT6pazgPaT62N97S0/fGKev5eqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jbqpItze;
	arc=none smtp.remote-ip=91.218.175.144
Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFEF606D809
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFEF606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jbqpItze
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6yvyB6SLXU1xeeTMh1l23Uuem1Hn9Iqw8xMZzhMEaq0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736434; v=1; x=1794341234;
 b=jbqpItze0hO1CHrVdAhufL01NN98XGZGjWQy+sNt6r1PctfBpZEWxHIe4OJJ6MGYHs+neIBI
 qYaC314qFnd2OjmYVTbnhvLuxwr444FaousdMQHCT2Ilb3TkQA0xL1J/0tkUHYC6/rg6qzGM/Tq
 GRpHqVNrKjSmYH8fIOPqC0UA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4d358d4a05660d99;
	Tue, 03 Nov 2026 20:07:14 +0000
X-Mizu-Trace-ID: 4d358d4a05660d99
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
Subject: [PATCH v2 3/5] ASoC: tas2783-sdw: use the BIOS speaker ID in the firmware name
Date: Tue,  3 Nov 2026 12:05:37 -0800
Message-ID: <20261103200540.3863272-4-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
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

Some boards have TAS2783 firmware in linux-firmware named
SSID-SPKID-LINK-0xUID.bin, with a speaker ID ahead of the link ID (the
HP 8EA1 has its amps on link 0 and ships 8EA1-{0,1}-0-0x*.bin). The
driver only builds the three-field SSID-LINK-0xUID name, so these boards
never load firmware. On the ASUS ROG Xbox Ally X20 (SSID 1954) the BIOS
provides the speaker ID in a 4-byte SPEAKER_ID EFI variable, and only
the four-field 1954-*-*-0x*.bin files exist.

Read SPEAKER_ID once at probe and try the firmware names in a fixed
order: the four-field name when the variable is present, then the
current SSID-LINK-0xUID name and the unprefixed SSID-LINK-UID one.
Boards without the variable keep the current names and order.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/tas2783-sdw.c | 123 ++++++++++++++++++++++-----------
 1 file changed, 84 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index a57230e01f755..02fe74d457bfc 100644
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
@@ -102,8 +104,13 @@ struct tas2783_prv {
 	wait_queue_head_t fw_wait;
 	bool fw_dl_task_done;
 	bool fw_dl_success;
-	/* use fallback fw name */
-	bool fw_use_fallback;
+	/* the file for the firmware name being tried is missing */
+	bool fw_missing;
+#if IS_ENABLED(CONFIG_PCI)
+	/* UEFI speaker ID */
+	u32 spk_id;
+	bool spk_id_valid;
+#endif
 };
 
 static const struct reg_default tas2783_reg_default[] = {
@@ -757,19 +764,11 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	/* firmware binary not found*/
+	/* firmware binary not found, tas_io_init() tries the next name */
 	if (!fmw || !fmw->data) {
-		if (!tas_dev->fw_use_fallback) {
-			tas_dev->fw_use_fallback = true;
-			dev_info(tas_dev->dev,
-				"Failed to read preferred fw binary: %s, attempting fallback binary load\n",
-				tas_dev->rca_binaryname);
-		} else {
-			dev_err(tas_dev->dev,
-				"Failed to read fallback fw binary %s\n",
-				tas_dev->rca_binaryname);
-		}
-
+		tas_dev->fw_missing = true;
+		dev_info(tas_dev->dev, "Failed to read fw binary %s\n",
+			 tas_dev->rca_binaryname);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1156,42 +1155,79 @@ static const struct dev_pm_ops tas2783_sdca_pm = {
 	RUNTIME_PM_OPS(tas2783_sdca_dev_suspend, tas2783_sdca_dev_resume, NULL)
 };
 
-static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t size)
+#if IS_ENABLED(CONFIG_PCI)
+/* BIOS speaker ID that selects the SSID-SPKID-LINK-UID firmware name */
+static int tas2783_get_spk_id(u32 *spk_id)
+{
+	efi_guid_t guid = TAS2783_SPKID_GUID;
+	unsigned long size = sizeof(*spk_id);
+	efi_status_t status;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
+		return -ENOENT;
+
+	status = efi.get_variable(L"SPEAKER_ID", &guid, NULL, &size, spk_id);
+	if (status != EFI_SUCCESS || size != sizeof(*spk_id))
+		return -ENOENT;
+
+	return 0;
+}
+#endif
+
+/*
+ * Firmware names in the order they are tried: SSID-SPKID-LINK-0xUID when the
+ * BIOS has a speaker ID, then SSID-LINK-0xUID and SSID-LINK-UID.
+ */
+static bool tas_generate_fw_name(struct sdw_slave *slave, unsigned int idx,
+				 char *name, size_t size)
 {
 	struct sdw_bus *bus = slave->bus;
 	u8 unique_id = slave->id.unique_id;
-	bool pci_found = false;
 #if IS_ENABLED(CONFIG_PCI)
-	struct device *dev = &slave->dev;
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
-	struct pci_dev *pci = NULL;
-	const char *fw_uid_prefix = tas_dev->fw_use_fallback ? "" : "0x";
-
-	for (; dev; dev = dev->parent) {
-		if (dev->bus == &pci_bus_type) {
-			pci = to_pci_dev(dev);
-			scnprintf(name, size, "%04X-%1X-%s%1X.bin",
-				  pci->subsystem_device, bus->link_id,
-				  fw_uid_prefix, unique_id);
-			pci_found = true;
-			break;
+	struct device *dev;
+
+	for (dev = &slave->dev; dev; dev = dev->parent) {
+		u16 ssid;
+
+		if (dev->bus != &pci_bus_type)
+			continue;
+
+		ssid = to_pci_dev(dev)->subsystem_device;
+		if (!tas_dev->spk_id_valid)
+			idx++;
+
+		switch (idx) {
+		case 0:
+			scnprintf(name, size, "%04X-%X-%1X-0x%1X.bin", ssid,
+				  tas_dev->spk_id, bus->link_id, unique_id);
+			return true;
+		case 1:
+			scnprintf(name, size, "%04X-%1X-0x%1X.bin", ssid,
+				  bus->link_id, unique_id);
+			return true;
+		case 2:
+			scnprintf(name, size, "%04X-%1X-%1X.bin", ssid,
+				  bus->link_id, unique_id);
+			return true;
+		default:
+			return false;
 		}
 	}
 #endif
 
-	if (!pci_found)
-		scnprintf(name, size, "tas2783-%1X-%1X.bin",
-			  bus->link_id, unique_id);
+	if (idx)
+		return false;
+
+	scnprintf(name, size, "tas2783-%1X-%1X.bin", bus->link_id, unique_id);
+	return true;
 }
 
-static s32 tas_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave *slave)
+static s32 tas_fw_load(struct tas2783_prv *tas_dev)
 {
 	s32 ret;
 	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
 
-	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
-			     sizeof(tas_dev->rca_binaryname));
-
 	tas_dev->fw_dl_task_done = false;
 	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      tas_dev->rca_binaryname, tas_dev->dev,
@@ -1216,6 +1252,7 @@ static s32 tas_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave *slave)
 static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
+	unsigned int i;
 	s32 ret;
 
 	if (tas_dev->hw_init)
@@ -1230,10 +1267,15 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	}
 	usleep_range(2000, 2200);
 
-	tas_dev->fw_use_fallback = false;
-	ret = tas_fw_load(tas_dev, slave);
-	if (!ret && tas_dev->fw_use_fallback)
-		ret = tas_fw_load(tas_dev, slave);
+	for (i = 0; tas_generate_fw_name(slave, i, tas_dev->rca_binaryname,
+					 sizeof(tas_dev->rca_binaryname)); i++) {
+		tas_dev->fw_missing = false;
+		ret = tas_fw_load(tas_dev);
+		if (ret || !tas_dev->fw_missing)
+			break;
+	}
+	if (tas_dev->fw_missing)
+		dev_err(dev, "no firmware binary found\n");
 
 	if (!ret) {
 		if (tas_dev->sa_func_data)
@@ -1427,6 +1469,9 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	tas_dev->fw_version = 0;
 	mutex_init(&tas_dev->calib_lock);
 	mutex_init(&tas_dev->pde_lock);
+#if IS_ENABLED(CONFIG_PCI)
+	tas_dev->spk_id_valid = !tas2783_get_spk_id(&tas_dev->spk_id);
+#endif
 
 	init_waitqueue_head(&tas_dev->fw_wait);
 	dev_set_drvdata(dev, tas_dev);
-- 
2.56.0

