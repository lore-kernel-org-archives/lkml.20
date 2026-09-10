Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDE267B89
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022220; cv=none; b=dl94g2Mkez1oSmggxCO8YyhEQoOBYmJuGITNsfQVfBQ9RXhUaO4ZXQwOltHptdjevwn01bFryhUGD8HgG5sf0F5a0d1XVBz54ksNwsbgqaxovR50B+bwONbB3pE8r/aBF9oT1lSeGPy1cn3a00NJ68cOb59nVaPUNa5uY49iFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022220; c=relaxed/simple;
	bh=KVoOa1dvnZ4fL5rAPwbZj8mW4Ay75l6ClzM7igadRUk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RLzTrj745PeYOY12+NtxY+fNf2YFpg8O73SLaoGMq593GnQQp7nRxYhbnWYeijW2MNmtQh+x6IBDGqe/bcwAjpVzLAcObmcmuKkvVjIz6W5ND4geANXeCJnFgxJqmBKpwRE1wKIK/0LcRYUbXaNMmHw4M/HAPoebka8Q4/pyv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAa1EU1Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAa1EU1Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB38D1F000FF;
	Thu, 10 Sep 2026 06:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789022218;
	bh=ULSOjoxc9C4LAIJYFZvWWrEYRpEvNKnRn1S91Ea0S+g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=gAa1EU1Y78m/qKj0lQHmMj9PZMe6jZ75qmcHpuYIeCiU8DunX/EFLyYH22xdCsL6k
	 NQ3ScUXTNIsl7KoEPdDCHjla8Xn1CTuvL1/i/zGbQ8NkHQHI0y96lFlmzovLbkxCMk
	 6YMVioco8bjlhFIHsKH+MoriJWB4lv71szyYzDXa792kN1e0QP2RVKZr/8HrJzwG6y
	 Rcxn8/4pWSOwxpAz1POAsbjserEbHBZO/hX7T+j8aj8gj76+Gcy/Jf2Ad4ZGV4VSoX
	 16TiaNQkiMXdWwB7t8Juck359uexW2PTdirJn/YGa+r/gv47r4HdBIC+9JDU1v/SxI
	 MMkvb93vpIJ/g==
Message-ID: <ee7e034f-82ac-4de6-a368-4ff5e42eac65@kernel.org>
Date: Thu, 10 Sep 2026 14:36:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com, ke.wang@unisoc.com
Subject: Re: [PATCH] f2fs: fix to record both APPEND and UPDATE ino entries
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <20260910030243.3005578-1-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260910030243.3005578-1-zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 11:02, Zhiguo Niu wrote:
> In f2fs_post_evict_inode(), record_bits is assigned with BIT(APPEND_INO)
> and BIT(UPDATE_INO) respectively, so the second assignment overwrites
> the first one: when both FI_APPEND_WRITE and FI_UPDATE_WRITE are set,
> only the UPDATE_INO entry is recorded.
> 
> The two flags are not mutually exclusive.Once the APPEND_INO entry is
> lost after the inode eviction, the shortcut in f2fs_do_sync_file() can
> take the flush_out path in the next fsync(), skipping f2fs_fsync_node_pages().
> As a result, the dnodes holding the newly allocated blocks are not
> fsync-marked, and after a sudden power loss, the data appended before the
> eviction is silently lost.
> 
> This restores the previous behavior where the two ino entries were
> added independently.
> 
> Fixes: 314c9e476ffc ("f2fs: call __add_ino_entry out of the eviction path")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
