Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2F4E06D2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353506; cv=none; b=rZzxpyE5EfmIF7fF/jc+Zl0yVI3a51zNCVkCHG6JaXLFXDUY0/Z5OYIAQXngnSoq8sNR9JLOGLxm82iIR3jNDIKDYvWEA6BzSK4gMfl0DvDXUYZhySpvGUphQESjgul2wVx97c/MlGqPcoItXABq4YU4jmzx3zjnIFAR4JVnSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353506; c=relaxed/simple;
	bh=D0xYUozz0eKaRjqfdaOEvfYWvBHmjoShCH+XjEeHxWg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WDK45297OsPwXBGtBuwoDmgNmvB77NtopR6TCCakOYi4gqkr2pft1Zl022qQaAmchhki3/eM6AowZLcE5V3HwKaYxg06fR7+27028jGOH8HLq5Xfb2RTtdkJQHhTLaEHFbveu+XcCxFSXwKqtyiJZMyWhrVLEwH2bgMZWBb0A3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TlrsXBd1; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TlrsXBd1"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2f2b8d88fso1916359b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353503; x=1790958303; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVFocSfR4Lgc319cRBvL1V/1tH2jGEIsWXRjOMDStP4=;
        b=TlrsXBd1o8+h/Ywxy9hNUMsULlISTcb2ORpRSSGlgw5VgHiPIe94FK45yMkdP7K2Mn
         1uuY6rFJUKlLQePNBaCnbzUU6Q8A0SUuPbtnAtMivEiCMwgMS9fXxhSGakug2E6Dq+/p
         99RSABP/UgCcu0ScVPezUV7MdsEqaBRuyi179ffd9RJsw0fLu3/hhwqLx/pNpSxCFAHK
         3z77NFtjchZYEPYTOjT9apSt2GFmsaBAhzCt+/IKBeJkCRcXe/OChJZve4ES9CWWA76H
         DtZoBTC87wgL+V1J2dIXpLNXtTwRIs3dr2cvwyTfNUIMN1cGiW8Kq+U8ZW1q62fWiN3S
         2fzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353503; x=1790958303;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVFocSfR4Lgc319cRBvL1V/1tH2jGEIsWXRjOMDStP4=;
        b=zi3WGBVCACElG5mnBr0Qa0vGNVO99CxdqvmFRznrp3eZsVsFtVh38l0klbnH8FKQDP
         tfQ06riRNVmnxi4qBWr9Oc3+nl0EVdKDsXXDcIKtWRZzF9iwRlsnlM1Yvq/phqLn7r3j
         JqlPyX81a7ZAwrUwAjSiWwD9RY8bMyUAiL8pDySyf93dHqlcquW+KvMYFJfRiDMnN7Bc
         jfuNJSxusPuv8BtcIRF2hKQ6w+ouKUD9QdWUBydHaiSdMQ7MYTBcsHm9DLXYbb8yiwzo
         5segIOWwwMJEFE7NJq0evE4T4vTLy8egMmjTvmdruGZrasqdE1v+owWJsLYJukerXmR8
         brXg==
X-Gm-Message-State: AFuF++mloCAquc7zc4TXkCrU1foJJgLfaoCXhYp9K9pgwQgTRpnP9t8s
	y6qcb6g17DVwkTC4EdTWmqPsE9raJdFBhNHV1Zc7GooScPKeXT8XJp+wHPsQaeVCHzHbzP6mSjR
	9Gmte+g==
X-Received: from ioed30.prod.google.com ([2002:a05:6602:281e:b0:9c0:11e6:874e])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:3a09:b0:4cb:818f:d572
 with SMTP id 5614622812f47-4d72962202dmr7031617b6e.26.1790353502872; Fri, 25
 Sep 2026 09:25:02 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:51 +0000
In-Reply-To: <20260925162454.1403405-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925162454.1403405-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-6-avagin@google.com>
Subject: [PATCH 5/7] x86/fpu: Fix potential underflow in xstate_calculate_size()
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
index 97cfd4fb6cc0..efa7879d2f97 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -589,12 +589,13 @@ static bool __init check_xstate_against_struct(int nr)
 
 static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
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
2.56.0.rc1.315.gc6ed9934b7-goog

