Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BF54E56CA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601008; cv=none; b=frCHo1yCbvjZJzV+qju4L32uJ9OZFeU1/wy12BOVstpQYUWFkrferw4AOi6IB1IvHh7hlvShhnyxlisieerXKcVt7fpvx4800itkjQpWLt9e+jKVi8dD+QdhcpYoCLBh67c7Q87CXLbJjMhy14+W4kUlpCG+KxZbbG6ImJeurEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601008; c=relaxed/simple;
	bh=FnVCxfJ6AJJ+Urfzm5Th794i/GZyUKsidJkmO59nFqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xi/bFEipYk+t5nYI3oYlz6IkbgQkCLXRG5sZ7qcomVL1lY+JDimLCQR1bnHCwlfPfszUP3qRMTreKT6CYT00RDRDuU3OrHGdU1OeHFI9e2rWhMBHnt8Jqt9tgIDkBHCejQ2NCrJgkfGPcGR/2lazqUIj3HKJfR9sSytIQmeawKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MOYuL7pN; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MOYuL7pN"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbc77da654so120731b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601005; x=1790205805; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzKowJpenJDD2vnwNvQsJP6Hsd/QTiS0cw1NoTxC6s8=;
        b=MOYuL7pN6s6fyGmQrx2WmUk5U5CLY5+8+wsUqrmNW3PCs/JlEHvjmyOOmH/aW9BnOT
         2FB9D4YNElfcvYr90jZBmpgmlx+E/+SVt4j2JWxjWRQctttRPcGFADx26rRl+lRQL1oC
         A2BmcgeTk/dH/L3SSKhBcsOBI90IHSiadtyoFkY3oVN7nP3tO/F8tcjr8jM7Afl+O0pI
         Nhws8pFuZv6RqJO88SEmyAk84mgRCogdKGM/+OEBRWLgNUDmm72BOZoekLr08UWMC4RZ
         Sx9sQe23So4CS0oOs5UyNqKZNGOzAN1bMh6zlawk2RfLDCxvCkjJrKdF9mdxMJSCkCCN
         ZWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601005; x=1790205805;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzKowJpenJDD2vnwNvQsJP6Hsd/QTiS0cw1NoTxC6s8=;
        b=BigWpQ6MTU2L/rxN/i6AJ5z5IrHSlHEorz8fN8G5ufIihM3nuRIxuhrMJBzOAAu00E
         QuxrBzwaiN4w7sFdPMpkypC5b3+IWH/tAIRUJAox0WI9AQGr1lc5FC3Hl7Yb04sqWVpC
         +DryK02kzTu1R3JAR+9l1nvd5pmrjzkkYAzeNBgOK60i4pIOYmr2O5ptOBBZ6XA02bxu
         vP2CebnTHez/vFFSZI9E2PtiiDTuvNt5KrX/YPEpHi+rCIltdUH+Cfs7/4GizMWDwhUL
         NLLYKL1QlISgi1Dtkhc3pOT59oe2R0L21W2FffYfsfZnRSK9hRSDrc6MMvacNqeLOIK0
         acYw==
X-Gm-Message-State: AFuF++lchYQ/T/5DpD0GjfTQZHH9orh4XgQ9CuO2N4gG2iQ/lybQP4uu
	2rKeVeLpsWec9rbsh3He5dqRDPwz780Aa+DQXEQo1nfY0CThJrxVPH3B4mdN+rPPKAd7BdXhykk
	tyQ7Ujg==
X-Received: from iocrb2-n2.prod.google.com ([2002:a05:6602:a582:20b0:9c3:e4c4:13e1])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4fca:b0:4b9:a829:f00e
 with SMTP id 5614622812f47-4ca4bc74200mr5323830b6e.26.1789601004909; Wed, 16
 Sep 2026 16:23:24 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:08 +0000
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-6-avagin@google.com>
Subject: [PATCH 5/7] x86/fpu: Fix potential underflow in xstate_calculate_size()
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

xstate_calculate_size() calculates the size required for a given set of
xfeatures. It determines the topmost feature by finding the most
significant bit in xfeatures using fls64(xfeatures) - 1.

If xfeatures is 0, fls64(0) returns 0, and topmost becomes -1.
Previously, topmost was unsigned int, so -1 underflowed to UINT_MAX.
This caused the subsequent check `topmost <= XFEATURE_SSE` to fail, and
the code proceeded to access xstate arrays using topmost (UINT_MAX) as
an index, leading to an out-of-bounds access.

Fix this by checking if xfeatures only contains legacy features (FP/SSE)
or is empty (!(xfeatures & ~XFEATURE_MASK_FPSSE)) before calculating
topmost.

Fixes: d6d6d50f1e80 ("x86/fpu/xstate: Consolidate size calculations")
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/x86/kernel/fpu/xstate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 3e7f5fb5bfaf..362df13a88cf 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -589,12 +589,13 @@ static bool __init check_xstate_against_struct(int nr)
 
 unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
-	unsigned int topmost = fls64(xfeatures) -  1;
-	unsigned int offset, i;
+	unsigned int topmost, offset, i;
 
-	if (topmost <= XFEATURE_SSE)
+	if (!(xfeatures & ~XFEATURE_MASK_FPSSE))
 		return sizeof(struct xregs_state);
 
+	topmost = fls64(xfeatures) -  1;
+
 	if (compacted) {
 		offset = xfeature_get_offset(xfeatures, topmost);
 	} else {
-- 
2.55.0.1082.g2b9226bbc0-goog

