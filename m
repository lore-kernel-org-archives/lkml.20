Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F94F7988
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740436; cv=none; b=Zy+H3aD9LXu+uRPbRghuiqp7hxenGUXnSncskxJE3su+pU50fB1RGz90ph3vpGkh0iEZyqOyQjkodbWRjBa3Kb2ArEnoOldn12FTIWLsBGvZ4oLXDW3HlejywxBR/61S90eqOgujU8bqcvfUq55J/jVw433XoQMAUb2pfNlwqLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740436; c=relaxed/simple;
	bh=GPdTrvCkiHU3/coaruf9IhbjFFcf1z7GDHB3eC+nIgM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eAUiQeS0O+WbAW12OTwBZ1ADLq9SCqONvGtGjJPyx5rJYxmx/mJLR6qmtfzE+bvSXmV/8PiDcX1odTK9mPdB4JZOpQ44+jYGXXSUjhhZehFUwGaRxSj9ReeEGqI/wexngYykLy6LOpjq89TPX3XSa2v3KpzNTTjGqqCn8u2PZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=doEywkou; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="doEywkou"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so2090374a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789740434; x=1790345234; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ajb49arDbZGSllkSDDxIszaTKHNJOa78okU0Ays49S8=;
        b=doEywkouEu1g8XHlO8VK/KpeR8pf7PNeK4w6CeQzdjA37qDNa+9NV5WW8ZvcIE8Olv
         fksiXOq5cWTMVh9LD+kaQ3Ix+zOuSfJhB93HTlivlK34zZ4pzrAXSG9zA1wRDSLUiPT9
         WSDLIyCnMz+dEjW0DxsX8JyYBK9unl4waKQvmi7SbKVGKYUQmtxhbQT467PY3+MxSmzp
         cbMvFUXE/5oQoY9N2bUVdgJuha+WiDy1SWxlFaQQHhhlq1iq8hAavR8g4dqKwmaR+Zca
         Vr2I6NXoAE165eWk939oWebDH4KAINAPVfcAC3Bo8hTuLkLMlLUAh5xGoHZNB1VRuhB1
         WI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740434; x=1790345234;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ajb49arDbZGSllkSDDxIszaTKHNJOa78okU0Ays49S8=;
        b=xZ748rsHF4SRw7x2mdGixBNnO/lVDmUXp5A/N7Kw8LKjtIwB5BtMGtgAE2GmWBAjk6
         H+q/fvzrHk0Atht9R12i5xvd6dmh0wWykq6jLc+3C6EepsYdUpljyEzb/SjqIUSUE/q/
         QlIPRplZ4LkCJcjlcAokiH1/qbjCgeSVDVThYjoBjCKGgn5J4U5RzN8T9KohEliWw+rd
         BT1Wy6LbXTTBSNdMdx6HcwEG236OgUgXwU/eaJMqkIT2QuXva/X4lAf5y/Y3YvystiXn
         5NkMOcWB8sMPg71aFb0SrhPqPRwiaHSsVQjmyCXVuSBlzNzkK2PbMcz296YIaaqkJD1r
         oV9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAHD6J8foIdb9wu5rsQBxenUvCVMXl2u1b5QPFVPYp7MpsOw9t8lMlJa8SsjsJAKepgPCMjBlIqu5OOu4=@vger.kernel.org
X-Gm-Message-State: AFuF++lcZTI3A/FMeXFWzqYEioeq9EV679KUakjBq5uw0mDfjmiPLQ6Y
	xt0HrYI86GkGqXXYTh1BjyOCTSYaQvN9C54ZvCOPhLdmUWGRsu1ab7yur0nlXN+VgThcIpwEYDC
	j/4Gvz2tvwA==
X-Received: from dlbro10.prod.google.com ([2002:a05:7022:158a:b0:143:91fd:56cb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cc8:b0:39e:1329:7816
 with SMTP id 98e67ed59e1d1-39e54d703dbmr6319757a91.15.1789740434094; Fri, 18
 Sep 2026 07:07:14 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:06:45 -0700
In-Reply-To: <20260918140659.2501976-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com> <20260918140659.2501976-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918140659.2501976-3-irogers@google.com>
Subject: [PATCH v3 02/16] perf trace: Free the whole evsel_trace in evsel__put_and_free_priv
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Every evsel->priv in builtin-trace.c is a struct evsel_trace, allocated
by evsel_trace__new(). It holds a syscall_arg_fmt array in its fmt
member, which evsel__syscall_arg_fmt() allocates on demand for the
syscalls:sys_{enter,exit}_SYSCALL tracepoints and for every other
tracepoint that gets its arguments pretty printed.

evsel__put_and_free_priv() only did zfree(&evsel->priv), releasing the
evsel_trace itself and leaking that array. Use evsel_trace__delete(),
which frees fmt first, exactly as the out_delete path of
evsel__syscall_arg_fmt() already does.

The current callers are all error paths that run before fmt can have
been allocated, so nothing leaks in practice today, but the helper is
the obvious thing to reach for whenever an evsel is discarded and it
should be safe for that.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 20fffc24507b..f67557e7a254 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -464,7 +464,13 @@ static int evsel__init_tp_ptr_field(struct evsel *evsel, struct tp_field *field,
 
 static void evsel__put_and_free_priv(struct evsel *evsel)
 {
-	zfree(&evsel->priv);
+	/*
+	 * evsel->priv is always a struct evsel_trace here, so it has to go
+	 * through evsel_trace__delete(): zfree() on its own would release the
+	 * struct while leaking the syscall_arg_fmt array hanging off it.
+	 */
+	evsel_trace__delete(evsel->priv);
+	evsel->priv = NULL;
 	evsel__put(evsel);
 }
 
-- 
2.55.0.1082.g2b9226bbc0-goog

