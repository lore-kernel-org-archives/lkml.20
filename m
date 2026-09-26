Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784914499B5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430223; cv=none; b=EKq9zNgGFGWBoIcOuWHr2puME5C8msnajjpODrAVjDII973BwRvMirOVrBP+lLm1jVGjGgZwzetMjfcpXQ61PcO8W5HgBfzui/zcYohtJtZQ1iw8XzUT1z+NAJ4OnSefCDNtPo7Zk268RUlNcIu+s+KYFVZILt/bvDDNkfZ04cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430223; c=relaxed/simple;
	bh=McqeWsBOFjVJyX7SKN/Uex2A8aQXdCLDFa4D5SOoHx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eN/khRIaQxi5JcB48KjJ/dXfVRnXJEXeNH4VcSlDjBHGKBltchT1BudciHp6/yYRTurXnqVTqgZcLt+6u9jAP3+t8A47vNPBzeicFB42WlOkQ6ldS1nJOMIJ4j1RsZbebWdFWxtLyZv8uIDUzS+RMZ7PIzLaxDO/tXsgne9A0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBxVWIpd; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBxVWIpd"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-491c13d63d9so1277713fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430221; x=1791035021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pr6DEa2L7W5JQwTmV77IrEE6Z9Qd9FDFOvJp2w8euBc=;
        b=bBxVWIpdjbNLvWiyfxlGSy6dh4UmHEIBu/ww4cdnmp4Uasl9ZqaeE71/x+MXF1caLK
         HxgHAn/kNK6goMI0HIOGcG6EioE7PYQEvxKeNMdjBqSSXxqL+bZQkfjPycj1n7QRr3RK
         7vd95GQS4KU0BWnT4BC90BMkivdO/77MIONklzgdxYV/xjV3rk5rK5oTG4T+u2UjgLTA
         k+ld8FuxZVuTzXLWzpd6z7lKetDbrqhPq3jKt3gDsh1HSLslfW8RR7RX7sZUm8OMxPd6
         oiDDTWT89dYswRQMdGQNZm/+A6fSwTnC8Qv4zkMHZTeM3w69pmMk3nt0dPSG3nQWX1Cq
         C0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430221; x=1791035021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pr6DEa2L7W5JQwTmV77IrEE6Z9Qd9FDFOvJp2w8euBc=;
        b=QJ4JiNJQMX9OL3Vnyle/Am53V9ALJEennaBw9FppfiCpjqFuDXSuXDIuWZr9jOfD5M
         xmqR2X7t/DP7sHdYZMV+YpNCGaLDfL2O5p2njQBWqXDe3+W78MMFGN5JJzQIM3QaZ//J
         TCj6bes9mZsD5sWs3W3Du1SokHl7+Ul4dLIFQuQ29bpMNA5oroHNGEWPZs+8S5M7SEYP
         Wou1z2lGoH1GXq9DKdVVxUaLeu7WM9TG0fddeIXwOhgmupPEhIAQbfEk1rqfxlghMPPe
         ZgXDE3JazGw4fLXMM3KZOjwxOWQl/tw3GUV61XAnogz5p4GttS1ePuTO3AGji2RMHcuH
         aOzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAloWWmpO6efT6ChGh0+sNPqE7n/kc7ier+MtG6IDZ7c1odcCWYKVubMD4Kf2UPh9TNMgKnDc7hoH3f40=@vger.kernel.org
X-Gm-Message-State: AFuF++m+MgmwX7f2r4GEgD9tk4uNWIdE30UVWrJgUv+sgwnJnYvGduub
	zl7ACg5r0Zzg71jCLPUzK86ws3tch3hvsFts7QdQdgUrg8X00MVKay+eYitaGg==
