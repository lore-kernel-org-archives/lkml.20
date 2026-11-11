Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418966;
	b=EMxhoZAs/soKAQ806tOrjHwuzn3Q0MUnGgjiZ73rfMci0FwuZIAFCKg2gDPCCN146dwi
	 sFsUr5UbWxMXJQQEPZXZdEY0As+CYAobr1A0uZ5UgxnMur6PgR/g8WnWrrMraKv9q/YfL
	 EPpUPMxC1AVy4qJro3qepiQZQyfCrvSNmpyK9tqrPgFk/oAI8IsuwKOZKa0GHwS93AWMM
	 UZHhemdRtur3tFqz8uhn4aEASKsivmV2ZKInHuELQHuEZmICV5SN3MrOH8im6+mlt1HI/
	 owgRiN7OnwIWdwc3/zndXBRyKOyxKCiZ8RQVk8ph2ASEjQn/JjYkvEi8JbzztFLqjPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GQ2ckN4vaa+KXjzW/GKuXDFFblYx5Cv+ssPO2h9zXiE=;
	b=Op/kmiOLggklQUKI3+u9xqFxbkIZyeBPxB/W6kMY0nIXcRlAk9OztvwGLBiB+XAyi8Jq
	 w0V3zlucqpBbXC400E/Jx/CX1ahVyL4P54JVJ2esfqrioLc5pdGxdb0T1ucCk200DBxZG
	 FoIJGzc9nd4fb7kb5qBITwONMRfe18/yikhHDP3LmCZAHjapQzEULE/VhwzRdzmzNk6Jj
	 xni7xBPnXgjfh34nRZu9AjwfdaeVJz6ZiJ9Cu/NNJG6RuuNo1uyZR6kuUIwxhG3QTUDiU
	 NS05WlQEWC4dQGC9DSSkeuL1YxHHAuRFwgmeqZGHPsAP5wQRqPVKiE+GaoKf5H6u7PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B4ZiGOHw;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE060A3836
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCE060A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B4ZiGOHw
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b238436265so1692860c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418965; x=1795023765; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2ckN4vaa+KXjzW/GKuXDFFblYx5Cv+ssPO2h9zXiE=;
        b=B4ZiGOHwBJQcc1QvZGW/jus68FHOokxgMg8MHItLPEPYZno9UGluZJPx3Y4qtC1gcC
         3ddJta0xWHrGc1eqS3yHB+Pk61fsgnBp6rcS1VlLN4NigihlJYVHzrn/1suLxr9rQhta
         CzQ111NlWFapqWt3EfModifpICBjlsI7K/yEzID+mKIVoTg/1ET8Qy05FWQ6j20sObaw
         G3Ngf2S7Cr4KVo4oq3w8PfA8MuuoYfk1J592eoXhfIlzYt0Fwp8bcgROnRuVTuAbXR9v
         PHVta+5hECbbkyx+wiTqNBZOKfnMMPrEgslqLVj9UaHwlLaOIcrPAwJrHkWSRrDkM5r0
         bFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418965; x=1795023765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2ckN4vaa+KXjzW/GKuXDFFblYx5Cv+ssPO2h9zXiE=;
        b=tMbZsz2sZpDtwFclRBB8egK1vnJMJ+4iiAphh3sA1j9dXh8ARo1mLATh32w9Qi5eJF
         SqfEB0VULqesViMhHAnj2M1hRGkkncEEk/+yUnahJ1oGGdQ46O4/6B0E26boAtF3aUiD
         fQqFMpZGyv3Jh0aOVnEiRVXvcwAs96+kt2306IdfXpA7PY5GnGY/uS/zoEN7qRNUFK7B
         SGIa3rLg+4d1gtRjvHj805NdXXklCq0X9Y2ZKBoIRZTf2sMl2dLXMcn+vvlMbTbVRAu7
         SkKsBR/+4svO2v9QFoowmwYFD7B4Upl6jGJR4ww8EtVFz5nALa4wzhOiFwFnP1L8HKwk
         TYcA==
X-Forwarded-Encrypted: i=1; AL+hErFRdROhpPlGKrrd9PDmU8pN5gmp3M50CPLqZpFztH1ZLUPGsDGxjHrYLeMaU8QyV/8sXgQkSiGJ5unZh+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MXy0g8KTgk8gInL0XmYCa++2/yJGSWpJhU/k6hvKBX5wJZBa5
	ZrSldOFla1+YZfWIRXbZ3GJ0dSUV/q0det9cVP2XgN9bof0hLgLV28jchOWNXhtgvfHf8Dn3lE8
	PoHWjfGvQow==
X-Received: from dlbrj24.prod.google.com ([2002:a05:7022:f418:b0:19a:9ffd:b30e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:ca05:b0:166:5552:780a
 with SMTP id a92af1059eb24-1b3c02f379amr2988632c88.8.1794418964501; Wed, 11
 Nov 2026 09:42:44 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:04 -0800
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
Message-ID: <20261111174213.3526604-13-irogers@google.com>
Subject: [PATCH v12 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
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
2.56.0.542.g3ef89b7020-goog

