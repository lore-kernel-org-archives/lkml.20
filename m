Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811505;
	b=OfdZYUxEywynzd4VYY8sI9xWs3DWwJ7iUULfZjwsA90tuuxAbliPxUpWXDg36GWvfSYh
	 SpodbL9SIYKLm+RwuR4EqonfLGKIT0z9FtmGrf2apLa/sboL+Ruh1bwxl6n4qF/6NXi8h
	 lh+GiRfkgkuEF1RYAbFPPldcwiPtbqJpSsGZLwv+Vtv14h4RGjoqSUL6sbi/776ITwYO+
	 3yx29aB/T3YoZ7vkUMl902BrT2vT4rB2g70MeUqW/KLcS/56PrnbYUSPjkrbqEcE7KZvB
	 fFL7PkffsMBkmeDXRRO2xd1rYvDIc5CyLYcmnj5CPyNhbQdSQKf/hi+NqJbTct6i1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
	b=ufutl9TriQbLc6bgPgMeVjcfhg+v7iw2NeUr1NrymBfL/qssfnUuvK1B9lmTo/8eoqfr
	 /qtI9Yd8+Hz9R1iEel9ULaCvURI7ZcI8BUctSi3Khpsrn0JSlRbAtjRbCqJGYHWY7cea0
	 ZTDBhUoScJI4sdiF37tuQxDZGS3yF22H5l7usrZ1f8Csu5zZ9uhaS3tCUFJ35AaYb0JZp
	 VWUfobVbk8kikDH7H4MRruWqwb3nsLuOFmuCUaCHr+Tk6jduWgLYGCKFY4Y71ra1OF5Or
	 McA2eTLoBaXS7+/86t6ReRqxs/orspelofsAGArF7CILdFmzYj7RpJd5vPmsxCKiz3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4EEF2kO;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FE606D80E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 462FE606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4EEF2kO
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a1947498bso2159118eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811504; x=1794416304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=d4EEF2kOlJ9ZwT7ZAqTk4BEQB6KcUy0uA9+FyL4MbNN7Zu4rDZNZ0rp/SjEM1SHJ4i
         +t/vAUuu9SCQC3AYeOMIngo6oTmzHstQm5PfvbTiZo4E0zTT9V6oh0nnxsdi583LVoP9
         a7tSdg9pv18ePLJgUJJGIePmp4/HtLBlGIL4B4XqWh6wFW0yt6vcN7QL4y2SPKtHKdOU
         bs9e6FLPI+Lm9iDleUFUew9o5bRM5WOk+/D20EOyGWfHt0Q6311/IX/Ow+PfL0FIwOAS
         sJp03RdEH8YojNlrwn4RUuHSxdKSA/A8BAe5x43K6gSXTYuYOLC0EeO1Cb5cyDhrtx52
         4QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811504; x=1794416304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=JBTqJrIIGTyl6BDMwCpZqiBkjnwprJZVmAOYa3n4sSHurT2CJXPFnDkUZAbfEkqeki
         qHSNZF2ZuoCljDSxyWYc5dbu9WwqJB2jnI26SCqQ0eFyAQvbNCyVgrnZg1jiCzNOUKy6
         ypsfI+F9qU9FelsPmlZ0ynzWQXFS4CUmvSyWTFlQp/NU5HB1tuIxqGX8lE54ycfZJjw+
         WWAFpswJD5cCtOCEbW4naK4sE78W9+2UMBCqLbqGFM63GOV3D6Hj4sMkmnPXC/LrKeFL
         JjOIDBPAYdJW85WN1cwazFdli+Jen/qNE6B177cWj4EWdV5ZLJLG2oItAIgm25vprEV8
         Egiw==
X-Forwarded-Encrypted: i=1; AKwUvBxlsah+hmXNCfXr+K5aKlnhgyOJcVpUYZk09pO2styl/YUvP6dWcd6T83SvbXbtQjQwQer1DndzPSNr9JA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wt6UY/teTp6Jvp2eYfdsKtwisJN+IV2Wb+mtNKj81A4GQtMPg
	ZqcQae3kL4fd+XqdD4uT7/dPFJ9kLzwqA5xGAZ6r0//o82Fg0jQ4odPB
X-Gm-Gg: AYBFou2XWxW4sljPBXLNYNLoVSHt4ABHbxxWqRLBpcrkRG76a09u48+gkwY0JYTnFJn
	ZGjfWBcNsFjTaB1zpxAO1X5nUg1TbxDeGpMl3R9H9qtn77fzdqQVSqrG69fsmsH2FedMQsy8FQ2
	dZKygA4P91lqytrcmakO3eu01AHGBnFzbihpXsUTlxVYMUvskI6ulCUmgvncza7U4yxttHjR0hR
	+H6wdzo7h8wPSBA9rVNw38XaL87RAiFwMNkwa8LmVrQPtqjofFjc6bjHL+ehUuXy0uEBzGZZ1o5
	MCJoW6FXNqsK2b+fMnVL1whChVD4JTL3/s5kIReZAYNV7xeIx82RQdpMA9KzHsI2T02AzT2HMEy
	6dk3G30+ITdlNak+4IgZEx5JG+CsP2wFmwmqi66Nh7FmctaoQ6wofTjXHv+tbKzHZfrlUhAqR1k
	AnQ1nkfW9nDE8/1/4OKbB5fTC9VrpWMvegQuLbmMN0MxDOtaV92zy9szfSKVx9AF/p357RxrLAi
	Bz3EctXBG5Zd9l7h9M1s1PEA266ONYZtn0umgxQ2CnwRnEbsdZZuMDbiwOfJnIKNKQ19Ue2zFz9
	MKRFkPoIyRpegzmjfDeIT4Vt5mkjYykSW0tZvPY=
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr14054524eec.17.1793811503835;
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 20/28] locking/lockdep: Use hazptr to wait for dynamic key lookups
Date: Thu,  5 Nov 2026 00:54:38 +0800
Message-ID: <20261104165504.2430480-21-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Replace the system-wide synchronize_rcu_expedited() in
lockdep_unregister_key() with a hazptr_synchronize() scoped to
the per-key hash bucket.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef2..256f23a9041d 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1308,14 +1309,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
-		if (k == key) {
-			found = true;
-			break;
+	{
+		struct hazptr_ctx ctx;
+		void *bucket = hash_head;
+
+		scoped_guard(hazptr, &ctx, &bucket) {
+			hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
+				if (k == key) {
+					found = true;
+					break;
+				}
+			}
 		}
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6717,11 +6723,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	 *
 	 * Some operations like __qdisc_destroy() will call this in a debug
 	 * kernel, and the network traffic is disabled while waiting, hence
-	 * the delay of the wait matters in debugging cases. Currently use a
-	 * synchronize_rcu_expedited() to speed up the wait at the cost of
-	 * system IPIs. TODO: Replace RCU with hazptr for this.
+	 * the delay of the wait matters in debugging cases. Replace the
+	 * expedited RCU wait with hazptr_synchronize().
 	 */
-	synchronize_rcu_expedited();
+	hazptr_synchronize(keyhashentry(key));
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
-- 
2.43.0

