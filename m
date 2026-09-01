Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CAF355803
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270350; cv=none; b=XC/3+9VosR/fMIQ5VEc4e7+w8+vx2s3VjULtmAoKocBlVhvvAgJSuHuRT66aqFbMZ4tvpTtPpHnKLSwa/zVcXQgr2DcO8igQ4DAGLvqEi2jp0M2CVIsBNM1p42AD9PYOQYVAe1luizI2rnfK56akJLKUpWaiZ+CjSDmPrYbW/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270350; c=relaxed/simple;
	bh=S6hQwRkRGloM8ZnTv56PXXEdBxCDz+4KTVdwKZPnzYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNP243D+TZRcEWPWqtjCguoK/EjRjJyLxqgXnFOacaDLDwDbhlkCE/TjwBEF60/B3YrIs+DPgmTMBNYcpSv8ycmq0IRhOpbV8dwk6J7d6u+Le53qgWKrgwu6TcZqylZ9E3JfhCLc0yidXl/e27qm/7inZWZ/yvY3g0ZQU8+a1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=LFUXcJYn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YM7DjI3l; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="LFUXcJYn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YM7DjI3l"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 32861EC00C8;
	Tue,  1 Sep 2026 09:45:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 01 Sep 2026 09:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270348; x=
	1788356748; bh=bd8h4FHmaELkBHWvIQd6yHzmcJO30UfhAWwkfBUCuF8=; b=L
	FUXcJYnYsRMUul/sm2Xa7n6UjSHBqdhbctPkuq+gO1GzadgZbnuq/xLvCHUqJC5+
	LgZLVpMFugZ1Grw9yUtugNYjPhrTz9mu5FNGTXGjJA885n+ZmnjZhrxNbeLbLPLX
	gXZzCkXz55FZ+BTLinCssaOmO8E3XYg7G0cVV8Tk7hrPMzeVsHw5cHLnrC/J4hvP
	faKLSDZZAeGjrmzRslOFaZdSCDA+uH+fT5JNv3A/b/v+bZsH+A7GwFAPbvp2ArHz
	u+qPlucCLQ6bvWVf0mGLgZD0LVgGZGWIQ+z2DQHU6BkzllxPvi4uHHO5hlJQmfpC
	K9wfpVKOqEOuez0mkTN3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270348; x=1788356748; bh=b
	d8h4FHmaELkBHWvIQd6yHzmcJO30UfhAWwkfBUCuF8=; b=YM7DjI3l2+siaQH6q
	uIitsbTHpUBTPvuFOgxelnrM/iGlb3XXwUfjCLbpNNFTvRgSW/NiWp7EHwr2p2aJ
	37UbTyGKeD56HO5Cg15YwcJPbY3Wm7ilotzStIJPKga8XDQetAFIXF4L4TyYeVa6
	AMDBX0XcfvJ3M+Sn+Nup4W6UHxrIJhN8AhzljouZAQYoGpebraE++K9HftVNTFRl
	hDDCuf5t15Zz+d7XuOrpCZ/4jDs9ob7K6G0oz76itRugL1cToAiiTW6lDqpSFTVV
	iB0GW5KkWEQapMqVaZ4hw+7QoBG3xQZqQmv+9aAP3ZESCGDnwKKVc83tz4tQ2Uvs
	vMRsw==
X-ME-Sender: <xms:DNeWalDtUd2WQMF_r227ebPSiI-S4KhZNHr6sR7rXp2K20IxtpF4KA>
    <xme:DNeWahX599XRecV-PwBR70lNJtKi4zF9Hgm7sUkVun6B8XemW75xvivoRQ3VSgAbf
    lGkmX8GYHHO9KQwwnDPwOSZx6SXdC1xzJ0aB69XLUNUiskf25crhGg>
