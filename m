Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1A3D9048
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279842; cv=none; b=oXPy7uDrg7ssP2LcaTWDWpIyZRv+bYhhl0YFcxbxBnC0KHWeeRvoe3HGFgH76W+/3jQsjABa7U391xyZNEL4BnPyYjD5iM1YbE0kdmLfe9HoD+ydrnOdV12vEem9buFompSZ1s6zS0Oo1GFcazlFxq6cxHa89abWfghi9b78QQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279842; c=relaxed/simple;
	bh=iLcbc1HzGTozKQw6QU5goIrH/E+sVR+cS+TOcPW2ZOg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DGjVWTwtrDf2ovsHyajBK7nkf4qMyM4R4A9B5wtB/jBStHJHtITMgvITOBu6RPB1LDSzx3BkfYbBUbIFw8YR+PK25D3ZnAPVobQ4l0NJRKmzfmddw25CnKXQ+ZuMfXEI77cNOIZ/VQy1Z82wjeBaoK8QHq3oq2pODxsRmOMnVtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cWSBbcin; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cWSBbcin"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so1603159a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791279841; x=1791884641; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjGTgfZsDADCktmqdDXJCkHYgkEUNyCL+EFPGA5tSXE=;
        b=cWSBbcinzVHHyYhCaeKztIIfL+hofX4z/rrNPDDgzetvziAT1cyiI4BrXHt2XsyrYM
         q6oxPMsuYPIucSeQziJktloRRnQH20xen5cPutdoVOa2u0PrceAijpdivf0Bd09w7cq5
         YmWDeFmDDK0fvkIFsvty6c7zz0WANfNR1XXQ/EHa/6wxuq2GwIAoJibQ3vI3mHzl17my
         2d26BqZwDgZqDIZWhpUoA2O09IzIfd40GE8Ua2/z4qQjdwHJWABsSU7RHIBUqw7PGUaC
         HgikLMnuC9dH8SaiQziBwe2HPf1h4QV5SXMheKUCXA7cDDweuXqq0JRVPuxbF4FThKk9
         fFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279841; x=1791884641;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjGTgfZsDADCktmqdDXJCkHYgkEUNyCL+EFPGA5tSXE=;
        b=N4s72pIJZx3mGDJnF8zX2Wj9xIMyVSsIVxhPHHfOMdRqf8NTQD/LOrLfcP6SUxb70x
         hjov173h5PpFlFVdFjXQt8TOVQWyp1S/4740ll3p+hLm9TFD4iORuPAoUgDDZi0HHULk
         vrTPo6UoCPDZJsG8gOagM+WkhP7r9GgIvssoKsjDruJJmokREtiFK5HxUSwlCJM882h0
         x3p01Q2kYzqf/SX9GRIGQGnIGkMwEJ+mrAS1zHveVeHpVXrv3iqMw3ITp2zgQ56F71d4
         G50yGHXHaK7iqV/juJKKg6V4sp9uo5kmI+P0PDqlAtfO+WFday/Ap615OJ3zvuAXq1oK
         mdOw==
X-Forwarded-Encrypted: i=1; AKwUvByM58Aphn9W3JtXWHfZi42yg2kKpVkXLEYepmqlR9v0pFBm1E4PnU+S+1WKJZzHPnvo8YYuuFJxsjTLJfM=@vger.kernel.org
X-Gm-Message-State: AFuF++lI4+obzjpUilaup1Xe2s043CIXg/T4efnmffvaO449TXILbRZP
	9xIxmdqk+nj6nj6lihYcOpknSR7cqdXAQ418jwWu/PtYJs2jKb5gLwOMjJ3w7daATQ44Ez1KRgR
	T
X-Received: from pgba19-n1.prod.google.com ([2002:a05:6a02:6453:10b0:cc8:1e8a:c8d0])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2c11:b0:3e0:dc12:890a
 with SMTP id adf61e73a8af0-3e1248398a9mr649187637.86.1791279840528; Tue, 06
 Oct 2026 02:44:00 -0700 (PDT)
Date: Tue,  6 Oct 2026 09:43:58 +0000
In-Reply-To: <20261005102518.2400984-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006094358.2948476-1-morbo@google.com>
Subject: [PATCH v4] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Kees Cook <kees@kernel.org>, ardb@kernel.org
Cc: gustavoars@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	justinstitt@google.com, broonie@kernel.org, elver@google.com, 
	alan.maguire@oracle.com, namjain@linux.microsoft.com, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

Code that runs outside the kernel proper, such as the EFI stub, gets
nothing out of the counted_by annotations: the bounds checks they feed
(FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.

The annotations can also break the build. A __counted_by_ptr() that
names a member declared after the pointer needs Clang's
'-fexperimental-late-parse-attributes', which the top-level Makefile
adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and does
not get that flag, so it fails as soon as such a struct is pulled in
through a common header.

Overriding the macros from a Makefile doesn't work:
'compiler_types.h' is pulled in with '-include', which is processed
after all -D/-U options, so it re-establishes the definitions. Follow
the '__NO_FORTIFY' precedent instead: let a build define
'__NO_COUNTED_BY' to turn the corresponding annotation into a no-op.

Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we need it.
v3: Add the version to the Subject line.
v4: Use __NO_COUNTED_BY to reduce churn later on.
---
 include/linux/compiler_types.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f139007..05e2b637f1cd 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -371,8 +371,13 @@ struct ftrace_likely_data {
  *
  * __bdos on clang < 19.1.3 can be off by 4:
  * https://github.com/llvm/llvm-project/pull/112636
+ *
+ * Code that runs outside the kernel proper (e.g. the EFI stub) can define
+ * __NO_COUNTED_BY to drop the annotation, since it gains nothing from the
+ * bounds checks. __NO_COUNTED_BY should be used sparingly, because there are
+ * better options for opting out of bounds checking.
  */
-#ifdef CONFIG_CC_HAS_COUNTED_BY
+#if defined(CONFIG_CC_HAS_COUNTED_BY) && !defined(__NO_COUNTED_BY)
 # define __counted_by(member)		__attribute__((__counted_by__(member)))
 #else
 # define __counted_by(member)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

