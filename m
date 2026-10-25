Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792889120;
	b=2tXuxaBfp870s5QgQXiA3F9G8Dq9ghGoEMrEo0mwd+Lys4NhUd/PTHYv58wscVMM+ERe
	 xYvjNf/CfcjO73rlXSzoAJpjo2N8VPCO1+dgOXDk5Cx1P++lRMx5c6BXxyp6+BukhDHqh
	 hLDBtSvMgKCwjYtckIr14CwyYcewGyStIrlFKX3+MTAt/U3Bnh8mYCWz43c/UK/HQqU5a
	 iIlLr10bLpgjO4sj3+zU/w8ehXNDKLU2pGMg+1kopY7LvwEg4FUboTjuza7dHThjtEesL
	 Awe2cALIIUrugWGuUIrOBy4mx08dgdJGAl3iNBZdl1vYRDWH/ZdTZc9+PeXNGPu5njw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792889120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zG8r7n5adPzuOqWBUaQLE4ST6ZHXuDXXcUP0nYBbPM0=;
	b=XSUIeLkw1fS/NpIjcXUHhUx80szTgd6iPV/QEm1m8Bw97UbFdGnMsUtreuAknEqaIzPX
	 C32pZNGpOKs+rjNKSZ3VdiS0KCbx9Bu5jtEpzWQwRgWYeep1tCFWKWvuvRAWHITjoiuBo
	 giW/4k4O5aGWQlI5w2u04uzoKlvLcKaGUG+FikuHmIbXl4HUtw8Z3lI4OCOYHROH9Zagf
	 Ghe69ZGkJ488Cg6DrIcAgf5B+05Hj0+5USDIMLhZOfq6msaR37oroAgxCIdqik7Z8nIxh
	 JQsqkp1Z0D1JkGU6RZmmjuvtV8i3W7vpMqxvJysuge2yEoXZtso7p7v54STzU10okdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RYDu5ad2;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AC0606A323
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AC0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RYDu5ad2
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-483d290f398so1165198fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792889119; x=1793493919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zG8r7n5adPzuOqWBUaQLE4ST6ZHXuDXXcUP0nYBbPM0=;
        b=RYDu5ad27CZ/qaXiTHxKhU9GnIvlaaCG5KHSOcv0GgWGsb8l2wGJDz7fX+vwzzWd5e
         mMskqr6niv71jVe9W37SOUGIoZd6B7JZZ7jzDn+UGj1ZgVvMUSfMVAA3nUN/uRpTIOjo
         sEB3eb1Vms4P+eQDEocprxkAh1mwI9/3drANeyWyNN8UPfsKf4/RXuTFxFgNGXp9Y/QT
         2l2Zw47abGDRwSzanB2sOVkoCKQro0jlGjQINhv6ZU5PpWRwzcihylJPe1tdqVaU82Eo
         OvLNZszqxSidHfbDutJdazwyjvIjPJeoyFQeD7Lf2jn+g0Ywppjo/lt83PZpihPWT1g4
         YLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792889119; x=1793493919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zG8r7n5adPzuOqWBUaQLE4ST6ZHXuDXXcUP0nYBbPM0=;
        b=MoDsz/FdEb0hdMxmygfl+PClrMX49SEYxej8QjlYjT4MIBcc32nXzBE4WS11umAKDF
         WTTiD9Zn0Ds/WMvzk9/fg/WLr053yaKvhVkwShdKkkXS3AvvdApCoUgEj/n02MFnNxBJ
         NSoav3QA0vaVue8jQIJ0g+bGuM1ZhGOurA+Y93z6fdbnIGG2DJHU6pKBZrAtt82BGhZ2
         aSn2x1mB6qe4+Ty/55BIpuczkwrlCFvYoBUcAgvCEa6b+JhJRWCgCl0HqMMfkUaNZnkx
         r9LEyWwiLevQrBQm7kcGt0hyXWipUs9gjx7rlQ1n/W9VoN3oJadtnWbklsGK3Xfux5wD
         YX+w==
X-Forwarded-Encrypted: i=1; AKwUvBw0gqL1rIsf/0/0wyaJfqXckJLMKdRGJDmEcy2W6mwurVJgyQ8Awf9nOqSb2QC9oDW14JzbAzhmq5tKU/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFLV8i9L6LSoxHnv2W9HdVD994vjIKT+qTj0vlIX/AtLR9mXyv
	iznJvloRnWjr8rFYJR/cPr+9QEjNWfZqDlzVK7yI0x2OaVoh6yuDu8h4
