Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6ED2F851
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368274; cv=none; b=lqyb8fPLeMgn5q6EJZurJNgzvqaxPdeBJlR7/uvPB23eyur8Mimc3v6HyBh3UuMnycs7wLJRTgMxxy5fRnzME4NIq+6XpC0O4KfomvLohRsM/7fkC1DHzVLY0Q8i6etX9s9bCs7FS4EwCohnznXzQAk2gVZIAj46CTYiz3RWjwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368274; c=relaxed/simple;
	bh=PytpAivb1fwxvfwewsqyJs+b7ShzSeJ8NAvBdrPtn/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pK2KDFwAyfsVp0IYn66PdeeXtHTE2pm9SdEzH+PNl4VzHStt1d1pp/w9f7N9wqNX+6pMwe8Ow7of0TjaMIYJu5MdKlO/ZgD0E5EhiJiptxrorbl9uaTut5ocsmajFNRoeGUdxsJ8cQYjzQX7j2KEElV0sB8p2+TtGqkMkHodkEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zirc/ri9; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zirc/ri9"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8198a3a54d7so2968833a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368272; x=1792973072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAzJZZYXVc0Jc7U3TE8nNL1ig5ACrPJZxsjIWB1n0Xw=;
        b=Zirc/ri9Zrfn5dPtL9q903JSIUp+Zq5JaEL9hTXxKUbgTc1kjPDyjsQsYOqx7x1AlW
         bFrEZhJDCPeqebZP/0Pgpo6PsNlDWUSou6Y0VPpsPw+zoFWPkgwrZ/kdLarP2R0w07FW
         b1TA2bDJbn6Sw+0/LfyfOs0Fh9FbaXCJrRLicodmFElbKeRICLw9wURitjDPpvjLd+8N
         sWhybucv+HFe67k3dCzdyT3k1pKeeeiIRoZFlcZnk5rBg7aAjosmtPs3ug1s5Z8vA3Rn
         E5bW1zT+S7THtjch3ma5hzSpr1V7Y6etqvUbTiK55hbPGx4CErvYgIGgAGyZQAJeF9Sc
         hq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368272; x=1792973072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAzJZZYXVc0Jc7U3TE8nNL1ig5ACrPJZxsjIWB1n0Xw=;
        b=V+MCdfAnIqMgS8PcIZ1zzCEBiuVPzJUdLyvDqRTsE6rbiLXKON5meFMvqbIikQO9Gm
         ZdbuTyi7R16uRP7ZmjIfXQ8KijbA/fwXwx7fR5Gc2l8r/dh40DbuAa9S4h9EwmrAEb4K
         WP0D2Q4CoUdU/Ez1h0RTM+OZnsSylWOmzNfxDczrbScbNb8pYbmCjL9QIz3YTmmj2xK3
         vV39mThXdZvXptgPFHhagYfj7xsL8lk4NeEnuNlxhMUcbrJnCoE47qDVnjnz2iQANi/K
         lhyuBNk4YXr6eh6n8oKmTNFdNthvGFzRIdNVIcuKF5ffLbvwkNuAkFEZw8wvbT7jN+0U
         cvsw==
X-Forwarded-Encrypted: i=1; AKwUvBz4/HUIdDkYkL8N8r/whGb0fflt928aisfhx9U3i4XXvmNTe4P2udIMnKjF3ADe+Bci7WmLKXS9kBSsVx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLD0DyHbMOTiB/BbIadYE/BpJ7rLaVVXj92x/ssIrWUx2BpHkX
	bd3Fs022+vEeYsdxCfjLVrpjW+xBuL7eMgXGCAXYwxhUuQpEGiNvy72iJEhElQ==
