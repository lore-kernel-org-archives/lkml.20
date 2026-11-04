Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826591;
	b=O7vyewwiB9KC5u8zW6b+9SoFeC1Mx55lSaHEoLyR0JGuJLcnXipnFo5cbfYZePxlck6m
	 x3RpVtJDuUjwkyCbZu9b6yM8MucyY/5/1oXAc1x1rnkgJvvbtJWceQ1Oh+8TLTKAFeWt2
	 eBNnq4Ryborfm3A3yfhk13QZop/GAvH/NmqOIijjmL3kLMSsOo+xEWs2X1BM4/Q4rENHy
	 NSIXTYM3/XdB6qfHbdsjABHIRU4KYDkTRQYf9vh3ELaxt+oZFt3coOtd4VNJZ/NJykPYo
	 Ywr+h/GNukr+xCqKHBPll3zImlPBPJ5Ll8VmM5fMwd4AB6aJbWMl8vFnRab5rqfcl3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4SXFwK/yqKkPhUAKqKEKto7t7U4WKvibwTpH3PVe8uI=;
	b=G7VAsML4ICe0yoZ/a1Yb9At369v5FqspAj0GpUsoxduoH5wG7rylOJFyI83egoWuFBn9
	 Vdj8RdLHdx3lNs5bNAvnhzzZ73m3QcZecXjP6OTTOKBiEAfWsM5NztTWWMXn6bTMl57Vk
	 TeastUWun/rgbBBzfbVGKMJrcqxHWenxQcVuEvHLJKfmmy5Sfoc4E+Mb7hkzZWhyJtbyK
	 Fh8rBa0KeyFru/dHkx9O4Ymp7lFgTz7XOqANylVQi6mz1DdvRgNseBQVEVlEAZsQobIoz
	 8QZ69BT4EUJxODmfXwZSdCGOGXBB8YjNiRh+4ZrMxLxw2QsHzv0KU3kQaEQ871FynLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ynZ/RqCq";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30D260A0E89
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30D260A0E89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynZ/RqCq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so12771675e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826589; x=1794431389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SXFwK/yqKkPhUAKqKEKto7t7U4WKvibwTpH3PVe8uI=;
        b=ynZ/RqCqh89OHwjvqNp+vs25vjiK4Ou7DN7zQEKZabuWvRZv4Y0j7AnYawI83cN6dH
         z1rcgOqnQgwQKNU9ghnJ9OmG3ay6wvEOeSZw/J/tpQrH1rJocOqNROCU546pI1PMoruz
         438Fs2ftK429eBbeLisQNvyR8Odbi0mpXN3m4a1/f8FFKRkyYcHCRU43gP3JKQyflUw8
         TgJro1GMnp6hkk1QdgxQ/5MB2YjmoG00ACya3Pn7/CMYA1flOgYp8HL+Ic5sWIScHbNY
         av46JXDg/8zY25s5wf/2LE7YEebsdBdm4T70v6VvWj+J2DvjboDI0Gn/KYr8ERDyrShu
         czeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826589; x=1794431389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SXFwK/yqKkPhUAKqKEKto7t7U4WKvibwTpH3PVe8uI=;
        b=DmpXzbSzWfVBlmmIIfpCLOfAVuJ/LGyDMLuXW4gXYN7Wgdv1bCpkiFqBgMbWMmYH2X
         CAoAbgNM1VrGBwytQVzEf38FB2d7aa0Ug0ggRptzX/e4/p+DQKzsFoEw3LCuAt3ALFgA
         6w0X2//85rYCMSoix/yxPdeB6mmH399l64YbgD2KYlD1x89yGgSb5JyZejXZRS5LVdrz
         xw9ZsTRIrmNGhvQv+FY3zq6O58v29G08Ec0wqNYT1MNwFdoTJfEc4WdwNyKicwbOQP0c
         YvTOL5zNtSJ4PWA8JiysJH4qyrUjfzzybfrs28b7f4N8cuZjyyAORil6jMmXB6tiP6I7
         joVg==
X-Forwarded-Encrypted: i=1; AKwUvBxXLB8LjQoByu4lEkK+b1OG7NXb5WvE3fBqWhnp+FgNHIsK99/uxOkubjXoVXpU00QZTiEn3l6FCmzK5CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JQNFSuRjSDcEYQxifIr74u5ilmzspPpUwikv9RRuWcjLq6Lkw
	yd6BTdTuRTpe8qTjpmv1kvJHSZdGW6y5TRSyT/k6+QjnXQZMQYoTeR7a
