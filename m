Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544236;
	b=5e+7xQI3DOE73fKKWdwUqkFWOzVIRFXNubb+KklmY+eRQSBnoPNO/ggiYfw/OYoQnN/a
	 6bxg0cdKNLemyyu7chwflhOzMwLTS72siVaXPFxsEvRV/qeBS8+z588EPPIaCXZuAUqky
	 Q7YPt+p+JgGHDT3p9CxzGiR83tOqTl1kBCXUDe7viqdjs4JonjItSeNjwfMYk6wyO5/xB
	 cJ+hFceDuU6btCTOioXPbVUJHnmh2PcOgv6PJDWgYgWIfYgq9eCe0cOniFYcqPTm76krb
	 BlAUOXsfJyFe0Aefh1oxW62eCm3rVxYTpGyHn/XGeV9jOE9L4BETszyKqYY9J7PsA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WVayaF79KuqXR5beczcnmlbf6rAuqOBk9ycmEbTKdrk=;
	b=RqwMoDD/uoxRYXu8sA2nkiXWfl51DqmY5WuONwV4g3Eu53gjS9g1bLR6ogBypCJDTWqM
	 7ZcHPH1/ukVpBc6YOhnqskLc0mom4OnXM138IXpdP3ev2RgeNk/lXMlrWiyiU/K08WDk0
	 Vf0TqGSJjuT8BYjupWBpsXHhp1NMS/RjLVJEixTRM8s+LiBMCCdWBmI97mDONC8VVX8Ne
	 1ArKRWHsaPENl8noWZ0eOeAihxyFxxoRo9mxxKBZcCLwimOHLSsdI9qw70REgRNq9ggj6
	 zada6/Eja9ggrRqN7vsMe8NqpKOytWKQKHgb7NbHaaUpD4/1fb1fK20ePHzUWkY053A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RW2HUODL;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C03D606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C03D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RW2HUODL
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso528815c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544235; x=1795149035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVayaF79KuqXR5beczcnmlbf6rAuqOBk9ycmEbTKdrk=;
        b=RW2HUODLLmEUTVTZupq141E/3vddizN43ENZbU8B/QgUTOzALmpshsThpMo0x+fKND
         nT6HS4qXat0fEjkScpiix2OPvSUNVPAqjzMPorVOQU0efTGtWCQbinIbPmgx37PWSh8E
         DmBmLIMtJNVjriNeU8U+sdTVzZNielcp1w/vFgM1WDnaNI5VsHZ6aHfBdBunmqmBLywf
         GBaCb8jU/QlG1pr7ocYZ/lG43KzRPzKhUOCNgvYG9Ls7H0VJnYQuPtHRP7vsSdmZEiwy
         +CAiwzy825EJ5An5sTz5z9PLbiTwomPEP3ESxcBgL7gBCmQGJQpK4W6mR59YtdlPyJX4
         mpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544235; x=1795149035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVayaF79KuqXR5beczcnmlbf6rAuqOBk9ycmEbTKdrk=;
        b=bXdcQ5ctA0ADk0K91+9Gbm7ocjvwXh/JCmU+v9DKKN8JSbLeMoIf7UCCYgIGAjA1hV
         9DKfrhGeh9ZiErqx/HIHJhValeGT+IlLTYBcwLT2SBtTzqFYKHb6FWfg+HHcCRcEAxQ2
         sdoan1QU7dLb5c1SRVo6P/JzKTKYYSBF0VPoNN7pGUyyuOPX0qaEgVfvqPaSQ5hAqISR
         hDGNbHwWRs++E5+mKIjzqFc5T7/UKuc8cKToLmyEC89PwzlQaZJL5L2azuAUXd4xSCmc
         X0ZzWtZOimx49ej3aCSTfuzMb0UxAIddm9ruqCNV/nbZXbtfLJA7wmtGltlZll/U9eW7
         mTSQ==
X-Forwarded-Encrypted: i=1; AL+hErG8EhFGDJGdHZ8TbrLk5QXkwCKkXqzrblngNZKPaVIzRHsnb2zQHO7AMV6j7AboTLcajbZb9KB3y1LoUWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yYVs6DxiLsT8wwienuwGm6L0EBa3nWlI7h699vHtuuomrwzJx
	jozuVu7WWcIF3t3I9VjblrSQAuYy5AS8f+GUkrhxWZwteF5KpNA5QeNE
