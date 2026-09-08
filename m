Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD253A8BF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870576; cv=none; b=Y61UGmSiTIjLvMux8OA+5eXQQ8/K7HO4SJPZk9uYmCx0TYTkzqwt+xBgIT9yEdJxs1F8vX09xhgDuAhn+jdcKnwAdFAljUOeZbsJqvqEUP4I+n5Kb5jhJEDeSpehg2H8LNRTF5qXdnu2KoMpnfYPdFWoBVkYvK4N6UnLE5BYPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870576; c=relaxed/simple;
	bh=Po6Dq6Wtz3jbL1ThkFUX4Exh2WtJVgSuQecoWQLonY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uckVCvkWqkJhEQGKW78qCW/xWmt4yZYgAH/og4RPvoaHvsqQRhlviHdXLF0RzHnPoBC/nwzra0eXsuFe7pzGnq59wGC4z5FaKsXSYni4XdXkjlV7bhxxlVPGXAvmfQj1NqRvyZhacng/uhgRDQdqGx18TG8DA9Gbp99RG4CY5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SF5EQyvT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VBDmsKKK; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SF5EQyvT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VBDmsKKK"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 4923EEC0104;
	Tue,  8 Sep 2026 08:29:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 08 Sep 2026 08:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1788870573; x=1788956973; bh=X8AQxPnxKg
	SauhDj6uNoEN2FK82YUM8gYqu9RvBvW1o=; b=SF5EQyvTn92hlLQltJno7heEbE
	E2C1/HgdtdCms8gArPOO/MCQsVP3oupk009chEjfLUL4R60tXqpm/jLM+VMFJ4/Q
	d400LUFSe43+97WZiZOKrGfBJ0fFdhSAxc51eFiuqIN7N5oZ6pbLyfSxxIwaTIgg
	Bb7sFO1umrnVh/NqSai0SldWxSwGyjQWiUw3hPDWLwlzUAZ4Zw2L65TIlFhYS8Lp
	2Ft+RVMhgBZcGUOcs7YXe75pNXLKozDvwWs7hoalXJzPEY9+PPlSDWZ9nx37EyQx
	4z3eXa7wtXighktmasxNybpUMyJYMv6W5fH0a+c30GrlOkeB5ZnbmyQADZvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788870573; x=1788956973; bh=X8AQxPnxKgSauhDj6uNoEN2FK82YUM8gYqu
	9RvBvW1o=; b=VBDmsKKKKm4avBVFv4uNw1JcYeSNHuMel7PwlaRLkxXSmQuXIDl
	gdWLzdFfOKSwTf1r7i1wgkv8uNQHYkqLp5hi7ZMHlDbhxe2IJ3bIvQ9zYgVWeRNT
	p/ZkDqgReZL6miAU+jt/q0LQsW+geP+0XDXfm7UDrhRxIHi8Eikj9jfXQX86a03h
	/yjgbcRt2vqZB3yt+F/wHc1766YOn0sI3DmKtq5PyURqajo7TPrzqbX2doeo8n/Z
	5aSMMaDaT5TeNBex5QCd8gJIOHc8pByqh4jtSzmVG1X8Lkm4pkwJ7yKS9sAzg+Gv
	zTEXbnUFiJW/KbVk6ujzhFG6pG6xSSSyiNA==
X-ME-Sender: <xms:rf-faqUtzQH5ph7JnKqeDy851DgucM5NSSRidJMvok4h1i_ikYqMHQ>
    <xme:rf-fauUwRS4hIahJoiostEsdq38f0gaAgEsQNC4NAnQHs2BHtHfE3JvXR0RkgZbtb
    0spxjwZP6IlI_P-PvW7rOQzQtZMOiOOwNGFR6QCVCUTycNA7sAkK8Sk>
