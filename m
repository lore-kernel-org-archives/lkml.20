Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0B46AA8E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270360; cv=none; b=icblOSzzx7HN5X6idGr9rPa5nj2IrbymO+JozsRwG9RZhDnXijk714pUSjrxEygx3xgHAQKcD5E6hCdTU319e8Uf7Dr59VLHpK/IRcxcxea3Yn7AvCkJC1JZTtaJZtp3u6kXCgJcJo44VJOYa1myV2zmOQ8CvbI+B+4/Qp94bUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270360; c=relaxed/simple;
	bh=WMrLdh3pEugaDEFtPD+jMQ1zhTWROqbby6esXqgw500=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhwENHkuhhoS+2QpQctAGYQ0YAvnvXtVxHmmdZIVcMlTPXKHLb1QwRDBKg+q2vv4SOUT/CJ/hgFY293FafD99c+2S4DnuiGzrRMxy5J6a5k1vekXHhlclIS8GlzkwaYSvW+QSzc8BxupxlOKa3ZRb+AnG/7OtCfRgezL3yvItGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=fsd5i+lk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bCB3f3j0; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="fsd5i+lk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bCB3f3j0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6B49FEC00BD;
	Tue,  1 Sep 2026 09:45:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 01 Sep 2026 09:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270357; x=
	1788356757; bh=vW9ZVLj93rAbqSELauULXZEinKxoH8huQpiry8QRwmA=; b=f
	sd5i+lkO8HqTsM3ymvkGM/JrYjwy5r8t6ZOHKZ0T0XdhbwAba8vQwnIwsi8l7ylp
	DIFSQys7iJT3EdbSe2AKa92yG2nXIBQIP6SRad+X9DA/py7mQ1/Yszt8g5zX2onF
	bu2PQUOh/fReuZIObPuRlff7ftcMmNoKvGrlUupzeY7bU993kCaZGzEBN7HbSrSC
	3CoX6oJzyweVZUCErSSSGAQcRa47U2DnTfr4aSEQ1I5INpuyRfiQZ8omKaOaOh/i
	s/iXfH3R9hdzqEmjKWKeNRNIZJ7yGMOCUS5Kl+zOgdQeR167s+0z8DWbCr807o3t
	sVZy07YNXz0pev7jJGBcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270357; x=1788356757; bh=v
	W9ZVLj93rAbqSELauULXZEinKxoH8huQpiry8QRwmA=; b=bCB3f3j0UAqfToyjS
	n2S9WQ/0esKKLsVMH4XOp4rZ4j2WdO9vlkxo3wXCEwvHObWtAjqMYc8oilzGZIIc
	Qhz+2g7NEHomC+Ew7KVw3vbtOz0RfD+LFqdgwt8lQtcfaeh7+SJJEyziSNYIqxGz
	C3MRFcDD9rUzCb+LxeL2UewUC4+sdvmaSFpkimM0bAeIMCAOYjjArUWSnxzSXfE3
	cOIKHt7S1Snkw5uMyUPgs+6VSJYB2Z+Yoie3bsDq1IO32BTMDn1XxaS/SmJdyotl
	m4Otz2UzS+piNSuS7OTUkpbLdjU/q3yFwsTy1hsTq3hvjf+q3e44tQEpZEJeGdv6
	ylQNg==
X-ME-Sender: <xms:FdeWamSb5WlHnrtQw5EU9s5JSCMYUtIBSwy5szrmPxL5VU6cHh5JXg>
    <xme:FdeWapkPrzGcIMBwfGDKko3QVVcpMpyluF3nDOhFITCqzw1VHoZ5fMSz65vFGLgGD
    HRGCZ85t0mo2Oar_QHvuNO-3gfeGnv4NWEKYUVJpidgcqz1OOUzoKU>
