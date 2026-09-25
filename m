Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5034FB9C7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370970; cv=none; b=Tu5TPJXVXO6Gv+b1QVyFSAy/TIUojyfLauIKqeKYCXFJ0tTbxqcx4qOu0fpMbBMnrJF2R/3gnf9ByWhRkoKTEKqO13152g7zXcN0ooq6Q0Y3oHUeBzCiH7JF/wvGn8ogadlj1Nxi7fNyT3CQBFRM9BOqg3AX50Q9bUqOhZQamXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370970; c=relaxed/simple;
	bh=vuVChJnQWWZ8u94uOgQGJ74rzfafInWZtiXnsAThBqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2o6gELnGfcMFsoCm8dxTlryY7dZv7JlwPSaZn+0tL66/QO4sTTrMkIwdMOeyB5pE84P2yYAPm6rtVf1JYGAWruPizD8naUSAxVpYBU/PJ+XGIECCRlCjnlataYEwqVkFL5TQE3wifdJ00dwaiR8SjASlgzjFGX4YwUlYWzHlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOE5IA8h; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOE5IA8h"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b5c61966d0so406902b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790370967; x=1790975767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oee6XIob49W0bQwe7IHXcVEe2xWZKG+qR8xRtFWbBx0=;
        b=iOE5IA8h02NQaUADBl8julNkvcJNFT3tL4sPRZL5NhbqSyYhsNAae3FmXdhGp2vNvK
         dQd+y8DsDV/U8n4wCWTF5zYYmxzm1eP60TC5fFkxi9y5lWbCZl6ls8bbOs1o/qFLBqwf
         txKbiigCdGjWnO68va/H46rtjhTRIGuSCmGmaiZy5OYx/MOCKN2vbyCnyq2uAC2khODC
         Ha3qQmKGIMTQ5Alr16AcNCFQOQ//GfbMpvTBGNncaPY7GWiyghT5umi53hL1Uo7inHuj
         BpYqpFNouhnEtuHai2OxyVS9kXKnPjywoVXyHWGuTqAptTm9TszY97iKVcl5Ai/31jIS
         lw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370967; x=1790975767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oee6XIob49W0bQwe7IHXcVEe2xWZKG+qR8xRtFWbBx0=;
        b=kOh0CAytB3WFdivRW9dwLFVna+FF7KCT9hXLq6Xl4r5repeXBRJz1tedYHAML6gF22
         fK9a/VAM0MXnv2/QSJxrwq3tS70A+lvOgoymMfkDgId7topnBy8YuPukUawUQ36JLkTA
         ZYbjQIyhkRWn8nBajeWXy1vQ1hUfZUqI19BboB7jkuZo4rgfcK0Gx0ysbrVE/2ifGJMv
         2CyVuLEFwskJVfyqcvt7SohzxViCC8UM8uyTyVoppxuufoNFZFltNA4nuoDOyzbXSF4j
         RHbe/zT6mS3Vge4eg51T4YvmTgmkRiwswOHvUKhuZNeATzGD72RJT8fe5dlhxvROMwBc
         DFJw==
X-Forwarded-Encrypted: i=1; AKwUvBxl96wR8ONbuaPmmI3EPeO3m+JciyG8Zo/AW30Ywv8JbChjrcLxUslxpZ/0qLLpWCx/aikEIxNO7kBsC3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lz3utmvCl4fecpEaGCa9+ennJr4FKxucXqDVT5E57ad8yTijcc
	gH/HkFHCpZyxmEicZ/e1FkStCuCvS4pb1LG3w3Raoz4mRTzAGiXe2DXn
