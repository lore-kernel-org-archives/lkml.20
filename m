Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237780;
	b=nta6soY0C6zkKm8QOiJxtfQIazhTXkc+ZK8bTHHCJ5UgmMKy8Qn1TqbZSEWWHlZ0bk+B
	 vKqHXwC+BFAy/8Mnsr1y6OTaAzY/bzT7UJdnWIhG/ubAY9Yvfvm4jvlYOd9zKmhG/KZzC
	 OxrAfG4egkKi5JMkr9++zZs4dTaxOzzUAalNrlGD1fXshLVwZ9rVIK3YUwnhpJcGULWDP
	 XafaFp3RxGcPhO+VF++w7lOrDBJw6yA689bPghzHX0qDKGt8TBHnGyaJVnKDTWERJmrLB
	 Nnu/lwmJJ1aDbNPW1djSRcrAqrcZ3pMNdKUigU/KXQejtqUnF7h2wEU/Z8+RhhVh+eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237780;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AylnBCCcdsK+79U9qo95ZrQ+43bLKujyoqzIn5/dEs4=;
	b=Cmj8YGtO3theDt+76LlVRxKrC4ff7s5VckUfMRMXqsRrmbbrxsXT890h4lqXYpjdfQ3P
	 b36X1c8neA8BvnSxgjNex/E4rzNTh/HyNum1GyQtsM7dr33SRjTJ/1Gq6KA887SeHfyzq
	 Sm1aa7rbwV9rgOs20P619JXjnzP+wO0xtDgToGYSz7WLBU3nSqODxkt2h9YjK9EG+YgjR
	 lgyVd5hcAc2szDGhkcuNuY4hSMyXe6Z5Jbj4e8FjKperXv0TRKxujjaXEeMXHYmlF4gW9
	 SegSRtx9eOnBC2RyscpOchZIYFp6IvZWmFy6ng+WLVTBTbtPDIP/c82knOfzpiC5+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OkQ6ASTF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7508606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OkQ6ASTF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA61B1F01825;
	Thu, 29 Oct 2026 01:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237779;
	bh=AylnBCCcdsK+79U9qo95ZrQ+43bLKujyoqzIn5/dEs4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OkQ6ASTFMzz1yXF3njzDb/xUm8DX/UL4mY9uf3JuD4FWS0dVtGHzXKvmmgp9uyD8O
	 FrMgTm+gR54TFIT5eLqWmrif4wu7jPIf3RiAYGdqY4OS1qN5qVGYhMLHwXM5BpST/R
	 k2pSnkDiNg15azn4hMLObjA6g8gU5riji0JD8txU8BKyPoZFK3jST2PDqwz7a6qKH4
	 66d36vsPyioPcGdGaPO3N+deIu8PX5lGpt0YD8vPh0FWweP707XhHGcfZuEyOZZlgb
	 4hfqc+KiC1SzEV67pjISFkvDHOjdKcq3WS+58vfZqCz5/SDlJx27MgWrBYP3t1swYX
	 fQPcVPoFGJOUg==
Message-ID: <1ebf8257-ad31-4bc1-b8fc-048dcd1819c0@kernel.org>
Date: Thu, 29 Oct 2026 09:36:15 +0800
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
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 14/15] f2fs: allow large folio support to writeable
 files
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-15-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-15-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Now we make all write path support large folios,
> so we open permission to let writeable file set
> large folio mapping.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
