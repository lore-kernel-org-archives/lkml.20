Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418963;
	b=gxSv/eNUoOEePBzw5qr2msdwtrPyn6SjHGdNtmdtQvjDCNtUYKV21t4thUfisLYb3Czh
	 bSoSIDuqkc2y3RoJ4f45FeAP4RyeGCw5/VvzdFZBXOPqYwKFdYXcar6zNoCiKxtc7gFYQ
	 6baqF31qNVqarHD7aTFRDcGiSpAU8ftHS//BsHVEk/v1+6OCqhVYesPPBLM8/cJnVrJmQ
	 v0RMhpbhysd+TivbRW+ZMW8n5opn9xzEUbtaf2Lf5B4sXSX0H1OexoYZY2Dd+xemlhuFY
	 13IL7NhQcg44QmigXNBV6atzm6O0UgRq2nKBXWQWynmPfPjh6iWl5Esdn+RNkxzwzJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=S6fv33QK77wzghtNC0Cd3OQo3Vit3W2WDFQ1ERdQong=;
	b=m/UX+P2GA3Ore3Ere8k5lMESf4GWZHuQCbyd7ddfQSExVJZ4nk5X5CjbANVIoAtOMxJt
	 Lym7GJBiw3xEp6t4fhLgo+Ld/ZOUpx03G+xRv0Ro+y3Qafh9baFV1XNquwTRwjeHiyuVY
	 jIBqUDo+djsTIyGumDaFkWP1V6i8Pxja6sVxxCgE/RWsd6HPTQeH9y7tkQoTlANxc5v3N
	 /SutzYAQRmBUaY/bW8NPlIJo98iJphZLFv5r72PmH83lyaFS3Tp9hPYjY13VxTW3KWvQB
	 ShX0WsE2HHuAnyGkFw1Qg7FtKC2OS0Off9fs2+qncgNPEUhHjGhi8i7tNgIT0YuVm4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AA3BInU5;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641D60A382C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7641D60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AA3BInU5
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3763bd79663so1591600eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418963; x=1795023763; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6fv33QK77wzghtNC0Cd3OQo3Vit3W2WDFQ1ERdQong=;
        b=AA3BInU55WOPqThsWQYw0ucOt47B/zGysQ7L7wH1ReWFL48ZGO0ZyzooKchQdhv1nV
         mAyuwlAfLQp9dKLCTs80s+9V1qKVL019kPzKOfRBf7ZrZJjG9Eeg//TvnOTQM84XZ6/6
         +IyzMhR0MaUTarMIDKccu8CKzdhmDfIuHK8B5Ppwe2W90uTKo1ifZEK5QjKK2xd0uX0r
         jvogJTHNNKV/gPgwHhyj3hnKTDE9Pep4GPV8AYEEesYhxWviW3D9j8LSJk0feVMVfJFr
         1HTIXE9M2qC1dkvNK3HpLxeur1rf0et9610I8QJTab/lD0f82PD4uQkIkhj0+PutasW/
         14Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418963; x=1795023763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6fv33QK77wzghtNC0Cd3OQo3Vit3W2WDFQ1ERdQong=;
        b=gQpkie5vXNFWK1+RfXIL39qnpr/K+iE8zoUXsEnC1Nka7+7N9C65M6dHcqPHRz18z+
         qjVdcXlKAKSE3oO01BI2iwSuW58l/MSPbhT5vYiIbir1eIWveV9yf9WKCuNpPRbR9vJA
         EoTGKplOcq3YAt5vYUE7NTwohk5P7jP9mFzkawD+6QIDXiotl424aLoLzmi3G1ZMpur0
         RZUc+zv9yDJ9AAA1Hs7MA/C0Qz5+PQPpZpJYsd66oy9siF52bOsdrxUhBI/RZ2k5LBu7
         Yy8x9t7v+toFCD9j5mGWn8+9xs9AhKE62oYKclZyn84Fe0kmHTiONTH9j1qtBRxIZzFo
         grew==
X-Forwarded-Encrypted: i=1; AL+hErHnN/A/rRS4jEUOk98TOSpIy7DbeVPvaIhi0IVPvddJ77NxJWHMUhEv3GJkyaKIQNds82HUPhFXUDpo/2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wbsk2DC5iIT1eojya9hlXTxDuiqrwpULmnxmdlKW40eQ6EKBS
	zfsMnl2kRS6p3sGCsjc0d+MwwHcUX5HyeJQ/8542QvWkMdSUn9kwimV8IPNM/FizYW7iXx6G1Hp
	azL2NQQmkhQ==
