Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229D1A6809
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270344; cv=none; b=kdermGPxvVQL1Agk7a5fX9hLHOb4c/RFY0e6YGelTtvrNzvea85/h1LEZa+lgZnnbDzLPiSHPvIGAVmPCCcfiYaucu8LViKTV1Z/KxpubNWLudrfkh77Q2GEkY/IAhuEnLwETzKOuKtuVpZXZb16BQDDzGLJskwEjAJmT/eeiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270344; c=relaxed/simple;
	bh=R7XKwS1rRQbwNWLlb6FDC7rpfmznSUvP/XShKvGqmUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2XNnxsZkgF4BEZ5vDwYmKU9440fENe5eELwrfpbFRDxMHJ9q+DtH8cHEDmsZPL+e7BvIzzVhzeZhLiRbCgFjEBbYG938d8ymUMSBIcZYe96MUa8YXytQpcykRT5ek/6aUHcJu4Jq008n1Qxof0AodumR62TIaSa398+QtosQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=RnilabOU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c+ybRt/y; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="RnilabOU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c+ybRt/y"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6D8FF1400093;
	Tue,  1 Sep 2026 09:45:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 01 Sep 2026 09:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270340; x=
	1788356740; bh=9RtNs4qRXiJlS2f2wTR1vyVhwZEuvWmevybH2uZUCLs=; b=R
	nilabOUIqoBC8Y4OAc+sb47IRn63Tlcz1MT4ErkFMx557HkLcxQ/YVh03hKnwycF
	Vsc3eUwN5tAzxOee913B4ulLGT+I9U+Ky4pH4hdVQHHzwswlF1LWou0HN3mJ96Xe
	qnh+tBBBqfCgSwLCCIn2ywMuqX3oKZ85cdc70soWo1sh36//GacyBrqIdg6Lu+AN
	pSSpgHaluwoVOsh52EAIRTj2kxvinXtEQFsHGYfEgevvmJn8m9zV0rB9AGLQt40e
	DKKPkIcB8lYEAJ2Tdl6b3IxW6YnV9KfRz90c5oGmwucFgpDKa4KQLwIlZkpT7w/o
	NPRsHhWqTaEYUtYeC4Zjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270340; x=1788356740; bh=9
	RtNs4qRXiJlS2f2wTR1vyVhwZEuvWmevybH2uZUCLs=; b=c+ybRt/yNyMs2RoJs
	4wFRTHHl69ehnzD0URiYpCVbZR8QAVeKORMCQLHoJ7VtKYmOrXV0gw580GfWXp0T
	dKKolQyaLX7HeuYNbMamj3GFvtChMXPdSYkqXcMqi7SWE6nbOxIpYvi7+H8bv+Fk
	I33PBBX3sPR6L3xpQtFNfahj30f1AoPY3a+lyGpBKL44NFQJV87bPCvseaRr+4Ap
	JgpxLf4w5KDWmsgaGJQuyIcQ6TvCpT4VLdUTR1H8fpBc93n1yMy9AL4+Qy30mJlh
	/hBAJcMhau/f1AVmX9CGOIdZ1X1uoQa4sHsBVCzoF9/tjzRqCSpvCNrdpI3xByZI
	xk8EQ==
X-ME-Sender: <xms:BNeWapJWr9cDEWRChMYJEko_unTXBLP4RARnw33yYnUp1Xkf7Ci9BQ>
    <xme:BNeWai8WJ6FVePZXjwjeOud9uBrizUO6MP5_mOYiBMEbb4qUuYLP2kFvG2MaMuERG
    hxWwBOf9i5b44YU5Ib66Iazn6fKKXdfZLKXJsSqF0m-QmN-dNHyj0b7>
