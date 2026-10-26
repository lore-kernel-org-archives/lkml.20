Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029208;
	b=R0B8Vd5Bc6S38GN4KSc9a58iJy1yVdO/w4GdVe9UtWGKad9E/+AHe6zY595F9POnNZfF
	 JoOfN5o+m7nc3zLnGpTmKhIiB8PhHqzX0WbZ0hveAxDJZPBjDvlg+Om6ZTj/shDS4vYcv
	 wcDBCXBx+sHak3f+LTDzsd4qOStJJ85tfFtQNMGGF+wcyqKgQJjeUjzQo9GtMNmlPMBZq
	 wJ5iGiUfduSNdCq15wCR7lVXfMFVcacIHKXLkQMLq/twFvKD4mSaMkQ+FeVq79aCm8Rl6
	 Gk5ZlI4fcDfG+Oi2BLgVkI+WS0cHGwbXGme5rlU7xgaHjyCbtnGcyBbUoUry+TaQiYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=NwOaDW3IKFzrSo7Bh0MMRKLfKzgUJTqf3sxAkLkKUf8=;
	b=I4NINOcthPC28oaT0CmQAWfc73NFqeit0Cjp6bBNHSpP9Y+Azx9SgWLTg5o39wyhXdiA
	 sJQEjCCsKox86BkH5i9KLWWV5CZ5LlMen+t6RjQ8kBmdEpT970HpiZblkvEzIlzgPJyrY
	 IlYTmYpEXzY2pQFBJ0Jy69zTH9MG+seVDYKgYCLIur4mQTFXPvPb64RaAS3+2yB3cvPul
	 On7/WXu8DM6DJgnuWOs/J5425ngGmfqTJYx8un+MECqQD9ezFKXksA4re0MjWKVRzROdH
	 0qs6m9oKk4c95RQhWuGYIoXxUj0EvsFidbiNkFWqlJ7i4K293ETAATnRefAbdbTUZYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIzfmbI8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C280606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIzfmbI8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C311F01828;
	Mon, 26 Oct 2026 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793029208;
	bh=NwOaDW3IKFzrSo7Bh0MMRKLfKzgUJTqf3sxAkLkKUf8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KIzfmbI8bz/CC45PT3r57JDhBQ+qYzAmmt6vUSKytYx3SSomQAtBT3dX1/5GAex2o
	 AjxsLl6gTjASosPOFCp2CpLXwhBzlMvzGCYFqquBZNXDRnrX6zeHdjuNopNu5lsLWV
	 0mFiBWh9CUHoET9QBhtJNrbl2OAXSggecwPmwYmKx/0/s7M9TNTyswUuGUUQGRrgg6
	 s0bse5GDXktDjxYv/fPtz8dYdSsuHFHorAPsf72vRb5qFiDudU6Dn4yMVU1oqTo+bA
	 W1MsdBYEeurgFgSOTepGgbC3SXmnLZ6IIKvUlWCBVAjtA2QrXWFaFmZ3UN6PY8yPxR
	 yTiQQfXTuyQag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0741939EF95E;
	Mon, 26 Oct 2026 15:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to fetch ino via
 ino_of_node()
 under cache lock
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179302920657.3239427.10043176302785058573.git-patchwork-notify@kernel.org>
Date: Mon, 26 Oct 2026 15:40:06 +0000
References: <20261026002350.1451587-1-chao@kernel.org>
In-Reply-To: <20261026002350.1451587-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 26 Oct 2026 08:23:49 +0800 you wrote:
> From: Chao Yu <chao@kernel.org>
> 
> In f2fs_writeback_node_caches(), it's better to fetch ino via ino_of_node()
> under cache lock, otherwise, node cache content may become stale after cache
> is unlocked due to racing w/ truncation.
> 
> Commit 493b9dc8b52c ("f2fs: cache: use node cache") fixes similar issue in
> f2fs_flush_inline_data() introduced in commit 34c061ad85a2 ("f2fs: Avoid double
> lock for cp_rwsem during checkpoint").
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: fix to fetch ino via ino_of_node() under cache lock
    https://git.kernel.org/jaegeuk/f2fs/c/cd6d8b189139
  - [f2fs-dev,v2,2/2] f2fs: fix to update superblock crc in sanity_check_area_boundary()
    https://git.kernel.org/jaegeuk/f2fs/c/f8f956c7ec8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


