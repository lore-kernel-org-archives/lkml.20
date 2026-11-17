Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905636;
	b=CDA35UlXoFqcOB+lJVCty+U8Mxkh0/4LCgAgszVNHUKSwckAL/BnzCY6rkZDdJ5zZpJq
	 aTx88dlU7J9JekezKS3lT+YJItrm0eV2YOghJOx2/FQRwuqOKBAQfyQT3tCSTsUlvV/cz
	 PIR27ONyTVJToZd5SYA6t+J8kpekQtUoifrcRj6GCQuDEx5Epg8SJDN/yuzSDPc3RV6uY
	 j9zF3ssfZwS5JFbbbnDIBebt7p8T7vWTpEMgxn2Z2CRGtDkTiG050m/rmXtYDYlarYitg
	 JI9wAV+XDVLF3C/0r+WPta6n7exVLQWyOIrNR0T0eQsXSDuYG17YdPibwJ5WYnCnRJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905636;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MYMcAvLXgBNRr3ToebNzzBHthrdB8UJbnFEfoZi2/Oc=;
	b=MEFDyNPzJ5JPqC7fTuIZN05DtRyGoPnjxoCFw57HBlGyiKaLlRlzoVx2K8n5tPT3KF8q
	 zuyLkdA6nk0DuCYLfNJZqEJY84MtxVZuVJoGYyyVnlPgk9uvANtIABc3l3hFFfCEaV7Ec
	 zP6P60Lh/MbqiEK0FbE0ehscrAbJ7Hr2ctTfuhN6uuQcVpcjpF0oJZtFrvCcjDk61r3lp
	 iYPzIMutBOjGRVfHQocS5sFHmYBFCJ1wQQdLAvL6zuKH/Bp2bSwoezZEY1alJT4X1cFjk
	 bqf8z6EqB2tkFIOXjT6dgMpJAiCY8Nt3eUb1+hBz+qkpUtm9jSDDjyJC7TiPpIrOd7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J90+nQK3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201A606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J90+nQK3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EEE1F000C4;
	Tue, 17 Nov 2026 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905636;
	bh=MYMcAvLXgBNRr3ToebNzzBHthrdB8UJbnFEfoZi2/Oc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=J90+nQK3EyaZyYqUAMBFiYitdUn24Z8yQXniMq3fzR2c8RYh0ForcOzSwUQwtzaA5
	 GxMKQb2ZDxCO8Cqaj0BsB0msRXenLtNfolrUw5SsjjmPWZYXkLrXey0yeUXga8SPs8
	 P8a6D8pmPLtDhKMVxrywQWDa65qwGQwtz112frOW+DuxvCRV7hEVoCzbFVR82OluJj
	 Ina534qmoIKGBylJkt0MnhfsXw5wwQaTsEZ1aBw+6R9ueQywqOpFlSnsT2WsaFpvI7
	 uLaX7Wj3Bu7DaQ7EjRNJsi6xlQLYuBWIdntVFMpTeIH83caEuvwcH0/zOaKek6yJ/y
	 fOSc1oE/XtLdQ==
Message-ID: <c4100365-9d23-4702-8c1a-204927138738@kernel.org>
Date: Tue, 17 Nov 2026 16:53:53 +0800
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
Subject: Re: [f2fs-dev] [PATCH v2 02/20] f2fs: support subpage block size
 superblock and mount
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-3-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-3-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add the infrastructure to mount F2FS with a block size smaller than
> PAGE_SIZE, e.g. 4KB blocks on a 16KB page kernel.
> 
> - Add helpers to convert between block indices, folio indices and
>   offsets within a folio.
> - Take the block size from the 1st superblock, which is at the same
>   offset for every block size. If it is invalid, probe the 2nd
>   superblock with each supported block size from the smallest, and
>   stop at the first one found, even if it is invalid, so that a stale
>   superblock of a larger block size is not picked.
> - Allow log_blocksize up to PAGE_SHIFT, and write back only the target
>   superblock block instead of the whole folio.
> - Bound log_sectorsize by log_blocksize, so that
>   log_sectors_per_block + log_sectorsize cannot wrap around, and remove
>   F2FS_MAX_LOG_SECTOR_SIZE, which has no user left.
> - Check the requested inline_xattr_size, not the current one,
>   against the block size in f2fs_check_opt_consistency().
> - Keep rejecting subpage block sizes, and return -EOPNOTSUPP for the
>   features that do not support them yet. Later patches add the support
>   and lift these restrictions.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