X-Gm-Gg: AYBFou33i7l7NCsjoSNgam6LJ0k8vWg78qtTDzfA3fNyPKdbnBhJWOYou7f+4x3sgUE
	tIS8jc4AKno+45otvI3sHzeBJPACPV3+/BPDkTrutQn++0UPf76sYQBqeTMzjocrkPfkIwjoxsz
	pBKYT2QNghTev3rqKKyokqk8ASJ21ohZRDkmBj495PFSA8RhzrvAEb/2OiGAmAL89uAThPqQri6
	+vA+eHbv6ZSqDB64p5KiIQhS63AeXt+P7SFK9gRpmraA9mWpa2bAayE17dGrmY9fv48G2V1uoUz
	yMIzIiTEMYqPNLsOyEFTqLkliVHAYERPK9e0Jn3Br3+1ZAT5SSICntvRUbin6jGLsIKQ155rl2f
	Dd1QHJwa1jy89RWKTKYfDWCWbvpmcJnqSWiUtuuu97iew+bZQ4/rx/LpTQs6GsWJqiW3gNrAjx7
	frgohp+8lfeeNa7o9wUTygDf0Vsl9YiGv/KGir/0t5sF5ZKi9DaohLXcWRKz/IKEjfXG/ZJh6XW
	yYHuikbcATJ2DLCh15MFkPrty4O79NJ72OiXNgKL/LVQ5F72Zlf4I2ERslN/IS9Kuq/vE5E/zPu
	DfwaFPdFRXwOdmKlNet4amVV1kBkJ8x2/Q==
X-Received: by 2002:a05:7022:ea24:b0:1a9:e382:cedc with SMTP id a92af1059eb24-1b5030fb905mr1774050c88.46.1794544234918;
        Thu, 12 Nov 2026 20:30:34 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm4473106c88.5.2026.11.12.20.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:30:34 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
Date: Fri, 13 Nov 2026 10:00:24 +0530
Message-Id: <ed03d290d440d579a81ae0b7de5243721291d903.1794543909.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 2e83e2ce34ff ("arch, mm: promote DEBUG_WX to CHECK_WX"), made
CHECK_WX default enabled if STRICT_KERNEL_RWX is enabled.

Now on powerpc, when we boot with CONFIG_KPROBES=y and CONFIG_MODULES=n,
we can see the following warning splat at boot:

    powerpc/mm: Found insecure W+X mapping at address 000000002ea08992/0xc008000000000000
    WARNING: arch/powerpc/mm/ptdump/ptdump.c:194 at note_page+0x4dc/0x4fc, CPU#0: swapper/0/1
    NIP [c0000000000ac204] note_page+0x4dc/0x4fc
    LR [c0000000000ac200] note_page+0x4d8/0x4fc
    Call Trace:
     note_page+0x4d8/0x4fc (unreliable)
     ptdump_pte_entry+0x70/0x94
     walk_pte_range_inner+0x15c/0x260
     walk_pgd_range+0x6d8/0xd5c
     walk_page_range_debug+0xa4/0xf0
     ptdump_walk_pgd+0xec/0x304
     ptdump_check_wx+0xd8/0x154
     kernel_init+0x94/0x26c
     ret_from_kernel_user_thread+0x14/0x1c
    Checked W+X mappings: FAILED, 1 W+X pages found

This happens because CHECK_WX noted a writeable + executable mapping.

This happens because execmem_arch_setup(), checks for
struct_modules_rwx_enabled() to decide between PAGE_KERNEL_ROX v/s
PAGE_KERNEL_EXEC prot, whereas kprobes depenency on modules was earlier removed
via commit:
    7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
Now, the insn slots are only written with patch_instruction(), which
does not need this mapping to be writable. This patch fixes it by
checking for strict_kernel_rwx_enabled() instead.

Fixes: 7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index b617b69452cd..77b63b52d8f2 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -388,7 +388,7 @@ static void prealloc_execmem_pgtable(void) { }

 struct execmem_info __init *execmem_arch_setup(void)
 {
-	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+	pgprot_t kprobes_prot = strict_kernel_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long fallback_start = 0, fallback_end = 0;
 	unsigned long start, end;
--
2.39.5

