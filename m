Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914754;
	b=uG0Pt8TTVcsEPIGsV+GtRUAmCkWJe1HASzTk8fpSb/VhB1g9NeQlww9B0/qvCD1Idzfj
	 XAJOiZWVh0ADydN+QXu2Xa9VkVkVNA4hBygpehiX1Yp1cyQXr7kBxEtZNv7o4ZJIv/+Vb
	 DEXrcGnc0qoE9Lz8JQqee6ZFvbqeKKJ3cC+K1kuKXxtpLgdTBB9aVFTOdMTh+yhsRBBCM
	 Ty2vvH9kRCaN+JmefOIciDC1aWSKCHpv9PgNpr5gLSJ0TCbS63X5VBBxD1gvubbZF2z1k
	 CCvn3risLJkY2KpHw95oHS+Tw8lIlHVxgPNeNwrcXaZGqYq8p3VZfcM6mBJoWGHdleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914754;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nTKiLpUx3dMnU0ATXQQJ4wXdwToEznpgLoeKZL1liQI=;
	b=F/MQAQx5IdYcOzQ887xq6d/3MG9WFEQrSR63aID7Q17zfjcjlOa6/fR3MKV16L9U5NHQ
	 cyCmzqgYqMy8UxD6kBv+TJZ8rIap1VotgXRLmaIUPbC8k+9hcGvBK3rv0HJU3ZJzh2gno
	 M9H4dRQrJfQAlFgwP/eNS/rdQ/YBCi942lqpaMl7ZJ2CsevoHjYw29BslCAwQSzx3IrcD
	 4KzpGWZJZ6Yl2uaIZYVqHz9yMrPoC2d/clqRQzCBmvVyIbQzrWSk7EQFyXmtXf53eETRr
	 A3WPCM3K9HrsIHL+0uGOYiBxQh0JLWqHJzyN92MU3Yx1O0RxAsLDLV6iSlYymdIfZ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btt+oP+s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E965606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btt+oP+s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE391F000C4;
	Tue, 17 Nov 2026 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914753;
	bh=nTKiLpUx3dMnU0ATXQQJ4wXdwToEznpgLoeKZL1liQI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=btt+oP+sTzFmjKnOVrKP6m0/SVtZsyF4faFwGgTUtODZETb7E4WwW4LKN+yNkHoea
	 Okkew+9aRzFUaaLDE+DY32dUW9jpJPwz7/u1aJzvC4/YYVm4fpkP2AS+uUkG8yYXSW
	 h0zyfQuW5pTy6c7y/Rg6KCts2UKlkfFE9YFObabAMzefbgmB/yjUZKtGdukVpe0453
	 PPg5IyX7reA6PSrdX+1uv+zK2fg9c+LjL76veIy40qSwshbqOJXeg3n5ll/biVtawP
	 SPGxdk2EzlbE7DVb0vPfbmWdZ/EpX1iaLWTQShzq+leR+0QKJciChxgad3c/1DHWQc
	 u9XnBpS54QTww==
Message-ID: <3fd23334-2b38-450a-b4de-bd2621b0e919@kernel.org>
Date: Tue, 17 Nov 2026 19:25:50 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 13/20] f2fs: support subpage blocks in
 swapfile activation
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-14-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-14-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The swap subsystem works in PAGE_SIZE units. Ignore a partial tail
> page, require PAGE_SIZE aligned extents, and convert block counts and
> addresses to pages for swap. When migrating blocks, mark only the
> migrated block, not its whole page, dirty in the folio state.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
