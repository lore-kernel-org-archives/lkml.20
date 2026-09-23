Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97637B015;
	Wed, 23 Sep 2026 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142755; cv=none; b=Ai2VSYTVgo++W3W2ZwpvmvnWQUOlwqRqmTmAnbCuN+iqOWQ8mYB4Q5PkBgOp5rBRFnpXTu8e4uEhj9T67WLbcbyqo2kru7lq/J3VAnCWd/47WYk4YT4t1DTRfq8HDuWXAmCwigSuAjzkAXpcLie8SsxcwyhBRzb5R33Ml3LSZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142755; c=relaxed/simple;
	bh=nrnuTHbvevyyZ3LXjNm8/Jtep3cMy041yp4PmSo+igc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MhfCrq9ErM6BdAGqPqmHK530gyfakHUPIHuXLOO1YjeeSJN5XRmRbSPVaZD/KWYP7OKYVYbk1nKcLqjFnaHj96R6b0m5Wtbn3TdoDj13/cu2YixHPnzT6g6cJ9niR6cJRw6OfaPYSJeFBpcACoam+mkni8fRkmqiWepnr5GEOw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eEzmR7mY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZJKI348v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eEzmR7mY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZJKI348v"
Date: Wed, 23 Sep 2026 05:52:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790142752;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HYFaeL1RrVdSrhd9DHgUvDsQ2IZXYOB026nCqYFc0B8=;
	b=eEzmR7mYxtv24yDiPDz83vVfYRHyB1gfyUEy8gg7R/RRyCXbBljxkVcgfgr9hCY9qoBKwu
	B6uXU2TK9s0bxkvjYOTrW5eh68RynPYCJhF8/t0FnaaWExH/ZwslNhHLj7mDv8IT682SHM
	i6XWwhg+wECLgLwl7evXTw0wtoci4yGVg5IiINRVDHqB1Qx8tgDJwZLjpuSLK80dJRrqG4
	rRH50DWwjAUMt426Og1sABl5IfETz83+lk8m8+KnOCOEEjyoE0I5zqlHmT9NEsiAqHjaGF
	2YPng+8SOB0wu+Yfqr1wsOJDnz0Aj9X/uiMDcjr3Aoq7VAiiPU7lV18lopAgDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790142752;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HYFaeL1RrVdSrhd9DHgUvDsQ2IZXYOB026nCqYFc0B8=;
	b=ZJKI348v02EPLb459GD7PWW8Egbhmpi1xRxm4KUxhjNzecpC8SXe51Wp9AKk/rCv7pd6gk
	u5b8Dk0xx09eZpDw==
From: "tip-bot2 for Mauricio Faria de Oliveira" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/asm: Group inline string functions
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-pvh-kasan-inline-v10-3-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-3-08da47943d8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179014275106.2819794.16652442087744393031.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     85f11c17b261772cddc4606f98f6c604aded4607
Gitweb:        https://git.kernel.org/tip/85f11c17b261772cddc4606f98f6c604ade=
d4607
Author:        Mauricio Faria de Oliveira <mfo@igalia.com>
AuthorDate:    Mon, 21 Sep 2026 22:36:34 -03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 22 Sep 2026 18:53:32 -07:00

x86/asm: Group inline string functions

Group the __inline string functions in the same header.

Use <asm/shared/string.h> since __inline_memcmp() must remain there for use
by arch/x86/boot/string.c.

No functional changes.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260921-pvh-kasan-inline-v10-3-08da47943d8e@i=
galia.com
---
 arch/x86/include/asm/shared/string.h | 21 +++++++++++++++++++++
 arch/x86/include/asm/string.h        | 21 +--------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shar=
ed/string.h
index 6291653..6bef90d 100644
--- a/arch/x86/include/asm/shared/string.h
+++ b/arch/x86/include/asm/shared/string.h
@@ -2,6 +2,27 @@
 #ifndef _ASM_X86_SHARED_STRING_H
 #define _ASM_X86_SHARED_STRING_H
=20
+static __always_inline void *__inline_memcpy(void *to, const void *from, siz=
e_t len)
+{
+	void *ret =3D to;
+
+	asm volatile("rep movsb"
+		     : "+D" (to), "+S" (from), "+c" (len)
+		     : : "memory");
+	return ret;
+}
+
+static __always_inline void *__inline_memset(void *s, int v, size_t n)
+{
+	void *ret =3D s;
+
+	asm volatile("rep stosb"
+		     : "+D" (s), "+c" (n)
+		     : "a" ((uint8_t)v)
+		     : "memory");
+	return ret;
+}
+
 /*
  * Returns:	0 (equal)
  * 		1 (not equal)
diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
index 9cb5aae..dbf59f0 100644
--- a/arch/x86/include/asm/string.h
+++ b/arch/x86/include/asm/string.h
@@ -8,25 +8,6 @@
 # include <asm/string_64.h>
 #endif
=20
-static __always_inline void *__inline_memcpy(void *to, const void *from, siz=
e_t len)
-{
-	void *ret =3D to;
-
-	asm volatile("rep movsb"
-		     : "+D" (to), "+S" (from), "+c" (len)
-		     : : "memory");
-	return ret;
-}
-
-static __always_inline void *__inline_memset(void *s, int v, size_t n)
-{
-	void *ret =3D s;
-
-	asm volatile("rep stosb"
-		     : "+D" (s), "+c" (n)
-		     : "a" ((uint8_t)v)
-		     : "memory");
-	return ret;
-}
+#include <asm/shared/string.h>
=20
 #endif /* _ASM_X86_STRING_H */