X-Gm-Gg: AYBFou3o62QVnBN1vTTRBUw4UgHswTbtdJ1oQCQPV9yQexI6fQc/UpyV3I9secYjntG
	38T2XB3znLyfK60JzxEZlSK014tMsOnN28447Wmd2Ij17CSoNR34ly/dPIxG1PTICz5eF3OYymf
	aMw2dXlES2ZuHBlm7++PdQYbkbhSo7VgkfPeA8jpf0kusqXzBMHcJypzh40X19o/6U5/Ty6SsZn
	WzEFvJGdVsD7Sy7QnIOGBHZvKlQkgQhh6lRrwzH6QmM/j4En/DJaj8cfN2jUwKpmorkWuB166M5
	nDFYKGCnyuiZNaGyeEg9YDhoxpCpLtfn83myKuJfI7C0mJlAPFcS9MzTz8EtkQYMDEJ/NYIKKKe
	bu6TnqYO/0rmYHdsD65MGvwADQJX0dG3fFWGcN8cPSdRifHqgKnHrOI3E/qwgd3dB9cUbwU9CYY
	rqQorZgDdG492vICfbGKQerRQrcZCW+kzJ4zyD5SqRm5hv4I82YVWigyGn5ggurropojdmwH3mJ
	oD5Aqmw0h5l
X-Received: by 2002:a9d:7f8c:0:b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-841ff60e1b5mr4883351a34.9.1792368272518;
        Sun, 18 Oct 2026 17:04:32 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f15sm7674561a34.8.2026.10.18.17.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:04:30 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH] tracepoint-update: bound section names by the section name table
Date: Sun, 18 Oct 2026 19:04:19 -0500
Message-Id: <20261019000419.3977860-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_tracepoints() finds its two sections by name:

	secstrings = (const char *)ehdr + shdr_offset(string_sec);
	...
		idx = shdr_name(shdr);
		if (!strcmp(secstrings + idx, "__tracepoint_check")) {

sh_name is a 32-bit offset read from the file and nothing bounds it, so one
section header can point the name anywhere and strcmp() reads from there.

Found by fuzzing the host ELF tools with mutated object files under
ASan/UBSan. Reproducer, setting only sh_name of section 1 in an otherwise
valid .o:

  $ python3 -c 'import struct
  d = bytearray(open("tiny.o","rb").read())
  shoff, = struct.unpack_from("<Q", d, 0x28)
  entsize, = struct.unpack_from("<H", d, 0x3a)
  struct.pack_into("<I", d, shoff + entsize, 0x7ffffff0)
  open("t.o","wb").write(bytes(d))'

  $ ./tracepoint-update t.o
  ERROR: AddressSanitizer: SEGV on unknown address 0x7f8d689ae848
    #0 in strcmp
    #1 in process_tracepoints scripts/tracepoint-update.c

Skip a section whose name offset is outside the name table. Such a section
is neither __tracepoint_check nor __tracepoints_strings, so skipping it
changes nothing for a valid object: the reproducer and an unmodified object
now both print the same "no __tracepoint_check in file" line and exit 1.

This bounds the index into the table, not the table itself: a name table
whose own sh_offset or sh_size is bogus is a separate gap, and in the
elf_map() path used here there is no mapped size to check it against.

Fixes: e30f8e61e251 ("tracing: Add a tracepoint verification check at build time")
Assisted-by: LLM ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/tracepoint-update.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 5cf43c0aac89..2736e91e6f06 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -157,6 +157,7 @@ static int process_tracepoints(bool mod, void *addr, const char *fname)
 	Elf_Shdr *shdr_start;
 	Elf_Shdr *string_sec;
 	const char *secstrings;
+	uint64_t secstrings_size;
 	unsigned int shnum;
 	unsigned int shstrndx;
 	int shentsize;
@@ -171,6 +172,7 @@ static int process_tracepoints(bool mod, void *addr, const char *fname)
 		shstrndx = shdr_link(shdr_start);
 	string_sec = get_index(shdr_start, shentsize, shstrndx);
 	secstrings = (const char *)ehdr + shdr_offset(string_sec);
+	secstrings_size = shdr_size(string_sec);
 
 	shnum = ehdr_shnum(ehdr);
 	if (shnum == SHN_UNDEF)
@@ -179,7 +181,10 @@ static int process_tracepoints(bool mod, void *addr, const char *fname)
 	for (int i = 0; done && i < shnum; i++) {
 		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
 
+		/* sh_name is a file-supplied offset into the name table. */
 		idx = shdr_name(shdr);
+		if ((uint32_t)idx >= secstrings_size)
+			continue;
 
 		/* locate the __tracepoint_check in vmlinux */
 		if (!strcmp(secstrings + idx, "__tracepoint_check")) {
-- 
2.34.1

