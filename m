Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418961;
	b=WgFTHrK8z8/AEukTqqhSU67l7ncHTghZ6l45GtQnJPFmXcOhfyFiQ0sjTAU8W0T7n998
	 VBFQrHQqqM7VjAkUpdG5OkcnMIzKk9eEQIkXA9VhHowgwSaYHt3CG1gqgFf4VA+3ZxJBA
	 ZzE1VBDOu1rPHcf0nKJlIeN18jd1w518EQV9H+ex6p2FT5ODKQ/y7j0bo0tAADBG8yedR
	 F/TYw4g/lnGi5cdnoVjuQt+D5gbcfg859cAP8dyn4o78D2EK8Y0nPY9SXeRhSLL4f1S+/
	 plLj3FFf0q2G4ZBwKQ9t1xi6VdImzDj/Oh2cpgvzk81O96mAr6Bi6qhUKx7ZEPrZM0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Q33zUquzaxzwFL46zB7BQvJ6nt/PPHjvDq2pz1nWxko=;
	b=Ce5AA5b5pj5MgdScXIKeziLOltugGXyWeTlqRmPE4EfxF96Vi7bcXWN5GrLJxY4kDUuV
	 7claiI3SYtgXrffBPTSqRYFjybatsK1pv34v0K4veo0SQz1Hhmjbl2Hun+bUmGj7U0URu
	 iS4cGDhW9DnHbMtVibisSyOu1aBQusT7urk0Zg6G4yEo1VreHJGEYQ2UkLYr4mpkHNxka
	 TJlX2HlK3QNl9iy7dhIrOlYvZnmRaevM5LTif3xsZ/YfSrhMb7PCFDmkPQJYIgvV3Pd3k
	 nDuO3fiX/9cqt2zJkrMKM+YwL/IRvogTxyYB0YpFzF40dSG4upNRjQSaLI9JVLDycgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hcWXFxMz;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1260A381D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F1260A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hcWXFxMz
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso69891eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418960; x=1795023760; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q33zUquzaxzwFL46zB7BQvJ6nt/PPHjvDq2pz1nWxko=;
        b=hcWXFxMz7XODvdK0V2Pka6XWcyXAh/2wuo9M02uzyDTgy0QmzL9ZayZWyBUDtHYGdR
         JpNh3fcsBimUJ1SBL9h/v5fv2Zu0dmpyGWGPrwCKJ2D0xyjKnSyuiOfeUbqmBDz0p9Lk
         LuqWRFmBBu0o7qBI4Hz8z8DTwMMSRSp4r3kmi+M1+vpdgqvkAHZwV0U60OtHpS7/+pCd
         Rh+koRSariK+ExbdGt2yjwnpL7PYL3k3VfLZKnT/yQy9KUQa5Ar+b5vyB2KinHJ+pkNE
         /BGGBBtHuNU6KsjQCnWfRQw/oNJlX5sksR+SADpmZc/JjniTwv6FcGj9zoAsrolpktA4
         r3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418960; x=1795023760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q33zUquzaxzwFL46zB7BQvJ6nt/PPHjvDq2pz1nWxko=;
        b=zM2vYuSQgtLw3JJ4g6srHB7iOqpwwFTYSN5Typ+v7SZcJvFQNFcdRB6EsI7Ce089db
         +pWgc8jfJRTDNl5p/ywHCz2VspiEnih1Unb2S/Ck4dWyO4UFJI/mr2WNQweQJXECQ09J
         8DUuMn5tQUKXOSXI0fOcv4dTfS4TM7O1bCOszxKZuLlWrNX6TyztxOSW5p1lOjfAzolT
         WooW0VC8pAqhiebN2yslGdnC4d65COyF/PqN0mG+xa/KHFY/BIBfnT1Xg62Ve+ZU+Qyd
         8bYKd2J3mHHRJJENlnddengt9PlDpEnWQLosgDU8Tgaled5GQJFhggUiy4uumRb85W/A
         1MKA==
X-Forwarded-Encrypted: i=1; AL+hErG2ZmCl6hG/Rx/T9yTqi/10itewFBwLWJGsKmq/Z8tyTycsRatlYr3pNu4PLZe6MXsn6tM8DYzK2+aekDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/yc7RMKsXEYELfavLg+xuNDzQqLuPqxfQwoc6am2chEkT4aMa
	YghDN2GbltD01LFRFeS0fORw3biKOuAXmKWczN3wd0xYl7ZjVmcmWTo/fQEL0DBuFyMECWGhjLD
	vIlkv8cURNQ==
