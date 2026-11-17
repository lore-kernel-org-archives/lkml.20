Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890118;
	b=1uCjAqNYALoLZxo9o2mnah6ZxYO+sT7cY8RH9Q0qboL2+MTL4BZBjsFbAbPHgSAuM80A
	 PTe/++nhFg4HkmOpBhbWExvxqxtWpqIVligX9se1/l4LZkAhryqqRimXw+Lbc1MDt4SqR
	 L0Uz5ar8sJG5qY1ko0WjFBn+AKnsa5qDHcx4+GwhOmIm0eG3tqDXLUC8dZZqM+g3btGF6
	 pq1qoSEzfYBEcj25J6GCIc5+W2uy5cLLLpN67MjZfI7QdVGVg+PIRKojbQ9pCqkhDJD/J
	 jN92fWleL1+uOx6i4k2KbGApd0AQ5KU9Xfu/bi24mWyKB5XzyZmuZHSujfqpe4llCTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
	b=GMQ7adKAbtRY2c2RyVzzVr/cXmr29HbpBnEPWG3W6oM4OH5pVMZ6DCuw0EtWuln5S8yF
	 ebdeSmgk2JO44BLV2ngnXdgySv4ec5BJvrG7d329yJi6N0wJKmcjgJkIhCNiPAS2KLaXk
	 FISdEp6Gpkx9BgYCphjayn+evXt+MWQPhuOIFW0TYOvhixd8/Sz6VXdLEY57wanD+fDCK
	 4lPSOhhSeb2NTMoJOes/OAQ0JNAoCObHJmkYxyhPlCH1rPz+ZCYVNsYf5kbiM33AWzJIP
	 s9qp40L9vyveQ+RwIX15XMAFnDkXTRdD2R7wSItCQvZ+xKo2b2BPsSaMqVPGhfxX4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WCoq3akY;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8B60A2620
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC8B60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WCoq3akY
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1fbae872so26830135ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890117; x=1795494917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
        b=WCoq3akYRAP6Ivzb65Waa9CTV82p4veXdLecmsebPNG1Z9SUIXFQ4923lbNJVbmFsg
         vm4R3SM2zQXTfvqfCGvPrTcvS5vgMXfUKTpfl1PJHcfHemVZgKPAE0ivzjxgllUeIHsZ
         oKgNO5jq269k8A7ow34lTnYbwgLhE+GmKfqUX+w1B1w67IlF7biIE4PoE4gEmFn/Bz5/
         LPsg7QJPDuwDGrZyC0n+qrBpvb4+BUiHTEsVe2jEZGKMFBl6NvlzH45xD1UTlIoBydPV
         RnCf+huVJoHO6xI5F4kFkI7N2mXBZuirzBxCvPifO3tkLM3+2/q1JWAEuGOzuKzSv2Lq
         LULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890117; x=1795494917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
        b=Ffq0bCf4tp9VpGiVIwGbp81a/TaV0OxM2BMPtNh9uLz1u3kQweW7AYbr06UjiG7R2k
         L77V5TAchnLFGrZHoTZwDBTTl0I6lVCgJYg6FbQqoX3dO1pKgQw29VsLbjlG5RXP2IIY
         Nyh1tLtkLifaVqm/sa3AlFjIPP0p0yOZATmmZTcsYSn+QhxTr9humctiaL8q/w/5ExfQ
         qnPXJX/+/RWCIGTVTrJKJTmj/d/2kmd8Rh3CiD/QtcWicjgpzedjNg2XBWX6AgP/vgI2
         oiQcFcu2uNBTje99cRYePNoRFEB/G9jLPvI3k72yylVUtbhZuTnZ4D4cEMAjMeDgtW7b
         NSwg==
X-Forwarded-Encrypted: i=1; AL+hErH1P2YOAQ9oXB5puuLS7r4xX4i77JYHv+OiypkPyCzi2EaoxXEqrWUGeSdctbLrC3mIhyaJah4wE6HclHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u/U/rIAQMl2rsdyv1C+8XH01ceF0d6eqgsaDofQeZR8nagC4O
	+YgDr2TngNwFAEt79SqCLRP95Ns+QIiQJooVe/JlhNufw5F1Bin/+wUrhk79THwhlvyeh24PGhr
	3P8iVeQ0c4B0jkM5bql70C8B9gQ==
