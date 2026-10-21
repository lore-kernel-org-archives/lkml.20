Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602696;
	b=k+FYpbC1OD9ZGrFqRW4kEpsC3lxElLP2Gy7rOF2keBe9b4YbwDFMq92GkbK1TCpenaro
	 5fAGkp8gfy/OpQz6quUpsJc3fSG/R9LSFSkc4vdHbC5PzFJPlAR4IN/gIaxdzO/fdGems
	 RAljJHX6nF4UpyzgXVlsITD2UsEdNAJaW6WbkUOm1RQAAmqqzR16OJcs0fgHPqTGPaOEO
	 UK1r6qWUXH3YGKANPGetk4WX9XGiqJc6BiLOQtyh8BVD3aFiX11FBb/fgq/x+cCtd2Hd3
	 x3GuNIgLb7AoeyrjFS5glVjZzAYoFiUb0m+2Hsz7ejjnv0vCmpoXqxIqyjOzLRkqRvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
	b=al46yKVhkYLRrgbjGqg08ICUTQLuGJDN0GIS8grdiJvP/UiZHQLR6mOEIi5dcAYPyPjo
	 73cRZ+/DlxLzNwQJunvR7nbnzhX1Ao065b61Kun331rIn6QNzk4OzMh1q1cDmRevMzi61
	 u44iY5hUALysKMNHOQT0NtNcTIAvFc0rjCHZWdsoxeATnKh33zRKbv+/1KQdTDN+bdL7e
	 YOmcNk5AEOLAVwqnMgewGa35tyq/cSDERmbJmAQo+x+0yExVtqdeX1MNaGZb7wEDcsoQt
	 Q+H5RA2QNlGbYsoIfKVPOyy2KM66KBtCpb2/9H33TDGDeg9ijA/UKyc5LeXpKvblwdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ijSc89ZF;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6802B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6802B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ijSc89ZF
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so3425997eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602695; x=1793207495; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
        b=ijSc89ZFtdwRQspsnuwifTPZ1L4faIe1OKsCWCl0aI4QRVbegM8CxZULRLhxayF6Gw
         vZMMnbB/gMM1pfy1dtWV1lPFrZtd2XeZ0XnDwv8lGqo7UZ5GISbnAxlfP9aJ49DsHAD2
         o8eZbAQVVZECO3Gm70qhkO3XN9yVm1LiVaWgRmiAR1ARDdbqNR5nmDApiUpeY9oUWTkC
         3lKlzqz0cu+pXUoeGfC+wcLsicQpO49Pe1hoZYLxC/FIcpojDYNpRjisWek8oHPIA+Iv
         +y/RrdZPU/e248sMm1g5l5qKjNC4ulz6P8+Vy8/BSfIZHAhIPFEw+wABHFMr5buRtxJZ
         I4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602695; x=1793207495;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yD69uT8OzBgCMK82/DZER0A0HpZ/t80pTFtRy6AltA=;
        b=1OfSUUsj64v6CVrKzIVVtNFQyA/WBKshXMESwrh9z0c5HWe9TjR/0s5GCS5HhtSwkZ
         AkicazAAf44TWqIByioNz2NNzCTDfekzcyWsvxlI4MdQCDjioHWknprCR5wR7nw1pnJr
         Lu0vSb7T5o4Xm/pFwYqhecfIxjFnrhynsWDKiMACC0Ewq+bz64eLEU4V40FeQMU7x/XD
         VAtYfuGseEQgdXMzDntgyh1FlGq5wEG3JI8eZk9r0rdQYYg4IxzdBqrsqemyM9tL87Xr
         bfvXXNEMuaYBYhASMzCcWX+Um1j+YweNgCs8HYBgOe1CZ5NKyDVTEtOtFUXi0bOdnW/p
         +JaA==
X-Forwarded-Encrypted: i=1; AKwUvBxnLdKGFb2Yhs24TiubyRUFOHlnODMsRJ0EnFnBjftWTeRrGWYvwCu/rcI/hhgT+uI0aQyait/X15CEeno=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBdgz/TTBHUxeU5WhEF2eGlsbr4XBJmdbiMmfLOyGkVt15g7eC
	nwqT6rrAXgURZvGrlwWKCF5mbR98a/8OgFvv/PDCQgN/fjivfKdAheaGLtvPex55f2zS3VUyIlo
	vjskI/N/bXQ==
X-Received: from dybms18.prod.google.com ([2002:a05:7300:d512:b0:366:4c35:6e99])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20c6:10b0:35d:4185:5395
 with SMTP id 5a478bee46e88-3674de4e772mr4215847eec.16.1792602694116; Wed, 21
 Oct 2026 10:11:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:33 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-8-irogers@google.com>
Subject: [PATCH v6 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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
2.56.0.218.g1ec904b173-goog

