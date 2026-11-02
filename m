Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627975;
	b=ELqohvoWAUhGO8j60mR0DyepCUUfQ5++eM6at/SIGGlh/5YxxOAOcmu3Z6QtaslH39dh
	 PEHHaIWnpoxIwnOf6hjvFyinybcwtgW9rE05YJZ7d4tyFYDkHXS2sedUR8kgXkGlDaAST
	 5EfXbtqBvShWy8ubVcAUdpD/AtF6zQAA/FdPXdzviNOQ765nK+uzuegEBguw7o3sTObDU
	 kRi03khq6OhEYht8jgAYpeh4ELSjnRv/W8+Y8LBBqIxKpOtnl250x6HUFkv+la84vSiHy
	 pTtl6y9/yLwsLB3vCoL61spGU/JvX2pjpI/VISpAM+wt/+7YjmNa4yFrLZ2o1nrq8Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4wvmxRssayt2Gh/JlDXJzYBinssZXZB4IERgvDYW9IY=;
	b=JcfCghytH/64P8OiEeR2S1DQLwzHzJSLmtWzDH+NO5uk5UlmivahwXJLI7Qgw/w6JBno
	 37+VHw/GptMyV7CCc/suVcDvJqOuCZGbCBqIiHJ7g/UNsenMrYzcpydEV8QQe2yMMybo1
	 Q4nvMg6dcwl6Gb4FWDoolryfP1gDsrDkIqCZPmwEBrIHJaOpy2ZC+vBA5+bD+YhAddtov
	 b3qlY+lRgrlhNe5FaFh5radjIqWfHrg5J9TuU4/r+8wQ1CNr6yXxl1jdOVPCMn5/0h8Xi
	 T3ZhhmDanZGGoy0lresMwi1qdtRQjNJd0A/5b+lfupWQTsE2twZEvWzxXUrw5l6eHXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyD8COu+;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC760A2630
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AC760A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyD8COu+
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34903905e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627973; x=1794232773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wvmxRssayt2Gh/JlDXJzYBinssZXZB4IERgvDYW9IY=;
        b=vyD8COu+frj4RNaBSRa57YJmHsoCzs2zU3MPsoqpSW7zJ58Oux6nDakb61yQZVMsvk
         XY4C8Xkohyp0A4mLJ9+HMH9zb1kokJF6nfADDFmzBLGZdcmJVfNq+wMxZcsQxOlFow+G
         ZIEQb+zOxL30lgzK3586obNv6TXVZlaqL4WU+wWHPLONDH/qcxVo8OHLfA46pL8SKo9A
         U+cIvzaEaX3/xImY1zmsVwiOz/ZfoX4h4/qmH6Q5v6u9Nx0xIJpgqmwWY7vw2JnyeG8K
         2EmRn91UL8NezbJ9Q6tYhu8e5M5JdvEd2P0bpWx6AH2kmYJCv3oROp8kGBIDrNlCscbO
         6gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627973; x=1794232773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wvmxRssayt2Gh/JlDXJzYBinssZXZB4IERgvDYW9IY=;
        b=iWrJ6xkWzWGc8YNp1qpHQMHvjmUlD9P61CsWOU7+BAfpxVPefP3fHYHyNsTgtHhNZP
         QU+FzzFocVpKGKFbnqcMH7NLwEi7NEFO2Hfdv+jm4GccF9omVel6J3TDHUyhThDFxsws
         Bf6NaMbhHQU/9fXTHeaky1eEDR0WVKZxwhiYZI75MFfsGjcOO0t1MIn/HLw+3lDLgIrX
         d02yRpgJ0sbyF+m4mqhfrmo9fMiWiFsx1bo3FdJAkRcfIJWyAshPMtliWWUU40F+v7By
         diiFoc6xb+gp6J4BzyEyB5zp+oj/jAEt+abdAccjMgA4aDhqp/AKkrx6DzK4xfKWAS7i
         DAug==
