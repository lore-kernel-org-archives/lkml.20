Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19D204C31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842074; cv=none; b=IaCxcfQ2JOi42olVrqDUgXENsFKUP2gG8TCG1D8eGxp55NJOvlm0d8H+P/tQ6C/o+39jJxCOgcK9knUlrFgySZs8tkya1hZDnu5ghopFsBK3INi2w60TDktXusy8WbTEc3+SGD50d077xOyF6jP/tZQr4wOPDy4NWSC9aSgQk2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842074; c=relaxed/simple;
	bh=820WAcn/OhQr9WjFQhybPFw8BQBq2i5U1o+fO7Nb+VY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m+6n0F1B+ZymdhcIY607VjtQNm3mfdSA1mBjBUKhM4BTfR9lWHsCh9c1wCDWFMW3nwM4eAL7Nv72PeUDpbTI6WxiZ4sAb9fnxYbGP4oGCP+gwU7MVUtmng6r4fVSdpcpl51iEFwyC9Y+xkERf0BmsLYc2dSSNy+kELPap1Atius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rj5GEUkd; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rj5GEUkd"
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b352d9062fso4940634eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788842071; x=1789446871; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7eSdg298vcCEnyIcdSVrV4v+DIWuyNtu9DRp3wZxhc=;
        b=rj5GEUkdSRbKCn+fCB9/BIQ7JP90Dmn39WMQJd9vWpTAAaITv5ZPuLvwxFkKHnXGMJ
         cOsU7znUt1fEV2OAJ/oIA7SlWC8PbQQKchbnn8x3JEqLqOasp6GUAJPxBP1StTsq2jYT
         RfQOdpQswRaicuguoxbkPV2GYz/Ql07YgnTdWWBZOnDdH/8MtxD6Y8tyGIfJsDRdMAKC
         nLK9nvto25JYC4KtALY4fHDIOzneG4jQ8i8NHJ8Dapfs589gXFfz61jYyFpiHizzt5gT
         c9hADS+hfAW8OnTvlB7Zuq/b1ZUqH9wGraqPDgq2j6KH2Fs5v8/C/FDexth+PYUKeM79
         MJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842071; x=1789446871;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7eSdg298vcCEnyIcdSVrV4v+DIWuyNtu9DRp3wZxhc=;
        b=il+f8A0BcX5wUUs7vrnnOc49irvQA4a+IApfq6Vq5+pAFZ9rYxbnODzZOltlpo2J9d
         sPdpfcm7C8FWV25aRLyJYKIJQmmn8ovDMqjj1Dnvm+YJGllgCZ83JHgEyh5FaYYhX3M3
         iHxgfH6LgD6xtxzyW40jaZu7ycTLXQFyGZ5n7Jp6YhATjd9K0a7qxO4AkFO19IWACuI8
         nGoGBXkDm9HSMh0Z+hYs1ySn66fSWtomPU6A8U3Usa56cw/YSXgLrWvyz7wPbDeN9dL/
         CcNm7cZJZF8rbRzVix901EROi/iJSaOU7FIL9V42SSHRMKVQmgIAOBxNn5DPsgSx8cr6
         Xqpg==
X-Gm-Message-State: AFuF++kAeh/EKEtcGtfIx64L5o0LRgnzSz8BYhIj2Ov8xe5h+/byw1EE
	ZwhS8YUxKnPm6o1J2nTkFJOwtDtn4F3MvvLu77KDAn+k3jSxSCKCqPW/cdgllmc4n4LesMWMjZ+
	G5oSi7g==
X-Received: from ilbbn26.prod.google.com ([2002:a05:6e02:339a:b0:50b:4ac:93e6])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:2d08:b0:6b1:a812:9871
 with SMTP id 006d021491bc7-6b6fbbdb3cbmr16624710eaf.18.1788842071107; Mon, 07
 Sep 2026 21:34:31 -0700 (PDT)
Date: Tue,  8 Sep 2026 04:34:21 +0000
In-Reply-To: <20260908043427.1842515-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908043427.1842515-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908043427.1842515-2-avagin@google.com>
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

Document the signal frame software reserved bytes (struct _fpx_sw_bytes)
and portability constraints in Documentation/arch/x86/xstate.rst, and
add a summary and cross-reference in <uapi/asm/sigcontext.h>.

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 Documentation/arch/x86/xstate.rst      | 55 ++++++++++++++++++++++++++
 arch/x86/include/uapi/asm/sigcontext.h | 14 +++++++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/arch/x86/xstate.rst b/Documentation/arch/x86/xstate.rst
index cec05ac464c1..92e5ff7dd6a2 100644
--- a/Documentation/arch/x86/xstate.rst
+++ b/Documentation/arch/x86/xstate.rst
@@ -172,3 +172,58 @@ are extended to control the guest permission:
 
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
+machine with more CPU features.
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
+  measured from the ``fpstate`` pointer (including the trailing
+  ``FP_XSTATE_MAGIC2`` marker and any alignment padding). In 32-bit signal
+  frames, this also includes the 112-byte legacy ``struct _fpstate_32``
+  prefix.
+- ``xfeatures``: The mask of xstate features saved in the frame.
+- ``xstate_size``: The actual size of the xstate context for the enabled
+  features (including the 512-byte FXSAVE area and the 64-byte XSAVE header).
+
+The kernel uses ``xstate_size`` in conjunction with the pointer to the xstate
+context to locate the ``FP_XSTATE_MAGIC2`` (``0x46505845U``) marker right after
+the xstate context (at ``xstate_context + xstate_size``). In 64-bit signal frames,
+the ``fpstate`` pointer points directly to the xstate context. In 32-bit signal
+frames (including 32-bit compat tasks on 64-bit kernels), the ``fpstate``
+pointer points to a legacy 112-byte FPU environment (``struct _fpstate_32``)
+that precedes the xstate context, so the xstate context starts at
+``fpstate + 112`` (and ``extended_size`` spans the entire allocation from
+``fpstate``).
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
index d0d9b331d3a1..d85226c67e19 100644
--- a/arch/x86/include/uapi/asm/sigcontext.h
+++ b/arch/x86/include/uapi/asm/sigcontext.h
@@ -34,6 +34,20 @@
  * fpstate+extended_size-FP_XSTATE_MAGIC2_SIZE address) is set to
  * FP_XSTATE_MAGIC2 so that you can sanity check your size calculations.)
  *
+ * The xstate_size field indicates the actual size of the xstate context
+ * (including the 512-byte FXSAVE area and the 64-byte XSAVE header
+ * struct _header). This size is used in conjunction with the pointer to
+ * the xstate context to locate FP_XSTATE_MAGIC2. In 64-bit signal frames,
+ * the fpstate pointer points directly to the xstate context. In 32-bit
+ * signal frames (including 32-bit compat tasks on 64-bit kernels), the
+ * fpstate pointer points to a legacy 112-byte FPU environment
+ * (struct _fpstate_32) that precedes the xstate context, so the xstate
+ * context starts at fpstate + 112.
+ *
+ * This makes the signal frame self-describing and portable across machines
+ * with different xstate features. See Documentation/arch/x86/xstate.rst
+ * for details on signal frame portability and its architectural constraints.
+ *
  * This extended area typically grows with newer CPUs that have larger and
  * larger XSAVE areas.
  */
-- 
2.55.0.979.g7e5102b832-goog

