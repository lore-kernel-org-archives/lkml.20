Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311886;
	b=LjpIW1OyA4U5DU8l2ieT9ekPDbV6OXDrPIRWD7gG0F85vwB5lz68Knrw308kuuHlt53l
	 DWVsX+RZ3dzF2ZstEkdiAe2u/ExhsrJ//XL4BRcOXjR4T9OaXT3PrnbAs/Pwu8Xt1Yag+
	 UUIMdi6DpXCSFq2w5IZqNZNhH+wd8pRm74PbFSQ8wgzrSW2KDI43dqfGBRSbcgCAxtKie
	 E1R+7P92F915YwEYhEUT87aKgRo+W93c1QaNseOVKvhSPWBFQCkOxouapG1yqph6R8wNJ
	 Vzlc7JzYdt7AQQPmk8MkzCaABdjpqaOVUpS5Ar2iRTUMFOFUtKlQgS/3q+6UbXw7aig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311886;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=ZP/hSzi/KoimNMFmRtfMUHqtLSy24j6zz2LS+zAG5gU=;
	b=IMkd0tvsQI4xVQ0rq+T+yV1YIUNddGf7plmhWyn+qA30PP7CflVMM5aA/v6s3Qs2sWbV
	 YShO9DC/ICdvFNQ94weviiDZiAXh3nsN42vFv0z3fNx2u9KMCpcb8JHiwt9SqsB/bQEa9
	 AMUOmcNaoDNT1azApG3YF2cKuZ7VMQgJLHlMqgyesQ64nFcqcvNcvXAYuMZE+RnZM5jd5
	 vKfLiPkNPLYP9YNYT7Mx6i8KEO9YoCwn9VbjJddmgm3Pbl9b2gPSUEFvG7ZtXyPKI1uBx
	 lU3TCghB9cBxSDsHEvpBEtgH9ydBfw0ZJkQfCaI4A1kC5lKYesgUvahRN0HRiaU+csQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nvbmGNco;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A5D606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nvbmGNco
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132881F008A7;
	Tue, 10 Nov 2026 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311886;
	bh=ZP/hSzi/KoimNMFmRtfMUHqtLSy24j6zz2LS+zAG5gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nvbmGNcoPdfmmaUcpadgjQsP2q9H+sG8lgeUl6aEY/ZvwfKU6P11CSe+kKqx3zfmb
	 MbLqVmkA58zNAttSFUwTBbdfO9Ueg8qPLJo0itrQ4GOdJSCYfLQPaiqNHmaYFmhih7
	 RSd6jUXASmLkH0WKT5dMTMxYCpAPmYh4V3RaGOLziQro8yiCIzxw5WrogIexqJsmty
	 yCTHg7TxjlgibybB3QTVRAzdzstelJFWo3cblXE/s/SNV2q9EklwBmgYmZwClmQQEi
	 ndcUwCKw+uOnLT4QbS920F39Sp10hWjo5oBF6MwqZf5yCoKNiV+sb8EDEwUsmjQJsS
	 SnStYBopEQnNw==
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
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v5 1/4] x86/boot/compressed: Remove unused variables in EFI helpers
Date: Tue, 10 Nov 2026 12:56:08 +0100
Message-ID: <20261110115606.133611-7-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645; i=blum@kernel.org; h=from:subject; bh=st0CO4F9Ll95pNsSc08xfcJV37lSLqKrXfQTkhAt5Ng=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmf2ZKjbDIu7jsbd7Wtw/L4X8mdp27PvLJo25OejOjwN x/DP23Y01HKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQAT2ajFyLA//nrwK1EdsSOT b/wxVRVJ/ednvaKkhSf72lfpF23Wn14z/BUSU06yZlXyu1KydoqZtebcislLTVMDBCZl/vz+7WZ 8EisA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

efi_get_system_table() declares an unused et variable, and
efi_get_conf_table() declares an unused ret variable - remove both.

get_kexec_setup_data() also takes an unused et argument. Drop the
argument and update the only caller in efi_get_conf_table().

Also add the missing newline to the debug log message.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/efi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/boot/compressed/efi.c b/arch/x86/boot/compressed/efi.c
index f2e50f9758e6..39c153b895e6 100644
--- a/arch/x86/boot/compressed/efi.c
+++ b/arch/x86/boot/compressed/efi.c
@@ -61,7 +61,6 @@ unsigned long efi_get_system_table(struct boot_params *bp)
 {
 	unsigned long sys_tbl_pa;
 	struct efi_info *ei;
-	enum efi_type et;
 
 	/* Get systab from boot params. */
 	ei = &bp->efi_info;
@@ -71,7 +70,7 @@ unsigned long efi_get_system_table(struct boot_params *bp)
 	sys_tbl_pa = ei->efi_systab;
 #endif
 	if (!sys_tbl_pa) {
-		debug_putstr("EFI system table not found.");
+		debug_putstr("EFI system table not found.\n");
 		return 0;
 	}
 
@@ -84,11 +83,10 @@ unsigned long efi_get_system_table(struct boot_params *bp)
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
 
@@ -112,10 +110,8 @@ static struct efi_setup_data *get_kexec_setup_data(struct boot_params *bp,
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
@@ -133,7 +129,6 @@ int efi_get_conf_table(struct boot_params *bp, unsigned long *cfg_tbl_pa,
 {
 	unsigned long sys_tbl_pa;
 	enum efi_type et;
-	int ret;
 
 	if (!cfg_tbl_pa || !cfg_tbl_len)
 		return -EINVAL;
@@ -149,7 +144,7 @@ int efi_get_conf_table(struct boot_params *bp, unsigned long *cfg_tbl_pa,
 		struct efi_setup_data *esd;
 
 		/* kexec provides an alternative EFI conf table, check for it. */
-		esd = get_kexec_setup_data(bp, et);
+		esd = get_kexec_setup_data(bp);
 
 		*cfg_tbl_pa = esd ? esd->tables : stbl->tables;
 		*cfg_tbl_len = stbl->nr_tables;
