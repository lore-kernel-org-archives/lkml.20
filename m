Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4347DD72
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230464; cv=pass; b=q0pN0cfOBAddTKX/jdimML0ZDksjsnxq4EpSkhw5GUZXtoxNKSIFjxV0/Y9nTI1hewb8xOHDA/fIYt9rjJyWACDxp1Oskpih7hy1AtyYyssu2+HXl9dC7ckaWM777ROWDm8UYfLZJpaVJSjqi/xM2oK236tS9bYThzGikfr9OXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230464; c=relaxed/simple;
	bh=rjpdY34uKQUehIk/OgNGhjiYqC1iRSvcdZQVbKOU3Y0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Kj1VUzThE7jzZJ3F5eYMuiFHaGk4qMfgpWeZwjqNy11vWkXpJJYwZMnNCpx7KrmV4BsJg6aDjCgy1ooS6sWi/kKcOfN2BVUbFh4wVuLLI/8jtDyNYiJzYaZPGE6XatCfTqrroprhWwQIa1owbLqpfWJx5RQsASLmI0veb/saEyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs2X2wO8; arc=pass smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs2X2wO8"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so161621a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792230462; cv=none;
        d=google.com; s=arc-20260327;
        b=AAnYpuDcB0YA9xdbrIV1CW6FwvNWzvGmT9vgOJMi+V21198css01Q6D1KjMsAepZEM
         1CR9UNu2N82cgpMQLfUS1U3kQcKie9xa3gGGxjkIHFBasPm9NV+FU3cOphtjS7D+x39F
         4weg5Q5DbKbdAtSjjeXv6TA7xDetD6I4GrwUC8DDizaYYkyLmoMIGUOCyCvrrLIxj9Tf
         9YHDNuqtRsnOa+lnGUU414RuThROzBW85b3823oup+KW0KrMayDvIurTuSCqla3Zpf3J
         o7b7al9Fba0PSkph8aOxPyakvkR8ohW8TNlEy6D3i19CPx4LnB+Uiw5r46aHMbxycOMv
         ZgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EG+V9NyB1DOOLmRD6TGYC5DMbGTAzJJp2HxSlQNWrcc=;
        fh=sP22yd/xD63gLtQrZEeBNKYTC3frMvixRKBHhFgMmeg=;
        b=QGw5ly/XFJ/IpeDQrvfTDJsICwb8hEGtRVlFB77lIWug7P3D3rJ/nUKUilnOmp1T2R
         eg5SocFmwgNPNLEdv5IxOiDaQSCXvZ8NZo/yEbO+NYjHMCTZ4JkMfXBKnlxZ7RceNj3I
         +K42I+HJkjnHXjGhpj0DtfUCqA9cX3E8IIz1pkJB18sO38TIKq+96ieewbf5o307ZeuU
         fUiz0dpVOgJb9QQQrg42i4eC+kYk9ud3tL0vLexLPMH8zIhYVN4vdq+HNvOWNhIlbAT+
         VcfHJU4WLLgO3O0asWsLlty80T6/l2QomWZAyT9w1IP1zQmft0FoGJmAGwaHw6XRtiCF
         ve6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792230462; x=1792835262; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EG+V9NyB1DOOLmRD6TGYC5DMbGTAzJJp2HxSlQNWrcc=;
        b=Vs2X2wO8GQHfn3eKcaduFsWgQHDc7IXUn6l1IKE/yBHyfawi3cDZzhu6yAEp//GU2o
         w1DcU/4k1K7+Oxb6sJmNG1OINXtUz+q+K2OVNYzDPtEQ2UAC54ufEyBNRRLhGV+QHDLK
         UBwIPC7Sk+TLyn3KjLHcXAIcnC206XKsiOPaWzR0i6Gt6MGyeZdZINK7xBtCZnnCpEW7
         S8x6ZyvK0YZfJkmSq8eZmXxfTmadZz3XtLLGycRqEmBv5oemdz8WUNoZ6aECumrINMsQ
         714cn6XtQfeBHJB+y6z0RD4xgrN4c5kpJtp/hcg2lehBfe9Aoju6ADlljfD0M4fHerkJ
         0KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230462; x=1792835262;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EG+V9NyB1DOOLmRD6TGYC5DMbGTAzJJp2HxSlQNWrcc=;
        b=VdRFB41N9hdNSJ2Znu0uPmIhxyDYPzWLuExuT6TljnQ24C8d4NHLh3sChDNGSn7ZhD
         K6PnQWYeaZ3xf4hvQfEYOYZ2BUJNnqK0JIMm4r5Pl4sx6Gq3G0C0fPFa09hn2Uqfj5Bu
         dUS56ANrQFg0pzPEo4dd4JuD/V29M6clrKMvvx8XpdbnJRQZ35QIs23G9kTYOUBw9irL
         zv9CHwSnq36GZ3KCkxhyFSJkyfB1IJH5aDLysYAPBZFLTYI8L5MEGBVAQ4VyXXz6tfRm
         5PvSSlnUzsPIpiZSWujnZ+i2JZuQmvgVrAr5I45r6/JFnkUBMmScH1bI405LY1zjm9os
         OyEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwldsunJWF7LG57jGTuen+4GwEulx5DsBWC1JolGaC5SxFBxA9EEWDdN+s85MQEDztQoz3hheTEeFX9LRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiJi+/jgqxFzH2yyoYfPepPJqOC3AB1vjXOgWJLy0Hw7/45U+L
	0lrehxrbJORAXNek9JiYJlRRtE7on3YGSkAsTNpYrG+g8VlSmYlc05PEPacRwpu4xTpuDEKYEsq
	6wyHr2XlrQJclj6tW06RYfTbBxQZospM=
