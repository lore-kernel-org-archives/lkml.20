Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F62F851
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368217; cv=none; b=mM4uaXap5tEL4URWFddbp1svGlJU4bphMNgkknKg5v8qeh131F3/tNk/zAzEAXpioevxU391gVfoc+/azZ7mTJCw8lLr/DylFzMCj9SqQLgmJPMRX1xmPqBWlIB1gl0SNPQpHYn0WW4LoSiGl0fH9tucI+G5IrJnzS4GSoS+ssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368217; c=relaxed/simple;
	bh=73uWpbvEDBoACUq7Odhn9clI0Trz49FOBBXK3ymxwTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=neJGlno5T5TtfIuc1Lx2YGdQqrHiexnwPx6AghhwdHcbI8S4LBv7qxumM3VwwOCj38XSCiPneVS1/x06SOXWx4epMDVFfaLOCSHhF+OfX05Stg8G+Rw09Eireck2GKiXN5YKwCvKfL5uhp4kRz4iqfafc69e7m8znplmoS2wRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifW7WriX; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifW7WriX"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4c382ece86fso1025136b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368215; x=1792973015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLbANC7yHOqWDkO1YOnNbqYc7ATTfZdChVSztjrd7+0=;
        b=ifW7WriXNW1MOzsfsQ34482aLLw+JMTmhqHfe1P3OdP1kzAN+moFN/k+RnLtFxEqBZ
         othkczpmDhi6w7+KqMYRnfkd0LGv7dgg48NqWN7CHq1l6NOWtAWzyBY3LO7xyvD/pBsl
         cMh5xN2Kf2kDgtYfcmCkBGWl1yD0Gh7Dbiv075uswt3xRYi5JngR+NF9+XpOq6EpbcJe
         tI+BJ6/X5ISL+hYXjAqR97ZMr3oNsaw7dHmG46wXzOmc4GK2lvwL8xsOz4oNDlqFhozi
         qwYc7z18WlZsUtUVKqkHASBDNIOB7RIrKDfdo6aKJYnBUfuW6P/m4XBinR8aHG1wZTOr
         jbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368215; x=1792973015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLbANC7yHOqWDkO1YOnNbqYc7ATTfZdChVSztjrd7+0=;
        b=VWexMfVAq8K4qwoTRk1DpM4jCSnwv1AjojUrU5wX55T4eltmFv+xRxECsA1ABu599l
         aPVp8OggY7Tiws2znr9Eqgq8aCZEan+yeCY64UwG3lM3VEV55SJGigRA82fQ5IoyLNht
         hRr9vnNaiPXXIH/BWmZ+dJRjXLM+bomYYgvciNeOHJ+OFi+PpJieLFojamsOoFNn3thW
         io4Bvzjgg1K7FakTAMIQaOmxm+8qM3Ro1DEYFzC2kSNHPFWZMYRYu7eH/RimZYjprDbf
         5y8gZ3u0JSE2bs9OpTEN/5R7vAF3syfZv0HOhIQCWNtxZ3MVWhmMqM8TAOX6FwIeeIlx
         Xu5g==
X-Forwarded-Encrypted: i=1; AKwUvBzjdYVd85VSyOiXXuhLqEuV6aGaLneByc7l5ST6BCTTC+IrNUz6kJGFF85/4ejtphbTs5X89lLsV4zw53w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBI5Xny+Vi86E9kqsdTa1cnSOSBYfSborYllCtWlc0+cs1wPhV
	35VOIq/8uC3VE8pUlf1Ma0eGjy+Sx/LvzDpq4xDp/yEuTuJi8i9AMZ91
X-Gm-Gg: AYBFou3nL+vKY97IvywIRz6h70nOJlAs7sTJ14r1FnmKu2N6YHpjGthX9a7PXQS5iTl
	kZILDKx/0Hqbl828vYM1/SVxn+nm3Boboedk58nd4M0r0u5hGN3lUjLAM9+LSr+6MidlCFrkSFY
	a79k1ZAZE4oaJ5meWwaCN/VaJ34oWsmcT2ESILiUUKtoi41qQLjdwp/nedQUFRfQXl6NWL6f2hh
	2JWGdym1reDOQyutboJjMUfArbQroNzA5LiSFY6GhjD7WY8jPhejxNz4yIBho/dLxTy2p3a/Gs6
	snslayQlpLkpgJPQbxqc7y4wUw0Q02MsBLHBKyFR85/ixJ2Trr3FFT76B77aoYUbxwIStMQV054
	jw+iSQFUnnBPxgFv35lq/5oLOcBu+dtrAIQafBpjEZHkn1ZKTaQExdMaCMrMTk1ifRy/K7LKm7f
	f04s1htBTpz/08Wmu/Ox+OT9bv5j4hVZrxA/XqPlU2JGmpbwwcMqjnbjYZsFhOeNvMsNWrwjK1K
	BpS/Rm1EqzM
X-Received: by 2002:a05:6808:1917:b0:53a:e153:e8e6 with SMTP id 5614622812f47-53cd3bd3ff0mr4665731b6e.59.1792368214639;
        Sun, 18 Oct 2026 17:03:34 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:33 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 5/5] elf-parse: bound symbol names by the string table
Date: Sun, 18 Oct 2026 19:02:18 -0500
Message-Id: <20261019000218.3977398-6-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019000218.3977398-1-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