X-Gm-Gg: AYBFou3uaSzkqmzNKleULBVRvOAIuGYqRmIec1DCxQIrhw0OVT2N26EQD+U0o3H7PUx
	K1r5SxU6NyX/xKEg8h00lcetXLYtSmaROoYBV2QD+YtXy8K97gRApsbSuDepYvZeCuG6Y4H06V1
	jGCtwakpWzBySvk7ICLa790OE2Z/TdfzVOWQNEvCzApv5eui68LOS7PWtJqFv7rf1zDdAUZOGq/
	yjeM1UnN+X6heNEA8CyztwcyKqnvW5XuhVyr1thH1CE/dMT7+X1oN+kucYORgDf9iV+x0y26JXG
	a+NHFjCsLhkcy6TVtMtxR8NaMRtGeXongD1xqdkLUuP6SMLZXuF7iBvui0ItLJkWcxtqYpZ0SIX
	45Y4ekZIGu361LEidhw991jnjNZgxLBk0+hW26cM6DawsrGidrTXhpMgXETh+FXL0sVkELg1DDo
	otfpHqzxB3ypnq7nvcQVwpiujpkgE57Y+aTV4f5WMtGDQdWQUA/NL2ubH5Ws84IxScJgPMKGmQ/
	l7ytHWTXlpD9GFxL4KlS0vKuttQejFig4IhBKbG1RTqkoXdTMTfLcrNtECANKj1pCDk7g==
X-Received: by 2002:a05:6870:3196:b0:4a6:f698:df8f with SMTP id 586e51a60fabf-4a83f5f099bmr2252359fac.42.1792889118900;
        Sat, 24 Oct 2026 17:45:18 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84322d21asm1943245fac.16.2026.10.24.17.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:45:17 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v2] elf-parse: avoid an undefined shift when checking the ELF type
Date: Sat, 24 Oct 2026 19:44:40 -0500
Message-Id: <20261025004440.432272-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019084749.03c4386b@gandalf.local.home>
References: <20261019084749.03c4386b@gandalf.local.home>
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

elf_parse() takes a bitmap of permitted ELF types and tests it with

	type = elf_parser.r2(&ehdr->e32.e_type);
	if (!((1 << type) & types)) {

e_type is a 16-bit field read straight out of the file, so a type of 32
or more shifts by at least the width of int and the result is undefined;
31 shifts into the sign bit. All three users of the parser -- kallsyms,
sorttable and tracepoint-update -- reach this with e_type unvalidated.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Reproducer, on any vmlinux (or any ET_REL object for
tracepoint-update), setting only e_type:

  $ python3 -c 'import struct
  d = bytearray(open("vmlinux","rb").read())
  struct.pack_into("<H", d, 0x10, 40)
  open("t.elf","wb").write(bytes(d))'

  $ ./kallsyms --sysmap=/dev/null t.elf
  scripts/elf-parse.c:94:11: runtime error: shift exponent 40 is too
  large for 32-bit type 'int'
      #0 in elf_parse scripts/elf-parse.c:94

(host tools built with -fsanitize=address,undefined)

This does not need a corrupt file. include/uapi/linux/elf.h itself
declares legitimate types above 32:

	#define ET_LOPROC 0xff00
	#define ET_HIPROC 0xffff

so any processor-specific object -- and the 0xfe00..0xfeff OS-specific
range the ELF spec reserves alongside it -- shifts out of range here
while being a perfectly well-formed file. The tools would reject such an
object either way; the point is that they currently reach that decision
through undefined behaviour.

Reject a type that cannot be in the bitmap, and shift an unsigned 1 so
that a type of 31 stays defined. No valid object changes behaviour: every
ET_* value the callers put in the bitmap is far below 32, and a file with
a larger e_type already took the error path -- it just took it through
undefined behaviour.

Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")
Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - drop the inline comment (Steven Rostedt)
 - note that ET_LOPROC/ET_HIPROC make this reachable from a well-formed
   object, so it does not rest on the fuzzer finding it
---
 scripts/elf-parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index ce1c2a670244..f02dc377e841 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -91,7 +91,7 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 	}
 
 	type = elf_parser.r2(&ehdr->e32.e_type);
-	if (!((1 << type) & types)) {
+	if (type >= 32 || !((1U << type) & types)) {
 		fprintf(stderr, "Invalid ELF type file %s\n", fname);
 		return -1;
 	}
-- 
2.34.1