X-Gm-Gg: AYBFou3tyrByNiSXkVmi+UpX6AHU6n9BFpfM/Bw4Km5dDQbcoA4Qq3H9ANiU+NoJZFk
	KCnq0FhLU0gFXcmbPqaRbqUrQVXLh767O9UmmrHQYa2ODceqS7RTzbLgzNWOFbe20SmkvIYhyry
	PZmEfZsDnFO60u1U5Dahhx0KEUlwS9aSCEZDjcp1BwMn5a9tN30tacw9RUuwdKMJ/1kqtSP4dmv
	vsm0sDAqNeHi08I1m+dh9oibu/JKF6A9pYOcQiEM3oTwRtzr7UPFjjVZHEyR+jNN9Bxux51KOCN
	CIDCQ1Zoo11cfrYXX0OcqxVCxAwTVfy2Pmd/VB+OmGljqsrSXuKW8Taj84SceKsP3aQLqTTAuNW
	fbFVzjv3KPulbQS0r+IHN/ws7Q2uRhUeuk5Wr
X-Received: by 2002:a05:6a00:6c91:b0:881:4b47:f30b with SMTP id
 d2e1a72fcca58-8a04be573dcmr1589942b3a.12.1792230461791; Sat, 17 Oct 2026
 02:47:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 17 Oct 2026 02:47:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 17 Oct 2026 02:46:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 23:56:25 -0700
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 11:17:49 -0700
From: Yibiao Li <biaobiao2233@gmail.com>
Date: Sat, 17 Oct 2026 02:47:41 -0700
X-Gm-Features: AclHuK8dAION3V8ZMWvyk9OCN5wRUVIfPbGiHvJgNWePyjZ_nNh6PTuLO37abhQ
Message-ID: <CAG1agfz7AgAUWjyNTf7mbRwdf5_3y-wDBj=4-qw-vSpU7HaBPg@mail.gmail.com>
Subject: [PATCH] perf strlist: Preserve entries without a trailing newline
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Yibiao Li <biaobiao2233@gmail.com>

strlist__load() unconditionally replaces the last character read by
fgets() with a NUL byte. If the final line has no trailing newline,
this removes part of the entry instead. For example, a file containing
just "python3" is loaded as "python", so perf report --comms file://...
silently excludes samples from the intended command. The same loader
is used for file-based DSO and symbol filters.

Only remove the final character when it is a newline. Add regression
tests for empty files, blank lines, single-character entries, and
single- and multi-line lists with and without a trailing newline.

Fixes: 25903407da21 ("perf report: Add --dsos parameter")
Assisted-by: LLM
Signed-off-by: Yibiao Li <biaobiao2233@gmail.com>
---
Tested on aarch64 on a Singapore development server:
- Built perf with optional libelf, libtraceevent, Python, NUMA and BPF
  support disabled; no new compiler warnings.
- The new test fails on the original loader at the no-trailing-newline
  case and passes with the fix. All three util subtests pass.
