Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9264334A9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235571; cv=none; b=DFuqVez99BkA1W5f0Ans4yB0yRWb2aoQvM4UWtokJ64ZQGFIosAlbzeB72yR+BhQCx3sCy5O5ZvoZ5swZ5wFrVwT9R8vho4iDSPpM7+TidDImxGqMNtUJL0inlgALcoNxvxg1ls0/TRVG2zmmpxWTnqClaQiQPjlf/6zqUbR668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235571; c=relaxed/simple;
	bh=PjIKux1hcNvgxfpiHRvfSPqe0WlSzXEpKyqS/KZzy5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9eEOSBe15lEOWTa1LtogJct9AxcZgten/bMvS+BvRVxG+JC0OZ7Cj7FaRFYdxEWReJGNzzJje8jihME2WIFWYBBFSCz6NA5BapQGPQUWsiPNtF/aNWBhbqehypRyeyPNrQ6Fj104y6bu72/OoDi0R4xFQzSeTyNnEbMR7suzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GG5w3nd8; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG5w3nd8"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so941068b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235563; x=1790840363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYOjaZsmA/UC/cCkN5UkTpeL0qbdNP9RpD8AiUnhENI=;
        b=GG5w3nd8eVJrszCocCjdL7iCie2GQLtXDwqz64kvch7WrNVhmNiWd63D6zIuRT6k0M
         Gzv9eAJdj0SSuS7PdsIdWuqbTXGinE/oTHeKuETh+io6+iEloN25c3BZJCx4MHpI7w5i
         +GYuHiAxR7LCYP1Ur+kfnI07H/vEscv3Wzgz+D9XJAHHSjMDSALt0igJUmNIh7o/tPYh
         YynMKa/7OcGtp9+OwsXCkYn73lYYK/KUlTb8BBMY/U7uDtt5xSP0grfJiM6b87H/Xs8r
         OofUgaS4lX7mNdkBmBdpiz/lMJfz9gOXjBYsES/G9qJmQ+dpfy4bSjBtDJ7/SbSNptTi
         FxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235563; x=1790840363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYOjaZsmA/UC/cCkN5UkTpeL0qbdNP9RpD8AiUnhENI=;
        b=INfdyk0yq6nhpzv4TCr6droaz8B4LbEZW/rJzafAnjSvxopaRfUyP5bb14klnCazZL
         ZQGuqPTdCShbCtUacWn0YONpTSFvWd9xrHZaOvkA39XNMrNnS5Xch8rQ8sR/lIl6E01U
         Scwq+Y1C4FmLtJTFUC0E9SWOo8Dr2Vn/MpoSGvuoW7pM8nIUbWT2aV+GihVwz9exicxS
         TG4gJTsjNmkW/StLTsuG/v+pcrg8dhAAVKrzZtQca/GjJFuY9eu2ViD0ZD6nOPOrxE01
         SPsr315o2pRGNcTydCVXXCm4pTQb2YZWtZZm5uGMLts6nabKg8+dlDswB+fJyZYiJOPd
         YMuA==
X-Forwarded-Encrypted: i=1; AKwUvBybk62Bdk0ROcNu5m7kmFqVkIz/AK5o1Yd4GHE2+zPz+WuN3Cu/ae0axPM+jj1tUHJFt4/hyDZ34wGNKfE=@vger.kernel.org
X-Gm-Message-State: AFuF++mlUomM25dLHeYS3eye2e0lmrxg5df3HTayU5CMsJFKO8XB1LQV
	JQiRStWTpFlZ7XPSRUophnBxB/3M61qvvMSZdDouuJwWerm/pQiV1Ff+
X-Gm-Gg: AYBFou3I/37KUjym3Y+7e7wKDqgTbHQQS3/PxSQ4AnBjDmja/Dc1jDuQ7NzFmojXj8G
	5amou/fLnbAx8l3vw233AyTgTpbdwxto7V3ZqkF2iUY0hbE+OzrIoFrasgh+SNNyPMbnT1lhfHI
	nrMrenTndw1IyW+f7TlG8iqmsRjQm84NFUjo1ms55nJB7L/olMJPkVEQPnHSykD/4pMOau8CGQN
	g/M66L9mNBpb6IDnvs5gyF1QbHX3MD0awEIF9uFAUmy3H4yQWsDOAeu4tijEDmAVOpOabVG6Uug
	dUNGComqdPAZYH9cu3p/92Unlb3GwusTmC9Hr1yNneLgRbQ9tvzaLPmUnFmN8ZzF/CgfaDTmub7
	Ywt52+Z8NUZmcFlgSbG6/1Ki1floKsTs13N0uJ5qcwz5YnJPH5or+4pxsaDxmWTPtRy6BbxOUhd
	033jX8rtmipuiWSwD+OcsP54SIdWLZ64LTMUlnwCrqXCiBePSByzLOESRHniWaquEr5peRc+qJd
	dParIaG9fE++gDYUlG9HenjFUSe3AAyG5Mt/TZVKhST3QuwXOKjvhqxLF4N6f1U6Jbi3lJXoYqU
	U9JCI/uOFw==
X-Received: by 2002:a05:6a00:3d4c:b0:86b:b06a:d3ad with SMTP id d2e1a72fcca58-87e99568559mr1319879b3a.23.1790235563022;
        Thu, 24 Sep 2026 00:39:23 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad44c6sm2393739b3a.42.2026.09.24.00.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:39:22 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	matthias.goergens@gmail.com,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 3/6] qnx6: avoid double brelse() on error path in qnx6_fill_super()
Date: Thu, 24 Sep 2026 07:39:16 +0000
Message-ID: <20260924073920.2782917-4-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260921042511.1473629-4-benquike@gmail.com>
References: <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-4-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_fill_super(), sb_buf is assigned the return value of
sb_bread(sb, 1). If parsing the primary superblock fails, execution
branches to out_sbl2, which calls brelse(sbi->sb_buf) and then falls
through to out_sbl1, which calls brelse(sb_buf) a second time on the same
buffer head pointer, causing a double free / refcount underflow.

Fix the error-handling cleanup sequence in qnx6_fill_super() to avoid
calling brelse(sb_buf) twice.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Add Tested-by and Reviewed-by tags from Matthias Goergens.
- Update Fixes: tag SHA to 5d026c724220 ("fs: initial qnx6fs addition").

Changes in v2:
- Split out as patch 3/6 as requested by maintainers.

 fs/qnx6/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 444458ce3e77..70438cf5efdf 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -348,7 +348,7 @@ static int qnx6_fill_super(struct super_block *s, void *data, int silent)
 out_sbl2:
 	brelse(sbi->sb_buf);
 	sbi->sb_buf = NULL;
-out_sbl1:
+out_sbl1:
 	brelse(sb_buf);
 	return -EINVAL;
 }
-- 
2.55.0.1082.g2b9226bbc0-goog
