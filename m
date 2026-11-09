Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185790;
	b=RLY/o7LagYpeYhD9i7fHZIsweqKSDGhlYkzhRFip3TTX4NX5mOLstDU/kzF0tT+vTXUj
	 LoVn2BVs3k8933kHcUSI6443Nu/mq8oeLziygyvhQEY1REnq28ZnbtKXWF9wTmDTDoYmr
	 PpVpRtNGeCTXMRUs6VPGE/LpbJR36Bv/3ppPJHdb9UVMM6jVO/riRzIEFd8kMbKhkxVW6
	 d/nws65EF8lX1bcK1xaCVvmwHKYy3kdjSaLvmeA8Nz9KpP/44qp7eacB4A20WPrSZmF0i
	 8WPuxev58mIV10eGNFN1nalG+R76Lc2x9eurHWzkp++z2I4CnYcAyeq0xpvBrdRtXZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185790;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=qa9wi5yo5+4owXYVLGBisNE3LUVPrfGS6wWlezsHUUg=;
	b=PoHi+45u+M0V4BlZKdttky9DCml1JXgeZBKvuAiCLfwOBwbNiiU2eD5JOGOyn+tLaTIi
	 ll94Y81IB6nSgEGvUj8xTy6qXudGhAD52+BBlrDpQOYZx6ZkccZhcnz+MVSyUEC7OglDe
	 Z3uUW3V3SKDOfHSZJLCwn77k16EylqZ510aDZJmJ/73KakAj0FQa8IJ49NgcmMQMZHD3Z
	 kT4kWg6k6aHXb7acajeOG1qt36PQF6ADad5Ci8ipgeTu80xXXzxKwA+QIyiISa9BkMAKe
	 YqxSBXiMKpc/h6szt71ytLLHXmul4J7y/zbACSIXyzeRA8A2itPPqTCg54aqqgrDoVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Hv83xg/P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A54606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hv83xg/P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF2E1F0089F;
	Mon,  9 Nov 2026 00:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185789;
	bh=qa9wi5yo5+4owXYVLGBisNE3LUVPrfGS6wWlezsHUUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hv83xg/PCWeiYZ3qNGrvB6n09FRF0IFRRRAgQQvKKx4xiTmxtbMGa+cbke2VKE2aF
	 daC0YrrwzQRbZxNqh8D7hOAxPlFr3+hFOfI7+t2o49PhM+bS9uFrwlvZcwIp+zBvY/
	 OVzWHMKDFmQ7C3dtgL6eZKZbHnWwfASrsJE/+0zsLi8/gcECcmLoqGp5zdK5yAtlnu
	 tei9beeRbO4Ld3A0OL1tb6FHYtmJk+Zy7Cg/j+d/gAvRNhBzhHR0Ifrk5IDYKD/KPP
	 ekT7crfgvkARsvfRafK66zJHh0DYbSJznf7V89SQyl9rrou+Bw9mBMblM9JqPpkRmD
	 ECbAaNBWBrjSw==
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
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v3 1/4] x86/boot/compressed: Remove unused variables in EFI helpers
Date: Mon,  9 Nov 2026 01:55:29 +0100
Message-ID: <20261109005528.3477-7-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2644; i=blum@kernel.org; h=from:subject; bh=RDQIo82W0kHbNKG4rf8BkGd0QlYcaGPQ87K8Rd0xwkA=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfpbi77LRCT/+fZhjI6fjLZGYYy11JjzuM5/6957DL8 FeTuHWio5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACay7BPDfy8jgcUWsz9wLtyl GKZwpevd+fQDz15oX1yqvEJYkPPAHn+GvwIXjv86J+SaZ1/Td2milw7TjROmzFPvJRb5e5oYZG3 axwEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

efi_get_system_table() declares an unused et variable, and
efi_get_conf_table() declares an unused ret variable - remove both.

get_kexec_setup_data() also takes an unused et argument. Drop the
argument and update the only caller in efi_get_conf_table().

Also simplify the no EFI system table case in efi_get_system_table() by
falling through to the existing return since sys_tbl_pa is already zero.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/efi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/x86/boot/compressed/efi.c b/arch/x86/boot/compressed/efi.c
index f2e50f9758e6..e0329a03618a 100644
--- a/arch/x86/boot/compressed/efi.c
+++ b/arch/x86/boot/compressed/efi.c
@@ -61,7 +61,6 @@ unsigned long efi_get_system_table(struct boot_params *bp)
 {
 	unsigned long sys_tbl_pa;
 	struct efi_info *ei;
-	enum efi_type et;
 
 	/* Get systab from boot params. */
 	ei = &bp->efi_info;
@@ -70,10 +69,8 @@ unsigned long efi_get_system_table(struct boot_params *bp)
 #else
 	sys_tbl_pa = ei->efi_systab;
 #endif
-	if (!sys_tbl_pa) {
+	if (!sys_tbl_pa)
 		debug_putstr("EFI system table not found.");
-		return 0;
-	}
 
 	return sys_tbl_pa;
 }
@@ -84,11 +81,10 @@ unsigned long efi_get_system_table(struct boot_params *bp)
  * the initial physical address via a struct setup_data entry, which is
  * checked for here, along with some sanity checks.
  */
-static struct efi_setup_data *get_kexec_setup_data(struct boot_params *bp,
-						   enum efi_type et)
+static struct efi_setup_data *get_kexec_setup_data(struct boot_params *bp)
 {
-#ifdef CONFIG_X86_64
 	struct efi_setup_data *esd = NULL;
+#ifdef CONFIG_X86_64
 	struct setup_data *data;
 	u64 pa_data;
 
@@ -112,10 +108,8 @@ static struct efi_setup_data *get_kexec_setup_data(struct boot_params *bp,
 		debug_putstr("kexec EFI environment missing valid configuration table.\n");
 		return NULL;
 	}
-
-	return esd;
 #endif
-	return NULL;
+	return esd;
 }
 
 /**
@@ -133,7 +127,6 @@ int efi_get_conf_table(struct boot_params *bp, unsigned long *cfg_tbl_pa,
 {
 	unsigned long sys_tbl_pa;
 	enum efi_type et;
-	int ret;
 
 	if (!cfg_tbl_pa || !cfg_tbl_len)
 		return -EINVAL;
@@ -149,7 +142,7 @@ int efi_get_conf_table(struct boot_params *bp, unsigned long *cfg_tbl_pa,
 		struct efi_setup_data *esd;
 
 		/* kexec provides an alternative EFI conf table, check for it. */
-		esd = get_kexec_setup_data(bp, et);
+		esd = get_kexec_setup_data(bp);
 
 		*cfg_tbl_pa = esd ? esd->tables : stbl->tables;
 		*cfg_tbl_len = stbl->nr_tables;
