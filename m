Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22B3AEF50
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270355; cv=none; b=oTuyVs1BUgzsWHwvp9Pf77qwuk6YGWLez7/bwJuQW0EmbuFH712Zld90TEjZv1zfLukNi7HQ5VmExPPyktbYZeKto6+W6Wr8GRRa5jHi7tye3ZIFN0Z1UD60rpEPoi7FnoEgaWIXBrHdKq7CLnV1GwNxuQ1JOHC0SBvAlm0KoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270355; c=relaxed/simple;
	bh=qgiyO6Oiz37QAwDooQPVcfkUhvSyEtAunUHz1++G1V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEpQ+REhGeSBAUXVop8AsIsbCUpJDnPxNvW8AZpVTGCNC6n5IWTJ1C655sqEwPA+aPOuLEHyi65LeW7JFtHY7AHgZUG6dXkx2JFUJi2qfmTKuK2VoQgjqQfHh7Sakj0ybWYN0+D4RRtFpOIZVCL2L7LurySqmhCeBo81ofhHZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=qF7y3FKn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jHkzSKMS; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="qF7y3FKn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jHkzSKMS"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id DDC53EC00C1;
	Tue,  1 Sep 2026 09:45:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 01 Sep 2026 09:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270352; x=
	1788356752; bh=ZtCkhLrhcvMxGOfdSJ5IQf+T2fdhFoHn9DVAVOReVf8=; b=q
	F7y3FKnr2Si1DXNZvq3oZRrNyJgrKPa8IHwBTov12vunVbZfjU6SD/0BmwEiYnOZ
	e8W+i+2uPduv5B+8bDlijibTyHfqxKk4r8eK6B7eAdXP/bCb5j7wnExGizlSh22Z
	T1oXrLFLZbsJYKu0OIdsHEYdqG+JZsCJR2rafeH7Fhph0bQynRtimYg1J7F0aswQ
	OrxTzmB4FdtyAljSr5lJK/gDosgjtSPX5H+YIEYzdEwRAkFvENjAuAC1O2+R/AxA
	8QPNWfq6daFflwZCnmSefvbZgmck8Nhid8tnb/woU1VwDiNuef0aiVqkjK1iBnEI
	yS6oM3CLGVupjCqHWPp3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270352; x=1788356752; bh=Z
	tCkhLrhcvMxGOfdSJ5IQf+T2fdhFoHn9DVAVOReVf8=; b=jHkzSKMSxn7me3Am4
	wm5i63YKdjFwe1H/RsinJWzHzJdkNWauuwPaeqPsBF5j4FA/ZSHm8zd1ga2mQycD
	gCamYk2BO0Caj1P94GYg1c+mWE8VJwIik51M96P6GKp+6fMKODwi82yA7EqEnizE
	QayF6yCpPpYIGr/z2KgUGTPc+P7kdqkCb444q0xtoJMMMZZ5uZtsZ5kfJaVQECXP
	qSstnqk3Z1/JenFo+kBazZc7Y39HJUVgCeXXazuNy9uQ5szymwOUWt67ZEGeOSkL
	0uO04ZTjxYZ3uZl9Cgb1Za0IzZQ/v8M5rRtK5sKhMW2OAjSCjIc+3yb9ZB+UgIn8
	y6b0Q==
X-ME-Sender: <xms:ENeWamWekdtLqlURHsDqFI56IL_l8fPaCD-_R6PUtAwy9v5569bAsA>
    <xme:ENeWagY9i8UmCS9PNNADYd4B3yxsuipyBC5swp3Sj-zRS_Os3UmM0gL6W7lI3M8vb
    iKtRGEibO4zY5w-uIvxKcqbOiAOqTh77T9wUCn5gszbrnnxFFaFUjk>
X-ME-Received: <xmr:ENeWak2V5VehBXQJoky8LPznVHx3GgV8gYSN-IQV-a2zfHhYQx-3CNyP6IlzCKUunjCTrIKZPredweOt-R-cXgvvOb_ktTCiimYQMDDc7Eo>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19MH
    Cq6WdTWfQvI0qmnJqZL6LzPZtqbsUvLsA/ydmdg2y+Qoyl0rpoq+tb5R04cdC1gVs2bIjm
    N4WBEEPtFYTHse8FBQ5jqG3WQLfl1yWRcsPsbuXnIuL7Ep2qEo7Mc9mK+bpYqsI6ADvkeM
    g/S9COuhgo0fs9b/LEVXCW8n5huJlgu2MI7GBGk/B/svQiDu2n1WK1ZCc+6YBjNREV1jIj
    d8otFozLfFgFikOsahflRMwcgLxTk5AUY+JlE96PvcxOavMnAFCTnjBDvm6nZGEQAaVeYD
    1fDpmRj9ewW1K6GsPIZtHAnuP+u5dsqYI0Po6Q9xSNhji8H9en5gJkKTfk6A
