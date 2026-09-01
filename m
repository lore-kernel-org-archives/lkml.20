Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D403911BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270353; cv=none; b=eEVrjyiVSQb/qtWTuYm4dsZQVEN3iYZNe4Yv2WbACu1MJI/7RIA6LkAB6n1PmONNmHOyaRjWDCD9k7em5Ufjmh/dUfQ0KgImxPXDTtnqfQDHSSOFd96Cu7jFqrof0i4HpQpHfGJd30OIQqWzRcRBNd2cuZoFl3y/NMija1y3IOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270353; c=relaxed/simple;
	bh=IYCoSwMOmLXMgcXg2bBVNLjbBCAdWNhoshIzeZ+YYRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkcGfkh2+t/rrfjLGphJSVoARAccbld/NiWAinQIzhIcb24WnIncG9jcWTEEwRwUe37YYtmv9/mehb2/7Zp+Acpw7fj6iYMsV481h9dNA0hS+uid92Th5WopTrCuto5VFK3UFAvswesJ340MfwtxJkqRoPmvzmjKj1mEe8wxXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ZAXTCkZQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TH5PY+5m; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ZAXTCkZQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TH5PY+5m"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 3BACDEC00AD;
	Tue,  1 Sep 2026 09:45:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 01 Sep 2026 09:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270351; x=
	1788356751; bh=SdbpUaxoCdI4VAT0vfU1WWlRpcDnzoWgrqRzDpLgcTQ=; b=Z
	AXTCkZQkf25o1FTiSAtlenIC6xsooJBNKmgUb9P+xrSb+w9Wm9hjrmfFRmyg/kCO
	v25XdUharUFsiu5fm/E5taWobsPnR00ecUnYJPVPgBNV7Fv4WcC4ajuRPWPFdMQd
	SaauKTqnrgWlDv54+LjJjhiX4/vMeG34pN7AoMTZUkxiX0szEdfEt4QYv2v/kdBA
	fbTuiFMvu0kuziyHiuVPd2nThzMxNitmtFtKC1mHUt+lEqsw7lBy7anLdxcsWd1K
	U0sleEwHabbBmm7aoSEq+YO8daNwRQ13h28C9xQaROk1H8sPFX2EPGbO4WSgARV+
	Ai3Eggt7soAdR+eE/t/FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270351; x=1788356751; bh=S
	dbpUaxoCdI4VAT0vfU1WWlRpcDnzoWgrqRzDpLgcTQ=; b=TH5PY+5m7YwJ+/WBr
	PjkEkgXReyYKVlsDmcCIaS/1WTisSUbqBlPE9ghzKfGByg18eb80e4TyrIkM0WE8
	vtJ42skOAPLbNal7ufSwWjcUGIzh2LK7km6tEtSXaIpxsG1+vHRI3QM8o280Fmn4
	fIKV6A6Gd65xAG7w0r0RskZGHPDuU1V8zDsmD6e2l3rbsHvKTgD58YaEhj7c4kwk
	AC4Ns3kKIyV4Gar1FF34KB0fX71TrjhA7KfAGYn2BBfyebfh2IJ/FdLe5llj9IeH
	LnD76hmglVNpwaurxGmmtcDP4HCefGIeLfDc3PrYDeBj0IlfpRXXFv5F4udIsms6
	Gn7Gg==
X-ME-Sender: <xms:D9eWaqW9CMYe2QYBojZWyXBTReiy3bYB_WY_h4zXvUzcg_z7sfdngw>
    <xme:D9eWakYLV--s8Eo9wUKRGe-evrqLHKcYE89h1ddnJnbYZOoWNGKOhqhx3auXSL0XB
    gyWtt6K8qL9RfNEdBasxSoE9bMO8EarRD0NykiASRIUFA-VLnzxNLF0>
X-ME-Received: <xmr:D9eWao3m-eFAgNKZnwrLDhEVuKVd3Hy6UaD5O-QzS0WI9jHGsMCza4dx4hWhrTenVXJDsWNYqBDvcrhCjVwSrVmGcSZq4DwnRcRx7ss15Fs>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19Je
    85qEZBDcFufg01uFJkOrTspc32cvoLBo1efmL4sBGA0i5X3zuxDEHnZYzeDL2IfcuOieuf
    nQhIJRzC9sqW9v7kOTD7tXEul3am5JcX4uz5eskFtrC1Z+DxthupboQlPRyhEAabCfGTRm
    PfrzQFJa1jrhuIQ7x8m2EUr9CzWpMYYIOKl+zszhY+vwQ85ocgO9k91vcZAlonRG1xfIZk
    tLW06oniPYfCLamw78+Xr6z/+iYjWZ0HXRScuRj0usAhNYUNJejnK9+1WPJoYJ4Y9MSmTe
    XwuERM6h97/zU76jGZVba9T4dsqo5CsNH2JLetgAAJNMsxJ5I6UE08qIGMYg
X-ME-Proxy: <xmx:D9eWauglHNvBFP1Zs9YMIjSocW9MX3wiNZQK3ubNzeHR3h0_o1rlPw>
    <xmx:D9eWakan1T44O3NgjCd9WzpgM2c-O4HdNNjvsoIITUdczmbzstUDzQ>
    <xmx:D9eWamQD9riQoqzg_4eqZptp5q--KMuyPNWaFsrQ0NEHmFoMaPhnoQ>
    <xmx:D9eWanTcDUOF1Mvr96bT-EY3QwD0wAXAOA---zM8_mI1YDBUXkR5Vw>
    <xmx:D9eWaubx9E7ppma9itT5kzO-pgPYYNia-6DnP7BSAh5j0akfR9zIhcWf>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 08/13] firewire: core: add test to generate with AV/C unit in config ROM generator
