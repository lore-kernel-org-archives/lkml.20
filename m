Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273722;
	b=CR+jnH2+YMC+E8NWQlEAuBriwxS2aMqGfuSn/cN7aFzqxp/tlJIiw8IbU6GqiB8Qe2Zt
	 KvsyF1eb+h3XlRGkaUf6TBBxOB0uGEe9672OEf4hPgATXg6NFd0URj+SfRpk6rUAUkZcF
	 3nNlpeqh4jF4KX/NXfSjiiwIr/OdeC8DcBS0aG11r50mksXtsyFxoxfgxKujkbBz/LVYZ
	 hHgODrrBZcc/vXtuOkRSddeeqkCZ4TVu3jO7+SW43hOC1zsDTxpK0pSGwLQ2pyOfE/UvW
	 bfqfE/zaS6Vx5AZ4LZbGEMob3RpakbLwC4g1FOrkDbwarjOtjvMp/8EDyCpFKKPAjAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273722;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9/SKGdkxbgIiUz/Bq2IrDh4GfzV8R3UclkpDZ2NwnbU=;
	b=Gg+iP/VFKHBOZ+tpSll6LhsMY6dQuK1nPD0FJoxPvi1Xn6j864ESBJ3SKjylqOe7WVdE
	 iXX3xNk0Mijf3DJt2stBnEQG6hoXLlFSZbqpViQEl9r6ozvEyPqctgJcBaieZRJ3Gnexz
	 /ydd6OixW38gsZVSuV2aCw3Is2EIrVSAdlCUbHKJrnUHa8Net3RyuiWvxx0i5Glq4cSRJ
	 Ztk4kIQB2sJQ8cAHC5n+/rwl0K3enBhMGXYULXRLN6E7dcK0mwP0tRI0z9kAv9QdMoLKe
	 /s/W8LpE/ZI9BfBwj6YO+t1xeFOJ6kY3fezIEOJSRIeEzmZpN+83tg4AGsTZRK427hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USauXDqR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92E560A3815
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USauXDqR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089801F008A5;
	Tue, 10 Nov 2026 01:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794273721;
	bh=9/SKGdkxbgIiUz/Bq2IrDh4GfzV8R3UclkpDZ2NwnbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=USauXDqRMW03uS6JCc3QT/ocT/r3OhDXNget2Z08FBv6F3PZ2dycsP0hbSNyaq5aj
	 H5siAMvhp8zy0GuwUzuzoqymZLqHhxCfEmf8qbx/W4lb6uGoI+vGYhDq0k7GwoHVeo
	 NZ2fQmm7mDNo4/5AdlgFeGVxZ3aPMRFTZQD2lHEQXY0I7q1WD9NiLgJoN0ylp+kVxV
	 QfTkSvZxWyAmSJJa0vzpwWSG/u+pudtbg6NOaXC0VeHShpy1aKbhVMOdroZJpCKslM
	 J0huJHeOXXAm/nb5UhUQQuVbiCd7ZDjzBUQ1lr2RRIo4zCZIyz0KrGLNmVIBrdt+o/
	 TUmxCxTpKuUYw==
From: SJ Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU) update
Date: Mon,  9 Nov 2026 17:21:53 -0800
Message-ID: <20261110012153.106603-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-maintainers_mglru-v1-1-c25e6de60bcc@kernel.org>
References: 
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

Congrats and thanks for stepping up, Kairui and Barry!

> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
