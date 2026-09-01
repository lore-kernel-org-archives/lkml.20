Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C0B2F7F0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270346; cv=none; b=DeZoPwWD+Zb/geboT1To8GnEoGE2W5pl6x+uG+QgSCObQ7MAvJlTkBQ/WSSvJRyNBCYOS1lo74Q1I33+BZ5hbUF+s/92f/lY5Lrqt4rQQ+yMi4ZTIKaXEGVbKnAWrKza6U80a0onIvLECGyDBgIYZvwcEpVjhgzQCg8F4C5/CAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270346; c=relaxed/simple;
	bh=nFCJLO384mac6C9HeCwrGQ2XhIe/AUhAVM4w1x9u1CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHyuqKSrAlMEXX1YCWfaHbtk8sQPKh+TOt32CnKGlsHzbhn0bVroSdOp5xRKQ/kNXwVuvdAb5Vvl82KRcUtn2McDvESCt8PnxziFsqx72nUPTJ1bLYSxw1s44bSjsAGyF/7BJuAI4LiFhLeqAoAwKepW2Yor6aI+EzDnrU0oEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SrXfQuVq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UuPHaYpb; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SrXfQuVq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UuPHaYpb"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 8DA94EC00BD;
	Tue,  1 Sep 2026 09:45:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 01 Sep 2026 09:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270343; x=
	1788356743; bh=Miba7rBHG1INP9PhTrnQwE0ikEZvKK2hUVomzqTr/zw=; b=S
	rXfQuVq8l0305YIAXJxo43BU0HZIgM7201YEK22VEw7ryLjg9OidpJMwDh6/1bHF
	OIhLKuTlpVL6nOrDD3mxg8JLlLF7XMhdnWSGjEHOnuNJgYoi1Xi9cnNwiQb8aLdR
	8/Hq1YmkIltCfX8vGOKfzjoOw9jh0f0xdtf+ySWiDs+Mvb/yvpQSh69w2mIGhsxL
	CnjLBJSNAew7fWvd3RENtTK4qMzcGvqzeL+dH9Polnf4i/Whd0TxOVunkr5L6Zkd
	K42L8bOSH37AJnv3v2MACCjAHDHoUdiaMphpbevagzA4Qm1nGtxMZ6XoAgCg+mOi
	x44Oa3k16W0BxHs/YH+6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270343; x=1788356743; bh=M
	iba7rBHG1INP9PhTrnQwE0ikEZvKK2hUVomzqTr/zw=; b=UuPHaYpbCivnlGlAZ
	Zou7ogz58jeHz+FP4UbzYW+r+v6TupLAGmRDeQltEeAX0jXaylFr05GUjqu/6et6
	TLCgetGtFk7iiL7ugkBNrjBdDAuE6sA3UjelgqDBFsiwT2FjMofKCQkDBRMrRfyt
	tWIVNIxM1dhy6dYHgQaH2mW9mu4qt3Svpg/D+iDpSvDAOpLL4JLMnvPttvjqLrtC
	PG4Y4v+7kqfYhDmC3plBA6jC91szyztRRd/mGW/2YO1MLa0n/VGGcYhQIDWHottm
	e+JnA8IdgYsv5Z7kn3A23DTJzY+C/+p2lVSJ1Js9shCYC/UwYD2HP1HN6Y3/Sr+N
	gmbRA==
X-ME-Sender: <xms:B9eWai-C_LwHtzr6SHARXoMPMUim4Blt0l3jS2ArhK1T9REId5eZzw>
    <xme:B9eWagi27fJ_lQyVhDgbHUtaM-wGnbG28FYZsR8Wsd_A8Un9P0yq3D0zmLbxxFb3G
    yVbTgsmQzKKAGVW83GIMoikTG1TXEGjIMq66f-R_VbA2PxhYf61eLLX>
