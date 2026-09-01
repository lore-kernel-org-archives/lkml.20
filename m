Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6B2F87B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270344; cv=none; b=dyFxQa4m12irHGr3Ya0/UENxEwY/coshFvB1oaJiMoB/+CE72S2LYbBb7xdKvwmQM5lYAp12xflGxIWtY3DFZ82baO+kUYacJRd5Z0bZ1QXsp0Xk9Iu+g8viQPwO/m5T0nA5XuVHTysZ3/jWybcVsmejQ1ngLkj7hHUoqUGOMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270344; c=relaxed/simple;
	bh=+vm7s0egTqqb64G9GlvYTBJeev+KKZiGr2/t6huP8IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYHkdhrSmESpW+RlE1rTMm+QIfZRpMuBFup1BNonUDAI/bY2fTlObDJHKvOX1g4C0DXgHYFcCFo98ICA9G26VJ/fjKMRsrX9aV0yIfDBmiENFHfsY3R6/aXl3HgxbtoewjykCzG2JdOPNKDzUXAfh9qZClpqZ9nrYPClfcH5OJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=KUZXdsOx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A/XugAq1; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="KUZXdsOx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A/XugAq1"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EF4E81400128;
	Tue,  1 Sep 2026 09:45:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 01 Sep 2026 09:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270341; x=
	1788356741; bh=ADdpa4P660nW5EGXtQlYjGkMWvI5Ga+2XkstTrGI+n4=; b=K
	UZXdsOx0QvsTCUjNaJ5P0Px+sctNr2nF5ThqLhwXExLXlIzVDMkG3jjKjbg8Myxd
	Yg4UCzV6NPcNPi6woHE2XjnKw9rcv6rQK+fwxQ6jzw1OxJSSME9UwVQIKJojIU1c
	f9s5ZBJwOMlkr2ppQMl6iql2Ac1dpAP7Vjenk23LBUliBvejQDRVBZ4RYq3ouFU0
	w2+R3tA4r2XZErwacYRYUsztCO4Me+u2CUJx3Y7Fnxd0z2cFh8TRKtTjp05NQdFO
	hGxJk5lYybbAlFaxsouggvMZZbIWignjXtmbux3cO/pHGznVggcQDlLXUAe6Kf0A
	pv7/v/TidbOhhyIFs7HuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270341; x=1788356741; bh=A
	Ddpa4P660nW5EGXtQlYjGkMWvI5Ga+2XkstTrGI+n4=; b=A/XugAq1VDBVDhZjk
	06cWt57Dx/Gh3U9g3MMyZGqLLtr15lLArwSkX+0s8bCSvFYloCQyYaV6l6SzTSdZ
	+A+NbEy4xpwD9HAejVM6hSUHZxzKX5kT4S3kd0dXw6TYs6m+SqeLdODFtvWiN9WO
	64YL1bzy2ZZIJ9YGgu+7mJYsbiKFch3EdtUQQhDVOt4IFO7z85hmgbdqi0SUEfos
	okzTCmcG0plIL5krPhzj+jJiFMkVd546Qz6fU4cW0hYdfM+uceHBP3CDsuFbCkGD
	fxBOWi6ivN3jGhXUpoG5CAXQ2E+vMH7axQg85A2a4J/5sadA4qn5bseEe7oeVn0l
	2uwSQ==
X-ME-Sender: <xms:BdeWarF3RGzOQ655ZUrZjcE_JNt_CjwhGlGi18ILzNDZdr1d_ThnRA>
    <xme:BdeWamIK_Eow26hBQeucXlsZMrOt6qBmKUwXIrPBzj2fVIADw31nI8Ip3gFesq7Qo
    BbnE_Ij-HBfbh3KCtm260cZIrB6SPJ2S_hv9oic97D4kwFPgw5LTJkg>
X-ME-Received: <xmr:BdeWanmtPZqKfUnKnOrFA_18ZYq8BOhlLEoRT0hgFniwwiTvvfYJzACLA6Jpy7PRq8NlYxeTj66vMVCBLD3E3zMiOGkx7dNWjy_ZsU2OeRw>
X-ME-Proxy-Cause: dmFkZTFd20KhNkN+3L5LiLZttK1v9olpqJHdGSiQ5OEvQEzQTpqkbdCa1gFpOy5kosexA+
    oBnU+A0NgYLJUUCWl/KhkFcDVq//IFRxbDRLvKAgz0hO+62jToZvj3pbRIh7nMxh1Sd3u+
    ADhjawZuZu2sJOODqYOp3Fp/6UcSMCdfX79mH+4KAWY4wuX5gSyngUIstRvqP70LTdaTNw
    142uQ5Tf7OiEQiDFOnAzQ1dr0TnVke38lMeEB6PzIbyOA2OtPJCTnajwUbC4LypA1F4hH+
    GeU3fV8WaYU/7vXIlwqw0pWxg3eBnyxKOjbhQT+UGTUptGTL3GwY5JX3zfRaqZJbkJZeGV
    sA6QkViWELpyuYNRS/4sTEhJWiyzoIY0oCj3Zl8RsZV+G0rFT6HgURkz34R2LtB5IVm8Gq
    zwqoHntBBvScRi1edARmeDg1NnrKraXPFPS810ckwitkUSC7lLPc6FJyuiVp7KZMQyacpv
    FOSH6u4Ksri+NKHEOgwkW2mXeLb7hkarFcLRYdxCydc3FJiBsuSSiqZgZQ3tdy5FPulMtF
    clcwB4F9bYb72z2rLNGn8X9gUjE71tZsVd02Fko1Vwb83xxYLKZY5OfkjS/WwOxiv4z6yR
    ZSpSnIaRkNuKcW6luBjalJXkOqmwyjLcFPdSahADsRxdBoswaoGBEhPl7Zcw
