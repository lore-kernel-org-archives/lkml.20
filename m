Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982116;
	b=n4Q3mY4QazKoTvQtjd/vltMSb3G7eoIIzKeoM1G/VdQtnokI1DE66BjyCtFKhkPs7kpr
	 8j/iD48wP1Se7wHqtOh5Z36pztxC3cIm3Vh5QAVgWPxcRS6sb9GOQhhLmmMw7URt1MnB1
	 1fW6Ytjvxg9sAQBnSnvFXUrHzEYTH7TCT3qpuUX96YFQRtRc4yEvG99UGwXC5A1Tt2YIx
	 CRRVe/684TwthIM8WvTaOxa1rpPEh9xGTQbW5WRkIe1jdSxZYPUdm+7e1xkaZ1MibqjB6
	 DGLpXIpnscHGfw0AtOP8+5BUOhWVD8INLT5jW3cbkvVisDtext4lRcLHtxT7DxV0e/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982116;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mWS6nWjGDo/ShzQtH2Z3nfuPDKs+D8p78VoAXukz7ZE=;
	b=W7itgg0jneo+dCOTd30qHkITM1QX2Wckhd/lcMArC8tued8mfPHhl2CoeCOk5+g4MuuL
	 yMBZ6DWhJL6dsL6E4ERdaDPZDTdX/ZGghSCCKUNjZgUG584fxeLwfKQX+/i6Ks/lP/U9S
	 cBKhUj0F073xMH6Drn/hRnJZFHaY7fO2lQ74lhTB3hSoibnGgvu8g1ph9MurgtspeUCk+
	 bCTxtnvK/Fy1TjlMXiAVgAlGUDIU+DlyyhSpg0OMtwyszHtI6k2xH870iWniNXAmCIfp4
	 8PHNBeMnRnFfeWxnwX/Y8SNXvt6mp75tz1u2uQsewWzN+xo5/9IfdwCYsL21TrBIGWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=an6otOFp;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E1606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=an6otOFp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792982106; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=mWS6nWjGDo/ShzQtH2Z3nfuPDKs+D8p78VoAXukz7ZE=;
	b=an6otOFpm9bkyCRM83PToZx2trfSF+F6lQfrSsV0M41SNZIGpwfhmtbUykmkmmZZ6kpq9BEHASMCRJxqvOADpg/a7kjtVrYny0xjqhltbFKbVngV/zGNNsSCeoAJA1mTHsVLnCjmhDLH2HHtsvzTGuIDL0Z3vQmkjcZPdne/KnE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDRbIb._1792982104;
Received: from 30.74.144.181(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDRbIb._1792982104 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:35:04 +0800
Message-ID: <059bce48-c591-4bc7-9046-de03fb4df748@linux.alibaba.com>
Date: Mon, 26 Oct 2026 10:35:04 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] mm: multi-gen LRU: remove get_lruvec()
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
 akpm@linux-foundation.org, hannes@cmpxchg.org
Cc: david@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, ljs@kernel.org, kasong@tencent.com,
 baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, baoquan.he@linux.dev, yuzhao@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apais@microsoft.com,
 rlmenge@gmail.com, Hardik Garg <hargar@linux.microsoft.com>
References: <20261021235606.89545-1-sidchintamaneni@gmail.com>
 <20261021235606.89545-2-sidchintamaneni@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261021235606.89545-2-sidchintamaneni@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/26 7:56 AM, Siddharth Chintamaneni wrote:
> get_lruvec() was originally introduced in commit ec1c86b25f4b ("mm:
> multi-gen LRU: groundwork") to guard against NULL NODE_DATA(nid) on
> uninitialized NUMA nodes (`return pgdat ? &pgdat->__lruvec : NULL;`).
> After commit 09f49dca570a ("mm: handle uninitialized numa nodes
> gracefully") and commit 931b6a8b36a2 ("mm: multi-gen LRU: remove NULL
> checks on NODE_DATA()"), that NULL check was removed, leaving
> get_lruvec() as a thin wrapper around mem_cgroup_lruvec().
> 
> Remove get_lruvec() and call mem_cgroup_lruvec() directly at all call
> sites.
> 
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
