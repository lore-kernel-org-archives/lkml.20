Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5E47CA7D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270361; cv=none; b=ptj0EJuKeB04VAnZkqWnF27ib80P9HLUekCBS82EmoofW9lSDhFMNPBWzqMwvFDZoyRDZ6QCjifMuSgYCKOrmUMf0ZLd51rIMKbdkCM5mQpoUt4dY6lDkrjxCxJepSYqolkCqaTIS25aSyd+fUDr87/F3yMU9hkasgBf+v3rER4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270361; c=relaxed/simple;
	bh=cd884XH1smHerg3iOHSMpm8x/c+cjiRg5u6hlcuupAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToZygTFMVZi0Axkb/SMoaJn0ibUGqxYFtoWAAJIekDEuy6Ri1DJN6zZdskcjnexBmrf1UBnfcF4Dx5zRrH3k4T1TmyWgolHK/tXDALuzgI9L9t2ZA+cOX9Cw+cxA5TzPzJbNGN5btOOuIT9bDwicxd3i8xyrw7wQtdFchKbCE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Y8JGWpMv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DMyyF8tb; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Y8JGWpMv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DMyyF8tb"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F34DD140012D;
	Tue,  1 Sep 2026 09:45:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 01 Sep 2026 09:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270358; x=
	1788356758; bh=kBYzCr8NQhvsbNexWcUVTFKpY2eB55ccLL1loHUgTYI=; b=Y
	8JGWpMvC175DluIh80kN+BjkV0tjXQsAmgFA/3qYZaYPMQ0W5uZNQWheWuyqoR/Q
	oF7nVpM/zIlFJdGqzI/pDbqSxy2REDs/Xtf+9niILa1iIYiHwvNUDqcQEJAi4acw
	uZF1h4rsydOgIc8aYOP3KHOeO7nftrUyAw8WVkfRaVq+oQUwE2+nrC/02JIjjiC0
	8jDC0otmHD97LjSObLxc4kAklIJhnwFcq9fCOigQwva/HVRBH6E0ZbUtjhQzLfdx
	5kicBn9rtcPSdeyo7JLPjdVvmGDZoqMBcnt3Vfso9p9kwjjzwtZg1G/rC+33ukBX
	2TOA3QrRBniZtSX4hCwsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270358; x=1788356758; bh=k
	BYzCr8NQhvsbNexWcUVTFKpY2eB55ccLL1loHUgTYI=; b=DMyyF8tbTm846MhKz
	J6hKw7pRPk9e3xwD1ZFNI+fokFZxp1ImD5vMUlVi/ETuKisQSdiZROyegsqKPJuu
	aiTw0Y71FWLvWAi+0bzq/n+JAJ0RIKJeVqgXF2qWdI+g26rfNncMThgAVsni+uOa
	zKC2+DX++lGFZfcKGK+h+OCNqSztb4P1PUVt9JzNmkVInCEsCLnZQWb7u10IGAAx
	MjFVtsbQgjsKraMJVQ8lL2aVezpcj2HxU9AT+7lUtRXZ2DQpdxW8lUZxcbnlhjUy
	qvxAbD0j/85ioep8PdONdzsUWfcZ1J0dMtBWXXE2BLy2RmI4xXjCHMpabRM2plsH
	WmTdw==
X-ME-Sender: <xms:FteWau-oodj38cP1S6_vV8k4ckS1N7U_9ikuzux7YhlMyauOfr5Ksw>
    <xme:FteWasi1D1Ln_9byPT2ehoiBtgGcdt-u-45c9sOH2Q_05X0sLNAwdACi7dg1Xeq9z
    zn0VsUJ6ZnNsPoYkgQLJ3WLYaSDiul5T6ILvvLXWunaJ5oeU5LWRCE7>
