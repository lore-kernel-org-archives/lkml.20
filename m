Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799187;
	b=YNiPW0P2hn3GI9frEAdmPCZISWzKqGtBexKr9ucWaeihHTj8GS779TOU/JSarf5PbTp5
	 NwnW+IwulDXmurDexggZu8EdUiY3oaKo/JC8JLI0G4V1ELA6jWoJwscS7v7gklcFxdex/
	 Ko/8SEVRXcoDUO87UnENbIZtO96M8mA18rcRjjx7uIH4haymgqe2lFaxU8IuLHofbZmUe
	 6SxHQRKZoNhdbDBbwJnlkwbfJy3H5yUldN/ogFoPJnZKU1xEIXVOGxsftzZ8TW9MuLNpf
	 /0SJ+fl7bbRwiOPEPz8/JXAc8l8jaUDDohUOol515ZI9p5F9kHxI0UveaDAmEtqRW3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZKK8ogIigAwbu6aj9RHAOLGoDBejAMO+iSP8oypaMds=;
	b=nLo7TxjXOYfkhWvoT12xkiJ6yRMFm5DJfyV646LOsk+dwhDhfkl4NQHsRItydgBgsOAY
	 1vXmaqv065FUj2tOPG8AIuXvU9pQa4vxq+xUEFvi1ay5tegj/cAxLENcaHURxLPTYr1hV
	 +RSqW2iaz07tsD1MpwPDBKaJPyjq+sBneQs9BC8HtgaoDCQJ1hw+IwyI9iRlCvtpLKS5S
	 MlxRbBi2j3dNBYZBw6VT2DCZWGrjwamnn7BytInCic/FJmLHCfqTLdrDx+AAG7m3SogGT
	 0YKRoL56VMwcHVfqcJZZvfFfGiPp4bNx6a9LhqEoKVWf/NX62p+oOvJt4Bp1EemzY4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8UuXzsD;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FA606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7FA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8UuXzsD
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc502d509c0so291925a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799186; x=1794403986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKK8ogIigAwbu6aj9RHAOLGoDBejAMO+iSP8oypaMds=;
        b=L8UuXzsD8Xv64zZJ9+Z5jXXKybyicX6vsI6Xol7vMbnaucBI3jxP8az883sTeFGTH6
         iVlOwUqq9dvxKMspisWmHgzzkULy3t/UPi7m6M14+nSNwQnSp8OSAzBNoux5SqxgTGmd
         R07AXmj2JDVuzwVvknm7ifOu/xmSJUINDK0E6NfOV6BVpmMhJPDMpTM0BYiHXD8JbUGB
         hEzyzEIHZYJzkVBE0goqAtVcUXBfALVREh9RVwTGPYUopPbb74qjrOrA2j4t3g9Pz/2f
         hAscVfEU4oDKXgGMIzQVET8nN7aEmZVAsXWHzwBLhsnTwy2oLSFWS8gqAe90CkojVVrS
         cdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799186; x=1794403986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKK8ogIigAwbu6aj9RHAOLGoDBejAMO+iSP8oypaMds=;
        b=OZsgTZcOiT3/M+lROTPmMIpN38t1q78A8isZLJBaS8br/o0QJsveQqCdbDCr90RSD0
         cjamgb9Eu8mQ37b6ZDEVtqcWyl4shwg3dyJeD2bssHo3pVdry1Rn4aBhcNqpk+92rJi9
         vokcDL+sEngRcfWW6EmqDiqinuxckJzt15075Obkj+XIdnOntn+2M9oXSkNMYts/NTkt
         MrVmWgwlPEivMLNpKK1zXPcE4gaSOqm0euzntI/NCLs+PffgJb1zHJEZXADgVeaem5Id
         ZPb+yPu5WreY/jMHjBLakuW7+DlZ7gNFkrqUr9HlSUEvqnO4PLDsqKySviZqtHFqeohS
         ujYw==
X-Forwarded-Encrypted: i=1; AKwUvBzmMs8r4RfWCMEF/lgwsgMX8yBMMsfOXmqKbR57Eh1M5DlbCQ+RCo11mX3hvBmNGolQw/T9YTzIQ+nm/CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/H46YdWPhb0vKSvXrYKCQxTrzKf8T0bI09LTzAH7MazzeXvXk
	dZxa9+7AK9BCyDCXnIdqZ8ybG4IiXUb5RBGrXQT5qMAA0D1WGv2J/k+k
