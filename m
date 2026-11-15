Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794706503;
	b=i97DaWV9UMjyuzDpSqZnFx0TSyEu44c62mj6mvivmkuLgTM8+GvweydqD79m3xF7DxMZ
	 mJy5K0XYaXjHhIqU7beiQ15k7hwcqzZIP0p3l2SRLMDmurpdRz92Xpvdw5x6qCGJ2ZHfh
	 iMYxPwND8K+7lrdAyHs5sqiRjtU8Q9VVR6Qe60sbzqjJss/8C0808vABbde1iq3w8Y0eY
	 7GpeYWGoWivVDP8gNfyb5hi5EhEtIcPLQdqbXHIKhRbwv4+yAk6TfFjHqqifzuK9PSfk9
	 Dip4L7ew/sC4EWLw9CutyM/N9+/63xj9pxk14Y1+F+WvonqjwO5PDwK9TsBPaBsyiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794706503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oMtWGlskVqXWYTGgT8kUzvtSaHGUGjmSxElRD/6sbRw=;
	b=iSIgRVwdMVqkJlk15jdqLT/d5fDgvrUEuuU1FN1g3a1M3caSAxnIxtuZ5L71chn2qdyG
	 W+pcWe5VudjDqY2Hnto/PuepeyCET0q2UYXToaKBlE68Y5PSwU5LcOU/yCn97igouK5hH
	 fIN+oWcQDhyvyuhcW9Or44x9vQq7IoGRTcEjIL1Bv6z956C19w1j7vFrFTze605Cwlx+y
	 A/gtuM6AkauPLOVjuvUZ+LKgONLOblRSF8Y4s5DDjH9HgTZi5Wg8x/WxYo34E8n27S7H8
	 EOw7cFAMn8weXmfAjJYTkwIb7DlO2kynpItA6eKMmEEFWv50ATpgCjYQFEMlIFcDvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LilD7GJx;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D756606A8A3
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D756606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LilD7GJx
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e95bd1c14cso32204835ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706503; x=1795311303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMtWGlskVqXWYTGgT8kUzvtSaHGUGjmSxElRD/6sbRw=;
        b=LilD7GJxr03jIzB7EtXGcdYh/bYS7LilwamkzJF3H76Vhg6R8PmB0Jygd06fV5Mird
         OcjnnHflXjVswXGE4WDW+bbzzmZnyjzaVFvkYxMOfxROzACIlg2+Djm1byEpJ6AX6tSf
         OS4zS3ARYBgsvIWBdInSEyfWYLs4u4gQFO2m9lWiFykZrLSxSCrlbylXMiPCwCclwaMU
         bKDpEfZoqHcxi2u+kGQEcB4ZmnJLzkB6AKNJCi1WWhgCNqfC/pWyHaaHZVPymkfKpRnG
         M0MW5aq0x0n+WRXQIJGf5uHmAcLcTj8hH1CVZbKOccm/DGnso/1/tY7buaS+TKbM0GqX
         QGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706503; x=1795311303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMtWGlskVqXWYTGgT8kUzvtSaHGUGjmSxElRD/6sbRw=;
        b=N8gM/pX8lrbOd6VhDnOtxcmLv6QZawavyoCzxuAqoBjXHHLw53L36MTFej8Lq5zMJZ
         s+I8u5hliTvFGjnlky32I25cyKUAyxEWAQi9WsIKSHWMqGZa6QlP7TVaU2wy1ZUxy+ol
         ymh7xfd+cvLgwxyPu3jJQjV3m3b+1sGTxzM/9yNdfXogKrtwNRH4Y2zJ98phAN/TYBN3
         OD7SjQzXua4BXLXO5odjyBLSk01uTpSVukM8d4FsaZs/PcSR3XgFqjJ6DBGxvulHmIgv
         Aezpq4pDa1qCRBVDfuBM8g1FSGwIc4KWQ3ttuYSctNTgixqsPg5pAgOxDzy2IxFGMJKj
         bKXQ==
X-Forwarded-Encrypted: i=1; AL+hErHDuTtFf/teargq8u0cr6mK9bgl2dvTbvmVegwgo2+GCV+w7x+q/6K5TnJLvWapPHc5Xtnf7JGWQnJuqE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96NnnsdWN1UBSEgfckRllcNzW19oCIAY54MRRNoZ/2kOerZE6B
	cm34ixd4a8tsSNXCsRQqPd09XSmmWmC/DIr6IdIV8aTmBb1FyLpn5yyF
