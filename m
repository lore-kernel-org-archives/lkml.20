Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D48A48FF9F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588180; cv=none; b=fEEtf9GCJlai5jDPd8z1YsQo7UmNVvuCbIT7LSeouP8SFwLtanhE2xaDfCi84fbS22wlnWpBl5/bqk2lR1J0emA9MGsWcaLje8wuoV8mZ8hfkJRkbR1WCDcZJ54x06BGM8BtV13hocE1p2aaeOw2MrPLBYcy8GIqpxSpD+EzbHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588180; c=relaxed/simple;
	bh=Xp6EldGhCpScq6+E1e3tyP29mjoKY3JT7QmAWosGJVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYFNNzfMOlQnOhSp/dXNSvwn0owJu3Z10wykPff3WSp/pS0JVMOc+CGEQ8jADjLh7NtWde++EcpfqvdqnEyFB656j5wYNyk6kDvabA4XVTkwF5PR4HPcGQJNkbGStXGvOhamhZ8LRGgUPyJHZScv6YxI1olpUysIOwJQo8MzSNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7jxEQZW; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7jxEQZW"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341fe27b718so2771958eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588178; x=1791192978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USO8LHzJYI6ADnDxelNnKWWlJxVCalhkzQ5t9eKsIdw=;
        b=X7jxEQZWKebKJNKXQr9A42Mgp9DxlHxtJJyIePD0vXyvjbLc35FVTtzFazE3PidyGz
         6cuo5nQzt60VODmlY+c/pFyghK98YeCUxwWB4L6nz4U9VbU3KojIX61LopiPVGqvus2T
         mGeQm0fCM66SEnLNS3HUwU7XZLNRl3KIl1d60vieuy4k406fuhN0B0+ESFRpedwAn0Vv
         bYJ3wMXnFkXtTCk+WoKUGryISgoDkvQ4nOEkuqXBiGaSAaldg+PfvcmjZghjZWPtSYhU
         L+EzGT3OcPYvRIVqT5CaKtuk/d+SZRFn1MN2Q1JtL04wnz9M9lbyc6Gzu/BK0kXzRDdL
         J9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588178; x=1791192978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=USO8LHzJYI6ADnDxelNnKWWlJxVCalhkzQ5t9eKsIdw=;
        b=XdR3q4oF+NdsT7PeEF4QLGSQGk6O+Q/Zv8O4dmKM3w9Hl64aLJTg6DRonCQ5KVSQk4
         xJTL7+GkZYBiZNopalDPuPWiJDabbw8TXQulHyxOY5ljyz/gpq6UkybLl+ruiiO5rlaD
         K+BzrTJnzu66q5GNmfkSCmy0R4sTViZCjxlJPLIDaYHjCAjvZbbB67LC2DhymK0sUu3v
         cqZY4kCWqTb9WvcMqWkKTJHUFzRwV0mK+YVF4bQXu+zcW8A6NDJS2YHA0bdYFXyUpItU
         RkUZdGwWW9jxhhoesoNp6NkUQBZ935cwdzRvQFzj8loDD4XO0S+XyVOq9Px98q9ctICE
         f7vg==
X-Forwarded-Encrypted: i=1; AKwUvBy5XRgnM+Dt6LaHmXzItfIGcwe/EwsTNBTgcwxzeyy/J6t3bVEgGLj3yDot/bN31z+lhBRfx6y0oT8/k/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYImKIYLUDW6CBKSyjDncatk4IWOF1fKUr1gG94S+0PyzJ8drLa/
	aHLTjbDTCHKdXKDdefM+hqerWM0/wixJwspALgMS7cH696GpgaQz1Mx2
