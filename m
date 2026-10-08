Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A408B3932F9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469624; cv=none; b=NrdIxORhYUg7VW0jJGcFGIianMWnFoPj+qfkn4XW76CM8BAt9qMTQ+6YxeKCmVrI0U2p4hhVwxB1c7H5nLSPnQOUezuhS5rDR5YY+AEZ8Ap14SWfkVgmazkLHIF1wynSFJcc/Ea6nenX4xG8S+9h6o4PFtdNYuoxTRop5B/AFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469624; c=relaxed/simple;
	bh=80WLb0++Uodb+4HiLcuHEuMzL3GSkL5XLfok3SaeWwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YLv6q4KVnOp+YOCJhTj0PHzhejjR4OJI8j8rGw53NgtZTUjtueNgESBqjoDZ/Y4wMXgYh7g/praUbaLIyGkTLamS8yIq40SHw+N9+C3VgsO1d9DMNzL6/QhCJvBxSo3wLC7sd+Ek/vOr3xIi3nYfeLMHikwP16obshKpwzP3os0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObPQuQKy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObPQuQKy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso4288462f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469621; x=1792074421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k4xn0TmzK0MZPrjSNCHFh+ucQ9eOJKWbaR6JNjvd9qA=;
        b=ObPQuQKyHd4VirgpIztB2jiZE5Vg58xIYx8MrUDcvQtU5w4HmeZFG/V6wG6jRpCJyF
         Qt1lC0++QDJc6BJu1tPJWLv6kc1/43ZGND/zy1lzLXbi+uZDG893m7bG8ikCpixZgzCx
         2X9kkHMX4sE3GBuiiNFHHpeM4b3wr9fKn9YtLKFLJO3VuQNnfgX2gG0TD0P2YF6ybDcX
         +mcxMQiiDzNDSUSOg7J/A+d9nleBqHg2l8y9oVFBKpz8ZfSDSQbqmV0pvzfe6lXI7XJi
         sQJjv9arKKGSL3yBjz08lVp6FjTrih1UbpjPzsaexrAJtikd55TZcXTSR8iTj02+lEbq
         FglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469621; x=1792074421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4xn0TmzK0MZPrjSNCHFh+ucQ9eOJKWbaR6JNjvd9qA=;
        b=uO2/UZ9dqO4/GCHFWAW6sQl/cT2c7VxkpjwdFZefNYiKURrtw8cuiUTfxrB8aaumDJ
         rMFUjXNsmt/KV3baQFg2QCGk78muzMawJeU5cpBw74MasYEELiD47ZVM21FjiciS6crx
         ykmfBiLU0weV2R5zSN6e8CeImFtlUgx7jAq/JgeDatWWEnkp9HIBVqPTSnhYLj6OnHyW
         G+Pbm6bChrEZhCeud3B3WQDCwduSHcWiecu9jbzueawAfi+pHleFc2/JUmbeat7cCRWu
         5WqMw+y/kAgvVyLIELhUfXvS0xVundyxO8h6cR0NuiGLooR5/v2gfMlpfjWUYNGnqrh+
         dwOw==
X-Forwarded-Encrypted: i=1; AKwUvBxNDhHTTXJs0+XmzPd6BUeQ0PxSb1DNKymMZ4XEj+oxlTpnDASq2Onv7ik+z9CohAztldOXk+iv7rall+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC4/1AVBh+UyKXrSCC5iNIVVebLZfT9I/KZRM+JWl0V8UgkywI
	67WFD2IPVBzyk5v/zBul0ICPxC1hHT9sts1uNMaDadWBMgHYGlW0B3lY
X-Gm-Gg: AYBFou3r7NiPAjfeEg10EAKH2l7Tl+ZQBdfLgtO6Lj0AoUZ3crNjZhrK8b3Jb0xFaRh
	OrXNgAVaORbFASJjNpwNvbQaGjkXh5yp9ZyQpI8gRaIzPXkLuGFMx3xycQgzZpjq7YCKk0N/7a5
	Gcqi4VoEQ9blbA6GiZHw4bwwh1CfG95AJnc3tFeRmwPn13xXRnORCj5RgWhgofN1usnZ04TwRyl
	gQFloYGi4nI3t4GSsxspcUeuIGe3pfgGddvUo1jELGJrGphZbf6Gp86azsmYKCRiC9N52o4yDCB
	9x6qkM3Zpyy+DojMVKEmgLlnwty2yyflq6jF+imrA9M7ljOY/R1UAXbPtB2VKdDnQFlFm9umcbQ
	BAkHT/IZGnCrHDZ203QdxYQM6jXubIF+coszZXh76ZozjwymC4MD0AxQ5L+RfrrauxggGNLgPsh
	3smTZ8/701479Qs2TkNszm2wcN3suR6CHoz1EVkf8jCqZkYNPSNJ95lmRNaSBIrtF2FvU6QDUEt
	ONo+vFmmqH5CBcRjTKzum0=
X-Received: by 2002:a05:6000:4a09:b0:488:8a5d:ffbe with SMTP id ffacd0b85a97d-48c7278924amr11804538f8f.33.1791469620339;
        Thu, 08 Oct 2026 07:27:00 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b53fb7sm8530232f8f.58.2026.10.08.07.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:00 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/27] selftests/landlock: Fix the ruleset_fd check in empty_or_same_ruleset
Date: Thu,  8 Oct 2026 16:25:36 +0200
Message-ID: <20261008142604.39107-9-gnoack3000@gmail.com>
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

ASSERT_LE(-1, ruleset_fd) is always true, so the test does not check
that creating a ruleset with an empty handled_access_fs fails.  Check
for -1 instead.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 6e979cef884d..9884ce9917db 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -1463,7 +1463,7 @@ TEST_F_FORK(layout1, empty_or_same_ruleset)
 	/* Tests empty handled_access_fs. */
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	ASSERT_LE(-1, ruleset_fd);
+	ASSERT_EQ(-1, ruleset_fd);
 	ASSERT_EQ(ENOMSG, errno);
 
 	/* Enforces policy which denies read access to all files. */
-- 
2.56.0

