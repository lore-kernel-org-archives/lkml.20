Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5D23D47D9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881764; cv=none; b=L1Kc9qbE9515EHdvdmS7A0OBR+KMKY6p3qb93BugNtyKIMhbd3dT7qUTpw56VzzWMPjUND6Lh3xMT+ekzoh/EihMgglR8K0ToX9Wwqp4hLJ/VoLwqsMsl5DU6hiQ10aTYUzBLRt2sj4nj5hjaUhLhkCMmRaBeA92JgzVfNCNAh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881764; c=relaxed/simple;
	bh=b6FTBE2cgcmTkzM7F+IvHRGwoCfgMp6KKaL4A+r9IGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bcE2nGXM9QwawZrTWFFSbgzSlOARjkcUr7HD1Qq3nXfknP6lG2A8+FDhVJoC2sg767U588aVAXpPbNFYQO+7hAwtwPb4Th8bQsY9Rnf7/skmroLS7tKKpUOVagog4SMVXaPoRlIEy5nqaE6rK98K6qwoJBg4Kv4V6iXoy0ECfQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gozy75FV; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gozy75FV"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1825840a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789881761; x=1790486561; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe997LNMBkLZ3Kgt92IC6PAaRQ4QWxrEwEsrkXtyTR0=;
        b=gozy75FVzcLlD+RhN2zrH9VT/g+LBzLfNxKhUQ+eGjUhE8EHRWrD/sh93PTO2M7sQC
         261d8Qlh5UJjIQGHCp8w5Ly0bFM+cRrLqWsL2tcrFk6lZ/dH+n0iO6q6QbAomZ6d1VtM
         Xa1Q0HuXJIfebv1rqFCY5AWYbm0056lJZNj3FYbbZZA1dQy89pcaUZYeo5iIAgwtSESe
         E0hZcHn8uFBlsnPv4tvBWKLdbg5CxhrWaQTkvtBeTPSr88jKhVDq5CzfpX4T06XU7G6U
         Cs4iJvCU+G68H4VaD9bBOZEV9bSv1LonuBk0YfUViFuTzCWlokaBOMw6xDOhvocLcHBR
         LNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881761; x=1790486561;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xe997LNMBkLZ3Kgt92IC6PAaRQ4QWxrEwEsrkXtyTR0=;
        b=ubjk3mcayG8gGaEe8EtzguTALVDB6+f+LwcFU3DCr9sCjF7VxonYGp4cvcW6DUjGBo
         r0yyAERX1Wvg/YMRgN27gZ5nVs4AQ9xpaIHzzWuuBI80LaCTSqVQj0I/Pz1ApUXPdZtA
         ZsmHYMVppH6TDXa8ROFbItNLqzTyCps9l0JZ0X0FB/Mg1LGbTgCgrHBjKj/Bh3QjPlpc
         jR0jrUehvkgsRrJp26+4YNK4NtQJptR1pXqa588I91L/3SZEFG9lipwFsKzcuaiZ4Bio
         6Nv5JwervDYOmWmr6VYp1hLmXDypgTLiI2TwbZyNpT/gU7bkFimJS9hryEbykrF6JrP/
         7APA==
X-Forwarded-Encrypted: i=1; AKwUvByiKDJLdDC8YjsTLmzpl9uTKXHpx/FtcDs7tYZ7qZobKRpG4++9f0m8AY9cuBieUt5VskKwICLtX7JDvDo=@vger.kernel.org
X-Gm-Message-State: AFuF++kyN/F/tuxSiwMBjvF0aNsUdzbM4uqwe2LMeyWbg2NycYmA37FU
	c3WDSmD17MTGyWpGNP9ybdqU/r77iYRPv+5nigBPM8BoPi8x8kY10OqeLZYQZ9jypw+MU1KffyR
	8BOSArjwd1g==
X-Received: from dyhx2.prod.google.com ([2002:a05:7300:6702:b0:33e:446f:2f4b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d70f:b0:3dd:85a8:cacc
 with SMTP id adf61e73a8af0-3dd8c47d05fmr12714878637.35.1789881761250; Sat, 19
 Sep 2026 22:22:41 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:20:54 -0700
In-Reply-To: <cover.1789880842.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789880842.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <621ab9b3227a1845f5c2d8819ad84e4cf494f50a.1789880842.git.irogers@google.com>
Subject: [PATCH v1 02/49] perf python: Update callchain stubs and session
 thread lookup
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, adrian.hunter@intel.com, 
	alice.mei.rogers@gmail.com, james.clark@linaro.org, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
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
index e737eb21567c..e5259e9b61dd 100644
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
+    def find_thread(self, pid: int, tid: int = -1) -> Optional[thread]:
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

