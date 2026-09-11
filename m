Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D274BEE52
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164367; cv=none; b=ewnCtvKNr0uyHjxxvx8/HkznW6o7iNtszepFAJPtOlNICs3bbHuv/+1BWXQFH4IkLfqUWmwwxOKTlEPDpmtHpgqzxhCsV8EiF45641KScRopZMqn79tiFUDixCiPeQLO8oOjCgUbot3hxgElDHQW1AmywJYovs0skuwTxje5Qtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164367; c=relaxed/simple;
	bh=+Nta8YPZVefYEO1aRFgF/H7PuUinfGQhnelVspNKxQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SXh7UPhszK4DBgmxdrt+EobIN7RdpItV8SZzicB2jqvSh0bSBgEvZCsVkghGzs9ai04tUgkF2dBmabH3YmRjcWyZRAq9/lexOw23WZBjUPkSmmPqczpTKeFBn/ExXoZzEwE4JmyShtrCg+JxLRkU2CvKd8fZGAAuXEpkUj9mzg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sp/mD6Jw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sp/mD6Jw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so31573f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164364; x=1789769164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U3zc1ebSvTigefNAfZt7P8fRxfSxR3IvYrqoRzdTcdY=;
        b=Sp/mD6JwPZCB2a7/84sfoz6gnJk9EbTrKtHJd00pz70QK1hTJL5HDwR6SJFmGfRSqf
         buVW3/RLEk3TqDQw9x5hV8+lFR56zV7AiW0irSVuHVT+HlWzVgCFyomdcXWc6+/JDK1D
         YuHlDq6wMNdkpxdaMdA8ef0UX/4GbxIDJXO//XSrbFtOP45a8IEx11XUy2kacusHz2DW
         QnOE0Ti5lYCp81Dcnvyz9QY0hLU+8Apn7spYno9lksg+b1QN4iFTuN8vfqO2MK6/0VBr
         5URXc1t5pH/ONPLHKi++aPSbIgLAZfcoDfm93iwb3V9Ign8Okm3rxgzX/sEh18MGRPV/
         pl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164364; x=1789769164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3zc1ebSvTigefNAfZt7P8fRxfSxR3IvYrqoRzdTcdY=;
        b=YaLt3Cj+q8WzjBBcE8C5YCBPLnCw1MqzcuVU8wH4w+Km71ojO+7WB7myoNoNKRSdPn
         8lCovFWUW7mkjurWSKo04XKC8Bpy7sUlrPy+nSLhyu6oO8fI61ZiqyQIX0qdrky8YPIW
         z79zSIODQdzGzOgKg1IpuDVXXyGAKd/ziAk1J5FynYFIA/A4IeWpuYRJUuiVvHgGoBzC
         N2485Xxfykog1OEjabBkdxcfPKTbG6XGPvuWP1qvRwe36og5K8x5BNQ6G4SjkpSa1GfN
         3IzcmU9Rn7DK8Ezbt/kTWCRK3wzmrD9BeSGP9JNnEAaMyZj5j/89XDFpZfc+HARPNfRo
         bIQw==
X-Forwarded-Encrypted: i=1; AKwUvBzBRG4kDXf+zz7Ss7UR8QBIJeen4A5As2VrR3q310Ir2MiGVvZKsaiGREq1PWWV1O7tXp97jHnt0bfLjks=@vger.kernel.org
X-Gm-Message-State: AFuF++me1U1cLiISnsfpO3prBb1bfji16CWYvEPyP+sKQPpV2baKXdli
	bHnib+BEEMCIXi6kp9a+PQ4GlOtnzHWLHcEVUrwy1vKh8pEOjCh7LKnJ
X-Gm-Gg: AYBFou3rEo2LZyizDrorywZBnaEfBxrfU4Pl9ZvsoI5pk/o4eKHDX9+8wiUxyFrMgpQ
	n4Mq1adbOTv9d9SPD5ep2ulNVOQfsOSuDiewbowS7QWw1GOgB6idpJFXF+LSp7BCp8CgDZP76VD
	4CmBu2Hy99cjwJcgLhaHnUhVSWdIr5YIiILzSdIvigXCTsujhE3sNcHA1As6xXAcIuOtOHa6AC3
	7wqp0Jhlff0N7HTOiQICThQfKXN7PbUaCwvAEeONBvj5r1xPABwupCVxuqUk8TLz3Y7ATNmRvws
	IxjYbp5tblKDy393lfWexvZr00fGKzsFrV5dAeA9ZFIj5xo423uCWwzVd/VuVvVWpAbyPShznwv
	wDX4oZHmW/UBJo4Wnt4k2J18oQ/bYkutVkpwKacH0O4hAieuA3h0PW1FfxZ+c9mpnmhQrSz6FIY
	O77lqy/NtzPxIyTknKYU6mvDZTZ978EF0PfAuVOuwbseOttcv8FpvZVU4jRHRD56IvIuafdNpsM
	xsS1/8PrPua4BZknsKWcVCGgsy99NqlTeTfjroMD9kobVfkwmaJRSl7kBk6MNHlwOSDkNCLrPv6
	wIT9ItIkVSMGlI2gqA9ImdrvYcPLcOFe5e0Jj9a/KwUNQYw=
X-Received: by 2002:a05:600c:6219:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49e6caacf0dmr1036035e9.3.1789164363937;
        Fri, 11 Sep 2026 15:06:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm153244765e9.14.2026.09.11.15.06.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:06:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kai Huang <kai.huang@intel.com>,
	linux-sgx@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/sgx: Fix the return value in __sgx_alloc_epc_page() kernel-doc
Date: Sat, 12 Sep 2026 00:04:42 +0200
Message-Id: <20260911220442.6815-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__sgx_alloc_epc_page() returns ERR_PTR(-ENOMEM) when no EPC page is
available, but its kernel-doc says that this case returns NULL. Document
the error pointer returned when the node search is exhausted.

Fixes: 901ddbb9ecf5 ("x86/sgx: Add a basic NUMA allocation scheme to sgx_alloc_epc_page()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/x86/kernel/cpu/sgx/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/sgx/main.c b/arch/x86/kernel/cpu/sgx/main.c
index 4505f808af5e5f248d89f47006fcd38de3968cf3..f6b24f362e4155a5bf4d27a84622a1cf03c6320c 100644
--- a/arch/x86/kernel/cpu/sgx/main.c
+++ b/arch/x86/kernel/cpu/sgx/main.c
@@ -475,7 +475,7 @@ static struct sgx_epc_page *__sgx_alloc_epc_page_from_node(int nid)
  *
  * Return:
  * - an EPC page:	A borrowed EPC pages were available.
- * - NULL:		Out of EPC pages.
+ * - ERR_PTR(-ENOMEM):	Out of EPC pages.
  */
 struct sgx_epc_page *__sgx_alloc_epc_page(void)
 {