X-ME-Received: <xmr:BNeWasLhJ55ORyUygQYsbREMh9fV23v7YQiX3aI9CJYxT5jpDc__jtdAJTIxDPQnoyaJSNf5bC34RnsacIPXghAo0S7_fCtXNw0s12OAiM0>
X-ME-Proxy-Cause: dmFkZTFZwncM1fTlDqQm1y1Qd0WbMqgKiG0A81BHg4cYY3dGXUvtGFI17rS2eqaSTMcTBc
    w3IzjIjmVlW195FZcDDa3B601JY8rpJ6csJDicaYRdNLVZTvqTWrKZa/klMObsGgDWU/8p
    /Wr19S7NvuX68LaDTX4w+OnJKTMjpKwxBJGYNHh1AbNse1c9fCMCLHKsRgBaxZv8u1eAH6
    mYnyoZaoyrVayB5GOgi+kRthTSA4CwYP93MtH7MmSsT09m4QsIMMuJbtd+noIlvMayqJS4
    FyfnBVzwEM7VTPfRUX8JwnBRE4JT8u7X4MwdT7ILu5lMZFPOb3bJn9/6dlgjFc5whtTgEB
    fZX3m1E89hhLpXWwOhC1PMx9rC9z8RsIcSDwJxd32VN5+PPrKwQFsNJmUBUUjg7IqjlImp
    BohO4o5rAo7MKy8sizST7dHr0HmOsYqKsga6us3EzylParuVgWkV+njVeAqEwqyjweHisO
    gV7W0jwc1R/j2Qn4COCT7nIKY9y4fxKpKhXcNgkYGIqkKq15alvK6giymqFxQDW42sEFbK
    H6NwL545jbwFAvRQeYWLC8PeaFnaiGa5Eu3r81sVwYYbPub1DTfRumU4BuDzJ9ZZlBCHLX
    pLLMxR3AwXYOMhU0usJ8ADb+tG5loTIJUSKhJ+Vf3yqX1NtOKpzUVDxqStmQ
X-ME-Proxy: <xmx:BNeWanm5PdWEqbmXZYhbYdocScf4F5cxw98RriyKCbeuyvFPW7J1pw>
    <xmx:BNeWagPCYbH0io4hBFTQG7bJswObBJAUkr1gvfElN_k-ORuocEBCrg>
    <xmx:BNeWat0z3-pGF8NMZMeTpB2XZWAlhqDlpRfEt1jm12MWlEs4-mBvsQ>
    <xmx:BNeWavk1cKKzhpF2MWCy5kNofjs8a8ifq6vWQJaOguCYD70dSQddPA>
    <xmx:BNeWapcIOEQ8SYeqW2L-d287an1MdCx2LBRo_yKw2aiARlGCrih3PpIB>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 01/13] firewire: core: add KUnit test skeleton for config ROM parser and generator
Date: Tue,  1 Sep 2026 22:45:22 +0900
Message-ID: <20260901134534.2386577-2-o-takashi@sakamocchi.jp>
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

In IEEE 1394, all devices on the bus are required to provide structured
data in response to requests to a specific range of their address space.
This structured data is called configuration ROM and is defined in
IEEE 1212.

The core function of this subsystem contains the generator and parser for
the configuration ROM. The generator constructs the configuration ROM for
the local host node, while the parser interprets the configuration ROM of
detected nodes.

Both the generator and parser are fundamental to identifying the node
capabilities. Add KUnit test skeletons for testing their implementations.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/.kunitconfig                |  1 +
 drivers/firewire/Kconfig                     | 16 ++++++++++++++++
 drivers/firewire/config-rom-generator-test.c | 19 +++++++++++++++++++
 drivers/firewire/config-rom-parser-test.c    | 19 +++++++++++++++++++
 drivers/firewire/core-card.c                 |  4 ++++
 drivers/firewire/core-device.c               |  4 ++++
 6 files changed, 63 insertions(+)
 create mode 100644 drivers/firewire/config-rom-generator-test.c
 create mode 100644 drivers/firewire/config-rom-parser-test.c

