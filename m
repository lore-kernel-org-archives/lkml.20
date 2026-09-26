Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6782EEE8C;
	Sat, 26 Sep 2026 01:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385173; cv=none; b=K0rLU3yCH/KJZNG8i/7oYVRPgeonf0I8U1CsCQcSxfP6zLb4b039jIOHtM8osKquJV3+QxDANTAkBBnZKEEJ8vqsKZV44312kn1tBhK65WZx2ePRCJxacHFP3ynrsPsOgJuBgzc9H+JL5O9S+VapeGVe3VVZrdoACD1ROVXl3lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385173; c=relaxed/simple;
	bh=NMyKbTfTIfyMweZNbWnGU3lx2888LwOqO3NGkhxVoOo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=eZ7Alapk9obqk0jbB+FdS2e4Oj8UA64qDAue3wlG4sn+dNJCQTUItmIlCxg5P5TItp4BKt2+oxYJqn9cZaKuFHwIIjDEAKa9sN7+3uZaOgLINrCMXAQ+VgqT0ZxmF7NH3FLrifvcTpwTjipaXaPRmjE+K2T/5YJ3nQG9thNGBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jzJoKJkj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iJynCekU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jzJoKJkj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iJynCekU"
Date: Sat, 26 Sep 2026 01:12:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385168;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6c+DcA04dSBZTjaphX+TPNB27ufiFwx1mNmj3GOpNe8=;
	b=jzJoKJkj6hSPXhSF7GaWPBqDGnu0r3nwO+6+10CvL0UG3WCtoZ6gsz7fqCcNrfHN4OdpMJ
	rN4rs6aOY8DpEuSxNi1zy2M/94skUCn2XQ977Tjl9C2efLYmt8X77SRz61d0Cmn8gcBF2h
	Nr5F2ayLqIwvQd1Vax48df/rUKOsljpcH/MBT9de2OiPPxh4vKRs0xkXEskahEc/ViCstO
	x2sfWCHnD2ylZxDdBV9iM79iyG38kWoWSvxAjwGrGK9r6vtZg09jjjx74m8y1KRCaAssEe
	bvBt1ks1JsoMiW+f0dHcWm939+fF8Osgp6+89wd5BlFNB9dLl1nt2GhBEs+dTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385168;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6c+DcA04dSBZTjaphX+TPNB27ufiFwx1mNmj3GOpNe8=;
	b=iJynCekUcEH9oD/Lj1yRXGAMIQSC5TJqlaXaIj3ULEI5J4D7VNWvFmtXOf2PZcT3u+cAtB
	ddIPQ/l8D8GwZlCg==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Document signal frame layout and portability
Cc: Andrei Vagin <avagin@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-2-avagin@google.com>
References: <20260925162454.1403405-2-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038516636.3910103.13409435937135117942.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     3d69596c684bb943ff2f74c13635bb11c3c75e86
Gitweb:        https://git.kernel.org/tip/3d69596c684bb943ff2f74c13635bb11c3c=
75e86
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:47=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:08:45 -07:00

x86/fpu: Document signal frame layout and portability

The x86 signal frame is designed to be self-describing, with the
'xstate_size' field in the software-reserved bytes indicating the actual
size of the context. This design is required for portability, allowing a
signal frame created on a system with a specific set of xstate features
to be restored on a machine with a different (larger) set of features.

Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Link: https://patch.msgid.link/20260925162454.1403405-2-avagin@google.com
---
 Documentation/arch/x86/xstate.rst      | 54 +++++++++++++++++++++++++-
 arch/x86/include/uapi/asm/sigcontext.h | 15 +++++++-
 2 files changed, 69 insertions(+)

diff --git a/Documentation/arch/x86/xstate.rst b/Documentation/arch/x86/xstat=
e.rst
index cec05ac..e2944f7 100644
--- a/Documentation/arch/x86/xstate.rst
+++ b/Documentation/arch/x86/xstate.rst
@@ -172,3 +172,57 @@ are extended to control the guest permission:
=20
 Note that some VMMs may have already established a set of supported state
 components. These options are not presumed to support any particular VMM.
+
+Signal Frame Layout and Portability
+-----------------------------------
+
+The signal frame is designed to be self-describing and portable. This is
+especially important for checkpoint/restore tools like CRIU, which may resto=
re
+a process on a different host than where it was checkpointed. A signal frame
+created on a machine with fewer CPU features can be successfully restored on=
 a
+machine with more CPU features, but not vice-versa.
+
+Signal Frame Software Reserved Bytes
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+On CPUs supporting XSAVE, bytes 464..511 in the 512-byte FXSAVE/FXRSTOR frame
+are reserved for software use and contain ``struct _fpx_sw_bytes`` (defined =
in
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
+context to locate the ``FP_XSTATE_MAGIC2`` (``0x46505845U``) marker right af=
ter
+the xstate context (at ``xstate_context + xstate_size``). In 64-bit signal f=
rames,
+the ``fpstate`` pointer points directly to the xstate context. In 32-bit sig=
nal
+frames (including 32-bit compat tasks on 64-bit kernels), the ``fpstate``
+pointer points to ``struct _fpstate_32``, which contains the 112-byte legacy
+FPU state followed by the 512-byte FXSR state (and any extended xstate). Sin=
ce
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
diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/a=
sm/sigcontext.h
index d0d9b33..cff0140 100644
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
