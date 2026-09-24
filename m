Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43303403E97
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223378; cv=none; b=iVn835doUHGKOVsFXg8a4S4VDOyR1TsR2vFXhMPI+dnSoeJ1FDIkqf01nyg0YaoogNOjbVat9ktYTGXAoO7klw7a1zJeuRF0GhNeq8U7ZGn3rhb76yaEuQ2ddoz9dnUxBr9y6nQOLSuLF5JpzGArkhnL1j3DCi756tnD4kfbZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223378; c=relaxed/simple;
	bh=GW++IQkN3swJonF+Ux3M4S61EH1JXfeg3xTVbZ1j010=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ph+33zhTvyVj1kGMdhU1wiATtALW9+MBb0B1lE2LgPKB8u8ECmFbIIdqrY47AjR5tAIHFUuqqq8uCebMn7A88GUoic4B+exERZvrwJRobbIkDymP6dsMYzDPHFRluk9Whn2dJ+JoXkvOBBtOKHonHUDB8oWlJkUfLrCtL+JIrUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NN9EqCVL; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NN9EqCVL"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c307941971so2581356b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223371; x=1790828171; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLDrAGg7xWWuICM8+UcK0lvwffhpOIQZdOjs40Fvj3s=;
        b=NN9EqCVLzfjeLgGrieIf2R0Z2ThHNMUFZ/EjArJGFMBHFUOW5eWXDLYh0eskE35bhR
         VVOfGkiBOFlf9NTSaW6U57naKQ4zaWK0N6mfQTPMYMsxzjZaUSHFAmG69SKa6U7rWllj
         HzZcLZizY8D669OuFGe3V92pcnKS/Sn4FC7pi7ElYqEinqPAOOLvzzv8VYDfk1gYS4T8
         FpKPMEvyMOGjJ6UPdrtxc6zVv/dubMhXfx2Tk3PHXIdZPoJ+17nGxBiwzlD7ccQT7G0c
         QCaLYDsvPFu+zU/27ebEqD1WtRplJx9GF5w1I//8Nt5fAyd3HCMXhXn2Hin2oqXKY5Zk
         zDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223371; x=1790828171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLDrAGg7xWWuICM8+UcK0lvwffhpOIQZdOjs40Fvj3s=;
        b=JnZa9cFscK8AexQEdoblZ15bumzGP+8c6ECQrSLaUSvweIGP8tho8AeQW8WH0Pb4DA
         3SXVp0jZLCuBPoiR8xs462nYcShaRjtgyoSKx+HUSBW/XGZZS3Aa9JmGDlQTybbu8VBU
         WFsLEXfh+fKH/rI09HkWW1J5QntZHjFpPLyHuaphlz+bIKyx7egogUV7luliqOZiyRIL
         yckq7RVMAZFigy5fOo/Uiolf1vqbywK3S92MHDds2IbGGvt9OE6e4pZvydCviytjR/+1
         vF6jjmzx1neguWlfGnPm7V1gSyMninyGeutcXZpxTgmmSAkwzQs5Zg9fDgrS5vP8X2zx
         fIRQ==
X-Gm-Message-State: AFuF++lcaBnQ92eSx4q6dTB3uILQkx3zNVqeLkz7/refhcW67tlXAFbC
	Xsr7SpRVA4AVVXx40lTTRtrSZOfn+kHkFjgPJqanjV9wOfcCYwoQauDIeTpYWqzXuEu1t8ttFqM
	iDEDXCg==
X-Received: from iofh3.prod.google.com ([2002:a05:6602:6fc3:b0:9c4:a4f8:640])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:250b:b0:4c4:a240:9c3a
 with SMTP id 5614622812f47-4d72c0429famr1389700b6e.4.1790223371033; Wed, 23
 Sep 2026 21:16:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:16:01 +0000
In-Reply-To: <20260924041604.3209659-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-6-avagin@google.com>
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
2.56.0.rc1.310.g51773c2048-goog

