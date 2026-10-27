Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103211;
	b=GxN+lX9lu9aZhi42WPqozKS1GXeApm6EXVq0lzBieSehWwRKAwbq/T1DUyZZWm40Mks3
	 0YuOzTpD63SDG35HHCHFmjf6Z9mXm5STROcHjirDCtBWJC6Q/1ZbfXzZXfHppl88dGoYZ
	 mlUfXFVWtcINI3YtvkzkixZlAsURhidrNYdfzsDxuxjsWsb08VlpOymXQCfXCnaiHTpdW
	 0I17QjdEZ77dCbyM1fpT7QWvzWAQoYrMm1kM4WSur+MsZ+D0Ml9uowhi5c5vy7qmg8ot/
	 qg/Y/55bq0qHkQcdPXYoBIxrLJgvDMUqxJ/ohcXleSE26SDUnruKO8RZz/EzTUh11Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103211;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mlGykhvYvV4AMDSttZyw/gEEK1mkWyFBP60xF4DLDos=;
	b=BdPjSSos6d0VrmFAla8cNatD7Hb7SUudTohjIupkPTpkD5M5B+ZCR2c/Y/n2GoDfZ/I0
	 1t4SEbfMFe9Ja4eznEHNKH/0xG+9Z7T1I5xeyu8K93BWJEwLQHGVXR5AaIQr8PH4mcSw1
	 7M/47tLyyqYV3ea6nkUMxI2UAlQTOrF+4DzKpviGyvJGQPNWTS2yV1a8v+pStx411NW60
	 sLIdwPPnNOla/CIbqaH0ZDRyT6Qaa8FPePumd6G31bnZhGIQW+CNRsuWB8Rrpwy8G/FQ7
	 p9dCFhlfFIL3OrtNWiW3cbniY4bXvWyOF+MvN4n0Zu8lmG9b1GUR5qiionWe4a9RAtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LHLnAybI;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152060A3802
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6152060A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=LHLnAybI
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793103206; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=mlGykhvYvV4AMDSttZyw/gEEK1mkWyFBP60xF4DLDos=;
	b=LHLnAybIcdwvORPLM24HB0yzrwdn++YBoleLM33ot1+VH5eYDbTL3AvJLIE8x6AtbEYnr0Ob8R9dIJ88C5VrT5CtwW3fycAqLlpeBWfjthoTvtHzQVflFrXN2+pitNeOM3khHhp6x8PuDmH60ItW5XAUgklNtndgc1tsTLqZzvI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDdofvE_1793103195;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDdofvE_1793103195 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 20:13:24 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	"Kaitao Cheng" <kaitao.cheng@linux.dev>,
	vbabka@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
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
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
Date: Tue, 27 Oct 2026 20:13:14 +0800
Message-ID: <20261027121314.1221539-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <f28b2414-ff07-427c-8e18-e950b492b351@kernel.org>
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com> <f28b2414-ff07-427c-8e18-e950b492b351@kernel.org>
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

On 10/26/26 09:55, David Hildenbrand wrote:
> As I said in the other thread, how is copying data that was already
> poisoned (and might trigger another MCE) reasonable?
>
> (although I do wonder about memory barriers ... hmmm)

Agreed, the next version will shorten it.

On the copy itself: you are right, it is not reasonable.  Huang Ying
suggests the same in his reply - the next version checks before the
copy as well, so data the flag already condemns is not read at all.
The check after the copy stays for the flag that lands while the copy
runs: the data has been read already, the destination folio carries
no marker, and the callers discard it on refusal.

On the memory barriers: PG_hwpoison is set atomically and not
cleared while the page is alive.  An unsynchronized check can only
miss a concurrently set flag.  That is the residual window.  And a
check that sees the flag set is never wrong.

-- 
Yuanhe
