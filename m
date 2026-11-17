Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915508;
	b=O+ku/kJHD/dxZ47PRsEFAW91S5eIOf9dB0RjVS1nss6/qU7O1OusVSYiWOfgAv6/fM1q
	 oVIFkSu6FlFuM9RlOKQ2r92c+qIZKlZkyoTnaTfUcv1aj43lpgH5C37NNyaRBNwwvPeuE
	 UcSHM3dR3kPN50+G4OPbI7P6540CTiQB4vuIwCjCfhVaNUM84ay3hEZO4SBff9vfkOy0i
	 J+cADNu15HydQHrJ21+t/9epm+GANO1Spni8FyJR5Fyc3UBuNSzU60wxZewcSuUVQvEP9
	 F7l84QyniDHAZoz5SJobt0uHQZa2f/6nCrZ4HbFQFrhc21qvL552H3taG9I0e/rauYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915508;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=27ze6YgxGXZ8hOfykcrg0qapM0urNweeGBFd8wX9DPo=;
	b=TGFb/UuxMWOEcDgWjCrIzP5cgpen8rauYFv/j3Go0wdmtNA+F7+7cJ0QvMl3dIqoQJII
	 T/PdTXdeT5WvfOJIL4Ry/4xAHfpbIw4FjV/yc65L6OsqrT3HY0gCNOXL1lidprYFBCexK
	 K09xL3HtfE1Fh0gFGi+eKadAYhcpP67vt/2Bbio8O04f1gt9mVowC1Lp6YVv1yUrkZpAo
	 ful48W8AfN9d0iw/6CsAVK3RHdwYlHmtULMbqNk6ZmHYSw7VeTVcmmqyLQbSgttxgLE8t
	 qfGjuUXaY/bBI1sAFeeQH1+eLC0O9jPw1FnSqbfqGUZk8QbMrqHq/78q9FTu07X/DHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqXiwurU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqXiwurU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077EC1F000C4;
	Tue, 17 Nov 2026 11:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915508;
	bh=27ze6YgxGXZ8hOfykcrg0qapM0urNweeGBFd8wX9DPo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=bqXiwurUZP7C2FcYUpebuO/ra1c7R8n6k0+QhvUCcN8WqC0FnoiYI7VLTjOaoxKIs
	 AjwokGAAH4XpSSXZdRIstgTHkHDmZkCL8SAzCz++68PcqQ6p+dYMCj613Hj50ii5co
	 g6TepxnKV1FUYwTOIjTz8kC0vtw4O4e4/Xwobn49mUZwXfIW589PcbONLvRlEKd1KY
	 wzFNFUlP2N6dR7tzE6UTzb+fhOxMLTCMDoKaQ1U4ucZAVivxF+0sXTqjDMTwPEWFF9
	 znM+upqOVFeDQ6Rmy3EWWoGUGL05VicXarDdNhQb5+AH3ZZmymd5QrnsGgB23WrhhS
	 +w+gcshczg62w==
Message-ID: <f480bac1-51d8-4f3e-b6fc-dea754d78eb1@kernel.org>
Date: Tue, 17 Nov 2026 19:38:25 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 14/20] f2fs: support subpage blocks in
 fs-verity enablement
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-15-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-15-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Check verity per block. While enabling verity, dirty and write back
> only the data blocks below i_size in the folios before the verity
> metadata. Do not zero the blocks past i_size on read while enabling
> verity, since GC can read a folio of the verity metadata that is already
> written. Remove the -EOPNOTSUPP checks. The changes for enabling
> verity also apply to large folios when the block size equals PAGE_SIZE.
> 
> Stop the data reads of a verity file at i_size in
> f2fs_read_data_large_folio(), so that the blocks past EOF in the folio
> that spans EOF are zeroed instead of read. A pinned file can have such
> blocks allocated without being zeroed, and fs-verity rejects non-zero
> data past EOF. The reads of the verity metadata still go past i_size.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

