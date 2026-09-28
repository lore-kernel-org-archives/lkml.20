Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750F438C2D1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619986; cv=none; b=MeSr0S8lsZEEQXfWmzIYVWzK0jt19Q/XchhkuSZHgXxtLdFaJ79a6TqHoh4QliS5QZFIsMrjadIJvX/oQAP7wdZadbZ+0oinrmab+AGgNj1VVyWMemIdu7ifDaWLCo1+r+/oZ19v2OElu6OyLXrYVVzMnhqR7c/EIA2CIww+oHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619986; c=relaxed/simple;
	bh=OTGqkvF7CObOWjaDlCrLeEVWJIgfXoeSy4z3eQH1DQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L/S1e4mBDkVhHaSn0hyp7QqNDVPGP1HW1qr0cdPM1zbiU6CH6DFMdnvxC2juQvOHu39EJAN7edt6G3M5TEl8Imh0UzvGDhsvGhUimfd9Zk/RK7vAnObg32TcUoOxEBFLKFu69DhqpMaTj8X9pI+VmA6AsQsg7f7YME/dhOA07/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GMBZVytM; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GMBZVytM"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14383177746so7013669c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619984; x=1791224784; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRBtK9kiySExwfhGGRen2OSbXppmAN9zPrV3gmDAXVc=;
        b=GMBZVytMZIIqRYMkJzgvmUwvgUt/oaKdXbFGwtZGd8JxSxiifSCxz4IRXpYnOLRknu
         /MQfXf6QQnxsZ/f+JPXrsKg0pIfWrct3b0BpLIqqbNCDZNoKvIy0h1Xzt3frYxod9JRl
         92yAr1AZlGgZoLNNeqjiAtdhZbXiCASt99L3AnmmCy/SVkGxzFCmndm3AdVUcNxMVS20
         Jd3sBpHY+eZWvxyGd7n4bpEINL1H3wrr+qUHw4JJhb84Zi3q9H+aXIhhYfE+3jdF8yDG
         EHa+Cj/mzlH4OFDs87mw35dEbb1rqk5fayPWHBrZ21Nm6rncGqwsHQsT8zmk8kiKUTiv
         n/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619984; x=1791224784;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRBtK9kiySExwfhGGRen2OSbXppmAN9zPrV3gmDAXVc=;
        b=UxQancytJci7XoU1N/7KsWj8odthlHbCTi9Nbe379kANRKZgMqcFDkZFuTm873n9oS
         tKxpVt8mUUFPsSi++9JPw/E0Wjsw5Gd/NtjeHYiDLEvKnz8EuKxzGayPA43EEIKMkye8
         dQL3oc1T1VI471klZ4xFMDw9cp8MKoX7P5I1Pt4txhhM7ZFhWjZ9e4trqPSx2QUfjJZF
         IBFdPLEN+GEL91Lvi5fSVQvRaltFrZV1i7whTqsLUuY+6Rfs9ke7/l7WbqgSu5A7iXc/
         eAcb0HtAFdUpZ+NQSLEhD+dUWX0RrlCoeWXeZ5RRrh0wnq7R/e3E9Aq1wYyK7OCIt/GG
         R7Cw==
X-Forwarded-Encrypted: i=1; AKwUvBw6kqV7rvJzdTxJ58DOppT5ewZ49o14Q3cGbmvYkLITSxHFjP7IXHfB0ixGuY09p9BvWeNV36JAbvNvFv8=@vger.kernel.org
X-Gm-Message-State: AFuF++kGmQzvHuYpYCeg4qu2wGY8D+bjpL1ddN9ebbi5+Dl+fhqOcIxv
	YU45KZ3LCGBLT5PMJJCSb7o1VuCT0iZ9t/3Wl6Ux1OgpJET7Y0g1It5anM/2gnzDjzNHjE/1+Ge
	3vu1oBlZyKg==
