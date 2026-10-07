Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CF43C1D7A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350995; cv=none; b=bKxbhoGrejZjXF+7yPGj6P4YpLfd4A6qixyIP8F3JfGO6fXzgDUOlwK2Wf7JhyneVCWaSq/SxXvs+Nxvj+ybhKGUbY6CC2aDPdUlnZvvqpZlqvx1j5P03RWqU960hcOjYskBWkxV5BwmYit+weGMr+vKEpjjWqYf6F19NtWQaL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350995; c=relaxed/simple;
	bh=ZcYdrU57dFk3/ZhvsnwqxnFSfvA2Jz1UU6uXzvOw6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcSeeD3NeSFuSwcc7jlt+VcEB7WRM4BAiDA/UmGyYU83UGeVhAZuwXIJv6ORA3lKxtvO0HV7c3K4D11Py5zKpykaXpk1NrC5OkeOCig0w8ogm6OQpwvnHq4o+wLS4saAxy+kncmbWcAVBnPU2rCHMvXTeZS2/BW0W8EC+sMWnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=IsZrvmoj; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="IsZrvmoj"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1204324a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1791350993; x=1791955793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHtzz6KhfK5NjnNS2rfNNwlDkfh6RPhp/GwO0REwW7E=;
        b=IsZrvmojRu744BTuFTB/YZNzV38lHmCiwJkTzAl/f8jEvw7PANzgqE5VQpREhNkqxe
         xzv0lSJwb8/JedZoLD7y7jN8Bg1x9J1t/d54SE6gdO6pbw8OqRb2sbq8341vO6g3QD+L
         RZbxFN+PQABYdPBa4VBodpDve88QpBhIzDdlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791350993; x=1791955793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHtzz6KhfK5NjnNS2rfNNwlDkfh6RPhp/GwO0REwW7E=;
        b=XWiV4mvUJykzruyJeZHf9OBSctYQh499s/u3yRI64AChvLb14/GVFvgfWnSjIaNH7I
         qD6oep+0MdqB+zJ7ld69B3GEzHfGm1/c4xUY06Mao8TGgsEnW8A8dlqBY+2mkRKQLXUk
         asr+KRixF45yGquhgGYLVCFNYfaTOTWgctkUlDV5/iwOfwuuuffqbVrzSicadaVnHbBJ
         DF6M4tHApSDYh32U3Xx/G69w6jNrVwaWY0j8keShDAoUHBBAOBhqhRrO2W7SYaiLq0mA
         F6LPzs2NStahkq5VVz9C4Bx5DZ97a26WtF6wW6aoo8kygvpLgGlIOVsa020lYvlUmB2/
         mefg==
X-Gm-Message-State: AFq9FYL8R7JPJaHkocysdcqMxcIhS81dpgv/rv65LSJjdFQMRHL8R3LR
	FFUdfjhLcKTAgqY2upAvq6wwnETd/7VbdsgtqG06UTa8KPAQzZLWby4Q+/h+w03yNqfiW+PQ4E6
	xr0L9
X-Gm-Gg: AYBFou3hQyuTWjmW4EavTL7SzCgfycDeeP8p1on2XN0gEYjRdQ98yBqYzpzgIhJsOtw
	pgC4RIR8Qc8YuUDgvonHCgjveqHL5rwI94389cmzz0TwzxqfwlXe0GmWCfAof3p3Av04VqUzYzs
	dZitlpSBwFo4VfzPFXeMPdW4zMZQjT1CMC1i22Hc9/7tOrv39/1pRQjnFOSrvlFtnHi58hSJwdz
	bkcKc2I2Nih8FuBgZmcX769LJBddX75JJ2vlDW8OcSSIEnWrIsV0rz/0MlCqPG1TRakF2N9sm9e
	25QRk49iI41TzZnFF7i03946dvgW6q7u22+nbTwQY3f/0E8zwONlIiuYBntK+GMU1lMCrW6RHmj
	d8I5V8oAABZdVuFzglraKtyVz+rfoDID7QMx5FhuaquH7fWdo9gxmzHBdal2WSefzR5zhFCXxID
	4+jweTYyMv9xuGRfEIwtq2KLmgbtJ5l2F4dVSB2EL+nvVEcPjuPCDASCMGOCDH4MGz95m23x7BE
	G6wiKvBThmBwuhl1Wy4
X-Received: by 2002:a17:90b:3a10:b0:3a7:da33:ff3d with SMTP id 98e67ed59e1d1-3a8a1d05b29mr1084600a91.46.1791350993133;
        Tue, 06 Oct 2026 22:29:53 -0700 (PDT)
Received: from kinako (softbank126255145177.bbtec.net. [126.255.145.177])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm8208425a91.13.2026.10.06.22.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:29:52 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v2 2/2] selftests/nolibc: Add test for dirfd()
Date: Wed,  7 Oct 2026 14:29:13 +0900
Message-ID: <20261007052914.888956-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007052914.888956-1-daniel@thingy.jp>
References: <20261007052914.888956-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test that open() and dirfd() use the same fd and then use
dirfd() with fstatat() to stat each of its children.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index ed860b0a15a1..82616f2c1ba4 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -858,6 +858,52 @@ static int test_dirent(void)
 	return 0;
 }
 
+static int test_dirfd(void)
+{
+	struct dirent dirent, *result;
+	int ret = 0, fd;
+	struct stat st;
+	DIR *dir;
+
+	fd = open("/", O_RDONLY | O_DIRECTORY);
+	if (fd < 0)
+		return __LINE__;
+
+	dir = fdopendir(fd);
+	if (!dir) {
+		close(fd);
+		return __LINE__;
+	}
+
+	/* Check that dirfd() gives the same fd as open() */
+	if (dirfd(dir) != fd) {
+		ret = __LINE__;
+		goto out;
+	}
+
+	/* Loop through the children of the directory calling fstatat() on each */
+	while (1) {
+		if (readdir_r(dir, &dirent, &result) != 0) {
+			ret = __LINE__;
+			goto out;
+		}
+
+		if (!result)
+			break;
+
+		if (fstatat(dirfd(dir), dirent.d_name, &st, AT_SYMLINK_NOFOLLOW) != 0) {
+			ret = __LINE__;
+			goto out;
+
+		}
+	}
+
+out:
+	closedir(dir);
+
+	return ret;
+}
+
 int test_getcwd(void)
 {
 	char cwd_syscall[PATH_MAX];
@@ -1651,6 +1697,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
 		CASE_TEST(directories);       EXPECT_SYSZR(is_nolibc && proc, test_dirent()); break;
+		CASE_TEST(dirfd);             EXPECT_SYSZR(is_nolibc, test_dirfd()); break;
 		CASE_TEST(getrandom);         EXPECT_SYSZR(1, test_getrandom()); break;
 		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
 		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
-- 
2.53.0

