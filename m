Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417554793
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368208; cv=none; b=nzsFtkY40Gy7TJlQm+K1Ay86mnkKRk/TCJZ8VSKB0pFPCXYKuNk9dnhhGmhh5PK5N2TUS7wOnEPi2JdnvOHRXT0BoLpiYAvW/ubhwW7kkM4Ql4JHocbqirPLfFD5WYp20fap78Iya8qQHnD1VhlbeOY7TnnMEjSlU/1582hWq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368208; c=relaxed/simple;
	bh=CmIIrzJ7Uun//yJKq+031MJwO9Y+GMeiK4+3nQuypvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ecr+TUWZIuvVnlfm7vh9vZReeLou6ENLfocpQGmUmQM5EVupFCXZ4OUvB+nhoie4UmUhd4eIE+lVx0+WN0QEAOCu9DD0WQhQ5wYlGbeWWNQTdvxl8FBxScVlaGvsA7q01DlLLnBFn6S1M6LsI0W4B236ouHjj5A6o7yo3OSnyDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ndx9tlTc; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ndx9tlTc"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-81ae6aefdceso1407131a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368204; x=1792973004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKbDNWvWGa3cmJaCEBLpZ7m9ikh3MZG7EdE2bkW0TU8=;
        b=Ndx9tlTc6PsKSbEZimM1p9qaIR8UUxi6tXHKiVdjZC0q3YUYGrZNzPatdjVnnVzhjI
         ZBsshz6TXaV5gaUkUgcocAOFn8tXWAQ/maTs5y21yWZDd+xKIaInfNwlVL2z5LTIuUCq
         C/unShZHONzSb8YraYuvhXNoZCXXnMxG5e88Cxlxrpp8g3vIXHZpzJHQyXRN5qG/dDI7
         7VIjT60thfa7Ihg6ApB6RtF8ROSx78CyhitBh3wmnUAx4blbmXLfw1X/Yo3xLSMQHf2P
         mAJNpZuYldOhMITqKnhSLRp4pxj9J1KZHg1QwGJfmY0h4DFs9oE922MxB2sV8P91mi9P
         DY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368204; x=1792973004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKbDNWvWGa3cmJaCEBLpZ7m9ikh3MZG7EdE2bkW0TU8=;
        b=dY8PiImUVBspLi0o/DBLJH5JD7PyC9jBZurFPRes0WEc0T8gQBYx/uf5Msg6E7PP3P
         MhsGRsSsf0kOr5cikerFmkeHOq6zerg1SOyjR0hYJdcOOZehqsFbMbNpJikyxBWILWoE
         4rB75Eennmy5iO1ywUGnYvu8iwVLWrZKkFjbBUomf5FnCHl6v5m/DPvRwVyHzMwT0VSU
         f0KOpUJqB/vt6fw2y1x8rFLDS9YMlWlWmwBdYI+NnOkuggitVMNTnueHiTJg+PItExqJ
         rgewIA+YCo8a5XG1t2R5r+xP2qkXq4WWw/GE9wgB7JsYWov4NAWXrE/4quOJdbZHzKi3
         9CEA==
X-Forwarded-Encrypted: i=1; AKwUvBwmcs04kDr/6KrTBkrmbNYyXJdDCQJZwLMDtqbPuOEy/3REBoERB2FkDNEpDUTw0e7NJ1rXCEgtMMZgT1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqq58HS8FBghWTQPZP776bUg93rf2k89FJ0GuTow+4o5uoc8Yd
	QCk1X4w4u74fWLcZCH976bNYgrSG90V1yr8qfWkR44jGh+OWze61UpWb
X-Gm-Gg: AYBFou0Kq/NYzlMLZG2R/9p+1RlPoooWdbq8PWE4lot+sADu8REsF30eHSExuv6Jg88
	oWdZ6R5/k31LhKjJudLQC28D6yF4B9Sk034mYHEK+1dxtzR2bHXlYj/njI2l1bgbGpLcXNjwSpb
	z5afvwQVNzLkKU23B2ixCtSoQzL3zjCVtXeEn/7LKdZiVyC7msZ+HOAifu+zOzXcx7KH6Yuhlrx
	ixB5GFgPYancs0mfqcIMlHKFzHEiHllmDExyG/FL6b+iTHU+JZjMRL/K2ymdwRqGkVaPXBbXKzD
	VT0kQUnazjEn0TkEieOdPGBcm4H4lpEGuNsmhULKjlD+lleLI00GmNliGaIpCj6EUXYsRUmR5Zy
	cMpEGXSh5oyIpXyAKCzzvFuTGtjaSGPQ43inczmz4fEHACcov2ojn26nEze+WLJP28WjEC6GN4/
	7A1YARySMRIFUsoJ0Ko6cnNnPDCopzYJupz6T+dSPodvbMnHMz7Z8sgXelpWwvpnFfLQ0SDqRON
	SgDdW9wH+O6