- Recorded 12 cpu-clock:u samples from a short Python workload. With
  the original loader, --comms file://... reads an unterminated python3
  as python and displays no sample rows. With the fix, filter files
  with and without a trailing newline produce identical sample rows.
- The source diff passes checkpatch.pl --strict --no-signoff. The
  formatted mail also passes with UNKNOWN_COMMIT_ID ignored because
  the checkout is shallow; the Fixes commit and its original diff were
  independently verified against torvalds/linux.

AI assistance was used to inspect the loader, develop the fix and
regression tests, run validation, and prepare this message.

 tools/perf/tests/util.c   | 58 +++++++++++++++++++++++++++++++++++++++
 tools/perf/util/strlist.c |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/util.c b/tools/perf/tests/util.c
index f9abd9911..8345df0b5 100644
--- a/tools/perf/tests/util.c
+++ b/tools/perf/tests/util.c
@@ -2,10 +2,13 @@
 #include "tests.h"
 #include "util/blake2s.h"
 #include "util/debug.h"
+#include "util/strlist.h"

 #include <linux/compiler.h>
 #include <stdlib.h>
+#include <string.h>
 #include <string2.h>
+#include <unistd.h>

 static int test_strreplace(char needle, const char *haystack,
 			   const char *replace, const char *expected)
@@ -103,8 +106,63 @@ static int test__strreplace(struct test_suite *t
__maybe_unused, int subtest __m
 	return 0;
 }

+static int test_strlist_load(const char *contents, const char *first,
+			     const char *second)
+{
+	char path[] = "/tmp/perf-test-strlist-XXXXXX";
+	struct strlist *list = NULL;
+	unsigned int nr_entries = !!first + !!second;
+	ssize_t len = strlen(contents);
+	int fd, ret = TEST_FAIL;
+
+	fd = mkstemp(path);
+	if (fd < 0) {
+		pr_debug("mkstemp failed\n");
+		return TEST_FAIL;
+	}
+	if (write(fd, contents, len) != len) {
+		pr_debug("Failed to write string list\n");
+		goto out;
+	}
+
+	list = strlist__new(NULL, NULL);
+	if (!list || strlist__load(list, path)) {
+		pr_debug("Failed to load string list\n");
+		goto out;
+	}
+	if (strlist__nr_entries(list) != nr_entries ||
+	    (first && !strlist__has_entry(list, first)) ||
+	    (second && !strlist__has_entry(list, second))) {
+		pr_debug("Unexpected string list entries for '%s'\n", contents);
+		goto out;
+	}
+
+	ret = TEST_OK;
+out:
+	strlist__delete(list);
+	close(fd);
+	unlink(path);
+	return ret;
+}
+
+static int test__strlist_load(struct test_suite *t __maybe_unused,
+			      int subtest __maybe_unused)
+{
+	TEST_ASSERT_VAL("empty file", !test_strlist_load("", NULL, NULL));
+	TEST_ASSERT_VAL("blank line", !test_strlist_load("\n", "", NULL));
+	TEST_ASSERT_VAL("trailing newline", !test_strlist_load("nginx\n",
"nginx", NULL));
+	TEST_ASSERT_VAL("no trailing newline", !test_strlist_load("nginx",
"nginx", NULL));
+	TEST_ASSERT_VAL("single character", !test_strlist_load("x", "x", NULL));
+	TEST_ASSERT_VAL("multiple lines",
+			!test_strlist_load("sshd\nnginx\n", "sshd", "nginx"));
+	TEST_ASSERT_VAL("unterminated final line",
+			!test_strlist_load("sshd\nnginx", "sshd", "nginx"));
+	return TEST_OK;
+}
+
 static struct test_case tests__util[] = {
 	TEST_CASE("String replacement", strreplace),
+	TEST_CASE("Load string lists from files", strlist_load),
 	TEST_CASE("BLAKE2s hash", blake2s_case),
 	{ .name = NULL, }
 };
diff --git a/tools/perf/util/strlist.c b/tools/perf/util/strlist.c
index 50add7257..7cbc6dcb0 100644
--- a/tools/perf/util/strlist.c
+++ b/tools/perf/util/strlist.c
@@ -73,7 +73,8 @@ int strlist__load(struct strlist *slist, const char *filename)

 		if (len == 0)
 			continue;
-		entry[len - 1] = '\0';
+		if (entry[len - 1] == '\n')
+			entry[len - 1] = '\0';

 		err = strlist__add(slist, entry);
 		if (err != 0)

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.43.0
