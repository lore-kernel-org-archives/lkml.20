Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A374F4D16
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975683; cv=none; b=swHWfpKoc1AI2FOEqP3Rsmmu60binKbxFRVmdVqjPCxpimee+sk8nY3D8QG1LNQTtlNRGT3dRJS+zbKnppIMXyE4vLM4YMLUfllqftRYdKYv3VC8cmwcOI/BCApcAYIxDyDwz9ZIFTfkfqR8n9Lx7I/MsDjt/ZEheuvlVb3Bolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975683; c=relaxed/simple;
	bh=H07bD6qOZsBemHcEi3dRq2VupQcxtQJdhbKbUJmW6II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bk87MHfX2ZiLxX41zdLxk6hu8AFL5S8RWLVdfGCQ4qdESJc8jwSq++aeVr+zQQCS0QqPcLjv+0lCSvxcb1zF04IqVUxfHq5gArtTjy7AtCoCdJVXk5++FDT4XnDbnsqV4RrW4b5o/7w7ER6UrLcdKdt96Ul9n1/Y0d1pnFfOT0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Dd+/4XJn; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Dd+/4XJn"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so3764250eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791975678; x=1792580478; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FkSrvzv025Cve3dpst5Lo/aC86j8VHVRGBxCGikq32Q=;
        b=Dd+/4XJnTKcTfQ398tDT0EofQHimFr0G0KcEwwaAOuEeTqJwkSp6gX46CVgo80Uy9d
         iJKbu42AApQL5HISQvDuDPOOxU8q9zucyD/X5LpWov2l3bVXJD2HizpNDQoFW50NulcD
         +4wJP/R2KriWlIPIYlfJumcIWTdAyHXfOkY5w1H2xtw8G4GBWdSpkYJNY6N1seCmm7Oh
         i8TlyTSXpYoHkJrJn6yv6qakn8f6YJ5ARpN44qdTveNwUEK3iU7MItr9jvWbheduPT2W
         KuNgeVWwZnunvJV53hONEZAT3UNZpesXPvlA8fgZnTRJzO/IakFNnLC7/hjpPrSOW5xK
         dqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975678; x=1792580478;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FkSrvzv025Cve3dpst5Lo/aC86j8VHVRGBxCGikq32Q=;
        b=sCal/ozIL0J4ynt4VGo7a9aaxRag4ALOb7SnP9HpqTgyYhrt5cNb8tP4ApdgCisyJY
         tjxpTWcS4PoPjPS+eQv+LisPtvNDk8+KsH3FBgMg2eeu2KfWCsp7lT3ATgeSSeo6GDZh
         AIHQhPOGkaabCqIHXIAaz6ro2Wd1S+hgmEHy5XDfffNZz3A62Pz3DgSHwKZUPvQNeEy5
         YSKRiY3YXxWzkFu8sIDJ+D2v4yd8Ap2ifGIv7u+Fzp6tczOgYPmBuco3mwwhg60E6E8+
         mb3ozgVmZLP8gylI3mgqotc0JQw6eTUlSz292uKr/eDOxQB+W3Bi7O4LQGae9RfP72k/
         yzCQ==
X-Forwarded-Encrypted: i=1; AKwUvBweFPsugG1OjPMK0sAvtD17K/oZNBnKtOmX7/mnKsxu2B5nFrBd4HPHqIHAQbBTHfr1dsnSOhGxCrBddKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs8lfhUTjcFMvKE5rcX6Sk2CsSQ/SzkU5aNG+9TTh+AxREZLR2
	QNUr519Znc10r62ZYoaG358yy0wBO1M559k7KJVLRvq51FXhWmsnEZMEJBFwna856Go=
X-Gm-Gg: AYBFou0xg2KFD1t6REpN/zq+EsmabVYHTDw7mDhib5462hiLCj59jVGYAfXLo1nHoZD
	AB+XJ60CcsWqSJraVt+OSvjcD/lDebykcCBWth8WsCGJL7b00iam/HuKrBpyZ2718EkNrOzyw9D
	TeESPP3chRkqtKzRm509+2ju419dwIAQ/2/J1pGG/qWeVBrDozhJ4pnyKTzr622rO0VwZx5V2pv
	KDhF/xqRTnaAsMW4uQoM+KdzrIkDB+M46csqRL3sxHxVv6oQoKhCjsD94X/0k6qDYJBlkKXGv45
	rOixwp5urc9rYQ5ARMJBGAc/YdPO/BVr25aI6+RczeuHkqmhDErnc0y4bADDvN5+lFo4IFdT3mN
	MydK8aSVUAIaLOdn3+xEs2xOu6cgZYWDMfr+77LoQs2NS+j0xDcOh6cPkQxle3l5BMu19VHKMIU
	kcnq2xtYOTLgTFS4WQwiXp1YPSSjUtKDKOSIalKBR2vjAwR7OET82KfJne2lwYjufYggwRwMTjn
	ZVP3Pw4KuCc
