Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D576931714B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270347; cv=none; b=egoArByAs/gfl8rWEVJSDkDvlNWUjSbPf/L/pXXhfZ2Nza9ig/nmOT4IgF0hcYwmLZqDM+iDi5Vu7CFBekVudGxckGNETQ+lzcZE142eEyfRlTs2nFTbVDKyvpai8zpqQWDrq0hbyMnXl2Sb4Of3wA3SiCmQyRby0OuO4lXWrkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270347; c=relaxed/simple;
	bh=5taGjKMAwwK1Jj7zzWQkSt/4Yc7wFSwn21CLkIB+GHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQltfTANhzjTWhW97LhqG3pq/gz9mgUNl4sBl164dp4331Ls7bWllWr89dGkIaIhNczcleLaIm4WYCLyPlyzNiLJrqFAYbwpKCb3gLNZAulgdinoB4ZxY8f2Pv+G9k/T4SxmYydHsSOfTR7FKn/tPR9NQXtxskbgP0T5X+3Heqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=OTbYT++w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kIb7YQRw; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="OTbYT++w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kIb7YQRw"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 23A1DEC0089;
	Tue,  1 Sep 2026 09:45:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 01 Sep 2026 09:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270345; x=
	1788356745; bh=t9GutbLLvX8hxRlobn5XkB9rAHyBFyHjzglK0FhFsfs=; b=O
	TbYT++wBIbM8to2kn61DPAUVpXUMwoLMSD4/mJ/lhw7REPNleX3BgZXYTdvub85r
	RzZBN6FgUEs/qfEMe71vwBiwP+RnbAiBFDQ480QIkvB9loS1s2PZDN7lpMFC3ZCP
	LtjyWUs+sDRuncZ/wHOJvGndUYeSTVxZRxwmGjL3Sbn2q3E+ES6UTjjSiTaIpP8W
	+L+MCQy8tNRf74riCKnfoO5st0DtrlnSWdzmPdahR/+QU+GaXp/vi79+ClarrYNh
	Mxa1rgRTARiWrIEt14yTLJ9TjCkwhtiCkM1qteazBWvZmP/k+AMtCrorlGrCb9hy
	fC1esvmaQxchwa55mfKdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270345; x=1788356745; bh=t
	9GutbLLvX8hxRlobn5XkB9rAHyBFyHjzglK0FhFsfs=; b=kIb7YQRwUBk1IipQc
	tpwnF7R1uFadqzU6/R0U6FYL4AlW3UW64S6yfqU26SV7gQoC/1TT2/71HJucvDMQ
	4dg1QPy7wDt/XROq2lfp3jw1IZSPGwkXtUGdACWtA/qql+kCuG0RgX8/D5yAN+Iu
	897bt8/Cz+iZw9gQBw17G+1ETFlvrBNEYO8qI/zpUOWH6dCPSdiultt99fJs/9TD
	EEnW7CerkeCYLQL9JLb7uhlrKM0eYm9SXeykbyYs2aux1Uz+iE0nxkyhM3amfaTd
	MGUkc8FYB3uuglrM+dFQodbxVD09msHbwfxmtuwqQPncTDtDjN15lP5UhDBpSbgI
	FZhkQ==
X-ME-Sender: <xms:CdeWajPJkcWQ1CKy8v_RrSIG34X8t9IRhjXY5o3NL66lBmmxVvTj6g>
    <xme:CdeWaryK-qexUPKaAr6JoNtwZwf1MJlNKJUR8ux8t9kCRKtj6MN95ZFFf2Am2nFcj
    mgL-2NMMAPzjmYYWpsMnr1ILDo3YUBcK3HxKNVT8ET7w6M8xGHfb04>