X-Gm-Gg: AYBFou0YR6PHcd09uxidn1Ywucf0VvS2NiH1R3MjaLjgx299M4YsdzLk85595n1fSJ+
	71N3//kCv/5QmtyQYCrCq7M9HI9EtLnZakfaDWYramMbaOwFVJNME4xEEO4+gdXzLzL2gMCPIE/
	ellrYHES2UDp0sXqE4gzHhium2SuxJPveRRfweukmxEOF51tMvyelQ2hCvofWr74oxvGcKyjttL
	8OsXozNehmN5ZWLzVK6mq2IWuaRcElqdvo+Jl4cjADr+1CGSttbXkncbY46FmAhSDL2JT6q0nhs
	Q6w0lytOo/kq27daOJXvxrSiaARcoQxO8VMZQeA9/FsNOAgeuB+0Qf5rkfucPf1Zwimp+lpenGL
	WJP4ppC9vOwmK05nIhZER5ROdKbSI2ZH9eyQxv4DmkeDzWstx4Kmx4pYCifPb3pFa6efPAFhXV1
	rm60t8DEQPf2Fh208B3I0pMxteGvB1/JEjRPqIFHqCEkIL1EjrWJDjLip1/Pmq44KuR6kZWQGFW
	o+9KAtdH08I7rd1rjUJ7/dlhj6FxcJxOAotuVtCq0OUxVrq76e+RoTELJ9DFbz1w3i8ke1yxULg
	KlAEJRShzjaRjAAEB21eJStLo4cfMZCPa1uX+9BrU/kQjOslHRoKVCNmo1X0XBTtnaS1A3VNwfv
	QJiv/Prb+QY5eOnixvPM=
X-Received: by 2002:a05:7301:52c1:b0:341:3b78:9e04 with SMTP id 5a478bee46e88-34272467962mr9150482eec.29.1790588177417;
        Mon, 28 Sep 2026 02:36:17 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm19014358eec.14.2026.09.28.02.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 02:36:16 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] time/kunit: Add tests for usecs_to_jiffies() and jiffies_to_clock_t()
Date: Mon, 28 Sep 2026 15:06:01 +0530
Message-ID: <20260928093601.79224-4-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928093601.79224-1-jain.sm@gmail.com>
References: <20260928093601.79224-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that jiffies_to_clock_t() and jiffies_64_to_clock_t() invert
clock_t_to_jiffies() for every clock_t value that is a whole number of
jiffies, and that usecs_to_jiffies() rounds up and never saturates for
any unsigned int input, both through the out-of-line and the
constant-folded path.

The tests do not depend on HZ. With HZ=100 (UML) the usecs_to_jiffies()
test fails without the preceding fix for the values close to UINT_MAX,
and with HZ=300 both tests fail without the preceding fixes. Each loop
stops at its first failure, so a failing run reports a handful of
values instead of thousands.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Run with kunit.py, filter "time_test_cases.*jiffies*", with and without
patches 1-2, on UML x86_64 (HZ=100) and on qemu x86_64 and i386 (TCG)
with CONFIG_HZ_300=y. Also on UML x86_64 with HZ/USER_HZ temporarily
edited: with patches 1-2 both tests pass at 24/100, 1024/100, 1200/100,
32/1024, 1024/1024 and 1200/1024; without them both fail at 1200/100
and 1024/1024.
Without the fixes, the HZ=300 x86_64 run now reports 15 failed
expectations (4 KB of output) instead of about 2,900. Prepared with
Claude Code (Anthropic), model Claude Opus 5.5 (claude-opus-5-5).

 kernel/time/time_test.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index 1b99180da288..77e1ec1d5d8b 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: LGPL-2.1+
 
 #include <kunit/test.h>
