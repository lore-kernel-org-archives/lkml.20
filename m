Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDC4A99A3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601004; cv=none; b=GpXGYFzWlaQkRwftEp7tSiTMnFktmrYHxdOAuVt1j4I7+Lm5G1uUJr3tFy8QThHvLjxMSQcDU3QeSPVEfJRNkUwJkmiji+RR22qii4HlUWpwbw5BjqOn0K4yLBurq5gO6TAIGhVU8IydIoC+1g6vzsxDW5b9lytGLTd/RJAll5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601004; c=relaxed/simple;
	bh=lmzy9PmENJFchGq9+VMyZLm7rZhb6PbTGTXhsAicIyE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rapP0tRPdBNuUXZRPMXkB6rbdIWv1Ud6x4jI7+qFt52qe3XQhXUBQ2YCY2Lcf2/PaX/J6GC2Dv1ITgqQ64O6EYFNTrn3D2j4zHrmiSJKHTBluD3VlQZtKpucF9tHtYwrnJfP2nQIThhaXC7xu0fZ6HiR9hKF71/+JyOj6QKgwas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BaHJiCVf; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BaHJiCVf"
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c7f1caa802so228979eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601001; x=1790205801; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpDStlFMnwPFtqTx5sgyKul3FKBcXTV71LkraBHXvfg=;
        b=BaHJiCVfyKyFiJUXCxspXGocwp+rGPQSVs2z3LwRV2v/LnySYFurU/Xc83E0s9uraP
         mKk8OYp18auMSgpfXWbpZjCvO+XDrpB4S7dM326QYa0eZs3GPpXGoQoxSQ8OoM5F/wym
         u2USV3qVWoy7BkqLvSMqbA/IfG7S8D6d44Gx7/oYBRYZATHfSpaJ5qwahO319QtIp2A8
         lTsxKcXuYdeGuP5W2pXK+g555pGAqxqnx0gn1L0WNI+sw9PP6LJjABSGYf+atN6WylbJ
         mL0frVpt/7DiW5Us7h0yymnWfOWvnO0P7kbIkj8uyqbITmuei/uvOCoRfI1x4DUraPY4
         KG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601001; x=1790205801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpDStlFMnwPFtqTx5sgyKul3FKBcXTV71LkraBHXvfg=;
        b=wE5fshhsXcnuZtTlMGy67mg8kHg1fKamITcrVtEPeCugDcycNLihQ/tuuN8FEBLRD4
         AC4sjyqq+B28o9SuqdwgYNeJFjzIFzcWCvIiF/C71i8UH71zw1BIXGkPDC/mgPYRny2o
         7pBG72WEraNpIYuZXH8i4YCuA0jIWTabcyl9PpzuJk/FfIO42Es+K1QxbrvB/sa6rHtU
         rICnSGqN36r2xrbgSGkTJmzNUEQE2K3McXuqpOVGlVPMYrTfQaxdXUVq3ZsO4Gd4O7SI
         Xu5wNeZzYNIXuvv2UG+g49cPtXxo8V6axf1Jj6YNZynJlTP5vPSQJ3lw4B6I93OcOGHy
         l1YQ==
X-Gm-Message-State: AFuF++mxTY/oTLrHYapfsSlKVWQuo7V5/24Hb3VUQ+WwpnDbmjqF+YLF
	8tKKgKWHIHTRpq/iayYvVVI+DFUJyJduUbecpskGElRm46cOOrMbLV9eEc0QKYqwmfZ0sR8cCDh
	V6FhRRQ==
X-Received: from oaccg22-n1.prod.google.com ([2002:a05:687c:2296:10b0:46a:ebe4:ef8])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1529:b0:6c0:f6be:e524
 with SMTP id 006d021491bc7-6c7d53f1ecbmr3839022eaf.69.1789601001293; Wed, 16
 Sep 2026 16:23:21 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:04 +0000
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-2-avagin@google.com>
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
2.55.0.1082.g2b9226bbc0-goog

