Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7603C4169;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719827; cv=none; b=KEWjBes7TNozSiDY1MVTzhR+9N04QqLd+CoHCdkGHM+yml6se3U/T1x5zPls9ezID/OLm87KzXahxCfm3QbqvX9afzXD/PiETHaZGGqOAya0ovTNZySLrdDEXJgf57SG4iQ6VTS5fD1wEmyK/fwmxEVLyvbMquHnrkrEIzNl+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719827; c=relaxed/simple;
	bh=pwxcwyZ177lrb/kV9/qF46wwbZfRgBA0AoGXpy/5Mqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ak42m+GgyqUbTQwA67qqH71tm6ZconI+Nmz3paGm5DMuwoAtQLZqRWn08r16GuRkseyNpS96Xsa4ZYKnUdjwg95BPRZOf5PIk65Hq9+bvHzN+3ZXCXzajqJc4/f7/DKu4dGNMm/CpIpX3QQzMY9oggaI8cMFPy3VQUg+GpYkjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPz1zIun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPz1zIun"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6642C2BD05;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=pwxcwyZ177lrb/kV9/qF46wwbZfRgBA0AoGXpy/5Mqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vPz1zIuntwS5hoVd71gGSkrJ/TMJ7gohuI/RjvZ/NOuaNjMrMb8cQbwVk2bzXdXjM
	 k9wyvkxndcmvK8LWoIf1eEU5/MAGxIRBd6edAjoVyy5dvDaNdSbR0hNgnDtwCnu1hR
	 Yat817X0DDeLAL99CWWkwEGw0rOPe7c8G7m6Nag9UadfedS4wlaxTxbZopqli1SmHj
	 4PvQwcpBfXIczrb0emksMCpfqorsrlO7J9/TkoFZJKGSyhKUJOno1ZAwz7CwCgvb1a
	 A5pmTR40U3ZGg8qAwkMwsFj9H46OF2Ls7RBhLM6OPWJTse+QBSm27HraL+ZAJ7+1nc
	 aMKxvjXCltStw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9220AC79FA0;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:30 +0200
Subject: [PATCH v2 07/22] thunderbolt: Try reading host DROM from device
 tree first
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=pwxcwyZ177lrb/kV9/qF46wwbZfRgBA0AoGXpy/5Mqg=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTfsEHy9bOu34xDspJQwv9E6sfu8go97PKMb4vNNrk
 prqD73tHaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJGO1iZLhulPaq3MLIdll0
 +l3DtxduCCQv+5zw6W5LmNm5wt079GYwMpzL8D79P+ZXUKnwu61M4Tqsi/90XZypEuyia7daylR
 jCjcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

On Apple Silicon SoCs the DROM is provided by a device tree property.
Try reading from that property first.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/thunderbolt/eeprom.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 2a13fa6888ba..69d5c5f70eaf 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -468,14 +468,15 @@ static void tb_switch_drom_free(struct tb_switch *sw)
 }
 
 /*
- * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
+ * tb_drom_copy_property() - Copy DROM from a device property if present
  */
-static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
+static int tb_drom_copy_property(struct tb_switch *sw, const char *name,
+				 u16 *size)
 {
 	struct device *dev = sw->tb->nhi->dev;
 	int len, res;
 
-	len = device_property_count_u8(dev, "ThunderboltDROM");
+	len = device_property_count_u8(dev, name);
 	if (len < 0 || len < sizeof(struct tb_drom_header))
 		return -EINVAL;
 
@@ -483,8 +484,7 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 	if (res)
 		return res;
 
-	res = device_property_read_u8_array(dev, "ThunderboltDROM", sw->drom,
-									len);
+	res = device_property_read_u8_array(dev, name, sw->drom, len);
 	if (res)
 		goto err;
 
@@ -500,6 +500,16 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 	return -EINVAL;
 }
 
+static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
+{
+	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
+}
+
+static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
+{
+	return tb_drom_copy_property(sw, "ThunderboltDROM", size);
+}
+
 static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
 {
 	u16 drom_offset;
@@ -675,6 +685,13 @@ static int tb_drom_host_read(struct tb_switch *sw)
 {
 	u16 size;
 
+	/*
+	 * Apple Silicon machines always get their host DROM from the Device Tree,
+	 * so make sure to try reading it first before any other method.
+	 */
+	if (!tb_drom_copy_of_apple(sw, &size))
+		return tb_drom_parse(sw, size);
+
 	if (tb_switch_is_usb4(sw)) {
 		usb4_switch_read_uid(sw, &sw->uid);
 		if (!usb4_copy_drom(sw, &size))

-- 
2.55.0


