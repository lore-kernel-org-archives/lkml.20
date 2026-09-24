Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D74D2EC8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283690; cv=none; b=JWg5nUt9vBhBv5cWceRJTaJNjkMoW4a3nMy8ISNJE+SGdLtZxBYp6wibBAK9ISpLhWzJsrxFyG9fNbzZI5HmJaN2DZrvuVPDqSHY+taYg2MNMYOphgziHION7Xbvr0uAxd/47eoU+6GgnmpKR7RNb/96rCccNiKoDgk+Gib0yrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283690; c=relaxed/simple;
	bh=MFHgjRUFrURWMuBfH/7m+QQEwb6KSPJcfIBqBGQPZlI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CpmAcgYO+Fb05bBUsdqpKf3hEquoWrOKN0ut+6R7O2QCPJWW8zBq/RnFsXQxsEbZZSoOSjGqJKo4+t/oMeGSkMAxt8dkIollDO/+bPoVu666GrzSp5ubMDEFfkRJAtlPLjM+D0AsgEflySigDasdssLFTANLWgcSGR+rPfrlcJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tshDfNy8; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tshDfNy8"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b1bc2e44e0so555274b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283685; x=1790888485; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWY43kpRw2o5ypwDPUlrvSnRFUL6IMLWNwvSOplpeh0=;
        b=tshDfNy86jb8yQm0M40GSzOtqb90MtfQSaymlsnmohMVY7i5CMyeUar36BvZDzlkqp
         gpiHRmpiNExiu0vXfrLuBCdd62k1k/WOSMz2Cm27e59e0YyVZZSwwwEghiCFDxEchiud
         puCvTf6pKBjdbmK6/vOTsBdBcj5eigg2FzObqDsbYpW46QkxAEwjPTGWG0yS82gaM+Hn
         sRbbayEHhOVyBsvdW6U8NP11aMEW/2MA4XgGutmWe7RWN3q1KRry2YS66aKvutL6pGnP
         vzOLpVfDGLs+WH8q5Somz4HAYeTAwViHAeHuc+8+JysvKH6OoNn4u/JT2WWcKlX8mZ6o
         Ke4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283685; x=1790888485;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWY43kpRw2o5ypwDPUlrvSnRFUL6IMLWNwvSOplpeh0=;
        b=CuxrnGV4AsO7mRoa39m8u+q87cUtZrc0eQQ3ILEWtis1HCy66uKZndHQ8cdxepzK2o
         s1khJtF12Dj86iAWwj0oqg+j7UxIc99HRst437ezPKM0c+OTJxFVqF8v8GATDqMienf0
         Dn+7Rn2oj0KGK7lWCn7C420r3xSJC7GYSVldgL2UuePBa6+UHtcVnf/CU18vjEJo0a5n
         9mLpteHgDE0VBDRJbc92tsEORxDv8cNe8Gn1Ttkcuk+07nK1Wmhgu+eOjCDCOKpIhbOl
         kgeSM2qohccd1J7gffpZEPD3hDzmiGTMpCF7qRU+MpZlW7Gf97QUs0RdndCHKyQJZ5dT
         vjQQ==
X-Gm-Message-State: AFuF++n9wL9Qvq0sMY9EEOqv/bFD7VLlH+IhJS2SCMCWb9o/AnHquhoa
	7oIm96n6uqTZzXKOQUQ+M5co0c4wrTO1oVLfUYSUsl1xEi1Wapgf1KGjvhihLfN1HXTqeb13YKN
	3XVoWVg==
X-Received: from iodl4.prod.google.com ([2002:a05:6602:69c4:b0:9c4:bdf1:40e5])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:6a98:b0:4b5:5bfb:f25b
 with SMTP id 5614622812f47-4d72e8622fdmr4395052b6e.20.1790283685167; Thu, 24
 Sep 2026 14:01:25 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:15 +0000
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-2-avagin@google.com>
Subject: [PATCH 1/7] x86/fpu: Document signal frame layout and portability
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

The x86 signal frame is designed to be self-describing, with the
'xstate_size' field in the software-reserved bytes indicating the actual
size of the context. This design is required for portability, allowing a
signal frame created on a system with a specific set of xstate features
to be restored on a machine with a different (larger) set of features.

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 Documentation/arch/x86/xstate.rst      | 54 ++++++++++++++++++++++++++
 arch/x86/include/uapi/asm/sigcontext.h | 15 +++++++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/arch/x86/xstate.rst b/Documentation/arch/x86/xstate.rst
