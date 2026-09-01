Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8C73B9DAB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270357; cv=none; b=KbWIO+NbwBFGOPNK3w5wfqEVa9n9jnmIPjifqabXUA6ho8B93aeiN8kstILx4984mvRqvp+oUw7berd9cM68adge6o4kaioYjbBDlkJYR8AnxitwQGvkuHdpIxraWRtTLpReBd/8S0bq8jDyXVl6szMZrcM6gFSKnbu81Hn4R/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270357; c=relaxed/simple;
	bh=DCh9JZBJCtXXPBu0v4ebMln/jxXGau8osWVZJniwXUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIkAtlwVFcIQemVnjZdwjqrramJYHbYa4U5CHcZNNDj/PQQvOfuqZVTVPZ8YbrpN+4FNHyYuseQ20+pnAk5EK1oLMzchM6PyPKZy0hVy1yeHFSytFkp5BgFG8apWVnHXmWE6TbrwyqSukqNdLi23WlHVmrIePudgxRtLH7VX8jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ck4TJfHA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=idp+8CY2; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ck4TJfHA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="idp+8CY2"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 683DDEC011F;
	Tue,  1 Sep 2026 09:45:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 01 Sep 2026 09:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270354; x=
	1788356754; bh=h6V02rYyGQ8IATTwuJsoBnvhP7/OR7wgUI3SO299PIY=; b=c
	k4TJfHAk6JI4gLlJBJvS12dokPY1KDZHgAQR1RUx5bMZFNc7RCcaGV9rcFN9LawR
	BcXnyPl/ySo7tLKamJSad6GlIKUxauOzdiFIUbkShLU6RQLJ7aLMK12uRVF0ZFm6
	7XNa8Jlu8eoJ36uYsOJMWhtFoKBHkCTRNrZlGsonfOfqJS+OpYmKaR/7ZZ8z49bO
	U+QEIb77/x2CwGThz8sU1JWcW65/dsUGtnpsgiDRrYuQPsZeq6fOUh5qa4AC52Nf
	OxgQVn5CCAQLvBhYxTOwecDFA6VUvyXnXzA5w8BvrsV/gILhsI+424hFwxy7lkUA
	Y9wwRs0ZBgD/tNuU6h0Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270354; x=1788356754; bh=h
	6V02rYyGQ8IATTwuJsoBnvhP7/OR7wgUI3SO299PIY=; b=idp+8CY2NXuZ+LU7C
	FMmkqA3iXW61Na1/N8RLKaG4MS3uGTyKu+G4qn73e5znLkCZnEyU1KehddGyOWln
	zeIo6vluaWLGwMdL4ufWc0p/HCqW0UhXxIFUwXCVDRysPtqbrxWJl2F+eXsY3KqU
	q4XSP9NDQXMA2bBqFLd6zddXlEU5881w1hPr09CGRo/Bc6DW55qlXl20Fneos/YK
	IIFDtace6rwQZdpgfCDRrZWhsYv/H1llREND+TCxxs6Z+9IePK0lf8PwqjTX33LX
	lVQSjYZM0BqdirZSgEDQhf6fcfR6ENkwQEMYss7kfiqrMGcHXn/DOyFDUOTQKc6l
	jraMw==
X-ME-Sender: <xms:EteWaopx5t0C7MZumD-H5tV9BXmSCcrGt3_5qAiXF3A_m4YOQZA4Ow>
    <xme:EteWasdheLWv6X517zmuhHD7R1DvGST5IEQ2eLUHBKYvy8eQo-PCnztcrGaW8nxVP
    MSrpMWwBjquzlzx92A4tM-nYuWsujoxYGaFQmc0eKEmUnSB67sOKw9a>
X-ME-Received: <xmr:EteWanqhz86XRPGBPFLsiKTPODVyVs1xgkrQiYmrcWxGNS6C31Q0xttB3ySViangYr2WVEAEKSRHs-5YhZFCAiRQ-09L7Y1XXewNrv-dRRM>
X-ME-Proxy-Cause: dmFkZTFREBd8oipOne+whwDSMInIixSeI1lCerfHK3L4pOWL9djsbhxQ7B5sFcMPFC5ZHA
    MH3VvkrRHMa+iQQcOqPxGnC2IQB9D4JAe/3AuK6tpWR4HiWaEkwDxUpMyHYHygDA3Xsa7z
    dC7C0+FP7eobx+zdZ2fLBWL2c9uouHcGbMZUsAXCwMf3uBDxHXV7xmoI0Av4z39bFhb2B8
    YcfxD8xc6QTRsePpNGxtpnkCfZc7Htd0IhA8vCGr6kTiSDRJR7oERY3rZMKJZA/+6wVpa6
    Z1u1B5dF5XZ+J25H3NG+Ru4gEcIfhwPmzy/W/Pn8uVcz3UV6PD8S5w/Rz98MJxrXVdwZLa
    M31YyvG8yA+70av8a0cJnnPm6Is7s6esxrSElfalXZtsUCmWd471GgxqDhi7IaZ7R69f0G
    f27zcqijKzpctY+ggj3f5eueM7s2iodQhW2diWFNVoEFbMVOXLyDmlj+LLVx7euwHEIhaf
    tJVq2SfVLCL/Iv1ypcSZEWMXmWv96JefkhUUbS8DgFOyvM3QPQtj8OrgONYqUR4CnfkcER
    05WX+FsfOi6s/dxrdo/fS2TlO+tO3LM+NJT+Tl6ic+xSBfZ83jJJBgt9FhMqUpTMdtClwJ
    EXB0uUXPdxda1KMfLD1OlXJqibuU+nJEilBjq1ZUru72VitprYth3pWEXYrg
