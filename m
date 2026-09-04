Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B7344E043
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519094; cv=none; b=B4GF4mafKc51v8BDL/qicOy19Xedj5yG1TS4nfIsHwkq9ITiqvMy2Ut1/IOZ5qzgD7py3US8giAHfOa/lsN13xg8/ZFN8/wUGFEeJjeEsFD17pTi8oYt1tn4QTgpbCnbqSt3LkTkHU9KogIDWaKsvbnAX4oMNne/5U+G7NBX1oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519094; c=relaxed/simple;
	bh=N5auCAAX6JttEiw3mG/TYR0m/xuN8LLYJ8Fh8xM0+P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMllabBgq1WI0CT0wQUquy1RpIRzHl4HC1/HwwIJwu2dMdCh12CRnst0gcLVl4zbr3ao5OXNqw+jrfhMaKFTi9kTgEogp5hfByIRUFu8rZ8qwdLGadTASPuIZoXVDz4s/GPkHwMFJ7qKqKJyCgiiiCG2/FSVT43bRI2Lw4tmLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ccd10wZm; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ccd10wZm"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso692394a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519091; x=1789123891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=;
        b=Ccd10wZmUSJ8pN0KKarBAQmLeodpi8wYAEgYAQH1sNMAWhXUAfbSq+rhX6ZwiTFFxE
         MsAJakRI8su/duhyCX3E5Njac3f4PfyApFn/y5HeVcc6pUSUW62iXg10+85HyKK3fyz+
         md7PQ/1LejstOTAmTAIfd8vPkK+Ulg2vuje36oxatgFoOyRu0jv2lhvbnzKxiOEt1/f3
         Z3EXp75DyQjboBrwxBksHW1na5rUy44Q+i7TsbI6t41s4tK3uKKbm7128zyuVmd2PAES
         mPlixIPTYga4587ukm47ZEla6+07IMOwTn/j3jNZj4hgH72hJhOmPBqMWdXqpbXNEa10
         0rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519091; x=1789123891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=;
        b=DAK/f2izkkZ8Au1hnaQqgAL965VnLFNbsKKJhmV6bkF7S3hYgEsVbZEKZ70ji/eNFP
         IX74bbDkWfQJvn/ei3kJBJRGMxjYYrxkTRav19EQCLRPg3p3dPXdBTGfIMDMd1GnenRo
         SHguaDhSYNa7bW6R34oEado2zLVF7qb6wL7GJWPog5iaMB9jQn3MIdmvuar77IE/j39m
         JOJKQIqpo8B3ragGsPyqUfDTvtFJReKnAGQFq5ZHfF9IMZoi9XniGyzmrC/92mbaGyGj
         tApkxSh5OhWBUZYbWO2VpHVgYEfIq5QSLuTJbAuxx9akppgNuJ48wz97aG7gfvlNgTaY
         jZCQ==
X-Gm-Message-State: AFuF++kXLAyjpk+7o66aXO80XynaoBtGV0CY+MlWIJ1pmrDPb70rjo73
	5rczljJqCmiW8P3IJr84c9BOYGVkA3ZqsNR9aNbxUwsPrHeWWCWzWY1u
X-Gm-Gg: AYBFou3y6FZBV00Y2R8ZMzHbYq/ZfePbWzgacfuBv8fz5KOPbi1fnhxSh1H4vKrMc5d
	ijSTWtsuTIW3WCw16Y2BVuEX+jT7Fa+go/tXTR1KaOCjqqA69Ob5zMRJ+R7ot+NGf/zj0qketsZ
	573HGTzekovRxOB7vs2FG20J7QcU3ATwCvPTGcshtJIuDslhx+JYAgLAvT9pGTt1ZRp7hEmho+S
	10tJYXgCI0PYRRIbLSFbV07EsJh5o/jGKeaBNNCOek9EKzPanJrXmqqyf9d35qwyZXvQaY8oVge
	3K8UBLVY5yTN1IOCoUfMtczHX6dePSmPv3xYf0WxkyVdSRYfLIKI1L8r3BHRyjo4XM12KtOd85F
	k9RRwzkycB/e2h/7lbQ7GvWyXoX/pnaqRfwqjtvewMrAFl2jjUOQCt8vo8eeRLOcw8wrvOu+7YM
	PWDylOrYxulaZdiyxKptdqClLk8P51zMafE/LQe9VNJdJmt716Yh8VoBLRwZ5EPNBN5XnagpqD5
	ny8ltey1LGTotCTJJF8AXIzUQ==
X-Received: by 2002:a17:90b:1c07:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39b2617ed8bmr8372452a91.9.1788519091308;
        Fri, 04 Sep 2026 03:51:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] selftests: arm64: fix typo "hander" in comment
Date: Fri,  4 Sep 2026 16:21:09 +0530
Message-ID: <20260904105114.29474-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "hander" to "handler", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../arm64/signal/testcases/fake_sigreturn_sve_change_vl.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
index e1ccf8f85a70..bcef280582ed 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2021 ARM Limited
  *
- * Attempt to change the SVE vector length in a signal hander, this is not
+ * Attempt to change the SVE vector length in a signal handler, this is not
  * supported and is expected to segfault.
  */
 
-- 
2.48.1