elf_read_symbols() builds every name as

	const char *name = elf->strtab + sym_name(sym);

st_name is a 32-bit field read from the file and nothing bounds it, so a
single symbol can point the name anywhere, and sysmap_omits() then reads
a string from there.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Reproducer, setting only st_name of one object symbol in an
otherwise valid vmlinux (symbol 2 of its symbol table here, the first
one whose type makes the name be read):

  ./kallsyms --sysmap=/dev/null t.elf
  ERROR: AddressSanitizer: SEGV on unknown address 0x7f54e308c740
    #0 in strncmp
    #1 in string_starts_with scripts/kallsyms.h:15
    #2 in sysmap_omits scripts/kallsyms-sysmap.c:104

Record the size of the string table in struct elf_file and check, in
elf_open_ro(), that the table is inside the mapping and ends in a NUL.
A name that starts inside such a table also ends inside it, so a single
offset comparison is then enough, which elf_symbol_name() does; symbols
whose name is out of range are skipped like the other uninteresting ones
rather than failing the build, keeping the behaviour for every object a
toolchain actually produces identical.

scripts/sorttable.c reads symbol names the same way from its own
mapping, through elf_map() rather than elf_open_ro(). That path looks to
have the same gap, but every input I built was rejected earlier for
missing ORC tables, so I have no reproducer for it and have left it
alone rather than guess.

This code is only in linux-next, from the "kbuild: significantly speed
up kernel builds" series, so there is no mainline commit to reference in
a Fixes tag.

Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c       | 21 ++++++++++++++++++---
 scripts/elf-parse.h       | 14 ++++++++++++++
 scripts/kallsyms-sysmap.c |  4 ++--
 3 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 756843c433ee..8083b9ec3477 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -300,7 +300,8 @@ static bool elf_symtab_out_of_range(const struct elf_file *elf)
 int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 {
 	Elf_Ehdr *ehdr;
-	Elf_Shdr *first;
+	Elf_Shdr *first, *strtab;
+	size_t stroff;
 	unsigned int shstrndx, i;
 
 	memset(elf, 0, sizeof(*elf));
@@ -355,8 +356,22 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 		elf_close(elf);
 		return -1;
 	}
-	elf->strtab = (const char *)elf->base +
-		      shdr_offset(elf_section(elf, shdr_link(elf->symtab)));
+	strtab = elf_section(elf, shdr_link(elf->symtab));
+	stroff = shdr_offset(strtab);
+	elf->strtab_size = shdr_size(strtab);
+	elf->strtab = (const char *)elf->base + stroff;
+	/*
+	 * Symbol names are read by offset into this table, so it has to be
+	 * inside the mapping and has to end in a NUL for a name that starts
+	 * inside it to end inside it as well.
+	 */
+	if (stroff > elf->size || elf->size - stroff < elf->strtab_size ||
+	    !elf->strtab_size || elf->strtab[elf->strtab_size - 1]) {
+		fprintf(stderr, "%s: symbol string table out of range\n",
+			fname);
+		elf_close(elf);
+		return -1;
+	}
 	elf->nr_syms = shdr_size(elf->symtab) / shdr_entsize(elf->symtab);
 
 	return 0;
diff --git a/scripts/elf-parse.h b/scripts/elf-parse.h
index c5ad754da254..548c80ead2bf 100644
--- a/scripts/elf-parse.h
+++ b/scripts/elf-parse.h
@@ -330,6 +330,7 @@ struct elf_file {
 	const char *shstrtab;
 	Elf_Shdr *symtab;
 	const char *strtab;
+	size_t strtab_size;
 	size_t nr_syms;
 };
 
@@ -356,4 +357,17 @@ static inline Elf_Sym *elf_symbol(const struct elf_file *elf, size_t index)
 			   index * shdr_entsize(elf->symtab));
 }
 
+/*
+ * The name of a symbol, or NULL when st_name points outside the string table.
+ * elf_open_ro() has checked that the table is inside the mapping and ends in a
+ * NUL, so a name that starts inside it also ends inside it.
+ */
+static inline const char *elf_symbol_name(const struct elf_file *elf,
+					  Elf_Sym *sym)
+{
+	size_t offset = sym_name(sym);
+
+	return offset < elf->strtab_size ? elf->strtab + offset : NULL;
+}
+
 #endif /* _SCRIPTS_ELF_PARSE_H */
diff --git a/scripts/kallsyms-sysmap.c b/scripts/kallsyms-sysmap.c
index a482968eba51..efca13ab9dc3 100644
--- a/scripts/kallsyms-sysmap.c
+++ b/scripts/kallsyms-sysmap.c
@@ -198,10 +198,10 @@ static struct sysmap_symbol *elf_read_symbols(const struct elf_file *elf,
 
 	for (i = 1; i < elf->nr_syms; i++) {
 		Elf_Sym *sym = elf_symbol(elf, i);
-		const char *name = elf->strtab + sym_name(sym);
+		const char *name = elf_symbol_name(elf, sym);
 		char type = elf_symbol_type(elf, sym);
 
-		if (!type || sysmap_omits(name, type))
+		if (!name || !type || sysmap_omits(name, type))
 			continue;
 
 		syms[n].addr = sym_value(sym);
-- 
2.34.1

