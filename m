Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792816211;
	b=HzbKQWsW4KUmxrcKe3VTClWGGF1HNllFvv5iXrw9G3l9MGETlXEc2nCjqSUKBXSsvVs1
	 w/BgFy3TG4ZCWrMV3hDvEo9QDvKh1M+B3Z/WlKm/C7oNUXVqtinebChYSST5ZPplqgOwR
	 oX12Y8t32SO9lWHfqbOeoH5Krp7G77Qtf0ApDxoZuYv3E0M+JEqZHaIZ55ozLl6I8Se5V
	 xklY2TgHwf1uWQeiYvHKJrW8nmY4Qw7m7uoQvCjZOPbpPGLLfgXOSqqS54RyMFknT3XXA
	 ip7Tn2xjqyy5LHH6o7NP0IAGyOybcPRQtiUSLIQFxuBKG+yszzWqGR/oqYb5UZf2RmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792816211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9fTxeCcNNzzF29W6dGmG1z9MBljc31aj3PxIdltLkYA=;
	b=gEa9fPQsIQe8P9GUwlyB37gv2a++6TjLaGkA6fBf///QIQJe0tIctSX54bhUxwTKPt4X
	 tJW6688cj+uYXN+g7Ohavx0utyXkbDemgtGt0hgQCpnrXtyba5w97ILK2Dg0rWgIgqihD
	 Kg4JbAFSXTE9j56sdhxkCyk9Y3Z6JAtNp6sAG0XRWA8rArR3sr49HhUbL6mMuEYKzVf7m
	 mQb5FwJfTtQ4QfjT2z24ys0PQ2UeUJnscmVe8tjWL7qyztHSOwsFNN2e+ukOkRiNZzAlp
	 d9vb40+0LA2DsXoUSRfViCJUZndPpDuM+vDHgWtZkLbVFm269HNDZMct4GUpwXaNEAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzi8tAPV;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CD606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzi8tAPV
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso1400662e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792816209; x=1793421009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fTxeCcNNzzF29W6dGmG1z9MBljc31aj3PxIdltLkYA=;
        b=hzi8tAPVKcYUDH8FGM7gnF7SbUQSl1BcNQF2Iwy9MGDSO+BWQ/wJtPW0mA6FPYD2Sx
         Gmy/R8K8ThDhFVVcyg+ltUDc4il8tUuEYs/c7q82vOiVBOE1IoSOjDeYnbRyoCe0c0GM
         GxXvjQKp9XCgpS0g4UD+P5LN/87szacBjzpxVqDfRQkeL/K6hsafKppFaqpZwDgk3to3
         5/iIpo7CTj5UYTxPxFIJHF2S+Tn/W7wPV5r2BnMOTPgozAYvIztDam5qWwC3hj8eca5i
         6Q7+7JktppSrKbdgdPBhswliQ24kuenTkzTu8Zqdv3wewJwd+SWNP/ienz9KVQu8AWth
         O5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792816209; x=1793421009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fTxeCcNNzzF29W6dGmG1z9MBljc31aj3PxIdltLkYA=;
        b=1ilGZQVq83BWWTD11Gvrkc0qlnTplOb1yH8P80qWVkCUsmAtJiILy0qDimrvtLOr3T
         6NUH1yOtemVXhxSsL+4t0HNoD7P2HgPpWXQwStK+XsMRvifsAEJpsk0LV2cnw8iDnMO0
         OrIQKQDXsquJEJJWocERmtIR1IV5OFsKuL388mPLi4PAXoa8eU7PXKnKH7dX9/wz5Whp
         uAGDyRX8kgvCoKfZ0nsOHVYyuM8ueaGz0jv+gOUOhXtkQa0o1ML9iQEw5liS01X0jSPb
         d/ulvP7cFC11HBVYTzYFOM978cPOhf7vVjq5+WVCkh5q9gYTLC4h+IWpmmPwbNBdKiLv
         qXLg==
X-Forwarded-Encrypted: i=1; AKwUvBw3ZlB4wDL6KLFTmcaK2XYd3jyQ0p529Lnat18nuip+acxd6d3DKOheCv5bIzewQv4QluUsMDbH3yV675w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEsU/STdTKxInQppjV3h+yWw91cujorgZHLy8iHWs1wYopro2C
	Sken87rt0aoq3pfQ4paQL/9lBXtx8KRPb7AgHRiIqufc+jWNm9m9raoY+/vSR/chfNU7SA==
