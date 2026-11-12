Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794503186;
	b=CR/L966ZvT1Ga1a7/QPyzX4+qeQ1tcA2c9pU+Mbf/JEOjGeQgJxl8kDeOJOP51hslCyV
	 drZ+J+vGVxFHWuSl6H6UHjyVyNUvwB79/9F+D9iYjfB0cO45o1PMmQENmlOCPnmtZ/tUO
	 eiHuPCl1mfB4azee/EMZ84ULUOaCJXG3LB6qGgKS7aEGq+DMLc42dP1nR7juJ13atX0q1
	 i5SdLf6PsRx57D2wpV/CXLKX/RIeuFqi+bCBKt+vVerGAthLmK5479YwFZON3ejD15b8r
	 kCqvbU09QOcsxqMb66Ny/+5pPUURBDCit+mmQw7SZVoSrh+LB/n9rPjLCYZmHseD5xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=n1UFYaTUgMxyzKDugLadjgfN92wam7xCBrE6jHJt4/U=;
	b=wtFJtPF/GGgQLKtlFaE37Q1JzZagCc8PDSisCHpJLC1YZmqTipKcmATeJf8AlMW4u+KD
	 qAPQl39YWpousmbJyqYm9Sbgqqb2bJXYp3aIP0ch3yzmvqUEa7T1H68IaZ9sahJ3+GZZi
	 KkZRxbnN79T2cBsc6yQ1xxhzEc8ZmQsj6sVb7CLrJc/0pI07UPbFK7j9WUFNAfZo1H2e8
	 E5Tq8XFziuroX0hd1htJPYuOazlT3Qkvr2lGNnBD9XFswC5wKT0HTZUxexjjwsZYSdoQH
	 Hfqt1AAgoFsBT3In82OLFrLAxPNimwrg7XnfUxr9m03vvLc/MnaczQh49ULxVQ3YM+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4t4Zafi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1118606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1118606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4t4Zafi
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso2100093a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794503185; cv=none;
        d=google.com; s=arc-20260327;
        b=FEmiYE/ELVLVq/V8gZJvGDO1pFlJC94EBOEpEN7PfxH7Ds+wAqlkECszynQQD+elzn
         Md2NOgPFkZSIBCGCtYucC5Nq1moWTekKxjWXGiolnozFP5GkR2W+8XKIfWR1UoGiY7QF
         vOnxlmDwMFP0D++y5qNRaQHo+nJzw3XAeoa+afpnX3VlcrwOKA+KjiEOL3GmEuOMRajp
         7OdMi74b0XPpfJGuz/278e5tkPxWdcLh45lV52wh8jtSdbT/2Chf3c7jRabkRHsPkZ54
         rTkEOD7uxNipS+VpcSZ3U72+kZkLD72A/N1+xSowVgxDrm1WHTEK5uELOdr0HLriv7aZ
         bTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n1UFYaTUgMxyzKDugLadjgfN92wam7xCBrE6jHJt4/U=;
        fh=p+gG2ri2udapReI5f1sQszkKFIYd82Ros4m2TWtZavI=;
        b=Wpj9C8CvctTorbgq5mYEh6jXfap2ZEA4JLCc1NzZsBD42V37XyCeQ0o9O6UJfx5dhm
         clik9PycjMOGqu6A4GArQQ0WFZItF1h+J7hFxgtxoL/evEe0/75BbIaerQPVo3IM6IKN
         1vnLnMDjH1wSFUKNMpPlPed4lCBrkwrjqHPlZw5WBfG73ZRI1GXU3RQWVFsRbev82V8X
         S3eiRkI3e/QVcvLIV04mIVhtxcGNX0tpp0PslFBseXedffN9TXiBd37lS/PHZTFTbSnW
         iFu/jQWKQohqXE4LCGbmAO1yTHwQDxMYJub2FSoVWp7VUcVFUGyEoDQFfRumIRdDhGaU
         X90w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794503185; x=1795107985; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1UFYaTUgMxyzKDugLadjgfN92wam7xCBrE6jHJt4/U=;
        b=G4t4ZafiTziELVVr1FXyuIirw8jqTgQNi92J9ZUtw96wy4nmfD5jWCUsHYuMnbMeTk
         UyLEjywopFcNQfLI1wjAt4cAFrOIMxOfKLvX9/XKkt1GD1MFOQ/re2cyxNTfe83speWy
         eSw/27Eizb+HWulX9d0+9JZ7E+mUb5jwSuVfhjyXPi7Fr+TowFuna82zGdZsG0c6485i
         G9NStxBt5bG0erCWLfmtCxlCSWjayOGuYkIDS3m7ApNVU5l3vu248UZQy14jL88mHUdq
         408x0hPXWvonAZS3KS0jCl0GrgvQvIRxCf0M4aVaxHmFV88mtS+xzh7qKnm15cbWOMQ4
         dXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503185; x=1795107985;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n1UFYaTUgMxyzKDugLadjgfN92wam7xCBrE6jHJt4/U=;
        b=KwjNGffvtHq1uyBC5b1ZFwztVWQdx41TUAWjwA/J4s/4D+WbUxTncNLwn3oonri+SS
         8Kd0V5RSTWtScZ1Jd5RdGr5fyZ/262dyKDH7JLoFDib2aJDv9maazPxmpwgKUZg68zI7
         LNMWGZXiBfXMFMT5WyYFy6nmtApiyb+YgianDav3/CnrwrCbNg84pQPX7owOlBiWdZRc
         UNQZwwAz9Ro5quf8ajnqSo0GSkMwFxvxF0GZZiUTm2cSZgEaONTz7kYo2aaML47jlOwr
         /Dc7ebPJLXBnfwsAH6Oojq8Vks7wz/6xeBBCjqpqK9JKSN0n1sKKS+yaE87Ydt1xiZa0
         IRgA==
