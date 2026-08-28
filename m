Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F097385D7B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913145; cv=none; b=T89M0qCWTKnwoHTjgh5oeGaR55cCkhX0xZMD9mLCQtex67qKwE9fSt+tI4h+Ab12xafy4tNWAoRcTNdRyVinLgowL/zOYxl2A/Iu0dv4eNDI+YRVI4XOSOZJqa9eVsJMQhGO9MdUGRJ3ZU5OfgS5qV1IoGb06af/SQrHeIM4xgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913145; c=relaxed/simple;
	bh=BBwVCXPPaz5/1HOyQGNHAjqHk9PKtLuxwo0UYaDCa6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BT5MZp3JJXX2ABV2axoPmj8HC1vrnNEz97jzJgYKLAyltP379pFZwlxLbPpQ5kgr56P4lx7UdHyJ47ta+MmuW/uoqV7j/gFDz1ZCXsfj+RcREImpkFecvK81f8+x2pfbCwSu4zDogcNGPsxGM3axJ4zWBbdyz5SMYZ5CQ4xvJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=HA5H2k0S; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="HA5H2k0S"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1027277a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1787913142; x=1788517942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3siDF2KtRI4in11Huz4hXEO+q80/xfm3leVxcEdCPtE=;
        b=HA5H2k0SOeqvaAhiQrGZTPMBP11ZaEDpKCL4DvLLV6lRo/h8064eQMckpBSfAdRD9E
         Pd1O92Kbkd2FPbPr7TXZKuqi4MQOASQXguhjK1XPyyta4cpWIpmdBEsLd32wf+Ns+lUk
         SXI0oh/Vqn6BFt1AcwzBTiW6Ym3QLGXQTdgYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787913142; x=1788517942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3siDF2KtRI4in11Huz4hXEO+q80/xfm3leVxcEdCPtE=;
        b=Fj9XAuGyVzlsfB4zLj6reUY6aK4K3VK0VMZoliaMa29x+M3qU/F+6SuJY+NiTieXEQ
         nlgvosYDlL7rt7X/mX5/ck/Xfp7gQKP6I01McotywjXZxlRlWUifZF7MpSuTPTVcjQGv
         hIRK0zzNIgY/lJwIo4jwvRD7GFYklR6FjKB9SBz1Vp5becz3a/3SgRswWquu78SHmlPF
         fpd6av0fp3WK9jTgeVBf1KN8v1UCI8FkdrB1hmInjikoUV3O5i/d3hyLL3PPxP97i9lK
         eVMjO3kQ4vjyNhat0+GpNuacr1tNs4Fgn1Ty2S/rDYFSoT/GddvBhp3H/AiD0HzPZ8ND
         PCdA==
X-Gm-Message-State: AFuF++nPCG7PgVmv4/VCd8odqlZRZRr24u2Htzca/+LuzWrMApzy5kDn
	TrhBMB9Hu4tEmmI5pP30Ol9J4b93RhVvuDA8QmJLE++MRUJGMgz2a25JMYf0ucer2UY=
X-Gm-Gg: AR+sD1318W4hotv89037SkT1vyrjYMrra9pknomr7ZNKRPU9P1/gcpECkVmPFJdyJdE
	19bhDdaKEvIrXTEiLNQVIXq4Vxf5Os//EzuqHEGal4Fy9uKpVZNQnmkAa10/mA5KUmz23Tl8pnU
	vhwIiE5KepIF9y665sAfi48c4juexfIbCFWd/dTjdxLKU1O1EqQLNbdY1ysSFK9GnSreuiJ+spQ
	+M/pfq1ADrn4aKO+Uj5Apy0p6LmkKpYzdDEijQ4SliDYr6ju2pXHCmdiPzCeV2HJ/2qUeafvkv3
	tM6NP9FIZdbLG7F4UC7C9eBxmLP34ddENsRVf5aieGhyNaH9Dr1BqLDeQXL55qvNbiUlU/P2Yap
	DtWlxQWekLVxk4nfRFY/s+6l/1EZpEOrHwZCc6rkNGhs5wF/k+yoTQ56fJiVRWqU4Yt3XuUh8td
	jtEUcmL/e+C1E1Z4V9lAaW/ofK0xlNivfjBSMj6iRFP/+8UMDuQyBhn42b3p+GyOI6lV8qjXVOy
	fT/g6yMP4s=
