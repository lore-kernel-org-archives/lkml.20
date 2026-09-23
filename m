Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688857C72B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196989; cv=none; b=iH4mFadk4wKM/pWJKFtMoN7EO/S2i8kE4Alq7rHiWPHAYPS8XYvpuEBa45/0BCu6cVsYxCe3fmBumXUUdhaOdwny6dSflYeeIe4lT0+v57wgPoWjvve7SOHU1cVtHVqn0DnFlvdzZX/Q0swlQKZFXbNsNOrx0Jy6xELp3mD9GH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196989; c=relaxed/simple;
	bh=wpHW3AGsvTtcq9qNGtfCUgb1bpdoHKJpgQc9YAeigZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ns/P4DD4Z7rMVhkzwvZnowbBZbXrBaWcNJHxQmguAtWZWA8jFUYT5/tnrj3PHNaEXS65yEe0PcOF2tS79Fpl7hx8y1Ebxk6r43y2iVSwv4LbBRuWlCxyxJ/hxDcx478YE5hu2KIIs93NfaJYwfXs9bIRHrmTxeFcFR+MWJzezM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkOw+Bzm; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkOw+Bzm"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-80a6fbf797dso376752a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790196986; x=1790801786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG6cE21OsL9ueGhX4z1Iih/4qzjC2Z1wROlNZIqAoKY=;
        b=nkOw+Bzm3eFVu2UFtvqFdJDr8dO1dGC3Fo+yfUY5Q8MMOmEXXMxlVQAhwFMdLQlXnl
         8TYlnQeQ18VOVcbW4apdpF3twdf3sFCOflyd8DI2U3V7h4ylO3048EqXnBsIn1a/wpsz
         W3gQkFMv8j/Pqp4HreKul6g/ENUWGgpfy+WUsJtkk17bbyKY0XNUX8IKqwTRshcvwdWK
         y6hvh+iGFYkdjqClJiG1R/Tf4jJBT96FKTl463PBVUvxR0TVvhN6kkOo8F255/EcsDkR
         BQBpq8NWHzkOBTBwdTjrY68VuwPpovhgDqIxbaUA/VIGGIm2cfnSvvkkLI7h1kYUmmAB
         gfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196986; x=1790801786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG6cE21OsL9ueGhX4z1Iih/4qzjC2Z1wROlNZIqAoKY=;
        b=bQhsEIsqjhe6qvVQZhK5GRWv9HjXcXC7opKtL6JMZL+9snMuh0WXhoE0fFio+xF3N3
         YVj6rj/XOnxO6dYLoOUHIvg4cWDdKo0lWL9buDNj2BieelvLNeTWYqgNz83YkSXw/ovc
         nTRop3t9ZgjBko18LGF60XXq94lI6fgFSa4vrSq5JWFOoto4rq81PLuXohuZf0gwtyRi
         N9MO+sejT3sy/nLyKQMLxvQEcAhspIbTfHRMQ3tSbCfexvISpdv7lO5zmkhsTj7r3ALt
         XfZLjFzKGtfV2nwTDV72eOwok+e4k2f04GDbdQM12h64WIaHj5Pk8iofXgnpxIMslRUD
         zJnA==
X-Forwarded-Encrypted: i=1; AKwUvBzzLxKKxiiEjcKc+NeoJCDJmNUmxdWYjWqTP+JE69XFmak1JXs/H17vehi8F24k8QK952MDuNr4jFq/dvI=@vger.kernel.org
X-Gm-Message-State: AFuF++n24fBjb3efdsuLm0tDdjaMN9iL1xQIMfCSXkbfxhNlMnP0TU2E
	JQw6waHVQ6+/cVI0AxMWUgMk0fSEa68GCoqBGmreIffZTYZfiygE405g/OZpsBgN