Date: Tue,  1 Sep 2026 22:45:29 +0900
Message-ID: <20260901134534.2386577-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901134534.2386577-1-o-takashi@sakamocchi.jp>
References: <20260901134534.2386577-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a standard layout of configuration ROM for AV/C devices.

Add a KUnit test to verify that the generator produces the expected
configuration ROM when an AV/C unit is registered.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 71 ++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 02477300c1df..c695811a50bb 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -34,6 +34,59 @@ static const u32 config_rom_bare[] = {
 	cpu_to_be32(0x4a756a75), // v Juju is a code name at the development time of this stack.
 };
 
+// Following to Configuration ROM for AV/C Devices 1.0 (Dec. 2000. 1394 Trading Association,
+// Document 1999027).
+#define UNIT_SPEC_ID_1394TA		0x0000a02d
+#define UNIT_SW_VERSION_AVC		0x00010001
+#define UNIT_SW_VERSION_IIDC_0104	0x00000100
+
+static const u32 avc_unit_directory_and_leaf[] = {
+	0x00040000,		// Unit directory consists of below 4 quads.
+	(CSR_SPECIFIER_ID << 24) | UNIT_SPEC_ID_1394TA,
+	(CSR_VERSION << 24) | UNIT_SW_VERSION_AVC,
+	(CSR_MODEL << 24) | 0x00260827,	// Today.
+	((CSR_LEAF | CSR_DESCRIPTOR) << 24) | 0x00000001, // Point to next quadlet.
+	0x00030000,	// Text leaf consists of below 3 quads.
+	0x00000000,
+	0x00000000,
+	0x50756900,	// Pui is the name of a cat that the author takes care of.
+};
+
+static const u32 config_rom_with_avc_unit[] = {
+	cpu_to_be32(0x0404c1e5), // bus info
+	cpu_to_be32(0x31333934), // |
+	cpu_to_be32(0xf000b233), // |
+	cpu_to_be32(0x01234567), // |
+	cpu_to_be32(0x89abcdef), // v
+	cpu_to_be32(0x0006a2d2), // root directory
+	cpu_to_be32(0x0c0083c0), // |
+	cpu_to_be32(0x03001f11), // |
+	cpu_to_be32(0x81000004), // |
+	cpu_to_be32(0x17023901), // |
+	cpu_to_be32(0x81000009), // |
+	cpu_to_be32(0xd100000c), // v
+	cpu_to_be32(0x00064cb7), // text descriptor leaf (from root)
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x4c696e75), // |
+	cpu_to_be32(0x78204669), // |
+	cpu_to_be32(0x72657769), // |
+	cpu_to_be32(0x72650000), // v
+	cpu_to_be32(0x0003ff1c), // text descriptor leaf (from root)
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x4a756a75), // v
+	cpu_to_be32(0x0004227b), // unit directory (from root)
+	cpu_to_be32(0x1200a02d), // |
+	cpu_to_be32(0x13010001), // |
+	cpu_to_be32(0x17260827), // |
+	cpu_to_be32(0x81000001), // v
+	cpu_to_be32(0x0003f771), // text descriptor leaf (from unit)
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x50756900), // v
+};
+
 static const struct generator_test_case {
 	const char *const name;
 	int config_rom_generation;
@@ -46,6 +99,12 @@ static const struct generator_test_case {
 		.expected = config_rom_bare,
 		.quadlet_length = ARRAY_SIZE(config_rom_bare),
 	},
+	{
+		.name = "with_avc_unit",
+		.config_rom_generation = 1,
+		.expected = config_rom_with_avc_unit,
+		.quadlet_length = ARRAY_SIZE(config_rom_with_avc_unit),
+	},
 };
 
 // Define generator_test_gen_params.
@@ -58,6 +117,12 @@ struct state_data {
 
 static void test_config_rom_generator(struct kunit *test)
 {
+	// Use kernel stack since they should be mutable for doubly linked-list.
+	struct fw_descriptor avc_unit_entry = {
+		.length = ARRAY_SIZE(avc_unit_directory_and_leaf),
+		.key = (CSR_DIRECTORY | CSR_UNIT) << 24,
+		.data = avc_unit_directory_and_leaf,
+	};
 	const struct generator_test_case *test_case = test->param_value;
 	struct state_data *state = test->priv;
 	struct fw_card *card = &state->card;
@@ -68,6 +133,9 @@ static void test_config_rom_generator(struct kunit *test)
 	card->max_receive = 11;
 	card->guid = 0x0123456789abcdefULL;
 
+	if (test_case->expected == config_rom_with_avc_unit)
+		KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&avc_unit_entry), 0);
+
 	scoped_guard(mutex, &card_mutex) {
 		generate_config_rom(card, config_rom);
 		KUNIT_EXPECT_EQ(test, config_rom_length, test_case->quadlet_length);
@@ -75,6 +143,9 @@ static void test_config_rom_generator(struct kunit *test)
 
 	KUNIT_EXPECT_MEMEQ(test, config_rom, test_case->expected,
 			   sizeof(*test_case->expected) * test_case->quadlet_length);
+
+	if (test_case->expected == config_rom_with_avc_unit)
+		fw_core_remove_descriptor(&avc_unit_entry);
 }
 
 static const struct fw_card_driver dummy_card_driver;
-- 
2.53.0

