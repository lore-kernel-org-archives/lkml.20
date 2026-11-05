Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908155;
	b=DIGYU3e2FRmdd5GeGfpDhnybh8KqOZs7ztqJx7LFpnBioZenZVOa+nXy60DDeZ65+RJ7
	 XLxcwdhnf7IGP/rMP3xbxsHk1NbwYxvh2FoHMNAqoP2tiUrLUJMoBVh38+KNXTdrMYrnp
	 NL8iNKUtKJCo7FwYR4mTug+SSDCQw+qA3wJDKxFnMO1SYw4ViqbpOzYUVUpFcnUWPSSFs
	 BbRu+OdkHxz/VLCAtAKGKeGXRopfkYOsYFJP+lbYU20QNtjmW3YfFEd5CTEJtJNeGQ+Hc
	 ICqFW9mYt0xVnLtf3L4n/4NyFbcsM+dqt4eUtcbWZSBqCIxWJ8v4K4xO8ZEwAoGOdUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908155;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=dAqkzQHH4YT8fG0Keqeg8FYNe39jzlocYHX/fM5qIOA=;
	b=hx+IEBtBGc+9RNf6lRJ/GqTSmnZM4xft7hTWtHpgcZ+XG3SbVxBXGEkjGYDn6qdCy/uS
	 WSeos7N0SvXgy18YSdS0xhrVRoB3xGkA8u8nFfpfzwvy7nADvKxtNLCnG2kxvtKX1Y/0Q
	 bmyYBTOX2v27ei+A5KYI3xUVmtaVkKEsyWgSsbpWVUxAefV6Zboh0Szco5pJkfbMdx5e9
	 jm1xlFXwD4tODmHu2YSbg/JG93G7xzxC9HyPDrwCaiEIdGnUKlHCkghV+qRzaQL4n9hRA
	 FgI+7tMeQYEQTtxE0jaHIL1eSparxoDNi3Ye5QogH4s40LPxi/F79/zLZJbkWAwWNnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/7DYtD1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9136606E433
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/7DYtD1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247671F0089F;
	Thu,  5 Nov 2026 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908154;
	bh=dAqkzQHH4YT8fG0Keqeg8FYNe39jzlocYHX/fM5qIOA=;
	h=From:To:Cc:Subject:Date;
	b=D/7DYtD19xvr4bW7uUrs7+nQKxLgDDPQAVDGaQvdkiKzDhQ7UkX9teSzvRILMquLY
	 ocIlhvhh12vDLRZIDjvBAmcY0h5rx+dJTAwiHWLxepi1PSst4nDO5UooGVhaCB9GzI
	 eu74mnrKTFoUSd4EPxElz4lLcpBudDdQE44NJeJHCfEKd3fYu8Z9ATKeaT6xHmfTGI
	 RqxAUS4GL0c6fcPGF9trs7T7ouX2xjpbeo1j3zBpFMWeZLNu5bPnK4bznm3vdLToG+
	 bi0lENixNERBn72XFZsAc6VCB9hHjiOaA8l/uzF9zYuL49kKXrWbzSwe+QyndsKkKs
	 BkC6RBm/ED/Zg==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/realmode: Use .init.rodata for embedded real-mode data
Date: Thu,  5 Nov 2026 20:48:36 +0100
Message-ID: <20261105194836.405335-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=blum@kernel.org; h=from:subject; bh=0FJ0XYzKs2y35Qegs8WHIwnf0WQ4mOHm0NtIIF3Biqw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlv7k7Ze4VnzuqqBfnyM992tBRvUj+2LVvhatDaBdX3D tl13dd71FHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQAT8UxiZJjHxfFwiq0hp2vf krzDH+z+RHBe/mgUtfjtv0Ozdhru6/3HyDBXQVjyrpsZwweDz+/trdWtbrvZGOdf5paeeO/teSn bBkYA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The embedded real-mode blob and relocation table are only read during
init. Use .init.rodata for both objects to reflect this.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/realmode/rmpiggy.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/realmode/rmpiggy.S b/arch/x86/realmode/rmpiggy.S
index ce5350241238..0c6289aa039e 100644
--- a/arch/x86/realmode/rmpiggy.S
+++ b/arch/x86/realmode/rmpiggy.S
@@ -6,7 +6,7 @@
 #include <linux/linkage.h>
 #include <asm/page_types.h>
 
-	.section ".init.data","aw"
+	.section ".init.rodata","a"
 
 	.balign PAGE_SIZE
 
