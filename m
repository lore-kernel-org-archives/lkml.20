Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525D381E92
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223370; cv=none; b=eP7DxOuyUbhKQgcsPEV4jyqAEvGguU5E/CJJEpa0/ZhWqs0Wl0UMsMsPAI58EjymAw2XKxA7ePdIUSx630x+Y65kVRic6+kibwp8zRqO2SdV72dFAJdrvtDn47YaPReN13q5gZWVA5bwn60Hg4l4yUW+yYioYQ7cH92TFgTuZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223370; c=relaxed/simple;
	bh=DF9ttw9gsIyZmdVs7+pxevIxFIZSuyIkqbVJ2evMJ0w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jSxjxKsPp5uWfzx7KyTjCCwbjZ5iJXgOBUVAxjsNzu4WPt3hDTBd2UbUL0AcoHVH77RepBHsLG2Fqu2VQw+UxXPQ2q1JEWcMY0F8dloI7avx7SRMPWANchaHQT3k0X53THKxLJ/QsUEezBK9czfIiEBv3sGLNYiFtW0FOHZBcgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=klJkymFB; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="klJkymFB"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2f2b8d88fso2669483b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223367; x=1790828167; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEI/P7TyGSCt3KjWgkyHKt9XAW456tf2RY2L8btU5B0=;
        b=klJkymFBrW/BWYMfhIOX2TEopHynPnFJYOvG9JD4SJdkLyxD1T4JV0KvMz/mxSgAK1
         eUGnnmh7DHzRXp+tPyWUHIW4XNejLVenv6hGve7Lz9pRoZUilzU+GgkC9gp6VRZhnMfE
         6GjCH8SrqCkWOPe836h5g3NpFwxuzU4zXsyCXVHfhKW6iltoVVFQBGt1dIgyYSC1l/Dh
         VZqiYFL563XZ4OKfnNUvRep9/yP7vcapjzgGPYd7YCvbMA9i1Z482Mwlpr7gqGzNOKs5
         oSxmc61Qs7DrU0IK/scYPK+vL87+/AJn0Hy3GQfwhsqvC72RUupLQ6y4iSzPY+EEAciv
         s2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223367; x=1790828167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEI/P7TyGSCt3KjWgkyHKt9XAW456tf2RY2L8btU5B0=;
        b=xywtcCSqLahDGm5d6hv5kNq6qOadloubNxiaEfOVS8qtxvJSlflhE/+0rbQHZhhiL8
         jUCgQDbHPu7wD6P47mHg0ZTPOrxju6MLsSJdf2VBDAaeoH4iUTNk5s8tdG+Wj6jLheXE
         iarrqxbZWUmGDEW+Ub1ITLdcjYd1ywbLJhFIx+XciwnaUZS+TFDP59BQb6eVSVHg0Pqv
         NzCf0WCIQg9hcwSdOWfBYibpCPW2dkFSpcBIE4L3WwhQ3YqAAWYhZhCxRnBcTUywZI11
         ydJFV1eWxmQ4Y0z3fSddpp4TXWIwm7yYku+zLr30KkUZ2mDDBuBEbfhA+0F0yqjI+wwo
         znbQ==
X-Gm-Message-State: AFuF++lRKa3WTA6p262aZFUhjWWG383KfSq+RSmkI+TuNmQWd/5pp22U
	3hiY5lxtICnSvXF6nIAa9xGES0oVgxmUM7ZoBkaOZfT3NdzcMF6vlqR0jF3K6suc1G6X0h726hM
	TTa2GTg==
X-Received: from ilef15-n2.prod.google.com ([2002:a05:6e02:618f:20b0:503:668b:b863])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1793:b0:4cb:f21c:a796
 with SMTP id 5614622812f47-4d72982ef61mr1415785b6e.30.1790223366735; Wed, 23
 Sep 2026 21:16:06 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:15:57 +0000
In-Reply-To: <20260924041604.3209659-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-2-avagin@google.com>
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
2.56.0.rc1.310.g51773c2048-goog