X-Received: from dlbrx24.prod.google.com ([2002:a05:7022:1718:b0:149:d37b:308a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4241:10b0:147:9ad0:cf10
 with SMTP id a92af1059eb24-1479ad0d20cmr9735324c88.47.1790619984195; Mon, 28
 Sep 2026 11:26:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:44 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-6-irogers@google.com>
Subject: [PATCH v6 05/26] perf trace: Bound the fixed size augmented argument beautifiers
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The timespec, sockaddr and perf_event_attr beautifiers read a fixed size
type from the payload without checking its size. The sockaddr payload is
addrlen bytes and the perf_event_attr payload is attr.size bytes, both
chosen by the tracee.

Check the payload with syscall_arg__augmented_args_valid(). Pass its size
to the address family printers, which also bounds the AF_LOCAL path that
needn't be NUL terminated. Like the kernel, accept an AF_INET6 address
without sin6_scope_id, RFC 2133's 24 bytes. Copy the perf_event_attr into
a zero padded local, as perf_event_attr___scnprintf() reads a whole
struct.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/trace/beauty/perf_event_open.c | 31 ++++++--------
 tools/perf/trace/beauty/sockaddr.c        | 49 +++++++++++++++++------
 tools/perf/trace/beauty/timespec.c        |  2 +-
 3 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/tools/perf/trace/beauty/perf_event_open.c b/tools/perf/trace/beauty/perf_event_open.c
index 6315b46bcdf0..bfdf322c6ede 100644
--- a/tools/perf/trace/beauty/perf_event_open.c
+++ b/tools/perf/trace/beauty/perf_event_open.c
@@ -81,33 +81,28 @@ static size_t perf_event_attr___scnprintf(struct perf_event_attr *attr, char *bf
 
 static size_t syscall_arg__scnprintf_augmented_perf_event_attr(struct syscall_arg *arg, char *bf, size_t size)
 {
-	struct perf_event_attr *attr = (void *)arg->augmented.args->value;
+	const struct augmented_arg *augmented_arg = arg->augmented.args;
 	struct perf_event_attr local_attr;
+	size_t copied = (size_t)augmented_arg->size;
 
-	/*
-	 * augmented_raw_syscalls.bpf.c (shipped with perf) copies
-	 * PERF_ATTR_SIZE_VER0 bytes when the tracee passes size=0,
-	 * but leaves the size field as 0.  The payload size is
-	 * guaranteed by perf's own BPF program, not externally
-	 * controllable.  Copy to a local so we can fix up size
-	 * without writing to the potentially read-only augmented
-	 * args buffer.
-	 */
-	if (!attr->size) {
-		memcpy(&local_attr, attr, PERF_ATTR_SIZE_VER0);
-		memset((void *)&local_attr + PERF_ATTR_SIZE_VER0, 0,
-		       sizeof(local_attr) - PERF_ATTR_SIZE_VER0);
+	/* Zero pad, as the tracee's attr may be smaller than perf's. */
+	if (copied > sizeof(local_attr))
+		copied = sizeof(local_attr);
+
+	memcpy(&local_attr, augmented_arg->value, copied);
+	memset((void *)&local_attr + copied, 0, sizeof(local_attr) - copied);
+
+	/* The BPF program copies PERF_ATTR_SIZE_VER0 bytes for size 0. */
+	if (!local_attr.size)
 		local_attr.size = PERF_ATTR_SIZE_VER0;
-		attr = &local_attr;
-	}
 
-	return perf_event_attr___scnprintf(attr, bf, size,
+	return perf_event_attr___scnprintf(&local_attr, bf, size,
 					   trace__show_zeros(arg->trace));
 }
 
 size_t syscall_arg__scnprintf_perf_event_attr(char *bf, size_t size, struct syscall_arg *arg)
 {
-	if (arg->augmented.args)
+	if (syscall_arg__augmented_args_valid(arg, PERF_ATTR_SIZE_VER0))
 		return syscall_arg__scnprintf_augmented_perf_event_attr(arg, bf, size);
 
 	return scnprintf(bf, size, "%#lx", arg->val);
diff --git a/tools/perf/trace/beauty/sockaddr.c b/tools/perf/trace/beauty/sockaddr.c
index a17a27ac2a6f..b4b188879598 100644
--- a/tools/perf/trace/beauty/sockaddr.c
+++ b/tools/perf/trace/beauty/sockaddr.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2018, Red Hat Inc, Arnaldo Carvalho de Melo <acme@redhat.com>
 
 #include "trace/beauty/beauty.h"
+#include <stddef.h>
 #include <sys/socket.h>
 #include <sys/types.h>
 #include <sys/un.h>
@@ -10,36 +11,57 @@
 #include "trace/beauty/generated/sockaddr.c"
 DEFINE_STRARRAY(socket_families, "PF_");
 
-static size_t af_inet__scnprintf(struct sockaddr *sa, char *bf, size_t size)
+static size_t af_inet__scnprintf(struct sockaddr *sa, size_t sa_size, char *bf, size_t size)
 {
 	struct sockaddr_in *sin = (struct sockaddr_in *)sa;
 	char tmp[16];
+
+	if (sa_size < sizeof(*sin))
+		return 0;
+
 	return scnprintf(bf, size, ", port: %d, addr: %s", ntohs(sin->sin_port),
 			 inet_ntop(sin->sin_family, &sin->sin_addr, tmp, sizeof(tmp)));
 }
 
-static size_t af_inet6__scnprintf(struct sockaddr *sa, char *bf, size_t size)
+static size_t af_inet6__scnprintf(struct sockaddr *sa, size_t sa_size, char *bf, size_t size)
 {
 	struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)sa;
-	u32 flowinfo = ntohl(sin6->sin6_flowinfo);
+	u32 flowinfo;
 	char tmp[512];
-	size_t printed = scnprintf(bf, size, ", port: %d, addr: %s", ntohs(sin6->sin6_port),
-				   inet_ntop(sin6->sin6_family, &sin6->sin6_addr, tmp, sizeof(tmp)));
+	size_t printed;
+
+	/* RFC 2133's version, which the kernel accepts, lacks sin6_scope_id. */
+	if (sa_size < offsetof(struct sockaddr_in6, sin6_scope_id))
+		return 0;
+
+	flowinfo = ntohl(sin6->sin6_flowinfo);
+	printed = scnprintf(bf, size, ", port: %d, addr: %s", ntohs(sin6->sin6_port),
+			    inet_ntop(sin6->sin6_family, &sin6->sin6_addr, tmp, sizeof(tmp)));
 	if (flowinfo != 0)
 		printed += scnprintf(bf + printed, size - printed, ", flowinfo: %lu", flowinfo);
-	if (sin6->sin6_scope_id != 0)
+	if (sa_size >= sizeof(*sin6) && sin6->sin6_scope_id != 0)
 		printed += scnprintf(bf + printed, size - printed, ", scope_id: %lu", sin6->sin6_scope_id);
 
 	return printed;
 }
 
-static size_t af_local__scnprintf(struct sockaddr *sa, char *bf, size_t size)
+static size_t af_local__scnprintf(struct sockaddr *sa, size_t sa_size, char *bf, size_t size)
 {
 	struct sockaddr_un *sun = (struct sockaddr_un *)sa;
-	return scnprintf(bf, size, ", path: %s", sun->sun_path);
+	size_t path_size;
+
+	if (sa_size <= offsetof(struct sockaddr_un, sun_path))
+		return 0;
+
+	/* The path needn't be NUL terminated. */
+	path_size = sa_size - offsetof(struct sockaddr_un, sun_path);
+	if (path_size > sizeof(sun->sun_path))
+		path_size = sizeof(sun->sun_path);
+
+	return scnprintf(bf, size, ", path: %.*s", (int)path_size, sun->sun_path);
 }
 
-static size_t (*af_scnprintfs[])(struct sockaddr *sa, char *bf, size_t size) = {
+static size_t (*af_scnprintfs[])(struct sockaddr *sa, size_t sa_size, char *bf, size_t size) = {
 	[AF_LOCAL] = af_local__scnprintf,
 	[AF_INET]  = af_inet__scnprintf,
 	[AF_INET6] = af_inet6__scnprintf,
@@ -47,7 +69,9 @@ static size_t (*af_scnprintfs[])(struct sockaddr *sa, char *bf, size_t size) = {
 
 static size_t syscall_arg__scnprintf_augmented_sockaddr(struct syscall_arg *arg, char *bf, size_t size)
 {
-	struct sockaddr *sa = (struct sockaddr *)&arg->augmented.args->value;
+	const struct augmented_arg *augmented_arg = arg->augmented.args;
+	struct sockaddr *sa = (struct sockaddr *)&augmented_arg->value;
+	size_t sa_size = (size_t)augmented_arg->size;
 	char family[32];
 	size_t printed;
 
@@ -55,14 +79,15 @@ static size_t syscall_arg__scnprintf_augmented_sockaddr(struct syscall_arg *arg,
 	printed = scnprintf(bf, size, "{ .family: %s", family);
 
 	if (sa->sa_family < ARRAY_SIZE(af_scnprintfs) && af_scnprintfs[sa->sa_family])
-		printed += af_scnprintfs[sa->sa_family](sa, bf + printed, size - printed);
+		printed += af_scnprintfs[sa->sa_family](sa, sa_size, bf + printed, size - printed);
 
 	return printed + scnprintf(bf + printed, size - printed, " }");
 }
 
 size_t syscall_arg__scnprintf_sockaddr(char *bf, size_t size, struct syscall_arg *arg)
 {
-	if (arg->augmented.args)
+	/* The family printers check the rest of the payload. */
+	if (syscall_arg__augmented_args_valid(arg, sizeof(sa_family_t)))
 		return syscall_arg__scnprintf_augmented_sockaddr(arg, bf, size);
 
 	return scnprintf(bf, size, "%#lx", arg->val);
diff --git a/tools/perf/trace/beauty/timespec.c b/tools/perf/trace/beauty/timespec.c
index b14ab72a2738..8da0b28be0af 100644
--- a/tools/perf/trace/beauty/timespec.c
+++ b/tools/perf/trace/beauty/timespec.c
@@ -14,7 +14,7 @@ static size_t syscall_arg__scnprintf_augmented_timespec(struct syscall_arg *arg,
 
 size_t syscall_arg__scnprintf_timespec(char *bf, size_t size, struct syscall_arg *arg)
 {
-	if (arg->augmented.args)
+	if (syscall_arg__augmented_args_valid(arg, sizeof(struct timespec)))
 		return syscall_arg__scnprintf_augmented_timespec(arg, bf, size);
 
 	return scnprintf(bf, size, "%#lx", arg->val);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

