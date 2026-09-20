Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251663CDBB7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876748; cv=none; b=OFG78sxlRFhqD+T3HHbp/cco42uGUJx/PA5OfIck7u9bmtNB/D7bRNj2Y4UQP7B5BZT9UUF2d1Jrzzswvld9BbnCP52OlWGl2MgjVds9aJbNPjMCRGeRycI8mOKvdXal/abZSe/AvWQ1sFqDIjZGNz8Bp89Gt5jskgd9nmEwRDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876748; c=relaxed/simple;
	bh=Pmx36gQOuPwOlhgjUxsxj611prlgdw6+8eilpqQR+lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tH0DIFiqgdwBjdlykc8sP4S65YLmw4UFTOwdclV+NhE1g3xQ+QdIk449fub5dvfzZrfFdSqtrTCWY2EVooGZTRgbMUgnypGHzBUVViP2dqYX7trwgz1E04+Plsi35hg7oqZmf8orQVJUaMVxecUS+LoE406yBSQ0Dj2NZMTNqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CODjGH4k; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CODjGH4k"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-482620dc91bso1461861fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876745; x=1790481545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6vJ2DRK9H1Alr5nUnbVfDQuEMO7fFwDEgneTA5sWg8=;
        b=CODjGH4kxI2+vgU6bfPlW+d9KDNXtz0RdphukPsuo1UEEiluQGsVS73m58ari3p4Wd
         pVrpBwT7xifClQAUnN2wQHuV6fAfVqnyilZqdovq5lEWYrv6ONBzh3TeQrhMWTJvXSCo
         BTCe38Y/IIU7NQstQFxvq7ZSNEe3hE3mr5JvcPjcUe2SWV8rCsXjfhpsqUuktzotc5Yf
         kH9aDDXf1+TT6R8p7QX0hGqvCVDVofXqa3bHvM+zV4TrNxAjIgsXWgYITFfmPG9rJfES
         omtY6kaqe/tFljsdrabVrwZMOw8FGG9Vy5EqG3GG2LXZvqLe4yv6huqiy3BLNAiRqdkg
         jijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876745; x=1790481545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6vJ2DRK9H1Alr5nUnbVfDQuEMO7fFwDEgneTA5sWg8=;
        b=X2tv2e0aRmevZRI/wHFpygJA7JFmM3pzuh98p6Umw7fS9HrwCeBg9PooOmFADaTJmF
         D4JDJG5rXurRwH5A2zpeuhBZt4gMVMpheNeipaQA4AmgJGdyieCiDssNNQwHpLN9Xd2m
         xqz2zwN9/2pqVYeYyZoePEOWBdRxRK86ELbfA1MK06ond/boYy/+yBIypcZP9YGm9EUy
         0CHtK48PjYe2OTcjh24UsU40KEebEZ2u/978Zqhq8LF45TwquaaVg25iEjiPjZ7Qvh0T
         OYBk3Bp17s2AZckHc7aJsVxPjz7gtLMiIXsScD6sMe93D4gBVS44hdpDplGIM/gVmsxU
         JHoA==
X-Forwarded-Encrypted: i=1; AKwUvBzDCfKCtKcnWF2LNaYCrh5qS60QmNd0dDBjzU/4AUVGKQ9MBJnQKphskjk0+CiHxvoo1qejTkYXMtKxQwY=@vger.kernel.org
X-Gm-Message-State: AFuF++nWAk6+I/H+5ARD0+GRu7dYEhVS0lAZUhwPpaV+nHTkLm41HB+z
	sZblhfKkiaXp8JGDtDjc/0PrHXjTlW0DkqHg+YXWTEp37Lp+YCAeytJH
X-Gm-Gg: AYBFou3YYbqoAWsQqMfZl1gZE95ACeBRDlOtVzXatws4mVd47MEeghcgarh/ObvEtZx
	W1+R+PZS7VWX2DMRPUcHGkBpKD/NG894RXi75UcgX4rnuQLDvu0tOnJcMqQHzhqRXmhQBP23REk
	+7/nPYXt+I+Ds/nu/CRW3O4LJQddlE5CHq7xHrPioIwjOgvJKYUUpB+JfO8bMmCBW455lOulRXc
	/EbCbDdTkFYaOVJTHrZmsPOz/Rx5w90uChlthRB42s67NMM2trfU+590nAVpDFpVylC0T4H/U/w
	7A3AgGDVfWAz8POIBeWzbgAExyOwt4/EigXoW+Axh1H+NFy23QM+M5qjIP5Iz57mMZvl0zfVBpF
	3BfVKUMudqiKwV8N7wtHtY0OEhBtUiMY5gC1rpLp9kGmV8iAhx0soSFjL+RYCwBFX+cOMx38JVV
	Rt4UXglk+heRHne+yJUpl22pwKOH8y0RoBMiqrS5fSwO+wlzXP7Zts4nn0kZfx3eK+UfGo2Yqwu
	ko3F7nNU5yCpraYjnUoUYAA7wUAKyxA7sacdA2AczAD19WPuLRacAa51MX1hq1WmGtqMnoZQi1+
	WgkxDS/JDLCCVrlCQDU=