X-ME-Received: <xmr:FdeWauRP2ivNYhvuQl3hvr9oWD3rkntYbv9h1X_uyigg0QqUWQeipuApbOZDiAMGYrzS4eaipCLHp7tGWqppxYJpnSM0CRpRcoAEYLsqYdA>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19rx
    dCDzTuykijYG0sirrhPceyy5uszDiB/34Jmk64TFzPQkBMHct6JyHQ5SppXUebI3FOI/aM
    flmsZ6UeFpecvJpyN14ZU56tStyqvVkaJ2C0iDdTETJT0fio2JeJlyGNyzTtIUO0BavEiQ
    kFWUf3I//h0ocxsy89V9xm3Rn4rR86JmsTSq+QIwXBBLJK7iCwMbwRz6ih0mvGRi2f+x4g
    gWOlvP2i5OSAI/sQE8gp5IBOv/eC77RzqV2hIZGuqysMgm8Yzj9A2stubaGn1nEk96dVQe
    LDkbzTtxRyXn9bXvp6dd7yCduMyBi+Sq5F44nwXKPx99BoJI4e7XjlRt45Dg
X-ME-Proxy: <xmx:FdeWavMpgXwxtJNtrorPHuUWx6pzuS03rYvg-r-fXkdoFpeFMRH9nQ>
    <xmx:FdeWavVBnvz0rdDAq-ujBPI8U7UrQ9wN9o-62qGrZT1VjZtjC0Qmhw>
    <xmx:FdeWaucZrR0_k-wZtog0ZhqgktBoRQyhO0uaVD31EjLIsgr44lsWag>
    <xmx:FdeWajskAP6F6HgKCyHxEmPemxrJyYy2d7zHJPXSbiXUKNwqFmSRzQ>
    <xmx:FdeWanU61MVbVVtlZo1OYFggTu7mUN6Ca9CuOayC8RSkDZbOdVAAz0UI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 12/13] firewire: core: add invalid block test for config ROM generator
Date: Tue,  1 Sep 2026 22:45:33 +0900
Message-ID: <20260901134534.2386577-13-o-takashi@sakamocchi.jp>
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

Although the unit drivers and the userspace applications are allowed to
extend the system configuration ROM, they could provide invalid extension
data.

Add a KUnit test to verify that the generator handles an invalid block.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 260b3d6e9a27..3114110307b5 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -316,6 +316,32 @@ static void add_descriptor_with_invalid_length(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&entry_with_invalid_length), -EINVAL);
 }
 
+static void add_descriptor_with_invalid_data(struct kunit *test)
+{
+	// Use vendor directory defined in Annex A of Configuration ROM for AV/C Devices 1.0 (Dec.
+	// 2000, 1394 Trading Association, TA Document 1999027).
+	static const u32 invalid_vendor_directory[] = {
+		0x00020000,
+		(CSR_MODEL << 24) | 0x00009402,
+		((CSR_LEAF | CSR_DESCRIPTOR) << 24) | 0x00000001,
+		0xffff0000,	// The length should be 6, invalid.
+		0x00000000,
+		0x00000000,
+		0x436f6e63,
+		0x6174204e,
+		0x6f746174,
+		0x696f6e00,
+	};
+	// Use kernel stack since they should be mutable for doubly linked-list.
+	struct fw_descriptor entry_with_invalid_data = {
+		.length = ARRAY_SIZE(invalid_vendor_directory),
+		.key = (CSR_DIRECTORY | CSR_VENDOR) << 24,
+		.data = invalid_vendor_directory,
+	};
+
+	KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&entry_with_invalid_data), -EINVAL);
+}
+
 static const struct fw_card_driver dummy_card_driver;
 
 static int config_rom_generator_test_init(struct kunit *test)
@@ -347,6 +373,7 @@ static void config_rom_generator_test_exit(struct kunit *test)
 static struct kunit_case config_rom_generator_test_cases[] = {
 	KUNIT_CASE_PARAM(test_config_rom_generator, generator_test_gen_params),
 	KUNIT_CASE(add_descriptor_with_invalid_length),
+	KUNIT_CASE(add_descriptor_with_invalid_data),
 	{}
 };
 
-- 
2.53.0

