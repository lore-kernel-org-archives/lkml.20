Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304397;
	b=3+nOz14zOEITTY/0b3FtBNQkuiAJ0wJmKps7xfaMP0imr27XuYZHeEeMmw+zSNUcWnuC
	 zwVPOTkDUigp8G4WV9vtqRPLZCZBvv9JFGbFM9bP90gOrY3kB7bGeM0ijJejiCbvnoL7v
	 VAYdenFnXwkIdrBoqZE2+rt92SWzQWcJWNW0W/mJqvNMhF3MAW0yGqPKi8Tw+9fBAd585
	 byiQnzeoEThSadLArFqHXyPZSkiHMTv8sBghB7WVLFuZAJnrPIUSNdwV8gFlnjX9s5+OB
	 oAzl0FporSVtfy0V4N1BCpvd5AvSwyS6/NtjY8rpuF80VyyDKKEdeBsK+5Dqfmbv/IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304397;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mEXSXYkyFGniiZMHCfKiWmZXRWV8IRfRZw7Qjxv3Fg0=;
	b=KGvCJ6p/D5zNKz2CjyMOaJrxHM3xjbwd5jov5QIrqsFbbh40C7lM9UBj/j4kBm2SBn6W
	 sznRg4bQ7KeITwL45ghOrGnVoPgFmO2CwY0oAoCH0yOKkhYdNzM9/a15ml40YWo5X9U/V
	 m7+RK6Hn09hwKb/iDMliamlxQ46XVUIEQSaRWKXKRyLK88gfOuHWori9G3e1ALGTkM8UU
	 aQ/O0+elnoxTVTVmbkONdLFC7kl95sTXM/G/1qwGPf20vsd/8sBcXo1rHfENMqO5qtrIA
	 uHRURkxHWDc6vRNqa9wVa8jwrdfKc/POlr04VX11XPXzMHwhhSqrYm5Fa09REU/0dpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O219Tw+0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F3C606B159
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O219Tw+0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFEE1F0089F;
	Tue, 10 Nov 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304397;
	bh=mEXSXYkyFGniiZMHCfKiWmZXRWV8IRfRZw7Qjxv3Fg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O219Tw+0gQgtbh8myx0h+fAxqq9gpRZ6wwraMvxP5lNiGxivADhjo+V0kYMiQ9P6C
	 S/cjRdnFTOYJYUqOuvCjDsPXT7If+daCVRTTQ1eLTJBilt7IpToBeOxDnLX1RvIzbe
	 KYCc7GgLJ3fyzD1kTho3QBcc0zmzcgxPH+yMWOxXU9Zrzkw5Sz10gSBr4I+Li5NZYG
	 dgErCIIYOUxA3I/00W5ymL/GoCl/Q+sWn90zsL/lH5ZkPbq0vn/m4pMsQ7fqMqGp/o
	 BYozLQP38VBeIZdHfMiDOqIFNJ6AHGwYEYk+2D8g1BoCv5qnohbabF/ctcx1PeXTS1
	 F29P9NALjLwAw==
Date: Tue, 10 Nov 2026 09:53:09 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
Message-ID: <avLpQhAv8MkaOevD@gremlin>
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

On Mon, Nov 09, 2026 at 07:31:53PM +0100, David Hildenbrand (Arm) wrote:
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

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Congrats Kairui and Barry! :)

I am so glad to see the proactive efforts people have made to get MGLRU moving
forwards again, it's a real success story in mm.

Thanks to everybody for their efforts in making this happen! :)

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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

--
Cheers, Lorenzo
