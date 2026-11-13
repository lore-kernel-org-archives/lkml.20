Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573119;
	b=NNkIDAmhrLmQCfleK6gTCbFfV+/ZoEHSrV3SzsbfvH28V8QZQiwXHtO+pnpVUCpdRyW0
	 dLOpw8nXjeswI3vW5f1cwnezImVYQZP1OkHuTQSVeDHE4CK6YqqsfRtBhkani5eYenf9a
	 vClMw1V6dRv/jItd8fib96X7y1hg0HGeB7W9uGndWmKcMqLZL3ewd7cSnfmb3pjUisMqr
	 2+r9j6wL6DoLsMaI63wA30H42Sd4SGtezpx8G7Q0cSYDb99DB07XDah9mxlN/LgrFZE33
	 mIhU3GleGFb0KAjyNuDy4pZ9mJkH5aE3D5UX0YxaJaFqF1jisakpxVZ2yGZ4XqPyomA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khvjomnGU8bEDjFqLljgS/oBqM+vVqEvr9qW8v1bN2k=;
	b=1vfIhFV1LrsX9iNkPqQ2GQcKePK4BwUym9T3YqdJaPFO3W8DEh0BBDnxBAjVYudMhhQC
	 bNMxucW0vUQyuSbHYeWnKNMStB//x47/PlVyXxPTkSDlKJRHkIJHtb4qyNHKJjrOGJA5t
	 /LtEqYW5UzDpSDdy47UwHq3Jkd8Xac3JtCum0fo3VbTnIGltoQqCZJaoy8HmJMXNnadOn
	 rSxMf3q+rVBGV3RdDtMZsUNCcNWO5l0oTVtpuf04vKe7RCkJBl7L/KeK6u4smRAiWffgw
	 koTbsdHtIkMHxtFbXb/78voOXq+Q5HhK6zXmjdNGTKGKapY9l8HKgmVxqqo2ZzV0bqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXjtWwGy;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876A606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C876A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXjtWwGy
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so993570c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794573118; x=1795177918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khvjomnGU8bEDjFqLljgS/oBqM+vVqEvr9qW8v1bN2k=;
        b=YXjtWwGyIIn15MoFAeE4EsmBB6p4IrPcNzVb7Cj6KLySsi1ikxZD3W8wpOk3lYg/Al
         A0arB96DVFMDfAaP8gQ18IZlkGVBP90m01vvqY6kJPYm+nne6SHjFyHs6ebEvzlSDcgF
         8JFgTPSrPa5HrLbt8jq/e1UKchNcqSYPKFfir4EN9FpECULj9IpjnxYCwMssJOcw4D68
         UU+0svEy7EmBn4HTEpFuj9QbNmxfEwACCRX2vvn22O7EErlgzXZ7A9HI+uu2KxHAIw3O
         Z0ZZVqPFCBGXx8z4jzyff0TmAxYGWaIN6gHI2Es/AupBjh973yBBI+AHSikknrGQHe5B
         xOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573118; x=1795177918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khvjomnGU8bEDjFqLljgS/oBqM+vVqEvr9qW8v1bN2k=;
        b=fXfPwopwNRO4RbNr1RDv15eIJm6ADNK92phD8RWZW+8MaE478wcGeRe1g8MuDgnbOz
         LlYGXcVmWsOT5h5NTvHW7MMKpOkmgmGHuXPBcW74vZFkzpxHkFDv6pB0yltwvZSrczDh
         Q06X2nnOaWxKDN5Qx1vfm8hthxWaUH8wUnSItne2wcccdKNK20JWgOZwjpgBa7Ay6HNJ
         9ufN2lebvq1fFUSA3d+WfRdJAdI0thVmccVNQF3V+sXy+wHwHD6MwFF19M7SFvAhcS0T
         QdOtkqhLAuejVBxJeN8WJ8LqcsWzMFeSKUR0LiEIrEQ2fl6CcxwwCbS8c+y8GHG+O0GP
         CVBQ==
X-Forwarded-Encrypted: i=1; AL+hErG+B725JbxEU1zt0ojd6NNQLHu0353loIDuSJ/Ggm2E36wKIH/Al8otHb6pwrN9IpHAHRgrzyljltOf8tA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vW8qj6mG+/+QMtSDvXVvungiDqwyrg3+x3By8hgTb+8XUtSO/
	DRC3Nni9vHh0/I9XTBqnYc+rKL3msdkOLhv6fNFSqJ7CkNhr7X+M2rtM
X-Gm-Gg: AYBFou3b0Go1yLh79l+BaZp/O5UhswTgpb2OMu0dQ6KWWeBi+Swc/QC6hva5VobbcA8
	IS2p1mDSaGikCFM/9ACGO2aF4hZMQvDGEvCjos7PHbWYoP6mtN2R+FUm1ipop5huNYnhiX8RTOO
	EzTOvRuVu2ajNsM/utAiTOkmToLfOR0DeaZ9ZU42y0uvBupo/5nXLkua94w6uElG58NzEuIS+Vj
	JZyqIfR4ClOfht33rBAdSzwvqwZfaxgCeTKYLwvgmrW7wrB6F7So3odycctyts1erCWhYraL83f
	omZLDrxoicwHIC6Yy8v0ZSh0R+POzl5H02w/6oAmk9yUd0EZnAAC0UmDjjnMIrvXBGsMmbQ8oGA
	A9xqOJO65nEECrfJQqCFeoGOPUjoZx0eBSx9hTicIWt9j5nCnvSryNvkYCwXUJyh8I6ItPEa2lJ
	6QJF9k47I57pPk1TLjwMjyG38e2JAxTJxE9lBY3F65kA9eSCCsPUNn1kie5xAeCs11piUiZrl7k
	yTO4bB7oBhKu6pkjjUB0IjzCKWThIrReCo8LjprQdi6MWwn5H4+Jme57BI7Q3YvQaY5aE2snD+i
	kwK7fR7N/+je3CzxOuCRNXVcYqACx6r01JA=
X-Received: by 2002:a05:701b:2519:b0:1b2:373c:997 with SMTP id a92af1059eb24-1b5031128damr2279412c88.25.1794573117837;
        Fri, 13 Nov 2026 04:31:57 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm7215936eec.10.2026.11.13.04.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:31:57 -0800 (PST)
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
Subject: [PATCHv2 1/3] powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
Date: Fri, 13 Nov 2026 18:01:36 +0530
Message-Id: <f75f2cf97f44375fd2c8820e0caeab703cdb371c.1794572365.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794572365.git.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com>
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
CHECK_WX default STRICT_KERNEL_RWX.

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
struct_modules_rwx_enabled(), while kprobes depenency on modules was
earlier removed via commit:
    7582b7be16d0 ("kprobes: remove dependency on CONFIG_MODULES")
Since the insn slots are only written with patch_instruction(), which
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

