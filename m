Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC636F906
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842078; cv=none; b=olaGSsazPZ39oxIOi9kN+G3FEuN23uVvjDBMDFX0OIzgLhVKa++KgsUjFTeDC5nHU/tR4/vkLAlj9eyBA6V6hVtoJDJXjU+jxA2aSs+Zm9vx3moPIxQ1Bh2ASFCZo2zcSVGr1ezJMGc75UqO2Z2TSYjHgpm/FL1s+CNX955PotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842078; c=relaxed/simple;
	bh=Yzbz5KsjH5VLNThiyWRSB/Nuu62H2W9/vrT//XuTC8w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J4JNt5yoA+WBwA0r9jLXLqTwmSlzSFasiBJLiFIDPwt9/wwPRPAUP1Vwy4JQtFoMvwf0mXdz9t73Ie/INeDIMeShaBjYBldP98kNkn+ZvVzK8N7VACznuw+lrNrEdS2jWMs00z0tv10ej2Jp4Yamth/LgB06/CJdZA8H3jbX8nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I0XERpU7; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I0XERpU7"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b1bc2e44e0so4965503b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788842075; x=1789446875; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TNNxc4M/PskCbQkTRvLFwOXh+gojv+fbauKLe1Eeeg=;
        b=I0XERpU7qxDu8Tu+/ahJ8Bp9YUUgPzrSaebN8pYJkC3Gws4DUnQZOuT7QD+nzOWooa
         job0UfZLToohvIUxs5ooA2WNNLz1u4zr0OvUOBBDl2yqN5Raluiw/fBbaFnGmVGmke3x
         ZJvjGKSPr332TrriF8bumLgOOsZM8yyuWoGVOF59ow9CdfoQGcMb7f4K65CSqYSvJnuN
         Z61DP0v5vBn2tOn3eUE5Zo7n2u7Du1a3pK8/tgZGhwkHwC4/rJZajanXkrKfjpI4O7lW
         LUEUHjuCurGOkDwl/+rj/N7eZF8V/yhC5WT3XdOzHtw+6bUwDUbcUrSXRHDMYRoqGq9d
         TQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842075; x=1789446875;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TNNxc4M/PskCbQkTRvLFwOXh+gojv+fbauKLe1Eeeg=;
        b=rW5uqoyNx9I4dWzArVRmitxYSmdxWpOV9PtzkBwaX0jZWU9R6ZqZ/PRtEd9jv8Cr15
         9aKDjDA+oiNg3Qm/MkK7csgbOhE8oswlMtntL8u4me/CSmgx4OQsJ+k5JSwtEGhBsS4k
         2Cv7TrnkoihVCV7xiTBtXLedGS4+Q/TcL/MoZyX75EjregIg5pxxef7KT6yE5n0cRC65
         bIr37U2spsn8ecslbOjFm6vxVtCvWcarMhbc1jArC0o4JO0CvUjlyPttkzrouv2T92t1
         h3ttMVETNzbSZOrTUfMPM0MLRyLOlcH4rSPM1gJS6DGTtH6AtWWUvOYU2QH0QMaoqK80
         qWpg==
X-Gm-Message-State: AFuF++lF6oYnfnTjOS1hRodtCQE3BchHxqBgtKN1HTayGBvmb33qUrMk
	ODZ/AHo3r5V1AjUM7rckjhbvEzbqR+V0ya+kMqu3zYxpd3WAfZoN4q54/SABlOw9Bg130jGSklq
	4JtPacA==
X-Received: from iobih9.prod.google.com ([2002:a05:6602:6b09:b0:9a8:51c0:4784])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:a28c:20b0:6ba:2927:3661
 with SMTP id 006d021491bc7-6ba29273f2fmr7920635eaf.18.1788842074915; Mon, 07
 Sep 2026 21:34:34 -0700 (PDT)
Date: Tue,  8 Sep 2026 04:34:25 +0000
In-Reply-To: <20260908043427.1842515-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908043427.1842515-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908043427.1842515-6-avagin@google.com>
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
index a7b6524a9dea..fe0a29f599d2 100644
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
2.55.0.979.g7e5102b832-goog

