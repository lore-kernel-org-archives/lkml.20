Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85D598C0E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097104; cv=none; b=pKNBAXApuHX3aNA/YjAbsnk8NW872YvcKXoNBDKLoPjkdDJu1y74ASQ4kBEqgiLI9PHbVxAR/Q75rSeSF6gN5Ngcfwnod5bwRKOb6qpDwAf/8xyP5n8K3zYQOX5NM/JnKulMjmoiZrn1xIpptin2i3QVxnMnZgo0JdMD7Uxot7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097104; c=relaxed/simple;
	bh=YUrSrx3nORZjCfUb1kowBqtj+wacaINHUxJG3uHwC28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cTMcGvhI51vAkITWn4MYt14SmXS+t0GVPedD2q1DbLUuZnfchK5J0AVwZ332L5VrCEs/daUwNzzvrxkNFEAwT4cFKfO8WxA2QPUtLyjCirDujqM9a43VBh+tAR0UV8AvnBFP+Pqgwe26El3hMsmMUY3jLhtQMsk20MUoFHEfG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3lJ8A6C; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3lJ8A6C"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15354aa70e8so1150599c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792097100; x=1792701900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2O5F6+HI/RIGbJQtd9sQGMunBjZHyF+3elLXX+sKSI=;
        b=S3lJ8A6CCiWhEgOLkEBjEvvdXGaU3FM2LOGF/Mj/VLAmbPOHevyUNvCbSOYZFmPH4K
         QwAsHyEoxHd32o/cCP8x4Qr59JmStan7Sv0zqOeiEyxQbhn6c1fx8RSZkmFOyhGjoeyH
         NEBeFLaxax09izCC9NJ+cAl1zU5YyrCnTLbPZvwuTtjtRK8WQSACbzF4WAZeofQIOgPi
         ZRjGHQGJ0hOOO4zdYQGSeUaoIYzsHLlkuTOcP6exmN5QzW6Epie3IfFdTpv2pIwfIUKo
         1PZme+7CfB6lhzbv8qBcPaR0xYNaBgEKouJdjgnpa4tPLpPl5c31opAEWSsChqgSzjuf
         z3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792097100; x=1792701900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2O5F6+HI/RIGbJQtd9sQGMunBjZHyF+3elLXX+sKSI=;
        b=0wBfcERxfwGC5NRPoTWgzj6uN3MB6IQ0o3kwQ7STIy3Ks8UMeR3LVv+X7oMP0pK2/Q
         p7Pgi6fS533tlu6k9YJflc16nHojk/Q91HtzGMNbF0l118pAMkT8RP1wSA1r/JOpQgwC
         UyrvJhBCWCjGPdwotqoNgE2xls3u1341Cub7P+AP0G/HQV//s8aYXYqNo0B2sOQqtjlj
         5sq/VbWRcKlTbYogw+jFadqGHxsH3+8GCeqLQkTS+mym/jZmWSWVtqOv37Ohx37F+RdS
         Z6k/JyJgJj3W2IEm0JgjDXmjv1aj7cr7KA0ch71VcdVTCHD0oFIWIL0FkxbZyzo7pt8M
         9LNg==
X-Forwarded-Encrypted: i=1; AKwUvBxNFlG4kQSe8w8PzrKR6BDKCNGeHv2GIahJRB/zShFuSmLIwdLoGuHrbYk8xaUxccjbMsJGZ3hiDQMl92k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWaEGl7fMZrWehO+2hHKUFi4J3mJR3JJFNnDlerqAK+9UXsYeY
	OpNy5vPa7b/WxrGAvcY9oG6gPrIthsthFn3CQrie1CEw/7AMHxTdioVweabXbtk=
X-Gm-Gg: AYBFou2rVH49QDldhlPWxrXUUF4N0Z9qJk2+sI4i8CNEtuczTr1baHMkW9KiWlVwvb+
	U68hjFkHKuRMQnz1gJ/g/8fEaGRwv8RPpAXtLjZu11Ln/zM/rhfEdWs9wKC4sWf9as7WAX+ZDS8
	N4EADlxb83KbBneTxLUM2W1FqO50PqedHGkMLM/uGFECdzgs81vAO3pAa6eDtdUfgAm/ujW9lI8
	7pf1TNxQKlwthE7LlrheBGmnvGiJ66zwgcZznL/fFuxXnW4/skC7wqS7H0Z+rZU9AWxJnspIPdi
	1quqdWkISK7AZRXiN28qmRmlU8m+7FitTP1bzSIhiMGRpPXFAF0g4qde0z96bB6cy1xKcBAui4H
	PkNRe0032ncOcy7eMoE/BDk56zq5gI9Kw386smNFFOMpu9IkuZ7KJfMx4p1HLKCEm+O5hmeudr6
	XgLJEVL+qh7M+XU1YEKCva2LPQCDf8Y8LB3BvVr7fc/bu2qifwjViCfxS4bvDFwx94gfle+bRW+
	rXg0fQD3IztwYfO4McVjxalOkozO4A=
