Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1B1FE47B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983539; cv=none; b=RRj4MTnv893AWkgIwz+j59AFXKej/ubS5S9K1ovVz71RkUEphfUtZbaXJ8skMToi4f2qGK2+gF6ZsHRbXbmTkuIQSALjgqlixhkRM5z3uQ+Po65106d25+fE+TRRKU04gABv48IkJMsZ/GsRjjC/yS3+WN+pCTVVXfHFvpUlK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983539; c=relaxed/simple;
	bh=39I3eAecLt8/avHqmAyNGTKzaLaG+ZfRVDPHk9R/y/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRw4AVs7j0sg4DdrbUKd+48xglRyCBJmCzCe8ytp6yZVP3o1rAn+NRaD6VvMQoqB+7oXWqHWJ6MwzNa/2KNMw0ExYAuNWMOgZ2teYTkXsIw7isyUmZGwutPEXvEwDwhpyEV3RINnKSMzAtVRMjd+zp70lIOEBSGG/0OuJrsVygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CahsG7Lm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CahsG7Lm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39647184c73so2767799a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787983537; x=1788588337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n29SS5Q6nUE/mH+zwwp5J1MgKbYJCrFJK4KKmQ6En+4=;
        b=CahsG7Lm8skZtqVVKWEOOoa/1CqJ6Wteqz6HqwJ6wyzQX5lIn/2yaBPaXL+WXhINmg
         SypYG/TxRuAk5Kyp2faLnLO9Uqhk3I5oAe9LOd5ZyjWa2auH1++EyD/oZ+5YGYEZSdGY
         gJt9JphKnmyaTjxAW5znWW6r1nn11/pwLW+u4RdemwzZEURbzlnfw7R2/md6viZMtUXg
         avwNTxS9LQCPNpBUEdGgaIPAK+An2r4MzGqYxLhrMQV+WqqzJWt+rneAlvGisy7GVfOi
         2KWAiUTWvZNNkL3MEkFmBAs9jC+Ay6x8FjkvdfNzJT0hyMrnqbTab6+qknag2tY+nQ3C
         7zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787983537; x=1788588337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n29SS5Q6nUE/mH+zwwp5J1MgKbYJCrFJK4KKmQ6En+4=;
        b=cPX8lDg1AgCV8bYSoyMSblBXDW9COAEinfjSFLb1MBgqtbq3gChRSCPTKj692v4IX9
         SB2CN/t32TzBwbADO4T1DAZIX6ZiPMniW1NZ0dQ168mkJmlXLHgyTYbipQcICgtvwBjL
         X5/XjQW7hmJs0rS7vaRVSm94gsfmSTVQZaQLTvbBdgXvxr7JnlVQ6g1SLloRT+stTMUM
         bKSYGIVHokUvtPAA3d9eYmjM/K0GX9Ze1+H0iSFn/HNlAcSnCTQ/Lrpc0B4hmWBXeKCy
         iQXB/qgWaYIAOhh6qHCWoE5smwpnvYkFt7O8iRdvEqcjmwN9J/wNLx/wFpfMaitvTLw2
         8uNw==
X-Forwarded-Encrypted: i=1; AKwUvBz5WlUewlEazP3iX1va8aaB3shpU9AZLdMFOKT3VGUpUcLMimYC0aw18ObRGGouz8H50321XjqVVgDSpkA=@vger.kernel.org
X-Gm-Message-State: AFuF++maBKrmsA3WTidHQbRXOX+lB9kYIelszL8h0zWfNiFWXJo3lERW
	mXV3gRMh24vWldBm2aUcpTay1SNphi4y2pFFt68O1B/IlTDVimDhGeUf
X-Gm-Gg: AYBFou11R5A8QKVSgZK+V4AnYzoyxOkKN+U8tVXOIXBlxLP1D8ff1GGV+/HCJrL5/UH
	stKVB3C3OOzk6U7jEXrnAKMOfKb9nDB1Ylp7k30/1HJIwcEaKAUbw2LBwIeaiq817FKTxGMN0IM
	IKmnb+FN5uINFB4oC501/wv7LdRiXfBIX9/bvvE4PVi5qMbwy9RUhYhHG/C2xUkRdZywUwTA5/z
	qv+vvXOdr1hJ4L3RrJ04rL8rKSFny+6E9itFhBb+9KZxRq0Tz2+7QXd4cxH53wfyx+j+X2u+tpQ
	vF+WkHsPiEVbXmHCrMCYl5rHJEAMfqISQumXZagUIdUGvfu1r/Lv4xY9ltmub3CuXgTTuYFZ25u
	0NQAHjsdLJpA/ZqT0vsOB6YifryGFZ2uRUX2++VL9Tj22xRwLCx7+tSO4QM0/mhBJ24THHcBTBT
	8QGkPNCDEwhJr/9zYCbyn0U/1YiFdUIl0KHvmb3gE96ZGOXhls8GYrFTwY/jOMRXMh/Ho/PgB2H
	0e9J0xM+bYYX1hnalmdF/bJ
X-Received: by 2002:a17:90b:50cf:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3989b0db85fmr3991699a91.0.1787983536638;
        Fri, 28 Aug 2026 23:05:36 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm5609411a91.2.2026.08.28.23.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:05:36 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: sunqiuyang@huawei.com,
	daeho43@gmail.com,
	daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v2 1/2] f2fs: flush SIT journal during filesystem resize
Date: Sat, 29 Aug 2026 14:05:23 +0800
Message-ID: <20260829060524.2656620-2-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
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
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1e7e745be71d..9f9ce25dd07e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4816,7 +4816,7 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	down_write(&sit_i->sentry_lock);
 
-	if (!sit_i->dirty_sentries)
+	if (!sit_i->dirty_sentries && to_journal)
 		goto out;
 
 	/*
-- 
2.43.0

