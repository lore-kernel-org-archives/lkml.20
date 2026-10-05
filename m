Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64140479866
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196874; cv=none; b=gVjwSP+28Ix4RM7TFOxXhOkfVcT9m+rMHzybHUPCxVOl2s+BFiKbHw6MdrEFSw8ZHobqahjknA/J/5H74WJsyrck7tmOC/03XGsWV4LZ6PFAh2fr1XBAc6wOoM+PEjz4N1hB/WfS2SxXKtrX7ytzUZK0huIB9tZWxcbebQlfuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196874; c=relaxed/simple;
	bh=Ey1yYT9UnaRjm0CxbeGFRiAUqkXaMzeNCgWbC1W/PQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNP6QzLMZkdK9N4vNtzzD2ShqykDTrC/sZZpYLUH5vVC86noS9ndit1ch3LDaQ+ojhbLsWDtwQc2cXZRGpnHvSXQLJdnBm5sQPvFIOUb2RtRCz8JjJr0oR1yKoAyg+jQK9h1Cr/aZYVQoGm8WdbDcVhAqx7ikwUShDvX2YhK6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9zi+o9+; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9zi+o9+"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dd095da1aso1012156fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196870; x=1791801670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dABgea/zfXo4s11QxJz4tUQh2KTYl6wbNchnA/Xmw0o=;
        b=H9zi+o9+RNJ2/0cK+6ms1W5JrVFh74ejQFzKHjgJapa9jY8KWSZ+ZpBND6+cFtmHRj
         +LvudjnrZ8E9yb9z9g+T1CMA5R4MG9RBqFampPpcfE6IdVsatEMFZqJ0iiuWdboCAZwC
         EXaOdyN5oBpUokJUQ5CLSjDNdxZTqWoGlV5zUSBhL/lPcGVo112tgEByG+RycbDx59/O
         MaUTWktN8oy6GIR2hPUf/L6Wpp1IpGkHVpPSYgbwGoDifSccjkBm9HQ4FvltB4bNAoL3
         V41sfbwjXYZFfJaz5KtNj0fwKR2ZC0VjVeCKX7gQ8HCo1GBM/z0Aa5x65FnKlG/IuOmi
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196870; x=1791801670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dABgea/zfXo4s11QxJz4tUQh2KTYl6wbNchnA/Xmw0o=;
        b=NMyt62f17YdCzOt7OU8LXXgJTjNc4hu66IYzA69jaWISyZHPJLzvjWUtr0bMnPxDmf
         I/CyUTQrtQQmb3hELARHzZsn3u08OkK/Rp0gSHo4nUUhSI/tGxnO9DrjxvYDODttmdbd
         lgRX4VLve8F2W7KykwGaXRTlLUdpqZsLt+hz9kqNgQxqfrVrszqMFh3/p79LK4VlIXV1
         xOZ0RhZlznEyU9W4MWQfiWqGlg/aiawoZLmJOJm5vG5XE/+tEKgAy2cUpw0SDfN7CDHm
         9njGrjFR47vuzds4jW7FxxtZDwQRca2g7aniawLfSj8hIaedXZxz2XYg6XGKzszQ640Z
         mX2g==
X-Forwarded-Encrypted: i=1; AKwUvBysEKXDul3BcDgcWb5QXQxMR1RHtsc2SSr1FvCSFk/CXRBBpI5INPBblLgxdekGb8HVtA3C09f8eWoOQhI=@vger.kernel.org
X-Gm-Message-State: AFuF++mBZjWnRXQiXCtE5vqq3eBiLa2hlJ9hxSf2Iy6XpQW4WZyfbePR
	xlU0paSXsC1/dMFGrdEF4IUKUbX8W/JOy/IzZ2k0IVUf5SwMzrVpJT7t
X-Gm-Gg: AYBFou3H0aw8LUYyD6pLaaEeZPGO4PXXfgjFmW04l7irSVj+ByjD9CZ2xHNIP9apRXp
	7FJ4j1CuoFaVT8M15rUf//OvLu3Ed9A8oglgfi30Fzyvb2oj4r1dusiNxptHddRktj6wBf/TLw3
	LlfgEWAV7UyO/quObAYOOcqRt1RipWkNg/hKOfLI1/vD18AlHBc3K8VZV9gypWCSFLAIeGoZ5MV
	aaZs5EYkVTDHa8O0+s+bmrGXg7RVFJ0ocOV8jhQ2/ruYU6QOe5ZOAv9bl22Rn3Ga1CSlvKuYKgJ
	9jgmxNtdp5p1ybE8KIsG7bb8bHkebJfdcM7zmP3oHtrOP/TFRUKzaTwQqVorQGIzQpr3qzT4oV3
	+GG86Ng0C8FT3GZ4qcF3MmCMR6T6FBm672EcYbVtvQvPO7194MLH2fmj4lQcRnTSgNT0ctDfhzc
	0dV3Vv7shwGNmS3+f/q3rxMRcdgKH60lrRUalS2VY6NpFphh+WmiCRny8Om5HkE/J9v/i3MHFNP
	zxvm1ZgGQcx
X-Received: by 2002:a05:6870:d308:b0:49d:f5ef:5d3c with SMTP id 586e51a60fabf-49e15f5b9f9mr8956731fac.55.1791196870267;
        Mon, 05 Oct 2026 03:41:10 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:09 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] kallsyms: do not call qsort() with a NULL table
Date: Mon,  5 Oct 2026 05:40:45 -0500
Message-Id: <20261005104050.1786222-5-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

link-vmlinux.sh runs kallsyms on an empty input for the first link, in
which case table is NULL and table_cnt is 0. Passing NULL to qsort() is
undefined behaviour even for zero elements, and UBSan reports:

  scripts/kallsyms.c: runtime error: null pointer passed as argument 1,
  which is declared to never be null

Skip the sort when there are no symbols.

Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kallsyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index bd9e9ce20..9300e10ad 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -390,7 +390,8 @@ static int compare_names(const void *a, const void *b)
 
 static void sort_symbols_by_name(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_names);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_names);
 }
 
 static void write_src(FILE *out_bin_file, const char *out_bin_name)
@@ -822,7 +823,8 @@ static int compare_symbols(const void *a, const void *b)
 
 static void sort_symbols(void)
 {
-	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
+	if (table_cnt)
+		qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
 int main(int argc, char **argv)
-- 
2.34.1

