Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185796;
	b=uoKgTFvyI5qi2Jeecnp7u92qY3B2vZrpvpYuckR+ooeWHSGIcPSEiHmm2611eSV4GA+O
	 loxdLw+9KvmiHpB42DqjwNHITSaRGmgC5zzOp+N8pOmTglTudg89YiKB0hOAu20h64Rjw
	 KjhbBidhEBNHNi7v8SjO0qOma4sYmncMR+yCiC7S5Ob8gxQyYniUp+V2KuGbgn7sdib6G
	 qt5UQeOoNQLMx6VKfm8cDxbm2tA0UbiSQgqa+Y+opoOMyp8LygqMKN81d9O/0q1qdCF0m
	 DQOhohVGcKko5WEhZDfLqdeA/enp4jDVG/KPtwg/qMSo2wZ7ymHKKXZgUDEaPisvLlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185796;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=mmNzs31V1UECziyuNczBUwxiZ5ycUqEYUnX/+IJl9KQ=;
	b=gNgD/T08QQZpb/VXQNglitL79WXKufjCa0YhLnllYPCi3UC/hghdId6GHxYFB9ncTL2A
	 rC/2z2PhcbKJEtkheqr7Nyue8HcoEA4W7N7ojNvCuOSMNHehfDxNwmH3LsjU2gBtVv1aj
	 tqnIr3vjX5YKMGbwwHT5LQkDTV88iobuPsbR8QVzjLTBiM/vsgTCzBG7OeU68z7B0YEQL
	 8Ncn0kQ/7l/UHSasbm+Rd4KoM+KKZ+Pb+9fVGi7mpvYiKR5zkk1kAW6/sYw817Po+aYJ5
	 LhUxzwiOqGtbWeq+Jurt4Gv1A1tLB7YzssBH9uQE2zBX55m6Sg/FD5HE0/UlJ0HaLBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMjGsIef;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D2606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMjGsIef
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBAB1F008A2;
	Mon,  9 Nov 2026 00:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185795;
	bh=mmNzs31V1UECziyuNczBUwxiZ5ycUqEYUnX/+IJl9KQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aMjGsIeftrtPe57cSKWJ1u4CRqPcnpdn86etcfAMYID2ThOHPqj/r4Mxlvd0w+wAv
	 b2ZNTTpu4SCzGVwLLgrkFe+16Lv4qes/RIfy1LAFTMRuzkAN3bNDKZjvP5jTErYeAP
	 y1C8rjYiKw3+hHDZRsUcqpv9dhFPQsQhUQMCIObb2N0GrZRVkPgq3LUPCvTQ4cES9f
	 Aokop8vHxyLJRXb8H3T83n16aXp0Qx+xodgsgubyttRRsOM6KcioGkH1ufcFBtOHcl
	 kpdbSej+8iw3NBbT5KENU0zbOZ4dwdexoWo8164LjSUDVimbSNJaLvPF7y3ifQJHH8
	 lvOwRWo+AhCqg==
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
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jan Stancek <jstancek@redhat.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
Date: Mon,  9 Nov 2026 01:55:30 +0100
Message-ID: <20261109005528.3477-8-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109005528.3477-6-blum@kernel.org>
References: <20261109005528.3477-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=blum@kernel.org; h=from:subject; bh=0ICAzL7xpA+2zrSxYkZCZqqz7lvsrFxtkOQQ6n4GWAg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfpXiTrq/M5Mw0kJ77cevzt/mHKxyZZm252ff//+Fbp wWk4ySfdJSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBElvsw/FO4eplVaa/dRucq BZMtRq5MDtXaxQHr+idlRi52PBH0tIzhf5LKqvV3wyclnvgnGSls4331wJmj1YkLUh9Gu+wyMsr lZQAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Mark __efi_get_rsdp_addr() as __maybe_unused and remove the unused ret
variable. In efi_get_rsdp_addr(), remove the unused nr_tables variable
and use the function return values directly in the conditions.

Since efi_get_conf_table() already calls efi_get_system_table(), drop
the redundant efi_get_system_table() call and keep a single error path.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/acpi.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

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
