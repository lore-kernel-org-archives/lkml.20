Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588146;
	b=ZtG1WFNOD+Tz/+C0iY7tMz2/vjoVOZSb8JQgSAZ255I5+Tf/KEfRqp6qaXmxa1Iyj1l1
	 7wIAmanDsFnhm/3T4VSolAEWn8D0RPLhJtORVwj6Ud0ylJOJcbxj4il84yMKID1CFLt4V
	 A3gNLoJUw418MPmqxVw4pPZ5g6phJTWK7yrMI5DFrVpxYs4LdkQWBIOXstAQC35DtQI/q
	 juW006ibtAbAFgm/5mzMYuJgl86jHui7mLWWU6RMb5FaOMgp5vxHdpgaU9nLpXhBQ3Efh
	 OdmRy1FkOrH6gS+XX6yVaEZeDHFNeJ2EX7HBdadzLzzv3DzXk7DTgGwYSS5U1XKI0Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bZ59TM7G2liEoxRRNzPtxFJR0P+j7mMrUkUWg+uPRjA=;
	b=cctFxM3fptNUYKtmOdjBVw4NZoDitfAaLXAiXs/eSMIpG59rrh1gkdSADlBJ0l/76ccw
	 6O9RRxfCOTUgJdPqq4iUOXxadD1hJS+ABfClsVWuEYdG2oXa2BdxbOjpCeZJNZ2/jyCG+
	 iaUFiAz6yPLOoMbB0L+l+r0oH5d57AA8op9Cth26WmMWG6paAJBAHRMktROpFyP8CK8Ly
	 JDItghTcUqPvF2M0/1NwEjyA6WX1rwc1xvgh4VdJ4ItqKPOK6Z5LxOXtTkJ4TCnZB4mdR
	 Kmugt0ilCsvD83Uo7Px6FJw1J2xu6cJhtz/Cf+9uvdYnoWA7ayRMx35Rxid/yjmbXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nVwbKdxK;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1726606C6A7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1726606C6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nVwbKdxK
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so1179076eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588145; x=1795192945; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ59TM7G2liEoxRRNzPtxFJR0P+j7mMrUkUWg+uPRjA=;
        b=nVwbKdxKvSXn+3ZKpSu+uem3Ewf5EHCqkj51kB7jGbfryJkTcmMFRtSK6S+v1zsm2L
         CcUl+HH/l+C7EuxGcXPKVs5dBClcWEpHAhIxEiZ0i0kqS8ojQg+T8UMJuHvu1QxOmxmT
         PokFayYdLTXOZbG2DOGzgSOy6BfxIqFKFyHws5SfNclaZGU1nBdF2MeR06Pkf2bieaPA
         MUxrqMkoPObqpmEzfozsCxwzYCiLfbcEX7dnXJM1JxBKjtXzPTvrlg/U8nwmd1eDoJ3X
         zSNBu6Rvq+cdMjbRxgsMSVADjRpa7Zo9mGO1vNCLkj5nxHDY4u2ldqn30gGVYf483sG9
         nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588145; x=1795192945;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZ59TM7G2liEoxRRNzPtxFJR0P+j7mMrUkUWg+uPRjA=;
        b=Wl3pIGlP1USBATqh71AI/KhHD88v7LXKog3uLfFwM08ZgH6pMIUIc5hHEr2KkdO9bU
         aH1j9jlLAo2H3tonbUEdOw7omhei1PWQNVIq2aakWO0CWo0D9dcFstohSdoaYqivc+PE
         0OQ+AhWxTjdFilhgqcwq8U8TjIJmoRk7AiMcyZyDloh60oudI722hVqub1V0FEUbhJBg
         b4hjCopCTMS39S2Gm5vyvL+sSpxFdvpnDpWUY5BANfKoGxSdjKFjTdyhOCzJDBR6RGx4
         PiYJxHgXEev6qKe8ormSWij6Ab+6MSFzaP05ANWyPtI1DWsPGZ3H4NdXC4nlFbWaHoaT
         Gv3g==
X-Forwarded-Encrypted: i=1; AL+hErEkqjX9w+irabzEh5oc9TEdf6X9wUjLF0cl5mxIKCs2E4lYEMvTGBQyj0LsDnFSWOMWhDViEtWMWMbWyCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OOJjE+A9UVcBYvJ8AsOBNyblM+wYQXlhuYB/LEtITxipOws0y
	fntoOl29GGHbT75rqmzdp61N//XJbmePMqtSiuAKn8rUODSO1suuTQOmFGgqlB5c2VILBJPICay
	EDI+FPYK7JQ==
