Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD749429F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189110; cv=none; b=oq4JjdSsvsDpMNDiKYL17ix8Qc+jaEXV/88bZ1s8kaeCZIY9xKX9ImDeHt2U8/mkr8FAtoFh2grebS8aDGrU1ZFXNvFZ4fjcwOITGwXEKave8MJeKTdUooAT/LrVPF9M45N3f8QLw+dorWmDnGUyXbYiCjK6WcQ6kPsdLbIzuiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189110; c=relaxed/simple;
	bh=XzWZHONgT/0d/n03HpxSQAnMoK9ViAwbiRR7AIBlFK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rQjwVInSDou3c8z9SLwYS3TrO+WMk4RN7c25JsI+GFZCYVP1yMeSRo33+OwYGiwUidLL2oU/59PDYZj/GwLDmqu4801eDAt7KxHS+/2FJW3NBafYNQQ5dy6iY0mxX5k+L8+3Ll9YBFZfhFRrRQ40mHQuEqDcnbMLtz0e7pC7hjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R7WMokjG; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R7WMokjG"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so480614eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189108; x=1792793908; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IktZ7k0WQQGq+h8FFQr2kKvApPwIP2MyLekNCFtbtTo=;
        b=R7WMokjGx4SXCvI1cbwGwcr4L2Xow2kmp0Dc4N+haSQCQKB1cBS+5XA0cVKvoP3Na3
         vq0Ty2aZvpG6F4IKkKVAMvDn6iEbclBTCESEmX0XhtuwZm6dIolzwF0sa/lSRddxTLb4
         9cR6wwT+wPywiCRTMLGXfePloJSNAdIFmyY0jJzowmJsyQvRmHyfQzzqLKAcrant481Q
         5tT/S5i+TfUNW/QgVrBSoMkUB2FKahLELz+6TwjVyT8as+OA1r0DXOe9lcOuiunTUr9G
         oL7wuLe9peQFap5ZmoghjqSHZ9joySkCfaou/dcFgLQqiPsFY25z/LGZ54xzntHax0yQ
         oYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189108; x=1792793908;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IktZ7k0WQQGq+h8FFQr2kKvApPwIP2MyLekNCFtbtTo=;
        b=m3niE9H9TGDthu3xMnIFXusd3IULBzIlScFP4/uefDzTVeqDBOZIx6oN05SfsBEU5n
         NRFggVy/cEdksFiZo6Dh2kYH/66O61xvvoRXyGt13+vVRPPDyjo2QhH/Bjs+dP+Z1S6h
         kwxnbCt3ro5Q0CC7uDbrJXOkQvUY3bckqA4Xi09ySBEgbQL05FXemapUBeeGmJuPuYf3
         +FyOas8Gb86n80N5mHFPkg+NEDu+TvYV//NaGfM+iHWAt9iQrAxnxUuew0kN4dFCLA6w
         vLZsAhqkRZ5HW6ElgXEKIKrRKrK47KguA7yMWw46bjW3KRI7WCM60TsIeukahD49DgtD
         c3uA==
X-Forwarded-Encrypted: i=1; AKwUvBwW3HS7hhQTdGhRLEDtrry5gcVz4uqPNseBNEnM6SaB6TwNeAOMNfkeOqYg+lTzA+vDNOLORs8EYb+4t6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUOMWh2eaFm6wLxoNLCgiFgg3Ev4PyEFkPbUrvp8Zg9xsk+lNg
	0AHTZI9DVD2Os9fUg2yseetZZ50ih8A2dTRUdiaGXkwzHPUe62k1CeuwBhtHV7gAenk97nw61W/
	H3b/o4wXz2g==
X-Received: from dyu6.prod.google.com ([2002:a05:693c:8106:b0:359:b917:f2cf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6395:10b0:35e:60ca:81e9
 with SMTP id 5a478bee46e88-361a1f53a9emr1593056eec.21.1792189107879; Fri, 16
 Oct 2026 15:18:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:50 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-8-irogers@google.com>
Subject: [PATCH v4 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock. Acquire machine->dsos.lock in write mode,
double-check __dsos__find() to avoid inserting duplicate VDSO entries
when racing with another thread, and set the long name before calling
__dsos__add() so it does not attempt to re-acquire machine->dsos.lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c |  7 ++++++-
 tools/perf/util/dsos.h |  1 +
 tools/perf/util/vdso.c | 17 +++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a2cd37bd1660..40267d3a725d 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -284,12 +284,17 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 	return res;
 }
 
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
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
index a26774950866..857a79fd8805 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -30,6 +30,7 @@ void dsos__exit(struct dsos *dsos);
 
 int __dsos__add(struct dsos *dsos, struct dso *dso);
 int dsos__add(struct dsos *dsos, struct dso *dso);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..dca4f683be9b 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -127,13 +127,26 @@ void machine__exit_vdso(struct machine *machine)
 static struct dso *__machine__addnew_vdso(struct machine *machine, const char *short_name,
 					  const char *long_name)
 {
-	struct dso *dso;
+	struct dso *dso, *existing;
+
+	down_write(&machine->dsos.lock);
+	existing = __dsos__find(&machine->dsos, short_name, true, /*write_locked=*/true);
+	if (existing) {
+		up_write(&machine->dsos.lock);
+		return existing;
+	}
 
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
+	up_write(&machine->dsos.lock);
 
 	return dso;
 }
-- 
2.56.0.212.g129ede20d9-goog

