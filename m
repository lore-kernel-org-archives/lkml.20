Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798F33EC82D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053329; cv=none; b=kadyk9BejMrW+IjS6YxQpWQuwonI5tsV1GlwfGyVcvhW+3n5sFXJcr+tdXFlqE6xv/P+KJjPmDAKxEO8IQnfFmaJ07sgizG0baaDRLxR9k12QHhwHW7+B41g03jtQ0hj4mgjvnYwd0QaXuy4F+V7OBR40pRxFlvhuVRY3Gl/DH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053329; c=relaxed/simple;
	bh=fKJD6yt0VtxjR8Qs7aUsGy9CTSw7+gIiWlhz3pbgjlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wz64gjvdRRNs0l6194xDUkTPPBjxPGDT4XkALKWJyRtkT0sbHCAfLgLqgT+HOsR42y7vp0tQ+6UEOEm1s0IbM1yiHyxmdPE+kBch3On4fCBsweJjlwrEZ0HjPXVp0PLCtaSfKmK4rg7s/GzDcNt8/xTEiP/Sf/JjCPQiBrGEvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYer2fXN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYer2fXN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2840919eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053327; x=1792658127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/HZc3zEH3FMgTce9H4OKnvH8oJPDGjZDpCmpbazH/g=;
        b=bYer2fXN+hFvXKqBtte9KSGiWMVy1M8MzCF7rPZtz6m2tqo00bQxx4OHECZGs6/pEw
         rU0SO5Dqgvk5/fg+HfacjWKlRhRhbGOPbJbsCko4KxiVTKBQZw6dPzh3aWDD/bas4P0E
         uAM4tt24018s0Paylesi78n4D1eJ97GN7YUnrrdGzWXuaL7qYBmDweu7BTTtyXUFakPr
         3TDRYVWd1zoCzprah0FJlrA0MuoloqHXQGWnI4flWmrzSIb9t3ahSWO9Hz4q7azw0ux8
         L/nPUwdMMAR6eaeH5CJJTU/kPnDBJWokx7Qd59WX3KYOYHGiGtRLIjJmpJ1oRNEkAEPN
         1hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053327; x=1792658127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/HZc3zEH3FMgTce9H4OKnvH8oJPDGjZDpCmpbazH/g=;
        b=XS6ve+1Fz66qhLP9IWO1ZdgSZIFclCRS90sV5aikYkfZ3Vyt/dX5Vw5S8TvZ0kUmDd
         v4EgxyCcThqFZDthrWjASRZb/WR4CbzMNQORy5+aPfSlIFBFaMgFhLwTKLM5SpfFrePF
         xldwk417zeHcaWi6RQ25u8EV4M7ITGqEvo66dWRLkN9RHq9JKBUUhXWNYkeEE3WN17HP
         t7zsX9uCNsYlzmbfFSwhiEg9qYPomR1vqpplwj0PO+N9QiEim4tosThErXjsllniyxbX
         K6L3qqEzmEZMTyk91e7w2+kJfxgU1LKLptiVdtlTXupXgTszIwJ20JIYJlCeCUl0lesU
         ZGnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzAc7JFAGpRC9RwKGPXOC5+hUq5ZMSsySgAl5tkOjwDvemN24itGoVSyeU4HZOqyupwF+2cDWpqODjoek=@vger.kernel.org
X-Gm-Message-State: AFq9FYIURCWBcER0Du584O83YMbYfRUE+SGnn6lFYJTVxymLtX6NzhHk
	RduATGFUJ8MXoHy4Pc681kt4zWzhNf4XjSGzmRqswiCtOxDLszdqGv1Y
X-Gm-Gg: AYBFou36GvIY2ln6nm+BFf82lWgzOZe/8VS065LmwToZlynQ4hY3BDMDVucLPsveqrT
	OIYvJ8hVCxm3ZnoS+d+SQDVa2JCCfF8KYeJygvNBe1juQ+YK3bBDfH8vetD8Zqoid2IKXyVvAa3
	Kg6LajlBGwxEp2nmsNkn2Zja5RJYO1CXDdFdPZkX1xn6NLNZEQeJ10QLgTfCronaBjsxnoh/1ss
	lbSR/pnicj2ivRv3XrlCoqJE9ZFiJA/M2C6RY6XH2VytqpbO24KXT4UT0h7qgTVVkX4iOywc/lq
	eqwOqyAUF4CWXl/gBUMiFq8Cx7AEbtDTpVpGapgcyKWRMljaP2egNMjGWZuDViBxfcEzI3Rq+SF
	FAG4CiQcQbIsfzP4bAH3lF858IkH7u7VkKMteZVa9eQXhvcG5885jDhGqpsP7z+AWNHuqSfZC3O
	SSdIXV9IuQ1tG+7rygEZYG8KXHcpn7QD8Zz28nQ1olbJ74mILIFm4MCOeOyYoKHNRSeVvxo5R1J
	fQP7ui8MiNEGD0Omdq++S0zA+d+sr3gPG8=
X-Received: by 2002:a05:7301:797:b0:353:7e28:9c58 with SMTP id 5a478bee46e88-3537e289d93mr23036589eec.41.1792053327341;
        Thu, 15 Oct 2026 01:35:27 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm64539101eec.12.2026.10.15.01.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:35:26 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daeho43@gmail.com>,
	Daeho Jeong <daehojeong@google.com>,
	Qiuyang Sun <sunqiuyang@huawei.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v3 1/2] f2fs: flush SIT journal during filesystem resize
Date: Thu, 15 Oct 2026 16:35:09 +0800
Message-ID: <7884c62cae6e4b1ad516a9ac351c2604e57d5cc5.1792050467.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792050467.git.qiwenjie@xiaomi.com>
References: <cover.1792050467.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During a filesystem resize, SBI_IS_RESIZEFS prevents new SIT entries
from being added to the journal and forces existing entries to the SIT
area. However, f2fs_flush_sit_entries() returns early when there are no
new dirty sentries, leaving existing journal entries behind.

After the main area shrinks, a later checkpoint can access a journal
entry whose segment number is outside the new geometry and trigger
f2fs_bug_on().

Only take the zero-dirty fast path when entries may be written back to
the journal. This lets resize drain existing entries through
remove_sits_in_journal() even when there are no new dirty sentries.

Fixes: 04f0b2eaa3b3 ("f2fs: ioctl for removing a range from F2FS")
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25785b7626bb9..bf8d07fcce331 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4893,7 +4893,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	down_write(&sit_i->sentry_lock);
 
-	if (!sit_i->dirty_sentries)
+	if (!sit_i->dirty_sentries && to_journal)
 		goto out;
 
 	/*
-- 
2.43.0