X-Received: by 2002:a05:701b:280d:b0:16b:fdbf:4a9d with SMTP id a92af1059eb24-16bfdbf4ff5mr28145542c88.27.1792097099604;
        Thu, 15 Oct 2026 13:44:59 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.25.242])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm130114c88.16.2026.10.15.13.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:44:58 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ACPI: processor: Use Apple-specific methods for P/C-states
Date: Thu, 15 Oct 2026 16:44:47 -0400
Message-ID: <20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use APSS and ACST instead of _PSS and _CST when available on Intel Macs.
These methods are used in X86PlatformPlugin.kext, and when not found we
fallback to generic _PSS and _CST methods.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/acpi_processor.c    | 22 +++++++++++++++++-----
 drivers/acpi/processor_perflib.c | 10 ++++++++++
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 5fbab5417..782676ef7 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
 
 #include <acpi/processor.h>
@@ -837,27 +838,38 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 	acpi_status status;
 	u64 count;
 	int last_index = 0;
-	int i, ret = 0;
+	int i, ret = 0, base = 0;
 
+	if (x86_apple_machine) {
+		status = acpi_evaluate_object(handle, "ACST", NULL, &buffer);
+		if (ACPI_SUCCESS(status)) {
+			base = 1; /* ACST is a 4 field variable we need to skip the first field */
+			goto success;
+		}
+
+		buffer.length = ACPI_ALLOCATE_BUFFER;
+		buffer.pointer = NULL;
+	}
 	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
 	if (ACPI_FAILURE(status)) {
 		acpi_handle_debug(handle, "No _CST\n");
 		return -ENODEV;
 	}
+success:
 
 	cst = buffer.pointer;
 
 	/* There must be at least 2 elements. */
-	if (!cst || cst->type != ACPI_TYPE_PACKAGE || cst->package.count < 2) {
+	if (!cst || cst->type != ACPI_TYPE_PACKAGE || cst->package.count < base + 2) {
 		acpi_handle_warn(handle, "Invalid _CST output\n");
 		ret = -EFAULT;
 		goto end;
 	}
 
-	count = cst->package.elements[0].integer.value;
+	count = cst->package.elements[base].integer.value;
 
 	/* Validate the number of C-states. */
-	if (count < 1 || count != cst->package.count - 1) {
+	if (count < 1 || count != cst->package.count - 1 - base) {
 		acpi_handle_warn(handle, "Inconsistent _CST data\n");
 		ret = -EFAULT;
 		goto end;
@@ -882,7 +894,7 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 
 		memset(&cx, 0, sizeof(cx));
 
-		element = &cst->package.elements[i];
+		element = &cst->package.elements[base + i];
 		if (element->type != ACPI_TYPE_PACKAGE) {
 			acpi_handle_info(handle, "_CST C%d type(%x) is not package, skip...\n",
 					 i, element->type);
diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 9e25d6124..b4b36e60d 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -17,6 +17,7 @@
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/platform_data/x86/apple.h>
 #include <acpi/processor.h>
 #ifdef CONFIG_X86
 #include <asm/cpufeature.h>
@@ -324,11 +325,20 @@ static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 	int i;
 	int last_invalid = -1;
 
+	if (x86_apple_machine) {
+		status = acpi_evaluate_object(pr->handle, "APSS", NULL, &buffer);
+		if (ACPI_SUCCESS(status))
+			goto success;
+
+		buffer.length = ACPI_ALLOCATE_BUFFER;
+		buffer.pointer = NULL;
+	}
 	status = acpi_evaluate_object(pr->handle, "_PSS", NULL, &buffer);
 	if (ACPI_FAILURE(status)) {
 		acpi_evaluation_failure_warn(pr->handle, "_PSS", status);
 		return -ENODEV;
 	}
+success:
 
 	pss = buffer.pointer;
 	if (!pss || pss->type != ACPI_TYPE_PACKAGE) {
-- 
2.55.0

