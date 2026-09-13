Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962EA34CFDA
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293080; cv=none; b=M4kNV/a/HJcr0sXij5qDlleFmfOgLV+OYnas12Q0cc2S9hGXNIKAzEq6hejiIyzLzNwJZQjVKyc9egcNE95D3XyL5l24lpMMrDd3VUI4ATr1n9oZHfkSN5RULn3jU3RZJtEoCUsseJoNGRMUR+sX9kc0f5xwHvw8XeWVUaDEUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293080; c=relaxed/simple;
	bh=jbVm0RLVeDlU9P10OCDpld57tDHcD90z/kytGFhXC6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4AkMmtOsHPmjM1PVJEX+oBNi0L6UYNsmfcRmXC/f7HVRqmm7ffGqUt5puE5bPKHfylm9W0RCmWFRHurajIl0k5l9ppbBZBKsHtxA1Fevnv1xD9GcUFtqcVIDEBoWqywBJGeR5fArZeXX+sPQRz2XOHspMeX5giWJ592TonUe2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nw/4EyLQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nw/4EyLQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so193525f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293076; x=1789897876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcs5SoEwbG5DjCJj0LVT0Z2R1O7xtBNzbwteyqKUk8E=;
        b=nw/4EyLQCkwYfTO5vXLsjIHg8oWDopE6qgjNyiU6hL/cLbwFTeFG9MnCSG5O7SwpKV
         9CCwIUoSa7pd2xxsDWHj3ezcRfrxb+uBrdV6woLkRplgmGkfnti9BrSlRinXQTZBXyG4
         G+c1z43+41VOop36KotSePgGb/2pIf4pim847+TvN8m88HXPmB0RvpuDitYX0U2xkUKs
         7HILPXEC1B/aYpFATI98vCdoXVXLf0ElQPt964bdt8Y2jq3qaprVAFeHNNDzNff4a6SX
         tg4+mJn/auZWVfAPSkSlS0lI4J+qBhh0RTGGbEkwwBuotxN0zNL7s5iHYWinOy6xp7gh
         SlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293076; x=1789897876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcs5SoEwbG5DjCJj0LVT0Z2R1O7xtBNzbwteyqKUk8E=;
        b=h/3yVeofbbWAsGz12i+A+8HtZfphdB4Cmujgha+o9Bl4j9nyzuAq6yBnxjcfOw5In8
         XUYUupg3JS+NAIL+cI0kMUlNjvMVhBObtPr6k3l4SFfSkiJVGlJnMbYN//ZdMD2a3Yej
         VFr824NQq6yhQpFdzAuI3Nctjep2eDeRVP6paTbbB6eSB7jWvt+9FQudxC39fQtxiLP0
         0fgEQyzg5m/5PWDzXT9tv8qRIetdD7wE6ZKXkAeV2sik9pxmCBSZUmmnurXEEQ9eG++n
         z4bLnEvEkE29dK7Oc5surm+FGLukLMcmnaBrVl+9x6zEdoP7+LCWKI635OA5y94IWyD1
         /McQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh8gntvIZpLy57y2RVID7Yj6ztyDN2vHrrPcSl0F3JxLO9boF8v5ag2h7TcnFqgKLK35Zzlu8ZwFSjuew=@vger.kernel.org
X-Gm-Message-State: AFuF++lfHHvXNqqaGWWXvCkQQs5VkRJ/VGc15yHZD7h6lupZHmB/+ff8
	tAVvw80eGJ7GCFZNGQ5a3oj0r/DFew34ZBjvtqJiGrXd60PWvJJY8W2O
X-Gm-Gg: AYBFou1KqR8D9DI1/i5jXw+S8/Y53/buLKSosgMkLVpRsWHKvNgxmuqcWKzBTeuBVDH
	CtAAN4PJzIFVtyReNv0yyQWXOidMdcBsRA9eIAyj0d4bQjzQD7A0G4CGSx9/W0GaDjoYzLElB+b
	MnqwX+hZS7DphzzuD1PbHAPglsq8It2yANJhOXkv/I+l0xMGq6Xk8kM8WeflUiZmOCXN54h1N6I
	FfVmHdd7v3XEudqsP6w9m5zGQu7oDJ+7YfKLAihnj4Irz3z0c+/875NKdAWkXha4LlseBeKU4vj
	71IRrYAuBORT4UxGBlCiJg79nAjvSFdPRHNa5pQFzQ8MwNg9V1WpiWT7MpI4/0Z+69OUNPpnRUy
	6CkuXSOAOhW80Sugu135lgCx289J7giFUrSwE9oX/CFbsLGQ5mYqaKryLV8GC3dJWrqAzZ5dlON
	Z3o3w4dmmJ6s18s5B0EFc3t6Os7yfWvsz7gFOwnZJfryfVKbu9GQAj9VDtxIBMawAH4K6hbjNOM
	TjvcWGVPOWcfTXs4T/VdlFkqlKnvEpY2Yri7cumnDYi9k9eM2TRyxjsDydX0ytxxNCgyFmCvUfs
	eYo7goDzYCI/YazsyPcqVgOG
X-Received: by 2002:a5d:5d0b:0:b0:486:f768:395b with SMTP id ffacd0b85a97d-486f768400emr6172871f8f.0.1789293075665;
        Sun, 13 Sep 2026 02:51:15 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm17401532f8f.34.2026.09.13.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 02:51:15 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: rafael@kernel.org,
	u.kleine-koenig@baylibre.com
Cc: kmehltretter@gmail.com,
	andriy.shevchenko@linux.intel.com,
	corbet@lwn.net,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miguel Garcia <miguelgarciaroman8@gmail.com>
Subject: [PATCH] ACPI: device-id: document struct acpi_device_id
Date: Sun, 13 Sep 2026 11:51:05 +0200
Message-ID: <20260913095111.2543502-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct acpi_device_id lacks kernel-doc, so extracting documentation from
its header describes ACPI_DEVICE_CLASS but not the matching table entry.

Document the four members, ID and class-code matching, and the table
terminator. This complements the pending documentation header-split
update without changing its include directives.

An LLM drafted this comment and changelog after being asked to address
the missing documentation noted in the header-split discussion. The
field descriptions were checked against the ACPI matching code. The
extracted documentation passes kernel-doc and a focused Sphinx HTML
build with warnings treated as errors; checkpatch reports no warnings.

Link: https://lore.kernel.org/all/aqEWUBf1pewPP_K2@monoceros/
Assisted-by: LLM
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 include/linux/device-id/acpi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/device-id/acpi.h b/include/linux/device-id/acpi.h
index 65800cefd..8c3b30ebf 100644
--- a/include/linux/device-id/acpi.h
+++ b/include/linux/device-id/acpi.h
@@ -9,6 +9,16 @@ typedef unsigned long kernel_ulong_t;
 
 #define ACPI_ID_LEN	16
 
+/**
+ * struct acpi_device_id - ACPI device matching table entry
+ * @id: NUL-terminated hardware ID (_HID) or compatible ID (_CID) to match.
+ * @driver_data: Data private to the driver.
+ * @cls: PCI-defined class, subclass and programming interface code (_CLS).
+ * @cls_msk: Mask selecting the class-code fields to match.
+ *
+ * Use @id for ID matching or ACPI_DEVICE_CLASS() for class-code matching.
+ * Terminate the table with an entry whose @id is empty and @cls is zero.
+ */
 struct acpi_device_id {
 	__u8 id[ACPI_ID_LEN];
 	kernel_ulong_t driver_data;
-- 
2.43.0

