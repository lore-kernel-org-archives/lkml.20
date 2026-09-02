Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB8D3EEAEA;
	Wed,  2 Sep 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339945; cv=none; b=otVXWDUgW9vItXhYVAzxCDQ6YMyQ5ldy06eqgsCEf9t60avwY7QDYeoJ87pPmm9sZLr0/L2AaNteKfjwsfnu7nZoZCY1nNfWkOA0yChjphj+j2GCFlSR8II2W72janZi505usBFqIECE2FDMHv6Fs/ywpSPb8zU7D8ABCfkIvp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339945; c=relaxed/simple;
	bh=xJptvLafoqlJCdFxLD460ztNZOTFIuuQp8qBTdVne1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pNsYL5CDwGUqE71KEG9R++6DPxn7AwpvKjYBzvivGAwlMpeVXibp+P1z9ZZvIRx2NFHZ6T7zMkOnQ7rTaP4TTw3LyfYrrco2Z46iYTYGGTlD5iRpk4/y8BzoL7CCry2hNzLYjn9xeatFeQ1bb4uJpNaS10WMmJxCjprwB2KWbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7498f7aea6ad11f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:905902a8-6ee9-4b10-87dc-a5497e24eb57,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:8902889369b8e71bbc23da3248b876df,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7498f7aea6ad11f19a56ed5b684f684d-20260902
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 843495116; Wed, 02 Sep 2026 17:05:34 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>,
	Alex Bartz <alex@alstergee.com>
Subject: [PATCH v3] usb: typec: ucsi: do not register UCSI on Lenovo Legion Pro 7 16IAX10H
Date: Wed,  2 Sep 2026 17:05:31 +0800
Message-Id: <20260902090531.2134150-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826133118.3327816-1-huangwei@kylinos.cn>
References: <20260826133118.3327816-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EC firmware of the Lenovo Legion Pro 7 16IAX10H (DMI product name
83F5) has a broken UCSI implementation: GET_PDOS returns no source
capabilities, GET_CONNECTOR_STATUS reports an incomplete RDO, and any
UCSI traffic disturbs the EC's autonomous USB-C Power Delivery
negotiation. With ucsi_acpi bound, chargers connect only briefly and
then drop, and voltage_now reads 0; with the driver blacklisted, the
EC negotiates full PD contracts on its own and charging works normally.

The reporter confirmed the issue on BIOS versions Q7CN44WW and
Q7CN78WW (2026-04); it is unaffected by the BIOS update between them.
The AMD sibling Legion Pro 7 16AFR10H (product name 83RU) reportedly
uses the same EC firmware, but it is left out of the quirk until the
failure is confirmed on that model.

Skip probe on machines carrying the known-broken BIOS versions, which
is equivalent to the blacklist workaround the reporter verified to
restore charging. Matching the specific BIOS versions rather than the
whole platform ensures that a future firmware that fixes UCSI is not
wrongly skipped.

Reported-by: Alex Bartz <alex@alstergee.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221142
Tested-by: Alex Bartz <alex@alstergee.com>
Signed-off-by: Huang Wei <huangwei@kylinos.cn>

---
Changes in v2:
- Add Tested-by tag from Alex Bartz, who verified the quirk on his
  machine (out-of-tree build, runtime module swap, PD charging held
  across the reload).

Changes in v3:
- Use dev_err() instead of dev_info() for the skip message, per Greg
  Kroah-Hartman and Heikki Krogerus, so the issue stays visible until
  the firmware is fixed.
- Scope the quirk to the BIOS versions confirmed broken (Q7CN44WW,
  Q7CN78WW) instead of the whole platform, per Greg Kroah-Hartman, so
  a future firmware that fixes UCSI is not wrongly skipped. New broken
  versions can be added to the table as they are confirmed.
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc5..2708b5f90718 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -173,6 +173,35 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
 	{ }
 };
 
+/*
+ * Platforms with a completely broken UCSI implementation in firmware.
+ * Do not register UCSI at all on these machines.
+ *
+ * The Lenovo Legion Pro 7 16IAX10H (DMI product name 83F5) carries
+ * broken UCSI firmware in BIOS versions Q7CN44WW and Q7CN78WW; the
+ * reporter confirmed the issue is unaffected by the BIOS update
+ * between them. Match only the BIOS versions known to be broken so
+ * that a future firmware that fixes UCSI is not wrongly skipped; add
+ * new versions here as they are confirmed.
+ */
+static const struct dmi_system_id ucsi_acpi_ignore[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
+			DMI_MATCH(DMI_BIOS_VERSION, "Q7CN44WW"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
+			DMI_MATCH(DMI_BIOS_VERSION, "Q7CN78WW"),
+		},
+	},
+	{ }
+};
+
 static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ucsi_acpi *ua = data;
@@ -199,6 +228,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
+	if (dmi_check_system(ucsi_acpi_ignore)) {
+		dev_err(&pdev->dev,
+			"UCSI implementation in firmware is broken, ignoring\n");
+		return -ENODEV;
+	}
+
 	ua = devm_kzalloc(&pdev->dev, sizeof(*ua), GFP_KERNEL);
 	if (!ua)
 		return -ENOMEM;
-- 
2.25.1

