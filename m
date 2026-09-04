Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E55237A6;
	Fri,  4 Sep 2026 18:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545671; cv=none; b=V+QptS8YzP22PlT0TmIKYJU81/Z2Ix4u79qSlYaEISL0ju04NtWgMPajW9qwu15lmBej307Nc7Yayrf19eU88K0AUJ1yw4xB0qFbZaZKPLIdLNcxCM4N0XiyXOfS033FELg4mIBViXyruHvFCy+NPybqoTtgDK5FxlIeN2slwzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545671; c=relaxed/simple;
	bh=cCJhHuXkOjQp1Eqv6VprY7vuc10xchl2ZZlRu8bksOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8PhRu6CenugT83IdMgNvwGaL/KKBwuIvxlxP7sJyzh3BkL5rrmGm9Vnw1Sw34o7sR3SkKWGwOj7T7V673gGgYMmCPPFPuNtUELldy8YJ+nE1dWewrvETF++Vg2njcPpBgsu3T/Yv9EoQamZ0v3+TPaS0fna62t0jEvzkPjnzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CPUXp8RC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CPUXp8RC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF2CB1A19C3;
	Fri,  4 Sep 2026 18:14:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B313A6057F;
	Fri,  4 Sep 2026 18:14:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B7911C78158;
	Fri,  4 Sep 2026 20:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xJa2SIgs5+/YUcOMPI/QW/gbwXsr/EhtwgH6qw1Zg80=;
	b=CPUXp8RC5qfQo249zMudJN7keL5nvy8sE2OR/YfEjvXVC/RheoImipXihndzmzPSlxUzot
	BvjfPZJ8suY4I/fSromVo6MKYDmeCS3RMN7z4dgEVrMIJT2JTPfWMFe5E7nMUmiZOlz7lU
	neO1OiEEWrskuPSOCZoI01gY82O3yYWP/yDdoO5DXO8aetx3WshWiml3X0aabR8GlezrCw
	Qa87RnYFdPM2J54/oSn1CfscPErQpXYzUVOjTxz3viko8iynYkNtaBgKg3rKIWG7qGElFJ
	bHxopfqRmIBqQgzQXORj7gAj3K8u2SnaDdmj4oRt/4txrmgK8s4j9BajVW1xLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:13:02 +0200
Subject: [PATCH v5 25/25] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-25-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Expose Status Register opcodes based on the flash capabilities
discovered while parsing the SFDP QER field.

Value '0' indicates an absence of opcode (non supported), we do not
print anything in that case.

The QE bit is also displayed.

Example on a W25Q02JV-M:

$ grep opcodes -A10 /sys/kernel/debug/spi-nor/spi0.0/params
opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 SR1 read	0x05
 SR2 read	0x35
 SR1+SR2 write	0x01
 QE		SR2 bit 1
 8D extension	none

Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 5c738786145f..3f8d586a7622 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -104,6 +104,21 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_printf(s, "  dummy cycles\t%u\n", nor->read_dummy);
 	seq_printf(s, " erase\t\t0x%02x\n", nor->erase_opcode);
 	seq_printf(s, " program\t0x%02x\n", nor->program_opcode);
+	seq_printf(s, " SR1 read\t0x%02x\n", params->opcodes.read_sr1);
+	if (params->opcodes.read_sr2)
+		seq_printf(s, " SR2 read\t0x%02x\n", params->opcodes.read_sr2);
+	if (params->opcodes.write_sr1)
+		seq_printf(s, " SR1 write\t0x%02x\n", params->opcodes.write_sr1);
+	if (params->opcodes.write_sr2)
+		seq_printf(s, " SR2 write\t0x%02x\n", params->opcodes.write_sr2);
+	if (params->opcodes.write_sr1_and_sr2)
+		seq_printf(s, " SR1+SR2 write\t0x%02x\n",
+			   params->opcodes.write_sr1_and_sr2);
+
+	if (params->qe_mask[0] || params->qe_mask[1])
+		seq_printf(s, " QE\t\tSR%d bit %d\n",
+			   params->qe_mask[0] ? 1 : 2,
+			   ffs(params->qe_mask[0] | params->qe_mask[1]) - 1);
 
 	switch (params->cmd_ext_type) {
 	case SPI_NOR_EXT_NONE:

-- 
2.54.0

