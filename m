Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768226;
	b=Okf5uYeSlzoXAgqa5lmQVYYVbh+M2kxPHds0XU1BQCTBofDoVfxZPh/o0nw6i3fCa+1x
	 bWhMAGl6HyjMgPTJuvEFhXqVqJRNYOromfHTCY72+ttMWcqYj6prBJOdqJXHkY5VAg3zh
	 dHu0LzGp0DwSYFuXObGwWQIN/Cqc0rNccbf/zNb4xmedZHM1cu356q+l46SvUtgYfphk0
	 gHyVhQw+/dn2SeTqL+R1wpsr75Ti3PG/ueFbvaVt+Nn7ZDpgOs8zBGhpHC7BuE6+IQl9C
	 wqXUaqpjAlbpdgzA3CoHjjjnkNLMX50AodAdUS2U+K+lAbd1F9JVmUglD5I9kgQg0LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768226;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HgEeO4kVDM1pyexGwdN1zADFJoebprylCgzk4R++fzE=;
	b=0axGin53ajBCe6mS+prJCiX+Esbzg1G5LGm7pj3LMzkXagKfJqATFRUyFDwSHD4mQMi2
	 VrbNBt3NxQF5+B4pwXG2KdvrNp3Sk9nE+Kgis5LhQQHfSCYaCNnN8lHzHeyzxh6Jiwady
	 5bS0/eu1fv4ShV8SPfVmzUnIgn7yPMo0xXQ6VtoGmeGjNK0MeHtGWRNaKKIlTQf+IXuau
	 ZeOLGRf84GBpGowD8BhUA9s5ad2PBgXW6iIgaqPTgoX5+Pmq9oxjhlIMwXWeLW2NFJXv1
	 dymxcTR4bD5OXMYfyj6JzdB4N1m9M1bFY7hMkarMUZWZy5gH6XkiTn8UvJmV6FXrCIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4lIrhHF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55E5606A31A;
	Sun, 15 Nov 2026 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4lIrhHF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC8B1F000C4;
	Sun, 15 Nov 2026 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794768226;
	bh=HgEeO4kVDM1pyexGwdN1zADFJoebprylCgzk4R++fzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T4lIrhHFOpv+vS5MXAhz1UpTZNOKEW1/Ng/blGZ4BDVIZD0uQCOFHZEWtuWlfez9U
	 C0mjKe5ZVDN2LuN+yC78eyUgFYKR7vZ6jPTP84STKl+FrhVEyBBI5tPa2d+ubV81g6
	 S/MKa9ciX40cuDadp4Ulz80g2NBWColhdnlOoOwGP8mW5Wx+d+Znklnmi2XGJiJOoM
	 iO6FbXrZG0SYQxD6SYE1Ze0uYQgiZ7tjWJc8QfDJZqJ5bhoHgezS/86EFb1jm1VSae
	 5NS5EfKe0fTDlatl83qssdAQDzVRKtI2xVmKI6mKYZHWXw68nWzczRJRjv7EvD7YX2
	 PtjlBJrQs6bsQ==
Date: Sun, 15 Nov 2026 10:43:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: shaojijie@huawei.com, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, shenjian15@huawei.com,
 liuyonglong@huawei.com, chenhao418@huawei.com,
 yangshuaisong@h-partners.com, ningwei15@huawei.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 net 3/4] net: hns3: fix interface stuck after OOM
 with full hardware rx queue
Message-ID: <20261115104345.2b5a0df9@kernel.org>
In-Reply-To: <20261115104113.6b608a8e@kernel.org>
References: <20261111125810.3359030-4-shaojijie@huawei.com>
	<179462624232.2199510.16700149583019655532@kernel.org>
	<20261115104113.6b608a8e@kernel.org>
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

On Sun, 15 Nov 2026 10:41:13 -0800 Jakub Kicinski wrote:
> On Sat, 14 Nov 2026 03:17:22 +0000 netdev-bot+sashiko@kernel.org wrote:
> > - [Medium] The patch adds a new private `ethtool -S` per-queue string,
> >   "rx_oom_cnt", at hns3_rxq_stats[] in hns3_ethtool.c line 65.
> > - [Medium] net: hns3: rx_ring_oom_bm freed before cancelling oom_task on
> >   init error  
> 
> Both Medium comments look legit. Let me apply patches 1 & 2 since they
> are unrelated, please respin the rest.

I take that back, the patches no longer apply, all need to be rebased.
-- 
pw-bot: cr
