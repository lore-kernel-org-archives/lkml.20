Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524638737B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619986; cv=none; b=P2C8ZjajFP0o1hC1Yj79Q5pRqt1LdjTBp7gQMNg1AA4fOkk6yjdGgsRV8lIPlhw4DvM8Z6uYU/sXduihXYtqZ1RHbTd7EvIgfgDCLJEGXQH9vSb/UXQfyDC3O/vNQqDeiY3Mnbi3KGyS1xLiMmXpIERp3R0Mant3a6zE19wtKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619986; c=relaxed/simple;
	bh=w3NlFEyvJzAZZmgJDlvt3CnOvZGGYsCxvh+RIGdOzFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D2qL9hA+TO5o01qiFTYnPFjMdIFBNHb8edzzc8zKGlTf4Ke+pFb/2B29sM01dTeeQADNZRJwQ3utbEfalyU3y9YCGyxZLlCwJZhpsFfjjnGkmnrHPjt0bpANbCgizkDv5npewZuYa9tSR24jKFP90o4ZPrLuHyQF46wgGn0t2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nHe7fEQo; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nHe7fEQo"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-349ffa249bdso1707860eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790619983; x=1791224783; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqU6q1a737Hr+IBPpKcss3zkg1I0C64fANCvsqa/Of4=;
        b=nHe7fEQot5OwPIm+JpavhH9XGAGuxsMB1fGql5RYCvdrlpmbMqVE0WGVykuGrcrjos
         Sr9YVJ1GDpI9jt7lD6a5rZTHNtHFT+P8Tj5VRLEGLTe7GF/TOj6OadyvuC4dogESsyyH
         rSnwOPp+W+Y0s2lLPUkPStVBGqCbhtJVa1zWjB5hP+C9kDCvuejLArYfug40IPC0CT4D
         DryMvCOfKIlLkO4Guksf8LF0Kx59qb4KuMtpbzsiRf0Vj8Bt4k1XhYVkxTvQIVGUCZic
         EgJNKlcnswgEQlPRePBGpIVVdK8yPnlGgvAJ+VpSplJEdeq0njJlm+InhlRaqbP4R7SH
         iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619983; x=1791224783;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqU6q1a737Hr+IBPpKcss3zkg1I0C64fANCvsqa/Of4=;
        b=yareN/Z639/P2rNeTW4erqo8y/jhgQaOsT09Rn27keFo9oRDaWZuAOrlA+wuHw4nZa
         aGxMQmDq0Ck6L9EYb0FHc3qDURHlBnir7ZyVNE+RqZG5MiZHnJN4naHxlRwty6Cllbxa
         CJI5VXECKU3j21SRlPlo0mSjZ+OtJnLlXA4ivarMqJNbsIzb42SwibD0ukv7H1+5HBuV
         YMU+UhQn5xe75XkmXdEwDPOom6BozscfKae7wx9A7Tg5bJMa5hC/llXiHo1s5m8+wQFu
         asoTh3yGamqNB0QswvBqpI0HdRIyWANcrXitw5LuZUg758X5+CVpub52KZNDEWSIIhjq
         n7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV3/8RAJw1hNBWWjDt/BCPvOXF8Vj9zdQKtBY+joLtX1yltFkQaVpQCeZl/uXsFAhowa+W6Kahjl00Fr0=@vger.kernel.org
X-Gm-Message-State: AFuF++kxQELTENgWAcyI2oV+QZdood8ShYpsxZEcsAfH4WSnGUeF1gy9
	BlLzc921BlHlnftsiMrnYX2hMvk64mpEMewDSH5JUGqBIqr9FAp9kpUEjXiCxZffxSiQW9gUdCT
	hqXRhimVMtQ==
X-Received: from dlbep6.prod.google.com ([2002:a05:7022:1086:b0:144:c2f8:c025])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f12:b0:139:d82f:2fdd
 with SMTP id a92af1059eb24-146ce1aa79fmr9930472c88.8.1790619982141; Mon, 28
 Sep 2026 11:26:22 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:25:43 -0700
In-Reply-To: <20260928182605.3649015-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790145937.git.irogers@google.com> <20260928182605.3649015-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928182605.3649015-5-irogers@google.com>
Subject: [PATCH v6 04/26] perf trace: Bounds check augmented arguments before
 reading them
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Howard Chu <howardchu95@gmail.com>, Jakub Brnak <jbrnak@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

syscall_arg__scnprintf_buf() and syscall_arg__scnprintf_augmented_string()
trust the augmented arg's size, so a bad one reads out of bounds:

  #3 0x4c0fa0 in syscall_arg__scnprintf_buf builtin-trace.c:1955
  #4 0x4c2f3d in syscall_arg_fmt__scnprintf_val builtin-trace.c:2632
  #5 0x4c33ae in syscall__scnprintf_args builtin-trace.c:2722
  #6 0x4c43d3 in trace__sys_enter builtin-trace.c:3094
  #7 0x4c7865 in trace__handle_event builtin-trace.c:4013

Move the check in btf_struct_scnprintf() to a helper,
syscall_arg__augmented_args_valid(), and use it in both. When the check
fails, syscall_arg__scnprintf_filename() now falls back to vfs_getname or
the pointer.

