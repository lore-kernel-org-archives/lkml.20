Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9633D4E4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922247; cv=none; b=Oc/+HjvPjhPKHroygJy+fQu3eofLRDMv1ZDh6jr83Zd3wg2jN3ju/DSABNzNO8xSI1jtL7pBVfR+F1e97nxizjXkJEUrUgQh7Kc97+5vLj7KDy2kynNfizly9ivAYrT3kGBS0bpcvD00d4pfqhR6Vp8SXRMr3OdrIIVmX5zaCac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922247; c=relaxed/simple;
	bh=V13NjxcZ8Y+EH56zGxBFcHbqNp/dD0O+9buYDXRen/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBjlsI0ko6D+OUvOaUwVY1ycig5MFtjxSw8/CTMt0r/P7tjP7Cx4w0YlcnrJppztGt6NpVYTxLHAOxLCIZ9LDLm5J50GBnR4cmZsyyJ/Krphd952DG2oKrrANh0pd+YFwkpWHRO7OT+MQFuCtArnndDuXCmS7/BDbBtCtIL3fGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3zN6fcL; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3zN6fcL"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-866e57f63a3so61297067b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922239; x=1789527039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8uHZ58VC3qmxtEe8gO2hHAyHIZcWIh7nanbyJ3N2VQ=;
        b=d3zN6fcLsnGo3uyLts311miytLAfQGFYdFssbgU5ZapMtJVdS5k3BCqjQkl/iiNmHF
         ZCcslMxNABhTG3fDw97LDMKg76AMbRLBK4t5IjKj5FeAEd7sNsPuLQgo9ZANjzXnYKVE
         6XBOHCSFQeWqSpYleaj9qGCCH0CA0trW012U+bSOqSC3ikvc5YFm7VOnlLIzDQ56zcLc
         0JxtG+CLwJB1dsEB/sRtVqu+Tg91MviOAU7cf/GMvPK4HOzrJTQ0gcna8QyOXffk/lUa
         8z4nyfADhEjc/Hs2UfA4gsj0ZWkniQmFOy1yNci8R8NYdikVPrq9bGQVuMRxuRuY0SUk
         a4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922240; x=1789527040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8uHZ58VC3qmxtEe8gO2hHAyHIZcWIh7nanbyJ3N2VQ=;
        b=KFt0uWbUSCw2Q0XUQBT+YdAysJjr5Fdzb5LB/lqGkICgCzYkK79B0J1hEY3ICoZUlL
         Rr08yK2BiT7mI0tVu7XxvMsjzpd627ebV811QANHu1PL4yLSDP3VXYGsZftCQE2ljTV4
         z7eO3onzBeh3+rgwdqgKJH7kGVsip1W6IBa6AVLi6uF/UJr//nuUzJPr9Vhx0xt80NDg
         HoIEKb1WFbccjgRDXk+qx17JbzdniSjW84vItx4bDAEBT3uv9AriTQFG+LW86PBqW9jU
         aQKswVFpjKHXPViQftf7wX9ym4FBaFRSxk8pi2y10k0+3TC2BAGHil24stSkLaKJPxRs
         vLfg==
X-Gm-Message-State: AFuF++nSQJASnzg+KK64zBDOlZqR3HDYUr0ZfSvRx97ckDnFqspCaZCW
	41GOXqdKAIrr0ysX4uKLxHal3LX8Aro8B1eoYLPv6JETQS/7351qBaaf
X-Gm-Gg: AYBFou3hsp1lzngj/tXP/ZI8XfsjeVnnTglK0IXfkg9+7te0pCDkM9OR176aODBdqdm
	pg5bvACvgzx8a0l+KVrIXfhs9ckwM+ntrqiJQPD1QjCV87n1cLRCs+rRSOE2BgV2XmIg//iIvqv
	XxtLKJdm/IYuQpbt6OOhrDXZ9KY9Q2xbAc7hO4Yy7KQ8WVhl7PYpQjpZ+X4OpPsTYzu8dVSA+Ir
	5oNTsEIQn7/kF6087nav0mwhjpYjfcOPmHVYRrQCT7yG6G8+x/xaTaJn0PdXxoRxPFGrnbkl1B5
	akV06TVU1z1Mii/kOIH/MWQXwZv/CN4LX4qdygIVjyMn8UVX4KrTO9kjXDio7oRSn80Cuj5PZ0l
	QWYW8IbyT4coiFNIJfA8yE7rlp8ZeP+jv67Q527z4tMgv2w35LisxdF7PxCwC7mKJ1cFuppAlc7
	HpTNcm4ZBg9yVFUSIRPy9qCCu8vOfkWyv3U7t2BP+gy6qiDGYQ5ocjeUy8yY6pXTvffA9fL/A=
X-Received: by 2002:a05:690c:6d81:b0:87a:ea5c:c21e with SMTP id 00721157ae682-87aea5cc507mr53889867b3.21.1788922239624;
        Tue, 08 Sep 2026 19:50:39 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316356sm103354187b3.9.2026.09.08.19.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:50:38 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 08 Sep 2026 22:50:35 -0400
Subject: [PATCH v8 2/3] perf tools: make the GTK4 report browser actually
 loadable at runtime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-perf-gtk2-v8-2-e90d5d155f0d@gmail.com>
References: <20260908-perf-gtk2-v8-0-e90d5d155f0d@gmail.com>
In-Reply-To: <20260908-perf-gtk2-v8-0-e90d5d155f0d@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3810; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=V13NjxcZ8Y+EH56zGxBFcHbqNp/dD0O+9buYDXRen/c=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIWnKw0Tw9puPqzZmJTvEKyzNTcmV/mKz+aKCptcahRd
 9Li54GLOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYa1xxGhmO5Bffjb3
 yq/LaUNeil2E2Z8uSnRdXzTA705Lj+W6V+U46R4cblB2H+9+Xmd69a+j3cvu70sp/7DDkial0fR
 PN5Jz89wQAA
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

