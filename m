Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713713BFAD9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721066; cv=none; b=Bqq1+9h8P3MUAjkCaNKu+kiNrSB9vk009aladAZDIeh4dA5/AWc+cPVGcfOpmR1SkO+4pS2f2jf0rmo1h9Y/qRlfqiZ7X3zJ9PHiF1V+3cPxfO5sUR+8HsAuDZ++qjhjGhmD8pI0H30Bx208BsCqAv7izkCwmhpAHv5ZBUIEnYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721066; c=relaxed/simple;
	bh=V13NjxcZ8Y+EH56zGxBFcHbqNp/dD0O+9buYDXRen/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIXgj1AT/75aJY+rHnw8jdH3Czkq0v9gbZFJV0Y4qE42XJ1KEDySLNtD3hSL1UVRayt+W4bKcXoR1R3z+ifG5G2NN6QveLrrR7ykWuxW7b2su7XvSXxTFYkqiA45r/8YEQWA/rZm7eTLHl6zjP9gxWyRmpf53tkmK5/2OGpXR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzGz1O/o; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzGz1O/o"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-865bdc6ed72so49825947b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788721063; x=1789325863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8uHZ58VC3qmxtEe8gO2hHAyHIZcWIh7nanbyJ3N2VQ=;
        b=YzGz1O/oMgYu5pnUtVEV4mqobAXRQwgDvWFYGFliVJ4v9QxRtP9gzqpo9P+m8LquVu
         5oyfqTgWlj2Vlopup5yPgypAz0yLusqeXf9jND2GanxXU0HEhmkhn/rRp6XxVOlE66CD
         oEpweDzhzghejxJFeDwgYpdvKVxawQsp31h9hbbTYP1UWmDuMTIqetMW91lG/bw66TeS
         iHa/F+49xtTkyWQgQsf7wpR4dMEkYjnHnaGM/rjiIVa5DQC5pZV51bIyrliaLVtX/fxD
         9vb9R2cZ3mhKiLssIWrrZKqvO+cVmLHRVZ3jP5qkKBWErQ8LiD6ZTvpI2GXsECruuoxw
         NjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788721063; x=1789325863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8uHZ58VC3qmxtEe8gO2hHAyHIZcWIh7nanbyJ3N2VQ=;
        b=QzBnFrrwS09ncqe8QUFQXzNlMy8l9Ba3jTNEtnmaRRes1orEKVbyvv+fiVhOqkLfZI
         elgu/6YJyTtws+MR5klND9MFFXW841CmabYU/22wC62U3bsmoVRbl+du10B+lRstw2eA
         WULi/HJ7usR7GG7dpwCaD0YcCcDBYKPK8pVvgA8pv7/ov4LrVojVNWS92E7TW9Vp3xTF
         trRB910z5z9ZzCkmV5WyLZ7TnUAaKzz/oke0D9ctGjHqCHXVx5MzcCMCD4lr0MYiEcCS
         KlZNeag6nfEnJMCSBkcW7iJu5m8+zp7lYMWe6p1O06V7bMc5Ajnr5VT9aPMKqt46FXy9
         Jxcw==
X-Gm-Message-State: AFuF++mY42NtqY1auJc8KGdVLFFoi044JnOaEFFto5+OqTwW04dgs/Zl
	hzI5YC5RgbsYoeRWXV6PjtgLotNI0xtRz+XGqMG7OW5EuTZr2S0sTS7r7rLjXcDjtbQ=
X-Gm-Gg: AYBFou3PGQ5bvG+zSun3PTVgZEZ2eJUsQk59TtpipKXr368UX/UicnjpZ6aFFPISvfz
	NdwuqT7Q6G97wjSrrxLQdlnVxrKcssPCQXjvk4yqqFtGzsDNrWdwHWSQ0yh+ihpiV+A+Ve7LylX
	EU/zvYSkVuBDzd7Ld/qM6DzL/xrylw+MW4H9kf+xMTX84scD/nNvrRJwz0fduRl+nkm0TWCVEU9
	tNF+FX7iApOJKM/aL1VsuBXFOcL60smZhqbquJZWOJF+8ho67at+bhQE1V4YsWbrstVggvfd/jQ
	M/RD3f7KDl/Ayv9aRNfN6I+5kD6/1nHAMnWubPae17lTNG3P7j9ZK+cMbAe7Jslr0GirOpWAmRx
	tkHMoHhA2+CotJPQPxTlmF9aI+oIUhk8bvkoZ3HcKP+/st0i+9s/YZjpKOhFOW6yXDQiwfo9i1X
	LAriisw8Qip0ZDDLxsBXECtp6S3UecMNS6c2RuB7g+K4uMSvQ6IBGtXZAFvZp/