+#include <linux/gcd.h>
+#include <linux/jiffies.h>
+#include <linux/math64.h>
 #include <linux/time.h>
 
 /*
@@ -87,8 +90,84 @@ static void time64_to_tm_test_date_range(struct kunit *test)
 	}
 }
 
+/*
+ * jiffies_to_clock_t() must be the inverse of clock_t_to_jiffies() for every
+ * clock_t value that is a whole number of jiffies, whatever HZ is.
+ */
+static void jiffies_to_clock_t_test(struct kunit *test)
+{
+	unsigned long step = USER_HZ / gcd(HZ, USER_HZ);
+	unsigned long x;
+
+	/* Bridge STP defaults, exposed in USER_HZ through sysfs and netlink */
+	KUNIT_EXPECT_EQ(test, 15 * USER_HZ, jiffies_to_clock_t(15 * HZ));
+	KUNIT_EXPECT_EQ(test, 2 * USER_HZ, jiffies_to_clock_t(2 * HZ));
+	KUNIT_EXPECT_EQ(test, 300 * USER_HZ, jiffies_to_clock_t(300 * HZ));
+	/* Large enough to catch a rounded NSEC_PER_SEC / USER_HZ (alpha) */
+	KUNIT_EXPECT_EQ(test, 10000 * USER_HZ, jiffies_to_clock_t(10000 * HZ));
+
+	for (x = 0; x <= 100 * USER_HZ; x += step) {
+		unsigned long j = clock_t_to_jiffies(x);
+		clock_t c = jiffies_to_clock_t(j);
+		u64 c64 = jiffies_64_to_clock_t(j);
+
+		KUNIT_ASSERT_EQ_MSG(test, x * HZ, (u64)j * USER_HZ,
+				    "clock_t %lu -> %lu jiffies", x, j);
+		if (c != (long)x || c64 != x) {
+			KUNIT_FAIL(test, "clock_t %lu -> %lu jiffies -> %ld / %llu",
+				   x, j, (long)c, c64);
+			break;
+		}
+	}
+}
+
+/*
+ * Every unsigned int number of microseconds fits in MAX_JIFFY_OFFSET jiffies
+ * for any supported HZ, so usecs_to_jiffies() must never saturate. It must
+ * round up; when HZ does not divide USEC_PER_SEC, the reciprocal
+ * multiplication may round up by one more jiffy for large values.
+ */
+static bool check_usecs_to_jiffies(struct kunit *test, unsigned int u,
+				   unsigned long got)
+{
+	unsigned long want = DIV_ROUND_UP_ULL((u64)u * HZ, USEC_PER_SEC);
+
+	if (got >= want && got <= want + !!(USEC_PER_SEC % HZ))
+		return true;
+	KUNIT_FAIL(test, "usecs_to_jiffies(%u) = %lu, want %lu%s", u, got,
+		   want, USEC_PER_SEC % HZ ? " or one more" : "");
+	return false;
+}
+
+static void usecs_to_jiffies_test(struct kunit *test)
+{
+	static const unsigned int vals[] = {
+		0, 1, 999, 1000, 1001, 1000000, 1431649098, 1431649099,
+		2000000000, 3000000000U, UINT_MAX - 20000, UINT_MAX - 1,
+		UINT_MAX,
+	};
+	u64 x;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vals); i++)
+		check_usecs_to_jiffies(test, vals[i], usecs_to_jiffies(vals[i]));
+
+	for (x = 0; x <= UINT_MAX; x += 999983)
+		if (!check_usecs_to_jiffies(test, x, usecs_to_jiffies(x)))
+			break;
+	for (x = UINT_MAX - 30000; x <= UINT_MAX; x++)
+		if (!check_usecs_to_jiffies(test, x, usecs_to_jiffies(x)))
+			break;
+
+	/* Constant-folded variant */
+	check_usecs_to_jiffies(test, 3000000000U, usecs_to_jiffies(3000000000U));
+	check_usecs_to_jiffies(test, UINT_MAX, usecs_to_jiffies(UINT_MAX));
+}
+
 static struct kunit_case time_test_cases[] = {
 	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
+	KUNIT_CASE(jiffies_to_clock_t_test),
+	KUNIT_CASE(usecs_to_jiffies_test),
 	{}
 };
 
-- 
2.43.0