X-Received: by 2002:a05:693c:6089:b0:35e:2c6:d46e with SMTP id 5a478bee46e88-35e02c6dab3mr2383001eec.41.1791975677968;
        Wed, 14 Oct 2026 04:01:17 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:bf23:2386:c0c:815])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm34407993eec.11.2026.10.14.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:01:17 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 14 Oct 2026 12:00:43 +0100
Subject: [PATCH] irqchip: Use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MT3cTkgkzdzKLC5IzMAl0TE0NDo0QTE0tzi0QloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA3pC27nAAAAA=
X-Change-ID: 20261014-acpi-irqchip-44112a44978a
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791975673; l=5723;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=H07bD6qOZsBemHcEi3dRq2VupQcxtQJdhbKbUJmW6II=;
 b=KnGKX2c9fWwUze4Svws/LFuCXmSjykvlWpd8zJPn5A8/r2ednT1o1wRjZ0QUBNLebrGroghet
 EK4YT/EWBN+AaFhTQJeuZsJsUCL1FJ8jkPJNl5FLjNyMpEu+CRmzxCq
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
 drivers/irqchip/irq-gic-v5-iwb.c        | 4 ++--
 drivers/irqchip/irq-mbigen.c            | 4 ++--
 drivers/irqchip/irq-riscv-aplic-main.c  | 4 ++--
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 4 ++--
 drivers/irqchip/irq-sifive-plic.c       | 4 ++--
 drivers/irqchip/irq-sni-exiu.c          | 4 ++--
 drivers/irqchip/qcom-irq-combiner.c     | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
index 442c20614dbe..34afa036c34d 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -282,8 +282,8 @@ MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id iwb_acpi_match[] = {
-	{ "ARMH0003", 0 },
-	{}
+	{ .id = "ARMH0003" },
+	{ }
 };
 #endif
 
diff --git a/drivers/irqchip/irq-mbigen.c b/drivers/irqchip/irq-mbigen.c
index 12919836dadb..0b4d78a0bbde 100644
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -247,8 +247,8 @@ static int mbigen_of_create_domain(struct platform_device *pdev,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mbigen_acpi_match[] = {
-	{ "HISI0152", 0 },
-	{}
+	{ .id = "HISI0152" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mbigen_acpi_match);
 
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf..1676d64e6e4a 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -305,8 +305,8 @@ static void aplic_init_hw_irqs(struct aplic_priv *priv)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id aplic_acpi_match[] = {
-	{ "RSCV0002", 0 },
-	{}
+	{ .id = "RSCV0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, aplic_acpi_match);
 
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 612f3972f7af..bc80c38bb864 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -313,8 +313,8 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 };
 
 static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
-	{ "RSCV0006" },
-	{}
+	{ .id = "RSCV0006" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
 
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..ba9c200b12fd 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -538,8 +538,8 @@ static const struct of_device_id plic_match[] = {
 #ifdef CONFIG_ACPI
 
 static const struct acpi_device_id plic_acpi_match[] = {
-	{ "RSCV0001", 0 },
-	{}
+	{ .id = "RSCV0001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, plic_acpi_match);
 
diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index bfd2adedf8f3..108d7f2e59c4 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -307,8 +307,8 @@ static int exiu_acpi_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id exiu_acpi_ids[] = {
-	{ "SCX0008" },
-	{ /* sentinel */ }
+	{ .id = "SCX0008" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, exiu_acpi_ids);
 
diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 09819007d08e..6d83e1e4a7ea 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -262,7 +262,7 @@ static int combiner_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id qcom_irq_combiner_ids[] = {
-	{ "QCOM80B1", },
+	{ .id = "QCOM80B1" },
 	{ }
 };
 

---
base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
change-id: 20261014-acpi-irqchip-44112a44978a

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

