Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026483;
	b=1czsi5SVz8oeYm/aI/lXbSdWjx9RMBArXfRpHdA1v20xPoJqTRB7EU6Aig+ZIQEucY2l
	 o5HhgHBV778wJNZTLnGa6m47FOXGtC/ZxglF7S3MQqoqNitjqlyF+LY7lJawkGiH2jyiO
	 3iSlEnCYmxYTa/Nl4nU/O+zUqxuU2L0bMIPVaWAlnU0uSfKNrLPrpkucOsDUvq9qW9yo8
	 05MPBTTmcDFqi9ttg0muVK9Xr1IBogYrUY9SsURAKB1zlI99LgO6rWMKtVymHoOPO9kT4
	 bm+yGo8mCuHpzmkJX3mIEZErZkCp7F9cHBTNXK/rNbL4xjn9Gc4DAzNAkfXbOqlAgVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lOeR8RzemfDpp4D3hAa7zuXnUCxjXzQiGwjs9g5Q/fs=;
	b=HSzskE29HXdM1NsSP3LVIT0bNOkVtuXs/im/KdX+6OJhhA2hWAZTAiiQV/imW+IHDNz/
	 BQQwLRPun+Gh7pSCuX8volkEu5wVwL7pd1lVPzZN6m4PeBX5ow8EBw18YeD58MlVvbEB4
	 R/hXdLxwTWRFYKSht1+ePqPXw5BfB9sVCjiI9dhMNRU0b7RrZTDJSCFUxsxLx5f0rNMcS
	 gsYCLfAdBLQ/Ekkx0POo1LF5EalwnTa8gkcmwVIiWL8Vi3gyCEZmdSI5IARXOIO/AZj7I
	 VAn8iBmr4vVEHHTU8hLrghS2Z1sTDredA7kDvI2tpwe/TFRGCc5P73auyXIuQT4C6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PMVORd6a;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96F606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B96F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PMVORd6a
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso2693768eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026481; x=1794631281; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOeR8RzemfDpp4D3hAa7zuXnUCxjXzQiGwjs9g5Q/fs=;
        b=PMVORd6anxH86cR/gIj8ALq/yxEF6PEqaTWgCLoXHljX6CBykRRvmDGYihe3j3VF/O
         KH795DhVmNzI8N56WIp1w1gVVRX8noDSBu/eD/O5QXso/opVCRWTGhbf3jZVmIjKYpmJ
         y9g1BZsi7gd1VtLSxBJAgPl7fif4ggRJkaKePO2P3OApt9mhutUcylot93CT1H7AD0Mx
         9mKdcukCFfA04Kko6lWY17F26hQ0UjU1sBzu+pwpT3QgK/8ukqySNLNNf7GcKf6Bb6kq
         7lZfNkjCpRnRNOuH4cM/mJMSJG9dEZqOFWOrJILfd/FB+9hnoWKNvRA2q4mOB/cySmjm
         cSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026481; x=1794631281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOeR8RzemfDpp4D3hAa7zuXnUCxjXzQiGwjs9g5Q/fs=;
        b=sp6ekcrc5XT49OZCcjY8jMImjiyUo7LH2NxV9F+sMqSFMBCZTYD9QDOzL4kwVCz+HJ
         ffRPrQ8qblVUQWpTiOXJUrzyZnDsqI+XUvqBjUv/qvLWjzTCWMbCLMhGLlGNeDvUcUCj
         f0qtLHq7r5l0Dl6zaYj13Zq7P1JueGsSnxbPPGbsocDm9YhtZXLTBab3XsTPShy1WvE/
         g5fFqsCAePg/2IX1KoPh1eZEoQ3SkoRZjvwDXISjrUrPbTdxGzsQO8GbQ3lxMzT6md5o
         L6Wf9O1IF8nPZJF9YKVZp1xt7Hp3F7Vo86ww4cXuYf84uGtELfzozSgcG1CPmMvYTM70
         mgQg==
X-Forwarded-Encrypted: i=1; AL+hErFby23WzqGfgVN5+smhYw6cj1Ix6GKEWPCp3ipdjehMsPtQRDP8BPYGAAMrEdhzY5sM2L+Ag2xHEvDY32E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LKvGy7lRF4TVM7Vn+TMjkGXl8T98NIb968e6u2FD4/viFcvzN
	2ZmGsqqj0fAOKUUOspG4/jeB7MKhke6+R3q1uyrWsSl7rDbI51J2/EUwqa5g/WHU+4ta3RMx6dD
	hHH4aDcbl3w==
