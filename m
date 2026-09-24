Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D54DA9A6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283694; cv=none; b=ZhoFGh+s5sY+X3P4aj5fSV18iKUGzcMBVYIzjuj+6kgXrorFmoFITfba50uUjvjbcjzWhHeq2q+wNyqeIfOUr2RbpXEGxARYfY4jq50SkPYvmeM1E8UXRdMTwdnwYLgN1czo8iDEU3KpJM9sS5jJ7JYLeRCcEm2HRsGKI8H3GtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283694; c=relaxed/simple;
	bh=eWdNXYkzpEGoLypYsfkXKKnEba4CgKEPV8FCoFIGb5o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fhZjHGjB9ndsHisHtZqJStUy4SCJ6GoTa1FpXhwp9PDXxdQI9e2xzVOzARrb7HvuO4g4VWHaLYhZZR7sJH4PL3raWtSZWpiGcwez3G0OTzi6CXV5vl037WjUuKU6lCNw9Nuw+wd5AOhj/0WffwsPt56VrlHzh2mmruNg87htJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ncMPk2z5; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ncMPk2z5"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso350155b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283690; x=1790888490; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwQiHsyrLWUzsxzNSVYlkwXiHkF2i4EcK7GZMOAbO5Y=;
        b=ncMPk2z5Tode78c6tfWQYJLqBiIliNfKsfN676GUv1WtQ5abKsygzx1Gw1OPLGMO0r
         3z4N3e5Q3a12fLk2NNGMJACOdu+mtTrOZ5FGCjnPX7F1U12VaKzJrcUtfxVyuLgBCUSO
         caVCLWkgR12ircKHw3WAi6493vREg4cggoo++jGKzfmnXoojRaq3tnNI3TdGH1ggi0BI
         r6XpgqQ9LkmG+jqKFfI5TFYakdUR5ZMs65528wQwjI2JH/4LSR9zkEok1NkaF6dji6Dt
         +I60RjnU9ZlDUaHLHBNp0jXQErwJj3He/TbWza8a21PAqYvgLlqE3bxByxQ1x5aLtz5v
         FjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283690; x=1790888490;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwQiHsyrLWUzsxzNSVYlkwXiHkF2i4EcK7GZMOAbO5Y=;
        b=tLIuirs+5YQYX+ooubZWVKJlZ8/d8a84A0Ugw11+YTUhEsye/n1OqFHjNzPrVZCjEw
         BX3vfAvPQ2qQb0cfSG2gZMtf+4C0mm3F1WRc1XjyNowBmMdk9AFV/+VKmUHa10FZtyJP
         /9TczvQ7NzoCDjV2qMgYpWKInjeYDBWLv0IigwjSQGdnMagDYY/d1E4Qg5I8xl7f/wQb
         pAH5xg+HzrsQqPM2mIbt8wkha8eqaPuPKyfI6GKXhcX7ZSoJ4P6oDB82/QRnpzwP2BXh
         QdNSr4Vz8OnWSW1RI9t3fFmzQqaRFr6J+dM0Id4GhGhF9ucvO099Gy+wbJ7fhX2TPNYu
         Spkg==
X-Gm-Message-State: AFuF++nTbKVoiR2bhLenh/kwOhE2uVeNARZgJgTolmJgcd9KJLESp0f9
	0o5NRfphLSI4onssgFbmBeM8z1DmlYRY+V/xKftxW1C0FzkqnuDvBQE6aoHbRHiS6xC+zfA7s1h
	tLjO7/A==
X-Received: from iobdo19.prod.google.com ([2002:a05:6602:4613:b0:9c3:8c1f:2a18])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:10c7:b0:4d6:48c4:a819
 with SMTP id 5614622812f47-4d72cb41616mr3405681b6e.29.1790283689932; Thu, 24
 Sep 2026 14:01:29 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:19 +0000
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-6-avagin@google.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

