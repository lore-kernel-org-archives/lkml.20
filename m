Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E8509EE0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907557; cv=none; b=amcl9QYyp0pMleQvu5WzG+CT/4OnaiH8yvoTYxQ4Gq84N7yHttSEbl8wj7sYH1YIUV3X1+6iqzun92nWkxzim7x5WCKjIDqK2s1byDOXrso3qx2yB9teNM2cKZeseICXMEbfJipZGemBX5srTMAL7tEbNnbHBbIu/+kmH0Lzn9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907557; c=relaxed/simple;
	bh=Y+CSzOQ79R4zJsVhWVmxTsCY4eA6zFxvVUokey1j4BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBdfBV6ah37Kvo23mo0Kh080MYWubUWY+X8dP7Z6GJ8xgqTVs2hipyf6VOTetedqj8vdzOLsnmgScli1EF0yrr/hHU237GsicAIHU5J8wtGWQuxXLcIInzjzG/YYXdWoriuc1VkBF+fHtO/f71Qh26bg6BHFUJkmgu5BbOpMwvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=jk+uhubM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="jk+uhubM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so722061f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788907550; x=1789512350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTxI2l5PJUI4RUaoloNJUKqD4x2VtZHDxrJ5sZCcTQQ=;
        b=jk+uhubMT5uFsfKUKLRGwHZg4PJxZ9XBJ35OcxJ8e+6RHNcqyNr+1IBc0bfW8K8zJT
         L7kaQZu2J3eFVYBUHxVTjvuKwcJ06UQ7uEr5Vb3RnGn1q4xINpEF5qpuPL129gn/wibz
         9fYuzkBTxQcLdL1FBEe7ZapHHOsTVj3a00u9m6LPB14WMywapUr18N/FfZ3WgoovPVaI
         CLnj9rj/dTlqANL3SrjH036jWJWkCjeCxC7MbZyKLSX7hyM4B4aU/w/Cz0LYXBiPfdv/
         bs1Oo9UqWOOXkzAlb4FGQAUC+a86LZZ8MVYGDOjuav5rGsyPpwBU77VzwEN7+ZG5agg/
         LkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788907550; x=1789512350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTxI2l5PJUI4RUaoloNJUKqD4x2VtZHDxrJ5sZCcTQQ=;
        b=QYd6E5G8udxciS+E6cyD5pEuq0RR/xkqRFv4mbmvvYq1dq77XRfH2BRjiqNAGKkTTn
         JjKNAHwDNkl297/zr1kkEPNLzXSXQ/Ms6qktb2q3PHuUUktouat/Qz3HdSHnzQbHQK4n
         +NevI9DWTH7kaR6LPPL7P9gpVbKZ+RPJLyAJ8YnlgSptFxfFO/+w4h1iNdJUp28ZHmWU
         jOgKmmkR7Li/RY/nSrul3HE5uWMlPw1gGCwwaX/Uf2ZOAbHevhfy14woK607jtjqiobc
         uJ53eknFJIJ2HHkfZB8oPQ2HbTl5dxPC2sj7gxJH33ki1F4JLkf2QF05/Te+14vTJ3eu
         w2lQ==
X-Forwarded-Encrypted: i=1; AKwUvByyfKBuJasIJuNOeqtUaiVH8vA2Q4PYh6Cu5cWgxoqX2Kr//DNI6dMJHHLIqnq9lT6xRRnkq2ih5fQWXng=@vger.kernel.org
X-Gm-Message-State: AFuF++kGR2+iia4eN8NVJRBtf9EQrceKq/796pZFK1j3LACkNeuZA3Uc
	D3K4BhYbsauOyfUXFY6dIAJFRJiT7ajQdLQpjt9a6NycY1koR3i4Bc+K+K87UR1ysw==
