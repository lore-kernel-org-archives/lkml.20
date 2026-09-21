Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BE832A3D7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967246; cv=none; b=NZXOJhLC39FmnDUmrnK4JcGRlYeQD86NVyviez2mWRzUWtrtsjFw55w61854adCAYl+0zm4hN6mvtbdj3y5gYYHFvrd920OqOG8OttMsErOjCDpQZsSQzol+QwwIR/4B4adE1AETGi7h6kFgEQH3Gzu9qwv722pArkwUO4O8fBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967246; c=relaxed/simple;
	bh=UEDUijyDKwQHA4IBoutQo2f7jglmv65f6fvnoetNWRs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W22GnkK1wu6aoHYFr9Psw6uTb9VwhBSuZd7ysiUxY87H08MZJfXfJu4e2+epqg/aFxHSITVjiVh87GusGma0Fwzz9ecwlpOR6boPdv5Kg5B6NBtO3pXlGmJOljiN/FZLxGchXdrIWwrdTKe1faOK9AHEkX1QT8tD+HLg0GRm3ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g0yB3K1x; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g0yB3K1x"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7348bd56fso1695530a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789967245; x=1790572045; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNtQnLVCRy146T+3xtXFPYE2nmLMOTV4tSP/1bLz73s=;
        b=g0yB3K1xvw6p2folsr3VaCmk6U4bxIJUWfqlQImTTJo97EwniWBkE849X9zak4hhrV
         s3PmkyWfdYDjvgucA+yP7FW4/DsmmCTLDYBRWUdT2dCw4xynlDAx4+svvF3In45CoCEO
         aFQBFDv3VKVjcJIZsUDc3tGcoz4F/SL0mKeOCBhcQCp2uQKAH7I2d8reRElV0e2wtzBT
         pbfPem4xSN/TvjHmQDnCH66oeCg3L5sfIUTQnHWclzms/arra0G4fbe/cb7TlFQnkIK6
         /zG5dfP7LiGVx0OVOsat41yr6WEp4mtNtcNIENcSXmFi4fc5is8kS2tj79JuU9PYniUr
         8Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967245; x=1790572045;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNtQnLVCRy146T+3xtXFPYE2nmLMOTV4tSP/1bLz73s=;
        b=FP3GtVVuX2ozvCuP1ujAFqOdwt3NUgzkScvR1WTBMdLqBbgQHax+c9uPoTodlYwcaY
         BKa9Cyn4Ey4jF9Um9bBaQYV/lulWeh1KNTEyQqxSVdyebn1fMp16JTyokO0wJsuwcbT5
         LHfmh8vHEtDWsBRFOXXgcZlZxj5ZUaPHGsgIYxc05Mxz4K3cUFX2kzjr1lNfH6VV+RQx
         suwxFE3nyJHA/1PwxoACmWmc+fVAJJYUB7oSIiJAFtrxNLj8v4OPE5OH9qDgU8f8va9C
         huoSBXaK9hWvdKPy8FcCSX+Q7ohFZDUttIxBOJPztTuP45+zVUj+cS5ze6N7yShlG92k
         Or3g==
X-Forwarded-Encrypted: i=1; AKwUvBwxQP3xNhnL/KrdVkMDMbS7uHJzF+H/yJhdKI+zjOilnh1PlMJj/GVWUENm61lnX1KI9vfZt0SvHsWd2HY=@vger.kernel.org
X-Gm-Message-State: AFuF++lOgIZELB1R4q31/NaavmuhVsSCjwDeRHWW+eJWAC6GBJPgeUEW
	tDeoa4qtGjXKTFv1z2fuUJQiyaiwHR/98dHHamQh4HX+lLCYgiiteQuJL2skwgdEaYmwdPeqdad
	XxVBl/GyF8Q==
