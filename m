Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C53B1B3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368195; cv=none; b=M3aKY+94e2IhO8lvnDsL4vWCWqR+26i2Ch8Bz6HJJH3tup+/B/83oYMflWlSdXFM05wgqD1F+jdqmnhyEM6AOtDxjiHKs8IwLtdjKlHey11Q9N63EFf8pugieV9bMaGkyAq/CMTRa+wnd3Jz0nrj/Lc1JvytTuS5qbkaj8EvB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368195; c=relaxed/simple;
	bh=8OD5fHyjw3WELN8ZZ4mo2g5h84op9pQG9FYmU3aQS2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PmJ8VgizN33J/tzUhp+RSr3CTfB0R5YjfdU3Hk9wtVUzSbOzi/8iOfZMzZyUayM/RO+pQvflQFPcKEjf4d9WfF6jkh1+TEoda61rPPST4bZ+PFN/RMqRT9i8NjKbDFStkSoMX06nBWX0reT84PqnXGo4JCgSzqN7vcXH8wUuLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9hhdn9K; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9hhdn9K"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53aa0802881so832131b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368192; x=1792972992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwh+FbqgG81Rmk8PCspmQGC33U3FHEKmwe+hRvNg0So=;
        b=m9hhdn9KQxCRHdjfaYCzb2K9Rn/dI2DrN11W8Dy7hj8GP7fqxdJ6+Ad/2L9i5GRLJ8
         +pXu9FSwHVJNnJy9m2d4j8Ar06y67kXO8aX8jlOhFrlLIcCRuk7Fc/IfsbwQtMOkJQZZ
         o+pE2gHW2YDU/4VFbwWtquFGmTH1u0n3PiQpN2WsfD09Ro7l/ISD9uGV2am8vI0SLkrS
         9IZDCNUbWVXGb3T3eUC40e0eW9JYSWkwYHEOLfkCH74Fw0oT5lKYb+NSDk0WV03WjHdI
         9qd7vUIEc5WZfJyO1PdejyKPTz4oMV7dCmyoRCRUcknwafC2SoL+IFfaY5u7rATToaPL
         SW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368192; x=1792972992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwh+FbqgG81Rmk8PCspmQGC33U3FHEKmwe+hRvNg0So=;
        b=Oj/tOK9gYNThlTwuPN9m2xi2gYaHGHMNQPa6Z9Elk3M5P6Rn6yP37OjnboAIbUsuMP
         4o9Mm7u75ILIeXCh7Uc6m6+F/U6DNOhxRUKS/82s/RbDbO2gQJUTT8nVRI/REvqcQj2V
         tBFsNl1IiEOEr00+/VqS237y3NqcmQ3wXc/wLzD4X0HeVV5Ef3JBxtSt12Jh5N8iFeHx
         QW3pRky5BaKCkmixIgTxzDIefpbqhMRUJHTsSJamcbGLfh7BzOSOJpVPJT8rHT20ETTq
         8aUYtEldOvVSqsPKNdKkVmk6JzCoAlrj7zl8mWr/gKKV24+MJvKuLwa+yLNwY+CBvcij
         /FSw==
X-Forwarded-Encrypted: i=1; AKwUvBwpA90dOI6H6M4IkappJhfRBLS0Qgtb9RjMKCTwjzv0dgJKCyfbtOGlpH8EnvGYFYUzaoUT3pJcQJmPmYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtw5Qxnj6KVUIqwodNyn/39R2B5e6EcWgIIiAY55zUBCeMwLEh
	uf3nupqNDsjxUfjwCfgOeA87oagV7j3/dEeiE79GmTLEPuElghJ7YU20
X-Gm-Gg: AYBFou3RkIo9p1i1OuNjZeuSeWRIdnzbpGynYd7tO/7wFu5D6jkAgxnoDVSdsgNan9G
	zs+EjHEALLKeNwekEUD6meFPFhLisb0KKd+ezyJWSnFxyfuIr0UnESeGjetvEy78Wn6/dOCMhIq
	GirnE+EzOZtpMzRhMV8CU8E8rj5i5IWbNiJRb3WVqnjAZ369g3HemgQJJGkCbIy+B8bnkWnT7fE
	Aectg9LJhMyoMUSplDl2dRUr6grMbT8U4brwOXeczWnKPt4KRVTUzZBiOV027egfQbUNhDA33aK
	E5n7frlp6bWvXjqpYhEc0yUPJY404Z4r2+qLa6qZDSeK5lnwZWbt6ysn3okqIp64sxXsry00ri8
	MwwNMeM4MAcgYsv3J0KI2uPzoBKJvhkR/diJxOwMCnf0tkhEvwt+LbU3MceWr+TvG8SwOrVh56F
	FMrYSNrNF/Ekvro+ZhMNCQwQgfU3alClngwYCaJhIWOT6S/rj4w8vQ9lqvG9dzhnrJ9MklgRvTo
	jOVmpJ6jJXQffILGELTDaPc
X-Received: by 2002:a05:6808:68c5:20b0:53e:1bca:c40a with SMTP id 5614622812f47-53e1bcac7c4mr2988394b6e.54.1792368192000;
        Sun, 18 Oct 2026 17:03:12 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm5811806b6e.11.2026.10.18.17.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:03:10 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	ljs@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 1/5] elf-parse: avoid an undefined shift when checking the ELF type
Date: Sun, 18 Oct 2026 19:02:14 -0500
Message-Id: <20261019000218.3977398-2-lzsx618@gmail.com>
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

Reject a type that cannot be in the bitmap, and shift an unsigned 1 so
that a type of 31 stays defined. No valid object changes behaviour: every
ET_* value the callers put in the bitmap is far below 32, and a file with
a larger e_type already took the error path -- it just took it through
undefined behaviour.

Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")
Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/elf-parse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
index ce1c2a670244..9e7d1a4f263f 100644
--- a/scripts/elf-parse.c
+++ b/scripts/elf-parse.c
@@ -91,7 +91,8 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
 	}
 
 	type = elf_parser.r2(&ehdr->e32.e_type);
-	if (!((1 << type) & types)) {
+	/* e_type comes from the file and the bitmap only has 32 slots. */
+	if (type >= 32 || !((1U << type) & types)) {
 		fprintf(stderr, "Invalid ELF type file %s\n", fname);
 		return -1;
 	}
-- 
2.34.1

