Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768075;
	b=MT7AEYjSPR/aXFtFWnuMmZkZM9Fkiz2qSop5Rb/Rb6vRw4xBLvFz287e2ekyCoTveKJG
	 jTKVp3ncQcMGzGu/OV4p3wIMTNqowfv0ndAtsp8ZTVceV/9v5svNla8bCyWbU8zTbBvt2
	 bUhafla71mtY1e4AsgX+l5kfVoxbb9pFcrKs7EuPfpVfTMwoNa7xWXiJFwobMlsfzJDzn
	 dMclfimyMRWKVPZ/mYs3iRmqXPeT9blcUiqkVHI4LaftyK3x3+klHh3GINs5pOaX8KudD
	 pC+5z0kAbleOynNuup9xLyLpSctbzD8jW1hG+GFhoDVn3+uTmSglZ5KqujZvKTzlbuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768075;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=93kEpfPodYvah7U5U9F/c/nmvMYFdZtEb/M2cq9GImM=;
	b=jDjuQRKdC+xFhK51dkMDaL+O/DVGwCNYL2sLQdBN6livRgSn9SDR6vOX403XaMb0wMfw
	 C6+iPQ/m/6NgKo0WlkH+dPeZQ1emf0pSQEDP0J9oZbfCOQHNmOuJ94YAv7OdP4RDvLXu8
	 MWrSAijWcGmS36owGM2YUHLtrLcuF3I+Mm3mLiQaYnTunTKoSDBAlqc6jgBKtpCGFEcgH
	 ZnomKQhXGpY167dzejxSUvOqA5X3SoFgmM3jZEzmVpjKLj47eGu/SonKFx5Ilt2KFctUB
	 n7FY2BsvH/d/mOfzNfBZE+oeU3ZAFIec0HYGqMVEubjb6ZC0QL+8OJYrtTCU7TxiD5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtZzXfR1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1A606A31D;
	Sun, 15 Nov 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtZzXfR1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550721F000C4;
	Sun, 15 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794768074;
	bh=93kEpfPodYvah7U5U9F/c/nmvMYFdZtEb/M2cq9GImM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gtZzXfR1bTAGYx3dBk7x/FfnoAReSzs/b7P6kAnaxij/SjatJrBlP++YJUnjqAt6e
	 ZzAMnJCI9Q8zHl9j2WSfCrQpbwM0VCF6RJTmaMK3/kNwrHzXAfzo//XAraV5KaSwXO
	 4kwP1B5O27i6MJYoiThYara9lpgogbIWN5tPyzS3wik/tyQlQgaPGZQIiTMRU7LmON
	 vKbeXaPQKLGhcQ7XsWw5CkCPrzTF2psHE5CctRdZJ7vzbnPs6yrruwxt0Xp3DmS2TF
	 dDgu+I1Xu6Icj4qudel7VXggRWKBcuuCwv8qfNWoyx040dvsgz54BPYqCYtfvP6RsG
	 CDO6e3nn5YgCQ==
Date: Sun, 15 Nov 2026 10:41:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: shaojijie@huawei.com, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
 liuyonglong@huawei.com, chenhao418@huawei.com,
 yangshuaisong@h-partners.com, ningwei15@huawei.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 net 3/4] net: hns3: fix interface stuck after OOM
 with full hardware rx queue
Message-ID: <20261115104113.6b608a8e@kernel.org>
In-Reply-To: <179462624232.2199510.16700149583019655532@kernel.org>
References: <20261111125810.3359030-4-shaojijie@huawei.com>
	<179462624232.2199510.16700149583019655532@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 03:17:22 +0000 netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The patch adds a new private `ethtool -S` per-queue string,
>   "rx_oom_cnt", at hns3_rxq_stats[] in hns3_ethtool.c line 65.
> - [Medium] net: hns3: rx_ring_oom_bm freed before cancelling oom_task on
>   init error

Both Medium comments look legit. Let me apply patches 1 & 2 since they
are unrelated, please respin the rest.
