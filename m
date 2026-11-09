Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228540;
	b=nNf9olnS2dFRFmam0Hc47hioBRVRpKNd3CTQMO9s7ASPMfJA7NjqqQ2n1LCcdMZIDedD
	 4sVKc8W1MCH+Ge/tOIqTCXU/k4eMUBqnJMhRUSBm3VBdL99109foiFX8GczxKGYnn2lfy
	 eEsq4/9HRJTd1vhmuFkNPBRB/hOetT59G5ypP4/Dpew1CqtukxDy2v4tq3HBMRz857Igq
	 tIssCzoKz5UJM4x50XB3mx9E53emI2+Lp2BGqET+PNN28GokGSaLNXOLZ2ut0d6M8wCqe
	 8wst1M3+akJ+UMhZ5ucezQVyorhkkv5aWPRHtPrKOdkUDOIkvyHKN87sLTgMhrQJyRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228540;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=LWwqugR4e9DRn+gY3WZafaAZgAGJVlJP5AvR5oaP+Xw=;
	b=THCzPj7wHHlDkaG8jti5vRPhn6/vUnYTVMRkdUhxJ+//m7quqSJdSLhUDfoA8ZRSkFRu
	 bFuo3zfeP/CJoQjFKySBaxvASja556IkR6N0PTilR9fa8xfyOXoUnu203OHIj5hlWfV2s
	 LJdkHAv1aEHrBEYKDjRP+JNiL2gdqn4Qc+5dYPc7Hb05M19AUs0vebQWIIs4+b42vzu/h
	 zvJggb8IER4HbEDs2MHhwtnUFtMiiE7Bla0lUOb0D3i3RJ4cNuF1d7xcickI0ZHFMZmLM
	 tlVb3VPcXMNizR30JoQa513OkTRS8Jt2uSiOQefV4u93WWs6q7xVN+iGr/ChpMY/88g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xen4EoJc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A00606D811
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xen4EoJc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A361F008A1;
	Mon,  9 Nov 2026 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228539;
	bh=LWwqugR4e9DRn+gY3WZafaAZgAGJVlJP5AvR5oaP+Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xen4EoJcp/00OkJEeR7hisgDwRc7AsTT9ZOx6aB7UWim/SArXbjtRHCNU0AyH9B+3
	 E+P2hh/FSZlzbSp833crVPcNLhXYPleRh3ZnRydqWXMe5LsKLaPG2pumzEH3F8CgAh
	 0AFBOV+zDvjZULtD6GBV8cTwS1nZick6n9gpueC0InzF976xx7opqqz1upImbOLiPm
	 59y7haUPAvi7XlfWdg5KTNeSDyRlrOI1B9YyRBSa3980JGi5ifl/t1cgu1CdjZC2MK
	 zbL6JcPRlLOMyAu7vBDXOCYMO02c96LcqC18OqKjS4NtNO2TS4DMdVHjbLx9emxT2S
	 a7etZvQEBsv0g==
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
Subject: [PATCH v4 1/4] x86/boot/compressed: Remove unused variables in EFI helpers
Date: Mon,  9 Nov 2026 13:48:18 +0100
Message-ID: <20261109124816.61438-7-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850; i=blum@kernel.org; h=from:subject; bh=UZpJ55fJR9Sdt3yIlM4OuBKiufuzYj3V6nB41UusnRk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfDwpNmTp/7u1Jz266bTGQ9q7yNU29puOese55ZbWcv prKozVpHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR9b4M/x0OLZoscyvnmMnJ HfN4NHxeLd6uZiRUUdS//f2vR+H3jsswMrxtbKl4fvfNgzkqz+u0Nz99wpb/3OlEZ9Wqp6zVItV XinkB
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

efi_get_system_table() declares an unused et variable, and
efi_get_conf_table() declares an unused ret variable - remove both.

get_kexec_setup_data() also takes an unused et argument. Drop the
argument and update the only caller in efi_get_conf_table().

Also simplify the no EFI system table case in efi_get_system_table() by
falling through to the existing return since sys_tbl_pa is already zero,
and add the missing newline to the debug log message.

Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/efi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/x86/boot/compressed/efi.c b/arch/x86/boot/compressed/efi.c
index f2e50f9758e6..f2d08e756e66 100644
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
-		debug_putstr("EFI system table not found.");
-		return 0;
-	}
+	if (!sys_tbl_pa)
+		debug_putstr("EFI system table not found.\n");
 
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
