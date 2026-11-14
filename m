Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684881;
	b=j29SjjeT1Hc4YePEF065VrlsB0GklyPxhGBH1AMGhVOMcdT37ixXd9pN9zXzAFcy2v5R
	 18BdbjJKP0uoas8qU84g5MqFVa1meLPDYWzeQgZv7/dHpdSucfgKjvL6L8REs58Yikg0P
	 65aVQd+EMcTRKsD1/pF1778fmy9KDdRq4H42nePTsmzanoSv10lz4tIKxdSd8OtyFRFSr
	 OoEWqbUH6jF3FWkl9ACJBjs2C7fX9G1Q0rIEEYlFpkdnQYatVwnuS1lmnu87DjQ8aNNF0
	 Ru8WK7Sh2Pct0zN+K6WRlCNJxdViPzfMT+1EHGR1orlDE8zg7z1qu16ZFB/yRHTaWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9ar4Opp2H1k6OcNUZh0cDsgFhCHm2e923NlD+vqOgvM=;
	b=Kn6X9OeojShBtui0K+zawlCNpEj22x4+09Ww4YA48VrxpRnsoptQsJOUu4/eYYu/I43p
	 IDA9RJtmyXBMqOBnM5OVZfYIR1DIK2da2C70jCLIYc2jrNh7GoUCz9vktKDiBX8uItIA1
	 25ChKrzOKVPSGmF4w5MwUAn1Cygqy66AZj7JdZdbDMRhHAaWf8KndCM2lfMXhxYrsRdwX
	 668Y49/znRoSKXvk1sFdTA4Gr+iEXZ+2VS5+DCK9qqfh0juyvxjZSXzZFMZ04uJV4L1kw
	 URfDwOW5av98gLC0PVlWk2/ZmzT3XXqmiIspo+ZvVtL/sjV9s/ANk0YG0YfCtV342Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epLbi5iJ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF13606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF13606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=epLbi5iJ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so2935027a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684880; x=1795289680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ar4Opp2H1k6OcNUZh0cDsgFhCHm2e923NlD+vqOgvM=;
        b=epLbi5iJdzMB05sfV7Gtp3qf/9N2YK034SUivD9cDXtjgeYKCwAezyizQi+hKIQSdz
         ZO+La2Wr77teoodUhLzZFpdxS+PcrDxD5DpdD/rE0/tAmzyFYIaL4UN7dINsfDh2oucA
         xJKJ3tFf/aUsq5lZ1eHHqFy0y5jTDXgzf/SgCtqVgcMMhvcsO1GdAcV/97xpYJsFpRu2
         r4U1XPHlH819WbBA5k7IIGwg6iB5xYSnDQId5eGcaGxBrGkAgV8ILTcWVREi4lfB7Q30
         j/FxUSTG744TR0RWnh5eTef4H/w4CD1bU8bkCOR5RJo8DNymxgUmc1XWXMgtcurLu17n
         jr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684880; x=1795289680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ar4Opp2H1k6OcNUZh0cDsgFhCHm2e923NlD+vqOgvM=;
        b=dVR6zjFvPJwW9IPTQq5Bt+ZuMRykmWtcVdAvmWAvGkBcK4NzewJ3f5GBD1Tk/+/Q74
         emVIxUSvTW9lU3qQJK529J0t6aTkGDnPovj/vboocFMW0txDqln8asisCcS+aSY6z+XG
         znXmbJAlja0zF2bUIR9ZGBFmRd7Itb21da88f++HpazprqJbuOEND/YuRmSwLF5i+mdw
         Um/sowe51qSh1LBhPbLh5Zpt73i9ON/NHY842TsoAXDrY2iOdlduts3TUU6z6GrmVKlw
         MsTNMbFVeYuuTi0/H/tmpMif6Kpqy55a5EsfjhC4Q9E/pmgO4G0TDhkSKmd7Tgjtf4xJ
         DNjA==
X-Forwarded-Encrypted: i=1; AL+hErFaEfneSBpnlhakKyOp7LEm0fvnd6VaYtkuLecZMEn3Z9Bb6aEiNwwPF/3pnupmCTw8ZYz0v58oBZYmPdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ADgcWeG9D5AAweSLsOnOVceHicGThTAXzy2sTnvHxMKcm1MiH
	XH6f/Q0FA9uDHi7kEu/nDyl5bRyqI1qSuHAqfe2WuKLLVWPA2AXHa1cW