X-ME-Received: <xmr:DNeWarAh-2ZmSyyoBczddfmqO_lTaq0AlpffGQafkTD4tsSSEM2vFhqlmLZvhLe9AOQ9uftOfDawHCFFg-6mh_7trfIqEAcV82aeLWHTV0g>
X-ME-Proxy-Cause: dmFkZTEWdYH4dU+NQdTDhk9Zyzve1QFfC5NIhqKaEiG5+seWXcecosUXsnkY37p1mUpvde
    w9SlMwb4c3jDtKGytm1bIFR8Z1OxJIfMkthf0E3aR8zR24v/lQsWm7D9MwgP/fPLR+2uYe
    Dd3oChgzJfe0FMgMpUbT8SHEtTLBDrlTipebB9/xh3gTLWxp7SzwpqquiGnWJQGNbis+Jy
    NL2xLpELn0ZshX5UJcJoiK2+WXnLRUAHqsmiEa7T6/2Hgnqyv9SFQG/mW3HXRVk4Hli5m3
    4WwSeLZzxL1A2RZPMINWZGlDPQkfI+tgq/vbW1bGugNfSvAQ3FK/YfkNHGzM/RogcgX9LB
    bUmykdxCun1A/AJZuLZcVvxIgD02TrziUlnuQBwwN34C+oS4haBmTyRKYTTW+VuhtJ6sUM
    0CiVKv9krJCas/p1SaRZKusKABvO2OGG3eR2cgrigB4NSBAGJsxl+a6Py6hDJyCZSb0QKA
    FuH5NuZaZiM4BTz51XJPQuqyN8H3dDIkuF4Naz8NioSP84ZvcrOa96yAdAHEEr1x5bjXDH
    inUTYgrCFPXq9VRWciGDmTKfHfGGGSlDUC+CJHVw8u7RKvo89scC2cqMUogAR769r7Rlme
    7C9EUyQGM2xF47reVKhM8JxC9GJC1ekDgHaqQURzuReG/wQqVpe35J1dBiEQ
X-ME-Proxy: <xmx:DNeWas_FB3Yqg_-F6gu-7TJ8GCJOlCs-4sxCDSKDDhmVUWKZBp_Rrg>
    <xmx:DNeWaqFGxqFm8sPtu_U4yCAdyThACUUabg4hUWi4wVF17xtmyT9Rwg>
    <xmx:DNeWaiOfedrGBp8pMGhjis7JxiJw296EoJOB-L6P85nv8Rer9qcIxw>
    <xmx:DNeWasfGGPwWNcjKA4PwI-llJ1M8IEsdEplJOmfTw-lutAVFdVUIqA>
    <xmx:DNeWaqG0l0XA4LH_r9eOJFzo2LoX8KIJbmOUQzCq2pQWN5Ah9AnIxuYc>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 06/13] firewire: core: add test to avoid excessive configuration ROM length
Date: Tue,  1 Sep 2026 22:45:27 +0900
Message-ID: <20260901134534.2386577-7-o-takashi@sakamocchi.jp>
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

The configuration ROM parser needs to handle malformed ROM contents
safely. In particular, malformed directory and leaf offsets and block
lengths should not result in accesses beyond the available configuration
ROM data.

Add a KUnit test with malformed configuration ROM content to verify that
the parser sanitizes entries that would cause accesses beyond the
available configuration ROM data.

