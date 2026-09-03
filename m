Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D833F929C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419517; cv=none; b=Q3e+s/4yoypaA7+Qn2mgkwerBm/OSgAX5+nULq5uadbxiZoV1f+58AafkFgCtUe+CQVpS7QY8ehqqz+p9esBwgJ6lPCWwIcdpHTK/7grDncXdBYD4p55y5GkoXQTm9bTZ6kstQEmH268wCiIg1LcQysuSN4sbZuvX58DhyH5SX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419517; c=relaxed/simple;
	bh=yoY6Kt8ZGwCSBT+cWfkQRAfW+IQhjCGB8ETnewcra1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SOxes0xYPrrDZ+aQJUKaX4NnFYXr9vsW5zuJNuNJ5199ddTmVtfYK8121ql838aGbHVaQzeekHvUmWsCRgcs4NAdHUeYlGrBuw4Q9+lDvjy7y01AJzxID9UEZ0C/IdOPctZo1SPnjwhBUK0seMUpY4SFuaItjs0QuJxrfR3rxAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rujksxmT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pXJ1KNYs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rujksxmT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pXJ1KNYs"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788419510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cuAu1XAoPEyxMUvUMCV11bN1U80weJx8j8gkVxfkj44=;
	b=rujksxmTTcdeUtPsnLaDIjIhtsSJCygQNBD0dQF4j6soey1sk81G5Mz42AX0Vz6bq9ygz3
	uXX8ijh66g3zFGSKXma57f+ShVWUao73vGr8wSLYyiqPhj0PN0ReWxz3nRl8d17Wrk6S0K
	kt1CxyekoP5Qfc8Xcpm2V7sCINrdHeP5axFQzA4VXrjY23gQLcBjd19JwLGHvQ6jNWscrk
	amUymHxvW8Lf/pWMoL5+lTNH89mmIVm9+fPX251B2UXsa/9dHNX5YutkkBOuOeTWrvfBGb
	HEWKuq7lzOGV1CIERK4VW5qDUCOI5Q+u91uZJ3f/ANHFeR/achG5+eWHVgNV3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788419510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cuAu1XAoPEyxMUvUMCV11bN1U80weJx8j8gkVxfkj44=;
	b=pXJ1KNYsFyXl7gyVrUlbuH2uhYkx0g2ycv9WOSG5uZv+GH5HvifmTh5RqIl3gHM4fXHw9k
	80fEBQjcz++sDcAg==
Date: Thu, 03 Sep 2026 09:11:47 +0200
Subject: [PATCH] timekeeping: Use READ_ONCE/WRITE_ONCE() for ktime_sec to
 prevent tearing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-timekeeping-ktime_sec-v1-1-b33017536aa9@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M3QpAMBiH8VvRe2y1MR+5FUk+/niT0Sap5d6Nw
 9/B83hysAxHVeTJ4mLHuwlQcUTD0pkZgsdgSmSSyzJV4uQNK3CwmcX6oXUYhCwyFFprpfqRQnt
 YTHz/37p5nhcAWKvrZwAAAA==
X-Change-ID: 20260831-timekeeping-ktime_sec-075e744411bd
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419510; l=2085;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yoY6Kt8ZGwCSBT+cWfkQRAfW+IQhjCGB8ETnewcra1I=;
 b=14eIkSUAVf0GayOS/NlyXDZJzfFjOu35C1Uc7MJDJhcpME+oqqGqx5Iabpew0pqwT87Vzy8G5
 36uavP5jF6cDPYIV25vGfVqsS6xihlbnQk8be7gB4v9XgqBsOXgEvKa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The timekeeper update path uses a bulk memcpy() to synchronize the
timekeeper structure, which is not guaranteed to be atomic. This allows for
torn reads in ktime_get_seconds() which bypasses the sequence counter
protection for performance.

To prevent reading a torn ktime_sec value, enforce atomic-like
access by using WRITE_ONCE() for the critical field before the bulk
memcpy() in timekeeping_update_from_shadow(). Correspondingly, use
READ_ONCE() in ktime_get_seconds() to ensure a fresh, consistent load
from memory.

The same was done for xtime_sec and ktime_get_real_seconds() in commit
d7fc133bf91f ("timekeeping: Use READ_ONCE/WRITE_ONCE() for xtime_sec to
prevent tearing").

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/timekeeping.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..d54c4d303db6 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -861,8 +861,10 @@ static void timekeeping_update_from_shadow(struct tk_data *tkd, unsigned int act
 	 *
 	 * Write xtime_sec first so that even if the memcpy() tears the store
 	 * data integrity is provided for ktime_get_real_seconds().
+	 * The same goes for ktime_sec and ktime_get_seconds().
 	 */
 	WRITE_ONCE(tkd->timekeeper.xtime_sec, tk->xtime_sec);
+	WRITE_ONCE(tkd->timekeeper.ktime_sec, tk->ktime_sec);
 	memcpy(&tkd->timekeeper, tk, sizeof(*tk));
 	write_seqcount_end(&tkd->seq);
 }
@@ -1169,7 +1171,7 @@ time64_t ktime_get_seconds(void)
 	struct timekeeper *tk = &tk_core.timekeeper;
 
 	WARN_ON(timekeeping_suspended);
-	return tk->ktime_sec;
+	return READ_ONCE(tk->ktime_sec);
 }
 EXPORT_SYMBOL_GPL(ktime_get_seconds);
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-timekeeping-ktime_sec-075e744411bd

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

