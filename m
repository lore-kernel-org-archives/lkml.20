Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6E7449EB2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791721191; cv=none; b=SVaq/bhMjFR7UigvCWGIuSk3cq2xcxnDRkV1M+bwLOiNqloBI6CPaR+HlTPeyOLv83JDT5O9TSVYddNj5xaAmJW4KgbQWoeij/LxclRBrl4TRGem1ki7e1wGP24C7Ty85PBx6DRV8QeoSX8/zzJ+pOlyzUPi6Hnr30Ym72HTIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791721191; c=relaxed/simple;
	bh=cGqy5ia5VZNErdROYGY2IfaT+ZBJKtcgXdodlgUzLc8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=raEfoj0tcGQ4/UA1/t8dLr/BN0QAA5Hunm4Z3FsHcjDjNRIw1jG8kgwjwYJ23gOHiU/ytXAyaQ+y0cxMo0SgB5t5lHLr8jdQtK3ZwcnRnnE/i7mj//47bnaXo8pQ2A5yNCl+bwPckQ8qUrqGaq5/TE9+mf6en4YmqIul6oZq+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXchIvvB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXchIvvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0C61F0089B;
	Sun, 11 Oct 2026 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791721185;
	bh=+bUjhFFNvi7S7NmKFHZzl4mLcYN4K5RNcVEHvKxPa9g=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=GXchIvvBEpadoNVj1j6O/e333xRnubs7XV+E1ZwL7NAmkOFBgWTsqjGYTIG+drT9u
	 +b6djf5DQ6gVSz/cAj5Rxon4VRkIpNOrJStQJn0LJnvhVPjlxCGI4hYCBrwTRZEbsw
	 wpXyEn4qGi1XofPX3JI7POC0+gU5OzqdqdPVqy68iX5AgoUe6cYlg3+DKeTpSJchB0
	 Lg+kBwIM5VIHOhj0Put0HMHFNpWvssYaBD+1T2uvh/ilFaSWwOPzukOn9ItInFLGv7
	 On3G0rRH0FSigJBPhgO41ZT7751THbNF3C6/p8TIhcWBZUij8dJlT10BN8Ass+nVmD
	 xnjMUu7DSQQIg==
Message-ID: <ce9280bf-f88c-490d-bede-816ed76e94c0@kernel.org>
Date: Sun, 11 Oct 2026 20:19:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: check every cur_*_segno[] entry on readonly images
To: Kaixuan Li <kaixuanli0131@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260918165507.1267942-1-kaixuanli0131@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260918165507.1267942-1-kaixuanli0131@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/26 00:55, Kaixuan Li wrote:
> sanity_check_ckpt() bounds-checks cur_node_segno[] and cur_data_segno[]
> against main_segs, but on an image with the RO feature the goto that skips
> the duplicate-segno cross-checks also leaves the enclosing loop, so only
> index 0 of each array is ever checked.
> 
> An unchecked index reaches __set_sit_entry_type() through build_curseg() ->
> reset_curseg(), which writes se->type through &sit_i->sentries[segno]. With
> segment_count_main 120 and cur_data_segno[1] set to 200, KASAN reports
> three out-of-bounds writes during mount and the mount then succeeds.
> 
> Use continue so every index is bounds-checked, and skip the node-vs-data
> cross-check explicitly, which is the other thing the old goto skipped.
> 

Cc: stable@kernel.org

> Fixes: a7d9fe3c3388 ("f2fs: support RO feature")
> Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