X-Gm-Gg: AYBFou23U04xv2Jau3xDAnUKqbHXUMbutpuXpgwpFVK3j/6i8LcLahaP6zu90OaLKXv
	DlBX/NrqXaxL2uTMsCtOclehU8nVOSzULFoOp7sFMdo/dmRZ2MKZPBX0BcdU1mdvlg16oQStplw
	JHnlKSMCxyAHvmuJBzUNFxAab6WZVs9UEsTylDRNxE1zn0Hp2JYIBt49uhXvtEhifBpTREOSgZk
	kh5ytNFKuiI6PlOpz1cUQTepeDgG8NmojbxgcrMhxGjApNIrqqG2JYgL+ZSRVIhvGrX0ASLZATd
	mFZJ5ceCe29Z8XmdChd2nrFNZyKzpUM0al69Bp0lNBNswLDAYX7O5JfwD0POAgILC1oPjfGlXAq
	4TUvB5dw62LIWf7Bn1n44DqjMI0g2L//UahE2DRO5C6YDTWsCb4GRpPoPICkQsm3rMsdpqgjXSK
	Bst3xMSa3yT1sZWBUGEcyh9nMz11ex9Wqp5a1HVDx7NGo8mVJ0yWCrrsu3HFhKvfb4oMLpFAIxs
	zAcCoFlLLD40HdRNZzJTlzAac9s5NuGn6+dncUW
X-Received: by 2002:a05:6808:16a0:b0:4d5:295c:a831 with SMTP id 5614622812f47-4d72f34fa3fmr7037829b6e.62.1790370967256;
        Fri, 25 Sep 2026 14:16:07 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d72057sm3066734b6e.6.2026.09.25.14.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:06 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 3/3] selftests/nolibc: test the FD_* macros
Date: Fri, 25 Sep 2026 16:16:00 -0500
Message-ID: <20260925211600.119116-4-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211600.119116-1-danishkhateeb03@gmail.com>
References: <20260925211600.119116-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only test that uses the FD_* macros passes fd 1, so nothing noticed
that they used the wrong bits for fds 31-63 of each word on 64-bit
architectures.

Check that FD_SET() and FD_CLR() change exactly one fd, for every fd
below FD_SETSIZE.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    v2:
    - Dropped the select() test.
    - Moved the FD_* test to the stdlib tests, with its helper in the same
      order as the test cases.
    - Shortened it: FD_CLR() is now checked on a set filled with memset().
    
    v1: https://lore.kernel.org/all/20260924015222.31693-4-danishkhateeb03@gmail.com/
    
    Tested with nolibc-test on x86_64 (GCC and clang), i386, arm, arm64 and
    sparc64 (qemu-user), and against glibc. With the fix, fd_set passes
    everywhere. Without it, fd_set fails on the 64-bit architectures (or
    UBSan traps on the shift) and passes on the 32-bit ones, which were not
    affected.

 tools/testing/selftests/nolibc/nolibc-test.c | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 37c11a7fce23..1995d67dcca6 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1841,6 +1841,26 @@ int test_time_types(void)
 	return 0;
 }
 
+int test_fd_set(void)
+{
+	fd_set set, clr;
+	int fd, i;
+
+	/* FD_SET() and FD_CLR() must change exactly one fd */
+	for (fd = 0; fd < FD_SETSIZE; fd++) {
+		FD_ZERO(&set);
+		FD_SET(fd, &set);
+		memset(&clr, 0xff, sizeof(clr));
+		FD_CLR(fd, &clr);
+		for (i = 0; i < FD_SETSIZE; i++)
+			if (!!FD_ISSET(i, &set) != (i == fd) ||
+			    !!FD_ISSET(i, &clr) != (i != fd))
+				return 1;
+	}
+
+	return 0;
+}
+
 int test_malloc(void)
 {
 	size_t sz_array1, sz_array2, sz_array3;
@@ -2022,6 +2042,7 @@ int run_stdlib(int min, int max)
 		CASE_TEST(memchr_foobar6_o);        EXPECT_STREQ(1, memchr("foobar", 'o', 6), "oobar"); break;
 		CASE_TEST(memchr_foobar3_b);        EXPECT_STRZR(1, memchr("foobar", 'b', 3)); break;
 		CASE_TEST(time_types);              EXPECT_ZR(is_nolibc, test_time_types()); break;
+		CASE_TEST(fd_set);                  EXPECT_ZR(1, test_fd_set()); break;
 		CASE_TEST(makedev);                 EXPECT_EQ(1, makedev(0x12, 0x34), 0x1234); break;
 		CASE_TEST(major);                   EXPECT_EQ(1, major(0x1234), 0x12); break;
 		CASE_TEST(minor);                   EXPECT_EQ(1, minor(0x1234), 0x34); break;
-- 
2.55.0

