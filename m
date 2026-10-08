Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889E2445AF2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469673; cv=none; b=C9mvy8q+YFssCQTFb7PG8uI95ap6jjvzyQqmm3WEjBz7oR66/w0HGVrgg+OGL+xdOirSKKlmFbq1hVHfbsRCny+bklhSmnL7qbmUhIuSik+mas2cLTSsvIiAUyTIjjWQh0GY28nWnbLbKW6l9HazVGaylVf7tEsLIB/1YPHvD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469673; c=relaxed/simple;
	bh=EtjG65TeW8iJffKBLb26OGQJLVjvIjuuHm1ET/mvnLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/PpyGXdK4tV7B9gJYP/AxC4KHSMq5t+nI6daFgOy0rflJMTBGWVtxoASu6gRyvDIUmWpZYQWh9E3RSlKwbz6qTHtUuHL7RSCfJVfWGUD8tzBM5N1NLG8FqhJ94tqtq21b4CKJIyvzLVBmjFS9vSjUbZLpNiQAH+fTtCIy0OO9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DX/hzmQU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DX/hzmQU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2225991f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469670; x=1792074470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8tCdvf31u7mf9wAPxH4T+LS5l/fNI4rs8nM7sIQNyw=;
        b=DX/hzmQUQpWoZkxoKNStxFwRvehqjdLrg4xIXndGPcvS57zvMZx+N8a7fls6KvW6N8
         nh37eoOhL/zkCgIwAf07b/YBapMUge1u43ZgeI6ZbE/SawsQm6HVbg34dC4jVMspokdX
         j6MY41j5vWgGVhhnJmsIop+K41g0fKxu1QCOinr6HRqbhGeZ5P8gTl9puuT6nib5eZVM
         cEDUXmGkpgbd1T/PJCIGxOqHWqNlwZLoylOVESLvm/AzGIu6jdwHuNvvp0vmyWaFdC53
         9VpO+cEe+9i8upOweWfQLFSuUGnwyxPXFB4tT9PC01IRrNbEs4BvgurHuBvlnebSnWPZ
         RcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469670; x=1792074470;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8tCdvf31u7mf9wAPxH4T+LS5l/fNI4rs8nM7sIQNyw=;
        b=omMx7bg52r0UN17s3fMiO6cVdjhGbk7efwPBugH6GLYZeHwiIDej5TSRSwOO4oHXCN
         exW5lIXL922rsP1brf571OdY83UZLAGQhICbKmOXdEhHyTkIyQvcHNPFKKyXK4UxJxcA
         9OPION8CgidSmAsmQt7iLpmj0fe6D96buka5qrehEOLYi+/gSzhe+dhut1+Ywq6TeLWh
         nC+t5Cw96Rtj/7TUIQ0gE2gLELDhUY3jKQDttykqdDFN2ouRkZwwAVvqBlaDP99suTr4
         Ff45jFxBBNeRcMzBy1QaUWc64kK72dHFknuwtUhAnTnFtiYUIif43YyTvdn/IlA2cvLJ
         SRsw==
X-Forwarded-Encrypted: i=1; AKwUvBx3wlgR3J/Rl4WJQmSE3ooEeWR5mgU6jKPqML1MmHC6yOKIk+ydH3h2AowWxO1fP3osUl4RolAdwdzhbfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOgoeAAkb1u5v464bgRwoI0dCAigwaxGtCTF85rRC65oNVIgAD
	yQZp9JdXeRz5d2SsDydoZfjJs65gE9U9MnAV3Dv7QT8ozFTrVzHpIL+bXEo6UEfv
X-Gm-Gg: AYBFou0emyY9HatZAYrl1RcqMZZkQXSIW+KLSrpSzh5T9w42zqgcJr1r0C299WZo51u
	TU0vU5KiPdLl82pj5lOp5LKFzfaIakJEqKSauVEAPyMxwvPgKWgnTXLTBYOOQC4eIVRzvXGCVVR
	ZWy/Qpgk1mteoyA2bq5KU8IAJZ7IWaJPOycowCeidStswsyEJ0VLG24pUBBR6qNHHb74XHyASw3
	4Hjp9eSxavlqPb2k2fpAXREkmYKnULTFK3dqBXLjXDBTwZljLfORRHY/aGW2rcw9x5GrxUMq9Q8
	yrI3YfpKZkxkb68Z1RPIjHBojsrzzZNU/1zdgp4YiGwKqC/cLNsHwPeFGDLCzMI8ji04id8Q3UU
	02CQTqx6/6cZSxq7oq7ZFHz322GKNMEhIZ6RXy7R++Eoa1WantRGoLSkH2X4jdFoX3kN9pD2Mb1
	lndzVOn4GgVY3+qUsGxKzeyky2wItYOOdJKhOCNSPlIEgw8NbKA/BAKQpRA1OwWKxC2aUs2kuBq
	BUITev6uD2OMeSeHukCedc=
X-Received: by 2002:a5d:52c9:0:b0:48c:6616:8f32 with SMTP id ffacd0b85a97d-48c728892f0mr8069996f8f.53.1791469669352;
        Thu, 08 Oct 2026 07:27:49 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48d5a548b99sm1639881f8f.47.2026.10.08.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:48 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/27] selftests/landlock: Assert WIFEXITED() before checking the exit status
Date: Thu,  8 Oct 2026 16:25:54 +0200
Message-ID: <20261008142604.39107-27-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WEXITSTATUS() is only meaningful if WIFEXITED() was true (see
wait(2)).  Check WIFEXITED() with ASSERT, as most tests already do, so
that a signaled child does not also produce a misleading exit status
failure.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/base_test.c |  2 +-
 tools/testing/selftests/landlock/fs_test.c   | 10 +++++-----
 tools/testing/selftests/landlock/net_test.c  | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index c19aa20609d6..f7c063fdc397 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -618,7 +618,7 @@ TEST(cred_transfer)
 	}
 
 	EXPECT_EQ(child, waitpid(child, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Re-checks ruleset enforcement. */
diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index c73a438e088f..7e36baffdf36 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4644,7 +4644,7 @@ static void test_connect_to_parent(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/* Clean up. */
@@ -4743,7 +4743,7 @@ static void test_connect_to_child(struct __test_metadata *const _metadata,
 
 	/* Wait for child. */
 	ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 }
 
@@ -5413,7 +5413,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	ASSERT_EQ(0, rename(dir_s4d2, dir_s1d3))
@@ -5435,7 +5435,7 @@ TEST_F_FORK(layout1_bind, path_disconnected_rename)
 	}
 
 	EXPECT_EQ(child_pid, waitpid(child_pid, &status, 0));
-	EXPECT_EQ(1, WIFEXITED(status));
+	ASSERT_EQ(1, WIFEXITED(status));
 	EXPECT_EQ(EXIT_SUCCESS, WEXITSTATUS(status));
 
 	/*
@@ -7988,7 +7988,7 @@ TEST_F(audit_layout1, resolve_unix)
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

