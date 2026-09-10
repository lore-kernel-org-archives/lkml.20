Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E444BCAE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036478; cv=none; b=Rpz7bel4dMGkPnVDXAu6N4Dy3cpxMYnLuG5ZBu7mVd90POpj9NaJEQhnGfnXmKA1wIimRovh6YGMCX9G8vCAXNfpCDm9huFCPMFJAyUH6s8qQfpKiTlyVRAM/Zq6Db4afxA0+I/W9Otnr4QHfrR/JOJBq3wC739fuZG4Rys+LTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036478; c=relaxed/simple;
	bh=T61jUClhHfuBav0MvqbrTcXb6O6OwQAfNINwjj+r7RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzbQZzqe1hZKMPAtL++F8jLls/Rrwf2kaxj0By+JRJHNMwaoIdApxmOpFsgVByuR81WN9PTudn5hqfFQmSY43iRBbUsIqNIaMKZP0E9Fzxm6dVEkRUGwoifbJy9hWq9xaraRE3+E4BluHjakRpf9wKVwNoQ4LR4ZYmzYT7Gj+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=A+ak4nQV; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="A+ak4nQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=da
	yMhCsPsbw/CfnWPlNfiRbfApFHvA1ZYvqzVVCCO5A=; b=A+ak4nQVAzeef4CTfc
	kKQz/x/VQpjJhSffOG5WnCoF5poJCJNu7Btm1V/KcKM3y21fL6Pe6k15PohEj+wN
	KCD2e9LTzpfq+310yba5ScU0F6VaAfkWenNl7vzEmDBG4DY/wSE4hCfek4Qof7Ex
	+q1h5EEk7U+JO5egvq+XhWnX0=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXrzSSh6Jqjf+xAw--.37514S2;
	Thu, 10 Sep 2026 18:33:55 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered writes on large folios
Date: Thu, 10 Sep 2026 18:33:54 +0800
Message-ID: <20260910103354.2644407-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_x_v+roRVKdny2XP36h_zhs9Y=XEnPeZgM1URDfMMp7ZA@mail.gmail.com>
References: <CACOAw_x_v+roRVKdny2XP36h_zhs9Y=XEnPeZgM1URDfMMp7ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXrzSSh6Jqjf+xAw--.37514S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4rZFWfGw4fuw43Kr4xXrb_yoWkKwc_uw
	n09347Aw4Uur95Kw4UGanrZFZ0qw47AFy5XFWkKF4DJ3W3Z3s0ganayryv9w1xWw1kWr1Y
	gws5A34DJry7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRfMa3UUUUU==
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBRKGmqih5Ry3AAA3B

> ret = submit_bio_wait(bio);

I wish I could use submit_bio_wait() to implement this sync read function,
but I found the following two problems:

1. submit_bio_wait() -> bio_await() unconditionally overwrites
   bi_private/bi_end_io, so f2fs_read_end_io() never runs: all post-read
   handling (tracepoint, iostat, verity/decompress, ffs bookkeeping) plus
   the iostat ctx lifecycle is lost. (Even if we allocate the bio with
   f2fs_grab_read_bio().)

2. f2fs_submit_read_bio() calls blk_crypto_submit_bio(); on devices
   without inline crypto, its read semantics rely on
   blk_crypto_fallback_bio_prep() taking over exactly bi_private/bi_end_io
   and restoring them via a hooked decrypt completion. Those are the same
   two fields that submit_bio_wait() owns, so the two cannot coexist.

From my investigation, I found that if we insist on using submit_bio_wait()
while preserving all the original f2fs semantics, the implementation becomes
very complex. That is why I went with this hacky approach. If you have any
better ideas, please let me know.

See https://lore.kernel.org/linux-f2fs-devel/f1ad5d3d-f4c5-498f-8378-a5efff74a458@kernel.org/ for more information