X-Gm-Gg: AYBFou02x9QVm0rS1YuN8lSlxi0sZ7FROMYfeveNlSYcEhi4TwfTLyM0wuVJKTn7hsw
	vixKyQhV670GTfoBDOfh0hPte4OO/Kvi+cISF4CqJ9WHkyHIYVnZ72cREQ/cfBHLgZqpCek1Dpy
	WRvsfig+OADBj7tN10tO0CiUKnVqFXsxATDLuwyQ5FeeF6oPtTf+A7gQ955NmjoQC2Q+zPqZuzg
	S+scZk6kqL3+maig0uWW9B4GnRsTDltInqz2Vi8i6f/1wWO7rEMyP2uu8hncCp+9MKCy9GcE7Ei
	swI8cPpHgWWsaZ39lhpwwuTYBlJPGDsooHippWbm0Fe1ShPqLwXQpGz18R3z9jKVGhNzNDjqWnd
	zO6EQbFnL1IUjjq1DKQUYWhh4Sj2dnun/tMMkOLR3wpOTVNLW+ePPazCJisS/o5aP1pJfF71oln
	WfzZ64PzkCzzp2xyN2v+xRXqQpDOg5pUfTRjFQNRdG8o7IfTACIO8JrIPmIs8A5qhEQnWuNgi6S
	fjKPDvxTE5c1uqx0pvDUcJfYAuU2+HSmiwu+4E9Zn4jX/qf5CI1A+2lkT7cwGTeLdjSzZEXzVeJ
	5NAzzaJMyKp3Roh3hg5pzrkrNOwXsZ5YCTVZey7/u+0Zb3kYDw==
X-Received: by 2002:a05:6a21:3113:b0:3dd:f9ff:f5a with SMTP id adf61e73a8af0-3e928aab8damr12500818637.9.1793799186070;
        Wed, 04 Nov 2026 05:33:06 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:33:05 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 09/11] objtool/klp: Extend twins through unchanged function references
Date: Wed,  4 Nov 2026 21:31:55 +0800
Message-ID: <20261104133158.3187525-10-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
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

Repeated statics and optimized variable pieces can share an identity
and checksum, leaving them uncorrelated after identity matching.

For paired functions with equal checksums, compare their relocation
entries and extend twins to the referenced symbols. Require matching
reference layouts and compatible targets, and reject twin conflicts.

This also checks the correlation against the function checksum: equal
checksums can hide a switch between instances sharing one identity, and
a conflicting reference must stop patch generation.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. Only local-to-global-flip, sympos and sympos-vmlinux fail,
reflecting the linkage and duplicate-identity policies.

Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/klp-diff.c | 132 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/tools/objtool/klp-diff.c b/tools/objtool/klp-diff.c
index 468b8654b687..e8252e586260 100644
--- a/tools/objtool/klp-diff.c
+++ b/tools/objtool/klp-diff.c
@@ -826,6 +826,8 @@ static int validate_symbol_twins(struct elfs *e)
 	return ret;
 }
 
