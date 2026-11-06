Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948656;
	b=D+Lz5xeL+47E8GUzeYutc9bLlGJPbNL0fB9IuK09v8J5p30RTZZTCpC3ntP0zxJssSxD
	 tBMkZRE1GKcNtmBfLTAzwHuwPlM5WeEZG8eF61FMIuJexDE2LGeW5iQmHH/SNAcqPokmd
	 HnXD46qp9yygbHPgH3A1iPc0/eyEd5wePy1v0Rby/NYDtmPMo/LSQlVXgpvdA8VNRKw5W
	 RDlOQj2PzuXkRN8eM4WFKp1wjaqtvAD+I1G4mDCyGQzjbAugfFuXHHkQqXc7xd7y9m1zO
	 2RkQ56Bi3aiWnfAbKZBryYSDZl+vJIRO9aEAN1Mjc8Wc6CF2rk9eC3EwM0AmeDjkibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
	b=tRwp6DLH+9hZs2Z/LH64PRQMpjxRohj7qb3qnp5WYOUKABBkgEC2dIrbV14WCY+naaiv
	 ovyZtJRh/jJveA+C4sb0e+B0JjMDyxZCbOX1SEoZpEH0E/knWG30ZuOjyPwOqepGWRnyR
	 i1dM8B4+jhTFPq1TDMHeFTZ3cgLIxSCkOZYOetf/bK82kGsQZpnE6VrK8okqw7ykc/4sn
	 c/6yGweMOuk/caigOkH0UoCtzgEHK6tSnPUK8gfjcOg2IhuzKdoyAcmZXZ69Q+BEYvvL2
	 6sPT1ebgbxsL+hwtqc8ZWRX7MO2Gyty6lWgM7qHubl/4d/8+Tjp+o959Hq6RuWvFiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ADIvD+iW;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5DF606D82A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E5DF606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ADIvD+iW
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso497340eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948656; x=1794553456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=ADIvD+iWShet2v9b/zznP6u7ewuKDEHiK16YKtfcTjMfJV95NlU4ondLGWHNubwQIN
         cd3qUL11r9jPJf3FI9d/8r24q3odMzZlKj3pHEW5Qb62HJ5qgsI1J8BnpnBRdvrF9dHl
         fK6CRbhtIc9eqefcI1OmEzzF1coNyzsRC4c4lik/2haDcn05tbA/F20eEtia5DLCqETY
         /X1xZ9ehw/Y6cbkh7MaTGBnITDr616VYmF8PdAPZWgTqZrmnCAtYqOfK8m8Woep9duHG
         zr1z3Mz+dMkMtdxfuaIdO+/K4eEEfC1YEFgENCAiFdBTUfXb6e74Nea9Oic4cmelmhQi
         Z6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948656; x=1794553456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=WytAvQ4SNtacOowrWWFwjzuu28TrAq9yhYVnQTZqhFqWGQlW1XAaXMO0/0HDcOw2BQ
         YW5tYHwqE7D8yLmK/DWC7dsLqqK9yTMXALoKz8U4+kTBG6JPKCwVGA1bEMznZPd5lqTk
         cbceUr+/AGT9+mfmQpM3IsaZq7AswwkPqioPUtkNisysewxaob8VzsygItnBDTNWJA9S
         STnlPMErzvXv1OMjEDSHi5oLBzorAN3oiyUu6cHxIhzF4WwQD6bdVimUM9h3Fdi//bBe
         lPt/rEGHCD4YMLh5cPbZdVuQbcinnkWNfO/sn5k04tBT8OeXREkagqwGLYYxrYLHmB7o
         P9IQ==
X-Forwarded-Encrypted: i=1; AKwUvByxgl44b7J1puBAwZK3pS/kyDljFRDPaQD1+CaiilC5IRB0cqf5k63L71Y7B0GxZAfdh+Xk6/dkqqB6Xpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/3/8oIhvu/vDN9La0ynlhzFiulaH0FmwsBwnAJ9ezcgfRR9O9
	iGBuVAW1JecQgiX0VtUPZBEOpJXa2cJpMC2Xo8Is5+hyYgsVb6jzrrxfnDQLQ7agx4FkL+Z5x8H
	UV1gP/ZsErA==
X-Received: from dlbeg11.prod.google.com ([2002:a05:7022:f8b:b0:189:49c0:62ba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4292:20b0:15a:4155:3d9d
 with SMTP id a92af1059eb24-1b25d37e36dmr1929835c88.31.1793948655551; Thu, 05
 Nov 2026 23:04:15 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:36 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-13-irogers@google.com>
Subject: [PATCH v10 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
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

