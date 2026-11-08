Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173825;
	b=PURE36g/3LnBdu9v3Qd3qTb1qz6uVxWIPeUu3nOma2M3M/CcM8vNOZOnBQLTbmkt2mIc
	 VJsUmkyO9RhPx4HW26q0Vm5aMO9hiz9fh9dWyYzQQn+OuB6JW0uV2On/s6+//QNraw7g0
	 4NOCDpDqvoNEMFdzpLZ1zayyEmY6Gt9GPry3arDFlPFXN1axngnCP+upE5ZJZZD8upsT2
	 7EA2rbryuTvk4g9xz9d2iq6frim74AvF8t5TnxpSrntDcKli4a33H65um6ez+BSU/nOEd
	 M+UTWbv5KQtC7TEG5yk0L42CEDeUK4qGQYAJL1sPC7jMpUHBWByYKd1bXm6Bo6jcJcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JAGmMop/rvSN6d+KRjZFTkwYCsZKr/1kSugo2sOx9jM=;
	b=3bud0vwdLJomLg5fLYi2Nv1w4pS9qOwuexFyy+QdvWQv+rc1cSG3XP4AN10LMJaZz35J
	 kA+2pS1d2OpMD/x6UJcRNibqTOhQT3tyLBdSvPVxPPJkzgU6Z4VbiH1Ph7GQnT5BpaIPR
	 2W7udEPOcoWfrXUXkJThPZ++fIubTZoroHa6ytSG8fAPbUD/WXeZSjHw1PCJqB9gnVJvt
	 825r3slyuQ4ZUz496p6/a/gqQHUmCLkROxECb1QzR9JD0AimK1NKHR/1WwGtS+7RoTInX
	 OkAHf8xOH+RwDOyeikLnPZ7kzaE8bZVcM75BysjplyEy6RknlGP/WbdnKQKbHeLamtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0WhQnpYV;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B75606D809
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B75606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0WhQnpYV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1726275e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173823; x=1794778623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAGmMop/rvSN6d+KRjZFTkwYCsZKr/1kSugo2sOx9jM=;
        b=0WhQnpYVJlFMoCs9uuNevqxP8Z4tvh9vdtDc2FjfGxNFWsbrZcmNCOh1W0LXGjUqnh
         n0och4KQwz+EQ9I7LMymNGeAZLd4BrJc8677zkCId66dgI5AMAf8blMSYwwm0tqWu+HT
         00Yn7HSvs1CVr68NkCsCu/rKD8lpVW2SrEzotBM4U9PQ0vzrFij+jAwtOJqUvUZG6/W2
         xx7ZO8guQddn8Q+av8OYl3YlMN+f1yaVWV4AMI04QM24r7LUpDdebZtQTTyLEB70Al9H
         H68izfiovJ8zIYOY+wRZi55ej+bREqJFgJ+l7PKicN2DJzCRdRWFOBaJ/6B1KpN1F4+j
         Noig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173823; x=1794778623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAGmMop/rvSN6d+KRjZFTkwYCsZKr/1kSugo2sOx9jM=;
        b=K/wRihy0bcLjjBdOop/eCFyAluNLyZl/i9WdKZd4ctvU+9vPsgg6YgL7MTBeKWoLva
         yhL7S3PQWRLKr0J/h0dYANaDG4q0cEDs4E8YD0LEPwBmUkq5gnALDP6vaXKQ3tAzqro8
         C+obzMXG7mHXktoNENw1qTulgnxlPJz5KfeVCpwtQaYKY3F9Md7nRVieYm2NIl9EGrb1
         gVL821SBlJhJkFLTBmHSI/pYfRnqEYeDKAvCcQEATKBGKl5rkZi0pkCzWlFIU6lkBjov
         YkfeozcHFqBH6eHs34g+IcGUIuVdwxybaqjeJI5b5+Ok0de8d3gRZuaU4js4VnZzQRx6
         iR/g==
X-Forwarded-Encrypted: i=1; AL+hErG1+ZW3SORC2IAF5A57hnvFSOFhH4sQQCilLoHmIOtxSfjoqvOV61+kUDH46q3i9GbsXBmPL/WAj8aCpaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U8enjHT3a3rkf3+uftrsh9/frDmuih1QWVQBvPiNKrzEyZn1K
	Bv+LRQF5/T2gj1a4qtCors8F0djkGGBa/CiskuayJR25AiIjNCqTFERO
X-Gm-Gg: AYBFou2kJXV+OIhkVVfpzgYF4YTShmfrwMjHVIFfGcqvTjvE8IroG09kPbxwgwC2Tg+
	47t2xidR7RzERzdwAjqkBgqZFNjmSFG8NT9HF8K1fax2f3YYM+AkCzMpk8ZRTct4e1WnvyrUHNg
	+e2UUpPh4k8lOwEqlkoBHK1X3FpCQhS6Drn3TAjcVPG2mymM0O83UPbt8KcpWJYG2N1g5KmPZ6W
	27ldZR+QDWfx3jXhKMW6D/PCAh5L2ZHTPZsgzSbDHNIDwF1uB4lRt7P6EaR4vGtUb68BdqzId0s
	W5CsPPaWHz3TNC67asd7weauPq8A2qs1jVPwzn6gkEaVCUWSWh13xzZRtd3g1qu+kQdvATH39PM
	7ujeycB5VZVjAeJzI21psEP6jzg2RHG+r+ZlfmnDlgWLv7bS/L7JD3msEcQqmZN/BaR3xJzRWtz
	SNeHCurG2uc9LJwaooSk5/CVx0ci2KiqXeNWWhFGXl5l6Erj3HEP4PLCLXYBJX/+QI7/T6TH8/F
	Zb3kuoybejYRAwKs6X/wBeLaMZpc1gAaa+69OUGDz6x85+UG9JOGidQKB8AN3XojR7wHpENlasQ
	fGMIgj6jFjnbb5YAEyd1Y7PilX3jrN1FtRijNXpTnO7Tngnb72GJixvPXpyX
