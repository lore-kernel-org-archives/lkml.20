Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C7524B17;
	Thu, 15 Oct 2026 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067558; cv=none; b=lYajmBHE40iw7QpYgDU3VqQn0BzJcgzsOjowwoyM2kB0JaNat9cpv2o4N30/e5rmubhjSo0bHfCCoSfNc2vFEWqSfO1wtr8Lad4BS4rQyQ34ZTEcTB13pDQTyGprVeil7YxkKFxUQXNvHGzdD2siPcbzDOb7NDkBhQP+exYbcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067558; c=relaxed/simple;
	bh=pOkFyhjqDA5kv5gWGcan608o9qJ07jFQ/A2Fa9C4ucs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=o2X10JxN/NnT73Oo1zgMzzh4nKQlrhXIXRtGMMV4ywGkjuWEeI2fUdN0C3yk7cTu2mKiKICH/3KugB/w24W+Me+UwfwzgQZbfb6Zr5GFX+poptIOmw6xR48xUtoiMN0j9iwOW+XuEXlOkIjJJixhs/CHve2NVOYXMjKots9sa2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CBTlO3CR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7cCaiHv6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CBTlO3CR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7cCaiHv6"
Date: Thu, 15 Oct 2026 12:32:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067555;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DPEgFyv3kLTr/mDtL/98pdBIzSR5PXj9w2V5gaSl+g=;
	b=CBTlO3CR7t/+lqbpSzMJkQ/w8CMPm1sDt9XjpnJAjZa+2LfMi3U2GreGj3YilmFH8lJ6ya
	+e9tI/5EVhTKxB9JQg5FDKEvHk0eIKiyjQiQA4T1uyNkkaQQqZkk+N+40JVSlb78qoHS/3
	VxKmg+Vwu5XiYREeDWAALZObjH12zRPxk4y2SAeiCubgMJ6aGQD7UY7TeegNxcHMR3h6JL
	rc7eQSOa1N+9C5nOzOTUPhTAK0zBQGAoIDFQde7OYrXsIYIn8MKvfL59Pe6DuraBro5IOr
	pZ8923Zbwb3o+hO8uvqHWm2WtvpnAj7POV9N0caJVFgD8lYd/nN+NX0mgLNtSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067555;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DPEgFyv3kLTr/mDtL/98pdBIzSR5PXj9w2V5gaSl+g=;
	b=7cCaiHv6eGlggmDa8sCXy0Of7cZaLunhj7DOiqEK48yExBRKTDRCaYL/2VYY7x6Nos05kl
	ZmGJfZHOlZoYmdBQ==
From: "tip-bot2 for Pawel Zalewski" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip: Use named initializers for acpi_device_id
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
References: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206755384.2666988.15890757796530662725.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     5919f587ea37bf59a6fd7a2b91aef7b45c626343
Gitweb:        https://git.kernel.org/tip/5919f587ea37bf59a6fd7a2b91aef7b45c6=
26343
Author:        Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
AuthorDate:    Wed, 14 Oct 2026 12:00:43 +01:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:06 +02:00

irqchip: Use named initializers for acpi_device_id

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261014-acpi-irqchip-v1-1-821917378de3@thegoo=
dpenguin.co.uk
---
 drivers/irqchip/irq-gic-v5-iwb.c        | 4 ++--
 drivers/irqchip/irq-mbigen.c            | 4 ++--
 drivers/irqchip/irq-riscv-aplic-main.c  | 4 ++--
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 4 ++--
 drivers/irqchip/irq-sifive-plic.c       | 4 ++--
 drivers/irqchip/irq-sni-exiu.c          | 4 ++--
 drivers/irqchip/qcom-irq-combiner.c     | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iw=
b.c
index 442c206..34afa03 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -282,8 +282,8 @@ MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
=20
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id iwb_acpi_match[] =3D {
-	{ "ARMH0003", 0 },
-	{}
+	{ .id =3D "ARMH0003" },
+	{ }
 };
 #endif
=20
diff --git a/drivers/irqchip/irq-mbigen.c b/drivers/irqchip/irq-mbigen.c
index 6f69f4e..3c54f24 100644
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -259,8 +259,8 @@ static int mbigen_of_create_domain(struct platform_device=
 *pdev,
=20
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mbigen_acpi_match[] =3D {
-	{ "HISI0152", 0 },
-	{}
+	{ .id =3D "HISI0152" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mbigen_acpi_match);
=20
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-ris=
cv-aplic-main.c
index d9afb6a..1676d64 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -305,8 +305,8 @@ static void aplic_init_hw_irqs(struct aplic_priv *priv)
=20
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id aplic_acpi_match[] =3D {
-	{ "RSCV0002", 0 },
-	{}
+	{ .id =3D "RSCV0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, aplic_acpi_match);
=20
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-ri=
scv-rpmi-sysmsi.c
index 612f397..bc80c38 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -313,8 +313,8 @@ static const struct of_device_id rpmi_sysmsi_match[] =3D {
 };
=20
 static const struct acpi_device_id acpi_rpmi_sysmsi_match[] =3D {
-	{ "RSCV0006" },
-	{}
+	{ .id =3D "RSCV0006" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
=20
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-p=
lic.c
index 4156493..55d94c4 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -538,8 +538,8 @@ static const struct of_device_id plic_match[] =3D {
 #ifdef CONFIG_ACPI
=20
 static const struct acpi_device_id plic_acpi_match[] =3D {
-	{ "RSCV0001", 0 },
-	{}
+	{ .id =3D "RSCV0001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, plic_acpi_match);
=20
diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index bfd2ade..108d7f2 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -307,8 +307,8 @@ out_unmap:
 }
=20
 static const struct acpi_device_id exiu_acpi_ids[] =3D {
-	{ "SCX0008" },
-	{ /* sentinel */ }
+	{ .id =3D "SCX0008" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, exiu_acpi_ids);
=20
diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-c=
ombiner.c
index 0981900..6d83e1e 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -262,7 +262,7 @@ static int combiner_probe(struct platform_device *pdev)
 }
=20
 static const struct acpi_device_id qcom_irq_combiner_ids[] =3D {
-	{ "QCOM80B1", },
+	{ .id =3D "QCOM80B1" },
 	{ }
 };
=20
