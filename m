Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D19341068
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270349; cv=none; b=rYk607Se450bidlcDD7fh4SFUiIvh/IJsTHOoNR1pzlbtuLWFN6cHCq+kPeF78fIIHQ97vBnV1Rl2cRD6R1YxkQ2DuDAVzqA16aUUrk5raAMW2X1yjFzAZ5GX7GBzTdFWAw+L48osqhDIp65+Bsg6VTFSR2CM4tQXOiAe9/RAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270349; c=relaxed/simple;
	bh=OOAW/ixLauJNluAv9FZeo/+U3HBq9ayoj8/H6UqVx2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftSre9PEjAFV1/5hgs2utXX0TZXWdN7VOMERRe+/BI7X03KlMlTpF+sebwwe7u+HYKDzqoUCkJajHMtysunix6JE+z/JuDa88dx5j7ft8cnv4n2Tts8GGSadh7Wupzd+de6tfE+APCP3uUYPoTzcEy9jc7C0aBDm2yjZr7vtc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=IBS2S+m9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=L+q0b6Sn; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="IBS2S+m9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L+q0b6Sn"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id ADCC1EC010F;
	Tue,  1 Sep 2026 09:45:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 01 Sep 2026 09:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788270346; x=
	1788356746; bh=67EojhveUNyUfQQ6E5h6S7xVOeXprcHiW2XCsMbVllU=; b=I
	BS2S+m9bs5BRYhN4RfxZmUQEuL4q2qnmJhnHH8WnmcBxL5ysaqjnaFB7t4H0cva5
	8YUbYlEB5eSE1hH436EUMd9qzqsumjRfHidqOdrCh+zIM1KI1gQ2uiKpqSjGcNeX
	azHxXaPp5ZK7O+oRH9IFHs0uevUcX2vJRQoJ3o9WiR67sBB8e0H7W34GKzlPDOlt
	c0SSm8Qz+e+KKbIzCAi7zFKutWtwoXwYoP+5kV1R+FXJ9FvesGH0ML6gKDULpdL5
	VTf6IQodJScXC3O9vd3HJbWdal9fTu44y2b7qxdy1MxiLn0ilzXoQ4poXwgbTcey
	miuo8bokRl6nmJplwVVFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788270346; x=1788356746; bh=6
	7EojhveUNyUfQQ6E5h6S7xVOeXprcHiW2XCsMbVllU=; b=L+q0b6Sn7Ok7bK1lH
	h6LWn+5eIFiWUzL1d1pt9N0WFY5DdVvpzsC6mVv+9zqRsW8xEAAxlfi2oHwIOLrI
	ZPl5tYP/+/1BysNS/ANvkVPBu8hJT7PHG694O+G06iZ26FqxsYbz72Yz+CWgZ1MV
	9Sk0HDeW+ujeSmdZbXkeXTSAIf7JOV1nz5JA5012fVdErL8qMzCHdime2XEryYW8
	m+hgc0jATbWP+UR0wT/O8wPD0lbM6cDAmHBmI5iEXbxqhDtvLxMijTdhUrdjfXSN
	HqZV5Zar3nMYQN1I20xqf56MCT4TdKYT/5WwuuBV7s2YtiOSuMeWfItaW0BJeWUZ
	esScw==
X-ME-Sender: <xms:CteWajM_QWw0HvefDmefq5jQWJOqk3zlEBvImXZrW_SnYvZ9OqQ9xA>
    <xme:CteWarzIswyIfryavJY_W0ZHUJSh-hr98YsP6Y8i4JTN9fa__spX-SHW2Ol03N-hK
    C7BfRKi2ay8IvfPqWeeYFq8BZVJbgK9k9pCrU2Rp5MZCKfVHMuo7Bih>