X-Received: from dyvs23.prod.google.com ([2002:a05:693c:42d7:b0:36d:8068:9180])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8808:20b0:36d:9900:bb92
 with SMTP id 5a478bee46e88-37685c7a7e9mr3478440eec.10.1794418962161; Wed, 11
 Nov 2026 09:42:42 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:03 -0800
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
Message-ID: <20261111174213.3526604-12-irogers@google.com>
Subject: [PATCH v12 11/20] perf dso: Use DEFINE_MUTEX for dso__data_open_lock
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Replace _dso__data_open_lock and its pthread_once() initialization
wrapper dso__data_open_lock() with DEFINE_MUTEX(dso__data_open_lock).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 68 +++++++++++++++++--------------------------
 tools/perf/util/dso.h | 10 +++----
 2 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index cbc4f30e7f23..f0e02062c09c 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -524,25 +524,11 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
 /*
  * Global list of open DSOs and the counter.
  */
-struct mutex _dso__data_open_lock;
+DEFINE_MUTEX(dso__data_open_lock);
 static LIST_HEAD(dso__data_open);
-static long dso__data_open_cnt __guarded_by(&_dso__data_open_lock);
+static long dso__data_open_cnt __guarded_by(&dso__data_open_lock);
 
-static void dso__data_open_lock_init(void)
-{
-	mutex_init(&_dso__data_open_lock);
-}
-
-static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_open_lock)
-{
-	static pthread_once_t data_open_lock_once = PTHREAD_ONCE_INIT;
-
-	pthread_once(&data_open_lock_once, dso__data_open_lock_init);
-
-	return &_dso__data_open_lock;
-}
-
-static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void dso__list_add(struct dso *dso) __must_hold(&dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
 	/* Assume the dso is part of dsos, holding it live while on dso__data_open. */
@@ -550,7 +536,7 @@ static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
+static void dso__list_del(struct dso_data *dso_data) __must_hold(&dso__data_open_lock)
 {
 	list_del_init(&dso_data->open_entry);
 	WARN_ONCE(dso__data_open_cnt <= 0,
@@ -560,7 +546,7 @@ static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_ope
 
 static void close_first_dso(void);
 
-static int do_open(char *name) __must_hold(&_dso__data_open_lock)
+static int do_open(char *name) __must_hold(&dso__data_open_lock)
 {
 	do {
 		int fd = open(name, O_RDONLY|O_CLOEXEC);
@@ -663,7 +649,7 @@ void dso__put_filename(struct dso *dso __maybe_unused, char *filename, bool deco
 }
 
 static int __open_dso(struct dso *dso, struct machine *machine)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	int fd = -EINVAL;
 	char *name;
@@ -696,7 +682,7 @@ static void check_data_close(void);
  * list/count of open DSO objects.
  */
 static int open_dso(struct dso *dso, struct machine *machine)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	int fd;
 	struct nscookie nsc;
@@ -722,7 +708,7 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
+static void close_data_fd(struct dso_data *dso_data) __must_hold(&dso__data_open_lock)
 {
 	if (dso_data->fd >= 0) {
 		close(dso_data->fd);
@@ -739,12 +725,12 @@ static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_ope
  * Close @dso's data file descriptor and updates
  * list/count of open DSO objects.
  */
-static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void close_dso(struct dso *dso) __must_hold(&dso__data_open_lock)
 {
 	close_data_fd(dso__data(dso));
 }
 
-static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
+static void close_first_dso(void) __must_hold(&dso__data_open_lock)
 {
 	struct dso_data *dso_data;
 
@@ -783,7 +769,7 @@ void reset_fd_limit(void)
 	fd_limit = 0;
 }
 
-static bool may_cache_fd(void) __must_hold(&_dso__data_open_lock)
+static bool may_cache_fd(void) __must_hold(&dso__data_open_lock)
 {
 	if (!fd_limit)
 		fd_limit = get_fd_limit();
@@ -799,7 +785,7 @@ static bool may_cache_fd(void) __must_hold(&_dso__data_open_lock)
  * for opened dso file descriptors. The limit is half
  * of the RLIMIT_NOFILE files opened.
 */
-static void check_data_close(void) __must_hold(&_dso__data_open_lock)
+static void check_data_close(void) __must_hold(&dso__data_open_lock)
 {
 	bool cache_fd = may_cache_fd();
 
@@ -815,9 +801,9 @@ static void check_data_close(void) __must_hold(&_dso__data_open_lock)
  */
 void dso__data_close(struct dso *dso)
 {
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 	close_dso(dso);
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 }
 
 static int dso__find_binary_type_locked(struct dso *dso)
@@ -913,7 +899,7 @@ static int dso__find_binary_type_locked(struct dso *dso)
 
 #define FIND_MAX_RETRY  3
 static int __dso__find_binary_type(struct dso *dso)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	int ret;
 	int retry = 0;
@@ -945,15 +931,15 @@ enum dso_binary_type dso__find_binary_type(struct dso *dso)
 {
 	int ret;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 	ret = __dso__find_binary_type(dso);
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 
 	return ret;
 }
 
 static void try_to_open_dso(struct dso *dso, struct machine *machine)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	struct dso_data *dso_data = dso__data(dso);
 
@@ -984,7 +970,7 @@ bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
 	if (dso__data(dso)->status == DSO_DATA_STATUS_ERROR)
 		return false;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	try_to_open_dso(dso, machine);
 
@@ -992,13 +978,13 @@ bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
 	if (*fd >= 0)
 		return true;
 
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return false;
 }
 
 void dso__data_put_fd(struct dso *dso __maybe_unused)
 {
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 }
 
 bool dso__data_status_seen(struct dso *dso, enum dso_data_status_seen by)
@@ -1169,7 +1155,7 @@ static ssize_t file_read(struct dso *dso, struct machine *machine,
 {
 	ssize_t ret;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	/*
 	 * dso__data(dso)->fd might be closed if other thread opened another
@@ -1185,7 +1171,7 @@ static ssize_t file_read(struct dso *dso, struct machine *machine,
 
 	ret = pread(dso__data(dso)->fd, data, DSO__DATA_CACHE_SIZE, offset);
 out:
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return ret;
 }
 
@@ -1292,7 +1278,7 @@ static int file_size(struct dso *dso, struct machine *machine)
 	int ret = 0;
 	struct stat st;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	/*
 	 * dso__data(dso)->fd might be closed if other thread opened another
@@ -1315,7 +1301,7 @@ static int file_size(struct dso *dso, struct machine *machine)
 	dso__data(dso)->file_size = st.st_size;
 
 out:
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return ret;
 }
 
@@ -1520,7 +1506,7 @@ uint16_t dso__e_machine_endian(struct dso *dso, struct machine *machine, uint32_
 		return EM_NONE;
 	}
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	/*
 	 * dso__data(dso)->fd might be closed if other thread opened another
@@ -1533,7 +1519,7 @@ uint16_t dso__e_machine_endian(struct dso *dso, struct machine *machine, uint32_
 	else if (e_flags)
 		*e_flags = 0;
 
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return e_machine;
 }
 
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 0c18c0f3ef88..9e38b3b69e9b 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -354,7 +354,7 @@ DECLARE_RC_STRUCT(dso) {
 	char		 name[];
 };
 
-extern struct mutex _dso__data_open_lock;
+extern struct mutex dso__data_open_lock;
 extern const struct dso_id dso_id_empty;
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b);
@@ -807,7 +807,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 int dso__name_len(const struct dso *dso);
 
 struct dso *dso__get(struct dso *dso);
-void dso__put(struct dso *dso) __must_not_hold(&_dso__data_open_lock);
+void dso__put(struct dso *dso) __must_not_hold(&dso__data_open_lock);
 
 static inline void __dso__zput(struct dso **dso)
 {
@@ -917,9 +917,9 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
  * TODO
 */
 bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
-	__cond_acquires(true, &_dso__data_open_lock);
-void dso__data_put_fd(struct dso *dso) __releases(&_dso__data_open_lock);
-void dso__data_close(struct dso *dso) __must_not_hold(&_dso__data_open_lock);
+	__cond_acquires(true, &dso__data_open_lock);
+void dso__data_put_fd(struct dso *dso) __releases(&dso__data_open_lock);
+void dso__data_close(struct dso *dso) __must_not_hold(&dso__data_open_lock);
 
 int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
-- 
2.56.0.542.g3ef89b7020-goog

