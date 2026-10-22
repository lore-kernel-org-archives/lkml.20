Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700133;
	b=rUcCHnlAxv7zfmraWx4F1/lIMjfq1Ffn8ct+5AtJVF6uZ4bAAxQGwrUzA/xeMaor/vBv
	 p1W3iocVz07QDVCRi23mXsTNlC1oCFq/qRFfFzBuMMtdMsBsZiRdKtJSUkcJaES1WdivY
	 C+a55ot/8BUhuqSuezKPJ1/o/jbWnjf5Te6B5qogHl/Mo+tJDTJWSidTimBM0qKnBofER
	 AdZGyE/4NffvqDSakq+mm5QTgKtq4pCvXs7PyLWsPmQX7/8gb1av8O1FC1Iam2EGzl5Dn
	 +O4FAbAN820zCAto/by/Akfnj6uBQO4MBqhqjW6/y6ljgEX6lWOJEX9qdcNXaFA2cbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mdDZk+7LKcsMH2iquwAxU7dTQOtp6sq4vfpfrMCEV+o=;
	b=1XC2KbcflZZz8BFAY+nLbBdSKuBUfA/9JKEkydtI9zneFtlM4OuvSDkH1rim5K4ZN5X9
	 r1SVhOb13juTM4mKj/Zr9xyHY7/Te+AM7yJEZwH06IAp+QjtK+pTV87mOX8lQdFWrNJSt
	 W88TSVBWo5oD2PCJPS2YtzXWcupRCrrTHCQxwHtHav+KgueJgb8YgaliSq2fjp0BmGeQU
	 VsHv05q+CY+S1yBgW8YbJxMv8nxlBtfv8NSY+spAGfc0nCsj0T+J+wZRQGX2bVOpz1QXc
	 ReNb1uhVO2cmCzaW15780yQXT8JEZB8tHD0UrbH/xuYl+3BWyOP//tbrjIRimTsjg9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nP0Px44c;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3653606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3653606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nP0Px44c
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so1526322eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700132; x=1793304932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdDZk+7LKcsMH2iquwAxU7dTQOtp6sq4vfpfrMCEV+o=;
        b=nP0Px44cgoXkR8MdCF4M66/k5Imy6By3aoc7QkzGJTZT4C9lp6BWZmNV80tg/d/7x+
         TQuM4dhc3VY4Znpqt06admKj43XiEsQeL+bSByyd/7p/pFD0KJxtqwqYDQbB1zj6Hf+P
         TGPhV1K849c+sU1WIWIb3BWGzhau+G5Zer3zgbudnvglfs6Wq8ipQeHXmz23CImdeDrr
         DhGWa6VyFm55HO2YHjVel3yFYTzenffkVuPmnNtaQVZp1+STTmOsqoZdTN2UkZlxEhk4
         cOwfd3M84q8aRGoBVw+u9qEnH8owV95TpG/W8xxLoM4IUpZwrV7l8Yz9krLdT0GGUkby
         U13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700132; x=1793304932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdDZk+7LKcsMH2iquwAxU7dTQOtp6sq4vfpfrMCEV+o=;
        b=pdIHIu6jvyAJe9ihsjelIz4G8Rz0pHYNt4hk/wrisSOC2YOTo4euwmW/C4nc9lCECr
         ohFDcmYYzb5rTzT/CMItMhMI21Xm/FetYpy+eftkit8Vshgkpcvkd+Q1d3mWP7cICk4V
         Wg0nrFr3XmpY9yS/rB9DeDEr3veFtU+jXLLVDnc7mN2MfMQszB0c6wE08FitqYGIOvBY
         nkkonPjEkawuIZyty3tQPYx7iqKJ+iJVn7JbOhZX4ULfAtUlJtiz9WIr2cvnnpVNQSKp
         E1ez3/ZFlsfoUhRGcyMg2KnltJeLpfinjKp71UT9VUp8eH6zieXbNN9Ma0PvDpHpye5A
         aGsw==
X-Forwarded-Encrypted: i=1; AKwUvBwPn2FvIrMXFPsKy5QycnJ5uCi2ZT1iZkPrfqW+VlMCuzMlCxQFVVaIMD7BEXhhiN49W5b+dCaKsgknSa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE/ZcEWR7iNzzMdbg6y+KErXgh1bp3TdQaXMQQW/38duXGvlUx
	sqiNC6Pqm5Ul5g+yEL+yMyomOJ3JRuK2feNL77aB7igw9ZFd/Iwii74L8Bh+JTcK21rSZWXmJyT
	OKl+Qk/S0qw==
X-Received: from dlbur22-n2.prod.google.com ([2002:a05:7022:ea56:20b0:191:1417:6caa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:370b:b0:14e:d0ba:75af
 with SMTP id a92af1059eb24-19599bd3a04mr550541c88.6.1792700131706; Thu, 22
 Oct 2026 13:15:31 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:43 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-11-irogers@google.com>
Subject: [PATCH v8 10/19] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
index fa5669709eb3..d6b0a1a4dac9 100644
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
2.56.0.307.g5fe7bd680c-goog

