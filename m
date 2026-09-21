Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAF32AABD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967244; cv=none; b=ALN5N8DvpIh4kXasMRd4JZ1LT8P5KdiJuT2g6mc1YOcCTTnhI+43kZVQrCYB92MjWWf71lmmWrDbnepP4dY8oKphO51I90OT7sU4XSxxQWKPynzTcZd/t4WzLz4cQHcbqdU5J/ioclxqj3jmCGYF6fj12h4p0mH857Rnpl7cXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967244; c=relaxed/simple;
	bh=GkmdESfvVw6Bhi5+j9XdWNIprQz32gaz404QEYVpfn8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CnV/7H8mAlSJvedWIkvUO2UiKIAHnBJRZ8yJTwufVDR2gX7NB5+cQp9GFavkTCjZ32/UXwS9WjmHYebFLT7lbQJ8rtBhgUxGxj5zzQ2r0V7n0W/WhYh9cYZw7GofMCMAXjpQ+noXP2yY/UpEgF8Y2SuRYAavb+lkMKCkfvqvxZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Leii7JsG; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Leii7JsG"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3529327a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789967243; x=1790572043; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1sYzCcuJgWy+91qkWtU7G0DCPhx+Hi9Vsjhecq4f4U=;
        b=Leii7JsGB+5B5vsNYSutBh9CsIZQJNW+mnTyoIbdckHa1mhFCzZLyG59gJL1bANaYy
         s9Sfe49b4ULOyJSBK4l5NHRrS92hQ8+MxlbILtgJ0kdUxklLTauPXFb2tvjqmAE7BaJY
         XcEuNL0QwfcOYjB+Ifx+yTot3c/q+BckD9MFuNavDbJskGFH8RFSWpSewEqeFq3T5MPK
         WzApZ/fjTgaVFwqxA9FT+Cy1DfZyxfnzyCJis0eCBkNGmHHNusN5NtnHG1kosxFD4O9n
         T9o+/eHXC7Nu+fm94iC+9n9x7c2aSe3DwgEDNl8omjJSma3F1kOx5bd7i+xcbnkmxoLE
         dUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967243; x=1790572043;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1sYzCcuJgWy+91qkWtU7G0DCPhx+Hi9Vsjhecq4f4U=;
        b=qUeMPuUN6Z9EenE7PZqyhF5oOtwEcM6KVDRzIQZp9PQuDBDdBMMEISUtoPdMvAzyZO
         8D1+hcx5zVX9auIpbsbpov7uWzXPXPSfKSF9Ts1e7FDnHyYy5/Be1z3dAS5DhPWltCpu
         sOq/zqwC1T/JmcnB8tF9D9A8s1uC/xKB22/XBCRgTSZHZEcAnxSMku+QwIaswtPZbP3G
         88B6xHqYgBwzZ+Fg66dZJwyxUHx4pC3SUsTKySro3atYEM1oUbOlPwhSoiplbgR+FmPG
         gn1gjrZxeo9QC0sEf41jRMuV9xip5kxacx3ZOiVjCN/5cAJYmgFCFZ/2K1rb5z2CkcY9
         z4vw==
X-Forwarded-Encrypted: i=1; AKwUvBwgHlcPKywD6ZqWbvDLjPb08ucZ2pjnbQB7yZguX9fIDHaMbYPjuqwgpVGnPkU7w0HEo3zgG9Ts5TdaIWg=@vger.kernel.org
X-Gm-Message-State: AFuF++m2Dp3YLSFu4Hx7us2NZgLF3t1frV+eOh7cYGnY1TUxRYt/99vy
	51/AMJnPjS71BNDdirt7IqH8C9aFyYZwWktkxfIUytTuj9ugv3G4M8BzzzfA7n/Vd4hylhLtiUH
	6mw8bHIDeWQ==
X-Received: from dldyr17-n1.prod.google.com ([2002:a05:701b:4511:10b0:143:7976:20e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54c4:b0:39e:4c7f:7308
 with SMTP id 98e67ed59e1d1-39e55071981mr14570736a91.31.1789967242503; Sun, 20
 Sep 2026 22:07:22 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:06:19 -0700
In-Reply-To: <cover.1789966896.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <f64b7f59e863302bb81c14a3a13af2e116d38b8f.1789966896.git.irogers@google.com>
Subject: [PATCH v2 01/49] perf python: Update syscall format string to
 optional positional
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Update the PyArg_ParseTupleAndKeywords format string for
pyrf__syscall_name() and pyrf__syscall_id() from "i|$i" to "i|i" (and
"s|$i" to "s|i"), allowing elf_machine to be passed as an optional
positional argument as well as a keyword argument.

Update syscall_id() and syscall_name() in perf.pyi to match, and set the
return type of syscall_name() to Optional[str] as unknown syscall numbers
return None.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/perf.pyi | 4 ++--
 tools/perf/util/python.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 58b0b3ed819d..e737eb21567c 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -20,7 +20,7 @@ def metrics() -> List[Dict[str, Union[str, List[str]]]]:
     """
     ...
 
-def syscall_name(id: int, *, elf_machine: Optional[int] = None) -> str:
+def syscall_name(id: int, elf_machine: Optional[int] = None) -> Optional[str]:
     """Convert a syscall number to its name.
 
     Args:
@@ -32,7 +32,7 @@ def syscall_name(id: int, *, elf_machine: Optional[int] = None) -> str:
     """
     ...
 
-def syscall_id(name: str, *, elf_machine: Optional[int] = None) -> int:
+def syscall_id(name: str, elf_machine: Optional[int] = None) -> int:
     """Convert a syscall name to its number.
 
     Args:
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index d8a842621cda..a3ffaf4d0850 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -4111,7 +4111,7 @@ static PyObject *pyrf__syscall_name(PyObject *self, PyObject *args, PyObject *kw
 	int elf_machine = EM_HOST;
 	static char *kwlist[] = { "id", "elf_machine", NULL };
 
-	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|$i", kwlist, &id, &elf_machine))
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|i", kwlist, &id, &elf_machine))
 		return NULL;
 
 	name = syscalltbl__name(elf_machine, id);
@@ -4127,7 +4127,7 @@ static PyObject *pyrf__syscall_id(PyObject *self, PyObject *args, PyObject *kwar
 	int elf_machine = EM_HOST;
 	static char *kwlist[] = { "name", "elf_machine", NULL };
 
-	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "s|$i", kwlist, &name, &elf_machine))
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "s|i", kwlist, &name, &elf_machine))
 		return NULL;
 
 	id = syscalltbl__id(elf_machine, name);
-- 
2.55.0.1082.g2b9226bbc0-goog

