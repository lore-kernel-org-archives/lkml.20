Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1E3AD529;
	Thu, 10 Sep 2026 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063226; cv=none; b=py8/mfD5NVRb31NvvCRNiglMmHYC179DfBtNel8bvz1dwBFRKKCwmnbNn+Pgeekjb810iw68NAOFNkqFUYebaJkJNJyqJnN6Bzju0nu8ZBvq93P2ia5SulQIT2rzLvQzAMjGcSuAj641Mfxg1Q37nP5T2vby/gTJHjL0978lgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063226; c=relaxed/simple;
	bh=PTuor0aBxcQXT7iWTuuawTSFwX070gg0qGMwIPaQJoI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=cx1ipR/SjFGdA3xGgpjaJUKxpNPdVY4BxMXgwknuOTdof96OTYwXJZZPHJJOYe5W8JUzRV7YR2irYgJ8ZIXSmQjlMl5is0fGFp9858VDcAn4usWcRER9I7aczl55qxevtXP5/lXKAXu4tKC+N70DdXKzf3+k4aoEN2I2INZ1/c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VFWUFq/C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jZrXZm8W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VFWUFq/C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jZrXZm8W"
Date: Thu, 10 Sep 2026 18:00:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789063221;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JzF1nPf7AsVOy2fuFnGSRgZdX8jFtMs/1vDi3QO6NQ=;
	b=VFWUFq/C2wztUwmxWQopngaurinKUYavuL1DNs9L8KsYw0CFnG5MjUPoO8xvj5bBPK1NCM
	3vSfpY1NVol1TD8nKEgEads9LdhNsiW2WNS2vaXSySL/g9A8YoyE0VtADrETxHJYTPz5jP
	cWdRFRrpXGteXkr0pNSKsgrJ42y8oCRGjRRMbq/bd4WEhwibXQH9Q3spTrZD0aQwV9AF3e
	0CW/kt4IfQneuYTsiFOSS8Nsi4PTgSO+HGXX+bprutXzOMxxSQ+LhiSvV7Kg34cJlphIXe
	FtWPi87WoHLszGsvIvvcczG9F4EamgKSCYAa8O8VNCtlUcly12ru2AyG6uvoLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789063221;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JzF1nPf7AsVOy2fuFnGSRgZdX8jFtMs/1vDi3QO6NQ=;
	b=jZrXZm8WZga/yXhAyDIlimCNOCJ1ebf413u9Na8Qhvi4HHCWYdtL99eZqYaElvJx7davwK
	ZsIJBbVyb1CBiwDQ==
From: "tip-bot2 for David Laight" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/div64: Fix addition of large constants in
 mul_u64_add_u64_div_u64()
Cc: David Laight <david.laight.linux@gmail.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803094702.3852-2-david.laight.linux@gmail.com>
References: <20260803094702.3852-2-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178906321863.623050.13970846088171673609.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     f65d38155aef069c897a64643a03db237dd1e0c8
Gitweb:        https://git.kernel.org/tip/f65d38155aef069c897a64643a03db237dd=
1e0c8
Author:        David Laight <david.laight.linux@gmail.com>
AuthorDate:    Mon, 03 Aug 2026 10:47:01 +01:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 10 Sep 2026 10:40:22 -07:00

x86/div64: Fix addition of large constants in mul_u64_add_u64_div_u64()

Adding constants over 2^31 fails to compile because the ADD instruction only
supports 32bit signed immediates.

Replace the "irm" constraint with "erm" so that the compiler loads large
constants into a register.

Found by a patch to drivers/iio/frequency/ad9910.c

  [ bp: Massage commit message. ]

Fixes: 6480241f31f5 ("lib: add mul_u64_add_u64_div_u64() and mul_u64_u64_div_=
u64_roundup()")
Signed-off-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: H. Peter Anvin <hpa@zytor.com>
Link: https://patch.msgid.link/20260803094702.3852-2-david.laight.linux@gmail=
.com
---
 arch/x86/include/asm/div64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
index 30fd06e..8a2d343 100644
--- a/arch/x86/include/asm/div64.h
+++ b/arch/x86/include/asm/div64.h
@@ -111,7 +111,7 @@ static inline u64 mul_u64_add_u64_div_u64(u64 rax, u64 mu=
l, u64 add, u64 div)
=20
 	if (!statically_true(!add))
 		asm ("addq %[add], %[lo]; adcq $0, %[hi]" :
-			[lo] "+r" (rax), [hi] "+r" (rdx) : [add] "irm" (add));
+			[lo] "+r" (rax), [hi] "+r" (rdx) : [add] "erm" (add));
=20
 	asm ("divq %[div]" : "+a" (rax), "+d" (rdx) : [div] "rm" (div));
=20
