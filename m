Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809260;
	b=DlCU/6lVvv1ZG9mYyoIKa0H1R2wEKlKrN6adsuPd+TmvXVG3iq2HNKTihVU7Y7VGdmZ7
	 X/uHLVddW3kHDHFVfIgnSzp/vvgjG5ei3c+QSJsPSMrubTMktdsYjMXMiaSVnPnj/F26R
	 BDd785B2OeWvjI0++LU3x923meT8iXa6ta04tAoXJeviL+aGPBsv/eiu8ecctBzew0SRx
	 nwtxQBU/750e6xydSR11K/6CTYngb4UqRkxGsJ2YEiAnEjlwEoWZgN0r/7gEB2UiLvB4J
	 yI7TdcIX0lU3ngqHaMxVrJuYdlam9Y73z00UeqOPY4ijabi13rUA/v4ZyKdtXD4l9Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809260;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ohY8oBfL9HsIxJ4pthQEE7H8EctHPP05752yO5BuBs0=;
	b=rHel/+pAdXihrnRfF8TxgnS3WRkydrO9OeECNLNUGGd4+aEKkzEVOG2UbSlPVrqJHJV4
	 tHemKUUMmI8xKvWZUFqNZ2lqUgHu2eb+Jra/sC1Q54nDEupxGl+vJXjRUczeiJyP0XhQm
	 cce6OsWr0mZCrCoirdtzzDux7U1M3nsozZay9k7V6mZ8dHqR7fFTAKctQOVJ+YON/5XUq
	 cWAk86VhWqrCL9bdQJ74RR24DK+buI7iK+zODrgkgdKEKhlacZfXNNjnoHXRF2FOjkrJz
	 5ZyGLFkV3fEsP8NPv/8Qu0yCB2IVJP7SujlrXNDbAs6cbXDKi6UUSpycFEF/Na0E70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=U5FfbXae;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7C606A889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE7C606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=U5FfbXae
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zjZz3AvtYv5pnFEpIMQaU/5mq50DMy49MjdfgWYYMaI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794809255; v=1; x=1795414055;
 b=U5FfbXaeU+jYNMF0KT9tv0gGfHx6hLcpNHpi5D/znDQVLceXQCShfwamWP0xjpWWZqMXJaen
 +ovZN57sWfFS8DEn6jzGGjr6WXhVrLt8CULp+Kq7jZyDdhOhQfv0JTfJD5AaBcoL3GppH344MYw
 9aGidJTYodMZvX3tHhuS4MXfC2HExYYVxwyQjePkPbBjqSnU0wsw6z/umfswkGIjDe0gIGSlpHs
 Nd/Nb0rKU0ZFF6KbjgwrncgBn1MYe9Bm1eHCUm7C7/tSbJk8g84JTwQS3f9HNmjvmHi78Yo6poD
 0pd2MKQanBI1wVwTtrN19j8QhbBzEkoUdO3zarn52ThDQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3c946c982c1bf979;
	Mon, 16 Nov 2026 06:07:35 +0000
X-Mizu-Trace-ID: 3c946c982c1bf979
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Martin Moosbauer <martinmoosbauer@vivaldi.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: cfg80211: don't call CRDA for a country regdb lacks
Date: Sun, 15 Nov 2026 23:07:23 -0700
Message-ID: <20261116060723.37130-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Connecting to an AP that advertises the country "EU", seen on
Vodafone routers, looks up a country that isn't in regulatory.db.
The lookup falls back to CRDA, nothing answers, and the CRDA timeout
then restores the world domain and drops the user's setting.

CRDA has the same data, so don't ask it for a country that the
loaded regulatory.db lacks.

Fixes: 007f6c5e6eb4 ("cfg80211: support loading regulatory database as firmware file")
Reported-by: Martin Moosbauer <martinmoosbauer@vivaldi.net>
Link: https://lore.kernel.org/linux-wireless/8db36875c56cd9703dee42c7a00b81c9@vivaldi.net/
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Connecting to an AP whose beacons carry Country "EU", with a user
country set:

  kernel                             card          before          after
  7.4-rc1                            MT7925, USB   world after 3s  kept
  7.3.4 (Fedora)                     MT7927, PCIe  world after 3s  kept
  6.18.52, 6.18.63 (Arch)            MT7925, USB   world after 3s  kept
  6.12, 6.6, 6.1, 5.15, 5.10 (Arch)  MT7612, USB   world after 3s  kept

"iw reg set EU" did the same and is now ignored, with no CRDA
request. A CA element is still applied, and with regulatory.db
missing or broken, CRDA is asked as before.

Before 7.4 the database pointer isn't RCU protected, so stable trees
need the plain pointer in the check. That form is what ran on 7.3 and
older above.

 net/wireless/reg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 5cd3880ee384..cf79059b9992 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1125,9 +1125,16 @@ int reg_reload_regdb(void)
 
 static bool reg_query_database(struct regulatory_request *request)
 {
-	if (query_regdb_file(request->alpha2) == 0)
+	int err;
+
+	err = query_regdb_file(request->alpha2);
+	if (!err)
 		return true;
 
+	/* CRDA has the same data, it won't have this country either */
+	if (err == -ENODATA && !IS_ERR_OR_NULL(rcu_access_pointer(global_regdb)))
+		return false;
+
 	if (call_crda(request->alpha2) == 0)
 		return true;
 

base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
-- 
2.56.1

