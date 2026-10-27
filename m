Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103667;
	b=MIe//8jYvjcc0X6Uv0VZBNztEfw1yq2124N+9uBeFbZBFjmvvq91UbSgvYTyJWWLXmce
	 vET+Cy+GkaGDM44DkGV0EOrs3mMKx74W35f3JnexIARFE5F6FBCLh0zAJRspwvQbhlPYn
	 PN5ZV+mJtjd9mtg+S45GB8AI3nDqbU1ZWgbFAwzfY99THIMQEJChlKde5wfn/pq1Wn5zz
	 W5goau2DURDE7+5uvXluoe5Gb4MomEHDbdbbUd6YPf1xWfM355468RzxGsXTNNEuv9dRb
	 VhzX6jf8o5ro06sUVN2wqi4qkYMlnh6ufj2T57ql1kdZTosDxRHwcKuy2deuYxhzsGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103667;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fpqousJYIlQZ4Y3NCFJMRs4UmIAmFoTsGgfAJYD4+7Y=;
	b=LoLR9DzZNHiU5326P2TIhPiyRf2GnG/Uefcpg8XXfRIhJewapZcvY3ZRTLFfJiX2Aij2
	 9DqJZCB9M2jNjlyQw+WQm1TjdDN3pBDpjag3Wbit3pUkG/ue9P8blQGeMJqkXIXdzSPFY
	 V0ttN34E77q+i9jzMxYJ7kKCTMF6vCG0G8ewWtqBpAPrnB+rjCnA2oRLiA/VfeLWfZ66d
	 581QBadRW1fNadztCsndz+t5nxb+pPLEj65WX+5M9EdhTSZUxbl7O01TsV6xUmONzzJXP
	 qA4DzyMqrm20/pDd/ma1z+x9onVzgBWg6kegd5E3lgoKJjtrBuBMjnK7D90ceHU4Sgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74192606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74192606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793103663; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fpqousJYIlQZ4Y3NCFJMRs4UmIAmFoTsGgfAJYD4+7Y=;
	b=DQhjO5SrN/mEKiK43o+b173HaGW7RC2cfhyryD4U99KMAgD1Q6uwbzirqTPaQ6Ygy99puyjLUPbw26LIHl5zoZWqcB2BU91CkV6Le64soUbLJqMmtecefu5z3yvV/iw+xDnf1PJzYDHqrkqe2d3Li/Hcgs9mesR7CWZ5MtcuPgY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XDdtXlO_1793103651;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XDdtXlO_1793103651 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 20:21:01 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: "Garg, Shivank" <shivankg@amd.com>
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
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
Date: Tue, 27 Oct 2026 20:20:51 +0800
Message-ID: <20261027122051.1234963-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <d1de051d8c3150df7dd0b963a51176e5221a2006.camel@amd.com>
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com> <d1de051d8c3150df7dd0b963a51176e5221a2006.camel@amd.com>
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

On 10/26/26 12:10, Garg, Shivank wrote:
> Should we use is_page_hwpoison() instead? It looks simpler and more
> reliable.

Agreed.  The next version checks is_page_hwpoison(from) before
and after the copy, so the race is refused at the first check and a
flag landing during the copy at the second.

-- 
Yuanhe