X-ME-Proxy: <xmx:ENeWaqgNdmhklRZNvAUrPfpesPqDWLjLJ8Ks8XrXyDMz6K4nBHudFQ>
    <xmx:ENeWagbUU1nftGLdViwYdM822KySLd0EK7_ykfPbPExd1naw-kcsmg>
    <xmx:ENeWaiSR4x1T8CF3WwUxNgxg7xa95IauQuxZkF4LcvHiu6ajwxTmpw>
    <xmx:ENeWajS3jdbNsDIUU9g5u5bu8uH4-w2du2J_4c3vq1w-JQbSOtiRAQ>
    <xmx:ENeWaqa2Ng6gSSiBYjnzeKfPpDWAlIYzNdIPefqKGuKgQZYtSxe3WTY1>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 09/13] firewire: core: add test to generate with IIDC unit in config ROM generator
Date: Tue,  1 Sep 2026 22:45:30 +0900
Message-ID: <20260901134534.2386577-10-o-takashi@sakamocchi.jp>
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

There is a standard layout of configuration ROM for IIDC devices.

Add a KUnit test to verify that the generator produces the expected
configuration ROM when an IIDC unit is registered.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 92 ++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index c695811a50bb..6ca5c16b4f0f 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -87,6 +87,81 @@ static const u32 config_rom_with_avc_unit[] = {
 	cpu_to_be32(0x50756900), // v
 };
 
+// Following to 1394-based Digital Camera Specification Version 1.04 (Aug. 1996. 1394 Trading
+// Association)
+#define IIDC_COMMAND_REGS_BASE	0x00
+#define IIDC_VENDOR_NAME_LEAF	0x01
+#define IIDC_MODEL_NAME_LEAF	0x02
+
+static const u32 iidc_unit_directories_and_leafs[] = {
+	0x00030000,
+	(CSR_SPECIFIER_ID << 24) | UNIT_SPEC_ID_1394TA,
+	(CSR_VERSION << 24) | UNIT_SW_VERSION_IIDC_0104,
+	((CSR_DIRECTORY | CSR_DEPENDENT_INFO) << 24) | 0x00000001,
+	0x00030000,
+	((CSR_OFFSET | IIDC_COMMAND_REGS_BASE) << 24) | 0x00012345,
+	((CSR_LEAF | IIDC_VENDOR_NAME_LEAF) << 24) | 0x00000002,
+	((CSR_LEAF | IIDC_MODEL_NAME_LEAF) << 24) | 0x00000008,
+	0x00060000,	// Text leaf consists of below 6 quads.
+	0x00000000,
+	0x00000000,
+	0x4c696e75,	// Use the same name in root directory.
+	0x78204669,
+	0x72657769,
+	0x72650000,
+	0x00040000,	// Text leaf consists of below 4 quads.
+	0x00000000,
+	0x00000000,
+	0x43686566,	// Chef Cat is a nick name when inventing IEEE 1394 itself.
+	0x20436174,
+};
+
+static const u32 config_rom_with_iidc_unit[] = {
+	cpu_to_be32(0x04046a3e), // bus info
+	cpu_to_be32(0x31333934), // |
+	cpu_to_be32(0xf000b243), // |
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
@@ -105,6 +180,12 @@ static const struct generator_test_case {
 		.expected = config_rom_with_avc_unit,
 		.quadlet_length = ARRAY_SIZE(config_rom_with_avc_unit),
 	},
+	{
+		.name = "with_iidc_unit",
+		.config_rom_generation = 2,
+		.expected = config_rom_with_iidc_unit,
+		.quadlet_length = ARRAY_SIZE(config_rom_with_iidc_unit),
+	},
 };
 
 // Define generator_test_gen_params.
@@ -123,6 +204,11 @@ static void test_config_rom_generator(struct kunit *test)
 		.key = (CSR_DIRECTORY | CSR_UNIT) << 24,
 		.data = avc_unit_directory_and_leaf,
 	};
+	struct fw_descriptor iidc_unit_entry = {
+		.length = ARRAY_SIZE(iidc_unit_directories_and_leafs),
+		.key = (CSR_DIRECTORY | CSR_UNIT) << 24,
+		.data = iidc_unit_directories_and_leafs,
+	};
 	const struct generator_test_case *test_case = test->param_value;
 	struct state_data *state = test->priv;
 	struct fw_card *card = &state->card;
@@ -136,6 +222,9 @@ static void test_config_rom_generator(struct kunit *test)
 	if (test_case->expected == config_rom_with_avc_unit)
 		KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&avc_unit_entry), 0);
 
+	if (test_case->expected == config_rom_with_iidc_unit)
+		KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&iidc_unit_entry), 0);
+
 	scoped_guard(mutex, &card_mutex) {
 		generate_config_rom(card, config_rom);
 		KUNIT_EXPECT_EQ(test, config_rom_length, test_case->quadlet_length);
@@ -144,6 +233,9 @@ static void test_config_rom_generator(struct kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, config_rom, test_case->expected,
 			   sizeof(*test_case->expected) * test_case->quadlet_length);
 
+	if (test_case->expected == config_rom_with_iidc_unit)
+		fw_core_remove_descriptor(&iidc_unit_entry);
+
 	if (test_case->expected == config_rom_with_avc_unit)
 		fw_core_remove_descriptor(&avc_unit_entry);
 }
-- 
2.53.0

