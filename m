Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588142;
	b=44SC6G0Q+7Fcbz2JFZE/JARDH46LHtoMphX/MSwoNpD/v6gQtTHdADaDnV56ddsSDeEj
	 pX4XZvLxAXDoX/hGF/tCOAgF9EpFQ/2EcLJD2kP/f+7+jyHr6n0s1rHaG40xyVGnjR2a7
	 T/uaiiSIgOpjwAax5VPYljWowTKNcegb7/mOiYwX9eqi+bEbEnb0If58bImP33XfQZLVT
	 sxi2IbA8swVeYtWw0DtFBKCEtQKs/37uhvKsy58XahWeUY94ljlWy1qU/gpOdy88HIf5D
	 Lgg5PadsMfP+mYh21sefFmGe7fSX2tEryPb5rZ1ha95LbUrVgP4LvMzM2cuw79Lvyzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tgy/9sSZcLU7CD4oLhBNsPceKIa9XZp/qpueKWvrb6E=;
	b=FTSUMMgC2oYYoIecKd+gdFaQf1GlWwpZ0clwSPo76WE0ZaYrAzEYhZAx18/z8k5YzJfe
	 oiXDMvjTCSIZ2AkPi+idZkQrfs6OJ3PK2we35qYDM2Qp7WlNF3uHaezcvJHkvJ2LERHbG
	 DzQqBwPK35yZqLsa3NSmtW9jvmuB2GPfKhXfMzXnvQxyfN+mYv3oUAfcRaX57GppgrCJF
	 tc10lha6rUf6hJemDJ0+MUy4sDeHB4RbKWNUedzAQ73ZGVHsyQBHI58EQbSS+9YK73VSz
	 q6WB8w4/+CFDP5VEozXCwhVmHMELgrjgBV/16izm1gho1bgcx6ZZYjJiLSXGgyPhBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AGyHD2BB;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A860A6F66
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30A860A6F66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AGyHD2BB
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1421732eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588141; x=1795192941; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgy/9sSZcLU7CD4oLhBNsPceKIa9XZp/qpueKWvrb6E=;
        b=AGyHD2BBSyqtimdYwjzX6BLXFiBqy/4u8A0Ry12C5Xc3R01TduRWtdinqOHl8ilahX
         6a9755BLLaKNLtaV+qcMFBhHJlK+WCiz3cWYR5zvllEXeU1AsoRobqYQLw8tW59q8I5v
         v0B4PuuW/Gz94qgMvA9ZIjYphJrvZhhuZPU3t/NmKV2JojbBWrBkp2hbmTKUDQHu3N5G
         FQ4T3zaztnJAX6Tc9JX1L26C5RJS6qu/vUYjgRefx2FUylrmxzQY3XGgErGhKPfN/RS7
         cGIaOMMJwlYW/bJKkvzWN/bFCDvEujvCjPjNXk1cl5gJKC+fOL9SeN3Q2C2bT+u8+BmM
         Dl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588141; x=1795192941;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgy/9sSZcLU7CD4oLhBNsPceKIa9XZp/qpueKWvrb6E=;
        b=cGLwrpkm2CAsZHgJRV9A70uf7THnXk9XtwaZ9z6t9Zzlhr3SCQRJefayYhqI0pQ3o0
         I8uTsw5y9XACFVEN23VBhzXpsS3ojyUgmbDTfw2Iz6M9G3Ylo+xghVoRbNoAatMWYBEJ
         n8DrnXIVvyhe+IE+5nQDOu89f0V7vSOF8elMIdQD0JP1wMlhbm6e7vHPMNGkD/Evh+fL
         IdMeA2rOPnpeUXdQqgfggYzzfKg3HgoOEMkTwtwYAIfUidqOvByFXVofsmqyrGMcCKj/
         nEr7RwtKOtkMJNpUiKzqgubLfP+GmlR61RoZlvkhdKbHx1kF9P0iXqg6/mDTVqA/Qi/o
         k9ow==
X-Forwarded-Encrypted: i=1; AL+hErFtl+ZzGhqfvkJxK8szHc9rLra/90syoNw3PoKRrPhaJeSb3h/3ZQIiqkbJy8ltW20uVPQprBmssPeSseo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zZp0a26lfC2i89GBNVW6lPsPQepoV+ax4KajNRSWoo11fHSYO
	1804ccMxA7fljT5NrDaFMkIiDEmodWWQ/u7qyABOnr0A9XuTvDBpaWAAHW7BmoOUi+dlC4IQedI
	x6xoDf28omg==
X-Received: from dyrp7.prod.google.com ([2002:a05:693c:69c7:b0:369:a832:e377])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:8284:b0:36a:1f8:a589
 with SMTP id 5a478bee46e88-37966e3b0dfmr2529003eec.27.1794588140579; Fri, 13
 Nov 2026 08:42:20 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:41 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-11-irogers@google.com>
Subject: [PATCH v13 10/21] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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
index 009bd3001ace..a5e8d195f129 100644
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
2.56.1.703.gf848ed807c-goog

