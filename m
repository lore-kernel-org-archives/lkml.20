Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249704;
	b=pGO2IBsSaR6bJDwlgMMkidI8ADIURGhP3D6Z49vxu9Cx5Vzak27eyazYkKNkFT1jBCM2
	 gC6JTxPrBF9bQnGbnfoIJc/4xUQsVbIHjpBVkngDO/ypDiHMWT/jJbvNTzGAO25r6S+DS
	 zj3lcyPaT78PmiRYlNCrl8xVOjeVyLeWx+KWze07RERH4GEKcueH3dyaKWv4JuNfYekDY
	 Ph8b6F0uW3kMiKc9hulTDjcgLDm8qgneLnkd3+mne5tKlfUGaoM9y1+zbaG0rsyZRQ60/
	 4/azunubQ4gQhEw+dMNuegWry4Hf5X/Lpe0ng5n49gAIam22E+pWGdWUIaMzruLHknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249704;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6KyvQTJzcbmQ4aop4C/wDl32TQvem89RduDDh7rd0ck=;
	b=P3VJgNzB57qMcAThEBOzoAnlt+FMxs6LAol5XlcScscpHo3ru1TS/VaS5xLIlULknmWg
	 Dn+BbD9Ccmu0eSEzwV37NKwkLrKAjTCOk7IdbQz4WcUPy7uje7N0jkoV7eIqK/nq6o90v
	 nOQ24Z67RIL1+rZraBF3EvuZWdOdPBJdIOcZmQHPnAEO1DTS9pDidQea7OC79aApf/Dpt
	 ErQ2WGumA3e44xPh/Tv13vZC/g6xOl3UwomXzk0Ft5c0OBO0MwTanCwEBPnDIVAyUc9tC
	 HMzQIOfxEKyiXKA21SufRniN2GX4VSafNbFkq2y3skmxW/ForDszxvm0TXcCtPlN6Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=N4PYsCmc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B06606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=N4PYsCmc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18A21F0089F;
	Mon,  9 Nov 2026 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794249703;
	bh=6KyvQTJzcbmQ4aop4C/wDl32TQvem89RduDDh7rd0ck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=N4PYsCmcNhGd6lqTYimK+5S1xKYGvYtlUt01h5elvR/s1my1PY61eJeEVmWmH+83f
	 R4grjYJTiZGg5iiOfmVqGVHBUF9OxSVoIVRLUP6/ks0u0FUZKr5qaUmteL9BfNZRCC
	 hfFlIoWRamc89vgFsyQRq2qhb8xYkOcYfFfhwfrk=
Date: Mon, 9 Nov 2026 10:41:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, Qi
 Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Muchun
 Song <muchun.song@linux.dev>, Lance Yang <lance.yang@linux.dev>, Ridong
 Chen <ridong.chen@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN
 LRU) update
Message-Id: <20261109104142.c4e01c2e29ee9ead4056f354@linux-foundation.org>
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
References: <20261109-maintainers_mglru-v1-0-c25e6de60bcc@kernel.org>
	<20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 09 Nov 2026 19:31:53 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

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

Yay, thanks guys.  It's been wonderful to see the rebirth of MGLRU over
the past ~year.

When do we get to remove the legacy LRU???

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17635,10 +17635,10 @@ K:	(?i:vmemmap)
>  
>  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
>  M:	Andrew Morton <akpm@linux-foundation.org>
> -R:	Kairui Song <kasong@tencent.com>
> +M:	Kairui Song <kasong@tencent.com>
> +R:	Barry Song <baohua@kernel.org>

Totally-Acked-by:me.


