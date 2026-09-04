Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFCD509F02
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551053; cv=none; b=TiPrcRHTMj1z26o5lH9aoo2x9Goby9ImTfFx0/Haq6uYbCHEakc7Km9EyaE2e9OfMNHSI+erQPLGVTbT7emXedMnG+UhacN+W4u9ysDq20cv0sQY8bPZxo/YyrlqAD3AU9GovPYikZTk2ouKfFAD7xi/799alHAuyCLpuf2+xVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551053; c=relaxed/simple;
	bh=/bTzgWMEy9BDvp6IwS6vIzYT5e916ZycKbA3gsTQSN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBNyp9shJvrTE8RJpou2FVcnI2SDfCvGsia6sbuYmsaxI2AGV26wwuclnAI61d5P2cBPt3sR9ySzX1ivrahR4mFoA7zdKksWfhLDpKXOqnL0BkdrbJrpgBPaKEcmDomCaLwCPrLcGa3X1Rr0O5PNA8RtK75UbQIpKFf7HQPmH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=JSL+okaC; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="JSL+okaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788551019;
	bh=vdqcgDWDRYb5T8iNF+ov3y6T/OLrNQ3mp3fJFvYbja8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JSL+okaCL39JVbb+lH+FIuyWxuMQm8tw029018ANVEifP0HCiKvTwxdchJd7dNBT8
	 ciwuW/HHtH4C4EFGtR7BmwZc4MlRE6vjwhpl79vU+npNhtRaXcRQSvYxr4bOxahnKt
	 K9qc/tdvJEW10BuG4+uSC785bQ51Ztn5E/Qh6Dns=
X-QQ-mid: zesmtpgz5t1788551001tce9aa63b
X-QQ-Originating-IP: SC4xcQ2AUZyWLQjL7sMo/Lm5tVZSsV3X7Qmh2D24Kws=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 05 Sep 2026 03:43:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 861377282768174038
EX-QQ-RecipientCnt: 15
From: Wentao Guan <guanwentao@uniontech.com>
To: qinyuntan@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	david@fromorbit.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mkoutny@suse.com,
	muchun.song@linux.dev,
	qi.zheng@linux.dev,
	roman.gushchin@linux.dev,
	xlpang@linux.alibaba.com,
	Wentao Guan <guanwentao@uniontech.com>
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from non-memcg-aware shrinkers
Date: Sat,  5 Sep 2026 03:43:15 +0800
Message-Id: <20260904194315.9954-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nt9NcOjqvGa9L9O8wL7bW5Xnc9CMSt+RMQzdo8KXn1gMoX1RKB9IIPax
	ovnCH7++5PqfFFvSe5KUNCgcTGmCZIUaZWsU28GlMiCc/QSE1Nh8JtQu5vNK/MDqHG6kWBo
	hxue068J1lNvN7eGsAkyPZ2PzloTfoOkPX3rE06hT0OnGNqmrh4Pr2u+XPVDBheGpu+tjav
	UZOcLPcpo8dejAGL+DsjaQSrufOX3GW0hGqE3t4qK9MUjuPdBD1M6egbXlTGAENdC2O2O0d
	TE4hNFN1YGnCnoZbocW/hae/FliNNxdWiJxFMHZ27GwVMAa+g2Cq0Wb/Qygw5E5y2o0irRi
	ojwxTKcZYyqAAIedP5LaTHHYs6eEm/WliaboG7A6qC+wLVZ/WObb7292bm3jfcYoQahlfuQ
	oElvI+dDVEcdTSrUFaE14syfDt+NFXRt1peO6guaqIH1brV1udnk88H1U3XsH4BvYEO8av9
	83tDl4HdPX9mhvdrKrQmemigYyDtIBbUFYYb7QkjMWGG+gNYRA55vdyygmxtMHhneJZEZWk
	SZo+oXc0W6PIr8WGTE3xqo4LJRiKdwt2Pq2hSImakzrP5ltOZsGzZdIuiXvGKk/ROK/MNiu
	EvtgwzOq6d6DCIftM5WXTlygza2GpykaaU/mQ1GnmPLOAHLX4Z78YL5U4d41e7Nfd8zfNhG
	mdL6oVhyqo63rngkpXhm2xjqjAcXkb0XrvhqtLjQBMTpWNQpWHYNcoiKgpnx45MKZlUFUjy
	SfDyu/jRoQ9w+CpW+75dV6F4C/e3aWaF7CR1gJgKnCHIsA+HI1fhbc1CS9q0RYCumIYj/j4
	bwyPxgAZrLbNJSEXoEXDTtzdORKLoSayzWhQmIQwY0yAL2PyI+QZq84Tl+3ktvyIb8RpyrP
	sDGtgXWH/HuIpSXNKvw451flXzPmI7LxyWcRA+/S8smkEmAW65imN2Hh2T3wn1ep6GDoiJE
	1EnFNz5N6qgvAXkLf0wE/fsIhucH55ObOmg/KxgsPdyoN564Pjge0YwsVU+jytdbm6RJqeH
	gmMaSS0D9SWdlW1CT0w3WVoch2Wy1Rbp9wttGCJg4E3yJtw3u9/AQ+WWe9Au9Tzh7zfcE1H
	UeKgVCU4g5Jz93RLQw1r1xI2/EAkXg/oQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

> On Sep 1, 2026, at 19:51, Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:
>
> With cgroup.memory=nokmem, shrinker_memcg_alloc() fails with -ENOSYS
> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
> back to a non-memcg-aware shrinker.  On this fallback path,
> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
> valid id belonging to whichever memcg-aware shrinker registers first.
>
> __list_lru_init() copies shrinker->id unconditionally, so every
> list_lru backed by such a fallback shrinker (thp-deferred_split,
> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
> up with lru->shrinker_id == 0 instead of -1.
>
> Under nokmem the list_lru collapses to the shared per-node lists, but
> __list_lru_add() still calls set_shrinker_bit() against the memcg of
> the added object.  Most list_lru users are unaffected because their
> objects resolve to a NULL memcg without kmem accounting, but the THP
> deferred split queue holds user folios, which are charged regardless
> of nokmem.  Since no memcg-aware shrinker can register under nokmem,
> shrinker_nr_max stays 0 and every memcg's shrinker_info has
> map_nr_max == 0, so the first folio added by khugepaged triggers on
> every boot:
>
>  WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
>
> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
> and expand the maps, there is no warning; instead bit 0 is set
> spuriously for an unrelated shrinker.
>
> shrinker->id is only meaningful while SHRINKER_MEMCG_AWARE is set,
> and all readers inside mm/shrinker.c already check the flag before
> using the id.  Make __list_lru_init() do the same and fall back to -1,
> so set_shrinker_bit() is never reached with a bogus id.  The stale
> shrinker->id itself is left as is; cleaning that up is a separate
> topic.
>
> Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>

Tested-by: Wentao Guan <guanwentao@uniontech.com>

The patch solved my problem in link:
https://lore.kernel.org/linux-mm/20260904190028.21542-1-guanwentao@uniontech.com/

Thanks
Wentao Guan