X-Received: by 2002:a05:6871:7a9:b0:46a:d6a3:8c22 with SMTP id 586e51a60fabf-486e4f1a11amr6340429fac.12.1789876745027;
        Sat, 19 Sep 2026 20:59:05 -0700 (PDT)
Received: from [192.168.0.197] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm4146915fac.1.2026.09.19.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:59:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 19 Sep 2026 21:58:56 -0600
Subject: [PATCH 2/3] kallsyms: Add 3-byte index into compressed symbols to
 replace marker scans
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ksyms-tune-v1-2-d85c97da1a32@gmail.com>
References: <20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com>
In-Reply-To: <20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789876740; l=7312;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Pmx36gQOuPwOlhgjUxsxj611prlgdw6+8eilpqQR+lY=;
 b=sfnlZSte8huyN8cCnE1xR1U7rA3Brj5kEawMEvQBh5NVii/Rmruw7ABN5HyiB9QXTp2QSXtta
 sKYKEPJ97U0B4tmP6mGtFhwtShBXwxL59FYa6SnhOLdAb2YhRBokaoX
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The compressed symbol table (kallsyms_names) packs ~130k kernel symbol
names, in address order, into variable-length records with format
[<len>][<tokenized-strings-wo-\0>].

This layout optimizes address-to-name mapping, but name-to-address
lookups require a linear scan.  To accelerate lookups, kallsyms_markers
was added to record the offset of every 256th entry, cutting the
worst-case walk from 130k to ~128 hops on average.  However, this
still leaves substantial work: during a 17-step binary search in
kallsyms_lookup_names(), the marker walk repeats at every step
(17 * 128), decoding ~2,176 record length headers per lookup.
Address-to-name resolution (sprint_symbol) pays the same 0..255 hop
penalty on every call.

Introduce kallsyms_names_offsets, a 3-byte-per-symbol direct index into
the compressed kallsyms_names table.  scripts/kallsyms.c emits this
table at build-time while writing kallsyms_names, capturing the exact
byte offset for each symbol.  Using 24 bits covers up to 16 MiB of
compressed symbol names, easily spanning the ~2.3 MiB table while
saving 25% space compared to u32 entries.

With kallsyms_names_offsets:

0. get_symbol_offset() performs an O(1) 3-byte table lookup, eliminating
   the ~2,176 header scans per name search.

1. Drop the legacy kallsyms_markers table, saving ~2 KiB of .rodata.

2. Unroll the shift loop in get_symbol_seq() to match
   get_symbol_offset() as a direct 3-byte big-endian load.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/kallsyms.c          | 43 +++++++------------------------------------
 kernel/kallsyms_internal.h |  2 +-
 scripts/kallsyms.c         | 30 ++++++++++++++----------------
 3 files changed, 22 insertions(+), 53 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index b9e573e9a10b..21adc5b74ec5 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -113,40 +113,14 @@ static char kallsyms_get_symbol_type(unsigned int off)
 
 
 /*
- * Find the offset on the compressed stream given and index in the
+ * Find the offset on the compressed table given an index in the
  * kallsyms array.
  */
-static unsigned int get_symbol_offset(unsigned long pos)
+static inline unsigned int get_symbol_offset(unsigned long pos)
 {
-	const u8 *name;
-	int i, len;
+	const u8 *p = &kallsyms_names_offsets[3 * pos];
 
-	/*
-	 * Use the closest marker we have. We have markers every 256 positions,
-	 * so that should be close enough.
-	 */
-	name = &kallsyms_names[kallsyms_markers[pos >> 8]];
-
-	/*
-	 * Sequentially scan all the symbols up to the point we're searching
-	 * for. Every symbol is stored in a [<len>][<len> bytes of data] format,
-	 * so we just need to add the len to the current pointer for every
-	 * symbol we wish to skip.
-	 */
-	for (i = 0; i < (pos & 0xFF); i++) {
-		len = *name;
-
-		/*
-		 * If MSB is 1, it is a "big" symbol, so we need to look into
-		 * the next byte (and skip it, too).
-		 */
-		if ((len & 0x80) != 0)
-			len = ((len & 0x7F) | (name[1] << 7)) + 1;
-
-		name = name + len + 1;
-	}
-
-	return name - kallsyms_names;
+	return (p[0] << 16) | (p[1] << 8) | p[2];
 }
 
 unsigned long kallsyms_sym_address(int idx)
