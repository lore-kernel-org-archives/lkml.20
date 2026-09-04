Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A035928373
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486911; cv=none; b=HN07IZZuZ8aGLKAStuOYJNcpUJHjeAJuPQZp1Miy3e+sIGzWGuP9Bp2hfGlMoWSmq77rJ554xthUxOg3mFshMHm0mV1/oXUUxiagP+3za4chRiw2pUQZI8BApMGhQrotdAxGQu45GxfBANXgVVP86i6pyBvWWJ6qHdxhsJQKUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486911; c=relaxed/simple;
	bh=XiZacOsd9e7x12bTkP5pfxuaRoaRhwCtss3NK5h7SZk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q9UG/s4iajZumtbkY00piHuNgZvxjpY57VgymQxypuhbnsDTRrjCSXzVJJJ3UFJ9f00I4dk8JdbM7F/93deeRhHWp/VXtv/KGl92ign4Smy13HYuBjn95sBmnhJHmzvmUagfMCgTSJ7botgnX7GlxKC4J6Z1vIzn7YwxzL1LMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzKsuTnh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzKsuTnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D4A1F000E9;
	Fri,  4 Sep 2026 01:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788486910;
	bh=lVKjIS0Eg5XrAPg/zdYHxfOR4gtQ/JfSPCvfuoElJzw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=KzKsuTnhbu08hAl35NHp5kRKiPwA9bs3Po95oJxzJTtR9AETBC6/3WG5B1/A7Ge+W
	 Sis+Wk6cX7sVRJfCDDOyCPprL1OrW3ZOHjfOLYVyn/H1goWT+VTUvQSFRGetUIDYvO
	 nzZEp0Xkc6ftQS8dV2wXVh3QyGlXEgkcP5SJaCV8a86JUgQkN8uwHae0NTVS/EnUC7
	 rH+FSv5HG/OwlALrny2jzO2+1Sr8PmPktax6KtXrnQSA53YYyjBbZOar/ZBF7KGlNQ
	 0gFSUpDqAbVu0m8i8075SIijHmIs9itigYZt/ivHydZdawzwXaZ2o+ckBO5HtE0MvI
	 nS61xtVYegc+g==
Message-ID: <d988b67a-3b1f-43de-b317-375be828fa26@kernel.org>
Date: Fri, 4 Sep 2026 09:55:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/11] f2fs: describe NAT block layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <f019fbdf97004b6dc2cbacd3a215b163a1761359.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <f019fbdf97004b6dc2cbacd3a215b163a1761359.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> A NAT block is a filesystem-block-sized array of struct f2fs_nat_entry
> elements. The compile-time NAT_ENTRY_PER_BLOCK definition hardcodes the
> NAT capacity to a 4KB block size.
> 
> Replace the fixed array in struct f2fs_nat_block with a C flexible
> array member, and calculate sbi->nat_entries_per_block dynamically in
> init_sb_info().
> 
> Parameterize NAT geometry helpers (NAT_ENTRY_PER_BLOCK,
> NAT_BLOCK_OFFSET, f2fs_start_nid, NAT_BLK_CNT, and
> f2fs_nat_bitmap_size) with sbi. Update call sites across node management,
> checkpointing, GC, and sysfs.
> 
> This is a layout-only change without behavioral differences for 4KB
> blocks.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
