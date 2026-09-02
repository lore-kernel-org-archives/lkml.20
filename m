Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236613769F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371415; cv=none; b=OZSVvNpYRM5W0y+tJqxqUYfQaGnAVEHSFVxeh6wQT++b4hzrtUOGxEKP93H2oAxEJ/cgga6MrciIi17O/jBN3dZhPP9R9fkMwJm6HRkwrwHpeO596ybc0ZEXRHCKet6+jmhHdl2S3MZwkFNAu9tghSOVLy/d0akUivHyGqdv8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371415; c=relaxed/simple;
	bh=AOKSnDP9CtAhuZxY1NyLmcZ9XK56/YQAFAYhf3QHJnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=draQ/uJBADjBuf308fDDpxbHfe36HaqBezmiKcp+6ZSUvjifUbiC4Ou1jJfiQdT4ypvS4GXTGoaiwPNHnAd00SzmUfp9Hs8umCzX7xrQBjPKjRg9kBpg3X0VHkIOP8bcluzpFLvjiPOMcMuaR2aPz6hfzeo08isVCFnCnTv4e+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0cittjY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0cittjY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48442ea8f59so97200f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371409; x=1788976209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHwrxD7gPXHTQiD45cH94X7t8jEBXhwWQNdUs9NRWSE=;
        b=Q0cittjYqakDW0KRWYruUS1B4E4SY43FvlAGbnP18pFIYpk9Aq5cNTsaupBH+phUD0
         ElBOiDgdhhVZzYwTaWol2zEzWlOr/Ty3lOT1rfnpgjyAL79xKAT3Iu6JLwTNdWu3oFF9
         wbKZaFkaNVq4ulllcifqrxB+9Ud/z0zlBG9juXaP46bOeEBOzYJjGIVjPao+OE5an1+V
         1abx+oR16n/q44UYwNf20AqPHMRobeAu66qmbdQDqiq1joYG25GlqEqu5t1aqWNZFMR5
         CoQHp0Milu/JJxQbmqpWRwfsOwP83MWrcx2n9iElFOk8p1JBA5LJJYkE7nd1vsSuQvpz
         aBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371409; x=1788976209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHwrxD7gPXHTQiD45cH94X7t8jEBXhwWQNdUs9NRWSE=;
        b=U7OJgk0Zxo469cy1Z1cm2BxMeRWHqCQWJy2QQRfzkSD3oS3y+UdzJm2UF/VvHcYegG
         H2TB/0ABGg6F8NLZ9SMU/7cv+ShBTuwjjP0mVcr76VcoTqHvxC6rslyM6NxOBPQ/CMPZ
         WI2R58bR3SKDFXich4UHwj+3iSaCCOW9weQGYCTbwoIGPg4ha7uOCZ3tkSmIrJ2GYNPV
         Qj+cMpv+6KausA4s1a8ujH3FR3Qd3HIUYI694L0c2XLJeWKO9nMj+B+BkoCZCjzoCJNT
         u9zTq8QIG7BllpwyzcsgH2kH/umQFuwj33xc1sCHvVWD5yszArF1hfH58VMeBbpboOI7
         FMrg==
X-Gm-Message-State: AFuF++k/5rYXfQSI4o79vv8TWg99Na1w3G2qV+ivIj5ZnGoZTESxuNzb
	a8faSXYiVx0Qj8GCpEdM8DBAHwgUr0yxc50+n9vNeSdq/Ek1yYbZVsYH
X-Gm-Gg: AYBFou0BKWgsBwWGGGA+Tetjc9jAVQ7MSzsxoAiKFgudB8zC8yrEvmiaW7H39w6VSXk
	QA/vcVuX0rJoJ5/fvR2Gd/fgtuM0/lnNbZgt/B8KFD+cA9DpmSqFplTcsw/1YDGLKttZc/sUZsh
	PSl5gdUv+XNJMGC+uApxgiNRx8uAGLWfTr+REy3G96+i1PQZEpAuJuOndezQqjVZ+HpbAVd5asr
	cOurZdnqXJpZrfSMSwwckjfR5HpQRIIoxJKqlLUa0LKVNvHIGPkplvXHN4wmoKanMNooDghmKrW
	Yc4nnBrzpC5IapyPd0j28C/sJsXwtcROiulnCZhoiGCrMYP/9gGbg3BB87ubYnSS7swFo1J1ES/
	XvlsHRNayPavTnkJPPvtn81rxJ56Y1hlaShxytN8A/FJ9EolFvByBKiXMm9nQEwpxfn7pEhO15i
	4f8DcAj+kwTFB/68fwtvU4N42DtsxhK3X0KowbXOgqPejymOUDEpuTFS2qVyWINBZqN+sj1p4=
X-Received: by 2002:a05:600c:19c8:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cee5e8fe7mr19299725e9.6.1788371408631;
        Wed, 02 Sep 2026 10:50:08 -0700 (PDT)
Received: from fedora ([93.107.91.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e6115sm7883315e9.14.2026.09.02.10.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:50:08 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/clone3: tighten CLONE_CLEAR_SIGHAND conflict test
Date: Wed,  2 Sep 2026 18:49:39 +0100
Message-ID: <20260902174939.15135-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CLONE_CLEAR_SIGHAND test intends to verify that
CLONE_CLEAR_SIGHAND and CLONE_SIGHAND are mutually exclusive. However,
CLONE_SIGHAND without CLONE_VM is independently invalid, so the test
input has another reason to fail with EINVAL.

Add CLONE_VM so that CLONE_SIGHAND is otherwise valid, and require
clone3() to fail with EINVAL. This ensures the test exercises the
intended flag conflict and does not accept an unrelated failure.

Fixes: de5287235631 ("tests: test CLONE_CLEAR_SIGHAND")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/clone3/clone3_clear_sighand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_clear_sighand.c b/tools/testing/selftests/clone3/clone3_clear_sighand.c
index de0c9d62015d..0ad62b80ada2 100644
--- a/tools/testing/selftests/clone3/clone3_clear_sighand.c
+++ b/tools/testing/selftests/clone3/clone3_clear_sighand.c
@@ -50,12 +50,12 @@ static void test_clone3_clear_sighand(void)
 	 * Check that CLONE_CLEAR_SIGHAND and CLONE_SIGHAND are mutually
 	 * exclusive.
 	 */
-	args.flags |= CLONE_CLEAR_SIGHAND | CLONE_SIGHAND;
+	args.flags |= CLONE_VM | CLONE_CLEAR_SIGHAND | CLONE_SIGHAND;
 	args.exit_signal = SIGCHLD;
 	pid = sys_clone3(&args, sizeof(args));
-	if (pid > 0)
+	if (pid != -1 || errno != EINVAL)
 		ksft_exit_fail_msg(
-			"clone3(CLONE_CLEAR_SIGHAND | CLONE_SIGHAND) succeeded\n");
+			"clone3(CLONE_CLEAR_SIGHAND | CLONE_SIGHAND) did not fail with EINVAL\n");
 
 	act.sa_handler = nop_handler;
 	ret = sigemptyset(&act.sa_mask);
-- 
2.55.0

