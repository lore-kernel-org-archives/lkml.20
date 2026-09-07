Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90594371D01
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761924; cv=none; b=Q9zcam9RMjFHELjH9n+cPoOoUrD21EoBmzpFxRb7FUaX+ag3/F6eUgAZsHPILwWE+KUe/ksdZCNA9mefZ6uKhPx6aU6+YnKiNyyhK4ZFSCSgNQVxGPp/NuIk4GqkhJrqDSmXzji5oSAfbAj5V3HzOl3hZVX/Hv5MW0sqHF64t9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761924; c=relaxed/simple;
	bh=Q4LLtUC/9zyY2h13ud9mSFDS4OWjjV6vx8SQFtbhqOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vlu+C1dfyYnWDKNpmZE9Ptnjmxale17vdT67eMjjhNllbyo1ktxu46j7Gkkr+U/mzlOJ3RxBWkUw32cPvMmsM9H4OBCDaMiexty9zcEM6E7ln8YoPgCMbu8tCqt8dFdCkOoA8kbww2NUMguPtFLJyJwTA0FThUTKC1EFN5GBF/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz8f9y/U; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz8f9y/U"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2728619a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761922; x=1789366722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=USv9M1kYFctEolm5xBEMg+3syhXq8YqrYCwILkWBZu0=;
        b=lz8f9y/Uu78X7p1qyx0sJbxBToeUmZrO286ABPJchaBDk+vUZzNld2kzrjVoDZ88/A
         VgSce2KWnY++BsIo9UUCSCHZN/Rw59BotDwKXvINqOTcreUv6vyUNRq2jgBDW1yRg8ik
         On1ctg1vZjbGyNjzc1+MtNLJ/RSvPEgJUnn+EvQPcaWSLT74PNQDFiF+N8DOycWzHM+D
         Wn4mbMfcnkpR75YI1p8Deg7eAezThB47RHbbION0VNxayHuIuJzGH6VoEyhJNiRPuCmk
         fjqtQyO3d6WWgzGF/zcBZ8yyDVFgjKyBEURvqMFjbQRmso703DGN7Ev1IyudEsAZMI94
         4ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761922; x=1789366722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USv9M1kYFctEolm5xBEMg+3syhXq8YqrYCwILkWBZu0=;
        b=EY/q/Jr/NmaDSa6q9Xp1rVKvQv+67OPRtowVhomh37jtgbS1wNW7TalsJgAQ1kObNK
         JKcE/70oTwtNqvOcIxI5rz3R6H3y1ppPsTWGsA1S3TzxKf6ESaB9fwUJ5xAs94aaUPnJ
         zik4sB8JPLEy2HVkTC6NMAMcDzQ7oSFSLz7w3xvFAT1s3gOdYXeqeInzksKw/otYBYZo
         yTqb/73d0IZiaFyF6/Mi3DRyeECmpGpQE785xEJV1XYqHBieS8fp/IQBmOGZjp261JK0
         sl7W+jWrSEPQ3meETWnY/nDD4fbLEjfusdrPf87UBiiQGydhqlE99Sxqs32/2H6Q/rSr
         v3Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzO0s6llAcQt4SdDJ4c/L1oj8B/ZoTQ1v7R8KbIUgvcBOJFRHBnZnEP4tNkmqp/YbmYQJ4MlMY74mYMpbM=@vger.kernel.org
X-Gm-Message-State: AFuF++m/21ely8pEMvSWIhXrXZDq79Mz4Lv+84SXek8B90bHt04PfbVR
	l5XF70txi6SjGRelH5XV0CAPGfoI76qD5CkKms5x0LpAgg1/MdcLmfxp7CM9ni2Sqv0=
X-Gm-Gg: AYBFou1rUOHhQYtmtNsz2Pon6afxO1GvRDtKPn7RfIEXA+Wfk7a/nTfg1Pn1VVc4zXV
	7mzI8ZfNo23ZXdou6q940tXaccKGswMwx7x/WSo34m7eYXcTh2vzbKh7p/oAfi+sRS63BAY/P2O
	efKiIiU2pJ1pyrkLUB9yhCBEHbEtgn/MnNHW0eb3NkpfenGrx69S5tyV/eM4zjQIlNmcV05pPxH
	83UIMQt/Rxlgo7tRLqiZCsbNazuRw7/2MPdUoeFba9RF90NCFnz3lxka0niMNLzChVBGPCHjgOd
	SP+hoFkRmAssHJZPaAS2q+xKCSdSm+vk31hQicZkZZKEmOSf0R+fQm5dDAZ99HJghLdyuPE0Jsx
	KIvzn+kYkE09Kcv3klO4T4dHqqkUucdSyyob3KgAIHlL+003oVjCFTIsxPfphQDyh26cXC/JlMg
	pamIapBD67lrpx8/6xRK6zgypkl2j9nkREXgKTuZsBCb9gHIjgo0a/wfVuiMLxzAuD0eiliCPkk
	nliXadept4xjg==
X-Received: by 2002:a17:90a:e18b:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39b26155274mr30100957a91.10.1788761921573;
        Sun, 06 Sep 2026 23:18:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm27508896c88.15.2026.09.06.23.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:18:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] edac: fix typo "enqueing" in comment
Date: Mon,  7 Sep 2026 11:48:37 +0530
Message-ID: <20260907061837.40929-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "enqueing" to "enqueuing", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/edac/i5100_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/i5100_edac.c b/drivers/edac/i5100_edac.c
index d30919ceb22b..235a3a46585d 100644
--- a/drivers/edac/i5100_edac.c
+++ b/drivers/edac/i5100_edac.c
@@ -557,7 +557,7 @@ static void i5100_check_error(struct mem_ctl_info *mci)
 }
 
 /* The i5100 chipset will scrub the entire memory once, then
- * set a done bit. Continuous scrubbing is achieved by enqueing
+ * set a done bit. Continuous scrubbing is achieved by enqueuing
  * delayed work to a workqueue, checking every few minutes if
  * the scrubbing has completed and if so reinitiating it.
  */
-- 
2.48.1