X-Gm-Gg: AYBFou1SiIqwyIEmrGoCKssXT6bUYTAkNk+UTyOqfiEPyTYAplNRBvgdPhcotZDU3uc
	XFLZwZSSjYoER6rjt8zduNgMXw3+L6wgtnojj8Vhf9TsBxehGNHIHJua9EDWuelr9a5CaxoBxik
	iUEtuVH6XbtrK/IbEQYcHJBak82my6+V0WDYFWMpzfrvm+Sxh0EHtYNdkdUcsTFIiM06wLO5/tJ
	diV/c2W1IVmnTSJJUbzgD82qjVYrBGZtcaYDfoF7Rg1j3gcdXkXB015m8GmXQKFixr4RB5oo50j
	jcYfYv/OoCuhC2XsJ2IwFh/4THi47ogHAXPX3OCb0xNtOHtP7mnyA9L7jLSg5YFsO/dRiwsIcnr
	vQhkIEgU1qiYIp6IJi6GIcAl6k3upzrHqjCA6cp213hDgR4gMbR+1Us9V0XQxJEo7L/2jAldrwu
	S5yVFSStmVsZhKbu1SYG43DY/h80QLHQBSYUfuriIj9Wd1mFptNSAf6FD+0ci98XAxEIzJSJLrJ
	8V/glXlOHMcQHEGwlX9oW1y+EyWI5TcIFmg
X-Received: by 2002:a05:600c:4752:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d175439dbmr104753715e9.1.1788907549693;
        Tue, 08 Sep 2026 15:45:49 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm553361685e9.14.2026.09.08.15.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:45:48 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: "Daniel J . Ogorchock" <djogorchock@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Silvan Jegen <s.jegen@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [PATCH] HID: nintendo: relax subcommand limiter until cadence is proven
Date: Tue,  8 Sep 2026 23:45:32 +0100
Message-ID: <20260908224532.114357-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

joycon_config_rumble() queues a zero-rumble packet during probe. The
rumble worker sends it as soon as ctlr_state becomes READ, and
joycon_handle_rumble_report() retries it a few more times after
that. This is the first subcommand sent on every connection, and it
goes out before any input reports have been seen, so
consecutive_valid_report_deltas is still 0.
joycon_enforce_subcmd_rate_strict() requires 3 consecutive reports
in the 8-17ms window before it releases a subcommand, so this send
exhausts all 25 attempts and warns, on every connection.

Start each connection on the legacy flat-delay throttle instead of
the cadence-gated one, and switch to the strict limiter from
joycon_parse_report() once JC_SUBCMD_VALID_DELTA_REQ consecutive
reports have actually arrived at a valid cadence. Controllers that
already hit the permanent fallback in
joycon_enforce_subcmd_rate_strict() are left alone.

Found and bisected with a btmon capture over Bluetooth (MediaTek
mt7921e): the three JC_SUBCMD_RATE_MAX_ATTEMPTS warnings on connect
line up exactly with three JC_OUTPUT_RUMBLE_ONLY (0x10) frames sent
by the rumble worker's zero-countdown retries, all before the first
JC_OUTPUT_FULL_REPORT (0x30) frame has had a chance to establish
cadence. Tested on real hardware (official Pro Controller): reliable
first-attempt connect across repeated pairing/reconnect cycles,
versus dropping inside the first ~70 seconds of a fresh connection
about half the time before this change.

Fixes: d750d1480362 ("HID: nintendo: fix rumble rate limiter")
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:Sonnet-5 [Claude Code]
---
 drivers/hid/hid-nintendo.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 43e0f2aaea3b..0a169d0aa719 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1797,8 +1797,12 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	 */
 	if (report_delta_ms >= JC_INPUT_REPORT_MIN_DELTA &&
 	    report_delta_ms <= JC_INPUT_REPORT_MAX_DELTA) {
-		if (ctlr->consecutive_valid_report_deltas < JC_SUBCMD_VALID_DELTA_REQ)
+		if (ctlr->consecutive_valid_report_deltas < JC_SUBCMD_VALID_DELTA_REQ) {
 			ctlr->consecutive_valid_report_deltas++;
+			if (ctlr->consecutive_valid_report_deltas == JC_SUBCMD_VALID_DELTA_REQ &&
+			    ctlr->subcmd_rate_exhaustions < JC_SUBCMD_RATE_MAX_FAILURES)
+				ctlr->subcmd_rate_relaxed = false;
+		}
 	} else {
 		ctlr->consecutive_valid_report_deltas = 0;
 	}
@@ -2730,6 +2734,10 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
 	ctlr->hdev = hdev;
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_INIT;
+	/* Promoted to the strict limiter once cadence is proven, see
+	 * joycon_parse_report().
+	 */
+	ctlr->subcmd_rate_relaxed = true;
 	ctlr->rumble_queue_head = 0;
 	ctlr->rumble_queue_tail = 0;
 	hid_set_drvdata(hdev, ctlr);
-- 
2.55.0

