Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DBA375F65
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403681; cv=none; b=tmAEy7UJHPFx8cn2buxim6lt3FPbFlYmqYW5vZc4rdtdnvp8TCsHrphDj7O9k8g9E+LTPIj+E4oToi/DL8kjpRosDZJ5NHVrx14STuqzcy+fgZuut17SJRdkodsMNys1bd0JOJOs4g7ZRP1QgDYZr1x4vjmbb7ozruPo2kE8gaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403681; c=relaxed/simple;
	bh=zZRDpy2pCf3rGznnJhTBBBq7ZDSfbefM6KlIxw6R5wc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TTFzGSzhvUoY0d1iy8wVOjRjgKF4SWh3Nx/ZtJlZc1lP/w4dOB2Uslt+KBdOWSoSWLfWi6v/sXdvQmpWZFysk4VvsGkzAr1lmhC0BzXV4xIxKgEasWvfs+DoeU8SOl2lThcW6hFB8oboTO/7SatQQV83wZRafTGasKYofWhlAUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DIraU7pP; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DIraU7pP"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-142f4306744so4684670c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403678; x=1791008478; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZWaULzvPwtrby9JvMFuaXO1rmgi6w3tKeneWwQVAh8=;
        b=DIraU7pPQbKsdabnTTe9h7lGNaxB5ybMO6oq3Gc0M4LZzRdbwj2qYUHfnHcBbIQ88s
         FMmZf+8XH4aSMCknUwIKBVRyn/BP8CD+RuZSTg1+40KtGb/9PscaAez9fd5JchhMTXG4
         B+Ny0P8zBqjcJA13t+5BwREJ+x2u5qdmNUNmewAdW6FgPxrDV+ICXdXMR1sJtK34ygCx
         rBL+Ss+Jopz1ckgMDSLbHhlDWSrNeH/iujmbS2g7jFlFuUdFyN4O1sc+EJs7HEA0WuFU
         mGKm/ggc9ViZJUjSf+3fdZJe9pkGfnwxUkBcKFN5xBuBau4pRokvI7p4nFyfNwKszVqO
         Knrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403678; x=1791008478;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZWaULzvPwtrby9JvMFuaXO1rmgi6w3tKeneWwQVAh8=;
        b=GeXou8EdfMUiHESt4uQDJgukgmy8gEsJXMu3RivW450+AaRaijxGSr2rTq9YtWrLMe
         gOhcPOqRd5AhHbci0SIj+ribmrJhAknxehgHXgEGQtzU37Et/NvtCoAisJ52J8WDaKTP
         JWYihkG1Mk3JHTe1al0VxgB2yA4F2eV4T4b0mBCu6yOX5d3JxsZKfspttHqkQsqDvV+q
         9jpbKD6NUU3wj1aAQboOOC4vtYYbQlxEJSCOewQT1XXOLguey30uoR6TeJw5fEg2JK9/
         UpcCUTdy5zwlMPq8Zsiu20qSWa3tIUs+FDGdryOlMLjLexfhJNckQX+TLKP0VJXfUTVL
         yz0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBpqnZOwy/2xOdDODNaTl2AnenVN9mooha7bzUnaa7Ty8AwRm0yIcD4Lc5JjoX+jrbzKxCrIl7MSjswZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lyri62KVJsyojKjtOwNYry0jFU7R4JBz2+6w3P3wHc0S8kJ+y1
	OPZvKDpl9bhdjIqBG7CbKyWvVvNfFXvqq1I02JsgaL4hvfcmSmEfFSBibDn2VW5u2Ogvi1L2Le/
	71My3FyYgxw==
X-Received: from dlbrs4.prod.google.com ([2002:a05:7022:f684:b0:144:3f31:5c89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4314:b0:13b:3c3b:8dbb
 with SMTP id a92af1059eb24-146d03a0a9bmr2056237c88.23.1790403678303; Fri, 25
 Sep 2026 23:21:18 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:37 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-11-irogers@google.com>
Subject: [PATCH v4 10/49] perf python: Allow KeyboardInterrupt to propagate in LiveSession
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

LiveSession.run() synchronously blocks while polling evlist for events.
When running interactive tools or scripts from the terminal,
KeyboardInterrupt exceptions raised via Ctrl-C must propagate so the
caller can break out of the polling loop.

Previously, LiveSession caught KeyboardInterrupt with an empty pass
statement, swallowing the exception and preventing calling scripts from
detecting the interrupt cleanly. Remove the empty handler so calling
scripts receive KeyboardInterrupt and can perform clean teardown.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/perf_live.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/perf/python/perf_live.py b/tools/perf/python/perf_live.py
index 616b5f657463..99e73d58a96f 100755
--- a/tools/perf/python/perf_live.py
+++ b/tools/perf/python/perf_live.py
@@ -33,10 +33,16 @@ class LiveSession:
                 # Poll for events with 100ms timeout
                 try:
                     self.evlist.poll(100)
+                # CPython's PyErr_SetFromErrno() invokes PyErr_CheckSignals() on
+                # EINTR, converting SIGINT into KeyboardInterrupt, which inherits
+                # from BaseException rather than InterruptedError/OSError, so
+                # Ctrl-C exits the loop and triggers finally: self.evlist.close()
+                # while non-fatal signals retry poll().
                 except InterruptedError:
                     continue
                 for cpu in self.cpus:
-                    for _ in range(1000): # Limit to 1000 events per CPU per poll to prevent starvation
+                    # Limit to 1000 events per CPU per poll to prevent starvation
+                    for _ in range(1000):
                         try:
                             event = self.evlist.read_on_cpu(cpu)
                         except TypeError as e:
@@ -53,7 +59,5 @@ class LiveSession:
 
                         if event.type == perf.RECORD_SAMPLE:
                             self.sample_callback(event)
-        except KeyboardInterrupt:
-            pass
         finally:
             self.evlist.close()
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

