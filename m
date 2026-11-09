Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261297;
	b=HkZC5HgKWj9TVU9UX8/KyigwV6FfHj+uqqNTX2hUU7LR1QVqHwRD5zEj9gOYDIClQbtj
	 AL9qbe4K7uK7SYM+//SnGRcbOTuTLWSSRHjOZypX1MSYi6hyonSyiG0Q5se0LOSSKFu3S
	 i5GwYj6gDfRpydSwrftjAk/j6VzEwrbUwqtIFgCjAybPJLYcgxhEjHSmVcWIK73DoG1X7
	 pMHfUI2tYnInvdtqxpCiX5VsnfQoG4rqsImyvNUTwcl4aGPTYRPaZubndTdCbLr5dVTX9
	 xtDqqF0q/og2yItfGZhRCqaZZs8UhXdO2BpNzGQLIXYdNfW9jsWwGUQzyIKEgi1/n+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ROqczpwYwbeog2qJ+swl8u1dzKkVsoeYn9VGtSF4j4=;
	b=Vpu2+OQf3Tk2wtO00FOLoFDlzbabUgSDCktIoDMPnG/1337UZ0i/g5E5OQJZD1km8s71
	 Io5QH2NHJa7XN10KM0qJ2DoavqRxUrFhVKAkhefsY6hRS7Q3tylqa/slztqkLuACSRCoz
	 xECur2q9Nl/G+cuJ/sCxeMtVFyT4010eI9yS/cqms7qFOzLeskUzslkiCRtKLoaN3BL8t
	 evZ4FCopKFN5duOAkB6zcKef3GLsBERmdKl1tEyuYZtffjxTRjOPcFv23gmyiJVGOxxeX
	 5sN2rA7Ee9zLBfDJ6uYYMUjzPOAki7P+5VS5quN/ACZX8WVzoS5YNi99BPWM26tUyww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIKhMw4n;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE8C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE8C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIKhMw4n
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso1048895eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794261296; x=1794866096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ROqczpwYwbeog2qJ+swl8u1dzKkVsoeYn9VGtSF4j4=;
        b=UIKhMw4nmfp/6CP8G+O6iwCzBX7LdQBK8uAqw7KlAobt+1S5pq7JNy+eSzLZk9VXf7
         8Dd4f/Th447tAlovVXrrgdRKU5K5kK2pFmS2iRweNdsX+T/YvWljft1mAtTG+NTFzFS/
         MDbdhxGtQgUJVvcDsF441U5xgh/mZ2PqwsAfQc/C2nrOXV7iyx6ZXK5UuoXQJ8ugJikF
         sUQrPwR3AOecXerpQ2oD3LDtMqDFwe/Ln39/4ZVJunuXaWcb5pEIWGAjJPvFzfEKdhYB
         BPmfjE8Aa+mL0EaTQAMICqzZVWrjZe6KkVNhBS+BKNtJAr74SBCtFouuy9L9wdLEDh5C
         nTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261296; x=1794866096;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ROqczpwYwbeog2qJ+swl8u1dzKkVsoeYn9VGtSF4j4=;
        b=cYG4+oDaNUdMhdf2NfRWvsReVMqJd45ALG+BLqKUcWQA7nWkV/ArWmrG+8FFhLFAyJ
         s4eJsVVBRa4dQChAReRgVqjSnC6LjTdElHFc/K5tyXEQ8ky3AHdTqtQiePJFiXI3XMze
         S24LrdvFXYwYczG/KfQU97CQKcTQv1L0q4Zu+92Kjx1ZPBcfPM1jEs4dcbfwC1WJVLbn
         TFiC1PKZ8U+OWBJMBL2ywWLNF0D5zt9AgqjwTLJqz3Nh5JfMpT1et7u6p1qCZAgcJABb
         kZ1jJD/jdkIJGJom84BN+/eNDsmGCbQBad32d6q8GRwRYuPYTFJ36JAi4kxS+JG+qzbM
         ejTg==
X-Forwarded-Encrypted: i=1; AL+hErEJsQpg/xNWUGyipyurSvk9mhkfxsF0zpnjSp3nuRiHJGfBVwiEL4BWw96c3I6aP/zWPTHHLMOYYgxZQbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JWnYDIhpc+GIpxOMSsl3dnhj0zgKGJWxfgX7velD6XMSm98fJ
	y+8OzuXaKJIuXRRpf5PDbarzJcbDfR6TxXDFir4SD086PhP4dznJKqwq
