Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4BC4EF13C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613415; cv=none; b=c566IWxnBg7TxLInLA0KXpKYnEBJByOtFTtjmH4KMvb2f85SVLwx0GyCARO2C97rQ/g9twkKdVod/Xwr8kfxMrlAxSPaKEkys8iwf2Kt9BoXHPb0BIkpTt7CEU4KMk10XasAZMCddxFKI3NGBkHtu1p8HKykfcvihSny/HW5vB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613415; c=relaxed/simple;
	bh=Eqixr+77YuATos4ItPsUHXM9VuOTHs/di3E3c0Bb5C0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=jMNs8hjH/kNmoorsuQC19oUNiEjPiBNNeU+trRdS7z3TIFo7GvTuTU2Je6REc7UPxPyJgQaHlLVH0wBIz1mtpT3PsJQ5BBn9kOJE0G4d6h6r8QAU1og/t4mnpcoK3xvUEAkO6tRtgFx0UreccTclXkIFVxUuVEI5teT3pCGf9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fyfrnSLd; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fyfrnSLd"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so6795996eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790613413; x=1791218213; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KlBCVlT+hyZcroorsvNsasD4unmnXb0AYHxMzW4V8n0=;
        b=fyfrnSLdRLkG0L0WsOP28RXjP21ksSeai+R/r1QsfeggTIEN8JQlMK0Xc7T0JEamVR
         /FXLqwth2C9WjgBjOYOMVR1VzeC9l6OAXOYZaZfanX1icO6XdptAj0Ob0k9QjP7yPTEL
         gDrHZoRM/eCehv0mocCKmEEXwdaNNoQCv7zZeIuCNnqiJFBMSNJdShmZPZ0U4RwcCTVs
         ivuwend150hpqRzBKzhMpW9lcq2euboUjpNODmab/Eps5i/Af35PsCsLFpcrC6eXhz0u
         7h8H0bKljeszu6aINGR8fK8EAf9cyf+aK4xHUIg7mOyDz2H4wKddTSDqPPo2qEGZy6Bt
         We7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613413; x=1791218213;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlBCVlT+hyZcroorsvNsasD4unmnXb0AYHxMzW4V8n0=;
        b=nIGkMNUECB49sg481NzwIVU2Qokt7MRwRJjH67TSLVjVtwxtEpt0l7VFDZYPeFsLcL
         NshUNza7LqbV3vIIJ+xmxbER8LRP5EUXrRTSW0QoIwyKoc2m23KqZl4tz4b0CGYDpZV+
         jamtKvSpUbpAgcduK8ukb+9o06ow0Bc3HbaD77jZBWrujiDV0Tf96GaYeZRdMuEY57rP
         6XjFErIi+J8jNxLsth5tiqiMuocQf8g567JIvWPQBLZ6ST8HPiESb8cXyyLOjcAvGvFf
         fLChe7iZJcuAVc3wYVb6zY1MgfADUN6CxUJYtWBAYUP7feOR/0D8yJ2vYR20bXBak/5Q
         i7BA==
X-Forwarded-Encrypted: i=1; AKwUvBy6/KHq693koblOKp8NCoKGgMcgIWX95fnVRjBZemiksld1sll2RFBUj4BanXiSApJZedG113RDlm+8+qk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk5M7YhJyIKmpvXcZsBg4J8mZLb0lZQPvl1EU/eBvHtsuI+/K8
	YJEcOgNQE0IN6YfstusBaPk0yqYqScao9LiQxpYNAUgIjKLtKr5jaVd0hCLz3pRworPMWay/D0J
	37G3GHuFz5w==
X-Received: from dydb10.prod.google.com ([2002:a05:7300:80ca:b0:33e:63db:5570])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:26cc:b0:33f:45d1:8f24
 with SMTP id 5a478bee46e88-3427246b702mr9636085eec.22.1790613412580; Mon, 28
 Sep 2026 09:36:52 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:36:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928163649.3463451-1-irogers@google.com>
Subject: [PATCH v1] perf build: Clean libperf-gtk.so in 'make clean'
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When GTK support was made opt-in (first via GTK2=1 and recently ported
to GTK4=1), $(OUTPUT)libperf-gtk.so is only added to ALL_PROGRAMS when
GTK4 is defined. As a result, running 'make clean' without GTK4=1 does
not remove $(OUTPUT)libperf-gtk.so.

Add $(OUTPUT)libperf-gtk.so explicitly to the core-progs clean list so
it is always removed by 'make clean'.

Fixes: 4751bddd3f983af2 ("perf tools: Make GTK2 support opt-in")
Reported-by: Ian Rogers <irogers@google.com>
Closes: https://lore.kernel.org/linux-perf-users/CAP-5=fV6+mzN3Lf_mCAJ4aP42JFZsF55ekvt8XrX505xOWwrmA@mail.gmail.com/
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 5e89ff37d5b0..c35316bf5e09 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -985,7 +985,7 @@ clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(
 		-name '*.mypy_log' -delete -o -name '*.pylint_log' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
 	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 \
-		perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
+		perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so $(OUTPUT)libperf-gtk.so
 	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo \
 		TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE \
 		$(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