X-Received: from dybph4.prod.google.com ([2002:a05:7301:4184:b0:370:f640:2508])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c88:b0:36d:7f5f:7e97
 with SMTP id 5a478bee46e88-37967dd734emr3997105eec.40.1794588144737; Fri, 13
 Nov 2026 08:42:24 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:43 -0800
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
Message-ID: <20261113164152.2095566-13-irogers@google.com>
Subject: [PATCH v13 12/21] perf dsos: Use read lock fast path in dsos__findnew_id()
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
Prioritize build IDs over inode fields in __dso_id__cmp(),
dso__needs_improve_id(), and __dso__improve_id() so an existing DSO with
a defined build ID is not updated with inode metadata.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c  | 55 +++++++++++++++++++++++++++---------------
 tools/perf/util/dso.h  |  1 +
 tools/perf/util/dsos.c | 10 ++++++++
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index f0e02062c09c..f736a94a53a9 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1649,6 +1649,11 @@ static void dso__set_long_name_id(struct dso *dso, const char *name, bool name_a
 
 static int __dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
+	if (build_id__is_defined(&a->build_id) && build_id__is_defined(&b->build_id)) {
+		if (a->build_id.size != b->build_id.size)
+			return a->build_id.size < b->build_id.size ? -1 : 1;
+		return memcmp(a->build_id.data, b->build_id.data, a->build_id.size);
+	}
 	if (a->mmap2_valid && b->mmap2_valid) {
 		if (a->maj > b->maj) return -1;
 		if (a->maj < b->maj) return 1;
@@ -1663,11 +1668,6 @@ static int __dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 		if (a->ino_generation > b->ino_generation) return -1;
 		if (a->ino_generation < b->ino_generation) return 1;
 	}
-	if (build_id__is_defined(&a->build_id) && build_id__is_defined(&b->build_id)) {
-		if (a->build_id.size != b->build_id.size)
-			return a->build_id.size < b->build_id.size ? -1 : 1;
-		return memcmp(a->build_id.data, b->build_id.data, a->build_id.size);
-	}
 	return 0;
 }
 
@@ -1685,6 +1685,20 @@ const struct dso_id dso_id_empty = {
 	}
 };
 
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id)
+{
+	const struct dso_id *dso_id = dso__id_const(dso);
+
+	if (!id || build_id__is_defined(&dso_id->build_id))
+		return false;
+
+	if (build_id__is_defined(&id->build_id))
+		return true;
+
+	return (id->mmap2_valid && !dso_id->mmap2_valid) ||
+	       (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid);
+}
+
 void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1692,22 +1706,25 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 	bool changed = false;
 
 	/* dsos write lock held by caller. */
+	if (!id || build_id__is_defined(&dso_id->build_id))
+		return;
 
-	if (id->mmap2_valid && !dso_id->mmap2_valid) {
-		dso_id->maj = id->maj;
-		dso_id->min = id->min;
-		dso_id->ino = id->ino;
-		dso_id->mmap2_valid = true;
-		changed = true;
-	}
-	if (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) {
-		dso_id->ino_generation = id->ino_generation;
-		dso_id->mmap2_ino_generation_valid = true;
-		changed = true;
-	}
-	if (build_id__is_defined(&id->build_id) && !build_id__is_defined(&dso_id->build_id)) {
+	if (build_id__is_defined(&id->build_id)) {
 		dso_id->build_id = id->build_id;
 		changed = true;
+	} else {
+		if (id->mmap2_valid && !dso_id->mmap2_valid) {
+			dso_id->maj = id->maj;
+			dso_id->min = id->min;
+			dso_id->ino = id->ino;
+			dso_id->mmap2_valid = true;
+			changed = true;
+		}
+		if (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) {
+			dso_id->ino_generation = id->ino_generation;
+			dso_id->mmap2_ino_generation_valid = true;
+			changed = true;
+		}
 	}
 	if (changed && dsos)
 		dsos->sorted = false;
@@ -1715,7 +1732,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
-	if (a == &dso_id_empty || b == &dso_id_empty) {
+	if (!a || !b || a == &dso_id_empty || b == &dso_id_empty) {
 		/* There is no valid data to compare so the comparison always returns identical. */
 		return 0;
 	}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index e8cd13c101a6..bb887d10a9ee 100644
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
index a7f6a98acbaf..4ff38cb5e2cb 100644
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
2.56.1.703.gf848ed807c-goog

