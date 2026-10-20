Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480574;
	b=PeY01PtM4robBuRUHND13qjOE0WwyZvItWnXuc0LyiS4a4GIyS8jItlXj2YUNzWX9bih
	 AKZ8OSfhSQScWUtBCfRt3b712tEqosYsM8ejxWbzyEcrh80BfCKc+AsipcfoUPjgVvZmF
	 FxCNO6+gZwptJcl3tktcAoboxKU0Q0e4dA20tgIlodshTBs9AA8RCPUjQwIM98tbZbe17
	 vS+uorw29OhpEXZ20j9jpLr/7eRrTDof/LpsEZIdgx5nbgFToMhvHGP0lwlDgb+1y7EXw
	 pdmc3YsPQXVgg1wH+91ctxE0Cml3cEXFbTNiNDPi7LJm1fMdTX1WIs3KyxxRWtIy2lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480574;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AqgtHFw5MEgnIKqfkHc1RGsoxWJA/tEPR7ZLeAJ/8+8=;
	b=uAgmE3Wncl8kzPkZp/Idzf2+nqtLKvFQLXsRWdSwBk7sCvr1Cd9eOiam8HFf6sdUv6MT
	 bh1pCyVXcjEfs5kt7//cAqg1PHDFw0DAJse7HXCIreFKKLsx9U0V8bEm81VrP+Oxbg0i4
	 WD7x5IpeFrhPpVRbVEDWwwD4IUXJGqKcWJRjh1wQBQ1ErOXjwtFPmKU3U77P3A9urt0Wu
	 bs9yNYRCeqSHP7mnj7Nw+PCoq3BR0u8ThOeFkdIu/0/WfaAqNQVbIy+Et730fEdqtwpZv
	 lj/R9cl24Qyn5EdB9EdiaQDBmXXSAbemScj1XCHUtgPmsILvjK2251BQ9d4CZBWD8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LAqfIotp;
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BACE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LAqfIotp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792480571; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=AqgtHFw5MEgnIKqfkHc1RGsoxWJA/tEPR7ZLeAJ/8+8=;
	b=LAqfIotpDC0fTx90MfWsVFGypU1hCAGrmYA/BjPxf8Ucd9Zo835OAdaUOLv9af4EEYBwnDJEAW3srVccmQ9c2RVCKcWhJ8Tgq9yVgbVPTvHFpTM8wdy1Kgy2exaS4jvUnbw60ZbQxGyOoBx2801I6U7SF75n8wgHdWGw+4MUAfo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDC30jo_1792480560;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDC30jo_1792480560 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 15:16:09 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: ying.huang@linux.alibaba.com,
	kaitao.cheng@linux.dev
Cc: david@kernel.org,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned pages
Date: Tue, 20 Oct 2026 15:16:00 +0800
Message-ID: <20261020071600.3695395-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <877bjowf9i.fsf@DESKTOP-5N7EMDA>
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com> <20260928105805.1215770-2-xiangzao@linux.alibaba.com> <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org> <20260929034123.2705745-1-xiangzao@linux.alibaba.com> <331b4e40-8d0c-4333-b2b6-b81e4c4b2e17@linux.dev> <877bjowf9i.fsf@DESKTOP-5N7EMDA>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/11/26 21:14, Huang, Ying wrote:
> Is it good to implement the trick in copy_mc_user_highpage() and
> copy_mc_highpage() if the macro copy_mc_to_kernel is undefined?

Sounds good.  That also covers the non-migration callers of the
fallbacks (COW, khugepaged, KSM), and composes with a real copy_mc
implementation for actual MCEs.  I'll prepare it as a separate patch
with your Suggested-by, referenced from the v2 cover letter.

On 10/10/26 16:35, Kaitao Cheng wrote:
> Could we recheck PG_hwpoison on the source page after folio_mc_copy()
> completes, but before the mapping is transferred, and abort migration
> if the flag is set? This would prevent PG_hwpoison from being lost
> after migration.

Patch 2 already rechecks before the copy - your v2 check, moved a few
lines earlier.  What it doesn't cover is the copy window itself: the
debugfs corrupt-pfn injector has no GUP ordering and can set the flag
mid-copy.  Happy to carry the post-copy recheck in v2 as well.

-- 
Yuanhe