X-Gm-Gg: AYBFou2PSc58UWdL9kyRnYTFNzb+/mT1p6KIbXySR6OOqaq3mdQT0d83TM+0G37uWpx
	PgIrOwX8RbtjtAgTMOVEy6m92TvTtT/n5LJ3cf1nfF0nZJD6Y83eRLKWAR/XfWTdSE8SIJ7/tQs
	4vo496IYUO9A2BXQ7wjlOvL0JpXI2Iz6nMl2OvyR8fA+k8iTKB9EmF/zpo86TMvG8AqQ/r7SQlD
	z2Hn/gud3SwuGcZDrx46ufxnPDw4hQ2nkeaQOiuqPpWL2ymBYW9pZ2ciN1GQ2PwFQKEKB+JI9aM
	3HUfFufHUKS5cTrJDXELxSy7LOf/EN/Tr5Lz0c9SigWiQsi4xVzcMNbJJrmsDVFDO1tpntLyLaE
	PHFM6MPp1tdiDLrgSpq6pU++nkidyF+YLKoInKnQsIxy4AZ89mn6ZvRFFk6k29+bnlFeM4qHa5G
	LDoEzAVnZCQAMhklPaPqTyNamxHxTqT1ExH7dBqUpYj5axkhDzTrUEdI47eZmgM5I1KRVvpP6bd
	LJXwggJ6/gyF2YsKIjLu+7/uXNDAAL5TSfSj5r0
X-Received: by 2002:a05:6808:158d:b0:4d5:295c:a82d with SMTP id 5614622812f47-4d72ee5fbafmr8613493b6e.58.1790430221323;
        Sat, 26 Sep 2026 06:43:41 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74281sm4452874b6e.5.2026.09.26.06.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:43:40 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests/nolibc: test malloc() and calloc() with huge sizes
Date: Sat, 26 Sep 2026 08:43:32 -0500
Message-ID: <20260926134332.58184-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926134332.58184-1-danishkhateeb03@gmail.com>
References: <20260926134332.58184-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_malloc() only allocates a few pages, so nothing noticed that
malloc() and calloc() went wrong for sizes close to SIZE_MAX.

Check that malloc(SIZE_MAX), malloc(SIZE_MAX - 4096) and
calloc(SIZE_MAX, 1) fail with ENOMEM. The sizes are hidden from the
compiler, as GCC warns about such large constant allocations when
building against glibc.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 1995d67dcca6..0bb5116763bc 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1915,6 +1915,14 @@ int test_malloc(void)
 	return 0;
 }
 
+/* Hide a size from the compiler, which warns about huge constant allocations */
+static size_t hide_size(size_t size)
+{
+	__asm__ ("" : "+r" (size));
+
+	return size;
+}
+
 int run_stdlib(int min, int max)
 {
 	int test;
@@ -2050,6 +2058,9 @@ int run_stdlib(int min, int max)
 		CASE_TEST(major_big);               EXPECT_EQ(1, major(0x1122355667734488), 0x11223344); break;
 		CASE_TEST(minor_big);               EXPECT_EQ(1, minor(0x1122355667734488), 0x55667788); break;
 		CASE_TEST(malloc);                  EXPECT_ZR(1, test_malloc()); break;
+		CASE_TEST(malloc_max);              EXPECT_PTRER(1, malloc(hide_size(SIZE_MAX)), NULL, ENOMEM); break;
+		CASE_TEST(malloc_max_page);         EXPECT_PTRER(1, malloc(hide_size(SIZE_MAX - 4096)), NULL, ENOMEM); break;
+		CASE_TEST(calloc_max);              EXPECT_PTRER(1, calloc(hide_size(SIZE_MAX), 1), NULL, ENOMEM); break;
 		CASE_TEST(bswap_16);                EXPECT_EQ(1, bswap_16(0x0123), 0x2301); break;
 		CASE_TEST(bswap_32);                EXPECT_EQ(1, bswap_32(0x01234567), 0x67452301); break;
 		CASE_TEST(bswap_64);                EXPECT_EQ(1, bswap_64(0x0123456789abcdef), 0xefcdab8967452301); break;
-- 
2.55.0

