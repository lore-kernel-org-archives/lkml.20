Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794706501;
	b=2t01IIT8kuiTc4utscEFs63LWfFLD2+qi1djaeMxw0sl6uNUEmuVIjiIVRE80YAAq2IX
	 2/37/82D4kCs4AQRBP1CBT5K2VzBfHcjUSqTNhgHwoti5dl3D6AJ4Ue02diHYTanExmKB
	 HlWIo0W/vXgMqiqyzLEaFJtlkndqXi81KaSdNvYpMA/B1vSw9aO5nkHVyzjA11B3BA993
	 haMNKjoRYpX2K2e1ApZZrv2oW3IijSQvwTOIevfUZGu+qMMCtBEJ6/JYPWoyYSd0WOGzI
	 7UYPqfUj/iWB2++cHBHMr2SUaAzsOK3ABvXqz2Jlkl4LQtrpPgd1biOCdfozDlk490w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794706501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CRGAUvOGM7cXeBiNifNubn0WANT9Nl+imZXj5mUQRV4=;
	b=AmKidPXl/wSu9cSob7T5L+PN9ehIX6U8r5r2K82thCo7svNcmRhskelsA+s/FKmeB8+M
	 TyMY6HGAPysZqo2O9JE8NWkhdvSChFoZzsAaklIAs6VtqQHum9kzwvTtYekZLMsj77EzR
	 pwLTV9XOCZhJA1LBcADdFZEJRQ+NLD0e34z1jZbeWhEu8YMVGDrEztzdsPg80KmNb9F6f
	 Xl8fbaxHmxoSQaw2pcS8JZLGcb1enzFPr8h6Hpy5iH2GuB2C6dnSFKfTLQu7Y35+74pYL
	 lBQfBrpjN26OfLamX4uQfFjhi6oBn0S1D9qNwaMOIVOvK74MFx+pmeN8QXDRdUMu7yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7Z9GksH;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A118606A882
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A118606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7Z9GksH
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e95bd1c14cso32204625ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706501; x=1795311301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRGAUvOGM7cXeBiNifNubn0WANT9Nl+imZXj5mUQRV4=;
        b=L7Z9GksHVQp6Gvhb1y7Dp1+wrzgzxQeF609lfKbG8erVBH8cWqLDDYDQ+LCpK/PpMe
         eFLIUVzl0Dt6RBXN01kpQO/iyjLHhudWnfNpLN01Bk6f+0DOlzg7sJUDzeeD9byT0vnL
         2b0CgqzT1w3QRw70UtYWIMcxpJRassQU4JXxwjnRjw+LhfrZ6aV6WPpfpvA3H17+fCgY
         Z+Wqp3cZHgmjZ/VsLwiuDvmhotmDocgHyC9tnp6pjKdbeZgsMyDX/5go7INkFwuz8sjR
         SR8LZ+RvnCS6vfvIhD8JIMx4nu6978l0bLUxsYg251DBDzzQSOy6gB+QUIVsW0PW1B0b
         0Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706501; x=1795311301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRGAUvOGM7cXeBiNifNubn0WANT9Nl+imZXj5mUQRV4=;
        b=UGjXzJrbxsjN0D+d/zyVn9mfsXrWOgld8GF9GAWMG82mulr32V5JLZ9+0kf7RrY0Ci
         Df+PMvGVnrhNRXLR+pvGBHrf9Yo+0eFrzQUiNonmLBAcjTZ8TCMT/q6CsddgZfqyXtpe
         DHGvTD3FQKgZ184cLxKKE33WO8G9KtxzxINpHBJ5dNjH5UwbfPMppSl+7FkVYjgDm/bq
         oqsuieYPekKyhAadzckkyUNEX3WbCR1Af6Rwauxibg1aM0KuZOOEdvSbd9TmRCrLNQmQ
         acRB2CzH/rOLrK6JTjhHrIIbGOkx0Mol6wjVCnhot+5bJlusV+6ADnHz9Q58aj1UkjE6
         +zWA==
