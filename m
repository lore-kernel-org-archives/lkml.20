Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21C49E5DE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969637; cv=none; b=LzePUirz3bw5E36FFkkKtK7CJcpxcZMnAdWvdXHVRcHuhjNuKF3YPlRJKHVfDvw1dQqVOrEBUMkrU6xi4Assa1Cjeo5mpzaKeHOvtuZwrixel2M86w5rUQeVUOMeWmqfhi0qfUEDgPl3ObSqoonLrtjcz/wIlnj7CnlVpGCBssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969637; c=relaxed/simple;
	bh=bYHEVBkKQnYVLO4KkOmRIOXrhGgsx9k9F3MlGOD9wQc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HNeE4N/DnpxQQNQWkq7K3d5JUUjAW92aZ0EicQVrkm4urW2BsffTyPduR6yYmgMTZYJsm5M3ovVVmElsuIQ2hWL9m3xJey+IFdBPwwKdT3CgYx/uX6VRN8LCjtckYMYTfreW0bAyV7aAhf/bZQppbiwb6YJWGzCMWqBg/T1Jglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyNtmhJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyNtmhJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A3F1F000FF;
	Wed, 14 Oct 2026 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791969636;
	bh=kGHGHp6QNa0VgAuTAZKA8hMvVARdIUWRZNdMkI4zE9w=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=WyNtmhJ1kvaMlhpaLWGRuGs/8S88Nzc5h2hQzkYELHdkrO5Ka0RI/68uUete9zxWI
	 kZPdy9to4Oea/Fm6SB5pLQ1AXAjF/2u8L10RAkZ05CtBm8yBbcVbpF3vi8IUMyiO75
	 jURreAiQ0ydw53a0iVxhWNFyzvDvflX441dC2DbKSpAqoB20/yYTCddzIx/lQt2Rds
	 8nu5PhzYLtyh2Ej0L1qT9jr0TbKJvZ93TU+Luzi6OFftolE91AAgFhnZ447hZemAfd
	 Hbji1vKoqTseZYtoXjwaih1Pi8w7871fzSM9p6pZN5GhUa0sf+Qh8xB7gkzSo+flEY
	 GTlxLUgM23qlg==
Message-ID: <9acd8294-bc37-4053-b411-abeb455d11cb@kernel.org>
Date: Wed, 14 Oct 2026 17:20:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: return -EIO for a lost inode block after
 cp_error
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261012182233.2685282-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261012182233.2685282-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 02:22, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> After cp_error, dirty node caches are dropped without being written.
> If such an inode was never written, its NAT entry is still NEW_ADDR,
> and reading its inode block returns -ENOENT.
> 
> f2fs_get_dnode_of_data() passes that -ENOENT up, and callers take it
> as a hole. Since the inode block is missing, the next offset can only
> advance one block, so fiemap walks block by block up to maxbytes,
> about 2^30 blocks, while holding the inode lock. It took hours in a
> power-off recovery test after shutdown and blocked unlink and umount
> on the file.
> 
> Return -EIO instead of -ENOENT when the inode block itself is missing
> after cp_error or shutdown. A missing direct or indirect node is still
> reported as -ENOENT.
> 

Cc: stable@kernel.org
Fixes: 28607bf3aa6f ("f2fs: drop dirty node pages when cp is in error status")

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
