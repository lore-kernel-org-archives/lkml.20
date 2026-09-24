Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767C42E419
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235567; cv=none; b=G637bZc4PMbytPMEW1RguaO4JSSvSuMMPl1VSmGuE/FYxnwouGhuL4MO+7GcxHSDYgpI4bVaDiWbI/OrA9exc481L3IdqFxb22RnJAv1aAO680Fzc9O/bupS8QKB8P1Ur1A7P5ki2LNXrj0uv211GWAJ3DOmb45NPPBqDQ8l8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235567; c=relaxed/simple;
	bh=y6ChmsjQ++3k35jLXB4KQNbWrTjxMp75K8wX+AXVsZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKDY4nhV6ffHYhfObNEhqEEZ7oyTST7wsIkq0tNMQYaa2tghVihB53BIb9Qckzi4SzUBco/dPI/RO10BzJanDaXB9tuwudg/yJxlurOph/7Q4ngaUVwM4XjxbFh8h4y9p6ARD2IeH5ANgbYEJwkgevuOCiaKMcq6ozkro3XrSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxO6AFOH; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxO6AFOH"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469d20963so917535b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235562; x=1790840362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv0RW6TwCjxSURRvA9N6M4UqvR2d6pgu7b/r8/8yzS8=;
        b=RxO6AFOH2kXb+DommL5UIH1VV74yswS/YXYUz1Oob8y/YXxtZYlYr8312yll5QhiMu
         VykEfZ208hl/kguDfoL/+3eKVy0AghgpWD3ahg2G0BFPpdiuto4vXaTrMM2d+ct0n8/a
         ySIBN7vD2BnklHhef6W0RUBbqZKajrwmrVX0hyoPGMB2nZC1Ldi19Y+QgfhNycaJe7FT
         wBGk+ZFhHiPuqB92SCwWhLTyxblm5fQqbdTK/olVMinEee0T29+hgfIOykx92BWf8bsZ
         1llgpLPKoeHmEc+otHVADj8tDdgL6bTwNvKfD+bKoQwZxWQNvEhsBKDvj2QBk8jUWR2Z
         zQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235562; x=1790840362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv0RW6TwCjxSURRvA9N6M4UqvR2d6pgu7b/r8/8yzS8=;
        b=QQZBdRCyQCFW4dTi0S5/ArsvNvijGTeCaOtQZ9UBjIcxp/Y6fQbb2lkKtaqq+4erfY
         +aTYQ1eoW0Mi602aCqdHy9LYMXU7wpOO6px2jacGaNcZX9iZQA6r8hCY4u3NrKFhcxs+
         sWqQIanGP1FF9PvsIjcpkeLnzJM3N2o9vEuwKWeEW1G8daBWJHr6CxUeHjMGL5sadIUB
         KcNo+5GqpqbhMKZhS+M0DgwtxfAUeRtoJNdhVLl5+6KRJdL2As5R/2jPv0d7zcabwYAg
         LITagioTyDoKYvCaz+amvrnlP3x7MO/0w3ahXsRgSDJx5uclFeZZUE0RbcYWc9VWuh+T
         xg7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBrPkEo9c2V16mKBbq+XtA9ppaiEB+mKKgjUFSDqylUwQPmI9B3zPe+u4Oxve+g+/4rwQwNrXe+V47FRM=@vger.kernel.org
X-Gm-Message-State: AFuF++lw4mBuT9+dZHlcJvN/DuuVXqLlFjviBhPn8yOKxGWKA5otiSAK
	9jR6yydH4kin1tRS7NmAAzU/W31/liKpe0vVotMgH6htFIf3HcOKR8ot
X-Gm-Gg: AYBFou14+fmD+9JXuG89BlqwZGm8M/bsVAXcZPhRkH2MhKmP1kRuXMJosUbDwx1blUm
	Ht+FYUkZorUf/I6/QYEhhR4lIXC+jQUPKBU5JfFKgbJGHBvQHMffoQPjA5rwxMVNY0pDSzSrwnX
	1HFnkFkzdtDzPps0V/WxLJkCoqtkzkZbD74MzBMgi/03STlxZr9lpUGrZvXZSQA2M1d7N8ipaxf
	iJ74X4+CHDJ9BKLmzGIDI9TF3zuNjBamSVSPy98MNAPER5kATcdDpsbGGbZvN/cyEYAp3lxSmVT
	zKfxx0D5bTqL92qvHADHEhFIj9fuDMOSqXr7BD5M8pvcoNEFDpdkw11rXW1OOWgIDE127pSWWGX
	OnilmSGIRxNcCcth9+F4wtaLxIJTXCU//aNP3kdBdzOt6AtYXxoUMxnM6RGY2r0LXtZavPwXyjr
	txDEUopZm3YbcEwAbaf5zojXaA+pUTnUO7gAYwx1xn02farC/wAGiihFSdY9Yzig5SXZw5Q+5P+
	4UoZMGZhzHI88iqV/a/ntwLKkPFIgILvpPUWMBSfOxSnkrnnMNGDXKhGlhUJjtWRRbC6QYyIhhn
	cuZUjeNJYA==
X-Received: by 2002:a05:6a00:ac8:b0:874:708d:b62f with SMTP id d2e1a72fcca58-87e9b896bfemr1262761b3a.27.1790235562102;
        Thu, 24 Sep 2026 00:39:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad44c6sm2393739b3a.42.2026.09.24.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:39:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	matthias.goergens@gmail.com,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 1/6] qnx6: validate di_filelevels in qnx6_iget() before accessing level pointers
Date: Thu, 24 Sep 2026 07:39:14 +0000
Message-ID: <20260924073920.2782917-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260921042511.1473629-2-benquike@gmail.com>
References: <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-2-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_iget(), raw_inode->di_filelevels is read directly from the disk
image and stored into qnx6_inode->di_filelevels without checking if it
exceeds QNX6_PTR_MAX_LEVELS (3). If a corrupted disk image contains
di_filelevels > 3, subsequent file operations using qnx6_block_map()
access qnx6_inode->di_ptr[] past its array bound, causing out-of-bounds
reads and memory corruption.

Validate raw_inode->di_filelevels <= QNX6_PTR_MAX_LEVELS in qnx6_iget()
and return -EIO on corrupt inodes.

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
- Split out as patch 1/6 as requested by maintainers.

 fs/qnx6/inode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index a15c4de4f794..e1981e4ae47d 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -547,6 +547,11 @@ struct inode *qnx6_iget(struct super_block *sb, unsigned ino)
 
 	qnx6_inode->di_filelevels = raw_inode->di_filelevels;
 	qnx6_inode->di_status = raw_inode->di_status;
+	if (qnx6_inode->di_filelevels > QNX6_PTR_MAX_LEVELS) {
+		pr_err("invalid di_filelevels %u\n", qnx6_inode->di_filelevels);
+		iget_failed(inode);
+		return ERR_PTR(-EIO);
+	}
 	if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode)) {
 		memcpy(qnx6_inode->di_ptr, raw_inode->di_ptr,
 		       sizeof(qnx6_inode->di_ptr));
-- 
2.55.0.1082.g2b9226bbc0-goog