X-Received: by 2002:a05:690c:6603:b0:873:5bd1:98c5 with SMTP id 00721157ae682-8735bd1a2f2mr42026087b3.55.1788721063272;
        Sun, 06 Sep 2026 11:57:43 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871439bcb5bsm59389357b3.3.2026.09.06.11.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 11:57:41 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 06 Sep 2026 14:57:34 -0400
Subject: [PATCH v6 2/2] perf tools: make the GTK4 report browser actually
 loadable at runtime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-perf-gtk2-v6-2-695d1c01aaa1@gmail.com>
References: <20260906-perf-gtk2-v6-0-695d1c01aaa1@gmail.com>
In-Reply-To: <20260906-perf-gtk2-v6-0-695d1c01aaa1@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 bpf@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3810; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=V13NjxcZ8Y+EH56zGxBFcHbqNp/dD0O+9buYDXRen/c=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLmbp/rXMiRmt17fpKQeUxWyUo+v6Ul24XeKfjseSQ9P
 ePJthlnOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaekdGhj16F+v2Sz
 Ytqdqy88xk8+YdzRp/dK+9PfvH+GWv6SnfFYYM/3TvVa69fUnk0MQ7/L9PVbz4lvWfkdFg6hYuh
 byOF8aSa/gB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf report --gtk dlopen()s libperf-gtk.so, which expects to resolve
symbols back against the running perf binary (callchain_param,
symbol_conf, evsel__name, and friends live in perf, not the plugin).
Two things broke that after the GTK 4 port:

perf never passed -rdynamic, so none of its symbols were in its
dynamic symbol table for a dlopen()ed plugin to find. Add -rdynamic to
LDFLAGS when GTK4 support is enabled.

annotated_source__hist_entry() was a static inline in annotate.h, so
ui/gtk/annotate.c calling it pulled hashmap__find()'s expansion,
hashmap_find(), into libperf-gtk.so as an undefined symbol. The only
hashmap_find perf links against normally is libbpf's internal one
(tools/lib/bpf/hashmap.c), built with -fvisibility=hidden, so it can
never be exported to a dlopen()ed plugin regardless of LDFLAGS. Move
annotated_source__hist_entry() into annotate.c as an ordinary exported
function, so the plugin depends on it the same way it already depends
on evsel__group_desc() and friends.

With both fixes, a default 'make GTK4=1' build (libbpf statically
linked) can dlopen() libperf-gtk.so and open the report browser without
NO_LIBBPF=1 or manual LDFLAGS. Verified with perf report --gtk against
real perf.data on a GTK4 desktop.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/perf/Makefile.config |  5 +++++
 tools/perf/util/annotate.c | 11 +++++++++++
 tools/perf/util/annotate.h | 12 ++----------
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3e59e2b7eaec..4ee7393a39f9 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -785,6 +785,11 @@ ifdef GTK4
     GTK_CFLAGS += $(shell $(PKG_CONFIG) --cflags gtk4 2>/dev/null)
     GTK_LIBS := $(shell $(PKG_CONFIG) --libs gtk4 2>/dev/null)
     EXTLIBS += -ldl
+    # libperf-gtk.so is dlopen()ed at runtime and calls back into
+    # symbols defined in the perf binary itself (callchain_param,
+    # symbol_conf, evsel__name, ...): perf needs to export those
+    # dynamically for the plugin to resolve them.
+    LDFLAGS += -rdynamic
   endif
 endif
 
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index df70e95a8470..123b6d5fcea7 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -145,6 +145,17 @@ static int annotated_source__alloc_histograms(struct annotated_source *src,
 	return src->histograms ? 0 : -1;
 }
 
+struct sym_hist_entry *
+annotated_source__hist_entry(struct annotated_source *src, const struct evsel *evsel, u64 offset)
+{
+	struct sym_hist_entry *entry;
+	long key = offset << 16 | evsel->core.idx;
+
+	if (!hashmap__find(src->samples, key, &entry))
+		return NULL;
+	return entry;
+}
+
 void symbol__annotate_zero_histograms(struct symbol *sym)
 {
 	struct annotation *notes = symbol__annotation(sym);
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index fa08d09b80f7..40038a3779d4 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -406,16 +406,8 @@ static inline struct sym_hist *annotation__histogram(struct annotation *notes,
 	return annotated_source__histogram(notes->src, evsel);
 }
 
-static inline struct sym_hist_entry *
-annotated_source__hist_entry(struct annotated_source *src, const struct evsel *evsel, u64 offset)
-{
-	struct sym_hist_entry *entry;
-	long key = offset << 16 | evsel->core.idx;
-
-	if (!hashmap__find(src->samples, key, &entry))
-		return NULL;
-	return entry;
-}
+struct sym_hist_entry *
+annotated_source__hist_entry(struct annotated_source *src, const struct evsel *evsel, u64 offset);
 
 static inline struct annotation *symbol__annotation(struct symbol *sym)
 {

-- 
2.54.0

