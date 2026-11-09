Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241323;
	b=2pPIpsEg84ZAidIlQHU3F1hVJqaIFlEBS8kWZCkXI7eIhlJXkqcyZCwg5zDyFVrsjbOi
	 lBbhoZAFTDjVXPqLtc+y6c2+3faZb4aW+bAVPCg6x4qc0BO/6IWG48AdjP9oHcA4jqHm+
	 E9kNJJgI34qflwl8IhgVqAPmq+VecXhtlOew9WtaA55Z6kSuNiNJUImI/0QS4eu8NAcjP
	 pINHX9KrEKdlKf5HFrcq2pwZqipRa9+oJChhW/qHfhc8TKnbn3qfI8IT6I9dOfk4k0V/D
	 1iEgTtbfy+H/Oe1OapXOKzP0FdS37scfMucuvb3s3cvlDsIX/95l4MrsUqnsKVd4SjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241323;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=vlZurDDigGHjYkkA/PXHS60MT5TGboV/T4DV42PDNWY=;
	b=e6j8uufMUZSC9yuUrA01stQE2fiusmjsu1K5D1niU41W7uBaEaM+vf+DAnzR5KOBccGD
	 /BbQNAaAEXPnVl3VmbYgQrf2+PluhjPX9QhWM/F7uyoEylmpX+YJUC/mEWTXmDS/qP20D
	 BnknuOJg1BmDVr2bYguvlLfIYPqEBiDAZfDq9obLlQKW5nR7eWwILbz32g4Rn+iox5KUy
	 gGRyW6VlrTJrcE9U4pIXTpjihNGpmcBm8V9dSm75NOREoko/LgdArVhLLZfVk9f2epqyN
	 1aWSETvP8q9HZ1t5MPcvj+lzHEx6CRrzA4hL5Q/usOMtmFXvmvFBWvMZaXxeWDLHX3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A04B606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A04B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jNZmR4N3QzB98Xp;
	Tue, 10 Nov 2026 00:21:43 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jNZmP54n0zB98Xp;
	Tue, 10 Nov 2026 00:21:41 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id C5AEC30A6439;
	Tue, 10 Nov 2026 00:20:57 +0800 (CST)
Received: from ws.local (172.25.64.90) by cncheex04.Hygon.cn (172.23.18.114)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 10 Nov
 2026 00:21:42 +0800
From: Zhiteng Qiu <qiuzhiteng@hygon.cn>
To: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Ying Huang
	<ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul
 Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Alistair Popple
	<apopple@nvidia.com>, Xin Hao <xhao@linux.alibaba.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Yuan Zhong <zhongyuan@hygon.cn>, Shifei Ge
	<geshifei@hygon.cn>, Jianyong Wu <wujianyong@hygon.cn>, Shijie Huang
	<huangsj@hygon.cn>, Yibin Liu <liuyibin@hygon.cn>, Fengyu Wang
	<wangfengyu@hygon.cn>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
Date: Tue, 10 Nov 2026 00:18:16 +0800
Message-ID: <20261110001816.2186986-1-qiuzhiteng@hygon.cn>
In-Reply-To: <ef12d685-d111-4a6f-b72a-77bbd1369548@kernel.org>
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
 <20261107143456.1590658-1-qiuzhiteng@hygon.cn>
 <20261109122915.2150586-1-qiuzhiteng@hygon.cn>
 <ef12d685-d111-4a6f-b72a-77bbd1369548@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

On 11/9/26 14:07, David Hildenbrand (Arm) wrote:
> For the future, please don't send new revisions in reply to old revisions.

Sorry about that. I'll send the next revision as a new thread.

> Is there no way to avoid that boolean?

[...]

> This is all information the caller could provide, and the caller could just
> provide the TTU flag then instead of passing a new "bool".
>
> Also, likely this check can be put into a separate helper function.

Agreed. I'll move the decision into a helper called from
migrate_pages_batch() and pass the resulting flags to
migrate_folio_unmap().

> I am not quite happy about the folio_mapcount() check, though: as soon as we
> optimize try_to_unmap() to batch better for large folios, it would be just plain
> wrong.

That makes sense. A large folio's mapcount alone would not tell us
how many separate flushes are needed once its PTEs can be handled
in a batch.

Would it make sense to restrict the optimization to a single,
singly mapped small folio and keep batching for all large folios,
as in the scope of v2? The changelog performance numbers were
measured with the v2 check. Or do you have a different direction
in mind?

Moving the check to the caller would read the mapcount before
locking the folio. My understanding is that a concurrent change
could only affect which flush path is chosen, and both paths are
correct. Please let me know if I'm missing a concurrency concern.

Ying, since you suggested using folio_mapcount(), would you be
comfortable with limiting the optimization to small folios?

Zi, limiting it to small folios would also bring back
folio_maybe_mapped_shared(), as you suggested on v2, and I'll
shorten the comment there too. Sorry for not answering your review
of v2 before sending v3.

Thanks,
Zhiteng