X-Forwarded-Encrypted: i=1; AKwUvBy9tRu71jU2Ll7Ca3OIWz8AHiJ3PCdDwl5TuQZpDgjG4QgfmrJrZWvYCfQwIDW4CLNCaoAlqIkPWDWqSo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8mL0CT2y7PD4r4E1MDX+7Hgr58Yk7PHCTN0ISSKUQ44wB3QXv
	j4cnULqoMRFea21e68cRhWGGbkemIYQkj/OAD50FfoWk6mByhIG2mcM=
X-Gm-Gg: AYBFou1EcbM5ZeSHyStnA1ydbQS4jMKq5Zt/SCYGXEKgX9shSkn4dBKVQMFBBAC2BSR
	ejk7elw5Ygt96t7aB63R92jqCVXh6UmG68RXxbgyCfHS+X4S+lYQVYUQC32tTaJ2pjW3gJ/s//6
	b0kqoO6nGgchjwy+N9CIYE1lkd28uHARdQTgMaawkXXoP6mZrjM+2MTj8WUjnoMBytfc8ZTViaZ
	K9hfYEmdGeFwknqAs6yYhr9ciKN2qa0nfdEQSglBmpbN0sO160BaOyTElokw299B0E5iFYOOV4b
	Ifw6JfmgaSb7+IJy4TpeaTLBxB/HUDExvupiWqvaBRqSme69S5+MmNyzOljb4EgJV0dClHn3sRN
	M5kGax9iN0Ti+ijD/yl89uERzzGAloYid0n4ElcniLlkQLLYxGJD00hEkHxLLfTL3KjuAA7PjEW
	Og0Dj3RbdtOPPCaeS0dk5JoiHnPQChVZF8jSeWIGfz4J7Uyh9BwsYbRj1G0T9hwICAIojvdkhtd
	Ve0m44WWGr3lJjyvBnu5jEGf4xLs3gIyF4jn4Atb3cQr7tLDaMD3UfrdExyYpNLliAOG8AGwF5z
	pz6f+hXK/L/9
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr242811975e9.14.1793627973338;
        Mon, 02 Nov 2026 05:59:33 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm352680265e9.12.2026.11.02.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:59:32 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: briannorris@chromium.org,
	francesco@dolcini.it
Cc: bzhao@marvell.com,
	akarwar@marvell.com,
	linville@tuxdriver.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 1/2] wifi: mwifiex: validate ext_scan buf_size against event buffer length
Date: Mon,  2 Nov 2026 13:59:29 +0000
Message-ID: <20261102135930.701845-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102135930.701845-1-tristan@talencesecurity.com>
References: <20261102135930.701845-1-tristan@talencesecurity.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mwifiex_handle_event_ext_scan_report() uses the firmware-provided
buf_size to determine how much scan response data to parse, but never
checks it against the actual event buffer length. A firmware response
with an inflated buf_size causes reads past the event buffer.

Add a check that the declared buf_size plus the event header does not
exceed the event skb length before parsing scan results.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..77f55a3f9b450 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2631,6 +2631,15 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 	u8 *scan_resp = buf + sizeof(struct mwifiex_event_scan_result);
 	u16 scan_resp_size = le16_to_cpu(event_scan->buf_size);
 
+	if (sizeof(struct mwifiex_event_scan_result) + scan_resp_size >
+	    adapter->event_skb->len) {
+		mwifiex_dbg(adapter, ERROR,
+			    "EXT_SCAN: buf_size %u exceeds event length %u\n",
+			    scan_resp_size, adapter->event_skb->len);
+		ret = -1;
+		goto check_next_scan;
+	}
+
 	if (num_of_set > MWIFIEX_MAX_AP) {
 		mwifiex_dbg(adapter, ERROR,
 			    "EXT_SCAN: Invalid number of AP returned (%d)!!\n",
-- 
2.47.3

