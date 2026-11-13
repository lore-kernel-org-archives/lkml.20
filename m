Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588135;
	b=5UEi0eyXaWGIAEQ9MTpmyRcKVpm7Uy1XkY6azbXE8DLDvOftEF9VArbCYXcIL6CWn2bN
	 v51uwc3W9C5Pp/1DED5umFzuA3PqNVEMaP9Phd3Jxz2EymW3NbRlth8Gq+o2evbtNBDKb
	 mLBYfgc3Gg9iIcqk2Rp76PUReGAc2O5dBS6usyzjtjsspNh+za31OvCA7l+3CJ4gNcm1o
	 mvR4SCcO9cwyo12hDS04bbiMyWLsnO3AMV66M0vINI91Kp0l1PVwbfCdUK03EGSdbDKa2
	 zsvTxiVIw9+rlEMdBJC2jwh3T6k4VW8Oh5rntyDGYi01JFObmFRAd6+QY/W2blEsyvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zCyaghSDqjXW6LNbZUat5KU+ipYJ5inUWt9OnDOPipU=;
	b=Hb1ULM8r15wv/4fZpErpgW+sgDhSpPtvd9xI17tvhc7oqJ82KpZ/o+jkjDn48t2SK7Fh
	 bDATi8qGmQlv1Dozp03B4xg7SBXXpkZIFTVojQLH3D5sRE79dkvrvVUamRteJwyoGZEsN
	 KAN9F3Xd4c9dZSNHW19+ZK7Zf3D0i7wrJ6Gs9DhRXBOtUDve+fST/pFN67SLLVFZ3t0Dw
	 6x9g3rAKNQ5K8UvaiFItvarbwHEZyvNsQrrNHKsUtaTQkzYQOAsIVRkEuBE2wrlmkHeGP
	 6NCRSD16VnY08LOgXJWOhRnLpiAsVtfwgUI6e69n8BR36dJCKWZDjsmG7PQ4SpkLo9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c99DUNEB;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC8606BCA8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DC8606BCA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c99DUNEB
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1437302eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588134; x=1795192934; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCyaghSDqjXW6LNbZUat5KU+ipYJ5inUWt9OnDOPipU=;
        b=c99DUNEBE0KozrG+UA24T9dvSK6dADGS2/+tshVvZ//6XIsLRbHXqL4njk3/OkynP3
         cfEJZ+u092p97+Yu1R1JkF+D+u94IagI+vsDgkiEvCaPGyRty9kswl8qf5DiYxmw224E
         YwZftfBJQoNmDDetZ5zgoYtJfYIbbiTAT+f7pYm+T7R+WEaeQxf7jeCLDdwlomVZKI+W
         YPuQEt0H81oJkO/lCyxziH0gagFVwWWkWw43SJoksa+C5bRG5GuROTGL5aDQ+RgkB2Z9
         XMJJIY8eHRwYr1jDxMs6RWL0FQMwF1bCmny4PNaEcNsZ/1ke/O4tRIy0r5uWX3PsGodZ
         t1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588134; x=1795192934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCyaghSDqjXW6LNbZUat5KU+ipYJ5inUWt9OnDOPipU=;
        b=QsgHPZtopP+v23vsqpQfw3p1q2IKW09FNb0VIwh3PUTAFo1MKxfSlxewHdyjHRn08k
         yE72AHuNNzDsa94IxIcjipsyXy65Sg/57/XcWU3gxjJ9UzgyD8NFYDM6T7DqvGLKmE1w
         4otSu+yhLEx4Lhs20fl3NuN7SCRMVyUD7W3qjtlyuUEZE5L9CT2H0c9OjUFlN7qYfN68
         1nrtjJ4nYNCNYjLkQmCsEqokhGVkd+nltOsCEAL9/QlB/lrP22NrFHjxazrOHyQJ9C6T
         3rfAs71oxce2IuXMKQccUWvtumtO4KVMFKdOjvQsY4KZ/ofiuwYJJ1MrBl6ENXuh1e/1
         yX3Q==
X-Forwarded-Encrypted: i=1; AL+hErF0Io/jUKJ6dPuzPfr1Say4dcgTxs1eJ31Za1bh31xxvfim25U1F1OnVcQkjCmEujaK5DhBPuGWzrqJjv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wIs0Up+eWlq6eDPL4bFo7+s5cUsh7KNURVVcncKdxPHRH5Nm/
	CJdhzsHdpOf4hc1nSFf7ldAoCNLt+aDDR+5olleSi1RIz2VSy5/icgZIAxYCD2Motbkpao/yfMJ
	nA7VGq3AgNw==
X-Received: from dycqz10.prod.google.com ([2002:a05:7301:df4a:b0:359:72f9:2aab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b284:b0:35e:2c6:d46c
 with SMTP id 5a478bee46e88-37966e3abf5mr3032399eec.10.1794588134111; Fri, 13
 Nov 2026 08:42:14 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:38 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-8-irogers@google.com>
Subject: [PATCH v13 07/21] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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
2.56.1.703.gf848ed807c-goog

