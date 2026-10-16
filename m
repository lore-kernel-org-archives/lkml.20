Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5F46C4DD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189119; cv=none; b=Ak2PIJKGirFR7Jw65TnpleLnyUAXEbRijG4YRj6U0dQnCZSiFjYNlCFOijMwTIR1/r59M0nCfRLj9dddsWERS8MgMAmfrjaq2QtxxA2C6BdOr23CxAv8hZLOafNAGQ3Fu5Nbupek5vktiPOZ1WhVRXqf3i/Z/gS3FRWabbSNqc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189119; c=relaxed/simple;
	bh=uHzjpn2rehiqi0o3nqXWkTbin9jDsPX5sWThpgvpbwg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SUCz9HoL+Qd1ICkHkjl8qx0lC1gnC3lQXAVZeRNvhlmzm9qyLtiiM6uWP9QLb9N1RSsawTb1SEMUsAAaKhWb2gh3PWkmaIKkFkKvnHU1hsAqfcg7ubjmC6x7LSKZFoYIDi7X42UXMOWh1mLOBp/fQE20v0VNjhFJXQrG+RMOqq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvDDwdDK; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvDDwdDK"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so1440444c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189117; x=1792793917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=HvDDwdDKENWk6h4X+ERUCyo4Zekqm/tX4t/NyRHmp6DELZY/0HmiOeu6so+OqSCKxY
         SUZ7WekEvZ/itfkbAGShQLYnuLT8EHx1tZywboPBAnvdtMcdO4bd2vtjmiyrEvWn7WJX
         sqvxBT+MB2uH5JyZyu/DOeX+byQdEwBPmOWJIpiwtGpzRzRO+lqSV0M/cNtBy19CQqru
         am3TUfKuSYO4KJr5t1RxLOq4ugb4Z3aBTYVZ0V01nrgzy1CxBNPVg5tU5FvIncYC0MsE
         IeYu7MZfu4ylDHMEuSPLq+LBwd0TW8dCniI3E9FNcgu+FkM5x559QyDRA0NX254tjb1x
         7AHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189117; x=1792793917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxCnvxUTZp1il/bb781Ce5TYlehlCEiYcvgLpzeabqc=;
        b=YKPzFNMRpsady2CLioLY+vSqkrnALhuE1q+4kEAjXiKvCrsXyww0ZuA145Z3cl63bb
         n0zxS59f27aRIGOc+ioNtKVUWPF3R3cczK8Ir9TfLdZ+7K6LmMcBkHq8ZT9F5kWzHGw3
         35XbeXd+I3UtCZdrw69rb2SFsF++Bhn+gii3adLSm1lpeMM0tU+HwY+M8N1A6XiqGMeo
         lKMyYHCD62AgSh2Wf0MJFfactAICviz8sTewq6Ifal4pcBRLZsH7h8fCbLKBO5iNgXD6
         Bnch6dOSwPQ3FzvJxeKE6WmYPFuHe4uNnnA1haf5/e4ETtmuA86sBJKPti8vmJgYibjx
         PjsQ==
X-Forwarded-Encrypted: i=1; AKwUvByoguduNo0J2zwRlvxzZ+7rkLqfWqxzuIbTcCl8rXr9TikiBUTb08TynvjCiijwD/GU1VXpk25OTV3jJNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX6sTbI2nEnR8yJtHOYIXEyDy8CbYCaniISg8LyrTSLdLMXcPc
	AqxB+oxxoXwQp4CkSXuHh0mgyzK787ccgGTrDtjWQ53lH4phT2spq9DAoI5abh82hzPSeojlxAH
	aWD+upQxYtQ==
X-Received: from dldyr6-n2.prod.google.com ([2002:a05:701b:4506:20b0:184:e9aa:8728])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:43a5:b0:152:dd1b:4fa7
 with SMTP id a92af1059eb24-18511eb69acmr1925709c88.19.1792189116570; Fri, 16
 Oct 2026 15:18:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:53 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-11-irogers@google.com>
Subject: [PATCH v4 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In dsos__findnew_id(), try finding the DSO under the read lock first and
only acquire the write lock when a new DSO must be inserted or an
existing DSO needs its ID updated (checked via dso__needs_improve_id()).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c  | 16 +++++++++++++++-
 tools/perf/util/dso.h  |  1 +
 tools/perf/util/dsos.c | 10 ++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index f0e02062c09c..4dc518f7cb7d 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1685,6 +1685,18 @@ const struct dso_id dso_id_empty = {
 	}
 };
 
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id)
+{
+	const struct dso_id *dso_id = dso__id_const(dso);
+
+	if (!id)
+		return false;
+
+	return (id->mmap2_valid && !dso_id->mmap2_valid) ||
+	       (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) ||
+	       (build_id__is_defined(&id->build_id) && !build_id__is_defined(&dso_id->build_id));
+}
+
 void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1692,6 +1704,8 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 	bool changed = false;
 
 	/* dsos write lock held by caller. */
+	if (!id)
+		return;
 
 	if (id->mmap2_valid && !dso_id->mmap2_valid) {
 		dso_id->maj = id->maj;
@@ -1715,7 +1729,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
-	if (a == &dso_id_empty || b == &dso_id_empty) {
+	if (!a || !b || a == &dso_id_empty || b == &dso_id_empty) {
 		/* There is no valid data to compare so the comparison always returns identical. */
 		return 0;
 	}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 9f026ccb0eb6..394960cd2004 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -802,6 +802,7 @@ void dso__delete(struct dso *dso);
 int dso__cmp_id(struct dso *a, struct dso *b);
 void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated);
 void dso__set_long_name(struct dso *dso, const char *name, bool name_allocated);
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id);
 void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 
 int dso__name_len(const struct dso *dso);
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 40267d3a725d..b5c8086941d5 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -348,6 +348,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
 {
 	struct dso *dso;
+
+	down_read(&dsos->lock);
+	dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/false);
+	if (dso && !dso__needs_improve_id(dso, id)) {
+		up_read(&dsos->lock);
+		return dso;
+	}
+	up_read(&dsos->lock);
+	dso__put(dso);
+
 	down_write(&dsos->lock);
 	dso = __dsos__findnew_id(dsos, name, id);
 	up_write(&dsos->lock);
-- 
2.56.0.212.g129ede20d9-goog