X-Received: by 2002:a17:90b:4c4c:b0:396:635a:9b10 with SMTP id 98e67ed59e1d1-396d0ebfb0amr10532989a91.11.1787913142419;
        Fri, 28 Aug 2026 03:32:22 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-396dda7835dsm2017492a91.5.2026.08.28.03.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:32:21 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 2/2] selftests/nolibc: Add basic test for sendfile()
Date: Fri, 28 Aug 2026 19:32:05 +0900
Message-ID: <20260828103205.384589-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828103205.384589-1-daniel@thingy.jp>
References: <20260828103205.384589-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Basic smoke test for sendfile().

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 70 ++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index ed860b0a15a1..48e1183a00bb 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1563,6 +1563,75 @@ int test_large_file(void)
 	return ret;
 }
 
+int test_sendfile(void)
+{
+	char data_in[] = "This is some data";
+	const size_t data_sz = sizeof(data_in);
+	char data_out[data_sz];
+	int in_fd, out_fd;
+	int ret = 0;
+
+	/* Create two tmp files */
+	in_fd = open("/tmp", O_TMPFILE | O_RDWR, 0644);
+	if (in_fd == -1)
+		return __LINE__;
+
+	out_fd = open("/tmp", O_TMPFILE | O_RDWR, 0644);
+	if (out_fd == -1) {
+		ret = __LINE__;
+		goto close_in;
+	}
+
+	/* Populate the "in" file */
+	ret = write(in_fd, data_in, data_sz);
+	if (ret != data_sz) {
+		ret = __LINE__;
+		goto close_out;
+	}
+
+	/* Rewind the "in" file */
+	if (lseek(in_fd, 0, SEEK_SET)) {
+		ret = __LINE__;
+		goto close_out;
+	}
+
+	/* Use sendfile() to copy "in" to "out" */
+	ret = sendfile(out_fd, in_fd, NULL, data_sz);
+	if (ret != data_sz) {
+		ret = __LINE__;
+		goto close_out;
+	}
+
+	/* Rewind the "out" file */
+	if (lseek(out_fd, 0, SEEK_SET)) {
+		ret = __LINE__;
+		goto close_out;
+	}
+
+	/* Read back the transferred data */
+	ret = read(out_fd, data_out, data_sz);
+	if (ret != data_sz) {
+		ret = __LINE__;
+		goto close_out;
+	}
+
+	/* Check we have the same data in both files */
+	if (memcmp(data_out, data_in, data_sz)) {
+		ret = __LINE__;
+		goto close_out;
+	}
+
+	/* Test passed */
+	ret = 0;
+
+close_out:
+	close(out_fd);
+close_in:
+	close(in_fd);
+
+	return ret;
+}
+
 /* Run syscall tests between IDs <min> and <max>.
  * Return 0 on success, non-zero on failure.
  */
@@ -1684,6 +1753,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(select_null);       EXPECT_SYSZR(1, ({ struct timeval tv = { 0 }; select(0, NULL, NULL, NULL, &tv); })); break;
 		CASE_TEST(select_stdout);     EXPECT_SYSNE(1, ({ fd_set fds; FD_ZERO(&fds); FD_SET(1, &fds); select(2, NULL, &fds, NULL, NULL); }), -1); break;
 		CASE_TEST(select_fault);      EXPECT_SYSER(1, select(1, (void *)1, NULL, NULL, 0), -1, EFAULT); break;
+		CASE_TEST(sendfile);          EXPECT_SYSZR(1, test_sendfile()); break;
 		CASE_TEST(stat_blah);         EXPECT_SYSER(1, stat("/proc/self/blah", &stat_buf), -1, ENOENT); break;
 		CASE_TEST(stat_fault);        EXPECT_SYSER(1, stat(NULL, &stat_buf), -1, EFAULT); break;
 		CASE_TEST(stat_rdev);         EXPECT_SYSZR(1, ({ int ret = stat("/dev/null", &stat_buf); ret ?: stat_buf.st_rdev != makedev(1, 3); })); break;
-- 
2.53.0