diff --git a/drivers/firewire/.kunitconfig b/drivers/firewire/.kunitconfig
index 7406acb00478..ee9129081cef 100644
--- a/drivers/firewire/.kunitconfig
+++ b/drivers/firewire/.kunitconfig
@@ -7,3 +7,4 @@ CONFIG_FIREWIRE_KUNIT_PACKET_SERDES_TEST=y
 CONFIG_FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST=y
 CONFIG_FIREWIRE_KUNIT_OHCI_SERDES_TEST=y
 CONFIG_FIREWIRE_KUNIT_NODE_TREE_TEST=y
+CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST=y
diff --git a/drivers/firewire/Kconfig b/drivers/firewire/Kconfig
index b5abe00accc9..7e1d4b2c440b 100644
--- a/drivers/firewire/Kconfig
+++ b/drivers/firewire/Kconfig
@@ -96,6 +96,22 @@ config FIREWIRE_KUNIT_NODE_TREE_TEST
 	  For more information on KUnit and unit tests in general, refer
 	  to the KUnit documentation in Documentation/dev-tools/kunit/.
 
+config FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST
+	tristate "KUnit tests for config ROM parser and generator" if !KUNIT_ALL_TESTS
+	depends on FIREWIRE && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the KUnit tests to check parser and generator for
+	  configuration ROM content defined in IEEE 1212.
+
+	  KUnit tests run during boot and output the results to the debug
+	  log in TAP format (https://testanything.org/). Only useful for
+	  kernel devs running KUnit test harness and are not for inclusion
+	  into a production build.
+
+	  For more information on KUnit and unit tests in general, refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
 config FIREWIRE_OHCI
 	tristate "OHCI-1394 controllers"
 	depends on PCI && FIREWIRE
diff --git a/drivers/firewire/config-rom-generator-test.c b/drivers/firewire/config-rom-generator-test.c
new file mode 100644
index 000000000000..9a901eef7b0a
--- /dev/null
+++ b/drivers/firewire/config-rom-generator-test.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// config-rom-generator-test.c - An application of Kunit to test configuration ROM generator.
+//
+// Copyright (c) 2026 Takashi Sakamoto
+//
+// This file can not be built independently since it is intentionally included in core-card.c.
+
+#include <kunit/test.h>
+
+static struct kunit_case config_rom_generator_test_cases[] = {
+	{}
+};
+
+static struct kunit_suite config_rom_generator_test_suite = {
+	.name = "firewire-config-rom-generator",
+	.test_cases = config_rom_generator_test_cases,
+};
+kunit_test_suite(config_rom_generator_test_suite);
diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
new file mode 100644
index 000000000000..632f24e68692
--- /dev/null
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// config-rom-parser-test.c - An application of Kunit to test configuration ROM parser.
+//
+// Copyright (c) 2026 Takashi Sakamoto
+//
+// This file can not be built independently since it is intentionally included in core-device.c.
+
+#include <kunit/test.h>
+
+static struct kunit_case config_rom_parser_test_cases[] = {
+	{}
+};
+
+static struct kunit_suite config_rom_parser_test_suite = {
+	.name = "firewire-config-rom-parser",
+	.test_cases = config_rom_parser_test_cases,
+};
+kunit_test_suite(config_rom_parser_test_suite);
diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 94992791f02e..23749434d900 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -851,3 +851,7 @@ int fw_card_read_cycle_time(struct fw_card *card, u32 *cycle_time)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fw_card_read_cycle_time);
+
+#ifdef CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST
+#include "config-rom-generator-test.c"
+#endif
diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index cbac66916240..4e79c57263ff 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -1442,3 +1442,7 @@ void fw_node_event(struct fw_card *card, struct fw_node *node, int event)
 #ifdef CONFIG_FIREWIRE_KUNIT_DEVICE_ATTRIBUTE_TEST
 #include "device-attribute-test.c"
 #endif
+
+#ifdef CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST
+#include "config-rom-parser-test.c"
+#endif
-- 
2.53.0