X-Received: from dldz1-n2.prod.google.com ([2002:a05:701b:4181:20b0:144:e017:1dfa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11d:b0:3c4:4272:b400
 with SMTP id adf61e73a8af0-3dd8c53d594mr16238669637.18.1789967244462; Sun, 20
 Sep 2026 22:07:24 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:06:20 -0700
In-Reply-To: <cover.1789966896.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <d438d782c7ffefb4dd3a86496a6e1723b5bc2097.1789966896.git.irogers@google.com>
Subject: [PATCH v2 02/49] perf python: Update callchain stubs and session
 thread lookup
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Update pyrf_session__find_thread() in util/python.c to accept an
optional tid parameter (defaulting to pid) and return None instead of
raising TypeError when a thread is not found in the session machines.

Update perf.pyi to match:
- Set session.find_thread() signature to (pid: int, tid: int = -1) ->
  Optional[thread].
- Update callchain_node.symbol and callchain_node.dso to str (the C
  getters return "[unknown]" fallback strings rather than None) and add
  __iter__() to callchain.

Also update treport.py to handle Optional[thread] returned by
session.find_thread().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/perf.pyi   |  7 ++++---
 tools/perf/python/treport.py |  2 +-
 tools/perf/util/python.c     | 19 +++++++++++--------
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index e737eb21567c..7217bca05821 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -320,13 +320,14 @@ class branch_stack:
 class callchain_node:
     """Represents a frame in the callchain."""
     ip: int
-    symbol: Optional[str]
-    dso: Optional[str]
+    symbol: str
+    dso: str
 
 class callchain:
     """Sequence of callchain frames."""
     def __len__(self) -> int: ...
     def __getitem__(self, index: int) -> callchain_node: ...
+    def __iter__(self) -> Iterator[callchain_node]: ...
 
 class stat_event(_sample_members):
     """Represents a stat event from perf."""
@@ -441,7 +442,7 @@ class session:
     def process_events(self) -> None:
         """Process all events in the session."""
         ...
-    def find_thread(self, pid: int) -> thread:
+    def find_thread(self, pid: int, tid: int = -1, /) -> Optional[thread]:
         """Returns the thread associated with a pid."""
         ...
 
diff --git a/tools/perf/python/treport.py b/tools/perf/python/treport.py
index 43542599a884..786b852f471c 100755
--- a/tools/perf/python/treport.py
+++ b/tools/perf/python/treport.py
@@ -92,7 +92,7 @@ class ProfileNode:
         try:
             assert session
             thread = session.find_thread(sample.sample_tid)
-            comm = thread.comm()
+            comm = (thread.comm() if thread else None) or f"unknown ({pid})"
         except Exception:
             comm = f"unknown ({pid})"
 
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index a3ffaf4d0850..fbfa71b1c4b6 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -3912,26 +3912,29 @@ static PyObject *pyrf_session__find_thread(struct pyrf_session *psession, PyObje
 	struct machine *machine;
 	struct thread *thread = NULL;
 	PyObject *result;
-	int pid;
+	int pid, tid = -1;
 
 	CHECK_INITIALIZED(psession->session, "session");
 
-	if (!PyArg_ParseTuple(args, "i", &pid))
+	if (!PyArg_ParseTuple(args, "i|i", &pid, &tid))
 		return NULL;
 
+	if (tid == -1)
+		tid = pid;
+
+	/* Look up the thread in the host machine first, then fall back to guest machines. */
 	machine = &psession->session->machines.host;
-	thread = machine__find_thread(machine, pid, pid);
+	thread = machine__find_thread(machine, pid, tid);
 
 	if (!thread) {
 		machine = perf_session__find_machine(psession->session, pid);
 		if (machine)
-			thread = machine__find_thread(machine, pid, pid);
+			thread = machine__find_thread(machine, pid, tid);
 	}
 
-	if (!thread) {
-		PyErr_Format(PyExc_TypeError, "Failed to find thread %d", pid);
-		return NULL;
-	}
+	/* Return None rather than raising TypeError when a PID/TID is not known. */
+	if (!thread)
+		Py_RETURN_NONE;
 	result = pyrf_thread__from_thread(thread);
 	thread__put(thread);
 	return result;
-- 
2.55.0.1082.g2b9226bbc0-goog