+static int extend_twins_by_relocations(struct elfs *e);
+
 /*
  * Correlate symbols between the orig and patched objects.  This is a
  * prerequisite for detecting changed functions, as well as for properly
@@ -845,6 +847,7 @@ static int correlate_symbols(struct elfs *e)
 
 	if (correlate_by_identity(e) ||
 	    extend_same_twins_by_checksum(e) ||
+	    extend_twins_by_relocations(e) ||
 	    validate_symbol_twins(e))
 		return -1;
 
@@ -1294,6 +1297,135 @@ static int convert_reloc_sym(struct elf *elf, struct reloc *reloc)
 	return convert_reloc_secsym_to_sym(elf, reloc);
 }
 
+static int correlate_reloc(struct elfs *e, struct symbol *func,
+			   struct reloc *orig_reloc, struct reloc *patched_reloc)
+{
+	struct symbol *orig_sym, *patched_sym;
+	unsigned long offset = reloc_offset(orig_reloc) - func->offset;
+
+	if (offset != reloc_offset(patched_reloc) - func->twin->offset ||
+	    reloc_type(orig_reloc) != reloc_type(patched_reloc)) {
+		ERROR("%s+%#lx: relocation mismatch in unchanged function", func->name, offset);
+		return -1;
+	}
+
+	if (reloc_type(orig_reloc) == R_NONE ||
+	    is_uncorrelated_section(orig_reloc->sym->sec) ||
+	    is_uncorrelated_section(patched_reloc->sym->sec))
+		return 0;
+
+	/* Section symbols have no twins; resolve the target symbol first. */
+	if (convert_reloc_secsym_to_sym(e->orig, orig_reloc) ||
+	    convert_reloc_secsym_to_sym(e->patched, patched_reloc))
+		return 0;
+
+	orig_sym = orig_reloc->sym;
+	patched_sym = patched_reloc->sym;
+	if (orig_sym->dont_correlate || patched_sym->dont_correlate)
+		return 0;
+
+	if (reloc_addend(orig_reloc) != reloc_addend(patched_reloc)) {
+		ERROR("%s+%#lx: reference offset mismatch: %s[%u]%+lld and %s[%u]%+lld",
+		      func->name, offset,
+		      orig_sym->name, orig_sym->idx, (long long)reloc_addend(orig_reloc),
+		      patched_sym->name, patched_sym->idx, (long long)reloc_addend(patched_reloc));
+		return -1;
+	}
+
+	if (orig_sym->twin == patched_sym && patched_sym->twin == orig_sym)
+		return 0;
+
+	if (orig_sym->twin || patched_sym->twin) {
+		ERROR("%s+%#lx: twin conflict: orig %s[%u]->%s[%u], patched %s[%u]->%s[%u]",
+		      func->name, offset,
+		      orig_sym->name, orig_sym->idx,
+		      orig_sym->twin ? orig_sym->twin->name : "<none>",
+		      orig_sym->twin ? orig_sym->twin->idx : 0,
+		      patched_sym->name, patched_sym->idx,
+		      patched_sym->twin ? patched_sym->twin->name : "<none>",
+		      patched_sym->twin ? patched_sym->twin->idx : 0);
+		return -1;
+	}
+
+	/* Compound target checksums are independent of their defining TU. */
+	if (is_compound_constant(orig_sym) && is_compound_constant(patched_sym)) {
+		if (!orig_sym->csum.checksum || orig_sym->len != patched_sym->len ||
+		    orig_sym->csum.checksum != patched_sym->csum.checksum) {
+			ERROR("%s+%#lx: compound content mismatch in unchanged function",
+			      func->name, offset);
+			return -1;
+		}
+	} else if (!is_twin_candidate(orig_sym, patched_sym)) {
+		ERROR("%s+%#lx: incompatible reference targets: %s[%u] and %s[%u]",
+		      func->name, offset, orig_sym->name, orig_sym->idx,
+		      patched_sym->name, patched_sym->idx);
+		return -1;
+	}
+
+	orig_sym->twin = patched_sym;
+	patched_sym->twin = orig_sym;
+	dbg_correlate("%s(): %s+%#lx: %s[%u] -> %s[%u]",
+		      __func__, func->name, offset,
+		      orig_sym->name, orig_sym->idx, patched_sym->name, patched_sym->idx);
+	return 0;
+}
+
+static struct reloc *get_func_relocs(struct elf *elf, struct symbol *func, unsigned int *nr)
+{
+	struct reloc *first, *reloc;
+
+	first = find_reloc_by_dest_range(elf, func->sec, func->offset, func->len);
+	*nr = 0;
+	for (reloc = first; reloc && reloc_offset(reloc) < func->offset + func->len;
+	     reloc = rsec_next_reloc(func->sec->rsec, reloc))
+		(*nr)++;
+	return first;
+}
+
+/* Use unchanged functions' references to resolve ambiguous symbol identities. */
+static int extend_twin_by_relocations(struct elfs *e, struct symbol *func)
+{
+	struct reloc *orig_relocs, *patched_relocs;
+	unsigned int nr_orig, nr_patched, i;
+
+	orig_relocs = get_func_relocs(e->orig, func, &nr_orig);
+	patched_relocs = get_func_relocs(e->patched, func->twin, &nr_patched);
+	if (nr_orig != nr_patched) {
+		ERROR("%s: relocation count mismatch in unchanged function: %u != %u",
+		      func->name, nr_orig, nr_patched);
+		return -1;
+	}
+
+	for (i = 0; i < nr_orig; i++)
+		if (correlate_reloc(e, func, &orig_relocs[i], &patched_relocs[i]))
+			return -1;
+	return 0;
+}
+
+static bool same_function_checksum(struct symbol *func)
+{
+	/* Cold subfunctions have no separate checksum; use their parent's. */
+	struct symbol *parent = func->pfunc;
+	struct symbol *parent_twin = func->twin->pfunc;
+
+	return parent->twin == parent_twin && parent->csum.checksum &&
+	       parent->csum.checksum == parent_twin->csum.checksum;
+}
+
+static int extend_twins_by_relocations(struct elfs *e)
+{
+	struct symbol *sym;
+
+	for_each_sym(e->orig, sym) {
+		if (!is_func_sym(sym) || sym->dont_correlate || !sym->twin ||
+		    !same_function_checksum(sym))
+			continue;
+		if (extend_twin_by_relocations(e, sym))
+			return -1;
+	}
+	return 0;
+}
+
 /*
  * Check if the original module already has a dependency on dep_mod, i.e. it
  * already references at least one export from that module.
-- 
2.55.0

