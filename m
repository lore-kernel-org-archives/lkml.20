Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598985;
	b=Q2Gq9UbRxhT6A14W2MC6DDfL0CeAXm+gdcNpP2cC5/5psWjhgC61Ki/0wK1t0T6zUia1
	 R9EkWNf5eoy9gEe3Qw767R+dQG18OVguU7BK/wTxgkn+1rrWGndNBfaE1E5vRbxPGrNTX
	 1xDB8Wc444bIcn4K0ux4FI5h8yb3py/7oI/lFqqPeV4dAGjCt+yGY0stjWM5A8g3/+BR0
	 t5JvduqpYX214WMLpYSpTg37NCPALg1pPWdKXRC5be9xj5S9/ISdaVdJSbfkZQBS7YX4p
	 px49RY8EZJD/ETfdUZwEmtawa1CacGcDeBF7FSpMn8pjvJ+mpVsqNEfJavh6WrQEpiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598985;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/2NtGbcLBEJvoA9SYp2b5hIwOmLjmi6HK13wD/5/OW0=;
	b=NDVl8CMdM3LG2g8116yCFG+hX+WM32Y4mPi2JSbyjkM2oM1t5zfw6P2VnFQOXyLW+O4P
	 bOVk5UNctuQOKd10gVoPNPRtFG2v9sOaoZRLawPOdrB7JqZul/3f0rBNofZ+vqyHV9uTh
	 VUonhiCaFXE3OOfnaIYa9AiL8CM/s/7tokaSUy/RmvfI+G7xz/RA58n+iLmP/t1VneYaY
	 h16jbPVM/BZCQYfMCH+P+yHtx+rm8TOllZlpawaNH5KLlmJ+hjc4emBX+0COLDTBFxvpA
	 vCzf8E8aMCK2etXsT8Wl0QX/JbMpxnr+LGxYSSiegzaZ/sk0hJKZEmbhBAscyJyH9iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nYtvOJzO;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D8606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372D8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nYtvOJzO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793598983;
	bh=JEt/2eFzRj/IdrIaryv4LkUdHdBuh7S1imgrHgbLHBk=;
	h=From:Date:Subject:To:Cc:From;
	b=nYtvOJzO+ZOkcd/kbpup3FRwVPgLHdYKGB0ZOeMRvnMz5hYGHd6oVtDjq6IFHtZSX
	 L3qYwWvhtPL99kzlF7Pq5/TypUheRTJS/zmNM40bjjIvOG0hWnNk3NIvtQeqZ9OW7n
	 Gc//mZ+Lb59W0YR1a1PabNODi3zydgQfI7uvTe1k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 03:27:35 +0000
Subject: [PATCH] selftests/nolibc: drop readdir_r() override
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-nolibc-selftests-readdir_r-v1-1-58fd2205f1c6@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtYc/Dgr4hI26QaGZ0kVQZj/
 27nju/yVnAxFYfLsILJV13n2hFOA+RnrA9B5W6gkc4hjIR1njRldJlKE2+OJpFZ7W4YOCYSLiU
 Fgh68TYou//x6O+yf9JLc9hG27QdidZrifgAAAA==
X-Change-ID: 20261102-nolibc-selftests-readdir_r-1dab2edffb12
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793590056; l=2317;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=JEt/2eFzRj/IdrIaryv4LkUdHdBuh7S1imgrHgbLHBk=;
 b=VyBWAEA0PGNZYCS6UQrGYi/P50arYpsTeGLsPm6l4yw3tJ3pOG98roFDGqyrg3nsR1z51BBUo
 8mjl+z01baHALOS5LsR/38pgun0JCjq3z7XqTiHlJVJwnuSQ9qB7oHw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Running the testcases using readdir_r() on regular libcs is useful to
detect mismatching behavior of nolibc. The deprecation warnings can be
avoided with a compiler pragma instead.

Drop the override and enable the testcases relying on the function for
regular libcs.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 048c2d2850a9..1157b521e65b 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -50,6 +50,7 @@
 #include <alloca.h>
 
 #pragma GCC diagnostic ignored "-Wmissing-prototypes"
+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
 
 #include "nolibc-test-linkage.h"
 
@@ -99,10 +100,6 @@ static const int is_glibc =
 #define strlcat(d, s, l) 0
 #define strlcpy(d, s, l) 0
 
-/* readdir_r() is likely to be marked deprecated */
-#undef readdir_r
-#define readdir_r(dir, dirent, result) ((errno = EINVAL), -1)
-
 #define _syscall(...) 0
 #endif
 
@@ -1802,8 +1799,8 @@ int run_syscall(int min, int max)
 		CASE_TEST(ftruncate);         EXPECT_SYSZR(1, test_ftruncate()); break;
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
-		CASE_TEST(directories);       EXPECT_SYSZR(is_nolibc && proc, test_dirent()); break;
-		CASE_TEST(dirfd);             EXPECT_SYSZR(is_nolibc && has_working_64bit_syscall_arg, test_dirfd()); break;
+		CASE_TEST(directories);       EXPECT_SYSZR(proc, test_dirent()); break;
+		CASE_TEST(dirfd);             EXPECT_SYSZR(has_working_64bit_syscall_arg, test_dirfd()); break;
 		CASE_TEST(getrandom);         EXPECT_SYSZR(1, test_getrandom()); break;
 		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
 		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;

---
base-commit: 228a318052869ab08f01f53b5cedfae0e930f6dd
change-id: 20261102-nolibc-selftests-readdir_r-1dab2edffb12

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

