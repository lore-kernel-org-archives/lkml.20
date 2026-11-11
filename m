Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395462;
	b=2E4IgpyLIURUjrG63HjuB0zqbFnAXl7yxKI0evaHFC8BsXV1N1xAPJ2uCFgL6oSrQev7
	 JrF7cXI/EIKh3oC1YBGpqiZfuk/vOiDSnwYRNS6rQaYXy1hB82jRZz1BV0GKn5cN/X5ym
	 ejlX79Kuk1bK8BOrrqGUmpPrdAypeUrLkgdZi1+7z95zNgNt9GLrrlmwnL0BLEtg81QOd
	 Gi64GghB8AXMjDLSe77j49FN07Kb63EQ0rva8yHrzIc+i3QTM7otPBatsnrkTYANSXxsF
	 B/du5QmFnGnkvXu1anoyZtg7K93rKKhkCHVeHTeNU21FsMjA5bHqXA55UfNXAvW1NpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395462;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=41dldmnzUpbVdvTasv/OLzoqF6WSHnIdkg3e9karzSg=;
	b=RduD2pTvXpOTtrvsl6Z3XxBVaypT2pk3kZTn4uXLdD2X7tzRJCWfglQeejDoF+AnzCH5
	 gspOuryiXtlsHtx++G4G4Lq9T3U70cEaStJgi6NcVjHGNe02SfqqseOBXWAqwN+ZKueAA
	 AtXV6Ou2PLpHTZQMR+ZO3cmieARVtwJC/VCqWDzqeARlGqaVql0uWY6Z+VHgY2aEAZA8p
	 BM+IUlhY8dGI93Z7w/Ux4YBuMnbzE5VSmuXhAGc9ZMLFlbcfFS5W0PIcQIO4CQ8+sziMq
	 wLvLVpPA+6Ne5HZo8p6vfC+UTtApCrb1QWQq9O1YkocwrGVXFV8humDKhIEBRsOVchg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xZOfzZ+r;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1869C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1869C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xZOfzZ+r
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794395453; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=41dldmnzUpbVdvTasv/OLzoqF6WSHnIdkg3e9karzSg=;
	b=xZOfzZ+r+sCgyLorDtVHk+jeyh3Wq5Tlz1F1NkGeaVCo6Cz8c8aJtYKTmZ0oVubeat46Bzlrhal3eOLgoFDWteZ8JtqBWWMfrsyV/pexGAll+G5uV+4O1+x9keEOYyvgqIdOWqElrwLKdk0meJz2AuX4e3qI4lE0pcIEq/OdxCM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XEYmuI._1794395440;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XEYmuI._1794395440 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 19:10:51 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: wangkefeng.wang@huawei.com
Cc: david@kernel.org,
	xiangzao@linux.alibaba.com,
	akpm@linux-foundation.org,
	ying.huang@linux.alibaba.com,
	kaitao.cheng@linux.dev,
	shivankg@amd.com,
	vbabka@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	ziy@nvidia.com,
	tujinjiang@huawei.com,
	mgorman@techsingularity.net,
	chengkaitao@kylinos.cn,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	tianruidong@linux.alibaba.com,
	tongtiangen@huawei.com,
	xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
Date: Wed, 11 Nov 2026 19:10:33 +0800
Message-ID: <20261111111033.627610-1-tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <64df30e9-4297-4e37-9e9c-2760d68af24f@huawei.com>
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com> <16cf88a0-6652-4276-95fb-12306e417701@kernel.org> <64df30e9-4297-4e37-9e9c-2760d68af24f@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kefeng, David, Catalin, Tiangen, and Ying,

Thank you for raising this and for the continued work and review
on arm64 COPY_MC support.

I would like to provide an update on our side. Ruidong has left
Alibaba and is no longer focusing on kernel development. I will
be taking over the development and upstreaming of the arm64
ARCH_HAS_COPY_MC series, building on Tiangen's and Ruidong's work.

This work is already underway. I will follow up on the feedback
from previous revisions and plan to submit an updated series
in the near future.

I have also added my colleagues Shuai Xue and Baolin Wang to Cc.
Please keep me copied on further discussions of this series.
Any additional guidance on outstanding issues or priorities for
the next revision would be appreciated.

Best regards,
Weilin
