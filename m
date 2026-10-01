Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449193D300F;
	Thu,  1 Oct 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856501; cv=none; b=RwdZvIG/B1WG4cLkqsqx7YilBDP4JNQHcEgnugWtEaNSGm2FocvGr7OYzkNTcTZM5Z7qwMMCQ723WrFFzxEfyKdbx7E9NFA8KLao2pkgdamG68PPEIa1px4ZTRefG+8ZiHVPLN8gNkYwr8Bg1+QVLUdFVmJnZbmTELgdmCsOoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856501; c=relaxed/simple;
	bh=NxAG3E+5i2MTnKtF8Xprl15RHqzZLg03XMuL48fowLw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iesKJ07Kf0kuV8GJbrI2oIVETo6N46cIxj0RfP6Llntk8IN0RCwsEit7NNwHoJgDWvgZ/29LRUnS0wAkc/qjyWLmi2EQfLppPwxzGO6PyQE+rg1sW847MTRy0AMjsjlLbhWho1CFtrx163j8Pu+nNmObLnrwblwBLxvnFdMQxmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3CrtoXI6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tB++LZT8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3CrtoXI6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tB++LZT8"
Date: Thu, 01 Oct 2026 12:08:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790856486;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrjC85FMIMBVnksWH0143c98t8Y54CyDrwAGrXC0VWc=;
	b=3CrtoXI6u7LdTHn+AmAhoG0HidfXhoQg2ZBu2Tdk/dPTYEOY5+j2tZBAswzuKO6f5E3HZC
	hXCkGIR76ZVuKXstGLfxRne7MFdB6/V+w2zo1BbWIM0Dn9tUAU9pMCn8tir97jkfPMa/De
	Fg9tFRq4aXqy2NefePQTprqib/r0+n9yteyWePZaU4y0fOTEt0ntELDFgEDDibqVKtQREZ
	glr8IOIDPXO960NBVVYtnGZFGQrg+0bXfv8glCnFYwAy8ADHt08K5LTwOSIuQ5y0qRE/Z4
	PlZaRXGrgsZY/9UL3k+5iJNXTJkQN5TXSxBMxTLMZFAdDF35+78uKx6QLG9J+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790856486;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrjC85FMIMBVnksWH0143c98t8Y54CyDrwAGrXC0VWc=;
	b=tB++LZT8Kpx9Z0MaptSL3Xm7hcyrUDKaSCJcC4z84g9qqFTLNQ+xrHBAld5UIrfMdj1aNG
	QpT3znb158IRKjCQ==
From: "tip-bot2 for Lance Yang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/mm] x86/mm: Fix spurious warning on __add_pages() failure
Cc: David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Lance Yang <lance.yang@linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001081555.35485-1-lance.yang@linux.dev>
References: <20261001081555.35485-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179085648422.3910103.13897070172924139485.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/mm branch of tip:

Commit-ID:     d92b5ac5aeba1ffc734576e30a5bca882722de76
Gitweb:        https://git.kernel.org/tip/d92b5ac5aeba1ffc734576e30a5bca88272=
2de76
Author:        Lance Yang <lance.yang@linux.dev>
AuthorDate:    Thu, 01 Oct 2026 16:15:55 +08:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Thu, 01 Oct 2026 05:04:44 -07:00

x86/mm: Fix spurious warning on __add_pages() failure

__add_pages() can fail if we run out of memory. Callers already handle
that. Do not WARN_ON_ONCE() just because an allocation failed.

Return the error instead, and only update the end-of-memory variables
after __add_pages() succeeds.

[ dhansen: imperative voice changelog fixups ]

Fixes: 10f22dde556d ("x86: arch/x86/mm/init_64.c printk fixes")
Reported-by: David Hildenbrand <david@kernel.org>
Suggested-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Muchun Song <muchun.song@linux.dev>
Link: https://lore.kernel.org/all/d4fac8af-fd71-47a2-bfe9-3c6559b92209@kernel=
.org/
Link: https://lore.kernel.org/all/203892F4-B04A-4F69-A1B3-DC1619176C67@linux.=
dev/
Link: https://patch.msgid.link/20261001081555.35485-1-lance.yang@linux.dev
---
 arch/x86/mm/init_64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e6821..8b6d86f 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -970,7 +970,8 @@ int add_pages(int nid, unsigned long start_pfn, unsigned =
long nr_pages,
 		return -ERANGE;
=20
 	ret =3D __add_pages(nid, start_pfn, nr_pages, params);
-	WARN_ON_ONCE(ret);
+	if (ret)
+		return ret;
=20
 	/*
 	 * Special case: add_pages() is called by memremap_pages() for adding device
