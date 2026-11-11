Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406706;
	b=UIYHWOFHjr4n4mK0IvU6Tnc614Ln99oaMaMbvcs0s3QZRSsh67p+5N2Fk4ampCMxW2PX
	 I63EyAGgwfJKyed0MDzuasTf+8ruLYw/qwRgQ31fRwrhivC3Fv/faqHdRv2YUwqaz6Qdz
	 xwRSgsSoeHhS+UP4Z2A9RARmsy9BEPP9F4d97Zf5xteof+UqfZRXCwz+3ur+1bu4jdqJj
	 +dHID6fqG2yFMdCILXc48T151I4hU+uugIrkD/bNi5bUUeji0db2V+i75aKVHrJ1pswLm
	 im5Z4YDXJSSQPk0LEpv4iYOxEO2RVOBoTFoXt15QfZZxV72g92qm8IoU7O/e5xWDr9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8/O6pr/niEqInMXOdvInlnxxw/y/4pvajThA1RD0JII=;
	b=IJgEjaFmUolyj4CbWobENBV8ACcVtGnVUjFLuKNeBFxZ6V4myMptcbmcHnq6jEdODlW3
	 t4LoxoO/KSuJgTVfrvaV+gmELoRXxSks7cCgNDSwTm/+kgcuUSL/MlOycJzOTEjnTtxB9
	 bUIqOabAGPBWPPVSneXstdc64so3MhEXAy5pvqU4qmvCtT9JIDaC4dCovyp7iGvxwhMoA
	 hXaZiC9JrbbmMmIFwLcMpMfdYFAP1bJv7H7G5XnM0qyfARF8CNMsb+ZMII5HsLwZDkOG/
	 XUkNK8bzTafJE1YTABqh/pAmJFTRG/HkWXp821Z9YA5IN1uJRP/FwnpWGavegk0k1/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QfWqJ2Gb;
	arc=none smtp.remote-ip=95.215.58.233
Received: from mta1.migadu.com (out-233.mta1.migadu.com [95.215.58.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E683D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QfWqJ2Gb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vbSdqpszr72dnriFcy3OhKuOoGAzGbYETYduGKXoy7I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794406702; v=1; x=1795011502;
 b=QfWqJ2GbsOABvJyjR/qFBnGjWa5PZLYs4mNQERuSU9/P4bospoYjfXfSQ8pxQWxVs9aYgg9d
 JZSN+Btka8SYUlRlOfgeH8UUO+th5t+Ze+woRHDsahOu/TdRzVyC5923Y5KlJjbcotOqVCqrtrH
 8JZGCqF6OKzg4eX40Hy4WMBA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 371126181906faca;
	Wed, 11 Nov 2026 14:18:22 +0000
X-Mizu-Trace-ID: 371126181906faca
X-Migadu-Flow: FLOW_OUT
From: Aditya Garg <aditya.garg@linux.dev>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH] wifi: brcmfmac: pcie: Make antenna SKU check optional for Apple boards with BCM4364/3
Date: Wed, 11 Nov 2026 19:47:56 +0530
Message-ID: <20261111141756.11564-1-aditya.garg@linux.dev>
X-Mailer: git-send-email 2.56.0
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

On iMacPro1,1, iMac19,1 and iMac19,2, the Antenna SKU property required
for firmware selection is not advertised by ACPI. It has been found that
the firmware shipped by macOS for the BCM4364/3 chip is independent of
the Antenna SKU property by comparing SHA256 sums. Thus, for this chip,
make its requirement optional and use it only if ACPI advertises it.

Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
---

--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2428,39 +2428,54 @@
 	fwreq->domain_nr = pci_domain_nr(devinfo->pdev->bus) + 1;
 	fwreq->bus_nr = devinfo->pdev->bus->number;
 
-	/* Apple platforms with fancy firmware/NVRAM selection */
+	/* Apple platforms with fancy firmware/NVRAM selection.
+	 * Antenna SKU is not advertised by ACPI in iMacPro1,1,
+	 * iMac19,1 and iMac19,2. Since they use BCM4364/3, and
+	 * the firmware for that chip doesn't depend on antenna-sku,
+	 * make its check optional on that chip.
+	 */
 	if (devinfo->settings->board_type &&
-	    devinfo->settings->antenna_sku &&
+	    (devinfo->settings->antenna_sku ||
+	     (devinfo->ci->chip == BRCM_CC_4364_CHIP_ID &&
+	      devinfo->ci->chiprev == 3)) &&
 	    devinfo->otp.valid) {
 		const struct brcmf_otp_params *otp = &devinfo->otp;
 		struct device *dev = &devinfo->pdev->dev;
 		const char **bt = fwreq->board_types;
+		int i = 0;
+		int j;
 
 		brcmf_dbg(PCIE, "Apple board: %s\n",
 			  devinfo->settings->board_type);
 
 		/* Example: apple,shikoku-RASP-m-6.11-X3 */
-		bt[0] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module, otp->vendor, otp->version,
-				       devinfo->settings->antenna_sku);
-		bt[1] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module, otp->vendor, otp->version);
-		bt[2] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module, otp->vendor);
-		bt[3] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
-				       devinfo->settings->board_type,
-				       otp->module);
-		bt[4] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
-				       devinfo->settings->board_type,
-				       devinfo->settings->antenna_sku);
-		bt[5] = devinfo->settings->board_type;
+		if (devinfo->settings->antenna_sku)
+			bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s-%s",
+						 devinfo->settings->board_type,
+						 otp->module, otp->vendor, otp->version,
+						 devinfo->settings->antenna_sku);
+		else
+			brcmf_dbg(PCIE, "Antenna SKU not found\n");
+		bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s-%s",
+					 devinfo->settings->board_type,
+					 otp->module, otp->vendor, otp->version);
+		bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s-%s",
+					 devinfo->settings->board_type,
+					 otp->module, otp->vendor);
+		bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
+					 devinfo->settings->board_type,
+					 otp->module);
+		if (devinfo->settings->antenna_sku)
+			bt[i++] = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
+						 devinfo->settings->board_type,
+						 devinfo->settings->antenna_sku);
+		bt[i++] = devinfo->settings->board_type;
 
-		if (!bt[0] || !bt[1] || !bt[2] || !bt[3] || !bt[4]) {
-			kfree(fwreq);
-			return NULL;
+		for (j = 0; j < i - 1; j++) {
+			if (!bt[j]) {
+				kfree(fwreq);
+				return NULL;
+			}
 		}
 	} else {
 		brcmf_dbg(PCIE, "Board: %s\n", devinfo->settings->board_type);
