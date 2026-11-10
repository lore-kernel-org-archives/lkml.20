Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269027;
	b=HjuStzvDFBWwdCtZxO2XeyrJE59G46Xwq2bQZjhDxjHq1LIc40NCVrPHKaWolozqNwy5
	 IlkleaK5L8ZQMpcYMSnPZJfg0sCqju6c7VsA3aRNn/zQ26ezb7bNytcwfBqsa64B0O2QH
	 S4eKhyWHV5JduuTVAnxIwqHDMXsgPTkZxGMFhLHfw/KORsoYPLeUUNqiwzZK4p8TuLe4D
	 oe87z6wroQFQi7Rq0BCpXZL7NMHE6vozftd2bDDn1qUN0J22Bt6U10OtS/b4IMC1A8Cr2
	 ZkJiievGZsfyvyrYFKpfWdM/hOekr6CYcKxLjoSPxqwfjAybNjhfRP4VQ2YoC1RMtXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qRWx6M+jYkJMNyYGPB8wr4U/904x6/bZv7J2hXdrjm0=;
	b=eTxwXqpad9D9zOVepD4qyEFn86tebEe5fygzI913elLkmJPyKSVVt4az/UmO/zHgvSD0
	 4BWSti88B/6WmaCbf7bXfXIQ/o9VFWxvj9FYIbbKwtASCtZCC5+0V5tTqsahuiDiq38iD
	 goNMLUbhsxH3c1pZKVrtbSHUIFb6/ABkOxNgeHAtw67DZjUZe3ZbaC7oElB5Au6FoAkmG
	 1PJYvmX3KgFX5/1uux6NZgJRtU+OYA2Zj9H9IO021ejFkP5pwZHcIMrRPu4963js4XlYX
	 JlbT+Z0oVGExMYOm8Qj9aa91J5EgLINcpV7YKcgN2P3IhqQ7nFQ6GlRFWjEanvmN/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8SV8DZz;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70EF60A2604
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70EF60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8SV8DZz
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-717034b331dso837557eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269026; x=1794873826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRWx6M+jYkJMNyYGPB8wr4U/904x6/bZv7J2hXdrjm0=;
        b=H8SV8DZzFQINAo/TgCYJcMD3Cp4XsBzuMofNQ6GbYDlxp4CrkPoMp5HWbOJTnmheAe
         q+KiRMAheigLs+bq6l6D73817QHnle6z0L5ePB65zuWLbZsPVi5/i3oTrEju01IAqYmv
         CNCJS2mGTQd7J0QhL4gQZP/ZFg7An/2VBHorAzAjqRxlTbYd5sOZ2l8I81XehL3R9iDt
         bMyz0EN4DNwXrhOTEJ5jQHEDvTr+uPMwJcp759IchfR0OMce6G7Pp3OGbigKyRGISO7/
         luL6syumiGph/HzsU4KTfeweBRxvaUSiE5v5JYyLNrirFpRvgZvnOmRBNOrn3n+oyFAs
         Sjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269026; x=1794873826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRWx6M+jYkJMNyYGPB8wr4U/904x6/bZv7J2hXdrjm0=;
        b=gEjqcXI3egQKlcTH0lrxJJkoj/ywFR9As5QjwFDqiLiLX9CYTofceORBkltl8HSrpe
         JHkUfYpzbqsuWe5lllTOLHtvNi77+tJ0Rno40SWA6dcah3k90/mhgvCzUTs3Y3ZdiMYg
         r0Ij45FyMnQeNkdQR0exfRtAEnJCnNaSRMv4IZZgtBSW7HNCe49qMbOWIszJHPJi02ft
         841d4QkUaI1GEBmUMDZVyI+wM9ELepiST13BV4AOfpT0R5VMmwBSjJuEh0/47aljD4vC
         RG8sVHaDqgcIZdbzhapTgDiMj6PvGYqUAKg5O12IkZcnzAOTQSragIejFNa/Sz8p2i9w
         7XYg==
