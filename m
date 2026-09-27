Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A88C3B6C0C;
	Sun, 27 Sep 2026 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790550387; cv=none; b=iGn89DQ59bmZqiXh5WT6v/tksieLCeUCt4Xf5eCh4xeN0wi3+MjpWIMIT1ABEz+RvZz50cGFvgdTP8e0I5vqP+JO4RfELyDcdJU/XAzzctmpqnnyDP7KLIhf8BPF8Jz6Yth3Bs8LmLBznoFa6n1jRN6qvdnO8VuSj9aiP/fWYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790550387; c=relaxed/simple;
	bh=sbWEO3tCfIIZAeFxVODMNPro7RKgKx0L0O7xOufHVJI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rXswu8Cw0k41a7mcRw0oMWnQ7VTK1G0w0iKyKJQKp6n3efHh+fjphI9FZNU+XjW22TGYw8HjArj1gzi8YJHh5XArHdjyMcuYSl2e7KRbcAO5Vf2jXgUhjxjbQoj93qQ8fQqccf6fLt+Ex6rFfXbG7kUZNbv6v2B7rlcs6xPsiqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CmTmlMMN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hfVbm+Gp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CmTmlMMN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hfVbm+Gp"
Date: Sun, 27 Sep 2026 23:06:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790550376;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tu83UTVyoMud/HdL8ZOtTlk3Ss+xiFiQxSNdzm3tIN8=;
	b=CmTmlMMNZEAQSVkHQ4CO7dQ15IJ7AgCBtvLsedJV72S0M+sgRCKP3bWGlppZ3RFMry0nlI
	38Ke9w0LIRKdI94Bq37qwUd+q7VK0k2K8keqGQrxPm7sSkPnF8WmLl9VYqtSt001QoFXK9
	8BJ8BlI6TVhp9ecyPJC/aPDNRmPPblfP0xuEPWjDTeGPdMXMl7GR5VP0IwntIzEVhTd8px
	kfzNXzPxkLtA0fbVxCh+/o/L/ITGkixOn4DEE7QvV0FAFKBrzbRK0oFy+ZI7zEw3bpqSBP
	OMsPoXGWJB08rKFAJpdsbYLsOEc7Y4FfJ5gM7YY4Uwpdf6jqggsGck72jSLdgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790550376;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tu83UTVyoMud/HdL8ZOtTlk3Ss+xiFiQxSNdzm3tIN8=;
	b=hfVbm+GpRSPQEQyFb4inqhNcSDF8/F13DnI88y/2KSSQj+HqmzxAW/rw0weitH4JxSOAOt
	HKBKQ7d1RoCWvkAA==
From: "tip-bot2 for Christophe JAILLET" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cleanups] x86/cpu: Constify struct x86_cpu_id
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3Cf08d3a0e7aefe3bad66251927cbd03b8cbf9df73=2E1786311?=
 =?utf-8?q?119=2Egit=2Echristophe=2Ejaillet=40wanadoo=2Efr=3E?=
References: =?utf-8?q?=3Cf08d3a0e7aefe3bad66251927cbd03b8cbf9df73=2E17863111?=
 =?utf-8?q?19=2Egit=2Echristophe=2Ejaillet=40wanadoo=2Efr=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179055037498.3910103.12743835080284440637.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     c7243accb48a7987b2e80751f712c3f4fe2b3714
Gitweb:        https://git.kernel.org/tip/c7243accb48a7987b2e80751f712c3f4fe2=
b3714
Author:        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
AuthorDate:    Sun, 09 Aug 2026 23:32:25 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 27 Sep 2026 15:50:03 -07:00

x86/cpu: Constify struct x86_cpu_id

'struct x86_cpu_id' is not modified in this compilation unit.

Constifying this structure moves some data to a read-only section, so
increases overall security.

It is only used in cpu_has_old_microcode() which is an __init function.  So,
using __initconst is safe and will save about 6 kB of memory at runtime.

On a x86_64, with allmodconfig:

   text	   data	    bss	    dec	    hex	filename
  55725	  28774	    512	  85011	  14c13	arch/x86/kernel/cpu/common.o.before
  61464	  22918	    512	  84894	  14b9e	arch/x86/kernel/cpu/common.o.after

  [ bp: Massage commit message. ]

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/f08d3a0e7aefe3bad66251927cbd03b8cbf9df73.17863=
11119.git.christophe.jaillet@wanadoo.fr
---
 arch/x86/kernel/cpu/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index c735282..593ca8c 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1427,7 +1427,7 @@ static bool __init vulnerable_to_its(u64 x86_arch_cap_m=
sr)
 	return false;
 }
=20
-static struct x86_cpu_id cpu_latest_microcode[] =3D {
+static const struct x86_cpu_id cpu_latest_microcode[] __initconst =3D {
 #include "microcode/intel-ucode-defs.h"
 	{}
 };
