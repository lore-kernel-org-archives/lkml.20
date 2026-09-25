Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6E4DAF94
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353501; cv=none; b=E8w9e1x6AMNTceEAyzJkQMoMv6R//FFxFs4nb7n3lcliCFrM10KMb+rceZ1ZFEX9xKlwqz4DBDpxAY1UNAnfAOd2RXN8+Z3iZ3mdr1E4+uuW4rDu6Hjtt2fPFWK6HgytaiBCTpkP/xEOOc0zhAcMsvYIlwwNEOTTS4Qoah0vwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353501; c=relaxed/simple;
	bh=MFHgjRUFrURWMuBfH/7m+QQEwb6KSPJcfIBqBGQPZlI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ULeBqrJuo06tMWWHl5HTmzkvGokCDVWVZVeZbV4D3iH3Dv6e6hBG0aTb5Ict7DjXduXRMvDG7J4IrqZWxeV4z4J/iyldD5iu5hEVwl07zmIxZgTcakqx/N+dmbb6AFEDP+wXOPA0hGNv3dqIZn5RqnCKPY3elF7xzWOYhbrpZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ELMYK0eP; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ELMYK0eP"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cd3e90ff97so1162263b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353498; x=1790958298; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWY43kpRw2o5ypwDPUlrvSnRFUL6IMLWNwvSOplpeh0=;
        b=ELMYK0ePifvS7O91GtqhLYmdP0XZ6pj05DRxx1s2AgTp07zMm96lpP7ztPXj/NqWCW
         iDE93+StV38JA0dC/NnpilsDWEqrzvkWulAk9jWROFbmLQejYZLw9EnO4WJgNzdcBhjJ
         2VOOnSidVh9A/dKom27Y/GDLBRuP/8zfqkU+HmV6xiTRL6vIhUx6uXHWOkf2hHAmmo4V
         mTiQUZ86UYHN7Mx2fksRonV1jyaPG2lA8+RWrmMAj+7svEZ1NzSBlzJkkjHsJ6Nt0f8y
         IDHZWfunFmcJ1jb6/mZCUlMdYMlDTvFgdJp0Sd5bPeTJUsDUH00MVkF4yM7GHh7K7hOK
         EIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353498; x=1790958298;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWY43kpRw2o5ypwDPUlrvSnRFUL6IMLWNwvSOplpeh0=;
        b=ZB3kKrcw6jr9NczUw+LwXaIEWrgwN9+WM23c6qtC0sPCXMtg53zNNjFftcO8c4EYW3
         VRgw/RNijfVrKpF/J3XRcJ2WaGHPUA6wvWiE2eQFHovB23DccLxoYW8CpILiHPAwG8gw
         4RbnLLb0USMeUaQZZ8U+xFiaTIWq4Ay1KixghageQjwvyrbHoxnIv6nmMvcMcJo9fFFg
         FHcJQShhAzDMb0G0ty5vzeZoWDMLVcmI4Ttz8vGL8SPt7IgPrfsmXwh8gdpzaJtl9T4c
         pWtXd5A3fb6GQPQ9mCRCDwJw4FZ2oyDSIIuUwsnyfgVR/eL3VJFrqia5XKfD63NzDAJO
         D7aw==
X-Gm-Message-State: AFuF++mD9Ft2b4SpVlMQd/0oKwtezSH/rOlUd6FVUlHBDqOWujVVbwb/
	1JIqGENcepi04FfuT9bpscD464E1QXfqJzx2ao3I87SGk/zC0mPgF0mg1sJsBlDV2RfYo0ECn7w
	FxJX3fA==
X-Received: from iobdk26.prod.google.com ([2002:a05:6602:1b1a:b0:9c4:2378:b447])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c3f4:b0:4d6:9273:251d
 with SMTP id 5614622812f47-4d72cf4d5abmr7256779b6e.57.1790353497434; Fri, 25
 Sep 2026 09:24:57 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:47 +0000
In-Reply-To: <20260925162454.1403405-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925162454.1403405-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-2-avagin@google.com>
Subject: [PATCH 1/7] x86/fpu: Document signal frame layout and portability
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

