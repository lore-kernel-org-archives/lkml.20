Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026499;
	b=BVy5h47SpJRvZwwa0t+oNY9LIHj6ppwr3/8TbYlh+rVTDXnP3fBsFiUWa8rGv6yYTWUj
	 tMXspwJOtgBNm2HuH+XtZnxpYb5ADVZQ38OpbjRuFQSsvXu2/kpvaMmoxhS4Us99NxaZS
	 rmgYifoKwuxhHvj6CA4QRe1GBRG7HQvLw8lfD9jcFJty3WcdHd4YQfaWaLWxup+EgE7Vn
	 gnw2xbUDLOJpYq83BUQNErrusaki+YACHHqfX3JezQnyo8u7ddq4eOXzneD4J15X1o+WU
	 XN357XDEtBVWMIP0glOcZ/js0JNRU784dGe/Qo7rs2yaCXqfm04l7GG+RUe8DCYcAQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
	b=qCKdvc6w/G/5vPgPOgbpCUfN/x7rVolXtOWgVhB1DI2Q+It7BMNQcoFrbU96z+Ys+RzO
	 qtdftgLbGwFrznyiZRUtdobLJXOSgLm4DMKwyOewhNzLbUSc5/6zt2EQqMvNzuzFvysm/
	 tcxqofrkRUzP8WwLfe83qTe1Elu4p1ae5Ywzxsp5OO741xIzsXklAyEa3FqdqsU3cWeev
	 zTEEk3/By7Ur087oOd/5JWF2A8hb65czIqnsUB6GpfhhqrDiAzrYt/eyYtkPdQ6sfwIcA
	 HL4YpV823HHg7Za5f4pQVTqvyHRe4eAS9cMdA7v9J0iOgaffUgDUwMHihwkaO9svRCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HqRDU2YQ;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7E3606D819
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF7E3606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HqRDU2YQ
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fe0b57d91so1366680eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026493; x=1794631293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=HqRDU2YQa/AqsIPd4Ku7xttN2NtuaHFkYllgoKYcrjecivi7HipD37p48u0ccY+R2U
         luxpD0/Ypz5FyFARSjkPO2GLwRwYlLlEd9qQZlJBLPpi0+jiWvpC+/SIshXnb8Qrz3su
         5EXM6wCilggmIcn5YNcMhMtbD/HG8uSENP5hVap82UmTbcxql31HXaRe5WK6MYnt8Xsx
         kWBYdeTQsyme0Y3eWf1TSi/zr9/tm2MTLWwJpSt/Qk9OUSHtjAlv8YKBxlm4J1IhhRd7
         kmBtpJYyKHA2A1gdWTKEkD3gl1t9AZJ4MPxafhN8daiSiHCOUVqKqgpS/G4miDifwcBY
         MwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026493; x=1794631293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=DczARakSLaf31S2GaRQeXv5/fm39me2PTM9sxIwqMRoe2kx0rIQXKKPuuoxTAELH7r
         1eQ8c56qYmp+D1rtMU8aoTkqbvzKFRFK0sOf4GEafGJ7ta0nyfTCQNTVj9BoAIWXx2OV
         u88bvBkAjgDXTacdbOF1k9RUmfylKkLGId7ZuAx82nZXbwD/mYo3jc4q9NsZh9QMv9pj
         zSgFVUPy5Q/TkKS4mN/4rv295lqZhy/sEU07DL1zkFh0SVZx3EIfGnSuEzm4B21TyBVQ
         Esu+SRE8caKi3MP+AWdHjgss5K+5XEPCNC98DhWRawXwd9u02naXi6mIjtRdy2/PiNAQ
         OETw==
X-Forwarded-Encrypted: i=1; AL+hErFLdM0cE4rT/HJ2o/+9KNxZFyUk8LOQI3pC1iVtHwSaFRyyek/H8yMYze5Iw2CjOxKbPa+FBGYmSVrfdHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y78apMAYbFc/JVVdEbXOQ/ycCMD1NciCN787f+cUDKfkTINUN
	rgZBaDNj7leh3DhGrfuCqwPxoHU7QQmENJFzzVe+TF68V69utIPa3kCqqe6z3bEuq6A1TdFqUQv
	g7PE9ASTftA==
X-Received: from dycol4.prod.google.com ([2002:a05:7301:db84:b0:351:4a2a:1ece])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:680b:b0:36d:394d:e690
 with SMTP id 5a478bee46e88-36f785b760bmr5719519eec.40.1794026492432; Fri, 06
 Nov 2026 20:41:32 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:53 -0800
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
Message-ID: <20261107044102.1506626-13-irogers@google.com>
Subject: [PATCH v11 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
index 9e38b3b69e9b..df1748763d95 100644
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
index fbbf98c4ccae..1b3f8b84ed30 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -349,6 +349,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
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
2.56.0.455.g6c5a503b38-goog

