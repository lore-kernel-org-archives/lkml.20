Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCC415B6B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270358; cv=none; b=ZSo1iak5tDOENgCy2C1x6djKo8HCVGca2R3FCdXhqMEEh7xHdzKnWsGkTCEtj2+w0GaeK3Up7lRM5XTk1uKOmVS8fsBzIixppz3lv2ty4eziVz2fruu9BCNwos5FopT4euFyom6eBQBbFpSuo+JYVW7z7bSo0BfuWAx6r+fcaO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270358; c=relaxed/simple;
	bh=CJeBaLICVOmyWZjtAYTQq3uao6YN/erJngwTBInYak0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajLub9HzlGeUo6HgYoRccuRHO9OggNRBxVux2CqXhE3YjE30gweiLNwufF8BRuIiUc/L7O/iNr9WuIPZXj8LsajizLvz5+WZOJyCejxoGxaVl/mh/+k90A4bmY4r3O0SRSOxbXwa8h5llFVN6JNEmxG7hZyAaVFQ07NR+WxXVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SH9wEZvu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lDOe2B+U; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SH9wEZvu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lDOe2B+U"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F3FCF140006D;
	Tue,  1 Sep 2026 09:45:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 01 Sep 2026 09:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270355; x=
	1788356755; bh=TIZ29zTt9hWLX5Ra3muzPURNiJ2s9IdGBtnDopyV00E=; b=S
	H9wEZvuPQJuLouZS1jLhHs2QgtI7imbFbx3k9ENA6VjPmI7b16qgk4EwdoSom7HY
	C0MndCpQsvCM9EXqMEoxpzSjOSTCRygtYcYz7UNwa09RuglOmuzUhx4NBbo8VIQX
	Q0+GHcZr7DyVYbAtkZNz7gsE/BEKP8K2cawkjVGV0RnPNq/ZxyR07n9CELbIb5IW
	u8NF09JBGHYdVWJf+oda5o8d+VHpybj81c+1B4HyGBoT8a2WjUNsZoC+W5smJyJh
	TKJk2i69t1ec+l82RzgrgWPYHGPl7NIDPRtBGAbdtESAo+uEDHxcda5uxDykVWL0
	3olRBNL387PPCazAQsbBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270355; x=1788356755; bh=T
	IZ29zTt9hWLX5Ra3muzPURNiJ2s9IdGBtnDopyV00E=; b=lDOe2B+UqrI+9rCMe
	WsJwetRPdyt/Y0jeFf7hit8hwfvIhPqqKoMycIc4LEnKeVzSfizSW5BgnXE7kD90
	Zu2cRXl3Lb3t1//km7CmBmX5cVf1t1fhdva6WB3cQROFkLZPA9RZYl85WJbfs1pO
	gOO0BPx6L4u3Mxf9BDyl6SxE0fnCkuL9vW3n/F6LMmHo8qPy+GlAUapaw2cVVJHS
	Bcb1FJgxTwkkGqbtmao+Vwe9D0YEGUpcVRCTn7yvk1V1yivzB9Fl35xteMrn2m/f
	UkuIVIk7dJ3S4TzJCW3C0kdlkWHXDEHt4ZRVGqhElAsSVc4hSEfygn14SrXrThfM
	+E1pQ==
X-ME-Sender: <xms:E9eWajQvqGaRGV-Z6lANP-H-Q9PjnaNirec4iisPb9VUAVuE0Xb7qA>
    <xme:E9eWainfFEW4uoq8h_R3JKqxkRxzU-pksWRPuBXmpLsuDora3iMdB4h-1mOuWm3R-
    p5ks_LUyLMLyHrjCTvSlcGmHfwuNkDmOiMi0JSDT0R7ncT298dAm8C0>
X-ME-Received: <xmr:E9eWajQQbx-6UiqyG2CGs9J4MCuovJgku9t8xNtaz-M4smeMGY70cEFKjbVoSQlh3Z2hc41Eh016rRXdKHL6ysZlhk3x3ZliyowuzPqQ_r0>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19el
    vzMQRZeMpvvPsQ3h5L+ktaSURVbv7bUFiGiMvJee6XE24iMPmJlsgK4FDFiRpp7owOWdXb
    3zzULLYywfvkfAhjbYyfRl/0SYiwxtZ7uLzVBiQfBp44dFQP/+rC5nbWkJd68eJ72TAqpX
    xDrgqP9F5o1c477Xjjq0R9wTw/jdao2WV5LyYohTUswFIsOuYPQu/nl+plMTBiYC0WXVPX
    tStu0TbMb/r2knWBQKIWBAmDcWuKXJJhN55fg+CwMBE8XbPlsbhXRWqgbAs0JN/3FOGWJa
    JPEWuQSvlUkPAFO4xhoB42h3+alqA5h0vAzOKKOt+gFizoisMIy1qcvyodtw
X-ME-Proxy: <xmx:E9eWagPsXoEdWCaM4-xmjqWG5mlBIaihHCqmNu0KWaRVHo-bnb9dgw>
    <xmx:E9eWasVCJBJb1u7txOtYEHjBT5ePgt_Bm_J6PjtUeQbDh8XZInZ31A>
    <xmx:E9eWandSNszSUHokX2pr7I8PAP4cR36pi50KPjxeDNavAB5EZKTqYg>
    <xmx:E9eWaouZ_ptKpmYAnuY0-t3q2QUJ1C5GTwOwo0PlxMdbU04LEX74Rg>
    <xmx:E9eWakXVuvRUc6VJj4FfQLDNirv0UosN7UckpxegQOtpE6u8NaOsHaQZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 11/13] firewire: core: add test for invalid length in config ROM generator
Date: Tue,  1 Sep 2026 22:45:32 +0900
Message-ID: <20260901134534.2386577-12-o-takashi@sakamocchi.jp>
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

Add a KUnit test to verify that the generator handles an extension with
an invalid length.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 7d76580c2004..260b3d6e9a27 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -306,6 +306,16 @@ static void test_config_rom_generator(struct kunit *test)
 		fw_core_remove_descriptor(&avc_unit_entry);
 }
 
+static void add_descriptor_with_invalid_length(struct kunit *test)
+{
+	// Use kernel stack since they should be mutable for doubly linked-list.
+	struct fw_descriptor entry_with_invalid_length = {
+		.length = 257,
+	};
+
+	KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&entry_with_invalid_length), -EINVAL);
+}
+
 static const struct fw_card_driver dummy_card_driver;
 
 static int config_rom_generator_test_init(struct kunit *test)
@@ -336,6 +346,7 @@ static void config_rom_generator_test_exit(struct kunit *test)
 
 static struct kunit_case config_rom_generator_test_cases[] = {
 	KUNIT_CASE_PARAM(test_config_rom_generator, generator_test_gen_params),
+	KUNIT_CASE(add_descriptor_with_invalid_length),
 	{}
 };
 
-- 
2.53.0

