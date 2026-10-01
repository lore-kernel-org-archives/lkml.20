Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290AE3451A9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866184; cv=none; b=LdAttC8sTbj7MqyKlk1Q2bEc72YYBD8iU+dpTXeYsMmiKvWVzkgvjJ/YDPDpOTl7Op6fWR6MU84Ewc5Dje/+hvTc3G69QDqf7HUVOpczyqyjC3WfV4W7MyJsBdRqYcOCcf+4HPh9UGlAV+rmg62oqbKcPAfvpyfdO9QcJHWVCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866184; c=relaxed/simple;
	bh=Oj5C4Mfx0dTb9luGBZORcT2IiZ7I3lUSzqMSLKqiAiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XipF9LAoTSdyFWtN0vTRLZUFdmFkpbSps+63J20HxXpWDHil1smMjkIx3no8GgzejNivRlFe/suupLDYQZ5olxhTtFpzSOKJskROVLMt85YFfgQRqDLKUXvtEixptvmgviUlZGtUAGuyIDDDtz6qY0TIPKC4R+714eYfbBjUCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6oG742Q; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6oG742Q"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d2bbcab2so12003495ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866182; x=1791470982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kxg73ytnb8qP6pJiBvg4zQ5ISBtXzCRO0EIz45SrSkE=;
        b=S6oG742Q/QXOyCQphW7CN8a250AcOQobfC4bkHb5PZwliQO3Vsp3Z00fK9hXMWLC15
         te48lzj6ReBKXth/ptPmFHzMUg0CX6ljDDOjRW5BoeLf2bzrQ4Kk3hGDQFk+f30TC76L
         Kdxjh+2hT0mavXpnkLRgQfx6hE9TxMTWOK7prbuE26Sv2IR5VKAjIdXlcXtZHPlGXfNe
         nvTd/zZSXM2BBMffyQ86ZdRdn3rlOTs4T5g0mwW4u+wCl5wSDi5ipx8S+j2LMvgJMBha
         o5/0Kze5HM7cu8VamAGK7xEGvJNmMdiXIucMblDrPV/3qgL++QO8X10uqaW/tT5SzEOi
         zfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866182; x=1791470982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kxg73ytnb8qP6pJiBvg4zQ5ISBtXzCRO0EIz45SrSkE=;
        b=Z/AivAQNaLqJokFecyDzlq0m2ecezrND/4bWarngLz2BYMZdr5o43Ft5Krix1X0h4K
         8I6mJWaFJNLazaB6wQzAa7DJB7hmKAXpQjpM7xk8EgCWLympDMDdV+5Hznq5HVCBZkwk
         2w6IMh8ZacsCm2tJ+ICsh7fYqUZzusraESnDq8AB01RNsHqq24iWScyGAAlrSwop4Id2
         06OnI+lMfysregJm36DtESfIWtQA5nk3oSUD/CwEPJoWG/yoiZuDBzVSb2OugnUM2iTk
         h3nmBhWq6bCSQQPTEGPmmilGTQsS5LM3+FkfoZaCiLLJI/1JoR4eblf8n7iw6YZofKnR
         ZONA==
X-Forwarded-Encrypted: i=1; AKwUvBwVgD5I+tGwt9tpErmwS+p8Jks+7tft9PUIA5/E9w4GWBjWzKWoY3xKPbkaHyl+NAzseIood9w5wS9HBzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCJbeE4wU2IMQG0NoBXz2bm4xfQp5L2x2RlC4ibVl53Zrl3l78
	qKcUdvWNPyJ81vUJ9Vt9mNqW1+ohm69jYbzd2nI7dsJfdrn9rGnwmNbK
X-Gm-Gg: AYBFou1F4d5xJFP+gXEXDJXzyK3HTSdWlS69FP2VJyTx6pvjeJ0NIfZVR0rhHVcCRo3
	FgDIlpUym66b5XBd8Txud9R+iDKedxnntIp4qaHvWNRcZW8mV35QlHCqJ4KVj+IKnxNrxGJv8nZ
	bwCCL2GXwq0O4WHxbJMckyWCTNCOLlGru28LkvleZWgV0uXkgid5TGDaq+1KOOOxwRmqQWYPB5h
	6M3DbV8kAUd+ZAfCn3DK1Bm0ncUregLo8jrfqr/YKubfXilrqMJGFgCyGmuU905i5E9m57bNJHu
	IH+cjs604hEzJzS3Ac/+qU36TK7KJCh/y4OtS3aSyGXERHK/OzB40gxnKGZKxXG++xXqv3BB+NG
	lTTk3kCcTnNnWWXKcwg150osDN0awGsxQG4puaivFkaogZ/+glxVmzQeKmZccZQ/yR3TMlyK05c
	sFoDEbUKp58hoSN79huPjKMB9Kw+0y60Vd62NmpYC2bJcaRebiCMCtbM+rJtR3cDvBbvh54/vGf
	ByK6hzOkTR7ldRGbqXSLxEJvT30VecW4ASpVetoLpNQNB9JTZ+kiK96MUna5pcgUGvNtTI0lnI4
	FMWXGUUBntIJQauP+xIEiI+l+2OUUE8QZ3hlpAqiPsxlXrznkhBgC+a5BkY=
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr46519465ad.6.1790866182244;
        Thu, 01 Oct 2026 07:49:42 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:41 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ntfs: fix spurious EIO and ENOSPC on nearly full volumes
Date: Thu,  1 Oct 2026 22:49:35 +0800
Message-ID: <cover.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix three errors returned while free space is left.  Patch 1
fixes file creation failing with EIO on a nearly full volume; it now
goes on until the volume is full and then fails with ENOSPC.  Patch 2
fixes the cluster allocator missing free clusters when its start hint
lies at or past the end of the volume, which empties the MFT zone, and
patch 3 removes the fallocate() check that then fails every later call.
Together the two bugs make fallocate() refuse space that is free until
the next mount.  Reproducers, run with KASAN and lockdep:
https://github.com/matthiasgoergens/linux/tree/reproducer/2026-10-01-ntfs-nearfull-v2

Changes in v2: in patch 2, a contiguous request whose run from the hint
stops at the end of a bitmap buffer or of the zone now gets that run
back, instead of a second, non-adjacent run from the zone position, as
Baolin Liu suggested.  That second run also happens on ntfs-next
without this series, and fallocate() over a hole then leaves part of the
range reading the data of a deleted file; patch 2 now fixes that as
well.  Rebased on ntfs-next, with Baolin's Reviewed-by on patches 1
and 3.

v1: https://lore.kernel.org/all/cover.1790503811.git.matthias.goergens@gmail.com/

Matthias Goergens (3):
  ntfs: set the attribute list size before reserving space for it
  ntfs: restart the zone search when the allocation hint fails
  ntfs: do not refuse fallocate() when the MFT zone is empty

 fs/ntfs/attrlist.c |  5 +++--
 fs/ntfs/file.c     |  3 ---
 fs/ntfs/lcnalloc.c | 25 ++++++++++++++++++++++---
 3 files changed, 25 insertions(+), 8 deletions(-)


base-commit: 708f9d56cacae21aeee98d16bcdd50a66edc04a0
-- 
2.56.0