X-ME-Received: <xmr:rf-fahcL4fBKgG00htVHmzRnO_Z2MPhEUiFiM8aKJEvm56CB78FeGMUNOlQcW0vBcOh-4PcDBuzdfiFFFyr_Et-wSrWY8llfWClG-YRMgjID6w>
X-ME-Proxy-Cause: dmFkZTFVH4xAmUIhhIqyWrvd7GU5reH/nqOD5729YU9ZHwlxwZibQeyoTOP+bmYzAm+5vV
    BVoXIcxyX5WmkkiZWg5/86oLUHUABomXKFqoztMUaz32MhOIMCUYnM5s64yeEDgCZuWJ+g
    07vcn/m+KgDcqeVE9XwazgrFsoD1ZLImrtNQMT2l7Eh8UYBmUHon/mNL/KWoxhMqbMwNcJ
    4jzGhlQs48GRJqsZoocValadJ7u1xjhhIWGoV9VTZakllGbFLj/87TqRfqt36skCc+IcsI
    6aPzeqDWNp1i2uMAHvS/IeVdm3g1IFKT3b3F4NeS5PBce3zw4VKzCHdwstR3dF4vGHExB5
    K8FgKvHWsZVu2VhKLxkf8den7g+DckDAB96sPtPwhCIhbaZCyV1556ttual30fOYRSL9U1
    POeag8Es3GatV4Fd8u96il2Uqbzn2LCVNxX0X+TFdHuW3n+3JRSgiHP2vhNHmse5ZYpO1g
    aIsYlZk0RxAKecKGyHFipUjouzZeuS52IRMV2ZrV9T2yMOHOzsMDA862c360c0jCqZPDQ+
    SFqMDdDDtg/ZMs7nRAXiiMMHTAKrXEaRl93odqNRLlpdEYPSYHiDeauCkV+uEyjW94EFgP
    3TZsnCZtkU4lNYLnvCbOAxyCVTRRGZkboX5uYHrs/W/1dr1N77Ao9yj+o3KA
X-ME-Proxy: <xmx:rf-favXjjfX81IBJvq7M_geLUOCT55eQV6ceoU99llNZOgfrdJZAmA>
    <xmx:rf-faic35xFr_9Kf79ycmP0MRjVpyrYecqhnToP3xEF5SeJNTKB0Cg>
    <xmx:rf-fajNGImi482BKWLW4lbVlfmOx-p-teaql78KVB7DxBQdZyD2yoA>
    <xmx:rf-faojDl4D8we_QBHNnc7NPjL60SBsdiy7AnKWKe7eWsNGvamMPgg>
    <xmx:rf-farMjsc9qKIly59WONR6xFfzasHWGu_6ZWzSHPArmd82eZLaWamuU>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:29:32 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firewire: core: fix type of transaction data in config ROM parser test
Date: Tue,  8 Sep 2026 21:29:29 +0900
Message-ID: <20260908122929.2886698-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type of transaction data should be __be32 in the stub function for the
asynchronous transactions.

Fixes: 23e0d2e849eb ("firewire: core: add test to detect irm-is-1394-1995-only quirk in config ROM parser")
Fixes: f8e5070bf292 ("firewire: core: add test to avoid excessive configuration ROM length")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609060257.8wQo9w9N-lkp@intel.com/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-parser-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
index e5c173353057..45f1ead326c5 100644
--- a/drivers/firewire/config-rom-parser-test.c
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -206,7 +206,7 @@ static int stub_run_transaction_regular(struct fw_card *card, int tcode, int des
 	KUNIT_ASSERT_EQ(test, length, 4);
 
 	unsigned int index = (offset - (CSR_REGISTER_BASE | CSR_CONFIG_ROM)) / sizeof(u32);
-	u32 *quadlet = payload;
+	__be32 *quadlet = payload;
 
 	KUNIT_EXPECT_LE(test, speed, param->expected_speed);
 	KUNIT_EXPECT_LT(test, index, param->quadlet_length);
@@ -264,7 +264,7 @@ static int stub_run_transaction_malformed(struct fw_card *card, int tcode, int d
 	KUNIT_ASSERT_EQ(test, length, 4);
 
 	unsigned int index = (offset - (CSR_REGISTER_BASE | CSR_CONFIG_ROM)) / sizeof(u32);
-	u32 *quadlet = payload;
+	__be32 *quadlet = payload;
 
 	if (index < ARRAY_SIZE(config_rom_first_part))
 		*quadlet = cpu_to_be32(config_rom_first_part[index]);
-- 
2.53.0

