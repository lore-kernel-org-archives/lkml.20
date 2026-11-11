Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418955;
	b=wN1PgCpNSWCPHjcTzlEDIw3eMAbfTcqPUnvDeGAznNjIWKdq2lg/XIEIeyGcDSuqcEQg
	 mV4dnIzANahuelcOsB+l+CdjOGGiVIkZ4Xxv5VZ5LblX+97xWMdp/+qBuCKaeL6Z6Xij9
	 sP79CFSKQ1JttmN5nDASFs6PbNtnZFc80Xg5migwW3RbXD33tiFiCGRtDprPcjyn3hu6f
	 Q73Ysj7wyg/yXxb4qY4v+u4fj0mzAMtC1tEk+APYduWY5wRY8sh11kFuqUZ79Kxub1l7P
	 JMJP9KuuxIwoWcy94zPTl7ozkCPmgLqm52vcWm9ZwDdizcSiFm4b8tQmT1AQOjwvRaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=J9w5zmFtKiSVqTGYlLkd9EMsp7yzYMD+0yteXPtAKek=;
	b=k1lFdcmDltxNBPBexacUuphyazuFLccRTfO/SX19VMih9UKYWhGn79R78jIydrWxZZ/F
	 1bG7TFh1GP5/xrgf7WVwDnWvfXl1QiaCa/jJbtkq5JjivQTttH0Pp+vAw2iM8R5AZzHSQ
	 q/nhQ7egYX+FNysROzOYH43lH8h3aabhsRsG9EyleItYUmu9SwGCpyRZZ/7aObk9IbG5F
	 xoezsN5n0m20hdcP3di/xGSj5wjCOwaOqiuM3cvcpH5WWmwq1kzuCKMAum0JZo84F7jzp
	 0VEb8jNTF+eZR3rnRj6nJMrYib0uqaXolBesq553OCK2tp6yWFinkz+lqseGFUIpJBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ier49x6G;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3704606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3704606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ier49x6G
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so4387965c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418954; x=1795023754; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9w5zmFtKiSVqTGYlLkd9EMsp7yzYMD+0yteXPtAKek=;
        b=ier49x6G+NuV2GOdqD0ecaUppsG7fpigrHtiMwPbBDVAK9Vxpk/gcgNTeFTKsD6ERV
         PQTZ2mtpPLcu1hv71/1SDeb/S6rHELYBbpbb3rccn13LKO5FtkequzYKqhOttIrJtBLI
         Xw8f6qW+HRa7Y3gbYXBYEr0Cy3/pPULNzVi44ZdwPQyiVTZZ/NoXAMj8U5NPm1zHDJJo
         GBQRJmG+hUZGQXVvh1iC0zEUp+RC5yREbtupap0nu3Rk8BFMaxhQuuX3zY0a0e6g4ZGK
         a8F52t4oyxnwR3ZPsHI0QVqK8SzAqb9aQlDK6JSREzrHywMY+yKrzUgVuQEoBdjHgoZo
         R8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418954; x=1795023754;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9w5zmFtKiSVqTGYlLkd9EMsp7yzYMD+0yteXPtAKek=;
        b=n5NJOyTBLSiVtMjD4ybOto516NL9w/XukKCKfT9K3ImsAGQZiWqslZd0mYHGunaced
         1fzdxczXbtvY8tAeyJnIzTr17DgzCd1Fovc2z4BNLPfaGsvH+ow9J5qtlkCjqMdpnk4D
         5Hu0vjHg2rCx4SzmRz7h/5EuWFiwSFDW1+JAYFXWmB7X2CP2B9YMW5NA5c9Es3d8G4kb
         9sfhP0U7utX3kaHt7XCZGUPz7vQtVg0bEr96junOKKhpvEXNv5QWKBcrtW6kffqxqmXS
         z63251iMWpKAi3YyGekvKB1kFOAzwHEe5o+qFWSXL4hEmXrcQBtG17Dh20U+yc8ce3Nz
         mdUg==
X-Forwarded-Encrypted: i=1; AL+hErFqBvq6ITVwdBQo1yvlOo9Num6MQdw06xzFfftu5gbnsAHGWySse+ROzMKupNW9CZCvUcDJs1z2RajBvW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VM8JEb6cAYI4seE0qL8y5q8/kpvmXJearbU0YZJ2RuDNehTs6
	qCcWt0dAj0YZMsxwz40OcFACOYRmZhhjlw+fKHWj8zPTEOkdK+HWBYs3C3akCzVTUnxW3RQ2tvk
	MPIwj+qMsGQ==
X-Received: from dlai4.prod.google.com ([2002:a05:701b:2704:b0:196:8199:c26c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:280a:b0:1b0:c224:5bdc
 with SMTP id a92af1059eb24-1b3c02f0c64mr2523914c88.14.1794418953777; Wed, 11
 Nov 2026 09:42:33 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:59 -0800
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
Message-ID: <20261111174213.3526604-8-irogers@google.com>
Subject: [PATCH v12 07/20] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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
2.56.0.542.g3ef89b7020-goog

