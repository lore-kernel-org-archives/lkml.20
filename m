Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D4A37BE6A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270352; cv=none; b=id4ri87yZ5lyztN7tnVvIyGEjPbt7ucm7K0k5ymv/S3qkKT1c9JbyTPd4aWhlxcqD5EiRRw6B/jVGericV9zR/DPlafNoIZv7ZJatkNw/wEAVDOqJybnmdjPP1npLV/gDz62RK78t2jlyDbpZwxACcs1UpkJy8Cmu46cRBKUts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270352; c=relaxed/simple;
	bh=wd3uFJ8NzgQMQ2i57BFHNeacPpDMNKeXlTWdcuMfztQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGu7eylPUnLLZD4tmBSnEjSAMVLXkAmktONaE9QDhj3Sa0VoLHhXo9T0JG0L6Kaxd9Km4Qv/KA5KW6eemIYB2r7YKL6ccGLoCv0RpUT0fw2pedMBU9Wh9+lNE8rKlNWb1TXoo5zn2TZYPpyBW9SfxhTFjuXTmsD/m/714Qp1JY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=WB+wJtEo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l7IEc8eN; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="WB+wJtEo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l7IEc8eN"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BEC761400098;
	Tue,  1 Sep 2026 09:45:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 01 Sep 2026 09:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270349; x=
	1788356749; bh=Svm4BpzWCz2Fy5rzhCxWWTqjFOb9ftxZSo00fuBLR8E=; b=W
	B+wJtEogEb7xMf9e00Atkhe7DVnkYr+Em3G0nFDILzl9/7uEUOERcFocoGX1XKyc
	VL+c8UJ8ol1GK7DSRdZc5u5ZQeEmvec0duQCrdrNeIz9yMitAdCJp84Qjb87sCwr
	PiPbDiLxT3snb/emmro8qnEgt0baDdsd4lbQzLnOxXmGNBDZIuZ55gm2756plgje
	sYVS3uO2N66NCozjQKgPplSter0GMqk79hLKCgquhnlZ3RODIgE0QRDXkuf3ykGR
	b2E1XVAyiRYibDR1Jb0jSjtGnc/7gciCjiPj/tkkykxX/apLIieF8yAUj9Q73xfx
	cpxVz64mOQhITdcLbxg6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270349; x=1788356749; bh=S
	vm4BpzWCz2Fy5rzhCxWWTqjFOb9ftxZSo00fuBLR8E=; b=l7IEc8eN+ZQ2kiYK5
	YFitrqlw2OKojK5pOAAuaP4OWwf2ZLHtpMZ4UTLTAw8M5qZij+pp62tkzKwU6UtM
	Y83EnFO35tnbtns0mwtrs1E0KKm4CqyalsVKazvnyDwbzq1yMzlZzYSpbSeY911T
	pIPDNktvyWcu1uKLHdfePH4HI4Zz9OhyijZmu2Nr0xUk254k5hJJdj3s6oxedc/V
	S5gBVGgI23ysPhC015r68XDgbE+zLGbCAHtupGjSe3yGeBY2Sjb45hWp25AbwVda
	J2oD0RDmMxxfd+yTxOZSsUZOmM12YLHT19M7eQgo/3XRCwFrlBeXgDyUi2sTYiM6
	WIxVw==
X-ME-Sender: <xms:DdeWaqC1z2YaiiOI-FsCbx2Fn2l-5Ccuodrf5-WVvZCjZaCYWSmp4g>
    <xme:DdeWaiUjPmw425sPib4ZWA41AoHld1AIoV-lDpYzm7NR3WT3qDmn9kFL8zlYMqt4r
    PrFLS0JMR5qyyRuFE_wS0ZpaSZNUJGblcR0HRZBA2i8ZIbn074P601L>
X-ME-Received: <xmr:DdeWaoBqZRPnfUjOzNYeCpm53rKhKV_4ctbF2iWRf1MBedbQIwx3aMQXOntEfIk-w9UY-7hEBITc5jWNexaEMYDi4MR0gzUJVhD31ZaaIfU>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19d1
    Da13ImrcWTaPDKUFPTbolTb/MptQJZ/Bwop64YqNTl+Nt2WjLzcXbbglGuPI6fZkx8OeIW
    7RdtBZ2vxkYHscPazksden0klhEf8/GyKuc6YuuXrWJfzi+cwx1qp9hhfzFUxTy8Zo7low
    527VenQ4ylCjBcl5h+8w7Dt2pzv8X00netfEtXPoF8INKGUEYWF3U3YQjGOcYXIq11jWsH
    0pJIE5VMmdCw+9ahKJc/Za2IXv/+IXmwxRWfJQfoBivU8xM2cb0LGrqzBpknzeBNuFSh6/
    o1TxQ3FdXSIFxoXSLVpkMYOH7hQIyyqEQdl9HCV/XGRNzR7RTs0hm0IXvOSg