X-Received: from dlbtu7.prod.google.com ([2002:a05:7022:3c07:b0:184:b43a:63ac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1701:b0:1b2:6b17:28e6
 with SMTP id a92af1059eb24-1b4f5e83172mr125327c88.9.1794418959955; Wed, 11
 Nov 2026 09:42:39 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:02 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-11-irogers@google.com>
Subject: [PATCH v12 10/20] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

close_data_fd() and dso__list_del() only operate on struct dso_data
fields, while close_first_dso() retrieves a struct dso_data * from
dso__data_open. Pass struct dso_data * directly to close_data_fd() and
dso__list_del() so close_first_dso() does not need to recover a
struct dso * from struct dso_data *.

This removes the REFCNT_CHECKING dso pointer from struct dso_data and
avoids dropping _dso__data_open_lock in dso__list_del() to call
dso__put(), preventing lock-order inversions and races during EMFILE
eviction.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 44 ++++++++++++-------------------------------
 tools/perf/util/dso.h |  3 ---
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 24ff066b9878..cbc4f30e7f23 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "dso.h"
 
+#include <assert.h>
 #include <errno.h>
 #include <stdlib.h>
 
@@ -544,22 +545,14 @@ static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_op
 static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
-#ifdef REFCNT_CHECKING
-	dso__data(dso)->dso = dso__get(dso);
-#endif
-	/* Assume the dso is part of dsos, hence the optional reference count above. */
+	/* Assume the dso is part of dsos, holding it live while on dso__data_open. */
 	assert(dso__dsos(dso));
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	list_del_init(&dso__data(dso)->open_entry);
-#ifdef REFCNT_CHECKING
-	mutex_unlock(dso__data_open_lock());
-	dso__put(dso__data(dso)->dso);
-	mutex_lock(dso__data_open_lock());
-#endif
+	list_del_init(&dso_data->open_entry);
 	WARN_ONCE(dso__data_open_cnt <= 0,
 		  "DSO data fd counter out of bounds.");
 	dso__data_open_cnt--;
@@ -729,13 +722,13 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	if (dso__data(dso)->fd >= 0) {
-		close(dso__data(dso)->fd);
-		dso__data(dso)->fd = -1;
-		dso__data(dso)->file_size = 0;
-		dso__list_del(dso);
+	if (dso_data->fd >= 0) {
+		close(dso_data->fd);
+		dso_data->fd = -1;
+		dso_data->file_size = 0;
+		dso__list_del(dso_data);
 	}
 }
 
@@ -748,21 +741,15 @@ static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
  */
 static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
-	close_data_fd(dso);
+	close_data_fd(dso__data(dso));
 }
 
 static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
 {
 	struct dso_data *dso_data;
-	struct dso *dso;
 
 	dso_data = list_first_entry(&dso__data_open, struct dso_data, open_entry);
-#ifdef REFCNT_CHECKING
-	dso = dso_data->dso;
-#else
-	dso = container_of(dso_data, struct dso, data);
-#endif
-	close_dso(dso);
+	close_data_fd(dso_data);
 }
 
 static rlim_t get_fd_limit(void)
@@ -1858,9 +1845,6 @@ struct dso *dso__new_id(const char *name, const struct dso_id *id)
 		data->fd = -1;
 		data->status = DSO_DATA_STATUS_UNKNOWN;
 		INIT_LIST_HEAD(&data->open_entry);
-#ifdef REFCNT_CHECKING
-		data->dso = NULL; /* Set when on the open_entry list. */
-#endif
 	}
 	return res;
 }
@@ -1918,10 +1902,6 @@ struct dso *dso__get(struct dso *dso)
 
 void dso__put(struct dso *dso)
 {
-#ifdef REFCNT_CHECKING
-	if (dso && dso__data(dso) && refcount_read(&RC_CHK_ACCESS(dso)->refcnt) == 2)
-		dso__data_close(dso);
-#endif
 	if (dso && refcount_dec_and_test(&RC_CHK_ACCESS(dso)->refcnt))
 		dso__delete(dso);
 	else
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index f6c60bafcde1..0c18c0f3ef88 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -261,9 +261,6 @@ struct dso_cache {
 struct dso_data {
 	struct rb_root	 cache;
 	struct list_head open_entry;
-#ifdef REFCNT_CHECKING
-	struct dso	 *dso;
-#endif
 	int		 fd;
 	int		 status;
 	u32		 status_seen;
-- 
2.56.0.542.g3ef89b7020-goog