X-Gm-Gg: AYBFou1FdwsL9FsjQEnM0jgCVPxE2xw8laWp+gbw4+lTDiETPk4jKch3PAvFfy/pXd5
	aKwoQ/EYoC+lat0Nas9SzcSOVY2GA0/aipFeUGjQX3fIXWafIWZ9dPmvMKCLbYGy6HdIb0q1QaQ
	0mmVe/vK5npbwJiAl7sM8dNK4NfG0pO2UQVGwFd9rsv1dZRsqOKFPhODYosmnm+WTmXYFCKUkcz
	IpjmxVxvpvkvtRVbpFLEyxDGxRl9M+sL0abqvn+1kMjTU+KvY8Sj+OsN3fP/C+PiITCN76Q29eo
	+rMXi2cqZrPoe3BMqKBJ2j6EcU9D5WODKjIAnQZmSjmZcisk8M7tvA7fvnR1wnRRuPV9e1jG1+f
	SOfDDn2JmXT5ebnfDldqrjl7tHrbPfRMXwdL6qUjeqQicKO4wK1CY9k+BcOHpUQj4tIJYOvi90G
	mO+xIjhXzku5KLU1l9BO6/6I+p5i4DWbTd7AUxvTO5DA+PufSEUEsZ4Xcqe+RMlHrZQFbRJfSJo
	hE+pwJwxsV0t62urqORv07m1LtsC7Ih+PIMKrlbNM8HJxRskSmNTuq5H3Cb
X-Received: by 2002:a05:6512:6694:20b0:5bf:b7d1:6488 with SMTP id 2adb3069b0e04-5bfb7d16896mr109075e87.52.1792816208523;
        Fri, 23 Oct 2026 21:30:08 -0700 (PDT)
Received: from localhost.net ([196.240.54.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6b051sm168295e87.14.2026.10.23.21.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:30:08 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+c15de43f1e7fffbb7b9b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Eduard Zateev <hackerowskiy@gmail.com>
Subject: [PATCH] keys: use long workqueue for garbage collection
Date: Sat, 24 Oct 2026 06:29:44 +0200
Message-ID: <20261024042944.52493-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The key garbage collector can wait for RCU grace periods. This can occupy a
normal events worker for a long time and contribute to workqueue lockups.

Queue key GC on system_long_wq because its work may wait for long periods.

Reported-by: syzbot+c15de43f1e7fffbb7b9b@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=c15de43f1e7fffbb7b9b
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 security/keys/gc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/security/keys/gc.c b/security/keys/gc.c
index eda445f815d..b174b8c511b 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -19,6 +19,7 @@ unsigned key_gc_delay = 5 * 60;
  * Reaper for unused keys.
  */
 static void key_garbage_collector(struct work_struct *work);
+/* Key GC may wait for RCU grace periods, so queue it on system_long_wq. */
 DECLARE_WORK(key_gc_work, key_garbage_collector);
 
 /*
@@ -57,7 +58,7 @@ void key_schedule_gc(time64_t gc_at)
 
 	if (gc_at <= now || test_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags)) {
 		kdebug("IMMEDIATE");
-		schedule_work(&key_gc_work);
+		queue_work(system_long_wq, &key_gc_work);
 	} else if (gc_at < key_gc_next_run) {
 		kdebug("DEFERRED");
 		key_gc_next_run = gc_at;
@@ -85,7 +86,7 @@ void key_set_expiry(struct key *key, time64_t expiry)
 void key_schedule_gc_links(void)
 {
 	set_bit(KEY_GC_KEY_EXPIRED, &key_gc_flags);
-	schedule_work(&key_gc_work);
+	queue_work(system_long_wq, &key_gc_work);
 }
 
 /*
@@ -119,7 +120,7 @@ void key_gc_keytype(struct key_type *ktype)
 	set_bit(KEY_GC_REAP_KEYTYPE, &key_gc_flags);
 
 	kdebug("schedule");
-	schedule_work(&key_gc_work);
+	queue_work(system_long_wq, &key_gc_work);
 
 	kdebug("sleep");
 	wait_on_bit(&key_gc_flags, KEY_GC_REAPING_KEYTYPE,
@@ -322,7 +323,7 @@ static void key_garbage_collector(struct work_struct *work)
 	}
 
 	if (gc_state & KEY_GC_REAP_AGAIN)
-		schedule_work(&key_gc_work);
+		queue_work(system_long_wq, &key_gc_work);
 	kleave(" [end %x]", gc_state);
 	return;
 
-- 
2.55.0

