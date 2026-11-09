Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228549;
	b=MYd9lLD+B/JCjcaddJ/xKTBdQNiD0AzmCImxfd4uXCt/Sxh07fx9pGG97faCtSKWaE78
	 WalD4ZAPeHzPcGbuw5E1D5lfEvczm8peoWuDmwTSbAT+1HvweFXNKEQ9v/xn7O25+OM12
	 wIGutZXhY+0W2cSTmrkyyCXgn1cVJp0Nck+mvaTfDSbLTbf0G+gqV6sUGNPJYVlUjwl5n
	 Dm6IzMnJVGijZCbVRVl5Ygn9EPH21Gkxse8Ejuv01zjTOui3WRsQmx8GZ2ofCvu/yHsna
	 jmpsFNSIWbUrxECuJiw0pQ0M1Z7YcbioZ3l4pMOd8qb5fY5yhVhX4DRRb16qsVtPqLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228549;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=ZdimBs8pWmGoYVh9QjerFiJiZ83uugLgkFoIX7xZ5r8=;
	b=aHNmdsGAuGFT8Gdko/kSY+LVsAIaksDA3/ZqOUwZXKfIwJsP3QQGlmZR8NQhUVzZJ65G
	 zIsIiudVMBVo7Xk2ex4nOxhNy1N89md3c5qsDEVkqueObF9AOsADizsrifJP4kiBOwhxI
	 ztEdkzOn2Ai5j8209tikDGSSof2F6TRVnH9Gzol4yF2hEIzWF5Nr3FiBUXhiJjrbcGpbG
	 4L72dsyzhHyTsJRjH5s2x8HBNLAubtqxWk+wGkOQHcPnv3CsQidPUrYoL7yIDvvHZXru2
	 rw2ZNGNw9RfqKbMF8iovH9U6suvhZD1ZO53XrQOSF3TPzmvIgf2JTNxk3YXEw1CRoNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVLADJfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B3606EEB0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OVLADJfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7FC1F0089F;
	Mon,  9 Nov 2026 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228548;
	bh=ZdimBs8pWmGoYVh9QjerFiJiZ83uugLgkFoIX7xZ5r8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OVLADJfXfJiy7me06M1NdVCc5wkTZhsoC/3cnFwZliuJuhU8zEeye6RkfkGCX4zTA
	 t/HKJfUj73dbw4yqZXkLoN1WjymjqEejaPO2i59pOkMyU6c0Vxd00U8GH3kwgze/+b
	 FP7HcAP5OiOaK+9QrXPX88zSS7P2y+iLhJ3IKrBW2e8kAPb7KffqFXuRHTFWTVx5Bj
	 Y3msTPJnd9T4awHfqCQDdgIIyiQ+CCM3oOB9E9vYwt4z/5Vh6lrk/3eNKa3La5D3oL
	 Rs68Khslr06SetWn9GFa97Fc6svk8k1JwFR/AabSgSokEo8S+Imu39rUTXagBPnTjA
	 gxOwrpX4x7t4Q==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Thorsten Blum <blum@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
Date: Mon,  9 Nov 2026 13:48:19 +0100
Message-ID: <20261109124816.61438-8-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109124816.61438-6-blum@kernel.org>
References: <20261109124816.61438-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3737; i=blum@kernel.org; h=from:subject; bh=C5klqjMwhxq1l5rbMdMwEibUzJp8gxFs108HUxL8Tmo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfD4p9YZk+YbrHItcTO9Z9LUzUljSOPPssX8j5N3Puf W22RM3QjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZhIbwXDX/kth+x5HrYYHVX+ mc3AspmzcRnnqoKp7+6XZMe2/PhUyc7w37fi0OG1l1QXcl+wX11nbWwiJ/7rInuE7LNlb7Mtnv3 OZgEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Mark __efi_get_rsdp_addr() as __maybe_unused and remove the unused ret
variable. In efi_get_rsdp_addr(), remove the unused nr_tables variable
and use the function return values directly in the conditions.

