Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A03043CF
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791662130; cv=none; b=XaCCPerjIlnHxM+4OqMXCeqzBNl2rJ8aNe+/nAwzenGReCQTbTZWHo+X8gXBn1e/urW65rIPQgNlDZIWSmjuk1VfAPMU5uiJRUuTyzCbC0BK/G+sJkeUwQdMljd8N/tdXcSTNRra/8RHuTdIhPgIgIAPBllWPu6jjQ5NwY3nmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791662130; c=relaxed/simple;
	bh=VvVh33q/LcRioaEUOAFFjkFOJPBDmzqONfWQOUP9HVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQgZCLh+VWB49yqbvjMWDECj4JE7tyXwnpm1hxdc35f/h8LJxzQ+9GK9wKmAHzOejN8FAzubHoNtFAcTXDjLtL2cCgVQEsH9TDZcQQc+kUo6A1XhM3hbnUjRqJdwyj10ZLZq4zSTGy9K07NJJGC+qnokEn2qUJzMHafQ1kk2BrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=gQB1zRK2; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="gQB1zRK2"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so1271356eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1791662127; x=1792266927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVa5PKFZG05oCr1W6VnQbp7u/39NDlzVBtH1WKIfORk=;
        b=gQB1zRK2qSPeJUanOjQchZajT8gOROIfT/PiTsWk5xUhFum3ejOdbahqz/svAjqKm0
         Kv0k4ZUi97rL87YkxsDOBpOsKjp2mCzWS3fy+BU8MUuj8IUeQdPiecN2/BBZmE8vAttP
         w06vfvqOYb3VsX4YUrWdLOEJJRPmn7s8qxUEk3R46b9GzrLqrXHWmobAN3kTMJkK8obp
         V0U2Wz+Il6kb6jmIZPvntyeqncLL4CE6TvsdALmQg1OoSZ/CdL8zxSvEKB4cow0AokhT
         6uXRO91MspinKugizFllJ80bbtzSH8frP9U+pLk4mGviyGjYWiHM2PMqxZl93GkGaISz
         Wgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791662127; x=1792266927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVa5PKFZG05oCr1W6VnQbp7u/39NDlzVBtH1WKIfORk=;
        b=LSVMVnhM6uFqsY9U8Lhf7I5XS57+9YvqoFlqG6EMVlJcYh8BXtIdXRXv1HHXcxWgbW
         +k6wZT74CtwdNaLiY2pkE4pAW8Oik62whaRfhBhGX2dg9khTqgFNht3TeuuxH1KlF8F5
         sDMI45Y2k5FE7gqfnr0IZmoRqS3Jv9OslP8dx60zcMSJ0+l508skEsnjFsi2MW8urg/T
         K16p4pWn4vUqUbqtDJx6gitRgNh4fuh0arLBkTS18l2o1B1+fnPvwov5nktMCnVALgKh
         kvSEqCx8mefXVMN2Fm4Pw5DPEmALFzDZxJu+bGjEbx70IyNOAX1Yig3U//bcR0OWvEcM
         AIVA==
X-Forwarded-Encrypted: i=1; AKwUvBzW5EpQq1SDuyvBQyKFsMHsgX68DmMzsW0Quauz8N2ko/1WdT/0YTr0ObwoylFi8M8wvcIKGURKfw4y2is=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiw4vB0eaGteITyivvVE3pEZYxf2dauZFdK8DNhh7Ihj201wIG
	NA+77GvSXswTCyrSBgo6QmBeUbOQ3Qr8Ezb8ThUr2NHzN8aUGg0345Shze1g4q0uTds=
X-Gm-Gg: AYBFou1VYSMpsEMEtcEVLL1JZjZDVvR5Wk7d65S2MFvisiM9c5ctFteOkYmwzXVUM7j
	og4gdTTqhdNthlNaMURA7yh/P4WpE5UjSrBiFk4bM3sOJX3Wa5kOh5jlmzuunr9JS/PVIGNjWol
	gMTYoXAEt51MrCvzglYwyNnl+BlqvNbD9NLh2qqyhPM1U2Fq+u9lQzWDrebMt5cuSiAVGxNP/RR
	yoyl9pYfKEkBpmmGzbyaZh8w488xPjWQ8Eum2d8z6CoxD8SIG3f2KEkZ2esvForasFftpyzCXC3
	HFOPgEJjosE7mcDUiCka+R2PsDUAZyHKkpCBnxOsinF0PdUZNou2m54m2JKlrfTlTAgcZT7sqVP
	rWvtceNSjY8HdjGlqTk1iQSgwT6jPROe8bVUsISqxgl8SjQF1N8dEhtITx8tPowgHYiZ2mK/P5W
	gvTzNG8Y/1xA8D4IQMeVcqBTpNRH9jQ7tI27jTG4EOOml8XEOqi0RwRfWAXBZpKLLSGBrNTUEhQ
	msQnckhtrql6CUky09GuP6Za01k3CV8bQtJa90SERTAjcM=
X-Received: by 2002:a05:7022:43a3:b0:14f:b5ac:ace4 with SMTP id a92af1059eb24-16a62ea9574mr9846984c88.44.1791662126977;
        Sat, 10 Oct 2026 12:55:26 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:88c:2ee5:394c:5592])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm20211705eec.3.2026.10.10.12.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:55:26 -0700 (PDT)