X-Gm-Gg: AYBFou2JnJU/CAEIskaCK2XYWBUzSBmbVGJ09gzn4baESjTzNS/e0TlMboBhI7AOvz+
	rHLHIYmz4LRFSpKeKb1jL+ActHNoSCrY0+u34rllsISvsxHS/wOSi/UeaWYKAcHh5XJCYJYOy7m
	SMyov2RlCxj9LLcWxGeCoY5sW1PDv6DHuPB26YGxeBeUVQTAsYYTqqJ42CUajtM7dF2h/AnV5VT
	PMBLECqkIe8luDVnieTVvDEMclq3YR/5lSvLMORDR2Si2+XUtquIfWayQf0k35nwSEzbx4x3pKj
	gv5MRDZGNFzCRz4/u36XkcETgrw0YL2av1ln3MbOZY6fOYpySp5DCWfWwpaQKL6LwoYhO5EqbME
	9wiPbqgNETGBq1hW3YYaOlY5dkleaab6j0cVBD5QS94b2nobmJFZ+r7rUUs+P0yyksfFBHHerls
	/SRa7uHM6Mx4mBJH0MqD35E666OIne00mnZ0H6NXI/oPwh6rzOoStfjHnZ8aRNFiH3razOL6KYh
	aHEaaEjKzYeB2VrKfZXTX8OBEekYhUbwcevxWux6LiTDcvzjVVGH6cNb0c5m1z4HacBiL8JjwYU
	l0j9cVck+ldZjomVo4ymq/x7tzH8LTONWMVdVkRtvdj2EM0HKzv+RaFb3shKiyFaedhJXW4D7gn
	O7sXVWrj74qn99diYNCGlGL0nJ73CE66PsOpUrw==
X-Received: by 2002:a05:7022:3f0e:b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1b3b6008f1fmr1053002c88.27.1794261296137;
        Mon, 09 Nov 2026 13:54:56 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm2198408c88.5.2026.11.09.13.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:54:55 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pmladek@suse.com,
	rostedt@goodmis.org
Cc: andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	keithrteeple@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] lib/vsprintf: Preserve the sign of seconds in %ptSp
Date: Mon,  9 Nov 2026 21:54:45 +0000
Message-ID: <20261109215445.43419-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The documentation defines %ptSp as equivalent to %lld.%09ld, but
timespec64_str() formats tv_sec with default_dec_spec, which does not
have SIGN set. Negative seconds are therefore printed as unsigned
values: {-1, 0} produces "18446744073709551615.000000000" instead of
"-1.000000000".

Negative values can arise from time differences, for example in
fnic_get_stats_data() after the realtime clock steps backwards.

Use a signed decimal printf_spec for the seconds and add printf KUnit
coverage for zero, negative seconds and the signed limits.

Fixes: bccd5937447f ("lib/vsprintf: Add specifier for printing struct timespec64")
Cc: stable@vger.kernel.org
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Keith Teeple <keithrteeple@gmail.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Add Cc: stable@vger.kernel.org, as suggested by Andy Shevchenko.
- Collect Reviewed-by and Tested-by tags.
- No code changes.

Previous version:
https://lore.kernel.org/lkml/20261021110628.37106-1-dennylin0707@gmail.com/

Changes in v2:
- Add default_signed_dec_spec with an explicit field_width of -1, as
  suggested by Andy Shevchenko, and use it for the %ptSp seconds.
- Keep the test cases unchanged.

 lib/tests/printf_kunit.c | 15 +++++++++++++++
 lib/vsprintf.c           |  9 ++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index eccf041ebd56..3bd5115c2eab 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -572,6 +572,21 @@ time_and_date(struct kunit *kunittest)
 
 	test("2019-01-04T15:32:23.011235813", "%ptS", &ts);
 	test("1546615943.011235813", "%ptSp", &ts);
+
+	ts.tv_sec = 0;
+	ts.tv_nsec = 0;
+	test("0.000000000", "%ptSp", &ts);
+
+	ts.tv_sec = -1;
+	test("-1.000000000", "%ptSp", &ts);
+	test("1969-12-31T23:59:59.000000000", "%ptS", &ts);
+	ts.tv_nsec = 999999999;
+	test("-1.999999999", "%ptSp", &ts);
+
+	ts.tv_sec = S64_MIN;
+	test("-9223372036854775808.999999999", "%ptSp", &ts);
+	ts.tv_sec = S64_MAX;
+	test("9223372036854775807.999999999", "%ptSp", &ts);
 }
 
 static void
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 1d95ab9314bf..50b99ec091a1 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1028,6 +1028,13 @@ static const struct printf_spec default_dec_spec = {
 	.precision = -1,
 };
 
+static const struct printf_spec default_signed_dec_spec = {
+	.base = 10,
+	.field_width = -1,
+	.precision = -1,
+	.flags = SIGN,
+};
+
 static const struct printf_spec default_dec02_spec = {
 	.base = 10,
 	.field_width = 2,
@@ -1998,7 +2005,7 @@ char *timespec64_str(char *buf, char *end, const struct timespec64 *ts,
 	};
 
 	if (fmt[2] == 'p')
-		buf = number(buf, end, ts->tv_sec, default_dec_spec);
+		buf = number(buf, end, ts->tv_sec, default_signed_dec_spec);
 	else
 		buf = time64_str(buf, end, ts->tv_sec, spec, fmt);
 	if (buf < end)
-- 
2.43.0
