Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843085;
	b=pPcq+IO/sfwlyKwwvosOimGDanhAZp6MVZLBpX3eDKJh2QpAvRJLL6VoVvF84nK4oEm0
	 UcT4DXktYzKiZdACT3MgjDzdcwUod0vt340VGjgMWX6rAlLk9Dygr0DXuR4MPN1ahhLrN
	 Zz3WE77b3ghvGGu+EymHcDd8xK6DtRFfT3esZyiH+qJgr7ZRY2f1z4vUzYLf8zYGA21I+
	 3lPxvG/GzQkmCpUuj7WOMQtnFWbsciW++HZ6ZOxDox1S1wyJR+M0Ox852Pa5bhryy1akJ
	 iXJkeyujfKWPXClhqUGuNuhuIDIYs8HWNBszQ4+TD8VLjHiNf7PQUinEsYFIj7DUy1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843085;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KCPP0dcD8EhOUqbX6pSZ0CLuO8QQgf4ncI0Xmf3yuyY=;
	b=M9K4sHjmgibYEhuX9jFgNHLIhrNvu+G3+dIPSZ82+86qiX9KABDJgNLBVAhLDFSvvgHT
	 5moSMkM5HwwtAlz4bMy/brBqvRZQ2JVr0Ub91owh/oUee1NUAxJauGsFfFMamVKbeQ1f5
	 qUmvK7LdAgbdA6XKn4ZpUg0B7AUujUbgTq4oDj98UkF3Ge8uYf/4r4XIvarn2zOeJm/tW
	 xmH8vwaR3Sn4BOSNVRWKdUP/BAiX/T7Je79+GKqPz7BNtn9sw/Wv0dOFVKB3W5dJuDT/L
	 k1VTX93stFa1zzZDrw/lp8l0ohAwj+7LNENquflfD/Xb0HnmFmlzl6hBHdYa1hkZCeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1537606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1537606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1793843081; x=1794102281;
	bh=KCPP0dcD8EhOUqbX6pSZ0CLuO8QQgf4ncI0Xmf3yuyY=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=O+WjvewahS1O7uDT8Yim7m+7q/1JG9unKziCUB3Ti6maqnoJeIL6y30bPDdqs6v6G
	 YCPJGBZuz0QjvW7DsY7io32qvLwQD1SUs8quAvycFed7kDEXcJH+qbb2Eqy5faP3UK
	 ky6HDmKW2xS+Bsp9aPw/MCa1nsErvvUHpQO7mA3z2v4mjAhiT6AXkWjW+qlqor8K8Y
	 /rBShc8/vbkH+UkgqFGED2zlrmQy4F9CM3PmGZeIItV8zpAvDsiqHCl/HaiDgqjkiB
	 6V1E7P9W6OxLA7uSUk1RdZQ4CmzGKdtBgnAeH9QfWh1r68EBQm7ZZSctHFUpR6qXIh
	 gCdt+X3PN9nrw==
X-Pm-Submission-Id: 4jKlVJ1dv4z2ScX3
From: Miroslav Cimerman <mc@raidlab.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miroslav Cimerman <mc@raidlab.org>
Subject: [PATCH] null_blk: reset throttled state before device setup
Date: Thu,  5 Nov 2026 01:42:45 +0000
Message-ID: <20261105014245.436826-1-mc@raidlab.org>
X-Mailer: git-send-email 2.53.0
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

The NULLB_DEV_FL_THROTTLED flag is set at power on when mbps is set, and
is never cleared. Since commit 00a8cdb84fcb ("null_blk: remove
NULLB_DEV_FL_CONFIGURED on turning off nullb device") mbps can change
when the device is off. After a change to 0, the stale THROTTLED flag
sends I/O into the throttled I/O handler, whose hrtimer_active() runs on
an uninitialized timer, dereferencing a NULL pointer. A crash happens at
power on, as the first I/O that triggers the NULL dereference is
partition scanning I/O. This sequence triggers the crash:

  echo 100 > mbps; echo 1 > power; echo 0 > power; echo 0 > mbps;
  echo 1 > power

Clear the flag at the start of null_add_dev(), as is done in commit
5a4236bf2262 ("null_blk: reset cache state before device setup") for
NULLB_DEV_FL_CACHE. It is set again when mbps is set.

Fixes: 00a8cdb84fcb ("null_blk: remove NULLB_DEV_FL_CONFIGURED on turning off nullb device")
Signed-off-by: Miroslav Cimerman <mc@raidlab.org>
---
 drivers/block/null_blk/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index ec0d7ba4d938..924ec6cfdcaa 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1977,6 +1977,7 @@ static int null_add_dev(struct nullb_device *dev)
 	if (rv)
 		return rv;
 	clear_bit(NULLB_DEV_FL_CACHE, &dev->flags);
+	clear_bit(NULLB_DEV_FL_THROTTLED, &dev->flags);
 
 	nullb = kzalloc_node(sizeof(*nullb), GFP_KERNEL, dev->home_node);
 	if (!nullb) {

base-commit: e6ac1da6a53c5f670bf09e60a2500d15be68d2fc
-- 
2.53.0