X-Forwarded-Encrypted: i=1; AL+hErFzit2ZZ2MP4OkY1+LcdiYr2in54nOhxqq/3lg+NEv0w0AKxTWK76K14bpxKmvQSIQPGcc+KJvH/tNeqNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9DH3fEytTgEgu2tB2Imwu7hBU9FR8lB8N76h/jgDLwyQUCv+l
	YyvtKkvJHnFhGaGUPK0KSAf5wP/T7pJak76/JBIDqKWLZW+hNYIhA5aCwQj5knUTG4NTp5J27Iz
	+HnqAmtvrcvvHyPHGfazKQ+sUgBOLJYw=
X-Gm-Gg: AYBFou3tWWR/QhlFMSiqgl7YK+P3EcRYcFt6ijgCJJt2ypmCEiST11joTfjZSZPJIEy
	8iCWHUijm1HRw9Av2KDOWLmKUlQpR4ei75Vsgvc7ztDJlvY52a8P6DSerWMCHiPDmkZekhuRVAR
	4grWUuoabSlBNwts6uiLGoRJdsAKyucC0Hj306Evl8kaxqnDeevgB8R3B83gZ7du16nyXPCI71Z
	vD9DI236kf7kxNjiCnIJfALxyOi7h4x/19q+s0tLSExrz0stORz157hsABByqIgs6CcM0yfJIGp
	3wVDmTiTcuxM45zdUmDT+dRN/4JH6rctjgzfKwHhjDNo7WJeGrXLdyj0kVwTlRicgxXYwMk3XNr
	0R/o8XVhsfgsZ6dnlmJ43My75VuVFhai6n1n+IYJSOFd+saDNJJF7qOTZBE3rPKG5CVYyVuMGv3
	owLr1VLqHpWoIh8nbU4w==
X-Received: by 2002:a17:90b:5347:b0:3ac:b6eb:e0dd with SMTP id
 98e67ed59e1d1-3b182f9bcdbmr6127741a91.50.1794503184714; Thu, 12 Nov 2026
 09:06:24 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 12 Nov 2026 09:06:23 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Wojciech Szpucha <szpuszi@gmail.com>
Date: Thu, 12 Nov 2026 09:06:23 -0800
X-Gm-Features: AclHuK_-710F4Tm24mSZpzGA3sLAhRVHhRU-7oKpgPopwSYPEC_JfCwLpT3pf_Q
Message-ID: <CAAcuPuJUt=Qf6uuTVv63jiY_iCjsvjso1T=WYSFQB=i6Wzb2Vw@mail.gmail.com>
Subject: [PATCH] tools api io: Return high-bit bytes as unsigned characters
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Wojciech Szpucha <szpuszi@gmail.com>

On signed-char builds, io__get_char() returns negative values for bytes
0x80-0xff. This makes filename__read_str() silently truncate non-ASCII
input in standalone libapi builds.