X-ME-Proxy: <xmx:DdeWal-mc9yFP7FwkuJCYBZWuULG0PEZAZNT0WROeh-aPL9PPGFXVQ>
    <xmx:DdeWavFDNg5ssYnABlV4-lx4PiKXO44VlC0kVe0CF0wz-cJTI205Iw>
    <xmx:DdeWajNafokYKFjWZ_ly0uL31WYZsjHGenUM9RAkeF8b9tjX_zmlJw>
    <xmx:DdeWapfM7BMcT138XKkpYrt9ptT-t86w-88l2CzYJJzhLa7ZmpF_Eg>
    <xmx:DdeWavHbG2wlAPDuWH5Sg7_fg0bDHWTiFMJeYWNl5QIYa5p48Rg9EnVZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 07/13] firewire: core: add test for root directory generation in config ROM generator
Date: Tue,  1 Sep 2026 22:45:28 +0900
Message-ID: <20260901134534.2386577-8-o-takashi@sakamocchi.jp>
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

The core function allows both the unit drivers and the userspace
applications to extend the system configuration ROM. Without any
extensions, the generator produces a root directory accompanied by two
descriptor leaves.

Add a KUnit test to verify the configuration ROM generated in this case.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 100 +++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 9a901eef7b0a..02477300c1df 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -7,13 +7,113 @@
 // This file can not be built independently since it is intentionally included in core-card.c.
 
 #include <kunit/test.h>
+#include <kunit/device.h>
+
+static const u32 config_rom_bare[] = {
+	cpu_to_be32(0x0404921b), // bus info
+	cpu_to_be32(0x31333934), // |
+	cpu_to_be32(0xf000b223), // |
+	cpu_to_be32(0x01234567), // |
+	cpu_to_be32(0x89abcdef), // v
+	cpu_to_be32(0x00051b70), // root directory
+	cpu_to_be32(0x0c0083c0), // |
+	cpu_to_be32(0x03001f11), // |
+	cpu_to_be32(0x81000003), // |
+	cpu_to_be32(0x17023901), // |
+	cpu_to_be32(0x81000008), // v
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
+	cpu_to_be32(0x4a756a75), // v Juju is a code name at the development time of this stack.
+};
+
+static const struct generator_test_case {
+	const char *const name;
+	int config_rom_generation;
+	const __be32 *const expected;
+	unsigned int quadlet_length;
+} generator_test_cases[] = {
+	{
+		.name = "bare",
+		.config_rom_generation = 0,
+		.expected = config_rom_bare,
+		.quadlet_length = ARRAY_SIZE(config_rom_bare),
+	},
+};
+
+// Define generator_test_gen_params.
+KUNIT_ARRAY_PARAM_DESC(generator_test, generator_test_cases, name);
+
+struct state_data {
+	struct fw_card card;
+	__be32 config_rom[(CSR_CONFIG_ROM_END - CSR_CONFIG_ROM) / sizeof(__be32)];
+};
+
+static void test_config_rom_generator(struct kunit *test)
+{
+	const struct generator_test_case *test_case = test->param_value;
+	struct state_data *state = test->priv;
+	struct fw_card *card = &state->card;
+	__be32 *config_rom = state->config_rom;
+
+	card->config_rom_generation = test_case->config_rom_generation;
+	card->link_speed = SCODE_800;
+	card->max_receive = 11;
+	card->guid = 0x0123456789abcdefULL;
+
+	scoped_guard(mutex, &card_mutex) {
+		generate_config_rom(card, config_rom);
+		KUNIT_EXPECT_EQ(test, config_rom_length, test_case->quadlet_length);
+	}
+
+	KUNIT_EXPECT_MEMEQ(test, config_rom, test_case->expected,
+			   sizeof(*test_case->expected) * test_case->quadlet_length);
+}
+
+static const struct fw_card_driver dummy_card_driver;
+
+static int config_rom_generator_test_init(struct kunit *test)
+{
+	struct state_data *state = kunit_kzalloc(test, sizeof(*state), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_NULL(test, state);
+
+	struct device *dev = kunit_device_register(test, "dummy-device");
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	fw_card_initialize(&state->card, &dummy_card_driver, dev);
+
+	test->priv = state;
+
+	return 0;
+}
+
+static void config_rom_generator_test_exit(struct kunit *test)
+{
+	struct state_data *state = test->priv;
+
+	kunit_device_unregister(test, state->card.device);
+	kunit_kfree(test, state);
+}
+
 
 static struct kunit_case config_rom_generator_test_cases[] = {
+	KUNIT_CASE_PARAM(test_config_rom_generator, generator_test_gen_params),
 	{}
 };
 
 static struct kunit_suite config_rom_generator_test_suite = {
 	.name = "firewire-config-rom-generator",
+	.init = config_rom_generator_test_init,
+	.exit = config_rom_generator_test_exit,
 	.test_cases = config_rom_generator_test_cases,
 };
 kunit_test_suite(config_rom_generator_test_suite);
-- 
2.53.0

