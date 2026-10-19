Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A94369A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368211; cv=none; b=I4sjVcwgl3IIOmxcIuSqTlBUGJfDXB2wobw3bz4O8XLZu1Emjb8p3nOC7/SEncUCbA13ban93TN0hzziAY3rYt/4tWUsmKzTm6JKgzgUKDegybU8FOi+1N10pvvRzAOf0Xo4gAUONYI9Pg1tPzJQZuu0aLKh+oNcmsUCtEOeWNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368211; c=relaxed/simple;
	bh=2JKcgyL5MZsa1atFWKqaDkgVvI6MNsCv8edchhencJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qs7kEoa1c8LFjXq+HUEHmSc55M+npjuoHJ9ltCSRzOdb2hmoyf2Hpi5Mgmicf86yNEB5qgldN7bYVT9S7hUwxUVGNEPYIMzgz25ol+GlXSQxeIeOfC6M4lbiuS+obV9TLERxcAxT8/nr2Wa9AxH2OlgeYjQhExrHMhKHkdw7uLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcrJ+XoV; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcrJ+XoV"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-847ac7ccd85so493006a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368209; x=1792973009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1v4MX1Kl0eeFBdztaswBZeFOsomX3w44ItcTRymTJw=;
        b=GcrJ+XoVXDBIJG6PPYXGlrjRsr1WI2ove1hzD5PJ8tUkZRFqD+9yHWHirfQAG9tYaU
         U4lGSQ7u7eYOpolKsuL43nxKziGxvNJs29c+x+Babcu5yRCDM5RH3zCPNMIDUOK26eDS
         FFwOgXphCCwU7vpJVuBXVo4CgZ6mPXWVyCAp868nwyou1+oMF0rCbZbYRXIKY1Rsp6YE
         NheQ/Hq5TOP8RGHDVVXGMcmxeAiIKzp9r5KakS4NzkIqKTElYpHc2IbyUea0QWxMv0B0
         cYMkAi5c8hArTMBWy5LizHNWTlAbI/lWoKL4MZpf8IHcVTT/2C3C96bzKWbvZa6L7VPi
         xdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368209; x=1792973009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1v4MX1Kl0eeFBdztaswBZeFOsomX3w44ItcTRymTJw=;
        b=t6cga2GiCGDzMuk2qNoBv2E54YjnecgvDH5pBxyrcchEa+S19HhleKcT8W3CpEV0OW
         V7sBaEifljsfYc4YpDdr8cdWt+avhQXcQ9+K0+K/P2LR6cV3BCf1JOOf4WxDOIsYo2dc
         f3+8V7g1Nx5CpHH48mZ5BWTDSPX5PE+3XQRuaTOMo/XpUitZs1EVXzgw2wmOQDnFa1fp
         Uhs1OVMXL8kBizq0zfJJG4m0QnrGJfJZ0Hs1oYOw2u85tTaT8bPSjTQ0B2x4/Jn2KBb0
         3Jg5DWEetz6ivNloOHtD4D50UjBjjICuQ++wpcSV4921BcjNAMf+BNmh/FAhd2G+ICuB
         NxFw==
X-Forwarded-Encrypted: i=1; AKwUvBwMrjZDPjNrNf8kiYF+58Ea7rhQ07aVQuJycmQHTGHYfN0OjZh1iWPLqA/DzJuzL+LPtwuc3vrslWBSm6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlVDFLUVff4zMjaX4qnsnZZRz4P2hSghEhRp5PmbqXzVQXqoVQ
	Rb76AXR6BoLK/V9SwiPD3XsNY6Gn8tKF7eAqQtyXGsjCsahuuxL3hjrw
X-Gm-Gg: AYBFou12KSKRKfqMNxIO/xPlCebAW9OpIt0jN+Qgnok9kqWf4cG9mumJtG6c3eCi5X+
	BxHYuvy3OQ70/PkPdxLtwv+Q6xQwG6Z4jXN2jawqdYcJi6haiwKQaphVohHX3oriD0Pb8V1may+
	WpL/lK63z9vcqL0xwJWpgi6E2EdLqxxtlrGvixmfCFK/l2opXIwZgl8iJ5ZPWGcTgyZdJEXHrjy
	nCXWtaWKtkItCkWpvktUIKK+uPGU2yaclIaMn27RBdk8XaIupOzk0rBB2BpWl1axLBZK07SDnyH
	DKrZYym4OBLPcl2GO3rsQu9vsfrgheeSdpkLAPI9xboFyDcAO02vVNXYv/TTmRcyHq1RnfeUR7S
	oVvpwN9oBI0Tp/S4p3D3UBOFaZEPra42v9V9/Ysw01jBbYpFlzhzBDtxYCNkiF2vRAepECVpoGG
	8bDAn84J+Bnj9i1byvj9k/1z0Hmc9l4OMbWA4wnogaVOHTTfuPPUIyr3hg/bt/sILynJXuWm46P
	NvHHa0jLZwg
