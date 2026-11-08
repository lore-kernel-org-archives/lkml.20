Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171776;
	b=E/UNJgRNuXUF1pdN02qOLnr71TWQmzWqkm2Hq75bjZkof37Z3MHyuSBkpxcUFta0l1Gt
	 ppVmTSScdw5Z2IBdx6XT3kf1/EPpoj4lD8noTiAvwTkXnH52SPakeWcr7DPRGnDyxq5Po
	 QyFc3o2Jcx5pYc5dceubQhwtdmUkSBGqWK9YxjR5hhPPFAYChoarTgM/1DnFJIsSiGLhr
	 xsNUjCYBJ4ejw/wfeGPCcbBFpSiYXZqeM/B1luweEo3s7ZHb7jxDjo42EmiUQ9OgQRSQo
	 wHDvrwCuty/S9HHoAlr70d/1blocqej3miISNwATxjrygPIBw0w2evvtm40f3aFIq0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171776;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=q8zW/K4+b8g+EM2Au1TXaVj5J8tdshFQGsiHay3KgPc=;
	b=NyIlq7iycdHbTyDCKVp0QckLHe7i1azUOhK8vxJRKsHaooxCZVtOOcLCjCUpU7QLqf9f
	 fbqhVQiOS9EPmLHIi4v3w2b5ttapgIhKS3u8XwJKJObMEXcWxcobeSApiWKN2UqhFSoAq
	 zlGBgK3e4CARufP0VuXe3ZpNuMXy5Cerp6SKrQg2VVmJofEMgEh6R+Pq2jSruPhldlqb2
	 cBlqlMkrP5YRaC4ESLko0QxhVIGHHKBCHYfx5pCiPYrVFjN/X++UVwjvQvSoChc7YlonR
	 orO4FtfvJxW3qlHjVfOAyTx2RgClw7iyA25SoFXapud9gBDt3rKkIiso2hVB4W9TSmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XO4ol36T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC44606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XO4ol36T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423361F0089F;
	Sun,  8 Nov 2026 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794171775;
	bh=q8zW/K4+b8g+EM2Au1TXaVj5J8tdshFQGsiHay3KgPc=;
	h=From:To:Cc:Subject:Date;
	b=XO4ol36TNfmsMufDETtNz9krKOgq6bvGmJBez8ZIkraqZQ0s/7mR1IshOC8PDSafC
	 q+0quX07HDsy0Mtam+L8u6pqcAncdejMykDyG/iNU8j+xuBov3Ketsd+5jtRcS8N8e
	 dOEO7ng4fwDrah31a6HbUzgmwulZljPNq+V606DA/Fk8JNKOVzIPO3lVrXmxSK8UIm
	 RQmxNNjtvlq/AstZ99xKxw4TX1mK5eGmNZ05LAVt1cTsZQZk++wIUvzu7nmNB1HXbH
	 RbVIOltRGZzp5oL8LnB1/waTrqXkNU05799sdsWZtiBG8vhgYXrqg0a5M2fhcA2bmy
	 D5DilxYMYDc0g==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	"H. Peter Anvin" <hpa@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] x86/realmode: Pad the embedded real-mode blob to a page boundary
Date: Sun,  8 Nov 2026 22:02:15 +0100
Message-ID: <20261108210215.407893-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053; i=blum@kernel.org; h=from:subject; bh=99tegXxauqcohULYARvyj+cl5EV6NsTtjXj9WQTLs2Y=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfHofbp3QeUYqXNH77if2rw5+j6TKul433Ll6qIfyyh 3dXgdS7jlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZhI72VGhieL7q2eN2Ov6bUG 2fccPe2cyzOPnm+InTxngoaBYOHufi6G/xmvvthcmS6ytl+0a4FR8V/7rLP2PxP45zsJnfRLnis nxwQA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

setup_real_mode() copies the page-aligned size of the embedded real-mode
blob into low memory. However, real_mode_blob ends immediately before
real_mode_relocs, so the copy includes relocation data and potentially
other .init.data contents when the size of realmode.bin is not
page-aligned.

Pad real_mode_blob to a page boundary so the copy contains only the
real-mode binary and its padding.

Fixes: 084ee1c641a0 ("x86, realmode: Relocator for realmode code")
Acked-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/realmode/rmpiggy.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/realmode/rmpiggy.S b/arch/x86/realmode/rmpiggy.S
index c8fef76743f6..ce5350241238 100644
--- a/arch/x86/realmode/rmpiggy.S
+++ b/arch/x86/realmode/rmpiggy.S
@@ -12,6 +12,7 @@
 
 SYM_DATA_START(real_mode_blob)
 	.incbin	"arch/x86/realmode/rm/realmode.bin"
+	.balign PAGE_SIZE
 SYM_DATA_END_LABEL(real_mode_blob, SYM_L_GLOBAL, real_mode_blob_end)
 
 SYM_DATA_START(real_mode_relocs)