index cec05ac464c1..e2944f744255 100644
--- a/Documentation/arch/x86/xstate.rst
+++ b/Documentation/arch/x86/xstate.rst
@@ -172,3 +172,57 @@ are extended to control the guest permission:
 
 Note that some VMMs may have already established a set of supported state
 components. These options are not presumed to support any particular VMM.
+
+Signal Frame Layout and Portability
+-----------------------------------
+
+The signal frame is designed to be self-describing and portable. This is
+especially important for checkpoint/restore tools like CRIU, which may restore
+a process on a different host than where it was checkpointed. A signal frame
+created on a machine with fewer CPU features can be successfully restored on a
+machine with more CPU features, but not vice-versa.
+
+Signal Frame Software Reserved Bytes
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+On CPUs supporting XSAVE, bytes 464..511 in the 512-byte FXSAVE/FXRSTOR frame
+are reserved for software use and contain ``struct _fpx_sw_bytes`` (defined in
+``<uapi/asm/sigcontext.h>``)::
+
+    struct _fpx_sw_bytes {
+        __u32 magic1;
+        __u32 extended_size;
+        __u64 xfeatures;
+        __u32 xstate_size;
+        __u32 padding[7];
+    };
+
+- ``magic1``: Set to ``FP_XSTATE_MAGIC1`` (``0x46505853U``) if an extended
+  xstate context is present; 0 for a legacy frame.
+- ``extended_size``: The total size allocated on the stack for the frame,
+  measured from the ``fpstate`` pointer. In 32-bit signal frames, this also
+  includes the 112-byte legacy FPU state prefix of ``struct _fpstate_32``.
+- ``xfeatures``: The mask of xstate features saved in the frame.
+- ``xstate_size``: The actual size of the xstate context for the enabled
+  features (including the 512-byte FXSAVE area and the 64-byte XSAVE header).
+
+The kernel uses ``xstate_size`` in conjunction with the pointer to the xstate
+context to locate the ``FP_XSTATE_MAGIC2`` (``0x46505845U``) marker right after
+the xstate context (at ``xstate_context + xstate_size``). In 64-bit signal frames,
+the ``fpstate`` pointer points directly to the xstate context. In 32-bit signal
+frames (including 32-bit compat tasks on 64-bit kernels), the ``fpstate``
+pointer points to ``struct _fpstate_32``, which contains the 112-byte legacy
+FPU state followed by the 512-byte FXSR state (and any extended xstate). Since
+there is no standalone UAPI structure defined for just the 112-byte legacy
+state, the xstate context starts at ``fpstate + 112`` (and ``extended_size``
+spans the entire allocation from ``fpstate``).
+
+Portability Constraints
+^^^^^^^^^^^^^^^^^^^^^^^
+
+Signal frame portability is constrained by the architectural XSAVE layout.
+Restoration is supported only if the destination host supports all features
+present in the frame and uses matching component offsets and sizes for them.
+While layout compatibility is generally maintained across CPUs from the same
+vendor, differences can occur across vendors or if the XSAVE space of a
+deprecated feature (e.g. MPX) is repurposed for a newer feature (e.g. APX).
diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
index d0d9b331d3a1..cff01406c0f4 100644
--- a/arch/x86/include/uapi/asm/sigcontext.h
+++ b/arch/x86/include/uapi/asm/sigcontext.h
@@ -34,6 +34,21 @@
  * fpstate+extended_size-FP_XSTATE_MAGIC2_SIZE address) is set to
  * FP_XSTATE_MAGIC2 so that you can sanity check your size calculations.)
  *
+ * The xstate_size field indicates the actual size of the xstate context
+ * (including the 512-byte FXSAVE area and the 64-byte XSAVE header struct
+ * _header). This size is used in conjunction with the pointer to the xstate
+ * context to locate FP_XSTATE_MAGIC2.
+ *
+ * In 64-bit signal frames, the fpstate pointer points directly to the xstate
+ * context. In 32-bit signal frames (including 32-bit compat tasks on 64-bit
+ * kernels), the fpstate pointer points to struct _fpstate_32, which contains
+ * the 112-byte legacy FPU state followed by the 512-byte FXSR state (and any
+ * extended xstate), so the xstate context starts at fpstate + 112.
+ *
+ * This makes the signal frame self-describing and portable across machines
+ * with different xstate features. See Documentation/arch/x86/xstate.rst
+ * for details on signal frame portability and its architectural constraints.
+ *
  * This extended area typically grows with newer CPUs that have larger and
  * larger XSAVE areas.
  */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