X-Forwarded-Encrypted: i=1; AL+hErFc+MVqIomw6dAo9kSefezFVsXN33K9lvCn8YvMohmFHetlDy4egCHup0hUwnFUrpdG1ngaPvGW0YjCdJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wHTDLIIzyHzHuH70GoUor6J5YnrkB/0PcpnLJZ8fYAYtRnOAz
	/M/KnsgM9G5NtsSqjJV4FikVvTUNSZoOFxH2oFkrpqlQTKQTvdq640Lk
X-Gm-Gg: AYBFou1p8dJdikJh3BbNSu9qeBufeSjY4rEOz2jsXsn0SScooZLRfN7V1KOClDEgNm2
	qTQ7DI8yT2ClxABsUtKb7LCQ4Sbjhv/jKQXgG0MBSo0K1JVVRgV41qByZkAz9wToyVr2ou9fMBA
	6r40OoKqSLwsQ2YpwI3Ze522hLVMC8kQwDmVjxDkG5wkJqib8cHl/8zKzVjBxgWQYB01pvEd+N7
	2Cn5VBI2M95zREEPr5xxzlBRohY4+1D5HF8/YzFmsj8yDOKObp8bmXQrqChyfsteKv6+d3/GzOk
	xB0tlc+kDwB1BR8Xy09RCz/VJkl5IjIq+1dMNTSKGnChbnfPId92eebFP6V8lv1rM6epn/rzQiV
	6NU+aXjCvTsqSmahKii/qi0sGCwkMZiaealLWwuQGjRjfKHR3FbxoZXG/l4WDbUTz/rv/hxy+v+
	vyKvwyzkIHv35HTWk56SVUA+yJUrfuGwPYPWCYsJ2v+73o7Sawzm0xJCM6UJyZZGYCy5xGQcJZk
	kPVnjTK4Q/x5BWIgi/iOPEHtxi/52nabW/L4nDJakar9Lo5z5h6I1OHaxTD7qOFhZfIGj5lx1Ew
	wP0L5RV35DQziq1Ht4mUwmkAr23atKsysJPt8IRU/7vz8RkHtNLxe1tP/lr6Ro4wRi2WKCIaEN6
	eJ12RzWa5wYiLmrLN1cLpX2kWKwD4PpNOvzw8eDj2sblExYo7aDmIEPzOrn/qEWRegKzd0MpIUg
	sMcR4i9jJvqE3ooQc5Qx0Yv7JxPBMDtmwTyCG06fxnf1+oHz3TE7h+uwuf1g212w==
X-Received: by 2002:a17:902:e5c9:b0:2ed:84c6:5d5 with SMTP id d9443c01a7336-2ee0de3e85emr70675995ad.42.1794706500714;
        Sat, 14 Nov 2026 17:35:00 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:35:00 -0800 (PST)
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
Subject: [PATCH v3 1/4] tpm: Cache TPM2 start method
Date: Sun, 15 Nov 2026 01:34:53 +0000
Message-ID: <20261115013456.212141-2-sidchintamaneni@gmail.com>
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

From: Jarkko Sakkinen <jarkko@kernel.org>

Both tpm_tis and tpm_crb retrieve the start method from the ACPI TPM2
table during device probe, and tpm_crb_ffa also needs it before chip
allocation.

Cache the start method in tpm2_acpi_start_method during tpm_init(), log
it when a TPM2 ACPI table is present, and export it for the leaf
drivers, defaulting to ACPI_TPM2_NOT_ALLOWED when the table is absent or
invalid.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Co-developed-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
 drivers/char/tpm/tpm.h           |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index e0385b16616b..c18b060d7da2 100644
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
+		status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(tbl->header) **)&tbl);
+		if (ACPI_SUCCESS(status)) {
+			if (tbl->header.length >= sizeof(*tbl))
+				tpm2_acpi_start_method = tbl->start_method;
+			acpi_put_table((struct acpi_table_header *)tbl);
+			pr_info("tpm: TPM2 ACPI start method: 0x%02x\n", tpm2_acpi_start_method);
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

base-commit: 7e52fc165aa50e70e8df3c879d04fc0ff1673d4a
-- 
2.45.4