Cast the byte to unsigned char before returning it as int. Add regression
tests compiled with -fsigned-char, since perf defaults to -funsigned-char
and already avoids the issue.

Fixes: e95770af4c4a ("tools api: Add a lightweight buffered reading api")
Signed-off-by: Wojciech Szpucha <szpuszi@gmail.com>
---
Tested on Ubuntu 24.04 x86_64, GCC 13.3.0: standalone libapi reads 0/4
bytes before the fix and 4/4 afterwards. The API IO regression fails
before and passes after. libapi and perf build successfully; checkpatch
passes. Full perf suite and kernel builds were not run.

https://github.com/szpuszi/linux-perf-io-test/actions/runs/43257707229

 tools/lib/api/io.h        |  2 +-
 tools/perf/tests/Build    |  1 +
 tools/perf/tests/api-io.c | 33 ++++++++++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/tools/lib/api/io.h b/tools/lib/api/io.h
index 1731996b..25e2008d 100644
--- a/tools/lib/api/io.h
+++ b/tools/lib/api/io.h
@@ -91,7 +91,7 @@ static inline int io__get_char(struct io *io)
 		if (ret)
 			return ret;
 	}
-	return *io->data++;
+	return (unsigned char)*io->data++;
 }

 /* Read a hexadecimal value with no 0x prefix into the out argument hex. If the
diff --git a/tools/perf/tests/Build b/tools/perf/tests/Build
index 58858f3d..c3ba1fca 100644
--- a/tools/perf/tests/Build
+++ b/tools/perf/tests/Build
@@ -79,6 +79,7 @@ perf-test-$(CONFIG_DWARF_UNWIND) += dwarf-unwind.o
 endif

 CFLAGS_dwarf-unwind.o += -fno-optimize-sibling-calls
+CFLAGS_api-io.o += -fsigned-char

 perf-test-y += workloads/

diff --git a/tools/perf/tests/api-io.c b/tools/perf/tests/api-io.c
index 0ba3d5cc..f283712e 100644
--- a/tools/perf/tests/api-io.c
+++ b/tools/perf/tests/api-io.c
@@ -98,7 +98,7 @@ static int do_test_get_char(const char *test_string,
size_t buf_size)
 	for (i = 0; i < strlen(test_string); i++) {
 		ch = io__get_char(&io);

-		EXPECT_EQUAL(ch, test_string[i]);
+		EXPECT_EQUAL(ch, (unsigned char)test_string[i]);
 		EXPECT_EQUAL(io.eof, false);
 	}
 	ch = io__get_char(&io);
@@ -118,6 +118,7 @@ static int test_get_char(void)
 		"12345678abcdef90",
 		"a\nb\nc\nd\n",
 		"\a\b\t\v\f\r",
+		"\x7f\x80\xfe\xff",
 	};
 	for (i = 0; i <= 10; i++) {
 		for (j = 0; j < ARRAY_SIZE(test_strings); j++) {
@@ -290,6 +291,34 @@ static int test_get_dec(void)
 	return ret;
 }

+static int test_get_line_non_ascii(void)
+{
+	static const char test_string[] = "a\xc3\xa9\xff\nnext\n";
+	char path[PATH_MAX];
+	struct io io;
+	char *line = NULL;
+	size_t line_len = 0;
+	int len, ret = 0;
+
+	if (setup_test(path, test_string, 2, &io))
+		return -1;
+
+	len = io__getline(&io, &line, &line_len);
+	EXPECT_EQUAL(len, 5);
+	EXPECT_EQUAL((int)line_len, 5);
+	EXPECT_EQUAL((int)strlen(line), 5);
+	if (line_len == 5)
+		EXPECT_EQUAL(memcmp(line, test_string, 5), 0);
+	len = io__getline(&io, &line, &line_len);
+	EXPECT_EQUAL(len, 5);
+	EXPECT_EQUAL((int)line_len, 5);
+	EXPECT_EQUAL(strcmp(line, "next\n"), 0);
+
+	free(line);
+	cleanup_test(path, &io);
+	return ret;
+}
+
 static int test_get_line(void)
 {
 	char path[PATH_MAX];
@@ -337,6 +366,8 @@ static int test__api_io(struct test_suite *test
__maybe_unused,
 		ret = TEST_FAIL;
 	if (test_get_line())
 		ret = TEST_FAIL;
+	if (test_get_line_non_ascii())
+		ret = TEST_FAIL;
 	return ret;
 }


base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
