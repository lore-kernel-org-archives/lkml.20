Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB353D5C31;
	Tue,  8 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900717; cv=none; b=mPGbX4En/3S9Lm539/AmENIIMhGYb8yJDqnCVamW+mPQyiHLppxmMLhoMOReqjYZ/hT+9Pv2RFTmbSQANSDCMcSlL8rf5++GgAZfHfjZNPoXjlR7joxZdJR0vp33Y9ZqsxyMDYzQ4rUEvzex0yfLF0EFDfPwjYrbj21eMxfPUPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900717; c=relaxed/simple;
	bh=mWUxgGcAdk+5W6rVWBSAdVwlg/N6Bc4tYVAA3Xs1hqw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=r4Rpgun0Cx8VylBf/laf7AL8JyeiqQPQ10ghtmgewm4nTOIRjosMTrZiDtT7QhpL44LEWJWx6Ts91he7dMidQRxbgJ1798AVqkydlv/xnOCJe1hWJjQLqwV06HWdCj84RDDYv2Ll0hDa96lwi21oT5zZqyoorVjz0zgp0buwLIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bfpEm21+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mGO8sbdk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bfpEm21+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mGO8sbdk"
Date: Tue, 08 Sep 2026 20:51:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900714;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVYCIXc8DLLjUqEpa380xVvWQnEY45j2/3BS8/74FrU=;
	b=bfpEm21+n/Twhn2GdA+nFN4/A9MBI9CPDUlxlk9IE8pqKJkWiybfm3cGBXdNKoTrapWO+g
	band1fHjnRuLL0M9IUzoaSUM0msXSVLNRIcuZKiNDSMXtpt9OInjNvx4iLLx1/lxGs/kST
	9sLzLp2GMVt/P6bm2P+hngB3si8KYJDnYcjzSa9OuHdP8PFL6pI8Djzjy548Me9xSUvhUu
	t4acKW4rOTloQysSCJcTQ5cWffrp6EtSlgfbUeY5jZa+1kv/+BerFv1Q2ICN2H22e50nXB
	PD9TsoHSfbZiKPFFYsBLUXehJG4gFrTKVoKmTIYPpjpIpXAEGXjbcAMbCnsttQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900714;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVYCIXc8DLLjUqEpa380xVvWQnEY45j2/3BS8/74FrU=;
	b=mGO8sbdkCNEG0lhxju4NjLDdDgFjtH2F01lZc1X/O/ZapMTKPmW8k08pZrPsKebc5ZsMzg
	feihCsMWZbbYeoCQ==
From: "tip-bot2 for Kan Liang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] x86/fpu/xstate: Add xsaves_nmi() helper
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-7-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-7-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890071233.623050.9494401351267927011.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     03b89c9f202ee75c9997a8421f0e09a5590c3878
Gitweb:        https://git.kernel.org/tip/03b89c9f202ee75c9997a8421f0e09a5590=
c3878
Author:        Kan Liang <kan.liang@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:14 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:41 +02:00

x86/fpu/xstate: Add xsaves_nmi() helper

Add xsaves_nmi() to save supported xsave states in NMI handler.

This function is similar to xsaves(), but should only be called within
the NMI handler. This function returns the actual register contents at
the moment the NMI occurs.

Currently the perf subsystem is the sole user of this helper. It uses
this function to snapshot SIMD (XMM/YMM/ZMM) and APX eGPRs registers
which would be added in subsequent patches.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-7-dapeng1.mi@linux.inte=
l.com
---
 arch/x86/include/asm/fpu/xstate.h |  1 +
 arch/x86/kernel/fpu/xstate.c      | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xst=
ate.h
index 7a7dc9d..38fa8ff 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -110,6 +110,7 @@ int xfeature_size(int xfeature_nr);
=20
 void xsaves(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
+void xsaves_nmi(struct xregs_state *xsave, u64 mask);
=20
 int xfd_enable_feature(u64 xfd_err);
=20
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index a7b6524..d39c015 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1474,6 +1474,29 @@ void xrstors(struct xregs_state *xstate, u64 mask)
 	WARN_ON_ONCE(err);
 }
=20
+/**
+ * xsaves_nmi - Save selected components to a kernel xstate buffer in NMI
+ * @xstate:	Pointer to the buffer
+ * @mask:	Feature mask to select the components to save
+ *
+ * This function is similar to xsaves(), but should only be called within
+ * the NMI handler. This function returns the actual register contents at
+ * the moment the NMI occurs.
+ *
+ * Currently, the perf subsystem is the sole user of this helper. It uses
+ * the function to snapshot SIMD (XMM/YMM/ZMM) and APX eGPRs registers.
+ */
+void xsaves_nmi(struct xregs_state *xstate, u64 mask)
+{
+	int err;
+
+	if (!in_nmi())
+		return;
+
+	XSTATE_OP(XSAVES, xstate, (u32)mask, (u32)(mask >> 32), err);
+	WARN_ON_ONCE(err);
+}
+
 #if IS_ENABLED(CONFIG_KVM)
 void fpstate_clear_xstate_component(struct fpstate *fpstate, unsigned int xf=
eature)
 {
