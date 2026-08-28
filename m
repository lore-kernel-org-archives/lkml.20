Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA5D46F482
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926371; cv=none; b=cmIwlopQy5w7EYN4/eImgaQno7V2l3hbHQo5ahH6Q1Z+PJeZtMRthZoZM8glXEfaoZw7jYxNisG8/24vZu0FtNMwFswbQ25FynsnwHHe9oW83RayG64dtgfdQQmWQaVk1uXw1tjv4kflh7NhE50OaguqbjL1FSjkQh8OnIC8Ctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926371; c=relaxed/simple;
	bh=39I3eAecLt8/avHqmAyNGTKzaLaG+ZfRVDPHk9R/y/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAkQr9WFvOj4CzX7nAU+dNhCcqzYrB62O1d0tsv1FGljZm9RwCIHrtD59l4WIwFcm+njFTzfQivZGnZiwgVtN3Nr63kPAao0YPfCIHwbldwLo7AdPTX1k3zvrpz6eUq6sCYFTV/ss7flgKfWHCLhYNjkCSBFm3wI+sMPOQGyfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLJA2bnk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLJA2bnk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-396b3d0df94so1117189a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787926367; x=1788531167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n29SS5Q6nUE/mH+zwwp5J1MgKbYJCrFJK4KKmQ6En+4=;
        b=GLJA2bnkvHXvrofHQivxTvmEGFfWHL7IAl0FYliVqMa6Uq5jMQcuGPL8iHriqwLWQu
         0+8oik/PySIZyCHeAnog1k1ZrjphMxcao3vfhGYlf9WNHl3d+Zv7RJ7ifphyjvvAfJuJ
         KUJL0ztsAk/P+tn9dQh1rcuU8Yd/nlfSqRSUjNvs+0M2oajVJ7Z+SdEx0ZY8fVGucdEV
         KajmjpouUmh+nY+Sz/NR2J0ZSAGXuKUHxapursG7KDyKj8LU6o9reZmXL7ocBrqvOark
         y+NPBvUP9DvDPrbhlAshXK9bCkA9xrNt90nNwb9kKKXxhdK2oGbevST/60YFyXEABPxC
         MxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787926367; x=1788531167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n29SS5Q6nUE/mH+zwwp5J1MgKbYJCrFJK4KKmQ6En+4=;
        b=qiIlZuPJt2MpVmJueChX2Nkd9/fh8JfRfRjRz/RNtmTBaueY0T6/dwnjmo/NrTMyro
         uJctUqq6OcVlu16zmLWCgE49WEKAVR/OhGql1HqA76luJDfFpOHLYqpe57eEHs+JBeq5
         XiBJ01iODECeeVOx12wrli54wVnYEvL6RjTh8MDf86Q3MR4lBZgWZVNqtQ7eyf4OcHTj
         r1a76GXKMiiKR0sgLAzfTCsu/JRps2fgpYbVTwy7Ohcwq32pvzFvYliSMEQuBAmJdAho
         Con5ldJaoTMGmWeseJwHphAAxDwAVZiqgAkwg9Omc9kEWrqPVZGATtc8nl5WWx1uMDns
         MDlw==
X-Forwarded-Encrypted: i=1; AHgh+RqL9E7DZ23Bp/PDMKcOqahwJ0cVMzVVLoQTPzH2MnfPrgDg8y74yBEP57pD2C+xql+LmsQkcvbAsxop+zY=@vger.kernel.org
X-Gm-Message-State: AFuF++l1/SXqCUi4oubFqeXjhfAI9dOoXIa4MoyYYL8ZwdTB11MB96A9
	BlEU3LejHJ2STZG8sj74LBOqa0ulmk2Fcxg50rTlcd9buSaDhbLUOjF5
X-Gm-Gg: AR+sD12HTEtsWjPvZQmuY9sl4xB+kg8Rkp4Mx7GtAplQ27ysgvWtV2mCgHNBDUV6fLU
	O0O9k1uq138TjnuDEvhgXEdtmIVR0ntvQeO2oVgEVWwn0khrkEclWqTejS1ley4jhRT5cY4ksb2
	Kl0y3Cg/653oHY4QZN2XzMGE/92MyyHGMINU04MR7XcvwX/ZjXb57p19iUlxtXdVrAPbujiSmdb
	ejWhAzx0dowNmNC9recxqc2ihMrGWxSOngnLgAN7l1PCogfBYWP427l/6dfwXMRmKgWQRrSgwtD
	gptlYzoIQSrCVgDlKmXG1+Vrz89pmmrIs7ju1haZX3huMmHNsWGYNpqYZsnLrAA69+GU77ZxMmU
	WT8bBZJ4ktXltvz+7s07IB131s7RndLAQeQvYlKxA1zbuRV40oJ4qsMVfvwmm4h/mwxhd4J2B6w
	iP8Xus+MxiXhl1QMbUHGpsq6SsdSAa47QC+Z/u6H9Chm1czNjffI/M0nvEHnS/XiXCq6kjTwb6c
	EQBBZ2ZZIHn7ieRU5oy/W9F
X-Received: by 2002:a17:90b:3810:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-396d0e7cdc1mr13901532a91.6.1787926367461;
        Fri, 28 Aug 2026 07:12:47 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc0c703sm2737951a91.9.2026.08.28.07.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:12:46 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: sunqiuyang@huawei.com,
	daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH 1/2] f2fs: flush SIT journal during filesystem resize
Date: Fri, 28 Aug 2026 22:12:39 +0800
Message-ID: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
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

