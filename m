Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580920;
	b=c3EPW05x/049MlhCqOV1GORmnrY46ug3Wo1/r4pgHjTXF+aJmOPHkeWLMF3z8xTSnyE/
	 Tpy1zW75185B6rIzk1QNBrWZOc3jENOlNG29Jph941ANf7iXU9tsy9GONsDJL0cLpuUMW
	 ppkmqmVrVG3Cx29/BnVcbUMjjSmDxcIDkIf0OffACKeS3hGYTH7vJakaq6U4KIWh7TOGJ
	 rbLgCRQq99P2UJeIFyaVRtH6L5JoSFc4ZJMdvoK/eDWSpPP1F0PJahe9LrKUhjzrkNYG9
	 ++sd28685kysxR+VYdEAuYdDA4Ei7Uv0BTx2P0eDDlQ/vWBS+NJfAqKkP38YAUaVZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CiXWSOCQY9F/qEz8r6kuggzV1pS4d0clMFEYIU3zEYw=;
	b=qDx+2NsWA97ysbGqUexDCb5fGoI1YrJ6mngRlxJNy4rDf/HVjKJIYzu8e4Y9bcA3XVar
	 xBfp1yToG9tglSK/HASTJ0aUGcnI2z4nvVz8qRmay2g6HnT6Qc7TH/+OBLohPToUFVQKs
	 EFgM2KDp0cQ6c86MUcGRdr+2CYhVC/VG71RZMl7+rOgclUZNct1+AI27DLIODMiFca0WP
	 CVhDj3aPodD105AJolosEgbkduxpg/Of3QVQFYtZMl4q0GpIpNfL383pDDUqDHziN/X7j
	 p9F3itNfNdm4urcPS9sTanN6rRzSpY/B/8XqrWYPjyw2DTyxXDBud/+5Mvlv5Iuxkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="J/NCvskP";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6E606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J/NCvskP
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso279468eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580919; x=1793185719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CiXWSOCQY9F/qEz8r6kuggzV1pS4d0clMFEYIU3zEYw=;
        b=J/NCvskPCY54i0G1vAiGQ2vaDqqPXiT0XMF+DeUAhOl1mU2VtHxekSKrseuCCYKxH1
         6yu4F9RwhtyxKrFgX5uFtQitW4a6WIonkjz6TtQVh3qOjmvNvdp/bYLqZwMrEhCqEiAF
         tWZ3GC2Qq15HJV5GvvlUfZ+p2mtAuFc0dEv50XYCTC6OxQgQb1qxqpb7dSJNC1a7GIcL
         /ss5Sf8SiByscyifTiYn14IkoqTzTUefsGnJbGG/Ykw5RWG9ILUzjrRr74RjeGtD5qDy
         WZVNN/n23tEHMqWN1b0LIw0ozb94lGpFxIG7sMYSCM7z/FV/Cm/zUKWUkDgIVNs2ZaaE
         I+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580919; x=1793185719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CiXWSOCQY9F/qEz8r6kuggzV1pS4d0clMFEYIU3zEYw=;
        b=LMNpsG5gtE2ajbW6smjOQfhmKuiwKFhJBFwuLnsBKigR/UwsY9B+Mupq/IV0gqrsJG
         CdQekAf4OmEGqDZ63SsZ9QFza+XfGJHZDlW9Fr4Ohr+J9rBlPBC6RkRVsOxGquGKi2Nb
         Sb9vxsMmSbiMhFpElRdPe9QOP5Wn/tpsxcYK+QQuD2aeLDrZMHsnyKnB4m0gmYYGTjwn
         BpsIdVmCSaaRtxtopZC/QKDj09+R4p2GiWpjhek6XqTxD0KgnAi2y2uczunIisAGDOCE
         RJlzFQH5qRkGOMMw4A8MqrGCOKNuJnL+G07UckkRVKU7otu+E3Bs94twX2vB7oo27KOC
         iQpA==
X-Forwarded-Encrypted: i=1; AKwUvBxvp3SRYFDiNFDXy6o7pxS0CiMW0d0/eOSqCHvDro7zDZ9DopMQRPt0abjWleij6gE+erAiuWwmtlc5AB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN1JvNVWzDjPOwSLfbIJls8Si+eGY4AIhzbMiy3r7mHAScHmvr
	PNTbqrrNySUt3rlJyrtqCSX+8IdoY6FtRrohxnwKEvCbfUBgdxYdk7CB
X-Gm-Gg: AYBFou1lpAQWBEf11ZZuVJ6u76Sj93aLcc2i/aiJoTtT8DHFM/6jvuq0rDN54RRNQmv
	2dSSydCzyxZ7vC+sUQngW1UqpNR6dqEL/r8LHXmZIkgEWr6fklCFztlzezICkHMDbUV7VOnwcvN
	wzJ5/v7tFaptPw42lYRYPq4kX+Y97mZl0pZyo57HGSTxJgwE4UG9BgCEfUmB+GkIY/2DWW54otg
	dhTd+qd/b/pPmrCq2qf4Ax3L7kstdavZO0MysHGrcRC1i5Cbsh/D2zuQS31yFBbRSuNoTHZGbll
	8gFR8HnnVk+zioHaY6jBBqZb9V0Tq5qJhZL+/mYIk9jkgsfE28fS5pOB8cMdpLg5LPbXAyn2bCz
	+2OAItUB4ooXahuq5AGSUSalCthTJ77FBQjBfd1gN0FYyAS2MT9rLBQiY/YzqZ3cjLRKkSCCl2R
	cWTzzto2v9FX/etXxQXwUps3Rn0on8iQ61ch5EGVmeZhii1jy9l1rt7tUvEVtfJ289RGEzaJFOl
	JUJjllPiSJ2BF9mFcyNGbwW6OpWN0vlCCylV6L5x7PwFkgRkDYWknhj9x9JSasZHUGyQ5Wq9qZ3
	Rq0yI+0=
X-Received: by 2002:a05:7022:1586:b0:168:3243:c91a with SMTP id a92af1059eb24-190a55c2238mr2219336c88.13.1792580918645;
        Wed, 21 Oct 2026 04:08:38 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm5239811c88.3.2026.10.21.04.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:08:38 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pmladek@suse.com,
	rostedt@goodmis.org
Cc: andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] lib/vsprintf: Preserve the sign of seconds in %ptSp
Date: Wed, 21 Oct 2026 11:06:28 +0000
Message-ID: <20261021110628.37106-1-dennylin0707@gmail.com>
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
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
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

