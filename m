Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340E3D649C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532919; cv=none; b=UduDnDBUiUkdWUBf9CUzMEGRZ1ytV6sQXCHJLIh8TkO2fH6yl+xNTZhjt5/oyBbg4Y8o7OL+NbTCBztIaOjYeshhzb3KA52ZQR0AhiGDOqmWsqSpm9l2prl5e6TOacETFjvMi4CLXhHWbjB5/l3+cZyqdmmyDiZVWCwuabg12eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532919; c=relaxed/simple;
	bh=bfC4b+YyGgeatQ1fATA+K9JBkUpXUGu/jMc83tcDIHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fuqryENdbuP4+LEh147qGVG+bv2Mb0TtLDAzv50TiJy/7VOOz3axd9lAEBsSd776b/QggIZl8Z2WvSgXy+iqKb9k2iZ6DNgCImIdMmXvGW09be1hKEqs9LhmluchNaBu44SPVHTC7ZFHqA40QGDD1xL4Ce/AJgqc9QVfdPfG7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=luTGLL9r; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="luTGLL9r"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482dbe4d247so656427f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788532915; x=1789137715; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VKygCL74BDThnVT3iAYFENRkliGxbogoLWoSyJEG6go=;
        b=luTGLL9ro5z9AKdRYW1LvdY55MA2aIVlSdbMGye64oMHI/mHypfpPPDYqALogSUJgH
         6bq6Y2TGXtWBSOstz+BwAEOiOZfajcMziNuKKAqJzN2bczpFF0SI75Xoicxasb8AYq8j
         QJbnXNUHKCjDqWzmIeVplj/Dnvp4spwW6gQPHRel2o/UGipnDF1y5D1aSoVTqatNeEs6
         bm+OUJz62Y6P4Tf9nHxg+iqmu8Pjawz9RZ3+QPxjwYiS7PRVnhZudhlKu+YS2JnE8qlr
         6KSJGgPHw3lzduRlkjg61QJw+ExVqZcUqwmGTofe2EjdIDovhRWVRczbm/YHo59HRsgb
         XqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532915; x=1789137715;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VKygCL74BDThnVT3iAYFENRkliGxbogoLWoSyJEG6go=;
        b=nHz9Poo3Q+gVBqqsaxu+EVH5qMG4jzjlRF3e0uKT6JrOYvsnBryi2zcZaRrMMdjyYg
         x2gYHESSebXFLE4zH+OCkSaYvtY8ToM5jO+sSRFfRPVN202aERAMauapZlZNJEPTBOpd
         DcNRfvnICYwoYlfd0TnesBugGDttfQ6qldydjGZ7oY5fj2C+Sc0Bb6yTESJ7bJJ299M5
         Vf5RzvczbNVs/w4iQDYc97U72ksgGVppyUrllc+BH0xiTmF/t2QkV2R/K6NqGu4ixuE+
         KHekIhGP5fg33pzQN78cnJV3P4Pl/matOrCD+kkSvCSXhIBjDq9TlxKAl2JT6HEVwXNW
         kv4A==
X-Forwarded-Encrypted: i=1; AKwUvBxkI2JJtmGhWFhCKxjAiO6OS0kwAdkj+aBP2pYTN90HbE5q30ayvZ5CbbrFyFS/LXUZY3aMYLv0b4r8N1w=@vger.kernel.org
X-Gm-Message-State: AFuF++n0skIchBqALMrRPxFDIi3nNgjOyCTt/R8VRURcp7UB6SX7/vJ+
	ZAGXQbVpjZtpAyWzGM6afO0c+qWRdCJLxaGsN/wxbkWLtW3ai8Exz+2JMPai6xCwPL0=