Reported-by: Aleksandr Shabelnikov <mistermidi@gmail.com>
Link: https://lore.kernel.org/lkml/20250901171547.47065-1-mistermidi@gmail.com/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-parser-test.c | 68 ++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
index d7c58c7fb995..e5c173353057 100644
--- a/drivers/firewire/config-rom-parser-test.c
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -193,7 +193,7 @@ static const struct parser_test_case {
 // Define parser_test_gen_params.
 KUNIT_ARRAY_PARAM_DESC(parser_test, parser_test_cases, name);
 
-static int stub_run_regular_transaction(struct fw_card *card, int tcode, int destination_id,
+static int stub_run_transaction_regular(struct fw_card *card, int tcode, int destination_id,
 					int generation, int speed, unsigned long long offset,
 					void *payload, size_t length)
 {
@@ -221,7 +221,7 @@ static void test_parser_with_regular_cases(struct kunit *test)
 	struct fw_device *device = test->priv;
 	const struct parser_test_case *param = test->param_value;
 
-	kunit_activate_static_stub(test, fw_run_transaction, stub_run_regular_transaction);
+	kunit_activate_static_stub(test, fw_run_transaction, stub_run_transaction_regular);
 
 	device->card->link_speed = SCODE_BETA;
 	device->node->max_speed = param->phy_speed_in_self_id;
@@ -240,6 +240,69 @@ static void test_parser_with_regular_cases(struct kunit *test)
 	kunit_deactivate_static_stub(test, fw_run_transaction);
 }
 
+static int stub_run_transaction_malformed(struct fw_card *card, int tcode, int destination_id,
+					  int generation, int speed, unsigned long long offset,
+					  void *payload, size_t length)
+{
+	static const u32 config_rom_first_part[] = {
+		0x04000000,
+		0x31333934,
+		0x00008002,
+		0x00000000,
+		0x00000000,
+		0x00030000,
+		(CSR_VENDOR << 24) | 0x00123456,	// Regular entry.
+		((CSR_LEAF | CSR_DESCRIPTOR) << 24) | 0x000000f9,	// Beyond the upper limit.
+		((CSR_DIRECTORY | CSR_UNIT) << 24) | 0x00000001,
+		0xffff0000,	// Over the upper limit.
+	};
+	struct kunit *test = kunit_get_current_test();
+
+	KUNIT_ASSERT_GE(test, offset, CSR_REGISTER_BASE | CSR_CONFIG_ROM);
+	KUNIT_ASSERT_LT(test, offset, CSR_REGISTER_BASE | CSR_CONFIG_ROM_END);
+	KUNIT_ASSERT_NOT_NULL(test, payload);
+	KUNIT_ASSERT_EQ(test, length, 4);
+
+	unsigned int index = (offset - (CSR_REGISTER_BASE | CSR_CONFIG_ROM)) / sizeof(u32);
+	u32 *quadlet = payload;
+
+	if (index < ARRAY_SIZE(config_rom_first_part))
+		*quadlet = cpu_to_be32(config_rom_first_part[index]);
+	else
+		*quadlet = 0;
+
+	return RCODE_COMPLETE;
+}
+
+static void test_parser_with_overflowed_case(struct kunit *test)
+{
+	static const u32 corrected_config_rom[] = {
+		0x04000000,
+		0x31333934,
+		0x00008002,
+		0x00000000,
+		0x00000000,
+		0x00030000,
+		0x03123456,
+		0x00000000,	// Sanitized.
+		0xd1000001,
+		0x00000000,	// Sanitized.
+	};
+	struct fw_device *device = test->priv;
+
+	kunit_activate_static_stub(test, fw_run_transaction, stub_run_transaction_malformed);
+
+	device->card->link_speed = SCODE_BETA;
+
+	KUNIT_EXPECT_EQ(test, read_config_rom(device, 0), RCODE_COMPLETE);
+
+	KUNIT_EXPECT_EQ(test, device->config_rom_length, ARRAY_SIZE(corrected_config_rom));
+	KUNIT_EXPECT_MEMEQ(test, device->config_rom, corrected_config_rom,
+			   sizeof(corrected_config_rom));
+
+	kunit_deactivate_static_stub(test, fw_run_transaction);
+}
+
 static const struct fw_card_driver dummy_card_driver;
 
 static int config_rom_parser_test_init(struct kunit *test)
@@ -279,6 +342,7 @@ static void config_rom_parser_test_exit(struct kunit *test)
 
 static struct kunit_case config_rom_parser_test_cases[] = {
 	KUNIT_CASE_PARAM(test_parser_with_regular_cases, parser_test_gen_params),
+	KUNIT_CASE(test_parser_with_overflowed_case),
 	{}
 };
 
-- 
2.53.0

