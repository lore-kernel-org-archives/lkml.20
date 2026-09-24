Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5AA3F076F;
	Thu, 24 Sep 2026 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277872; cv=none; b=JY3sa/igYhP9IKZeJ3yMwWqViwKtAwmX4xzLjPuQ/mJnkCketG4p+a3NOz7qSdYihLOhBDAS+jbxkhmxOXsd1uWQZmw22YdGOiuBY6nngJfSGyo+55sQBrdRgduTfASzZscNyrMDoCWb8u7Zfs1Dyp5jtMuPfWkq+CWRnZS4s0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277872; c=relaxed/simple;
	bh=XGDU4sPxGOicRFWUUe5dPqhIZOP+tY9auoyXPUyflUY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rpRHDEBcbGzOFdQJDpaaIZFxiviEL49oA2oTs9U3JiLKY404aAWwadLsALmcD5nKeYaqB3kDm99ydWOCoqrcNh65DYlxIXgTC+l8HNIvIFpcdIUOkJyw8iQ23/iisyWIi0gQmgiaNA/GzHTk/zoalnf6aElO75DxudGoEzqjk+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VK4JbV/T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A1qYr1Us; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VK4JbV/T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A1qYr1Us"
Date: Thu, 24 Sep 2026 19:24:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790277867;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E83MbgTT+njH+yPdmG2ct9F3eIf6Os6rJygUXrLc5xU=;
	b=VK4JbV/T1paHAewjxa77hc16ijboAI2Y1Z62H4mK40p2kfITg/AZ3VvPozzFeX+3n2sp32
	SRjkKVoN5YpqraKvof39nckFrafrbbm1r0myI/JiXMXthd+agvhzr9Z1bBCpzrM/YLMFLg
	vS0i2sXRB4GNilZcXz2rabA+AA0KwUSxWuHCgTIheO5MxTW0Gz7WcWv7IA6MlO472P8Vb6
	5qf1tfqU+f43wh3bQzOb5iU7mjaIz6OVQfEnwtMRuWuAhg6jqpZMtitmdi4F/pfAYcIvn4
	LWZG/6PKBGWqXDj+UIMVCB2tKj1PkSiG44QLbtu/gPvr4PdO4tCCl8jVPv39vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790277867;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E83MbgTT+njH+yPdmG2ct9F3eIf6Os6rJygUXrLc5xU=;
	b=A1qYr1UswJffG+iuV+q4p4oaZQB2ZOxp1sV3lauUv/QrKXSV3kXBG3kxzxUlS55GoU3Gxl
	ApQ8NCWYO5jSHRCQ==
From: "tip-bot2 for Jose A. Perez de Azpillaga" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/mm] x86/mm: Fix void/int conditional in pgd_clear()
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260923212731.19599-1-azpijr@gmail.com>
References: <20260923212731.19599-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179027786597.2819794.11702575723414712469.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/mm branch of tip:

Commit-ID:     4f8c177caac8ecdedeb95caa673214fc3f6a75cb
Gitweb:        https://git.kernel.org/tip/4f8c177caac8ecdedeb95caa673214fc3f6=
a75cb
Author:        Jose A. Perez de Azpillaga <azpijr@gmail.com>
AuthorDate:    Wed, 23 Sep 2026 23:27:25 +02:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Thu, 24 Sep 2026 12:19:01 -07:00

x86/mm: Fix void/int conditional in pgd_clear()

sparse building mm/ reports an error for every pgd_clear() caller:

  mm/pgtable-generic.c:30:9: error: incompatible types in conditional express=
ion (different base types):
  mm/pgtable-generic.c:30:9:    void
  mm/pgtable-generic.c:30:9:    int

pgtable_l5_enabled() ? native_pgd_clear(pgd) : 0 mixes a void function
call with an int constant. C11 6.5.15 requires the second and third
operands of a conditional expression to both have arithmetic type, both
have the same structure or union type, both have void type, or to be
compatible pointer types. void and int are none of those, so this is a
type error, not just a style issue. GCC accepts it as an extension, and
the result type is void, so there is no runtime effect today.

The macro only exists when the p4d level is not folded, that is, when
CONFIG_PGTABLE_LEVELS > 4; with a folded p4d, asm-generic/pgtable-nop4d.h
defines pgd_clear() as a no-op.

All callers use pgd_clear() as a statement (mm/memory.c and friends), so
use the do { } while (0) form, matching the paravirt definition in
asm/paravirt.h.

Found by running sparse 0.6.5-rc1 over mm/. No functional change.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Link: https://patch.msgid.link/20260923212731.19599-1-azpijr@gmail.com
---
 arch/x86/include/asm/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d5f4917..153cb62 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -66,7 +66,11 @@ extern pmdval_t early_pmd_flags;
=20
 #ifndef __PAGETABLE_P4D_FOLDED
 #define set_pgd(pgdp, pgd)		native_set_pgd(pgdp, pgd)
-#define pgd_clear(pgd)			(pgtable_l5_enabled() ? native_pgd_clear(pgd) : 0)
+#define pgd_clear(pgdp)			\
+do {					\
+	if (pgtable_l5_enabled())	\
+		native_pgd_clear(pgdp);	\
+} while (0)
 #endif
=20
 #ifndef set_p4d