X-ME-Received: <xmr:B9eWaifnYm3Hxz3mItVBetBuhEaJ9DteotZTikXOSwhxpnM4WEOeG4UaKIRwbEFXPfOWSSjI0VnfCJL6MG9hlmHeMLwjErmmpirKHKWAaJM>
X-ME-Proxy-Cause: dmFkZTERWJ+9AxblpY30+y7wpfkur1Fgy92ADYf3L53ujt/fv+xv29vapTGT7o9DeiD4Ib
    7qPIYYxKYoQ/ySkn73mPNzEJ2AhV+J39wbt0OMehXHp9FIyeygqi2nnIr9iN/hoGbTb3Ch
    lNhtmFF8Z9J5GDUIjEHU8cgScPorWYCARsDErQnCMEU4SqFLQsTLxPyl73/pam9i4iGEas
    0ws+D7eOCVyqnMsRzgFnc4n7CBFtRS6kxVxzS8QTsy1twe4WvgnhFJWqU0UPRyURkOW0jv
    i5R/R/nP1psaLpmS/T8lXvod++rIw8nNGbAZ+bpX08YpXVA0TY/DYmsjiBIvHI54ZVI7a+
    l2Q0Oexgr7GAAneErCbSS2afmQ9DF/4AGT0gji32Wml934mpt6w1cHWaWLi7au38hikWTO
    wITrO1ANI7dPPEjaF+VGbvRLkWayPADoyN3bfGxixiJ4kpERSoSosTZhLTt3Nd9ou8INHf
    c0heEtu/Bx3eHGqxAe1EH7zI1Luw6VuLa0GTzrxSVGVk0wKALIw3Clan8IC3OfcQs1ps2Y
    UnUZeGUmxbOGyHpcGrMqUH+TW/UNupfbtt7FX8cBH6RRpeqh1lDViTS883yU1OTYOR8c8+
    QzB/rbgHmwStGStAlNKkTdhMymdK9lwVTHTqFOQV2ZT0keOAQPrN0IzfOAfA
X-ME-Proxy: <xmx:B9eWanrDU6e4ySVoaHvnbQSOn7zdiMlSYF3aOuWYBpwkSmrHI8XL9g>
    <xmx:B9eWanDqrAh0nVOFbiwwxdkbWKks0GPWJLdrF1nnXfyqMGW5vnEVQA>
    <xmx:B9eWakZYrWaDxSbrPGva4bUAVg7F13T6Ko7cqHr6mnjLgQyJdZM4SQ>
    <xmx:B9eWaq4MuCyCLdzviQmgwv49Mdd_-pUWQeEqOX1GWi2-yFwEY3Y23Q>
    <xmx:B9eWalAqw5dHRhUubvt_JW40A0jSsKBddekRjwTLVBb1xgHbp20NUieW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 03/13] firewire: core: add test to detect irm-ignores-bus-manager quirk in config ROM parser
Date: Tue,  1 Sep 2026 22:45:24 +0900
Message-ID: <20260901134534.2386577-4-o-takashi@sakamocchi.jp>
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

Some Canon DV cameras have a quirk where they malfunction as non-root
nodes by ignoring the bus manager. This quirk was supported by commit
6044565af458e ("firewire: core: fix unstable I/O with Canon camcorder")
and refactored by commit 5a43dc9f4ee0 ("firewire: core: detect device
quirk when reading configuration ROM").

Add a KUnit test to verify that the configuration ROM parser detects the
quirk correctly. The configuration ROM content is retrieved from the
following discussion:
https://bugzilla.redhat.com/show_bug.cgi?id=633260

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-parser-test.c | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
index 131c7aa3b224..11c01ef9efd9 100644
--- a/drivers/firewire/config-rom-parser-test.c
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -45,6 +45,41 @@ static const u32 sony_dcr_trv310k_config_rom[] = {
 	0x00000000,
 };
 
+static const u32 canon_mv5i_mc_config_rom[] = {
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
 static const struct parser_test_case {
 	const char *name;
 	const u32 *quadlets;
@@ -67,6 +102,17 @@ static const struct parser_test_case {
 		.expected_cmc = true,
 		.expected_irmc = true,
 	},
+	{
+		.name = "detect_irm_ignores_bus_manager_quirk",
+		.quadlets = canon_mv5i_mc_config_rom,
+		.quadlet_length = ARRAY_SIZE(canon_mv5i_mc_config_rom),
+		.phy_speed_in_self_id = SCODE_100,
+		.expected_speed = SCODE_100,
+		.expected_quirk = FW_DEVICE_QUIRK_IRM_IGNORES_BUS_MANAGER,
+		.expected_max_rec = 8,
+		.expected_cmc = true,
+		.expected_irmc = true,
+	},
 };
 
 // Define parser_test_gen_params.
-- 
2.53.0