X-ME-Received: <xmr:CteWasuVdrFS354gYEbunArP3flOlyYFw_Gq3uxaVVTIgIad5jhmK9spNotF3tMWyu_rXcWdbidkdJqZIxU43L7DHYAC2Nv-4RP8fIvBuoQ>
X-ME-Proxy-Cause: dmFkZTFXtr6RCy/pKgLWPJSPBvXFm3znTxzXGxpPXDkaTlm4R2+4gVUR3kwIGcuZcfyzFI
    mpA4qcBzK+fVPECyFm7OelLWJtGrs9mbkwGUlRcdKEEiZnwYGMKFcyR4Lx0nWJEP53tHrp
    INpVKbiZ0MYz+E8QUhStfmq+hzC5ZUT09/4EEktKhZJR2UFAYiRFcGT4eRnAplGYtcc0m4
    kBT9SKdHIAUPI8Vy/KZ2jkA5cHjiwUJ3cAiwR9JLlHkGd1gZLzXEUZwjj+Cs5XElfa9bu9
    n3BhyK/tNfiAgYbIxs/G3L1e09P0C/HIg5r6g0F82tt8zxJVAwrnANwBwWnLSoYkVP19cY
    1DuXyDVjODspya30ffMT85xJFqb1GLUdY8e5s2gnAn1juTvVIXF0sgyf4dK6LDoi5KyWmq
    mI+0N5l9Wlk7vPygy4Nlz5k6+jZT492hdoswKGML203IhudZUFGtFyE9BGo+oZ/tTOIjMX
    HWl9yg6JEa7TPNLEoXhSV+jOeBmnq4zp8C6stdYmNCgyTcLPdiVOj/AwWKXGdWmjQ6RsZh
    GJnCgrMwdZE0Pp0hj0n7agxgWqcHw07n/Oxn2/JCL7GXV+QlZxBexHYPzadnMWkxlI2ITt
    /V2XW7AHSIeNgUT3BvOFXZO7/ZkUpUlqf4smkyKTAyu0WPfWvEB41oNykvRQ
X-ME-Proxy: <xmx:CteWak53zInXaIM9SAUa9eLIPRfBdaoCjmqHY-VPAG_B65s2sbzaGQ>
    <xmx:CteWarTzEYdQFWKHbHtkXDBimjU-fA_QbTK9CrXpVx3vQduvKoHsMg>
    <xmx:CteWajpitYDZFBq4lf8NH9DeK-eTNGcInmwhFHcQpF73Svpd1_0biw>
    <xmx:CteWapKBBUCGkzPAIBjGwdGk4iIudQXJITN4vMt0ZERKayTFMafHXw>
    <xmx:CteWahT82yxv_tkL0bfE2G945S09fX4oy742a9VdSRcX9oFnMEsNy4W0>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:45:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	mistermidi@gmail.com,
	sreekuttan2156239@gmail.com
Subject: [PATCH 05/13] firewire: core: add test to detect unstable-at-s400 quirk in config ROM parser
Date: Tue,  1 Sep 2026 22:45:26 +0900
Message-ID: <20260901134534.2386577-6-o-takashi@sakamocchi.jp>
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

TASCAM FireWire series devices have a quirk where they fail to respond to
asynchronous transactions at S400 speed. This quirk was supported by
commit d52bb3daad3f ("firewire: core: handle device quirk of TASCAM
FW-1884/FW-1804/FW-1082").

Add a KUnit test to verify that the configuration ROM parser detects the
quirk correctly. The configuration ROM content is retrieved from the
author's collection.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/config-rom-parser-test.c | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/firewire/config-rom-parser-test.c b/drivers/firewire/config-rom-parser-test.c
index 35ebe8a6b611..d7c58c7fb995 100644
--- a/drivers/firewire/config-rom-parser-test.c
+++ b/drivers/firewire/config-rom-parser-test.c
@@ -100,6 +100,39 @@ static const u32 motu_audioexpress_config_rom[] = {
 	0x000a8a7b,
 };
 
+static const u32 tascam_fw1884_config_rom[] = {
+	0x040f23c0,
+	0x31333934,
+	0x20ff7002,
+	0x00022eff,
+	0xfe800000,
+	0x0004bccc,
+	0x0300022e,
+	0x0c0083c0,
+	0x8d000006,
+	0xd1000001,
+	0x000347f5,
+	0x1200022e,
+	0x13800000,
+	0xd4000004,
+	0x000289aa,
+	0x00022eff,
+	0xfe800000,
+	0x0002ae47,
+	0x81000002,
+	0x82000006,
+	0x0004a79e,
+	0x00000000,
+	0x00000000,
+	0x54415343,
+	0x414d0000,
+	0x00045443,
+	0x00000000,
+	0x00000000,
+	0x46572d31,
+	0x38383400,
+};
+
 static const struct parser_test_case {
 	const char *name;
 	const u32 *quadlets;
@@ -144,6 +177,17 @@ static const struct parser_test_case {
 		.expected_cmc = false,
 		.expected_irmc = false,
 	},
+	{
+		.name = "detect_unstable_at_s400_quirk",
+		.quadlets = tascam_fw1884_config_rom,
+		.quadlet_length = ARRAY_SIZE(tascam_fw1884_config_rom),
+		.phy_speed_in_self_id = SCODE_400,
+		.expected_speed = SCODE_200,
+		.expected_quirk = FW_DEVICE_QUIRK_UNSTABLE_AT_S400,
+		.expected_max_rec = 7,
+		.expected_cmc = false,
+		.expected_irmc = false,
+	},
 };
 
 // Define parser_test_gen_params.
-- 
2.53.0

