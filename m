Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290028;
	b=M7ajUeh8SBbW2n1kFjrHzcQuLG/6f0ReoRkXChUL9bI1gSn79lVaiUg/daverzleviTI
	 ndVjOjOV92rQ8U3EzvMI47Znyr+D8fCB5krd8HAUtHOu/tIWk8rWQKjB18Z7OqXq2SSK8
	 nLH7Cr4F3U4dzO+DWGZBv3RdWimVgofz+B1gq6qltHwSK5Crn/3yogqeQ2HeCXvGLxGye
	 blwr44DpsfI0qIbt6/uE00lIvfPfZ/6Opk8QzyffysJB8BGGcyX94oFHime1C/yykYWVP
	 Ew6q/Y4iRxPeAao77AqUZcTdS+shjzrzAgsLCTmgFxrRm4AvSWzvcviHd9//6TM+WcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290028;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k32ubl/2xC1TeEOsdmE9A8eWKaYVe5Y3iSeyYGqQUI4=;
	b=XfiT74WktlwNSrHXHBYxzepC9R6MWpwh2bvWImYemxyDK4drW+88gfXGlfNrJnDyfGc4
	 JruEeCSC3TcQmxcDbZF5iRHSvwc0ku9Bow9lOltuDvWYbXEv1T/2udsRBgnL5bLrKtuKA
	 iA9+c/Xx/eBEKCJ+/mPhpcYzZ/14BloU+czTj9KBTSxTJnnr5AxvX8NtuB6mV4ei2wGiQ
	 pjHMmzOPltPzCudpEJjIRHGgvmko6Yq49+z/AfFlPQ80OrQVnYA373uy9mhT8+e7VP/3D
	 YiqT3D3vtsiYrDUGEw6NCtxAvzsv1b+k4GMYKWqd6sa1aWsKD16W4mWbkuvqbi/D6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="S1V/IePN";
	arc=none smtp.remote-ip=95.215.58.70
Received: from mta1.migadu.com (out-70.mta1.migadu.com [95.215.58.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8C606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D8C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S1V/IePN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BlLqDq7pyCB3sE0VGnqVJVFi/gqZ51qn4nqEl6OMc/0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794290024; v=1; x=1794894824;
 b=S1V/IePN1X5+T+uljQBuDiSdzhPuCSFbcZpgYVfAnKLrWahijIothg+iFCmxjzD+5wacEO79
 vmJGgnCMdUtaEIed1ZYV2pRYCPkJ3jVtV+8rC9LB4aJCqNxYZyZFFiRvboTNWiEV95R+acJH4hv
 +syn1wkZ42cYhIbE4Ei85RQ0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3098e5835bb483a7;
	Tue, 10 Nov 2026 05:53:43 +0000
X-Mizu-Trace-ID: 3098e5835bb483a7
X-Migadu-Flow: FLOW_OUT
Message-ID: <b7d79e8a-55f1-4a6e-b9f0-1fee3598f1f4@linux.dev>
Date: Tue, 10 Nov 2026 13:53:33 +0800
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
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Lance Yang <lance.yang@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2026 2:31 AM, David Hildenbrand (Arm) wrote:
> MGLRU is currently the only MM component without a dedicated component
> maintainer. Fortunately, Kairui and Barry have been actively
> contributing to MGLRU and have volunteered to take on more responsibility
> by officially taking care of it.
> 
> Given that Kairui is already an established MM component maintainer in
> a related MM component (SWAP), add him as an MGLRU maintainer right away.
> 
> For Barry, the idea is to transition him towards a component maintainer
> role over the coming months, starting by moving him to the top of the
> reviewer list.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..e7ac319a570c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17635,10 +17635,10 @@ K:	(?i:vmemmap)
>   
>   MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
>   M:	Andrew Morton <akpm@linux-foundation.org>
> -R:	Kairui Song <kasong@tencent.com>
> +M:	Kairui Song <kasong@tencent.com>
> +R:	Barry Song <baohua@kernel.org>
>   R:	Qi Zheng <qi.zheng@linux.dev>
>   R:	Shakeel Butt <shakeel.butt@linux.dev>
> -R:	Barry Song <baohua@kernel.org>
>   R:	Axel Rasmussen <axelrasmussen@google.com>
>   R:	Yuanchu Xie <yuanchu@google.com>
>   R:	Wei Xu <weixugc@google.com>
> 

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

