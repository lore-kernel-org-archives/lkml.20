Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2A376481
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040993; cv=none; b=ust5ny1x0bjy19IfF4XZiWXkeQfe3c5m6fYWAazfeci7/xCFb+UVgL3lG3FVlgXiq7Ofz4XX5ainlIU0w0B8MMg68VaLvnzuNfYM9/SBnN0eyMJcdKa6j2mfCoJh94dHeJ6EjL94E7frq0umzHb34oOPH0SJokJ426zKhieaSpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040993; c=relaxed/simple;
	bh=ic7sIp51OU4seZhQeYp6I2GQkpt7oxygfIV4+xPz9Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYzmQr1wxfri8eKyMRiO8kpyRLcASLMWNayetcXQDgbL1n1iWaAPAwK+hYNrROmlGy8UdGQQU4WMY0JcbTvNGBndj4xozJB9YLmwDTXdm15bA3Xv5SOcXasZUNCDV1mXTF3NgpI/my/HSVNTR1bVxJOmxff0zEtZiHNc1wgR9nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=piMg6SB4; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="piMg6SB4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=/0RnjeWeqK4aiVrc0W7dEG+Kp++1YdIPUBuPx6eJkJo=; b=piMg6SB47ayxfzarEnOYpmtKR1
	uTyjJv5bKFQt0uxq8Ag9kFZz9ttM441plX3lbFarwhxbBiykQOHq7yMtEeKdDfdiv1Qz4f6b7WxPI
	re8ZfcQihykfWDfPCO7HAXelkL09g8BbUqwzyjjRalKtqJ3Zk/cCH0sjfA4fSYHw7T3jiqshaYj5a
	JrvKdiI3RLfmxVtbnq/svAvDHhrmtXlZWsOxxOYAv8sTx2hFZGK8Byn6bwXfGbtbvtODi7GFGtDfa
	XwIFcmSatLglcOYEcod85tibWAYZct+YJAhZldjDa6mOmc9MlMshgoWNG981zxVioPDZYwzoyUajw
	IGF/86yQ==;
Received: from 186-249-150-130.shared.desktop.com.br ([186.249.150.130] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8pQk-005NkF-GM; Tue, 22 Sep 2026 03:36:22 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 21 Sep 2026 22:36:34 -0300
Subject: [PATCH v10 3/4] x86/asm: group inline string functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-pvh-kasan-inline-v10-3-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
In-Reply-To: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

Group the __inline string functions in the same header.

Use <asm/shared/string.h> since __inline_memcmp() must remain there for use
by arch/x86/boot/string.c.

No functional changes.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/include/asm/shared/string.h | 21 +++++++++++++++++++++
 arch/x86/include/asm/string.h        | 21 +--------------------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
index 6291653fe629babf15e29060b013d357d8eacf4c..6bef90d62a21138ec56c939ffc474732999bf465 100644
--- a/arch/x86/include/asm/shared/string.h
+++ b/arch/x86/include/asm/shared/string.h
@@ -2,6 +2,27 @@
 #ifndef _ASM_X86_SHARED_STRING_H
 #define _ASM_X86_SHARED_STRING_H
 
+static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
+{
+	void *ret = to;
+
+	asm volatile("rep movsb"
+		     : "+D" (to), "+S" (from), "+c" (len)
+		     : : "memory");
+	return ret;
+}
+
+static __always_inline void *__inline_memset(void *s, int v, size_t n)
+{
+	void *ret = s;
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
index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..dbf59f0d4cca71e2ddce0d8764aeec8782236669 100644
--- a/arch/x86/include/asm/string.h
+++ b/arch/x86/include/asm/string.h
@@ -8,25 +8,6 @@
 # include <asm/string_64.h>
 #endif
 
-static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
-{
-	void *ret = to;
-
-	asm volatile("rep movsb"
-		     : "+D" (to), "+S" (from), "+c" (len)
-		     : : "memory");
-	return ret;
-}
-
-static __always_inline void *__inline_memset(void *s, int v, size_t n)
-{
-	void *ret = s;
-
-	asm volatile("rep stosb"
-		     : "+D" (s), "+c" (n)
-		     : "a" ((uint8_t)v)
-		     : "memory");
-	return ret;
-}
+#include <asm/shared/string.h>
 
 #endif /* _ASM_X86_STRING_H */

-- 
2.47.3