X-Received: by 2002:a05:600c:198c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4b9633ce4a4mr47702765e9.8.1794173823321;
        Sun, 08 Nov 2026 13:37:03 -0800 (PST)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm92178595e9.6.2026.11.08.13.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:37:03 -0800 (PST)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: Sachi King <nakato@nakato.io>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
Subject: [PATCH v2 2/2] platform/surface: surfacepro3_button: don't load on amd variant
Date: Sun,  8 Nov 2026 22:36:56 +0100
Message-ID: <20261108213656.13031-3-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sachi King <nakato@nakato.io>

surfacepro3_button binds to MSHW0040 on the AMD variants of the Surface
Laptop 3 and 4, where soc_button_array is the right driver.

surface_button_check_MSHW0040() evaluates function 2 of the MSHW0040
_DSM, the OEM Platform Revision, and binds when the result is 0,
assuming that only a failed evaluation yields 0. The AMD variants
implement that function and legitimately return 0, so this driver binds
there as well.

Decide instead on whether the device implements the function at all,
which function 0 of the same _DSM advertises and acpi_check_dsm()
reports. Of the 32 Surface models carrying MSHW0040 in the ACPI dumps at
[1], only two do not advertise it, and they are exactly the two this
driver is for: the Surface Pro 4, whose MSHW0040 device carries no _DSM,
and the Surface Book 1, whose _DSM advertises functions 0 and 1 only.

The driver currently reaches the right answer on the Surface Book 1 by
accident rather than by that test. Function 2 is not implemented there,
so the _DSM falls through to a trailing Return (Buffer), and
acpi_evaluate_dsm_typed() rejects the type and returns NULL rather than
an integer. The revision is left at 0 and the driver binds.

Keep evaluating the revision when it is advertised, so that it remains
available through dev_dbg().

[1] https://github.com/linux-surface/acpidumps

Fixes: 64dd243d7356 ("platform/x86: surfacepro3_button: Fix device check")
Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io/
Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Sachi King <nakato@nakato.io>
Co-developed-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
Signed-off-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
---
 drivers/platform/surface/surfacepro3_button.c | 31 ++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/surface/surfacepro3_button.c b/drivers/platform/surface/surfacepro3_button.c
index b38aa010053e..2d95a8ef3e23 100644
--- a/drivers/platform/surface/surfacepro3_button.c
+++ b/drivers/platform/surface/surfacepro3_button.c
@@ -148,7 +148,14 @@ static int surface_button_resume(struct device *dev)
 /*
  * Surface Pro 4 and Surface Book 2 / Surface Pro 2017 use the same device
  * ID (MSHW0040) for the power/volume buttons. Make sure this is the right
- * device by checking for the _DSM method and OEM Platform Revision.
+ * device by checking whether the OEM Platform Revision _DSM function is
+ * implemented, which function 0 of that _DSM advertises.
+ *
+ * The returned revision cannot be used for this: 0 is a valid revision, and
+ * the AMD variants of the Surface Laptop 3 and 4 report it while needing
+ * soc_button_array instead. The devices handled here do not advertise the
+ * function at all: the Surface Pro 4 has no _DSM on this device, and the
+ * Surface Book 1 has one that advertises functions 0 and 1 only.
  *
  * Returns true if the driver should bind to this device, i.e. the device is
  * either MSWH0028 (Pro 3) or MSHW0040 on a Pro 4 or Book 1.
@@ -156,21 +163,17 @@ static int surface_button_resume(struct device *dev)
 static bool surface_button_check_MSHW0040(struct device *dev, acpi_handle handle)
 {
 	union acpi_object *result;
-	u64 oem_platform_rev = 0;	// valid revisions are nonzero
+	u64 oem_platform_rev = 0;
+
+	if (!acpi_check_dsm(handle, &MSHW0040_DSM_UUID, MSHW0040_DSM_REVISION,
+			    BIT(MSHW0040_DSM_GET_OMPR)))
+		return true;
 
-	// get OEM platform revision
+	/* Fetch the revision separately, it is only used for debugging. */
 	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
 					 MSHW0040_DSM_REVISION,
-					 MSHW0040_DSM_GET_OMPR,
-					 NULL, ACPI_TYPE_INTEGER);
-
-	/*
-	 * If evaluating the _DSM fails, the method is not present. This means
-	 * that we have either MSHW0028 or MSHW0040 on Pro 4 or Book 1, so we
-	 * should use this driver. We use revision 0 indicating it is
-	 * unavailable.
-	 */
-
+					 MSHW0040_DSM_GET_OMPR, NULL,
+					 ACPI_TYPE_INTEGER);
 	if (result) {
 		oem_platform_rev = result->integer.value;
 		ACPI_FREE(result);
@@ -178,7 +181,7 @@ static bool surface_button_check_MSHW0040(struct device *dev, acpi_handle handle
 
 	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
 
-	return oem_platform_rev == 0;
+	return false;
 }
 
 
-- 
2.56.0