X-Gm-Gg: AYBFou1U3tWeE5a85FWrElFcFtzBM0Fj19fBAj1LwVSMAk+Bw+1yTFydkNAoRQ+JAZq
	fQpct0vWxLKO6ZSR8fJ1jdcXWpUDKghVdqh430PoPe0tq1ZcrahwWblXrUhMxB3jOycwyTIik96
	eSI9nw8dQdMty33f7yGksAXbj9bj66KnP4XJI0bOp6eozmm8kGAxEBwB51uOgK0HVCmIe1YXOVP
	sq6d4HoQ3O+wo4tpml8rQEQ+p0fnPcKU4mhAYdzA4FGxWOgSxMYwV4K9rj+eO58cxxzmXyw+ndG
	4qiLsXc6OcFYaYX7TtUywuzcIlHLSEhWz8NC9tNQQILzY83TenPnc3PxekIZiij0wMRZRlSMrJB
	0MUk/+lzlL5I4MbGJdMxElhzM2O+l75cDQIIaCv7Ii8YOUDZpStrzEDIhRWNF3Bd1Yp/w+ZgiPs
	fCMLlFf2xFMWtUyRqsvbsdxu4Dkuk8a9zl9jjFCsDpPz9AiiYxbpU6Qp44lf79eHrTUfE1TPm3Y
	eaDl/F+4O9TGnjRnGisL0zxnlhe3hPNN4owY7qOFhyTcFnjD7/qf+iZhdbDTHhbSnductOGcsaN
	K3SuPfOVmhstDuB6nhQnKeGNoGrTc2XghM3T41fn/jegIZoNuCBidyOt0pPxRolKIsXUJTh1oQF
	3ysmbeL5dwUaRLI4qA17NCO2ULKp7p8s8sv3JSBcL43eSYqVnbntC4G2YPqzeimWB8h3dXprSeW
	5+fVaiRIkU2jWPvvBDCz5szX+1LH9D8hS4ABDsRmwZ
X-Received: by 2002:a17:902:e848:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2ee0dd2dbe6mr71270395ad.13.1794706502800;
        Sat, 14 Nov 2026 17:35:02 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:35:02 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rachelmenge@linux.microsoft.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v3 3/4] tpm: tpm_tis: Use cached tpm2_acpi_start_method
Date: Sun, 15 Nov 2026 01:34:55 +0000
Message-ID: <20261115013456.212141-4-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115013456.212141-1-sidchintamaneni@gmail.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
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

Use the cached tpm2_acpi_start_method value instead of mapping and
unmapping the ACPI TPM2 table again during probe. Remove
check_acpi_tpm2() and open-code the start method check directly in
tpm_tis_init(), returning -ENODEV when the device does not use
ACPI_TPM2_MEMORY_MAPPED.

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm_tis.c | 45 +++++---------------------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 6f8344894ea5..df2d8c1c2be0 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -127,45 +127,11 @@ static inline int is_itpm(struct acpi_device *dev)
 #endif
 
 #if defined(CONFIG_ACPI)
-#define DEVICE_IS_TPM2 1
-
 static const struct acpi_device_id tpm_acpi_tbl[] = {
-	{"MSFT0101", DEVICE_IS_TPM2},
+	{"MSFT0101"},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, tpm_acpi_tbl);
-
-static int check_acpi_tpm2(struct device *dev)
-{
-	const struct acpi_device_id *aid = acpi_match_device(tpm_acpi_tbl, dev);
-	struct acpi_table_tpm2 *tbl;
-	acpi_status st;
-	int ret = 0;
-
-	if (!aid || aid->driver_data != DEVICE_IS_TPM2)
-		return 0;
-
-	/* If the ACPI TPM2 signature is matched then a global ACPI_SIG_TPM2
-	 * table is mandatory
-	 */
-	st = acpi_get_table(ACPI_SIG_TPM2, 1, (struct acpi_table_header **)&tbl);
-	if (ACPI_FAILURE(st) || tbl->header.length < sizeof(*tbl)) {
-		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
-		return -EINVAL;
-	}
-
-	/* The tpm2_crb driver handles this device */
-	if (tbl->start_method != ACPI_TPM2_MEMORY_MAPPED)
-		ret = -ENODEV;
-
-	acpi_put_table((struct acpi_table_header *)tbl);
-	return ret;
-}
-#else
-static int check_acpi_tpm2(struct device *dev)
-{
-	return 0;
-}
 #endif
 
 static int tpm_tcg_read_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
@@ -222,11 +188,12 @@ static int tpm_tis_init(struct device *dev, struct tpm_info *tpm_info)
 {
 	struct tpm_tis_tcg_phy *phy;
 	int irq = -1;
-	int rc;
 
-	rc = check_acpi_tpm2(dev);
-	if (rc)
-		return rc;
+#ifdef CONFIG_ACPI
+	if (acpi_match_device(tpm_acpi_tbl, dev) &&
+	    tpm2_acpi_start_method != ACPI_TPM2_MEMORY_MAPPED)
+		return -ENODEV;
+#endif
 
 	phy = devm_kzalloc_obj(dev, struct tpm_tis_tcg_phy);
 	if (phy == NULL)
-- 
2.45.4

