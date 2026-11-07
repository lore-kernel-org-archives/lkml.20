Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026489;
	b=vGRtq3YcnbC7I21stSJzQEJAGdC8lu8wYXP66mQa4a4y0igTE9sGaIxTKmZdZFttDi9I
	 sjYCVUagqzjLLa1p2K/piOOl5S8nRKPthF2o9vUdlNPDYpb4P70TSZLXIbqCXMcgFk9qm
	 tx8kiDI+wIUiqQQyuzw1XB3/XsaaKbASk0IhK7i6XZlhukGSHwKnwkz9etXfcVJ6kSsEq
	 HmIENrGNwFT5qVz3q3akrsQWn8iNzFWwd80TGXOs5FIz6gjnbsw2n1VPInCRuBcALoxUA
	 k7uIeH5vYMbQCaIkk7zDyxaxDuoBb5mlwMID/nttqinKKrYTVZgOYF6uLCYM2LGmJWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
	b=tlMDsGOXaPJ8EOOU5uUMconIzvlWK4Nufp3zlNbyoE/t+ythX4JBiE2b3AXaVuxy63zh
	 FDC3FIEEIdhKeI8iGuOy4c83xRVje5mtjkfayJXxUK9b50VBrvq/2eVqfyoS+YFfT9YRf
	 uejih/Jt36429W/M94Yvy9Myc34ItOm4mSYgA0xovJhn/V5PXroiW2TBW1BRYE0HhuoRY
	 xBAFcyjRBRyVIUrMGnM3h21uBgFSmf+Hq9yN4EM5V24oLXYiacHk/pIvBvjztDnmL9fvU
	 HO9nk9wwwV2wHGomV32R0Q6a4cg5IiHUY4VN81lbI0r0TIouygmGtdSZIBwGWdo2tDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nD2au2Yq;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115E606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6115E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nD2au2Yq
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so1880593c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026488; x=1794631288; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=nD2au2YqEQmz6AmwOuVOqpRmGRzcgVcNtLMKEH/zDWt9OwjUMKwu9GbwicBoxeyCS5
         +d3vRIbt4twGwQm2QeCJ9rAtsbeHCW3RKsxyW7CbIITjaSmUtARQb2L/7DRklGMHMUYD
         kfC96qHovkZkAEQXiJDXYtziSBW/gbDijAGiynrypEhnA+2hjY0K540OF4t0KwGdU/VK
         8LJv94FTCrU0kphkIqrgSl0XifBmP3xO2f/kSIL0k80NL/81Fk2iGFBAMtAf1dD/wWqs
         p/TVIJnbI0/IGtOIFw5SaQVJwqogACbcLZ9Ra4Q87cRmREqHurTINbRHO6hwyworhfg8
         3YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026488; x=1794631288;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj6YsX4Tj4P8BXnzaEP353OTjciTY2+kaiklZ9lU7mc=;
        b=w11wP5eaPZYGEItVwvcpGJ6ewbMbO/3FshWIHSnz3fFUDR0h5VSNrwP4qM4FB4NFQN
         RuPH0AubV1InEy/VnPIOlUJPLqj0PaHVW6CofDSUaReQm2nS6Meu54G2aG5r++ylCk/n
         TVBSTOGp7C198DqnT+zyLQTqJ0+RfJtCqhFdJL19ittWmjGFqZu9vltneuU9tAQO5Rhr
         OavPlBFncsd9N0HYCCOSCNV+t63AMC81aZcWYMR4XrLmOCVRUW2/QFhxdSyCBTukU0wf
         +qrdZgxGV9JKh/YXbtmo2o8HSbeDxdBopvNXdm7WEbjjuOWOyvMT6I3cA+YZG6e8BDvI
         ZGIw==
X-Forwarded-Encrypted: i=1; AKwUvBw7N8KEA1zPnOJ9wwpt6YTMgJXX8TqBkPt2IONbchTaldDCRmM9/JwD+FKz1o2uAj7Cadc4ORO8Y/Mv0/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8reHTCYWUR4lnPJWvVmdKylYxztcv6symQJhHRcj1xcVf2H5yd
	j4yUYoFg+ojFmP5pfOWZsc+O2N+MibI+jGdaurz32x2Kw5BADWobbHW6+CuYleJ4MEMCAkUPeKY
	/gGv0tWaR5Q==
X-Received: from dleb19-n2.prod.google.com ([2002:a05:701b:4253:20b0:18c:3061:3bca])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a86:b0:156:6676:d0e2
 with SMTP id a92af1059eb24-1b25d2fe849mr7410117c88.10.1794026488142; Fri, 06
 Nov 2026 20:41:28 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:51 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-11-irogers@google.com>
Subject: [PATCH v11 10/20] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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
2.56.0.455.g6c5a503b38-goog

