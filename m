Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD57377A9E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403666; cv=none; b=lHa8Prp4c7/li5ZyeAXRYfc9Lt4O8MeboSdrMFHjJSitDwxXakDKMlwjnv3lI85hUX9pVTp8SheGvFXFDrUrqNwLLz95L9jpBqX03+uHIX08PCIeMPxsIiXE8ASJW/L5CDs+Jq9kYVYsO3YFW5ELTKlJKufWHIhufKzkdTJwHH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403666; c=relaxed/simple;
	bh=6QRVP4zAK4B4cSVT8i51HX3UZXbjJyoFhltLRp1HpEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aTi5qohK25dCCzyrgPo4emFv7P0HPl0VI9MgbJJ+moYu0O+4qZgiRovIig+VPraWeZDwI3AWhMOdXv9L+5Ikw5/ELP7XY3ukl2x3BeUZiME0jyx/nav1XfuCHjFZWReJEhQrI0ZRt3sJDncWE/rNgt2pKYRQi+GP6rDNrTba+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JnzGatIE; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JnzGatIE"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14383177746so2196993c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790403660; x=1791008460; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHXL78ga59h44oaBMzuM9zcc4XanZGNc4b4JuLKXFd0=;
        b=JnzGatIEx/SzIIj54PTZM933oXbTRa9WS38OJ58MsEOyQ2kecTs2KHAHIC1dA0feke
         0qvQvX/mhyW1n52XZtvUxI6JysghbXUHoZFLJ4whqOIxn1FyowyyaSylSpebb+WoDvGJ
         tNYjaNHXSc5osnBaENfvKXsMqsDg1bSSgKRUlKgDYjS+/VESsXeJAe7D2OgDviH7naxc
         ZKmUZCrEbM3Co/SngemPjepeSBcs3YfhJN/vbLxqB4wPCHFheDgoH/P8uJWZjCiLX5TR
         EZxK9gHR/lcVCFQTIuWIoJDpO/X9QjKvRYoCgBROH6+OxoKBFmEBTNnCzYHK9JFfP0MH
         JU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790403660; x=1791008460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHXL78ga59h44oaBMzuM9zcc4XanZGNc4b4JuLKXFd0=;
        b=xig0n55We6zP8b6g+P27zev99+yXF0Ysbp3+M5EL6TAYVv5oPWBgGbbRRqxYR6mjOt
         PC4g0gVBnAFqt2XgDUWvNSFs2cYnrSfWwHvU0327P91HlZ6hwxMmV+yN4a33CgUva3WN
         UTM0wEXIeQ1jb1Q2FYI6MgE8mSHv1Br3xRL1uFSvRfNlofmdM9qLsfYuWE7uNflWIh+G
         2BSgXM04s59I9VYs7Gmxt8g9OW2W35X3yP1QZ6E3yJD8nVrleBbHYxayhxI4ZsAsLqKa
         0C3/sar1UvocsUd9tH3b9RJmxnvdAPK8lzc3YtI74k6Kltnq3QDKH7+aZmieqK6Tgwpj
         kotA==
X-Forwarded-Encrypted: i=1; AKwUvBwn6xs6WzmwDr5M0FLVc4hI6tSImm4+a5MegLM/RQQCR/rZ8hlXP1XnHQjSvaNvxv9v7SY0BUTx6B5Is9A=@vger.kernel.org
X-Gm-Message-State: AFuF++kuRFAEdBZD3iqUluhiQxTYUcyAFBR0G9x20seuZevW0/mPuf6D
	BGYCevgkZ/xqlhvPGR5PGbAxwt/48PNmkI97wxMNCMVaoku7uVDbqVa+npdzM/FS/m8GgB5mln7
	/A7mQFr9TIQ==
X-Received: from dlbpu5.prod.google.com ([2002:a05:7022:e885:b0:144:c6ad:5b30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:298:b0:144:eb46:c40
 with SMTP id a92af1059eb24-146cddbd24amr1910770c88.9.1790403659144; Fri, 25
 Sep 2026 23:20:59 -0700 (PDT)
Date: Fri, 25 Sep 2026 23:19:31 -0700
In-Reply-To: <20260926062029.800743-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260926062029.800743-5-irogers@google.com>
Subject: [PATCH v4 04/49] perf python: Clean up pylint warnings in treport.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	james.clark@linaro.org, leo.yan@linux.dev, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Clean up pylint warnings in treport.py so that it passes pylint without
warning suppression comments:
- Replace broad 'except Exception:' clauses (W0718:
  broad-exception-caught) with specific exception tuples.
- Pass both pid and sample_tid to session.find_thread() so guest and
  process threads are resolved accurately.
- Rename parameter 'args' to 'pos_args' in FlameGraph.__init__() to
  avoid shadowing the outer scope variable 'args' (W0621:
  redefined-outer-name).
- Clear session = None in a finally block after session.process_events()
  to break the C perf_session reference cycle before launching the TUI.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/treport.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/perf/python/treport.py b/tools/perf/python/treport.py
index 786b852f471c..0921b428b1aa 100755
--- a/tools/perf/python/treport.py
+++ b/tools/perf/python/treport.py
@@ -91,9 +91,9 @@ class ProfileNode:
         pid = sample.sample_pid
         try:
             assert session
-            thread = session.find_thread(sample.sample_tid)
+            thread = session.find_thread(pid, sample.sample_tid)
             comm = (thread.comm() if thread else None) or f"unknown ({pid})"
-        except Exception:
+        except (OSError, ValueError, KeyError, RuntimeError, TypeError, AttributeError):
             comm = f"unknown ({pid})"
 
         period = sample.sample_period
@@ -412,9 +412,9 @@ class FlameGraph(ScrollView):
     }
     """
 
-    def __init__(self, root: ProfileNode, *args, **kwargs):
+    def __init__(self, root: ProfileNode, *pos_args, **kwargs):
         """Initialize the FlameGraph widget."""
-        super().__init__(*args, **kwargs)
+        super().__init__(*pos_args, **kwargs)
         self.root = root
         self.cursor = root
         self.selected = root
@@ -549,12 +549,15 @@ if __name__ == "__main__":
     profile = ProfileBuilder()
     try:
         session = perf.session(perf.data(input_file), sample=profile.process_event)
-    except Exception as e:
+    except (OSError, ValueError, RuntimeError) as e:
         print(f"Error opening session: {e}", file=sys.stderr)
         sys.exit(1)
 
     # profile.process_event is called for each perf event to build the profile.
-    session.process_events()
+    try:
+        session.process_events()
+    finally:
+        session = None
 
     # Visualize data.
     app = ReportApp(profile.root)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