X-Gm-Gg: AYBFou0nOlauvaqVUl8YhDXSnrjJt+goUeY/LPuOXQVaS9j6VMFpxd6izjTwCp76vPr
	4edaif1y1y63eYDEPqhIE7zbIy3VDG7cYQwILGKaCGHBYdu+X0tmi1z2wB9ukCi0SbEeFU12w5n
	jnRJ3FZX2AK4sUhiKUoLEe2OPJadVdQ8cwzhYHi9APOHKluxGZGyDran6mwEDeMnSk/rI+Uj1Ou
	bXLLZPZy8FuMtIdWENEgRsiPSSlmZPHSYx5dYYwTHmNIzmp65MvPqSX1t1xEi3kKv2yQdveOK14
	Xek2FwdqON2ygKSzdxnoWjnSabXBBOVVldtF6TSRnoTR/g9pGnuRmsWUhBlj0CARny6ma44ySLb
	Vd4BVtdA6e3i5hzTMRi7ddLnpUHT63P6pG9cF/15OzwiNGm07DbUpjD6DR2e1FJivDTBY07dx6I
	byrmurPBnT9SyX7AIjBvt681c82VJLS93Ha9xE4QMfAHuPSSKxSEu2p3CD2h9jcXNWw128Dj0Lb
	GOAmY2mSfkYgEQ5pB7RCpVMJ7Wxki0MtuRqBVbnVRIdcGUMFbeeni6EqJLs0TVZF0BORMFGWj2g
	IgKOLw3LJd30gmLkTpvixMwqeu5qrWQO7l1wIRaNZOe9n1MjuGfg7g==
X-Received: by 2002:a05:600c:3e05:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ac1765e5c8mr385324485e9.23.1793826589271;
        Wed, 04 Nov 2026 13:09:49 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm12083535e9.1.2026.11.04.13.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:48 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:11 +0100
Subject: [PATCH v2 25/27] selftests/landlock: Assert WIFEXITED() before
 checking the exit status
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
Message-Id: <20261104-selftests-refactor-v2-25-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

WEXITSTATUS() is only meaningful if WIFEXITED() was true (see
wait(2)).  Check WIFEXITED() with ASSERT, as most tests already do, so
that a signaled child does not also produce a misleading exit status
failure.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c |  2 +-
 tools/testing/selftests/landlock/fs_test.c   | 10 +++++-----
 tools/testing/selftests/landlock/net_test.c  | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index b1a729b94e7b..4cb30b943aa8 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -637,7 +637,7 @@ TEST(cred_transfer)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Re-checks ruleset enforcement. */
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index fe1ca9c2d949..183dfc42895c 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4640,7 +4640,7 @@ static void test_connect_to_parent(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Clean up. */
@@ -4739,7 +4739,7 @@ static void test_connect_to_child(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 
@@ -5409,7 +5409,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	ASSERT_EQ(0, rename(dir_s4d2, dir_s1d3))
@@ -5431,7 +5431,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -7985,7 +7985,7 @@ TEST_F(audit_layout1, resolve_unix)
 	}
 
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	EXPECT_EQ(0, matches_log_fs_extra(_metadata, self->audit_fd,
diff --git a/tools/testing/selftests/landlock/net_test.c b/tools/testing/selftests/landlock/net_test.c
index 51bcb4740dde..e194fd78d8a1 100644
--- a/tools/testing/selftests/landlock/net_test.c
+++ b/tools/testing/selftests/landlock/net_test.c
@@ -903,7 +903,7 @@ static void test_bind_and_connect(struct __test_metadata *const _metadata,
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Closes connection, if any. */
@@ -1274,7 +1274,7 @@ TEST_F(protocol, connect_unspec)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Closes connection, if any. */
@@ -1373,7 +1373,7 @@ TEST_F(protocol, tcp_fastopen)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	if (client_fd != bind_fd)
@@ -1528,7 +1528,7 @@ TEST_F(protocol, sendmsg_dgram)
 		_exit(_metadata->exit_code);
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1571,7 +1571,7 @@ TEST_F(protocol, sendmsg_dgram)
 		return;
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1642,7 +1642,7 @@ TEST_F(protocol, sendmsg_dgram)
 		return;
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -1677,7 +1677,7 @@ TEST_F(protocol, sendmsg_dgram)
 		_exit(_metadata->exit_code);
 	}
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 

-- 
2.56.0