X-ME-Proxy: <xmx:BdeWamTgPz4aE4h7DNEfb4UPO1JqaK9ONB0S1aa6kZU7KmN_aVi6ig>
    <xmx:BdeWahJ25wBhgLPtuMQqSsNEzXbVUFjRnRdlWpVmErrxG0UBYY8CSw>
    <xmx:BdeWakBYZub_qJiQ8DjPKvIObK2fHLuwVJrqCUWaIK6XSJRtmkLOBw>
    <xmx:BdeWaiCm74oyefufSbww4y8SVpT2pUSTNmzCYFKQIrT5mbVZjR9TXg>
    <xmx:BdeWajJ6cBU4Y5XnqKjQ16FG58P2dDEqmNIh0EbUr40Eemhmz2rUaHzu>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 02/13] firewire: core: add test to detect irm-is-1394-1995-only quirk in config ROM parser
Date: Tue,  1 Sep 2026 22:45:23 +0900
Message-ID: <20260901134534.2386577-3-o-takashi@sakamocchi.jp>
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

Some Sony DV cameras have a quirk where their IRM functionality does not
comply with IEEE 1394a:2000. This quirk was supported by commit
10389536742c ("firewire: core: check for 1394a compliant IRM, fix
inaccessibility of Sony camcorder") and refactored by commit 5a43dc9f4ee0
("firewire: core: detect device quirk when reading configuration ROM").

Add a KUnit test to check detection of the quirk. The configuration ROM
content is retrieved from the following discussion:
https://github.com/systemd/systemd/issues/25029.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-parser-test.c | 151 ++++++++++++++++++++++
 drivers/firewire/core-transaction.c       |   4 +
 2 files changed, 155 insertions(+)

diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
index 632f24e68692..131c7aa3b224 100644
--- a/drivers/firewire/config-rom-parser-test.c
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -7,13 +7,164 @@
 // This file can not be built independently since it is intentionally included in core-device.c.
 
 #include <kunit/test.h>
+#include <kunit/static_stub.h>
+#include <kunit/device.h>
+
+static const u32 sony_dcr_trv310k_config_rom[] = {
+	0x0404e552,
+	0x31333934,
+	0xe0648100,
+	0x00008500,
+	0x005eb597,
+	0x0007cdd0,
+	0x03000085,
+	0x8100000d,
+	0x17000002,
+	0x81000010,
+	0x0c0083c0,
+	0xd8000002,
+	0xd1000003,
+	0x0001ce96,
+	0xd1000001,
+	0x0004bbee,
+	0x1200a02d,
+	0x13010001,
+	0x17000002,
+	0x81000006,
+	0x00046dc8,
+	0x00000000,
+	0x00000000,
+	0x43616e6f,
+	0x6e000000,
+	0x000621ee,
+	0x00000000,
+	0x00000000,
+	0x4d563569,
+	0x204d4300,
+	0x00000000,
+	0x00000000,
+};
+
+static const struct parser_test_case {
+	const char *name;
+	const u32 *quadlets;
+	size_t quadlet_length;
+	int phy_speed_in_self_id;
+	int expected_speed;
+	int expected_quirk;
+	unsigned int expected_max_rec;
+	bool expected_cmc;
+	bool expected_irmc;
+} parser_test_cases[] = {
+	{
+		.name = "detect_irm_is_1394_1995_only_quirk",
+		.quadlets = sony_dcr_trv310k_config_rom,
+		.quadlet_length = ARRAY_SIZE(sony_dcr_trv310k_config_rom),
+		.phy_speed_in_self_id = SCODE_100,
+		.expected_speed = SCODE_100,
+		.expected_quirk = FW_DEVICE_QUIRK_IRM_IS_1394_1995_ONLY,
+		.expected_max_rec = 8,
+		.expected_cmc = true,
+		.expected_irmc = true,
+	},
+};
+
+// Define parser_test_gen_params.
+KUNIT_ARRAY_PARAM_DESC(parser_test, parser_test_cases, name);
+
+static int stub_run_regular_transaction(struct fw_card *card, int tcode, int destination_id,
+					int generation, int speed, unsigned long long offset,
+					void *payload, size_t length)
+{
+	struct kunit *test = kunit_get_current_test();
+	const struct parser_test_case *param = test->param_value;
+
+	KUNIT_ASSERT_GE(test, offset, CSR_REGISTER_BASE | CSR_CONFIG_ROM);
+	KUNIT_ASSERT_LT(test, offset, CSR_REGISTER_BASE | CSR_CONFIG_ROM_END);
+	KUNIT_ASSERT_NOT_NULL(test, payload);
+	KUNIT_ASSERT_EQ(test, length, 4);
+
+	unsigned int index = (offset - (CSR_REGISTER_BASE | CSR_CONFIG_ROM)) / sizeof(u32);
+	u32 *quadlet = payload;
+
+	KUNIT_EXPECT_LE(test, speed, param->expected_speed);
+	KUNIT_EXPECT_LT(test, index, param->quadlet_length);
+
+	*quadlet = cpu_to_be32(param->quadlets[index]);
+
+	return RCODE_COMPLETE;
+}
+
+static void test_parser_with_regular_cases(struct kunit *test)
+{
+	struct fw_device *device = test->priv;
+	const struct parser_test_case *param = test->param_value;
+
+	kunit_activate_static_stub(test, fw_run_transaction, stub_run_regular_transaction);
+
+	device->card->link_speed = SCODE_BETA;
+	device->node->max_speed = param->phy_speed_in_self_id;
+
+	KUNIT_EXPECT_EQ(test, read_config_rom(device, 0), RCODE_COMPLETE);
+
+	KUNIT_EXPECT_EQ(test, device->config_rom_length, param->quadlet_length);
+	KUNIT_EXPECT_MEMEQ(test, device->config_rom, param->quadlets, param->quadlet_length);
+
+	KUNIT_EXPECT_TRUE(test, device->quirks & param->expected_quirk);
+	KUNIT_EXPECT_EQ(test, device->max_speed, param->expected_speed);
+	KUNIT_EXPECT_EQ(test, (unsigned int)device->max_rec, param->expected_max_rec);
+	KUNIT_EXPECT_EQ(test, (bool)device->cmc, param->expected_cmc);
+	KUNIT_EXPECT_EQ(test, (bool)device->irmc, param->expected_irmc);
+
+	kunit_deactivate_static_stub(test, fw_run_transaction);
+}
+
+static const struct fw_card_driver dummy_card_driver;
+
+static int config_rom_parser_test_init(struct kunit *test)
+{
+	struct fw_device *device;
+	struct device *dev;
+
+	device = kunit_kzalloc(test, sizeof(*device), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, device);
+
+	device->node = kunit_kzalloc(test, sizeof(*device->node), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, device->node);
+	kref_init(&device->node->kref);
+
+	device->card = kunit_kzalloc(test, sizeof(*device->card), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, device->card);
+
+	dev = kunit_device_register(test, "dummy-device");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	fw_card_initialize(device->card, &dummy_card_driver, dev);
+
+	test->priv = device;
+
+	return 0;
+}
+
+static void config_rom_parser_test_exit(struct kunit *test)
+{
+	struct fw_device *device = test->priv;
+
+	kunit_device_unregister(test, device->card->device);
+	kunit_kfree(test, device->card);
+	kunit_kfree(test, device->node);
+	kunit_kfree(test, device);
+}
 
 static struct kunit_case config_rom_parser_test_cases[] = {
+	KUNIT_CASE_PARAM(test_parser_with_regular_cases, parser_test_gen_params),
 	{}
 };
 
 static struct kunit_suite config_rom_parser_test_suite = {
 	.name = "firewire-config-rom-parser",
+	.init = config_rom_parser_test_init,
+	.exit = config_rom_parser_test_exit,
 	.test_cases = config_rom_parser_test_cases,
 };
 kunit_test_suite(config_rom_parser_test_suite);
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 22ae387ae03c..995c2001bee0 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -24,6 +24,7 @@
 #include <linux/timer.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include <kunit/static_stub.h>
 
 #include <asm/byteorder.h>
 
@@ -481,6 +482,9 @@ int fw_run_transaction(struct fw_card *card, int tcode, int destination_id,
 		       int generation, int speed, unsigned long long offset,
 		       void *payload, size_t length)
 {
+	KUNIT_STATIC_STUB_REDIRECT(fw_run_transaction, card, tcode, destination_id, generation,
+				   speed, offset, payload, length);
+
 	struct transaction_callback_data d;
 	struct fw_transaction t;
 
-- 
2.53.0

