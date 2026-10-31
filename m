Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421019;
	b=uoae+hb0RWEOH1VtTtwAUAoqYl51Q24OTJRTsdSTW7m5DRg0x5ZL7jbcinvSOrB0SGhm
	 wYq3LShJzoYwZExX2fUes7qnOlkpBlwtVIBfwoNVHcL/ImVPG97Vcktj+B11GIBVrlaEG
	 jn9pN11PA4R9DRl1iEiYOFlPhuSEnMpyUJN441B1TJhlsWrNDNijSYSOPdBRzx8aH6NoT
	 1QdLooBqHQ74dKoxAi5F7dyHCJTHLNo8ItHr8snDLmz781m/Ikj5kVyrchgva0DN/edK8
	 2QeBXGHr63YRtf48KRS+88tiDsgEdgotymRnsqzb+RO7PkGz6Ttvhlt9awyAxMMl7FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6qOJtBPKokVL/e93Mo4Dg8pR1BxvCLuWo5QDjqT6lag=;
	b=Yllj5R9MhWJCatSiWwMthRV5YNBVyKDF4Fwd13S1EMMRvlZBZhNVAgoBd5Yb3mN6h4hs
	 R7ZpksSKMG61SCGUhZ/cW20t1xlH1z4cD7wLja6TiNfD6QoWePlWnFweeBxyzQAPVcH1x
	 hFdn6StLwVk0wWRbmF2jQw5hzhTMLsFPoT38QGD37zifbQA7emPSpzEIxHBur+RYB4EnF
	 SQB/cLdNP6pTNOwZ+Wf88WG/6tf+V5PIg9+1rsP1RAf0N4KLIqZYiFksyRpAiv3YvyDeS
	 2rnR3aJVpAwjCLwxdFhjT/ZcKF75RV8sIZAXFcyV3Y6Iyhg6PvCovJHrF2Z2bJKgvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thingy.jp;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=Sxb2CJqE;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B62606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B62606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=Sxb2CJqE
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-369f33df08eso2798619eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1793421018; x=1794025818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qOJtBPKokVL/e93Mo4Dg8pR1BxvCLuWo5QDjqT6lag=;
        b=Sxb2CJqEK5o0vO0yiXQby2OXsjL8qmNH7KT5rqmcO7jqRle4z/xLE31BSWMrNO4Jen
         /f/8HGSE5wfP6SioqcsrRuFH9lBMoYKFh4rz9JXCk56nbKpib6vdrsK+j07juvxQlgTN
         NyxmuSSiBN31QeV7DIWeXxfnSi0u47MkFEZ5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421018; x=1794025818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qOJtBPKokVL/e93Mo4Dg8pR1BxvCLuWo5QDjqT6lag=;
        b=12EyAADm7uX/NbiiANY3nKjPyYBo/IT2z3FQLkoCJ+Lt/QDSi50j6xqlN/2rF26zQC
         IyjIUgZWnLpg003oGfXeWm5s4gMPrwZ232zhRb9H/2Ff2ydkD1eLQQxbGHqbjlGNNAJK
         xwmcgHCWX8rnqvSx2E3TeM/kgoWILa4+xhB/b6Qg9qNJvF7HI34yKC7tN+aFYmX8JvvG
         sj9G97LGTQsi7yqQnwHn6jDyfzGglwg3czq6uNsQ0s5Wu7N3sG6rdqM6WOGCBH8egYAG
         fYl8iqSwgLJJEUoV0FIZjQ/a9vq6o+Gt7Lvye3RJEpHXwynjAh6LBJchrrkjiNn2SEkr
         8g6g==
X-Gm-Message-State: AFq9FYKxxeewcXt2pJr+4C1aoZjSIOB9Wc5KGAR04zn4u1gnhyz0aPE1
	ezCL5wmAJP2SEji0oYNRkylAq7e19C49UsKdArL+c9V/E2ZQdM9UVY2OcWyfuJukGHMzu1lobdI
	7YE4R
X-Gm-Gg: AYBFou2pJwsO/7e3PO8lmn1/peY0zSyDj2x3K8qwj9URqcEQorX4lgT2+RCDcCAOZcC
	8PA2x8K85vcH5e0HjHD5h5oCAQFVVN76xf+WRS2Q9s9gPnFpTAOflLDCOla+gtqZr+8PsRNcewS
	/2NozXoFhG+Ulr7sfovobaTQbHVvEhEqf0PrzLR/a/sYMCJ8rZOBhB1UaGMw5LSFgWydq6qy+4i
	+UfdCdl6tyC8mRomIsa0fouDjqODhgUIASVLrlpExBpC9zzeH/vVPEgVmgwqJcGY73NnXm7lJhq
	u3GH51WrUT34bw6/Qh+TQH9CHSX465OFJFD0VGaakESx/R/TmqSvilJFNCJ0AJoMVYHXPHfT+d/
	gg2NiDR36r5Nbm1/ginKbrO7l7rjPTMTtJIaV97Bz2j0FvYTPkVsLaYZUsz/xH2EC1HwFHHFFsI
	uMitf7jGIsljobD7f1PpUHJlhM/IDz4b7AuJNQGepjvraIkvUA6IlS2MuQBiVIvjpMEuTDsXp4g
	VgRWxN5nzdRqsU4xXl8ca2LiGflmH7hC1pS8nPj1/LZfIfUj+C1Kgaeb7Tbhbuoxu7ZJMFqODzB
	80n+Ca0an5TorqDE5pLS/pfcLm+3hplYoIWDvwymBfxsXe6Jwi4Ety7DloeEFoaMre5DF3jMXtd
	rgibKRxsoNW0tuai7y3s=
X-Received: by 2002:a05:693c:4154:20b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36a420574admr6457301eec.0.1793421017720;
        Fri, 30 Oct 2026 21:30:17 -0700 (PDT)
Received: from kinako.work.home.arpa (p1795186-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.207.151.186])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm16603361eec.16.2026.10.30.21.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:30:17 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH v3 3/3] selftests/nolibc: Add test for dirfd()
Date: Sat, 31 Oct 2026 13:30:00 +0900
Message-ID: <20261031043000.145709-4-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031043000.145709-1-daniel@thingy.jp>
References: <20261031043000.145709-1-daniel@thingy.jp>
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

Test that open() and dirfd() use the same fd and then use dirfd()
with fstatat() to stat one of its children.

The test only runs for the nolibc build because it uses readdir_r()
which is overridden to force a failure in the libc build.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index f3d0d27cdbe1..648a539fb42a 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -859,6 +859,45 @@ static int test_dirent(void)
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
+	/* Get the name of a child of dir */
+	if (readdir_r(dir, &dirent, &result) != 0 || !result) {
+		ret = __LINE__;
+		goto out;
+	}
+
+	/* stat the child relative to dir */
+	if (fstatat(dirfd(dir), dirent.d_name, &st, AT_SYMLINK_NOFOLLOW) != 0)
+		ret = __LINE__;
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
@@ -1764,6 +1803,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
 		CASE_TEST(directories);       EXPECT_SYSZR(is_nolibc && proc, test_dirent()); break;
+		CASE_TEST(dirfd);             EXPECT_SYSZR(is_nolibc, test_dirfd()); break;
 		CASE_TEST(getrandom);         EXPECT_SYSZR(1, test_getrandom()); break;
 		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
 		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
-- 
2.53.0