X-ME-Received: <xmr:CdeWassv4zgkxtOyBWm-AZJIjUe4ap-9fQcvVFCRFBwuV-7dpt7xKCerX7YiYVReCOlesn444Z2yF0P5SiUZ2BHXA7M9cy6GQTvNEovbzzI>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19U8
    2m4h9QFQmu6mp1Pm9xO/yOijnIrKhW6BcQF5Fa2BGgVvqZ/IAUA0UzKa3N+LDk7eIySmnz
    dq3wXrTyecXBqT/KnvggfaeUm6yxqOoe/bd4mUoYW6nR9CeOdeDm13tbovVXrGfaAI0Ld+
    Bx9Lq6J2AbJxqgTtfT9rGq5rxuvfQ0bxyUqtrnQW9Of3DmigtCqT3Yfbr/91vsoUQBjZb2
    +FtkYBzee/bDX0d04T+06Jhua3uGLFAcl7hOgLbt/JCGkXtYgx7wiVzFxmnD2zt8+arg+g
    gj9Tn6VTBnZgABPdNeMcazk1TZJAMS/cuW6iL4foC1NqP2Z61tmuBVg3zaOQ
X-ME-Proxy: <xmx:CdeWak4JZr1HD_ePpgTusO7Dv-sDO94QmRas2WbuWrjUKXKKSp2Q8w>
    <xmx:CdeWarQdoRDzbBBA7U6IZlwPNaMXo1pCq8gEOnDvEPTeNcHKfHrJIw>
    <xmx:CdeWajpEZmrQZKkOIHtUJPlJmDllnw5B9DKJ_ZmbOtJU3Elx5PF6TQ>
    <xmx:CdeWapK7YQN6DdqaOo9wfCMJgA8HXCuK3ZVqaMstXFAyEhiOl7MctQ>
    <xmx:CdeWahRm4NbSBiJPSXpVwTp-TmIKMg0y0z7gHTys5LWfK19DmfnUSQ86>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 04/13] firewire: core: add test to detect ack-packet-with-invalid-pending-code quirk in config ROM parser
Date: Tue,  1 Sep 2026 22:45:25 +0900
Message-ID: <20260901134534.2386577-5-o-takashi@sakamocchi.jp>
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

MOTU Audio Express has a quirk where it transfers an invalid pending
code when receiving an asynchronous request. This quirk was originally
reported by commit 3a93d082bacf ("ALSA: firewire-motu: add support for
MOTU Audio Express") and later supported by commit 15f9610fc96a
("firewire: core: handle device quirk of MOTU Audio Express").

Add a KUnit test to verify that the configuration ROM parser detects the
quirk correctly. The configuration ROM content is retrieved from the
commit mentioned above.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-parser-test.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
index 11c01ef9efd9..35ebe8a6b611 100644
--- a/drivers/firewire/config-rom-parser-test.c
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -80,6 +80,26 @@ static const u32 canon_mv5i_mc_config_rom[] = {
 	0x00000000,
 };
 
+static const u32 motu_audioexpress_config_rom[] = {
+	0x0410a756,
+	0x31333934,
+	0x20ff7000,
+	0x0001f200,
+	0x000a8a7b,
+	0x0004ef04,
+	0x030001f2,
+	0x0c0083c0,
+	0xd1000002,
+	0x8d000005,
+	0x00031680,
+	0x120001f2,
+	0x13000033,
+	0x17104800,
+	0x00025ef3,
+	0x0001f200,
+	0x000a8a7b,
+};
+
 static const struct parser_test_case {
 	const char *name;
 	const u32 *quadlets;
@@ -113,6 +133,17 @@ static const struct parser_test_case {
 		.expected_cmc = true,
 		.expected_irmc = true,
 	},
+	{
+		.name = "detect_ack_packet_with_invalid_pending_code_quirk",
+		.quadlets = motu_audioexpress_config_rom,
+		.quadlet_length = ARRAY_SIZE(motu_audioexpress_config_rom),
+		.phy_speed_in_self_id = SCODE_400,
+		.expected_speed = SCODE_400,
+		.expected_quirk = FW_DEVICE_QUIRK_ACK_PACKET_WITH_INVALID_PENDING_CODE,
+		.expected_max_rec = 7,
+		.expected_cmc = false,
+		.expected_irmc = false,
+	},
 };
 
 // Define parser_test_gen_params.
-- 
2.53.0