X-Received: by 2002:a05:6808:4f6a:b0:539:4d53:170e with SMTP id 5614622812f47-53cd2592db5mr5858611b6e.43.1792368208894;
        Sun, 18 Oct 2026 17:03:28 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:27 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 4/5] elf-parse: check the symbol table before walking it
Date: Sun, 18 Oct 2026 19:02:17 -0500
Message-Id: <20261019000218.3977398-5-lzsx618@gmail.com>
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

elf_open_ro() ends with

	elf->nr_syms = shdr_size(elf->symtab) / shdr_entsize(elf->symtab);

on a section header taken from the file. A zero sh_entsize divides by
zero, and an sh_size that runs past the end of the mapping produces a
symbol count bounded by nothing: scripts/kallsyms-sysmap.c allocates
nr_syms entries up front and then reads every one of them.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Both reproducers change one field of the symbol table's
section header in an otherwise valid vmlinux:

  sh_entsize = 0
    ./kallsyms --sysmap=/dev/null t.elf
    scripts/elf-parse.c:266:40: runtime error: division by zero
      #0 in elf_open_ro scripts/elf-parse.c:266

  sh_size = 0x7fffffff0000
    ./kallsyms --sysmap=/dev/null t.elf
    ERROR: AddressSanitizer: requested allocation size 0x7ffffffefff0
    exceeds maximum supported size
      #0 in malloc
      #1 in xmalloc scripts/include/xalloc.h
      #2 in elf_read_symbols scripts/kallsyms-sysmap.c:195

Require an entry size that can hold a symbol of the file's class, and a
table that lies inside the mapping. Both reproducers then print "symbol
table out of range" and exit 1, while a vmlinux and a shared object are
read unchanged.

One UBSan report in this area is deliberately not addressed here: an
unaligned sh_offset makes elf_symbol() form a misaligned Elf_Sym
pointer, which the header's accessors then dereference. Rejecting it on
alignment would also reject legitimate ELF32 objects, whose symbol
tables need only 4-byte alignment while the Elf_Sym union requires 8, so
that one needs the accessors to read unaligned instead of a check here.

This code is only in linux-next, from the "kbuild: significantly speed
up kernel builds" series, so there is no mainline commit to reference in
a Fixes tag.

Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 39ac25ddf188..756843c433ee 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -271,6 +271,26 @@ static bool elf_shnum_out_of_range(const struct elf_file *elf)
 	return (elf->size - shoff) / elf->shentsize < elf->shnum;
 }
 
+/*
+ * True when the symbol table cannot be walked inside the mapping: an entry
+ * size too small to hold a symbol divides by zero (or steps through the file
+ * in the wrong units) below, and a table running past the end of the file is
+ * read out of bounds -- its size also drives the allocation in the callers.
+ */
+static bool elf_symtab_out_of_range(const struct elf_file *elf)
+{
+	size_t offset = shdr_offset(elf->symtab);
+	size_t size = shdr_size(elf->symtab);
+	size_t entsize = shdr_entsize(elf->symtab);
+	size_t minsize = elf_map_long_size(elf->base) == 4 ?
+			 sizeof(Elf32_Sym) : sizeof(Elf64_Sym);
+
+	if (entsize < minsize)
+		return true;
+
+	return offset > elf->size || elf->size - offset < size;
+}
+
 /*
  * Open an ELF file and map it read-only, locating its section headers, section
  * names and symbol table which are populated in the elf out parameter.
@@ -324,6 +344,12 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 		return -1;
 	}
 
+	if (elf_symtab_out_of_range(elf)) {
+		fprintf(stderr, "%s: symbol table out of range\n", fname);
+		elf_close(elf);
+		return -1;
+	}
+
 	if (shdr_link(elf->symtab) >= elf->shnum) {
 		fprintf(stderr, "%s: symbol table has no string table\n", fname);
 		elf_close(elf);
-- 
2.34.1