X-ME-Proxy: <xmx:EteWatGqiZAVtQi7wmwXmNyI86HXIphnHDd1Z-HC0Dr3SwBiG5TDFA>
    <xmx:EteWanuUrHgriGhxtjCPMKf60ZpSIn23krlxr2gik5KG3ATFO-k1-w>
    <xmx:EteWavWgchXRMG5wKz4GZlUdqhvelQjmIERuYEmxeLypV7NoFG4ONg>
    <xmx:EteWajE5WZmvg3dp1J_ouADkzyOq9m57jNGHQvcuyuL13qZXYaEFUg>
    <xmx:EteWarvNgSqOcy4-Q0VGVSn3SyD6nfoAIHIYSUvq8qEOTngeHA8YQeQ9>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 10/13] firewire: core: add test to generate with both AV/C and IIDC units in config ROM generator
Date: Tue,  1 Sep 2026 22:45:31 +0900
Message-ID: <20260901134534.2386577-11-o-takashi@sakamocchi.jp>
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

Add a KUnit test to verify that the generator produces the expected
configuration ROM when both AV/C and IIDC units are registered.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 74 ++++++++++++++++++--
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 6ca5c16b4f0f..7d76580c2004 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -162,6 +162,62 @@ static const u32 config_rom_with_iidc_unit[] = {
 	cpu_to_be32(0x20436174), // v
 };
 
+static const u32 config_rom_with_avc_and_iidc_units[] = {
+	cpu_to_be32(0x040439c0), // bus info
+	cpu_to_be32(0x31333934), // |
+	cpu_to_be32(0xf000b253), // |
+	cpu_to_be32(0x01234567), // |
+	cpu_to_be32(0x89abcdef), // v
+	cpu_to_be32(0x0007073e), // root directory
+	cpu_to_be32(0x0c0083c0), // |
+	cpu_to_be32(0x03001f11), // |
+	cpu_to_be32(0x81000005), // |
+	cpu_to_be32(0x17023901), // |
+	cpu_to_be32(0x8100000a), // |
+	cpu_to_be32(0xd100000d), // |
+	cpu_to_be32(0xd1000015), // v
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
+	cpu_to_be32(0x0003d7fe), // unit directory (from root)
+	cpu_to_be32(0x1200a02d), // |
+	cpu_to_be32(0x13000100), // |
+	cpu_to_be32(0xd4000001), // v
+	cpu_to_be32(0x0003ea57), // dependent directory (from unit directory)
+	cpu_to_be32(0x40012345), // |
+	cpu_to_be32(0x81000002), // |
+	cpu_to_be32(0x82000008), // v
+	cpu_to_be32(0x00064cb7), // text descriptor leaf (from dependent directory)
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x4c696e75), // |
+	cpu_to_be32(0x78204669), // |
+	cpu_to_be32(0x72657769), // |
+	cpu_to_be32(0x72650000), // v
+	cpu_to_be32(0x0004a3e9), // text descriptor leaf (from dependent directory)
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x00000000), // |
+	cpu_to_be32(0x43686566), // |
+	cpu_to_be32(0x20436174), // v
+};
+
 static const struct generator_test_case {
 	const char *const name;
 	int config_rom_generation;
@@ -186,6 +242,12 @@ static const struct generator_test_case {
 		.expected = config_rom_with_iidc_unit,
 		.quadlet_length = ARRAY_SIZE(config_rom_with_iidc_unit),
 	},
+	{
+		.name = "with_avc_and_iidc_unit",
+		.config_rom_generation = 3,
+		.expected = config_rom_with_avc_and_iidc_units,
+		.quadlet_length = ARRAY_SIZE(config_rom_with_avc_and_iidc_units),
+	},
 };
 
 // Define generator_test_gen_params.
@@ -219,10 +281,12 @@ static void test_config_rom_generator(struct kunit *test)
 	card->max_receive = 11;
 	card->guid = 0x0123456789abcdefULL;
 
-	if (test_case->expected == config_rom_with_avc_unit)
+	if (test_case->expected == config_rom_with_avc_unit ||
+	    test_case->expected == config_rom_with_avc_and_iidc_units)
 		KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&avc_unit_entry), 0);
 
-	if (test_case->expected == config_rom_with_iidc_unit)
+	if (test_case->expected == config_rom_with_iidc_unit ||
+	    test_case->expected == config_rom_with_avc_and_iidc_units)
 		KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&iidc_unit_entry), 0);
 
 	scoped_guard(mutex, &card_mutex) {
@@ -233,10 +297,12 @@ static void test_config_rom_generator(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, config_rom, test_case->expected,
 			   sizeof(*test_case->expected) * test_case->quadlet_length);
 
-	if (test_case->expected == config_rom_with_iidc_unit)
+	if (test_case->expected == config_rom_with_iidc_unit ||
+	    test_case->expected == config_rom_with_avc_and_iidc_units)
 		fw_core_remove_descriptor(&iidc_unit_entry);
 
-	if (test_case->expected == config_rom_with_avc_unit)
+	if (test_case->expected == config_rom_with_avc_unit ||
+	    test_case->expected == config_rom_with_avc_and_iidc_units)
 		fw_core_remove_descriptor(&avc_unit_entry);
 }
 
-- 
2.53.0

