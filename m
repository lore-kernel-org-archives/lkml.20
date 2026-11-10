Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329538;
	b=RiNKgejYLMjTO03Fx2m5ZfADxhU5eGBTMXsLzxW1Itb+OLp0udLMpG7/ngqbz+09ZnkK
	 19vZsA1nn6wwbdYyBo4XmMQOw5r97nZOZQTO06qGF9NrTqVmQre1kwKu+bnAk2RHzE2RG
	 bEGL9lKC8CGEVMi5mBmJDOrCsWdKHc6QIipmh68OqgZeH+p/dJIjyNnZkg3hm/Lj9v7BR
	 xQuYW4LfCqOF/i63GrKOVef0D2qaxz9eHbBf+NktNXf8P8aHDQ3CyY5xwI1v1wL0H+lSR
	 hcJ3SglW5FPhh6McqXCSvURllT4ouIGFW/O1HznUcY7l++7EcuXlIinyTKpbp9qkAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329538;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=RwKYe1FZ8TSRCRSLvx8CKLmwrOieUAZJ4xTeOLFE+8c=;
	b=OBUXrnJJXieNWBUhmzJ9ar0XTCcYbk0XYn7lDIW0jkjFwFrv/PK9zcr62rltOFCZC27R
	 kYoGpljRri0mgPWMuH3pFWNYRbL9bN/j+thMbWB0hcOM/UkNgc4HGesXFjJ/eOmS/QVyH
	 l+Uc36sC+Aht75UOTRStVEiA/NPGTteKPNV5RTPdUDaNy7xWxoqeOkUsszjlbhhJ0Pn0R
	 q6uKth9aqRgX9xf4aOt2wKVNgDdtf7+QoetULJUlSCwQdCnMN64mrX4RFyD1D3hPLZAAa
	 aW481+XsE8ujDHFhtV1A+cQJcfghlvdNzu6WvfxlgwTh/ZgDcUqMNOHar0yuvmg7DTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQ1mHGE8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F1606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQ1mHGE8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168DC1F008A1;
	Tue, 10 Nov 2026 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329538;
	bh=RwKYe1FZ8TSRCRSLvx8CKLmwrOieUAZJ4xTeOLFE+8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KQ1mHGE8yDsko9wqUMNuJqUyMQU4njRf7yvHVhukpRSCc6PfyquBs5m7hxr5sSArv
	 Tz8v81Y+mNybeIkmWrNBMgDD9oQ10c/9DglWEo/UyBsKq6CBzKGGuoTcSIsqaaE3QR
	 gVzEFTQlk6hiVis6FVdj/oDJDlYfn5eWHLkvd8qT1JfzgN47Pw+nI4hgwwz12QLrhx
	 qS9fzK0IwYyzeuJLa1vs0fum+PP8qXejEMm2XhWTfYuirC0gKU49ervzU1QbDPfflC
	 3b+22qhaH+s1qqA4SNiPRV9k0uOtKXH2ZOvAWqhCJ5Ddns6r6RDq7kEEJwT7QHNe6o
	 Wo8L2+30e0TbQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Chen Pei <cp0613@linux.alibaba.com>,  George
 Guo <guodongtai@kylinos.cn>,  Kexin Liu <liukexin@kylinos.cn>,  Sourabh
 Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] kho: walk bootmem areas in address order
In-Reply-To: <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org> (Mike
	Rapoport's message of "Wed, 04 Nov 2026 18:50:09 +0200")
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
	<20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
Date: Tue, 10 Nov 2026 17:52:14 +0100
Message-ID: <2vxz7bikiq81.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026, Mike Rapoport (Microsoft) wrote:

> kexec_add_buffer() users may depend on the order in which memory holes are
> searched. For instance, arm64 places the kernel bottom-up and then
> requires the DTB to be above the kernel.
>
> kho_walk_bootmem() walks the bootmem areas in the order they were
> reserved, so if the kernel lands in a small area at the top of the memory
> there is no room left for the DTB and kexec fails. For example, on an
> arm64 VM with 2G of RAM and kho_bootmem=8M,64M,64M, the lowmem area is
> reserved first at the top of the memory, the kernel image takes most of
> it and kexec fails with
>
>   kexec_file(Image): Could not find any suitable kernel location!
>
> Sort the bootmem areas by address and walk them in ascending order, or in
> descending order for top-down searches, like kexec_walk_resources() does.
>
> Fixes: 3bdecc3c93f9 ("kexec: add KHO support to kexec file loads")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