Reported-by: Arnaldo Carvalho de Melo <acme@kernel.org>
Closes: https://lore.kernel.org/linux-perf-users/arJ-gpzqOHk-gF8T@x2/
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c       | 23 ++++++++++++++---------
 tools/perf/trace/beauty/beauty.h | 17 +++++++++++++++++
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index c39de91140a0..85db74965280 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -1139,14 +1139,11 @@ static size_t btf_struct_scnprintf(const struct btf_type *type, struct btf *btf,
 	LIBBPF_OPTS(btf_dump_opts, dump_opts);
 	LIBBPF_OPTS(btf_dump_type_data_opts, dump_data_opts);
 
-	if (arg == NULL || arg->augmented.args == NULL || arg->augmented.size < (int)sizeof(*augmented_arg) ||
+	if (!syscall_arg__augmented_args_valid(arg, type->size) ||
 	    arg->fmt == NULL || !arg->fmt->from_user)
 		return 0;
 
 	augmented_arg = arg->augmented.args;
-	if (augmented_arg->size <= 0 || augmented_arg->size > arg->augmented.size - (int)sizeof(*augmented_arg) ||
-	    (size_t)augmented_arg->size < type->size)
-		return 0;
 
 	dump_data_opts.compact	  = true;
 	dump_data_opts.skip_names = !arg->trace->show_arg_names;
@@ -1904,12 +1901,18 @@ static void thread__set_filename_pos(struct thread *thread, const char *bf,
 static size_t syscall_arg__scnprintf_augmented_string(struct syscall_arg *arg, char *bf, size_t size)
 {
 	struct augmented_arg *augmented_arg = arg->augmented.args;
-	size_t printed = scnprintf(bf, size, "\"%.*s\"", augmented_arg->size, augmented_arg->value);
+	size_t printed;
+	int consumed;
+
+	if (!syscall_arg__augmented_args_valid(arg, 0))
+		return 0;
+
+	printed = scnprintf(bf, size, "\"%.*s\"", augmented_arg->size, augmented_arg->value);
 	/*
 	 * So that the next arg with a payload can consume its augmented arg, i.e. for rename* syscalls
 	 * we would have two strings, each prefixed by its size.
 	 */
-	int consumed = sizeof(*augmented_arg) + augmented_arg->size;
+	consumed = sizeof(*augmented_arg) + augmented_arg->size;
 
 	arg->augmented.args = ((void *)arg->augmented.args) + consumed;
 	arg->augmented.size -= consumed;
@@ -1922,7 +1925,7 @@ static size_t syscall_arg__scnprintf_filename(char *bf, size_t size,
 {
 	unsigned long ptr = arg->val;
 
-	if (arg->augmented.args)
+	if (syscall_arg__augmented_args_valid(arg, 0))
 		return syscall_arg__scnprintf_augmented_string(arg, bf, size);
 
 	if (!arg->trace->vfs_getname)
@@ -1938,13 +1941,15 @@ static size_t syscall_arg__scnprintf_filename(char *bf, size_t size,
 static size_t syscall_arg__scnprintf_buf(char *bf, size_t size, struct syscall_arg *arg)
 {
 	struct augmented_arg *augmented_arg = arg->augmented.args;
-	unsigned char *orig = (unsigned char *)augmented_arg->value;
 	size_t printed = 0;
+	unsigned char *orig;
 	int consumed;
 
-	if (augmented_arg == NULL)
+	if (!syscall_arg__augmented_args_valid(arg, 0))
 		return 0;
 
+	orig = (unsigned char *)augmented_arg->value;
+
 	for (int j = 0; j < augmented_arg->size; ++j) {
 		bool control_char = orig[j] <= MAX_CONTROL_CHAR || orig[j] >= MAX_ASCII;
 		/* print control characters (0~31 and 127), and non-ascii characters in \(digits) */
diff --git a/tools/perf/trace/beauty/beauty.h b/tools/perf/trace/beauty/beauty.h
index 0f4801c61a5b..1cd307328bb2 100644
--- a/tools/perf/trace/beauty/beauty.h
+++ b/tools/perf/trace/beauty/beauty.h
@@ -124,6 +124,23 @@ struct syscall_arg {
 
 unsigned long syscall_arg__val(struct syscall_arg *arg, u8 idx);
 
+/* Is there a whole augmented arg left with at least @need bytes of payload? */
+static inline bool syscall_arg__augmented_args_valid(struct syscall_arg *arg, size_t need)
+{
+	const struct augmented_arg *augmented_arg;
+
+	if (arg == NULL || arg->augmented.args == NULL ||
+	    arg->augmented.size < (int)sizeof(*augmented_arg))
+		return false;
+
+	augmented_arg = arg->augmented.args;
+	if (augmented_arg->size < 0 ||
+	    augmented_arg->size > arg->augmented.size - (int)sizeof(*augmented_arg))
+		return false;
+
+	return (size_t)augmented_arg->size >= need;
+}
+
 size_t syscall_arg__scnprintf_strarray_flags(char *bf, size_t size, struct syscall_arg *arg);
 #define SCA_STRARRAY_FLAGS syscall_arg__scnprintf_strarray_flags
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