@@ -157,14 +131,11 @@ unsigned long kallsyms_sym_address(int idx)
 	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
-static unsigned int get_symbol_seq(int index)
+static inline unsigned int get_symbol_seq(int index)
 {
-	unsigned int i, seq = 0;
-
-	for (i = 0; i < 3; i++)
-		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
+	const u8 *p = &kallsyms_seqs_of_names[3 * index];
 
-	return seq;
+	return (p[0] << 16) | (p[1] << 8) | p[2];
 }
 
 static int kallsyms_lookup_names(const char *name,
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 81a867dbe57d..430abccfab63 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -12,7 +12,7 @@ extern const unsigned int kallsyms_num_syms;
 extern const char kallsyms_token_table[];
 extern const u16 kallsyms_token_index[];
 
-extern const unsigned int kallsyms_markers[];
+extern const u8 kallsyms_names_offsets[];
 extern const u8 kallsyms_seqs_of_names[];
 
 #endif // LINUX_KALLSYMS_INTERNAL_H_
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index d996a43c4078..83a8747269ff 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -44,6 +44,7 @@ struct sym_entry {
 	unsigned long long addr;
 	unsigned int len;
 	unsigned int seq;
+	unsigned int byte_off;
 	unsigned char sym[];
 };
 
@@ -393,7 +394,6 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 {
 	unsigned int i, off;
 	unsigned int best_idx[256];
-	unsigned int *markers, markers_cnt;
 	long bin_start;
 	char buf[KSYM_NAME_LEN];
 
@@ -403,18 +403,12 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 	printf("\t.long\t%u\n", table_cnt);
 	printf("\n");
 
-	/* table of offset markers, that give the offset in the compressed stream
-	 * every 256 symbols */
-	markers_cnt = (table_cnt + 255) / 256;
-	markers = xmalloc(sizeof(*markers) * markers_cnt);
-
 	output_label("kallsyms_names");
 	bin_start = bin_pos(out_bin_file);
 	off = 0;
 	for (i = 0; i < table_cnt; i++) {
-		if ((i & 0xFF) == 0)
-			markers[i >> 8] = off;
 		table[i]->seq = i;
+		table[i]->byte_off = off;
 
 		/* There cannot be any symbol of length zero. */
 		if (table[i]->len == 0) {
@@ -454,14 +448,6 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 	printf(".size kallsyms_names, . - kallsyms_names\n");
 	printf("\n");
 
-	output_label("kallsyms_markers");
-	for (i = 0; i < markers_cnt; i++)
-		printf("\t.long\t%u\n", markers[i]);
-	printf(".size kallsyms_markers, . - kallsyms_markers\n");
-	printf("\n");
-
-	free(markers);
-
 	output_label("kallsyms_token_table");
 	bin_start = bin_pos(out_bin_file);
 	off = 0;
@@ -478,6 +464,7 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 	output_label("kallsyms_token_index");
 	for (i = 0; i < 256; i++)
 		printf("\t.short\t%d\n", best_idx[i]);
+	printf(".size kallsyms_token_index, . - kallsyms_token_index\n");
 	printf("\n");
 
 	output_label("kallsyms_offsets");
@@ -502,6 +489,16 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 	printf(".size kallsyms_offsets, . - kallsyms_offsets\n");
 	printf("\n");
 
+	output_label("kallsyms_names_offsets");
+	for (i = 0; i < table_cnt; i++)
+		printf("\t.byte 0x%02x, 0x%02x, 0x%02x\t/* %s */\n",
+			(unsigned char)(table[i]->byte_off >> 16),
+			(unsigned char)(table[i]->byte_off >> 8),
+			(unsigned char)(table[i]->byte_off >> 0),
+		       table[i]->sym);
+	printf(".size kallsyms_names_offsets, . - kallsyms_names_offsets\n");
+	printf("\n");
+
 	sort_symbols_by_name();
 	output_label("kallsyms_seqs_of_names");
 	bin_start = bin_pos(out_bin_file);
@@ -511,6 +508,7 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 		fputc(table[i]->seq >> 0, out_bin_file);
 	}
 	write_incbin(out_bin_name, bin_start, bin_pos(out_bin_file));
+	printf(".size kallsyms_seqs_of_names, . - kallsyms_seqs_of_names\n");
 	printf("\n");
 }
 

-- 
2.55.0

