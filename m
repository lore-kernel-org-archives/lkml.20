Received: from sender5-of-o55.zoho.com (sender5-of-o55.zoho.com [165.173.182.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294F236EAA8;
	Thu, 10 Sep 2026 02:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007691; cv=pass; b=l0xPSDxWpGPtX4zuv6PMmTMHBYWklLvjS3xfLvT1VU2MomxTrueA4sNuVC/ZJ8o9MtmqkeqcGFGOnNc5jBwHKytzHEJqOigIE69SjpZTB3XQjnGQUdSUmbAoLkQuJmYryEu0ukYc8Ze0S4ZDd+4RjyuGbC0UM63uEopGGq4J1+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007691; c=relaxed/simple;
	bh=HIDfhCm4KlL1ty4Hm2Kd5BNSxFcomVZE1N7Rvr8nrsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJlvAMHtY8anP8exatE9ROSnf90RJ5akarL92T/U02I3Zh0wMF4e9xEsqWibWxcvy4fwR/bA+mr0HbWW8MyPNts7+qEB43xiiD1zEBF2NRU47ihHmvXgl2YEbpC7vTOYh+vmDbD2mJ2lDqLq2SLtZvGzIk0DmTEeW+lWHRS5Yus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danielcorp.dev; spf=pass smtp.mailfrom=danielcorp.dev; dkim=fail (0-bit key) header.d=danielcorp.dev header.i=pannarat.wiriyaarritham@danielcorp.dev header.b=ef6stuoa reason="key not found in DNS"; arc=pass smtp.client-ip=165.173.182.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danielcorp.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danielcorp.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=danielcorp.dev header.i=pannarat.wiriyaarritham@danielcorp.dev header.b="ef6stuoa"
ARC-Seal: i=1; a=rsa-sha256; t=1789007671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U635g/5231wUghXLJ9cKCHl4lOT5nZYKS9AuTbGkKVPEjWJ0mxbB0yUXirMtx9gr8RPsAGaGi2bSMtZ5vuNJGYc4RrK3fKVC4esLz5AKg3l269cRg5+E7vT/evGbdF1pQ64/ptWBwxYD852hyRMJ0/PNL3rYtwQsW6QjjHLw12o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789007671; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ez5d6pFbQzYLbC1ii0UN/gq5VMqT+8gix8WSkpB3ClI=; 
	b=VAvYlzvfAQapRgfyMgdjq/0Lqt6v18BuKktMYJetbcMdhkriKUX7unOKrufjBEkEyFT3sFNIHYOavvpMQtGPF0YEYkvSlBX1kMMZXdAlqMfmf76eXAHM91K9gM1E1uvmE7XbqC2dPWdearGXxPA5ZoGCZ1/5NVNxfXnv1FTesB4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=danielcorp.dev;
	spf=pass  smtp.mailfrom=pannarat.wiriyaarritham@danielcorp.dev;
	dmarc=pass header.from=<pannarat.wiriyaarritham@danielcorp.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789007671;
	s=zmail; d=danielcorp.dev;
	i=pannarat.wiriyaarritham@danielcorp.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ez5d6pFbQzYLbC1ii0UN/gq5VMqT+8gix8WSkpB3ClI=;
	b=ef6stuoawgq60knQ2JbqDzDDNP0tJ1mY5eCBEXqB+0CzlMwHigVDntCVL0CcTYLu
	+e3CddnDxWwMP27AaJzRlMIjcTGPA9n4caaUgutN3a55QDHQ+7zmrvDsUojZxEwqk5B
	q66guvLIAEa1Wk4NynhU3I8e0bwv2itpqtWpg6wg=
Received: by smtp.zohomail.com with SMTPS id 1789007669402987.1871699340053;
	Wed, 9 Sep 2026 19:34:29 -0700 (PDT)
From: Pannarat Wiriyaarritham <pannarat.wiriyaarritham@danielcorp.dev>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pannarat Wiriyaarritham <pannarat.wiriyaarritham@danielcorp.dev>
Subject: [PATCH] usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41
Date: Thu, 10 Sep 2026 09:33:37 +0700
Message-ID: <20260910023338.31816-1-pannarat.wiriyaarritham@danielcorp.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Acer Nitro ANV15-41 exposes a functional UCSI ACPI PPM but
reports a UCSI VERSION value of zero.

ucsi_register() rejects a zero version with -ENODEV, leaving the
system without registered USB Type-C connectors.

The PPM works correctly when using the UCSI 1.2 layout. With UCSI
1.2 assumed, both Type-C connectors register correctly and USB Power
Delivery negotiation works.

Add a DMI-specific UCSI operation for the Acer Nitro ANV15-41 that
substitutes UCSI 1.2 only when firmware reports a zero version.
Preserve any valid non-zero firmware version.

Tested on an Acer Nitro ANV15-41 with BIOS V1.51.

Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Pannarat Wiriyaarritham <pannarat.wiriyaarritham@danielcorp.dev>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9..5697ccc24 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -121,6 +121,33 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
+static int ucsi_acer_read_version(struct ucsi *ucsi, u16 *version)
+{
+	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = ucsi_acpi_read_version(ucsi, version);
+	if (ret)
+		return ret;
+
+	if (!*version) {
+		dev_warn(ua->dev, "UCSI version is zero, assuming 1.2\n");
+		*version = UCSI_VERSION_1_2;
+	}
+
+	return 0;
+}
+
+static const struct ucsi_operations ucsi_acer_ops = {
+	.read_version = ucsi_acer_read_version,
+	.read_cci = ucsi_acpi_read_cci,
+	.poll_cci = ucsi_acpi_poll_cci,
+	.read_message_in = ucsi_acpi_read_message_in,
+	.write_message_out = ucsi_acpi_write_message_out,
+	.sync_control = ucsi_sync_control_common,
+	.async_control = ucsi_acpi_async_control
+};
+
 static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 				  void *val, size_t len, void *msg_out,
 				  size_t msg_out_size)
@@ -162,6 +189,13 @@ static const struct ucsi_operations ucsi_gram_ops = {
 };
 
 static const struct dmi_system_id ucsi_acpi_quirks[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
+		},
+		.driver_data = (void *)&ucsi_acer_ops,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
-- 
2.55.0

