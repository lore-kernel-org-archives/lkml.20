Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B191DED4C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019958; cv=none; b=Hu3VslV6TnOwyoUSZ4C2RnhNE8d9PWS0C4o0npNbxF5de4RRHQymq08W5BxSeM+2uGmW+0U94Q845TIxlTaA75ibMOqjAIdNQjgKPJfqp+26JBDJ5ZTbETM5RIu5RYSVWSl2SKww47Yr2DMyWvDyYvrIAk3EKo5mzh5Ehjy1cDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019958; c=relaxed/simple;
	bh=eG5YIgzMXOcqCGT4Jk4z1BaOWdy58axn9+gMXOnSjcc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ReBw0a2uN3HY2YQfyzVlN3hvkAq4ETNv2klwufqfq1f6XVt+5pSa7IDF28d67TQP2ZKdBTKLU41alz6nl9ysErI3zopQ+0mNB7NoTpoz8v2RW2dbdSG2Mntdzh0Uv3Wa/fe5W8IgmUxmD3ZbaYnfmR6jRt0kM3iE0P/n3ZnWVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuJ/d9A+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuJ/d9A+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so16642455e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788019955; x=1788624755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mwv37PIwHKtQkJcGqM8sABqKx/v0w6p6ScVxoJmsNZA=;
        b=DuJ/d9A+YE1XMOlYaGuaTIqk+iKdmYRUmYwoWZatDFUjs0a5CK9Lqv3473SFYrpsXN
         z1jIvIHE/0ccqSx1AmhHaU/FMtEk9/LD6QqbwEPPs+nUcIYFduGpzscv1EmkAsCjRKLC
         r+EkTZwHW1kI68B+E5ba4QogdhQe/uMXm4VaNNgxATlh/CkFiRmGQfTF8KKtddiqR4rH
         /Qr9DDqkXb28RnUJl4+qRC8hnpRDwhFwSlLJbgRxrCaM0lffRr+y6Yxm8pGPADPAUXV7
         SQ63CvI23ywclRzct+wgnPgwQbA4Bj9AJegqxcx52y4B3qaQtXvWoXqtr18sHGrdA1h5
         fF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788019955; x=1788624755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mwv37PIwHKtQkJcGqM8sABqKx/v0w6p6ScVxoJmsNZA=;
        b=BJnb6ZSexw///9ViOdwxQnrksmDoct5jb2X9Jo4DiXnayhJhL/ARIr8BWLPmSDMqzN
         0Tet+PlLcq3prG7TQow34+xYKhoDXMXgbEVWRpmZirfJyrC38e7h4S9kU2Ii+GAfE135
         XkAqNk0ziftjpnngUlEfGJw/EXp/caFZVMo0MndFYVhEc8qZoV2nwJd26I3qwY2dSF+s
         ORWZmEuo5uP1lynZjDKscwCf96f6GHRE1WgAVaeT/YvxxJq+De4Vz48CpTu8U5+V742R
         0po5bD6tus17huCslBpRsJFgPDDPwUbZZzkcN+PlPV66HDkt4VXo8oygDTmaTBOxFHm8
         YizQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy6d9NSV1WEQxF9ueKCyUPbxfpv/rUQB3H2wUUolh3GKqV37q4Zru9xNJVJKVdvDNd/+tRtJzfwjIh7nU=@vger.kernel.org
X-Gm-Message-State: AFuF++kM1JnyYdx0G5QtoxL0RrY38DaoCB+FyFHoHrK29KXpLwz7tcL/
	GLaa98mCLGS2Kgqe8DfEFKSYo5oiLZ1N3nIFjsST40IxgfvesMvE2N1g
X-Gm-Gg: AR+sD129ukhK7nS1Hk9DsX25bJ5ehLoh96ZHnFOrowtO95w3vx7ae3jgL4JxuKbbIlp
	5KHp3udXePGUWQMDkOtLCmMChFgl6Twg1+sX7yRv0jwb/MLIWE9mq3JKWWqAP1tXpPaDw9WDhdH
	eNW0I7LOmjfUjPo/20aIVRNkJB+11rzWbsx3MYFe1SEyxz0fFVHczVeORDR03MbsqvP7J+ErKL8
	mXyPBUJp70tQ/eYToeb5TWt3zlg0Pdld4kOuxuTMLwrcsa1nunLPBTxAo3q0m2GKm1/KJAy4cOf
	E2k38lGLtj6ZNr4U29jwTaXajG/51Suro23UEfgXY8JeJG5FDkaQ0KavdVwPVPwjRWxZbG3E9QJ
	TBAMvni5M4bz5RxdqDqTZ6wbmio5iVxr8NN3Ps9F/83lHMQ3A4ge1sJ87qjQJxpiJqWLW7uBm4L
	n9xEMQqm/11cR12WNnSxh01PGURAG5momcPqBYWohzysuS5f0ti+gy5RQhFdGcmMSBVUS8W68Wa
	40bStmu+ic9lMMh5qgetWdUIH68Hi4y+XTju+cCsqIH4oqM2cSez7AzWoYDWRfIS8rpJ/uyLYEq
	b/8QMypseHoWRgXOy8prAKYIEK9nYXJjhUDCg3OeXOyH6G0ElpgENn3kG7+q7I//ugBu