X-Gm-Gg: AYBFou0Fq9kwS8JqmUs0h+n55eyKvEpgCfA6AnSns3Ono4P4i4nHT6ys6l00q8CJ+WL
	DbfBHg5l/xLCUbfyrZ48dpSZYBL9lIauQZH8AxaKl+DyAsGOK5a2Z3xGCyiuEsxnI5EaNWtMsoY
	jBM36CGxup2349JkE4xcQHRZrDJSJKSrhwlCgvDMIS+K6smnEpg6alKaUyA3+Ec8KgrhaTZVkQn
	BDTtv8UPtJCZ8B64igQSO7Ui61Yi1S2VvMWVR188erzoGZw9IdO4L5pVwO75MvkoiDlDiI3Dxn7
	WKRCwLGVd2a65Iah5Yliz87JmRLPBWlYSdb/t8JXqx6mNDq/SygxhV4YI++Zu7l4wsIEU/ZFioC
	gb/HWx5wq7MgnptGoIgyb4b7rRPhZZIt+LA0bc1ffWsmDE/CMPjz11TPO2ZymifQW9Wbsd4F+TO
	FiZl0mMwCgmGIxASgSqT/+79oOpjSxfJcuBQNFoy6SLZdO986yAgaTmD3ETLqO8sdIwsc/v4FFi
	PnQzw==
X-Received: by 2002:a05:6000:70b:b0:485:8be1:378d with SMTP id ffacd0b85a97d-4858be14b94mr8479608f8f.12.1788532915074;
        Fri, 04 Sep 2026 07:41:55 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588133600sm7386392f8f.5.2026.09.04.07.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:41:54 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:41:43 +0100
Subject: [PATCH] edac: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-edac-v1-1-ef93d60bbda4@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAKbYmmoC/yXMTQqAIBBA4avIrBMs+r9KtLBxqmlRohWBdPesl
 h88XgBPjslDKwI4OtnztkakiQCc9TqRZBMNmcpK1ahcarQsyWiUQ2GqlEZUtakg9tbRyNf36vr
 f/hgWwv0dwH0/P3IanG0AAAA=
X-Change-ID: 20260904-acpi-edac-b5d71efc08d7
To: Shravan Kumar Ramani <shravankr@nvidia.com>, 
 David Thompson <davthompson@nvidia.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Zhao Qunqin <zhaoqunqin@loongson.cn>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788532914; l=3128;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=bfC4b+YyGgeatQ1fATA+K9JBkUpXUGu/jMc83tcDIHU=;
 b=414Kddax8VNBCpDeN0MZdMUSnT0VydtGGeQwzgkdV3b0TzFRxcl2szi8vZWsN4tzv9KH+KYYD
 Yw+QEkbQq3XCoDRpvJ+7upGh7irf8efIJRMT6Qh9542xtYw0y79m1WL
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base. Also
drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id
struct, which is defined in the include/linux/device-id/acpi.h
to make use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated
with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (as most of the existing casts are gone),
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
- pre-clean-ups that convert the lists to use named initializers (this series)
- actual implementations that make some of the modules use the new driver_data_ptr

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on a64 in Yocto using 7.3-rc1.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/edac/bluefield_edac.c | 4 ++--
 drivers/edac/loongson_edac.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/bluefield_edac.c b/drivers/edac/bluefield_edac.c
index ae3bb7afa103e..472fc87627788 100644
--- a/drivers/edac/bluefield_edac.c
+++ b/drivers/edac/bluefield_edac.c
@@ -472,8 +472,8 @@ static void bluefield_edac_mc_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id bluefield_mc_acpi_ids[] = {
-	{"MLNXBF08", 0},
-	{}
+	{ .id = "MLNXBF08" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, bluefield_mc_acpi_ids);
diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 38745800ed01d..3ed4d34a33680 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -137,8 +137,8 @@ static void edac_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_edac_acpi_match[] = {
-	{"LOON0010", 0},
-	{}
+	{ .id = "LOON0010" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_edac_acpi_match);
 

---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-acpi-edac-b5d71efc08d7

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

