Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311895;
	b=j7/EBUs9PXxUHdf2Rfl5dERPl9Zoybox0R8243NZR6DndqCglz/VlbtolsHS5PCUKRtc
	 CRZnY6m4VdHaQh0JdiWrPi2BkoTDwsKkFOluBGing3L3H/fP2SlxM5BzBUxMBU7z/d0pM
	 ZZ8E/P5xMr0xdqJJ3bIir8JQO8NU39G/oESDoB1eFqcgIE05VPk8FIFmEr0vtvLZyn8QD
	 /ILfbrj0dG8g3Xhbs4hwSLlu69SYadbaAm4Mgeq2EP6VNAjT7t+kFgu1PdXxKlLmXaKJ/
	 JnzxpCjN1pyPs1chyot2Int/ifxaXuWlqSsD0A4xQaA/A2LVDkVvIPXsH8qQSo6ys2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311895;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=T7bKkxlo/VsvYiqkk+ao9/np70P43yJt5vtFOvg1DXA=;
	b=3K6UxSwIqWyS205ItRQDJsw2uRDcCH+GYC94VM32hI+BWnv3r6IwZJdS1Mh437LwIdXd
	 GA7mZX8hrq4hvGKOLqjrm/+lpgHUMj6gEjFoSCP2ICtdCuWfG87anBP9YvAsbOPgKDrbV
	 4kDfBen87axo22c2OkGzJqEB+6vFKm7QkLsLarrHUO+6ijmH4B/Df3zmCPLGWDc8uWi4d
	 vIOC+A9Vxz5l4fT2ya8eFvDAK2OaMdl8VQxsNcqO3MOS7DMs+JewVJWWThBArGRgi+rpo
	 L22AdRq8Tbyx6VWq2BzOqQ3hHXTHJ2RFXvj1amx4qsRULay/k77oUz3HXomqdA2Nvng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlbxSrl7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3434360A260B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlbxSrl7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916C21F008A6;
	Tue, 10 Nov 2026 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311895;
	bh=T7bKkxlo/VsvYiqkk+ao9/np70P43yJt5vtFOvg1DXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DlbxSrl7cTQVuMCTKd02/N3O6uLNeRlzL0IRb8Vb0sY3YyB/3MWCAGEyIFBSfm4Jh
	 /elXUzqdtAF60Q/+pWlWbYw0ZVAdx6o8nKhjLBi8e2bvLP4ZFwXwvVcvhC3K9TQ5Xk
	 vXOLV+9kK5Tea1r/IXt/3GwOAOz6o6cxFOjusaAp664cuoNC110o8qFjgGBcC1jMtY
	 PIHsMtN4ednMf1tffpqTo6QEpLTnS7qZKW3S3UAhpdFohFAHkF2IWXpWmzcLLDhH+7
	 l9YKK2/79l8/iKMvvbHL14euJdfZqnxKd1uCQbmzL7NCJo48I/8K9rVa79FG56om+y
	 TMJTiQhoF4YfA==
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
	Yeoreum Yun <yeoreum.yun@arm.com>,
	David Hildenbrand <david@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v5 2/4] x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
Date: Tue, 10 Nov 2026 12:56:09 +0100
Message-ID: <20261110115606.133611-8-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110115606.133611-6-blum@kernel.org>
References: <20261110115606.133611-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3737; i=blum@kernel.org; h=from:subject; bh=CGeSk9fIslswR9aRUNL9ozbgNeMfM9o6d2LFUNppIS0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmf2dKfzzZfb749Qize6tDqPS9DORxkt07t85/+wn5Ll G/IbvVVHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRVGWG/z7fJ5cezOw2T9Yv XePc9+H6TJX5fQeFVS01UvYW/018fZ+RYVNdR4/9B+d/zIs3xt3UlPVoi13y+Zr492KnvluPqgs zOQE=
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
index 39c153b895e6..874eda1175d5 100644
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