X-Received: by 2002:a05:600c:354b:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49b91c4fb4amr204036035e9.10.1788019954390;
        Sat, 29 Aug 2026 09:12:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf59324esm29871505e9.5.2026.08.29.09.12.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 09:12:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Deepa Dinamani <deepa.kernel@gmail.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] time: Prevent time64_to_tm() day truncation on 32-bit
Date: Sat, 29 Aug 2026 18:12:12 +0200
Message-Id: <8d421725051450cecf0a7e6d2c514b6926df43b1.1788019619.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

time64_to_tm() accepts a 64-bit seconds value, but stores the quotient in
long. On a 32-bit kernel the day count therefore wraps when it reaches
2^31, even though the corresponding year remains representable in
struct tm.

This is reachable when formatting externally supplied timestamps. For
example, NILFS recovery copies the little-endian 64-bit ss_create field
from an on-disk segment summary into time64_t. Its sysfs attributes then
print that value with %ptTs, whose formatter calls time64_to_tm(). A
corrupted image can consequently produce an architecture-dependent printed
date.

Keep the day quotient in s64 while leaving the seconds-within-day remainder
as long. Use div_s64_rem() for the weekday calculation so 32-bit builds do
not require compiler runtime division helpers. Add a KUnit case at the
first positive day count outside signed 32-bit range. The baseline i386
kernel returns a negative year and wrong calendar fields; the fixed kernel
returns the same result as x86_64.

Fixes: e6c2682a1da3 ("time: Add time64_to_tm()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Review notes:

  - On a test-only baseline, QEMU/i386 passed the existing case but failed
    the wide-day case with tm_year=-5879541 and four other wrong fields.
    Baseline x86_64 and fixed i386, x86_64 and lockdep x86_64 passed 2/2.
  - A direct s64 modulo emitted __moddi3 on i386 and __aeabi_ldivmod on ARM
    with Clang 21. The submitted form uses div_s64_rem(); W=1 builds of
    both objects contain neither compiler-runtime reference.
  - The narrow type came from time_to_tm() in the Fixes commit. The 2021
    arithmetic rewrite kept it and tested only +/-80,000 years, below the
    approximately 5.88-million-year 32-bit day boundary.

 kernel/time/time_test.c | 16 ++++++++++++++++
 kernel/time/timeconv.c  |  6 ++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index 1b99180da2881..8b718767b3baf 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -87,8 +87,24 @@ static void time64_to_tm_test_date_range(struct kunit *test)
 	}
 }
 
+static void time64_to_tm_test_wide_day_count(struct kunit *test)
+{
+	/* 2^31 days: the first count that does not fit in a 32-bit long. */
+	time64_t timestamp = (1LL << 31) * 86400;
+	struct tm result;
+
+	time64_to_tm(timestamp, 0, &result);
+
+	KUNIT_EXPECT_EQ(test, result.tm_year, 5879680);
+	KUNIT_EXPECT_EQ(test, result.tm_mon, 6);
+	KUNIT_EXPECT_EQ(test, result.tm_mday, 12);
+	KUNIT_EXPECT_EQ(test, result.tm_yday, 193);
+	KUNIT_EXPECT_EQ(test, result.tm_wday, 6);
+}
+
 static struct kunit_case time_test_cases[] = {
 	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
+	KUNIT_CASE(time64_to_tm_test_wide_day_count),
 	{}
 };
 
diff --git a/kernel/time/timeconv.c b/kernel/time/timeconv.c
index 59b922c826e77..292a855827b7a 100644
--- a/kernel/time/timeconv.c
+++ b/kernel/time/timeconv.c
@@ -49,7 +49,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm *result)
 	u32 u32tmp, day_of_century, year_of_century, day_of_year, month, day;
 	u64 u64tmp, udays, century, year;
 	bool is_Jan_or_Feb, is_leap_year;
-	long days, rem;
+	s64 days;
+	long rem;
 	int remainder;
 
 	days = div_s64_rem(totalsecs, SECS_PER_DAY, &remainder);
@@ -70,7 +71,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm *result)
 	result->tm_sec = rem % 60;
 
 	/* January 1, 1970 was a Thursday. */
-	result->tm_wday = (4 + days) % 7;
+	div_s64_rem(days + 4, 7, &remainder);
+	result->tm_wday = remainder;
 	if (result->tm_wday < 0)
 		result->tm_wday += 7;
 

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.53.0
