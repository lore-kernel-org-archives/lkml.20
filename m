Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D3C381EBD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131011; cv=none; b=cah10XPWcmZmFnq9FsfZ5uZViRhwfc2FaB+Gf1w8dVhx2B4SiCXU3MY8NMuWJzf+LXzYMEOkHt13kDdZafUQvRlPeU7bRd2SMmJ1YIZO49ROQgDiWPRwM4VjGugumqX9gPD51qUHQS+tyvAhH5YFX7Z90Y173OgpK5CxS+WKtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131011; c=relaxed/simple;
	bh=V/LqDSBn8GIWkoXzrT9eq3pC+rUYulgGMJT7iCkPylY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4rksGnnzcKprnkZHGgLOo1u6oUQWoDThbnVadcNlMtkK3BDqYJxtJj5KVDto9fFU0jVrpNmfk838KEshCrLaVQuPvLKDpeGAIv3sY9lgwNvx2DIpMFOhkz4K0J5IUA9UlgWdADSQqfcKPRqFN8SeGDojf58Rm2moh5vhIOants=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=T6RENoVu; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="T6RENoVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Wq
	6rDKDipwApsiUMergEejrorDpbyIXxDoYQljk9aaE=; b=T6RENoVuOCPYB/Z7Gg
	rxywQK733nfT3zivSDlNZiodCGLV8JnudEuZbbavHY2JyvmIzzKdYTNFyS2Zpjsw
	yAR/O/pzWJ905lRP3GbOy80paVVQ7jAI0NGCbs3Q912iSWg4E0YdujPo7PYcY0Dk
	WpwToSKWkf6ZOp50+1fjr9gBU=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXH+8UO7NqDuI4AA--.29453S2;
	Wed, 23 Sep 2026 10:36:05 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 08/14] f2fs: optimize small block size large folio read
Date: Wed, 23 Sep 2026 10:36:01 +0800
Message-ID: <20260923023601.2191075-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_z47SS7OKs_wU=-eiPLTMqF=7w6cekiLFK4ePVAhC8YNg@mail.gmail.com>
References: <CACOAw_z47SS7OKs_wU=-eiPLTMqF=7w6cekiLFK4ePVAhC8YNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXH+8UO7NqDuI4AA--.29453S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw17AFyDXFWkAry5Zw1kXwb_yoWfJwcEyr
	nIvw1DAw1xtr4akF4DWa15ZrsxtF4UuryIk3y8Jry3Za4FvFZ5uF1rtrySyr4xJa1UJF4Y
	qFsYq34IyrWj9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRfMa3UUUUU==
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBohVbK2qzOxVUaQAA3N

On Tue, 15 Sep 2026 21:33:15 -0700, Daeho Jeong wrote:
> 1. read_blocks_pending underflow: If a folio already has ffs attached
> (from previous writes/holes/reads), whole_folio_in_bio skips
> incrementing read_blocks_pending. When the BIO completes,
> f2fs_finish_read_bio() still decrements it, underflowing the counter.
> 2. BIO split risk: If a large folio BIO gets split by the block/crypto
> layer, f2fs_finish_read_bio() would call folio_end_read() prematurely
> on the first completing piece.

Hi Daeho,

Thanks for pointing this out.

It seems I need to drop the whole_folio_in_bio change in the next version.
(BIO splitting at the block layer can only be solved by read_pages_pending.)

I understand that in that case I'd better re-measure the I/O performance of
the whole patch series for the next version?

Thanks!
-- 
Nanzhe Zhao

