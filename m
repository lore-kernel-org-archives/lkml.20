Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190139;
	b=0mroWjGCeebQjWYSBFuzAzfnFbd4qJLvxefaHC1TgvJl1ahG7FRujkeDYSKraj3FB7IH
	 Vs/00+4cG0ZMPRgaQqAZ5QHEVXUt03lzUucK+wKYLzOdQ/N/AywA66WbHcf8t11CegWCt
	 /NnJwvNsAd334EKNR9wul1In2Il5t3+TLQM8xqODwx7PPuKmsM4NJUpAx74mXor5Ngy/R
	 QW+RIVPaYY9fL3wpqmGlBjeWumkofz9exbx/3nAdbXouOc4xRo9LZHZXm1Mza2T3+hEmg
	 casGyUjhYMFNpIGvSnxquCzPWzPDC1OPauiaF9Cv6nS5Am8OooZE+PkmSrqB9wH9L7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190139;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W8G8RmtjEXPIN0vCT7dpFz9ADq2mZ2AcFkZ2Qb2//wo=;
	b=RWxgTLgNU9N/MnG8XI/gKVFqosSa/AA2Kygcew0IvSTIRmZ88smw2QNG1GlLSNF8qtgi
	 mMyDePlp4u55esyUot1RDDkTZShrYyFedN6+prgxjr98elsPxHl4CTRby10l07F1SBA2v
	 EcO/smm1UOqABsh3F2Nb5KhTh2NCA9gq4oz2hhr7TIvCNt4sMkhrH2UzMn4iJEs6j/jvB
	 wH2oWTjT+H+3JGvQu+t76B4UYrmyYI6Ja8rrsJx1kKhDytK8TCnbnRUFNgC+tfWER3+7J
	 pG4l9eToz+OFRUy5iBt3VjmDzAWH9sZORfxi0Nn5Qwr6CURr66Ugg90g255DqpyUATw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Kr87uQMm;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC5606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBC5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Kr87uQMm
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793190134; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=W8G8RmtjEXPIN0vCT7dpFz9ADq2mZ2AcFkZ2Qb2//wo=;
	b=Kr87uQMmsnzoKS3R/7UrSWWywE8oF/JFTa+c7EgeGcdX/achz0uMIMwKVkBWc/X9laraGphE1rzedlQJ8UoOK3qmUKDLD/CZq6BygwdC9E3/axgWpHKV5cG5Ju+2i8YnDn2N+WvIrCI/MFJ/PIIJ9y5KagUPwtWTx265Xu/JAPI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XDgoACg_1793190125;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDgoACg_1793190125 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 20:22:12 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	"Kaitao Cheng" <kaitao.cheng@linux.dev>,
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
Subject: Re: [PATCH v2 0/2] mm: don't migrate folios containing hwpoisoned pages
Date: Wed, 28 Oct 2026 20:22:05 +0800
Message-ID: <20261028122205.3914169-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <c8468755-4f75-4502-8d41-5cb9245a356a@kernel.org>
References: <20261026025552.1427901-1-xiangzao@linux.alibaba.com> <18602383-2326-4e54-8dec-bb695ae8878e@kernel.org> <20261027120854.1213156-1-xiangzao@linux.alibaba.com> <c8468755-4f75-4502-8d41-5cb9245a356a@kernel.org>
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

On 10/28/26 09:02, David Hildenbrand wrote:
> Why is that a problem?
>
> Why do you care?

The flagged state is not debug-only.  A real error on an isolated
folio leaves PG_hwpoison set.  The data is still readable.  A THP
that cannot split is left on the LRU flagged, by design.  A copy
then propagates the poison silently: no marker, no hwpoison PTE,
no SIGBUS.

Thinking about it again, the copy layer is indeed the better
place.  So how about this: drop patch 2, and put the flag check in
the copy implementations instead.  The fallback patch already checks
is_page_hwpoison() before and after the copy on the !copy_mc archs.
The same checks in the copy_mc implementations would cover x86_64
and PPC64.  folio_mc_copy() then propagates the refusal to the
migration core.  Patch 1, the compaction skip, stands alone.  Does
that work for you?

-- 
Yuanhe