X-Forwarded-Encrypted: i=1; AL+hErGG42nkRQITShOLPtI3y4HTG8rXjxuKfO0f95sNqI6HyqjZaFAwyLrvkzvKVGs2c93+rPYlU1GozK2ZUtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sx2hda5njV7d79OpQ5ERUR/4sslM/JC3QoVIpw4w67ztfV83P
	5trIEfsZoDKcZcMV34b2WdUgTyqGQtn1cehPRbxb0L+QbFsMbhUAR8Dv
X-Gm-Gg: AYBFou2s7fXOB7+LRTL6vNBYiXd2nvugMLpGnCrwo8Ey3X0+oOwBnXb34nMdATPA3Qo
	MlkviWvZLeBfYgJtvTleoomhtU/4YJb6ZyL/o+AgEd1KugCMJAnFGEF/EOXrLSCFiyqo4i+jB2R
	FvZVwAMiQTmRbASk/fj/PLM/2ijA+734hqBQHblLOrUG+HIWKBMWTFXTIpLLFJfALNSmWV1/JbQ
	ncK36DJ6hRS1XBbM+tZdfQQKFJmobxztkb08XxXmuZ9bGX44r3EXy89wIKIwNvpVjz2BdnCmwhE
	0+SX1FiLB8lDTNSVUa9Q4B7XOYAlkNwhSkPMGCEhhtrRIdMlUByiZkvG8OIW0ItoYk7HVkWvtSB
	jGkNkz4WAILht/RRPiMZosoMNVR3lrBYMqiwOCz7wfVQvTDhK24UsZbye2faBBn+iVEoeKeyTZH
	CFw/f4iQbYThgXDLLQCm6H17tF33xR0CZix1+3QzQkve8rvgwEU8SQp8f1knC1L5Uh20NEol4hg
	JQwxKSmDw27EjYoJ0uZkzrMOasAH3/+j7ajrhEVAU523ROaTLCJFfUt5xp6/V51yn4zZBgSauF5
	G5Ag7krpdu1qZ019Vuk4XoCeQJkZW+n10bRg/fJFV+XS8GvoWE+1cdxfUnhAjnI7
X-Received: by 2002:a05:6820:248c:b0:70b:9808:a78f with SMTP id 006d021491bc7-718a5a5b6aemr331840eaf.51.1794269025678;
        Mon, 09 Nov 2026 16:03:45 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:44 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 2/3] objtool/LoongArch: Move the cfi->regs access after the NULL check
Date: Mon,  9 Nov 2026 18:02:54 -0600
Message-Id: <20261110000255.1720945-3-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000255.1720945-1-lzsx618@gmail.com>
References: <20261110000255.1720945-1-lzsx618@gmail.com>
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

init_orc_entry() takes &cfi->regs[CFI_FP] and &cfi->regs[CFI_RA] before
it checks whether cfi is NULL, although a NULL cfi is an expected case
(unreachable nops/traps and STACK_FRAME_NON_STANDARD functions, as the
comment right below says).

Forming a member address through a NULL pointer is undefined behaviour,
and it lets the compiler assume cfi != NULL and drop the check that
follows.  The x86 copy of this function has the same problem, and UBSan
reports it there on every defconfig build.

Take the addresses only after the NULL check.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 3c7266cd7bc5 ("objtool/LoongArch: Enable orc to be built")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/objtool/arch/loongarch/orc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/loongarch/orc.c b/tools/objtool/arch/loongarch/orc.c
index ffd3a3c858ae..960b59d5e566 100644
--- a/tools/objtool/arch/loongarch/orc.c
+++ b/tools/objtool/arch/loongarch/orc.c
@@ -8,8 +8,7 @@
 
 int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruction *insn)
 {
-	struct cfi_reg *fp = &cfi->regs[CFI_FP];
-	struct cfi_reg *ra = &cfi->regs[CFI_RA];
+	struct cfi_reg *fp, *ra;
 
 	memset(orc, 0, sizeof(*orc));
 
@@ -23,6 +22,9 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		return 0;
 	}
 
+	fp = &cfi->regs[CFI_FP];
+	ra = &cfi->regs[CFI_RA];
+
 	switch (cfi->type) {
 	case UNWIND_HINT_TYPE_UNDEFINED:
 		orc->type = ORC_TYPE_UNDEFINED;
-- 
2.34.1

