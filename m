Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622382;
	b=eagzv2RImDaGJwq7nE3n7AbW0NfaVatCP54sv4rojdxEGfOakH+vB6jqOOsslXye8usx
	 kXRnmQcvHZpZjMuOz1+pCNDWzLr1wd34XTVDdyv4UWEJJBpetiP0gky2nhEBS2/4s5oNl
	 EuvZJSeDs6SgoZmipQiDLSZLMg/HQSg5Fc9VJcHg+a2uwNmCXiq4Z7C7nG/DfDBuc88Rw
	 +c/9ReWRQGQBTnitLbIJmfmeKIDZYCA4Ik+2aDZu2c1Qnx9FtEAtBRDhYrv6SiH0IOaC7
	 Q5qbs6NJUyeWpV7l0jUXVeL0JhTt6dgNAsy2KmV6iBNDuP1trfOKGmDfOeWRrnuRHFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
	b=01pUZylePNCMFMECi2vcX8XV3Fj/r3v5XpUXoC8SAwaa7He6MfZjhW9+6D8r5UxEOAw/
	 4xnhg5ZZwBLbOLPaLV+eAUDyszWO2TO4iq9b1CNCq1tlQbUmkgZc/DNpBUSki/uNAh8SO
	 gK16MtfhAuR00iqepwrH5rOu9v1Co4O/jl/u1KQeU5L/YumergmgIGaid86DQj6khq8M9
	 zVX7I7tOXiTAQ9a6p/hJp4urZL77WRFUcOV3VzuKC8oPpf3ANp+kzUiN8yU+Gle1Bjwao
	 Ms0Umg41jMLUESZ62XfksCZaFN8N9l4l8xUW6lVzpYZlzv4EFhqTQ0RujymbvhVzCbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fJnZiYVC;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611AD606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611AD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fJnZiYVC
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1880573eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622381; x=1793227181; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=fJnZiYVCFQcnVs9CTIFujMp/hCWdNH29I19iZtZ2Vt31hJzzbXgqagevGwL60hmftT
         pV6dayUkA26tXvhlFWAVYAy1QtRMhBPTAJMojOW8BD7KSI3LtQgqD6IZ51zqwAKTY4nC
         1ipODV4g0ail6nz9gNRgp9veHg12knR460quNORvFXRrBGvFI2dIu+n2Xa/qHXIeJONV
         nuTmTvTgNATgQBu65sbBnHhGMtNZyU06k4yU7eKhfrJflGvMCwJ0B1fXxHEx6e4w3w4/
         brKUmIF0WIc7XTYERnPqgEAHXSzjerPmi1cphh3RitZOHr+w+qea3i8sE1GosjD1PFTT
         yCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622381; x=1793227181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tais/mmpVOY0wxTi4olaaP5GHUDvOJakQ1sADr4zkQs=;
        b=U85duyt8BSyj4zVFUgo5XzjsiJfDK+rMFiX3Iyki5gitogWDSWcqI3is+nkgffEfHm
         jtomF7cAfiQZNQ7C/9EyGqaTnTXKCvNn3Fr/2jBWqfpqD6RuV3sULa23lRMZ/ERe6knE
         +7m32LORmSttfUi4d0s2Qs90x7JpdDNE4/2YiyalFPDCQ8oF/qyk8fVUc94cM1rQDuPT
         Cc1YJLlaK/ahag8rsNgYFwiSMpdqIXfIEvF8wXNdlvdKy2EPTxHvPHIptbJonen8dgDz
         5iX1yhrNUFVJlEGYC0uk/++IyMlnTUhx8pyI/jrs/8xSgaSxPVEDRDuNR2fNHfa1gMV2
         aGkA==
X-Forwarded-Encrypted: i=1; AKwUvBwgeajMsTtZp9MCnVgSKDNAQ+X+gXgaQ5CkPJTk+3OTePaasngxnb0RvgyY7Nh5rH/O5rT3tKvev0oqkxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUvt3XhZr5p/nZSopYlii+YoojX9fLUyW1aFRDfXruRywSIfgo
	1gi2c7cQCE4WPh3LCAmAa+VOkIULAQBDomxXoCFvlVAbGr69nJCliJrondALw/gxoDDtHVxfz6Y
	0WLLiXCwtJQ==
X-Received: from dyuq24.prod.google.com ([2002:a05:693c:66d8:b0:366:847a:68e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:42c3:b0:360:1637:404
 with SMTP id 5a478bee46e88-3674f1164a4mr4452520eec.33.1792622380820; Wed, 21
 Oct 2026 15:39:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:58 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-11-irogers@google.com>
Subject: [PATCH v7 10/17] perf dsos: Use read lock fast path in dsos__findnew_id()
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
2.56.0.218.g1ec904b173-goog

