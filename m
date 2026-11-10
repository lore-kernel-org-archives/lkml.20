Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277771;
	b=xm8lCyuJfcg1N+04VSNmaakZ7kMKc6VJfACV4BUlWU8f6WUkUk/c+ibfX9npKxttwbwO
	 iJWxY4Jn5oFjQErjIQ02CT0gX/A8xbDDzUpHA2zyp2Fkd392zsiZ8fLDTxp8Ws7XUpy1C
	 hFIVEiihpLyT7/gYxVnsdV6JVyv66bZNxSdQJcBBV4ck3gQFfVAx7NF7xXZ492BkM7CXO
	 eP1njghXD3Ae5oDSIhFwTtk0YCZIr9hG3GUVkXfadUEg5DE30iw/svlvuyWysbbKa3Pwx
	 YhgZp4zw7Kun4k20BJJR3kQ0o67zBJDzbAnI59y+gQhmDKq6UiZtDx28iBnhEdiKhGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277771;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HlBsGgt5fdLLxh9YoMRteCkZdpeZNQ5ocKkLttwq/cs=;
	b=bagApXm5hzDKGnvVuZOA4GCxsf6mX7Ozf838/z9y/T31AIop2U2ErdgwQ85yKs4aT83a
	 O6cxBfR/sCyuo6/NXAPPkrpgLZ+CF1dxNA9a1UMhI5iT/sGqHlaNLxTUuriXVp1FO9vFN
	 9ta5UwGhX+/3Nf2mnAo/I5JAGTq8oe5uEXjrpygHi9bQF7OoiH7erNg8lsuI3tbtHXcjY
	 IYbgD3IGIp1ySdcAzkQEqjdnSmr5HDSMdbsvdWnIdscOEYw7mS7BLGugiIr/lFpsQNQ+s
	 usliKLIvnEObm2cRH8mSDobJJlD58LfbS/wQfnX4tulGciR84HEE9ZzXHvT5PlX9/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MHi7lakr;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B83D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B83D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MHi7lakr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nJ1jpM7lqQ282X/00v7kNslXHVmvQXR6WNDc0r1eHOM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794277767; v=1; x=1794882567;
 b=MHi7lakrdBFbW0z4ZHt/a+z1o57vugjPvSGPMIUlI7HJGy5rqZo1+kOjkLByKq+jmJfoywDL
 Elmnz+9VkimY4PMFGuNZOyrMkHWuXHimn6V7ghaPJM3Gwgl6mcjyV08ABl4jyH+AnRe/904Z/KU
 2UtK4p+ZcZUoWMhxf9rzkjAU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 532814c464d3ffcb;
	Tue, 10 Nov 2026 02:29:27 +0000
X-Mizu-Trace-ID: 532814c464d3ffcb
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 10:29:22 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
Message-ID: <avKBgtWHe93uea_t@fedora>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
 <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>

On 11/09/26 at 07:31pm, David Hildenbrand (Arm) wrote:
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
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Well deserved, congrats to both.

Reviewed-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..e7ac319a570c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17635,10 +17635,10 @@ K:	(?i:vmemmap)
>  
>  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
>  M:	Andrew Morton <akpm@linux-foundation.org>
> -R:	Kairui Song <kasong@tencent.com>
> +M:	Kairui Song <kasong@tencent.com>
> +R:	Barry Song <baohua@kernel.org>
>  R:	Qi Zheng <qi.zheng@linux.dev>
>  R:	Shakeel Butt <shakeel.butt@linux.dev>
> -R:	Barry Song <baohua@kernel.org>
>  R:	Axel Rasmussen <axelrasmussen@google.com>
>  R:	Yuanchu Xie <yuanchu@google.com>
>  R:	Wei Xu <weixugc@google.com>
> 
> -- 
> 2.43.0
> 