X-ME-Received: <xmr:FteWaudLo7_v149d9U0caTvmxPMqYkyt1BmfJ4HmDWSgZAey8UG70r9MgPr7y8cL5_-eRZLm9PC45cZD62CKiveTL9LBQbttCTPEgfc8kFU>
X-ME-Proxy-Cause: dmFkZTGiQ9ZlRiJKC7D1d5DbbxIr+g55vUKGneT25tIRMdYB7k9WyFFnZehrURFTVYpo1W
    8uZu4NqjR+kuwMmES6P3uwaQkgmKqGxxKSim8VJVBc81V1vfj4BBxc1mm7eaZY6HGk2VH6
    6/5LNy1C3nY8ZFLHi56w8j8b+LGZLCEdnNYyr88OqyO2LRFubLgd9d2lIgmNhCYTS5PS+c
    QPA7kV6z2mnKnfD7tOwxwq5H06WLKaSyFE49R8r1afWyhqm1Iq1caezZ8QFao5RzFljygh
    2tEFgZXcir9eShF+WIZQuuaXPJ96e7idd8zffgDbO7adFp3an2PgcZzpUj4Ud0JrKyGBR9
    zM0XFXiGljdqaVygIYdppB8OfxQ0Lz9aAGgNziu7uSAo8uitvVHISFmdyyPsvUi7a17UBC
    pIsSWaf1/Em3MM4ybTkc5krd26jV8B/b1fvv79R7hL6gb5sXv09TJTLq7kd6hA81OHbXQi
    3gIBpIv0PrkKcyX99nunGLVb6RQFkkbQL0T1PvVxc+b7KGGJM8/zMwKLuBGfUTtABgoAL5
    v3YS0j0yhjmCmzqt09q6oRCartaJEqcSQOV2/Q/tbdXaFF6aaGUfdi/hS7LWYDXRc90e07
    tO6mhh3mRL9B5ymzdT8nKxzU36VMF4xpGQwL7ycy61U3QBcUbnDL67LMUG0Q
X-ME-Proxy: <xmx:FteWajopQ-grPYpfE8dsdvwnjmTIXMeqn9PrQIoPGr8CFZoilk8sWA>
    <xmx:FteWajC9BRFni5Lptd_nkIrSmPV5liFxxfWHyhJ-L3QFf_iPduH_iQ>
    <xmx:FteWagaU14q6GVjU2wGydPgcEqtoIcerA5bGzUbecD-Evwy-YpxtXg>
    <xmx:FteWam79YRkyFv92U51-r4-Xh1A0F9L5LZzWV23mAEszmOefMzof0g>
    <xmx:FteWahBVJBpBWf2Du1tIezVnMY8A8Y2YcTd2uAhiwy9DMPhFQ3HtlJax>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 13/13] firewire: core: add test for beyond-boundary case in config ROM generator
Date: Tue,  1 Sep 2026 22:45:34 +0900
Message-ID: <20260901134534.2386577-14-o-takashi@sakamocchi.jp>
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

Although unit drivers and userspace applications are allowed to extend
the system configuration ROM, they could provide invalid extension data.

Add a KUnit test to verify that the generator does not write beyond the
boundary of the configuration ROM when handling an extension.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-generator-test.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
index 3114110307b5..212dbdcd43ba 100644
--- a/drivers/firewire/config-rom-generator-test.c
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -342,6 +342,26 @@ static void add_descriptor_with_invalid_data(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&entry_with_invalid_data), -EINVAL);
 }
 
+static void add_descriptor_beyond_upper_limit(struct kunit *test)
+{
+	// Use kernel stack since they should be mutable for doubly linked-list.
+	struct fw_descriptor entry_beyond_upper_limit = {
+		.length = 255,
+		.key = (CSR_DIRECTORY | CSR_UNIT) << 24,
+		.data = NULL,
+	};
+	u32 *data;
+
+	data = kunit_kzalloc(test, entry_beyond_upper_limit.length, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, data);
+
+	data[0] = (entry_beyond_upper_limit.length - 1) << 16;
+	entry_beyond_upper_limit.data = data;
+	KUNIT_EXPECT_EQ(test, fw_core_add_descriptor(&entry_beyond_upper_limit), -EBUSY);
+
+	kunit_kfree(test, data);
+}
+
 static const struct fw_card_driver dummy_card_driver;
 
 static int config_rom_generator_test_init(struct kunit *test)
@@ -374,6 +394,7 @@ static struct kunit_case config_rom_generator_test_cases[] = {
 	KUNIT_CASE_PARAM(test_config_rom_generator, generator_test_gen_params),
 	KUNIT_CASE(add_descriptor_with_invalid_length),
 	KUNIT_CASE(add_descriptor_with_invalid_data),
+	KUNIT_CASE(add_descriptor_beyond_upper_limit),
 	{}
 };
 
-- 
2.53.0