X-Gm-Gg: AYBFou3Xfh3u3kOZ8m2+AV9cdDsMwuIILxwYFEbLZB/LEX+r7s28d6WwiizwD26mPbX
	m0stcCjmDicQZAaNdzk1O6sMayzB1jfFjBvVBaINTpFMuCsNht9Sg9ABgFn1S3c0uiGJ+Syk0Gu
	MTF+WVJxkZAAYsG1Aqu+mSZqgrtJZB8FjC9anIar6drzPDk86H8BL/iCs2ofLmao5nggkkcemNE
	Rdpdp/+jP7qTcvtdN16HsPSnP7ystFu2IwfFY/8OTVQ0t1dE3ZKiY+UOe/rdJ1IHrKbCktCD7o3
	yz7hxHkS5xztv8NPk2PvLzGqljMYPE2jFQPoN+rIwnq9eQlN+wFcsabTw8YiKfFAwm0elbHJpj8
	g1iJBe1N+91mnJLKjE9y6AV2QYkYYcXo1DMDPQ3Ptk6y7LYlnvg2omItjzRSr8U1K2PX+SloGpB
	kL+awVkRd02ajikaekOxnEuZpYPwFUd6eaiEUPM07jR6aAXVSStWbT5EDHg/xMewb4/tKXqVfJB
	ELATr2C3cZdbe1s0RDTSK2UKIdyKJxBlb8NF2d+cA==
X-Received: by 2002:a05:6830:4129:b0:7f9:555:1df4 with SMTP id 46e09a7af769-81783485e5cmr448186a34.16.1790196986532;
        Wed, 23 Sep 2026 13:56:26 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603ad0f20sm4498893a34.9.2026.09.23.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:56:26 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests/nolibc: add tests for the wait status macros
Date: Wed, 23 Sep 2026 15:56:22 -0500
Message-ID: <20260923205622.1123270-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
References: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until the previous commit, WIFSIGNALED() was true for status 0, which is
what waitpid() reports for a child that exits with 0. nolibc-test did not
notice, because its only use of WIFSIGNALED(), in the abort test, also
checks WTERMSIG().

Add tests for WEXITSTATUS(), WIFEXITED(), WIFSIGNALED() and WTERMSIG(),
on the statuses the kernel reports for an exit with 0 or 0x12, a kill by
SIGKILL, a SIGSEGV with the core dump flag, and a stop by SIGSTOP.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index f62183a46205..8985aa1ba96a 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2038,6 +2038,14 @@ int run_stdlib(int min, int max)
 		CASE_TEST(htole32);                 EXPECT_EQ(1, htole32(is_le ? 0x01234567 : 0x67452301), 0x01234567); break;
 		CASE_TEST(htobe64);                 EXPECT_EQ(1, htobe64(is_le ? 0x0123456789000000 : 0x8967452301), 0x8967452301); break;
 		CASE_TEST(htole64);                 EXPECT_EQ(1, htole64(is_le ? 0x0123456789 : 0x8967452301000000), 0x0123456789); break;
+		CASE_TEST(wexitstatus);             EXPECT_EQ(1, WEXITSTATUS(0x1200), 0x12); break;
+		CASE_TEST(wifexited_exit0);         EXPECT_NZ(1, WIFEXITED(0)); break;
+		CASE_TEST(wifexited_signal);        EXPECT_ZR(1, WIFEXITED(SIGKILL)); break;
+		CASE_TEST(wifsignaled_exit0);       EXPECT_ZR(1, WIFSIGNALED(0)); break;
+		CASE_TEST(wifsignaled_exit);        EXPECT_ZR(1, WIFSIGNALED(0x1200)); break;
+		CASE_TEST(wifsignaled_signal);      EXPECT_NZ(1, WIFSIGNALED(SIGKILL)); break;
+		CASE_TEST(wifsignaled_stopped);     EXPECT_ZR(1, WIFSIGNALED((SIGSTOP << 8) | 0x7f)); break;
+		CASE_TEST(wtermsig_core);           EXPECT_EQ(1, WTERMSIG(0x80 | SIGSEGV), SIGSEGV); break;
 
 		case __LINE__:
 			return ret; /* must be last */
-- 
2.55.0

