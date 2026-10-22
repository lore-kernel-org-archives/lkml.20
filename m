Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700125;
	b=aaR3foBn2wWz37q4ZlAjoDFJldypbNB0ufCujxAA1vWVN8dbNtJylgslyW2jnfidOlWt
	 p9wsLFq1Qyy8iHDxS+s79RkKpnKUKqvg2pHWx2LJ4+T9lLyRQxxnEd1wqWOnd9H5sEe5j
	 Iu6f/D/grLAyCDShpipMKbNcfex/paTgnaCLNFc/QQ0qXIpk9U0uvlUr4/02WAvPdp6V9
	 3MNrrrOiMyfhMWD0JsEXlaIADtr+OavOR0AYngshGCCIXXe299UjkdYynjlVDFe+B/p/k
	 Y9OU5fZuzdmVxMRUvEpo6f6XCFSOGYURaAOrFs0LaD1XlGVlpD2dCIga+W424lON2QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Io+g6hIKWvFq2IWPAUSEo1ar0ouYOg7HxlaXmXYkNnQ=;
	b=2sW3+NeuogDIQC2DTZPni6pX1u1rOMg5xQRkgXm3eyu7h42ZtWPBNmojmRZkvW8Jbwi4
	 6TdXBcgAGxhW2cIFRGPx/fle6erTmswxz1StmDOVf/QFFQmuM7j0F0IPfRzAJ5cxSH50e
	 zK9URtc9DSZ1alOkwlYnkAr4U8n9QwdolvgNk7vIXRAFouSS0e1a1mdww6ruSssm0ExGC
	 ApJUyfRi6XIStfB0Qru7LpJTyuoGhgl3pUCvHRK0PZOiIVECM4Mm7EYNwki2UvbubUp2B
	 H6MuMzcwM7P2FH+3z+CNj3PUYDbhUPYwJSfnfl9o6MRdLfDUqEB4BV8NcIdBKA0Npkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=a9FeYiim;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D760606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D760606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=a9FeYiim
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36998507c13so228667eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700124; x=1793304924; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io+g6hIKWvFq2IWPAUSEo1ar0ouYOg7HxlaXmXYkNnQ=;
        b=a9FeYiimmhn4X5R6cNiXmF4X1S6XQhg0zAR3LraW+OF4e2FYe6byxxbPmtXe5f2LMS
         6+moRea98/ISg4FsKscEeVNzjdfNfePiO7jHdlHqpJZ7mbpEygFEKK96bDqnfHwau9Bx
         QCyUwjgdIVfs1RjS8Nrjeq9SD4v/XFLqilSnbFcVE70tOfhNNkTfL81YhCtQtmjsyYcr
         BHhc6nlrxeTQZpjT8KBQLOVV7vbIUVCK/G0k9PCwqQeARgiDo3R2GlMpaVRYq8uwFeEJ
         kZWobFOk/eoxK34ixwkQSYHhwIVB/QUkns0rGTyM17+cAVx0VFKQVbDBRIyS6GLYg4/W
         i79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700124; x=1793304924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io+g6hIKWvFq2IWPAUSEo1ar0ouYOg7HxlaXmXYkNnQ=;
        b=h43HnBNJDgWXszSoLeznKdDHfg8eOpnrALwFQOUTkvCxfiq6gnO5i1i2ZPXkT5yzwT
         egOi5TLjRj/Ndn4F9aosbLWYdnt8JZJ6RavY9l/yWFUZ0DtXdKnoYsT5iWGIuoCH946A
         VHJXXYRTYisAdjSfsLKLrjNw9scI1yHfK/E8f/mBC8hBCqfltsmY//Kkn3CKSF63BFXz
         0tA93UMCsvBFbS/Hvo4oJJ6qWAUP7vkzArSlghdomFVAXCwRcKar8klrSX4godO8huw2
         vUoSkSislpYKTxa39eu+mrJKoLr+yPPxr193vyPICWmQ3RPxnRqTJx1C3t6WHIfajFWL
         Kq+A==
X-Forwarded-Encrypted: i=1; AKwUvBwZJjyaxxSxsCa1syR2YgvTGGYL/nKufZxDgMBPeBuFVoiwHmeJX/3fVyArcFFgSVFMNpIKEkVk5w3TTW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFMZvRXeSPFO6B7XKx2yxdTL1MfjVv5CZGcJRXtYnsfZ2cya3x
	LJh1yhZ7oBjZsEIfk32FJW5uE6nqycukVZoT7LcbHjEINL3OHJqMK4qfqkSsOEHnSup9MHqBzxz
	9vh4Y8G05OA==
X-Received: from dlbsj2-n1.prod.google.com ([2002:a05:7022:f902:10b0:191:45cb:f8d3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b8f:b0:170:64b:b388
 with SMTP id a92af1059eb24-195c7e602f0mr528936c88.46.1792700124050; Thu, 22
 Oct 2026 13:15:24 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:40 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-8-irogers@google.com>
Subject: [PATCH v8 07/19] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.307.g5fe7bd680c-goog

