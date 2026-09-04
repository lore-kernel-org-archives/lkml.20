Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12924EEC0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486849; cv=none; b=ahWayufGkiJZms42QBdRQd1YxJuyRs2EHBEbuXF5HTeEl3/BxSYEporIVZKzap35p+V0H7qCKcXbTVlSE8241AG5dAUWnrHxOhRmFe7RFlalklQ7kepW8ShWp2iKthfGenwVS4haNXbiRO6WZgciJY0KJPD/AsW6QYLg7m9G7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486849; c=relaxed/simple;
	bh=cF4pabPAvNTJVZ1A0H8ef/xg4V+WfFaUS+JONTzWQsc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bibDDnAp93K6njJRxUY+qxmk5biV9rCcD7V1aucMnWu8GWBsVrCg2CbL4zqYpMTSj2fuw80JuZp7Mj1z7ZMbLOUa7P4+LpHJszMsztt/cHkrnjJSqT4vCRVYzn5+ANK1C+hGJ0Pmct40yrKLRWKTYwYdnZb0D/SPP5r5EuleggU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMKUXVIc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMKUXVIc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBF01F000E9;
	Fri,  4 Sep 2026 01:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788486847;
	bh=1WRoLVevLW92ZIPX07qRkQmYsWzRclwhzP39wqjr+bk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=CMKUXVIcZ6FuF1ROV9ZJT6R2Q95SSvruGs49Sv0hA7bSd9RFkNWYiUAgbV58voFZ+
	 ke9r38PWwkptBTb2GMHnsS27+jbFh18HhTR+fWi5/jnMkfMekFhw97UEMOUUP5U5mT
	 6CizXrmkEBH1vUD4zW47IWTn81OQQCuSswXSkxN8xxhICylz41H8ZuQtEbk7tGjEyv
	 W/sZl4/7LCnSmIIsrPkoYZDU8dPBqcG+3T83nm0hIxFMvwsgY+nShDflqc35v9hlE2
	 W8/j8eLUFh6rCLOd2UnrLfVGgKAEcCgwdzlSIMyr2egr54Fin9anhZaA9ZYtPvd/1s
	 PfSu0ih6WO2NA==
Message-ID: <b4b114dc-f161-4759-b508-3d34519a041a@kernel.org>
Date: Fri, 4 Sep 2026 09:54:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/11] f2fs: describe SIT block layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <10843e36038ce78374ef20fe8c19f6ec392bc078.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <10843e36038ce78374ef20fe8c19f6ec392bc078.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> An SIT block consists of an on-disk array of struct f2fs_sit_entry elements
> whose total capacity depends on the filesystem block size. The existing
> fixed SIT_ENTRY_PER_BLOCK macro hardcodes a 4KB block size.
> 
> Convert the entries array in struct f2fs_sit_block into a C flexible array
> member, and calculate sbi->sit_entries_per_block dynamically in
> init_sb_info().
> 
> Parameterize SIT indexing helpers (SIT_ENTRY_PER_BLOCK, SIT_BLOCK_OFFSET,
> SIT_BLK_CNT, and f2fs_start_segno) to take struct f2fs_sb_info *sbi, and
> update all call sites across segment management, checkpointing, and mount.
> 
> This is a layout-only change; valid 4KB filesystems retain identical
> runtime geometry and behavior.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