From: Abraham Zukor <abe@maticrobots.com>
To: Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>
Cc: Abraham Zukor <abe@maticrobots.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] spi: tegra114: initialize native chip selects inactive
Date: Sat, 10 Oct 2026 12:54:05 -0700
Message-ID: <20261010195503.623287-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_spi_probe() initializes SPI_COMMAND1 with only SPI_M_S, leaving
CS_POL_INACTIVE clear for every chip select. This drives every native
active-low chip select low until tegra_spi_setup() runs for that device.

SPI children are registered and probed one at a time. A synchronous
probe of an earlier child can therefore transfer while a later child's
chip select is still asserted. On a Tegra234 system with active-low
devices on CS0 and CS1, this caused both devices to be selected when the
CS1 device probed first. Its initialization then intermittently failed.
A logic analyzer showed CS0 remained low throughout the CS1 transfer and
went high only after the CS1 probe failed.

Walk the controller's device tree children before SPI_COMMAND1 is
written and set CS_POL_INACTIVE for each valid chip select without
spi-cs-high. That way the line is already deasserted when the first
child transfers and does not change level when setup runs.

Disabled children are walked too. The core only registers available
children, so tegra_spi_setup() never runs for a disabled one and probe
is the only chance to park its chip select at the level its hardware
needs.

If an enabled child shares a chip select with disabled ones, its
polarity takes priority. If only disabled children use a chip select
and they disagree, warn and leave the line inactive high.

Fixes: f333a331adfa ("spi/tegra114: add spi driver")
Assisted-by: Claude:Opus-5
Signed-off-by: Abraham Zukor <abe@maticrobots.com>
---
v4:
- Let an enabled child's polarity take priority over disabled children
  on the same chip select (Jon Hunter, Mark Brown).
- Warn when only disabled children use a chip select and they disagree
  on polarity.
- Link to v3: https://lore.kernel.org/all/20260826000517.631736-1-abe@maticrobots.com/

v3:
- Drop the cs-gpios check; programming an unused native chip select does
  not affect a device using a GPIO chip select.
- Split the compound condition into separate checks for readability.
- Retest on a Jetson Orin Nano with CS1 disabled. The old module left CS1
  asserted, while the patched module parked both chip selects inactive.

v2:
- Derive the inactive level per chip select from the device tree instead
  of setting the whole CS_POL_INACTIVE field, which is incorrect for an
  active-high or mixed-polarity bus.

 drivers/spi/spi-tegra114.c | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
index aa44ffd09..ebf568d0f 100644
--- a/drivers/spi/spi-tegra114.c
+++ b/drivers/spi/spi-tegra114.c
@@ -1301,6 +1301,9 @@ static int tegra_spi_probe(struct platform_device *pdev)
 	struct resource		*r;
 	int ret, spi_irq;
 	int bus_num;
+	u32 conflicting_cs;
+	u32 enabled_child_cs_polarity = 0, disabled_child_cs_low = 0, disabled_child_cs_high = 0;
+	u32 enabled_cs_mask = 0;
 
 	host = devm_spi_alloc_host(&pdev->dev, sizeof(*tspi));
 	if (!host) {
@@ -1395,6 +1398,52 @@ static int tegra_spi_probe(struct platform_device *pdev)
 	udelay(2);
 	reset_control_deassert(tspi->rst);
 	tspi->def_command1_reg  = SPI_M_S;
+
+	/*
+	 * SPI_COMMAND1 is written before any child is registered, so a chip
+	 * select with CS_POL_INACTIVE clear stays asserted until
+	 * tegra_spi_setup() runs for that device. Program the level the
+	 * device tree asks for up front instead.
+	 *
+	 * Disabled children are included deliberately. The core never
+	 * registers them, so this is the only chance to park their chip
+	 * select at the level their hardware needs. An enabled child on the
+	 * same CS takes priority.
+	 */
+	for_each_child_of_node_scoped(pdev->dev.of_node, np) {
+		u32 cs;
+		u32 polarity_bitmask;
+		u32 cs_polarity = 0;
+
+		if (of_property_read_u32(np, "reg", &cs))
+			continue;
+
+		if (cs >= MAX_CHIP_SELECT)
+			continue;
+
+		polarity_bitmask = SPI_CS_POL_INACTIVE(cs);
+		if (!of_property_read_bool(np, "spi-cs-high"))
+			cs_polarity = polarity_bitmask;
+
+		if (of_device_is_available(np)) {
+			enabled_cs_mask |= polarity_bitmask;
+			enabled_child_cs_polarity |= cs_polarity;
+		} else {
+			if (cs_polarity)
+				disabled_child_cs_low |= polarity_bitmask;
+			else
+				disabled_child_cs_high |= polarity_bitmask;
+		}
+	}
+	conflicting_cs = disabled_child_cs_low & disabled_child_cs_high & ~enabled_cs_mask;
+	for (u32 cs = 0; cs < MAX_CHIP_SELECT; cs++) {
+		if (SPI_CS_POL_INACTIVE(cs) & conflicting_cs)
+			dev_warn(&pdev->dev,
+				 "Conflicting CS polarity on disabled nodes at cs %u\n", cs);
+	}
+
+	tspi->def_command1_reg |= enabled_child_cs_polarity |
+		(disabled_child_cs_low & ~enabled_cs_mask);
 	tegra_spi_writel(tspi, tspi->def_command1_reg, SPI_COMMAND1);
 	tspi->spi_cs_timing1 = tegra_spi_readl(tspi, SPI_CS_TIMING1);
 	tspi->spi_cs_timing2 = tegra_spi_readl(tspi, SPI_CS_TIMING2);
-- 
2.52.0