X-Gm-Gg: AYBFou03XSv06m0fPduL9D0hcGLxrPIPmxWLYPO7KdLJblNEGVd+0EmB3axK2brrYIK
	46p4rL0gOC/NOag8N05DcqEh8hQ5WS1izfn1LnmnzcdnKSMBLXSZWgbSv8+jXLjJhrDrwiKSOm8
	FAAmlXhgAf5BFdsW7ZUYdY09UR2oLhiiGdlVM0vdiFZZ9Gx1aFhyrSS//9DcHsUFebtQ5SQcmWu
	juk8HTYPrlug3fh0/FdeJWeHtEqcHs0f0nJKTGdlT12tGPZ1WqQiw81uzH5Gl5CJTmaLOJozjF1
	WOZmFs0gyp/hKVmcDfhQUUgT4AGDYZq+8KILChGOZaL9/f8XhzFtS2rGjnSHoF0uJLmm9q/DKii
	oD7ZOhwjbr2qfAHNN+5X/JeztBCtSa43VmQVt7B8yKUh2zRWufT098N7QKDtdgXcaVU3ruCByQt
	wKcxTPA6NEuHNaPyfGeEe2HXa5i8BA+Wb21u3Ltuj84EF5AnQ6BF3CX3+euclBjp6QrR1hZMGc/
	Q2v/A4y89MtlFCYiKffbPBucPke/rfe12238LdFJYdMjaF4X+RaQ7mDmIWpdRHeY4OTLnh2zv4+
	DgTqnvUb2VFqRUtaI8IXbxXZDBQkCC/MzZ0qhDAyZ7mN/NYzQdDubSt7GaifD9X3iHV/HPuk5RB
	OOvZe5oMH5R7V5FtiZ9s8PZQT5b6ANCwSHPXWxMhdsczfKgDxyvjOvzVJ6BT5o6fbi3wPem7Phl
	wujiyZj09r+oeMwgxgUSYubiN2WSCzAdoOEmiDQmn6KPex2jxCuV1HQNzVNzeTQw==
X-Received: by 2002:a17:90a:c88b:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b1b09e69c6mr6471730a91.13.1794684880041;
        Sat, 14 Nov 2026 11:34:40 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:39 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 1/4] tpm: Cache TPM2 start method
Date: Sat, 14 Nov 2026 19:34:31 +0000
Message-ID: <20261114193434.117714-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114193434.117714-1-sidchintamaneni@gmail.com>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
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

From: Jarkko Sakkinen <jarkko@kernel.org>

Both tpm_tis and tpm_crb retrieve the start method from the ACPI TPM2
table during device probe, and tpm_crb_ffa also needs it before chip
allocation.

Cache the start method in tpm2_acpi_start_method during tpm_init() and
export it for the leaf drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when
the table is absent or invalid.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
 drivers/char/tpm/tpm.h           |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index e0385b16616b..7b7da79bee7c 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -534,8 +534,17 @@ int tpm_get_random(struct tpm_chip *chip, u8 *out, size_t max)
 }
 EXPORT_SYMBOL_GPL(tpm_get_random);
 
+#ifdef CONFIG_ACPI
+u32 tpm2_acpi_start_method = ACPI_TPM2_NOT_ALLOWED;
+EXPORT_SYMBOL_GPL(tpm2_acpi_start_method);
+#endif
+
 static int __init tpm_init(void)
 {
+#ifdef CONFIG_ACPI
+	struct acpi_table_tpm2 *tbl;
+	acpi_status status;
+#endif
 	int rc;
 
 	rc = class_register(&tpm_class);
@@ -562,6 +571,18 @@ static int __init tpm_init(void)
 		goto out_unreg_chrdev;
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled) {
+		status = acpi_get_table(ACPI_SIG_TPM2, 1,
+					(struct acpi_table_header **)&tbl);
+		if (ACPI_SUCCESS(status)) {
+			if (tbl->header.length >= sizeof(*tbl))
+				tpm2_acpi_start_method = tbl->start_method;
+			acpi_put_table((struct acpi_table_header *)tbl);
+		}
+	}
+#endif
+
 	return 0;
 
 out_unreg_chrdev:
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index fa554c5ad80b..212ca2410c93 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -100,6 +100,7 @@ void tpm_sysfs_add_device(struct tpm_chip *chip);
 
 
 #ifdef CONFIG_ACPI
+extern u32 tpm2_acpi_start_method;
 extern void tpm_add_ppi(struct tpm_chip *chip);
 #else
 static inline void tpm_add_ppi(struct tpm_chip *chip)
-- 
2.45.4