Since efi_get_conf_table() already calls efi_get_system_table(), drop
the redundant efi_get_system_table() call and keep a single error path.

Make efi_get_system_table() static now that it has no callers outside of
efi.c, and remove its declaration and stub from misc.h.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/acpi.c | 18 ++++--------------
 arch/x86/boot/compressed/efi.c  |  2 +-
 arch/x86/boot/compressed/misc.h |  6 ------
 3 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/x86/boot/compressed/acpi.c b/arch/x86/boot/compressed/acpi.c
index aed27604c11f..5b2064b9c199 100644
--- a/arch/x86/boot/compressed/acpi.c
+++ b/arch/x86/boot/compressed/acpi.c
@@ -21,12 +21,11 @@
  */
 struct mem_vector immovable_mem[MAX_NUMNODES*2];
 
-static acpi_physical_address
+static acpi_physical_address __maybe_unused
 __efi_get_rsdp_addr(unsigned long cfg_tbl_pa, unsigned int cfg_tbl_len)
 {
 #ifdef CONFIG_EFI
 	unsigned long rsdp_addr;
-	int ret;
 
 	/*
 	 * Search EFI system tables for RSDP. Preferred is ACPI_20_TABLE_GUID to
@@ -53,21 +52,12 @@ static acpi_physical_address efi_get_rsdp_addr(void)
 #ifdef CONFIG_EFI
 	unsigned long cfg_tbl_pa = 0;
 	unsigned int cfg_tbl_len;
-	unsigned long systab_pa;
-	unsigned int nr_tables;
-	enum efi_type et;
-	int ret;
 
-	et = efi_get_type(boot_params_ptr);
-	if (et == EFI_TYPE_NONE)
+	if (efi_get_type(boot_params_ptr) == EFI_TYPE_NONE)
 		return 0;
 
-	systab_pa = efi_get_system_table(boot_params_ptr);
-	if (!systab_pa)
-		error("EFI support advertised, but unable to locate system table.");
-
-	ret = efi_get_conf_table(boot_params_ptr, &cfg_tbl_pa, &cfg_tbl_len);
-	if (ret || !cfg_tbl_pa)
+	if (efi_get_conf_table(boot_params_ptr, &cfg_tbl_pa, &cfg_tbl_len) ||
+	    !cfg_tbl_pa)
 		error("EFI config table not found.");
 
 	return __efi_get_rsdp_addr(cfg_tbl_pa, cfg_tbl_len);
diff --git a/arch/x86/boot/compressed/efi.c b/arch/x86/boot/compressed/efi.c
index f2d08e756e66..93dbf4abb79e 100644
--- a/arch/x86/boot/compressed/efi.c
+++ b/arch/x86/boot/compressed/efi.c
@@ -57,7 +57,7 @@ enum efi_type efi_get_type(struct boot_params *bp)
  *
  * Return: EFI system table address on success. On error, return 0.
  */
-unsigned long efi_get_system_table(struct boot_params *bp)
+static unsigned long efi_get_system_table(struct boot_params *bp)
 {
 	unsigned long sys_tbl_pa;
 	struct efi_info *ei;
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 4f86c5903e03..8c9f3283c92e 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -212,7 +212,6 @@ enum efi_type {
 #ifdef CONFIG_EFI
 /* helpers for early EFI config table access */
 enum efi_type efi_get_type(struct boot_params *bp);
-unsigned long efi_get_system_table(struct boot_params *bp);
 int efi_get_conf_table(struct boot_params *bp, unsigned long *cfg_tbl_pa,
 		       unsigned int *cfg_tbl_len);
 unsigned long efi_find_vendor_table(struct boot_params *bp,
@@ -225,11 +224,6 @@ static inline enum efi_type efi_get_type(struct boot_params *bp)
 	return EFI_TYPE_NONE;
 }
 
-static inline unsigned long efi_get_system_table(struct boot_params *bp)
-{
-	return 0;
-}
-
 static inline int efi_get_conf_table(struct boot_params *bp,
 				     unsigned long *cfg_tbl_pa,
 				     unsigned int *cfg_tbl_len)
