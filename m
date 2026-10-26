Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792981896;
	b=BsVXL3VufiOleVRx35uh2xARQztgf7WZDCd6EEWXNs87/+8vSOyt3WoKrGEP4byHF6e7
	 PKNMYMKTc89bwjwcJf3WoitdTEA4WH2PXvj3rVcWX9kQK+nrSumdLvfXS/aSTtBPIoX4i
	 ym4aeuuPsunBnNATt5o/0JRTxfLWYQ4UHj5X+xpt0Kv1qvO+E0OS6uQSWxAvTtlWh9JBO
	 nRwzMJbQg+Nm6AET9YcMDVh+pCkBJCsp1C+9fCeotzc2GKkMSd/0EIjr/IKyXP2nAhT91
	 iDYNaBJY9FyJUhp1qviSxuhdqnQYXQdw2SEDEvE5veILqHOyaMngUEExO1CxUDhRQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792981896;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6tmUp/po8zp9IZH++SfJkmavFuUWmlL5Zk5aLDt/8oo=;
	b=eMPza4s9/B8LghjMDGwvsr9yHqL5Uem9UVjPyJsjDyDVWmBBfmlsASaO+w07ufpzLqIY
	 a0069ic+dVMvCN/FLmOReKMcW1uQVcvPldpEXJVpv6y3verap3EBodsx+gpC0sjWiyyaW
	 mWVZxm5GG+wTWW0EEJtj2h9kbbfFciQMCsFkqNeNhCn0ZodEldx9YnRt/uvt7HBoCLnQO
	 sjz8rQUhycv+PiLkzYxGkbz2wouNU9j8a7sDZ6swNpeOkO3dShRYHJXFsKWdcI2cobrGi
	 AJXjwYpElRHf2pd9oWxDzdG/eiN57BJWJNeFvhMgdNqlPNwceqcT28i3jJTfMnCU0Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hi3UcjBB;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003F5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 003F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=hi3UcjBB
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792981887; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6tmUp/po8zp9IZH++SfJkmavFuUWmlL5Zk5aLDt/8oo=;
	b=hi3UcjBBcB2NuGlr4G8vf8xsAXU5ZPHQPy1/aGwYRlk69M4AsVTAscov4L8rPUdr0pThsPzILzgskN3Dapi1O4Q5BdwhOTNadDRXIf7+WwGMNhSlqsoA/2t2tDMH+aa3YBG90749VCKFeMuP0RAcj6NDPNcwg8eQkiI9IxR+gKU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDRaBA4_1792981884;
Received: from 30.74.144.181(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDRaBA4_1792981884 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:31:25 +0800
Message-ID: <39026bf7-83b6-4b8c-9d82-2a647fb9711a@linux.alibaba.com>
Date: Mon, 26 Oct 2026 10:31:24 +0800
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
Subject: Re: [PATCH v1 1/2] mm: multi-gen LRU: use mem_cgroup_lruvec() in
 get_lruvec()
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
 akpm@linux-foundation.org, hannes@cmpxchg.org
Cc: david@kernel.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, ljs@kernel.org, kasong@tencent.com,
 baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, baoquan.he@linux.dev, yuzhao@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apais@microsoft.com,
 rlmenge@gmail.com, Hardik Garg <hargar@linux.microsoft.com>
References: <20261021235606.89545-1-sidchintamaneni@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261021235606.89545-1-sidchintamaneni@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/26 7:56 AM, Siddharth Chintamaneni wrote:
> Andrew Morton noted that get_lruvec() has the same pattern as
> lru_gen_shrink_node(): when memcg is disabled on the command line
> (cgroup_disable=memory), it returns &pgdat->__lruvec directly instead of
> going through mem_cgroup_lruvec(), which initializes lruvec->pgdat.
> 
> In practice all callers of get_lruvec() run after kswapd_init() has
> already initialized pgdat->__lruvec.pgdat on every N_MEMORY node, so
> this is not a runtime bug. Have get_lruvec() delegate to
> mem_cgroup_lruvec() directly.
> 
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
