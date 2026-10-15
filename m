Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87552E073
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069134; cv=none; b=bj2qq3Ed+xJz52g0CGXZuCndADN+qyH7hqdWF+kgBlXk9TGYLvtkhLlShJbygd82ytPGpICf0H3RqbeRnpP1Xq4m+YrdjVnrG5hClucAjJFwIB7UWlmtdsPBUg7mE6vjSYFKzcQPUUh1QQFvh0fVi490enw+2h7h7CUN4ZYAqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069134; c=relaxed/simple;
	bh=Ti3ORTRFIbhTaKVJ+zyV+gulbIXNDTcXQZ/fH+BdAvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pLC70hT4apkWIeLyN5ENqt2wck37e4gqTo9KHLB1xijaUUFAqXm26xJyhEYsth5IvJ9XH3roMOyo9AT2Qd7+eBE3zxYAk5DghfmkyB9l1G92yexDpoxEZuCgcFeiasoP3WCTlemIN6LIdpEMoa4J1+T7CGI9oJAMIctH0s9W5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ufSesLBa; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ufSesLBa"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so2071002eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1792069132; x=1792673932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gzDS3xnAfb++0NZ2mM9jNCMhIa/Xs/tZlWtnxCVCMlY=;
        b=ufSesLBa+FN2uDxqpjml35ku8agTLMNkPoS1Mt5wx7vx7mpSDFd/mFRAhwqCIGy2uW
         gD90CWfaYcCPXDIzK94z0sP92VzcRgstdQRyl8bQo5nWdSuVlXvuZCD2pTw15jmep+lN
         JaIbHPfncgn61udBDTpSOyoz124PnilNi4swqsfz1tJY79iIZ1eKz2/J912lkKGK817N
         en3HLAg74Zy8gTaHB/+uHqejbv7ijTqXAjr0fYAiz9hRSM9xcb/eFsvynUsNfH8JTNF7
         gGr/hFeAFioQ/dVUEzdgJo0Eg5NyNKIEt1x7n74V3V0oR933ROsW65tPaagfzUhpP715
         dTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069132; x=1792673932;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gzDS3xnAfb++0NZ2mM9jNCMhIa/Xs/tZlWtnxCVCMlY=;
        b=VvjE/yx1myR1EjNXLktQBapBQv+c6zD8B8JD9LSmSc2zAmgalbmfrjISmYFlBlhVQh
         tooAJInDXbpzb17G3IZvyn5q54KbnveV0wdtjT5G8PJb63+MrMmnwHRqcpWkJiuFB13M
         VTa3CutVTI5Ms2gx7JIndXXfbvZCO6xqnZNW3wd/g0IYbOeJuNaiqFJn1aGm+mdY85OT
         jmmUsMKpagAmtpfLG6qIZM3uJzwYs0G+Cnprybx6H3CHpm7p/Gbijhij+8DqXFaU5+eV
         /xyLWqzmbkLwqD627DE2etTLSWPvOqTmv4Vq1D1degdrKIVYj44/7lPua+aVteTQbxl5
         DFMA==
X-Gm-Message-State: AFq9FYKSQRViAMacg9BFWPSxX+Ge0GXD5N/dSUGrKWADcmMmkKCP6uuu
	L7nO2/nMEsU68FSdVwESs5cjwOqQA76qwdNQdX/zLzMFZvSKO10YO0n8gt+hcJmcgWE=
X-Gm-Gg: AYBFou1vLDCZKBYVaEDybYYo1gS/kFLweNc+vtbY1LUGbs9h7lc2iby8UAOFIrHPr1Y
	lrrWVTt1J3WrZk9JDhPihXS4C3JDyT7UF+zT0cvQLQSnh6MT5CXE9soqNBOpB8YX+4paMJw0AC7
	KssVj8UjdKPo54uwroY+s44Rm/WyAIGKYcWlEDpOhFZwq0Q3H4tqZbWic/KxLfe6fLTkG3E2Svl
	ai2hgrIiTVDFhN1unZ8rCuIH1f03XNUWfSHLaYjPOyI5NTsFHB0XIHLZpZtGF+H+pAmR9vCcsw0
	S+i4iQ0BSxUbgHHXBBKBfL8qd6DmohlmQlDdqzrNf5vsQ6UdD0MXsHhYF4LKnbmJcTSYhzU1z1l
	NuFb66OLF6JDuNw9VKf7Uv4LG7imrJ4pzjWxQBiKrNqrZtc9EhfRLGUiGwTBW9UQssQ8t5MWjSa
	F3esNQD7FJrsg6JeIXq3n5O0Lz17NV0Sgdz/keCw3nfJMc/cyZltVAiIahQtwgt+jxZk1beX0S6
	75r7doRJpJYtFJm
X-Received: by 2002:a05:693c:83da:10b0:353:804a:5e83 with SMTP id 5a478bee46e88-353804a5fe8mr24930671eec.8.1792069132269;
        Thu, 15 Oct 2026 05:58:52 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:efe0:7af6:c627:5f7f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm27325895eec.23.2026.10.15.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:51 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 15 Oct 2026 13:58:28 +0100
Subject: [PATCH] mailbox: Use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-acpi-mailbox-v1-1-152ba71454ff@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1kAgrpVcRFMh11SmtCUktAv
 LuxLt/i/x0yJ+EMj2aHxD/JEtYKbBugxa0zK3lWg9GmR42dchRFfZy8fSiqI209WoNoCWoSE09
 S/rthvJ03/2L6Xg84jhPqij2KcAAAAA==
X-Change-ID: 20261015-acpi-mailbox-5c09b192119c
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069129; l=3235;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Ti3ORTRFIbhTaKVJ+zyV+gulbIXNDTcXQZ/fH+BdAvQ=;
 b=KHPuP7rvUi2hhNNtdgguZt1cgOx1RwPRIeyrjwuRcU0S3vubL3X027eNdmKk4+WyLv6WFbnR0
 XcJpEBEyzOtDVNPC97aqsT5fzrS4Ovo3AXER+h01Sh/6tZbj9P6QLep
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 4 ++--
 drivers/mailbox/riscv-sbi-mpxy-mbox.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index 946ea773ec33..1f87a84e5995 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -228,8 +228,8 @@ MODULE_DEVICE_TABLE(of, slimpro_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id slimpro_acpi_ids[] = {
-	{"APMC0D01", 0},
-	{}
+	{ .id = "APMC0D01" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, slimpro_acpi_ids);
 #endif
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index ea69c6b6b4f9..4ebce35a8b6c 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -1006,8 +1006,8 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
 static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
-	{ "RSCV0005" },
-	{}
+	{ .id = "RSCV0005" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
 

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-acpi-mailbox-5c09b192119c

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