X-Received: from dybmb9.prod.google.com ([2002:a05:7301:1909:b0:36f:7f0f:e2e1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1525:b0:369:f9c4:1fda
 with SMTP id 5a478bee46e88-36f7671e12fmr5713721eec.27.1794026480981; Fri, 06
 Nov 2026 20:41:20 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:48 -0800
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
Message-ID: <20261107044102.1506626-8-irogers@google.com>
Subject: [PATCH v11 07/20] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock, and machine__findnew_vdso() and
__machine__findnew_compat() initialized machine->vdso_info and created
temporary VDSO files without synchronization. Acquire
machine->dsos.lock in write mode across machine->vdso_info
initialization, duplicate checking via __dsos__find(), temporary file
creation, dso__set_long_name(), and __dsos__add().

Fixes: f649ed80f3ca ("perf dsos: Tidy reference counting and locking")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c |  8 ++++++-
 tools/perf/util/dsos.h |  2 ++
 tools/perf/util/vdso.c | 52 +++++++++++++++++++++++++++---------------
 3 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a2cd37bd1660..1574c8885d78 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -284,12 +284,18 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 	return res;
 }
 
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock)
+{
+	return __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, write_locked);
+}
+
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short)
 {
 	struct dso *res;
 
 	down_read(&dsos->lock);
-	res = __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, /*write_locked=*/false);
+	res = __dsos__find(dsos, name, cmp_short, /*write_locked=*/false);
 	up_read(&dsos->lock);
 	return res;
 }
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index a26774950866..dbd06f420753 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -30,6 +30,8 @@ void dsos__exit(struct dsos *dsos);
 
 int __dsos__add(struct dsos *dsos, struct dso *dso);
 int dsos__add(struct dsos *dsos, struct dso *dso);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..93828e660672 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -131,8 +131,13 @@ static struct dso *__machine__addnew_vdso(struct machine *machine, const char *s
 
 	dso = dso__new(short_name);
 	if (dso != NULL) {
-		__dsos__add(&machine->dsos, dso);
+		/*
+		 * Set the long name before adding to machine->dsos so that
+		 * __dsos__add() inserts it in sorted order without needing to
+		 * re-take machine->dsos.lock.
+		 */
 		dso__set_long_name(dso, long_name, false);
+		__dsos__add(&machine->dsos, dso);
 	}
 
 	return dso;
@@ -250,15 +255,19 @@ static struct dso *__machine__findnew_compat(struct machine *machine,
 	const char *file_name;
 	struct dso *dso;
 
-	dso = dsos__find(&machine->dsos, vdso_file->dso_name, true);
+	down_write(&machine->dsos.lock);
+	dso = __dsos__find(&machine->dsos, vdso_file->dso_name, true, /*write_locked=*/true);
 	if (dso)
-		return dso;
+		goto out_unlock;
 
 	file_name = vdso__get_compat_file(vdso_file);
 	if (!file_name)
-		return NULL;
+		goto out_unlock;
 
-	return __machine__addnew_vdso(machine, vdso_file->dso_name, file_name);
+	dso = __machine__addnew_vdso(machine, vdso_file->dso_name, file_name);
+out_unlock:
+	up_write(&machine->dsos.lock);
+	return dso;
 }
 
 static int __machine__findnew_vdso_compat(struct machine *machine,
@@ -332,33 +341,38 @@ struct dso *machine__findnew_vdso(struct machine *machine,
 {
 	struct vdso_info *vdso_info;
 	struct dso *dso = NULL;
-	char *file;
+	const char *file;
 
+	dso = machine__find_vdso(machine, thread);
+	if (dso)
+		return dso;
+
+	down_write(&machine->dsos.lock);
 	if (!machine->vdso_info)
 		machine->vdso_info = vdso_info__new();
 
 	vdso_info = machine->vdso_info;
-	if (!vdso_info)
+	if (!vdso_info) {
+		up_write(&machine->dsos.lock);
 		return NULL;
-
-	dso = machine__find_vdso(machine, thread);
-	if (dso)
-		return dso;
+	}
 
 #if BITS_PER_LONG == 64
+	up_write(&machine->dsos.lock);
 	if (__machine__findnew_vdso_compat(machine, thread, vdso_info, &dso))
 		return dso;
+	down_write(&machine->dsos.lock);
 #endif
 
-	dso = dsos__find(&machine->dsos, DSO__NAME_VDSO, true);
-	if (dso)
-		return dso;
-
-	file = get_file(&vdso_info->vdso);
-	if (!file)
-		return NULL;
+	dso = __dsos__find(&machine->dsos, DSO__NAME_VDSO, true, /*write_locked=*/true);
+	if (!dso) {
+		file = get_file(&vdso_info->vdso);
+		if (file)
+			dso = __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
+	}
+	up_write(&machine->dsos.lock);
 
-	return __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
+	return dso;
 }
 
 bool dso__is_vdso(struct dso *dso)
-- 
2.56.0.455.g6c5a503b38-goog