X-Received: by 2002:a05:6808:67c6:b0:4d7:2721:cfb0 with SMTP id 5614622812f47-53cd42a3861mr5563592b6e.31.1792368204306;
        Sun, 18 Oct 2026 17:03:24 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:23 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 3/5] elf-parse: check the section indices that elf_open_ro() takes from the file
Date: Sun, 18 Oct 2026 19:02:16 -0500
Message-Id: <20261019000218.3977398-4-lzsx618@gmail.com>
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

elf_open_ro() resolves two values that the ELF header can delegate to
section 0 -- the section count when e_shnum is SHN_UNDEF, and the section
name index when e_shstrndx is SHN_XINDEX -- and then looks up the string
table of the symbol table through its sh_link. None of the three is
checked, so each one indexes the section header table with a value taken
straight from the file.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Setting only the sh_link of the symbol table in an otherwise
valid vmlinux (the strtab index it resolves):

  ./kallsyms --sysmap=/dev/null t.elf
  ERROR: AddressSanitizer: SEGV on unknown address
    #0 in strncmp
    #1 in sysmap_omits scripts/kallsyms-sysmap.c
  -- elf->strtab points outside the mapping, and every symbol name is
     then read through it.

With the preceding patch in place the header-supplied count and index
are already rejected before this point; the values that come out of
section 0 are not, which is what this adds, together with the sh_link of
the symbol table. elf_shnum_out_of_range() repeats the extent check from
elf_parse() against the count actually in use.

The reproducer now prints "symbol table has no string table" and exits
1, and a vmlinux and a shared object are still read unchanged.

This code is only in linux-next, from the "kbuild: significantly speed
up kernel builds" series, so there is no mainline commit to reference in
a Fixes tag.

Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index 0e16a9cf67f4..39ac25ddf188 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -256,6 +256,21 @@ void elf_unmap(void *addr, size_t size)
 	munmap(addr, size);
 }
 
+/*
+ * True when the section header count does not fit in the mapping. The count
+ * can come from section 0, so it is not covered by the header check in
+ * elf_parse().
+ */
+static bool elf_shnum_out_of_range(const struct elf_file *elf)
+{
+	size_t shoff = (size_t)(elf->shdrs - (const char *)elf->base);
+
+	if (!elf->shnum || !elf->shentsize || shoff > elf->size)
+		return true;
+
+	return (elf->size - shoff) / elf->shentsize < elf->shnum;
+}
+
 /*
  * Open an ELF file and map it read-only, locating its section headers, section
  * names and symbol table which are populated in the elf out parameter.
@@ -285,6 +300,17 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 	shstrndx = ehdr_shstrndx(ehdr);
 	if (shstrndx == SHN_XINDEX)
 		shstrndx = shdr_link(first);
+
+	/*
+	 * elf_parse() checked the count and the name index carried by the ELF
+	 * header, but both can instead come from section 0, and that index is
+	 * unchecked. Recheck whatever was actually used.
+	 */
+	if (elf_shnum_out_of_range(elf) || shstrndx >= elf->shnum) {
+		fprintf(stderr, "%s: ELF section headers out of range\n", fname);
+		elf_close(elf);
+		return -1;
+	}
 	elf->shstrtab = (const char *)elf->base +
 			shdr_offset(elf_section(elf, shstrndx));
 
@@ -298,6 +324,11 @@ int elf_open_ro(char const *fname, uint32_t types, struct elf_file *elf)
 		return -1;
 	}
 
+	if (shdr_link(elf->symtab) >= elf->shnum) {
+		fprintf(stderr, "%s: symbol table has no string table\n", fname);
+		elf_close(elf);
+		return -1;
+	}
 	elf->strtab = (const char *)elf->base +
 		      shdr_offset(elf_section(elf, shdr_link(elf->symtab)));
 	elf->nr_syms = shdr_size(elf->symtab) / shdr_entsize(elf->symtab);
-- 
2.34.1