X-Received: from plbju12.prod.google.com ([2002:a17:903:428c:b0:2e8:44b9:5c18])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b50:b0:2ee:1f51:32ea with SMTP id d9443c01a7336-2ee1f513339mr100649615ad.25.1794890117329;
 Mon, 16 Nov 2026 20:35:17 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:59 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-8-dylanbhatch@google.com>
Subject: [RFC PATCH 07/12] scripts/sorttable: sort .lr_unwind_fde by start_offset
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Normalize the PC-relative start_offset word of each 8-byte struct lr_fde
entry in .lr_unwind_fde, qsort by virtual address, and denormalize back
to PC-relative offsets without modifying range_desc.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/sorttable.c | 50 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c42512..38495c39e404b 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -600,6 +600,37 @@ static void get_mcount_loc(struct elf_mcount_loc *emloc, Elf_Shdr *symtab_sec,
 static inline int parse_symbols(const char *fname) { return 0; }
 #endif
 
+static int compare_relative_table(const void *a, const void *b)
+{
+	int32_t av = (int32_t)elf_parser.r(a);
+	int32_t bv = (int32_t)elf_parser.r(b);
+
+	if (av < bv)
+		return -1;
+	if (av > bv)
+		return 1;
+	return 0;
+}
+
+static void sort_lr_unwind_fde(char *fde_image, int image_size)
+{
+	int i;
+
+	for (i = 0; i < image_size; i += 8) {
+		uint32_t *loc = (uint32_t *)(fde_image + i);
+
+		elf_parser.w(elf_parser.r(loc) + i, loc);
+	}
+
+	qsort(fde_image, image_size / 8, 8, compare_relative_table);
+
+	for (i = 0; i < image_size; i += 8) {
+		uint32_t *loc = (uint32_t *)(fde_image + i);
+
+		elf_parser.w(elf_parser.r(loc) - i, loc);
+	}
+}
+
 static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
@@ -609,6 +640,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	Elf_Shdr *strtab_sec = NULL;
 	Elf_Shdr *symtab_sec = NULL;
 	Elf_Shdr *extab_sec = NULL;
+	Elf_Shdr *lr_fde_sec = NULL;
 	Elf_Shdr *string_sec;
 	Elf_Sym *sym;
 	const Elf_Sym *symtab;
@@ -656,6 +688,8 @@ static int do_sort(Elf_Ehdr *ehdr,
 		idx = shdr_name(shdr);
 		if (!strcmp(secstrings + idx, "__ex_table"))
 			extab_sec = shdr;
+		if (!strcmp(secstrings + idx, ".lr_unwind_fde"))
+			lr_fde_sec = shdr;
 		if (!strcmp(secstrings + idx, ".symtab"))
 			symtab_sec = shdr;
 		if (!strcmp(secstrings + idx, ".strtab"))
@@ -759,6 +793,10 @@ static int do_sort(Elf_Ehdr *ehdr,
 		      extable_ent_size, compare_extable);
 	}
 
+	if (lr_fde_sec)
+		sort_lr_unwind_fde((char *)ehdr + shdr_offset(lr_fde_sec),
+				   shdr_size(lr_fde_sec));
+
 	/* find the flag main_extable_sort_needed */
 	sym_start = (void *)ehdr + shdr_offset(symtab_sec);
 	sym_end = sym_start + shdr_size(symtab_sec);
@@ -833,18 +871,6 @@ static int do_sort(Elf_Ehdr *ehdr,
 	return rc;
 }
 
-static int compare_relative_table(const void *a, const void *b)
-{
-	int32_t av = (int32_t)elf_parser.r(a);
-	int32_t bv = (int32_t)elf_parser.r(b);
-
-	if (av < bv)
-		return -1;
-	if (av > bv)
-		return 1;
-	return 0;
-}
-
 static void sort_relative_table(char *extab_image, int image_size)
 {
 	int i = 0;
-- 
2.56.0.679.gc527c65306-goog

