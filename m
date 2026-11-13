Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612854;
	b=3uErIb7Ozqj+UZ+L3yrfek5EUpN8M9zaN7kRd1yyXVWohszNXozHSH4AYwhO/PI/u/9O
	 +v7+HrQjGD2pTikqCwQZL884kqu8s/C9KkhEDRRsa8WBuZQC/cZzW+21FUWsUln4XoCB+
	 GQ54ncyArBuEbH2FC+z+Jw796bbMN0kAk3S7kighXP9hmbMCiQheLRN9wJ5VfFU4vzEKN
	 Yzi2IMPZ+q2lkW6LiVZg2hl3UWBzjcXD8FTN4p4VawDIZ/tkbE6VThK0YAyG47XnTlU76
	 4MyIZxDO6SEaMKQSnpcFbrCEdDCPRR8Bsdm9zu7nx3ijB5qXqZ0KpmAz+5tMMRmwIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612854;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ev8GuPnLIZHVIe5wQX8VkX/G3jfCEhpURVZRzfGlLP0=;
	b=v2xob/UCI96ZQS1RMJKunbYVGzVoGPUr0l8yG5v2SJHkYOCa0aR3JEgl0LuJEyNmENMd
	 GTI0TeMAGO1yVNlJuaCSsJGHgdbDtnrwq9KiaQtzwj3X0Sjaout3spCNqnJ5bLWQBchPQ
	 n9828+wOYbN51oCIvz4ZeRLQ8+LE9PCxxRwtHT6ICvKMvOJGaE/fQ0caZlY/dELp6Je5h
	 trZHEv2gheHYLbp4DuqZXV4/yyI2LgFT/QqQRsx8aSBBsz60qEOfRcTwAHjx5pfKLgWZf
	 CCSEMQQ3EZqM9mF+wUem7L0H8mHI0gHDbK/rdqimCL3Oj1NPefGD8Bit5IbcDUUQuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ah5qe6n6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BC606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ah5qe6n6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4591F000C8;
	Fri, 13 Nov 2026 23:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794612853;
	bh=ev8GuPnLIZHVIe5wQX8VkX/G3jfCEhpURVZRzfGlLP0=;
	h=From:To:Cc:Subject:Date;
	b=ah5qe6n6GVJbDnkgdhAza6gXjWHsbBxDbD35u/5I29uOQhlzYy8VOQpHuh1NzGpR/
	 6bVeUgfciwv3PK46dbgWmXpwsod/KuM6FIfL34RjWmwQRnDWMUkYVtZMDXIupetWbU
	 lsrK7Bq6EOtw8iJIgeAUoKiAErtp+E6wq+4Y0BB3pXXHWPvOWqP2gGxVhc4I1XQ43H
	 geOmiGjqQTdi4mRkQp5gw70MP9eW4doLynthE2i8bmvk6lw0U/wijtJs3yX1+lawTL
	 M8Kn9CcFt7rleMY5JwhjBrrFwhP+6SE6rw53ctHoQR/sNXyWw28b4C1UtdHvxHCDd/
	 0CGodBCg2ZxgQ==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dexuan Cui <decui@microsoft.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Yunhong Jiang <yunhong.jiang@linux.intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/realmode: Consolidate real-mode blob size calculation
Date: Sat, 14 Nov 2026 00:33:04 +0100
Message-ID: <20261113233306.4295-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532; i=blum@kernel.org; h=from:subject; bh=RnZFIEa81GLmKqMwpYaRFkGuEXuQQScwF0iTQL8b3pQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnf5xnxruFd+m+Cgd42pxD/S1em5bU8/v7xrmvV3KXz/ zf5LbMu7ihlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJeFUxMkz9xb9L+ORmR7cV a186/PsrtJVJkfed5OeYyU8fR35V/87EyHBn5cbPVzZqp77Mcr2b2dM716n63+1p9411M3PXqYS t3c4EAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

rmpiggy.S page-aligns both real_mode_blob and real_mode_blob_end. Their
difference is therefore already page-aligned and does not require
ALIGN() or PAGE_ALIGN().

Since the real-mode blob size is calculated in three different places,
add the real_mode_blob_size() helper and use it in
real_mode_size_needed(), setup_real_mode(), and
set_real_mode_permissions().

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
This patch depends on the following patch, which has been acked by hpa
but hasn't been merged yet:
https://lore.kernel.org/r/20261108210215.407893-3-blum@kernel.org/

 arch/x86/include/asm/realmode.h | 8 +++++++-
 arch/x86/realmode/init.c        | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
index e406a1e92c63..ba377a5c4450 100644
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -78,12 +78,18 @@ extern unsigned char secondary_startup_64[];
 extern unsigned char secondary_startup_64_no_verify[];
 #endif
 
+static __always_inline size_t real_mode_blob_size(void)
+{
+	/* rmpiggy.S page-aligns both ends of the blob. */
+	return real_mode_blob_end - real_mode_blob;
+}
+
 static __always_inline size_t real_mode_size_needed(void)
 {
 	if (real_mode_header)
 		return 0;	/* already allocated. */
 
-	return ALIGN(real_mode_blob_end - real_mode_blob, PAGE_SIZE);
+	return real_mode_blob_size();
 }
 
 static inline void set_real_mode_mem(phys_addr_t mem)
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 65110b2ee1a1..23c5111ceea4 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -96,7 +96,7 @@ static void __init setup_real_mode(void)
 	unsigned char *base;
 	unsigned long phys_base;
 	struct trampoline_header *trampoline_header;
-	size_t size = PAGE_ALIGN(real_mode_blob_end - real_mode_blob);
+	size_t size = real_mode_blob_size();
 #ifdef CONFIG_X86_64
 	u64 *trampoline_pgd;
 	u64 efer;
@@ -187,7 +187,7 @@ static void __init setup_real_mode(void)
 static void __init set_real_mode_permissions(void)
 {
 	unsigned char *base = (unsigned char *) real_mode_header;
-	size_t size = PAGE_ALIGN(real_mode_blob_end - real_mode_blob);
+	size_t size = real_mode_blob_size();
 
 	size_t ro_size =
 		PAGE_ALIGN(real_mode_header->ro_end) -

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
prerequisite-patch-id: 65b53ab526487dba9029340376ea5a469c8a50dc
