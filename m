Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467B383323;
	Tue,  8 Sep 2026 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853409; cv=none; b=uuoxynuhmRUoQVBnbjOQ6y6nwqBL3lyhnYv0rAjMAwByLkWBZMaJc+QsTKCyYrpiIZNUJlOPq3z/Fd0Pul8ERG6tePVb0JTPu1skjKGcx1rpYebZLV69tRWt4zer+xH4/mwVJjEPKSOTtIRfpE7T3BxJIj0qlp6hvi3d0TAZIJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853409; c=relaxed/simple;
	bh=AV0SBDLJnk3JheMZXs+WPaHGPdVbCfiKv+YThdRrj2g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WOd2cm4BfiNjyCq2E0yILb7PnL3E/zOj1guuSws/OdNIt8MNSi0yuIQCzWPQj33euKp/3kJlmrccSH4qAkGn8fx1GiIsQTaqH7jok5jN/Wpe89CcbDsyQFZAii6Owm+Y0J6gxv6Zb/FVa/0o2um2HYrRhNhD6RLq0UUyoM1mXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R47wSqnn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pkDkcE1V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R47wSqnn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pkDkcE1V"
Date: Tue, 08 Sep 2026 07:43:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788853406;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kdc3TDzo5FjgqxbN34pbNuIw+fWYpRRJWOoFhXFaVs=;
	b=R47wSqnnDC1GfvPOupuP07EW2M24CqF/4+VzHSB9iLMwdcodEfm2p2qjbnKqnh6XKh21Q7
	o0iRqP/YPionEI6tsU5PAeeVZxuAg2fC+BLwbAgH0lU75siq+Z22wrJ+GryS2ZEwU1dWAl
	SY8bGProHvkgcxtfUEEpa5YkjPa2jZb2foVkBnOmpwUrZVkhUx9uGPpW4zxV+VYf2JTqsz
	YftjMlQHDCXaqOX90ZX+xEoo5FnVop8/gnpD6PezOY5TxUdqBgYiniMq6rgCwRuWHojxF6
	SG8atwV7HPwVq7S2phwE0PAHWD50QLtV7E/k/wOlTblX5OGtI0wMTfHQRp1r8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788853406;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/kdc3TDzo5FjgqxbN34pbNuIw+fWYpRRJWOoFhXFaVs=;
	b=pkDkcE1VYmYnm2mgs0ttsiGSIDKu8dEsdaBUcYb47lByTJCV9hAzOWjpZAzK7QbKV/TUh3
	KLkItbg+r4vbezCA==
From: "tip-bot2 for Josh Poimboeuf" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/urgent] objtool/klp: Fix checksums for constant pool references
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <f3a9e74ceebc6475ce94bcfe985401140857814a.1787939301.git.jpoimboe@kernel.org>
References:
 <f3a9e74ceebc6475ce94bcfe985401140857814a.1787939301.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178885340472.623050.8643228029598054357.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/urgent branch of tip:

Commit-ID:     ac323c9467092479dc1e5bc138c9abbe015b0069
Gitweb:        https://git.kernel.org/tip/ac323c9467092479dc1e5bc138c9abbe015=
b0069
Author:        Josh Poimboeuf <jpoimboe@kernel.org>
AuthorDate:    Fri, 28 Aug 2026 10:48:50 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Mon, 31 Aug 2026 17:50:16 -07:00

objtool/klp: Fix checksums for constant pool references

Adding a line of code to __link_shadow_page() with a literal string
causes a false positive changed function with GCC:

  arch/x86/kvm/kvm.ko.o: changed function: kvm_tdp_mmu_map_private_pfn

While the patch only touched __link_shadow_page(), the string addition
triggered a rename of .LC64 -> .LC65 in kvm_tdp_mmu_map_private_pfn()
even though the underlying referenced constant data didn't change.

So for .LC* symbols, the suffix is arbitrary but the data isn't.  Add
the underlying data to the checksum calculation rather than the symbol
name.

Clang also uses .LC* symbols, but also uses anonymous data.  Both
compilers put this data in .rodata.cst<num> sections.

Fixes: 0d83da43b1e1 ("objtool/klp: Add --checksum option to generate per-func=
tion checksums")
Link: https://patch.msgid.link/f3a9e74ceebc6475ce94bcfe985401140857814a.17879=
39301.git.jpoimboe@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/klp-checksum.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/objtool/klp-checksum.c b/tools/objtool/klp-checksum.c
index b8e47f2..ebe25f9 100644
--- a/tools/objtool/klp-checksum.c
+++ b/tools/objtool/klp-checksum.c
@@ -54,6 +54,19 @@ static int checksum_debug_init(struct objtool_file *file)
 	return 0;
 }
=20
+/*
+ * Detect a reference to anonymous constant pool data which the compiler pla=
ces
+ * in .rodata.cst<num> and which either has an .LC<num> symbol associated wi=
th
+ * it or (with Clang) no symbol at all.  These are typically initializers for
+ * local function stack data, so they're considered part of the function rat=
her
+ * than data per se.
+ */
+static bool is_anonymous_const_data(struct symbol *sym)
+{
+	return strstarts(sym->sec->name, ".rodata.cst") &&
+	       (is_sec_sym(sym) || strstarts(sym->name, ".LC"));
+}
+
 static void checksum_update_insn(struct objtool_file *file, struct symbol *f=
unc,
 				 struct instruction *insn)
 {
@@ -129,6 +142,14 @@ static void checksum_update_insn(struct objtool_file *fi=
le, struct symbol *func,
 		goto alts;
 	}
=20
+	if (is_anonymous_const_data(sym)) {
+		void *cst;
+
+		cst =3D sym->sec->data->d_buf + sym->offset + offset;
+		__checksum_update_insn(func, insn, cst, sym->sec->sh.sh_entsize);
+		goto alts;
+	}
+
 	if (is_sec_sym(sym)) {
 		sym =3D find_symbol_containing(reloc->sym->sec, offset);
 		if (!sym)
