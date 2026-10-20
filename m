Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514229;
	b=LJ/liiAt4DAEfbfjCHEfQ8mVJeYqe6UBtOd2bTAzliePJqYoyQteKEkZ4iqh9oUhDQh/
	 cwjOLP9B1FI2DrdP7eYmK0q22JQCRRzk40ZXLHujALUEHQgUgXkxPAEOdxjKKWAwAvSe0
	 4hRAbi9iLDf7f6ZZmCzkCTWmnunNKKXqmnLJyq+UYa2cpOqs3kulrCOi5rD4oW0lu3tp+
	 nXTx+KZ97OPeNyNw70Gd0yVsio9x4wQOnMEOr8cV/LeWnL2+y3Afs651GbLY8kq/MYbz3
	 ZOmCzVJTTxNzZYCtufs3H7b0KPNOFXZHWzuH3qOufIbnJhqlTAFDyLznqbmR4chuhrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wQLFJHwsU3MBb+ClSSSakwCLT+FhipoiHayuTmyc88E=;
	b=0Y634Hiinm2nY6ilfMYGi3uPiVWrVKkytL96ATGOm9aX9seO+T+UjTpiwIFJYdw4azOh
	 ymX9yM51ZtAJ76GVj//zB+ej3sf3DkpbXhohniunRyIYWYRuUeAXiB1V19SdSnGYKoHoD
	 7yk/LgMuhKmJ0L1uwKbKiUzcTlrgrWszEeWfDcZSPVUJeHkFbAM/RA4S9deAtMscmuhax
	 fKBqAmL2ILLbgVtUtam55gGfVoM4m3NcAmCEj8iDD/SWORS6AQSezja7iZ+7Fuvnim1Wo
	 kRioBzTn2nfguJIuGvYIab66Tn9f26H+Vo85p0xhz70O/ow+Ng9tQCMCORXy3zAeiZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZfiKGoxd;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A960A263E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1A960A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZfiKGoxd
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so12005552eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514227; x=1793119027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQLFJHwsU3MBb+ClSSSakwCLT+FhipoiHayuTmyc88E=;
        b=ZfiKGoxdfATcf1qK4Skv+chsHF6ONInLM31Efdh14H5f39kvN5fJaaZs+5g9yMHWB/
         OV7p95f4shMdmMHFGxk3DOKTT4UZ2ev8IM0qs6X9Y2EDPnkwpROPxyjJ7g7nj8oAPNP2
         0SpNw+KqNFLnwysUz3O3X+ZVfw1S0yMFgz+Y8nBC7+FCfPVvjFsUVcgvQQDodg/zw3nn
         cUzxBt5u9SNz+2Z+TGgtAM5J3xVjcqTQmTamkU1ksYCOLR4KmnlIKo9ddpx9lRYH6WN1
         56JNizUduxeQSsRpLvQlnOSkp9vtA3S82k095vG70ruuGd2q4FV/2TziRgIdPenP6daF
         x3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514227; x=1793119027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQLFJHwsU3MBb+ClSSSakwCLT+FhipoiHayuTmyc88E=;
        b=vRbDlYoma+bkMdvNvHPe1V6Ie3Osy6BEZVljtRwvWyeQzFfSA1AOx3s8dPF9j1jzEk
         GN7wbYGKWQkvi2yncJLrYWhLvohn8mfmldycP0DGwg3cQRS9pS2buX1p9x3it3ibn6Qx
         JVypJoYvIhq8am4nUsaAwBZACTcTpKoiTrhaYwoLWcRLhWRLsg9EceC6CGo3aGo8ikQU
         9Jn+GFFFXRbAMR35Ncx8CC5fQvt2ZlztJoGX+k6Y6hdB+otsc/ymoO3j7LDi9h8apvbp
         o5H/BpSmdhKiEAkt26hBhkaXrvfiJX32mazMSo2ZlpEBMRsAwLNZQksgb5aYXZ40K3v3
         YhRw==
X-Forwarded-Encrypted: i=1; AKwUvBxejYvbQ6oukP634rayz5acvbPYBRAOpI/p5y0okNIzilcYiuTsse1L7hp2qJvbq0l//x3UDaEsEyLH+F4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNlWJoSz08V4oyeVmx3wpMi8V5A9qrs2ElmSPhjrc8NiH/No3d
	KyTmZ6EweZnD5s4xz52P6WlHcRGZIRrOlocauN7bqq9/TJFRrPo9ZADEiAyiUUGXm/VnjLeaSEu
	4XzxD0rsCEQ==
X-Received: from dlah17.prod.google.com ([2002:a05:701b:2611:b0:14f:4204:735e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea44:b0:181:83c:5df8
 with SMTP id a92af1059eb24-1851238b3e7mr15524858c88.11.1792514226408; Tue, 20
 Oct 2026 09:37:06 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:30 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-8-irogers@google.com>
Subject: [PATCH v5 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock, and machine__findnew_vdso() and
__machine__findnew_compat() initialized machine->vdso_info and created
temporary VDSO files without synchronization. Acquire
machine->dsos.lock in write mode across machine->vdso_info
initialization, duplicate checking via __dsos__find(), temporary file
creation, dso__set_long_name(), and __dsos__add().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c |  7 +++++-
 tools/perf/util/dsos.h |  1 +
 tools/perf/util/vdso.c | 52 +++++++++++++++++++++++++++---------------
 3 files changed, 40 insertions(+), 20 deletions(-)

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
2.56.0.212.g129ede20d9-goog

