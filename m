Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50629B781
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486965; cv=none; b=J+JYyJ9aBv7l1L/tRMCx/D2YVyIXPzRem7A2iXwV8b+eGkiD6buw68CpGrAY0Dik1AGgaJ+M6AtQAZbATepfShy68AlO7MNKH9gHNI2MttdsEQBDGqNmHfslhnTJc3HRaV1qRJ5gSzvrdIA/XuM2esq0CjrFiGXR23Esu3pZSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486965; c=relaxed/simple;
	bh=bRXvSak7IyTMYzEzEYWjVO7TV9U5Tt9PbaxRxU4UUUc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RNorPeF3zE1M8ECPuUBUb+FCUtcfW1fRKbraQ3o/CanWqVNt82pb5/a9R3DEFiHK6ACtIKqUkv5RUaG0fGEvRdoPcnKOT5uIxajhWbzL0bLuW8fGuS7qjO4vW8hrel2l4/M5j8zZVq4PU9/j14DUKGH5szt8ARV1Yp/Ad2XBGC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrQyCcYW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrQyCcYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10FD1F000E9;
	Fri,  4 Sep 2026 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788486964;
	bh=Suo1Ecr1VzKsfn3mGXhGaibOPyeH7RYyKh+Q65B/hIc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=GrQyCcYWDgmZSb6m0HXIj1WPeg/f1R8mqKS5en+IBl3l2N3VTFLUUpXchRgNF4PG6
	 S1U+v0Tct3w4bTBINPXB12z8w+U90lXN4g08DBI3rmQrZNt4pHWW29/FzNxQw9Ryx0
	 B+XJXGdr5h8JKNcVkarJQncKaGyv1qJyfu85Jh/aCnArtdBQuKyW4bqhZmdZAGv5/F
	 hmu4+jtU/UdfKLN3ig3MGJRaCofFgCSMBSUoMsKWGMfu79SZzl6NtZt66gYxiZ0sff
	 xbvgZz6J3a2KpCjsfI/W6P4Da9a1yNajPGcyr5F5Pkld3JdT3ouA6D/LRP8ajiCNlh
	 Yn5nDecf6CdUA==
Message-ID: <d0293f62-e999-4339-8bd2-b321551825b1@kernel.org>
Date: Fri, 4 Sep 2026 09:56:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 04/11] f2fs: describe orphan block layout dynamically
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788479509.git.zhangxp1998@gmail.com>
 <99c37e861d74328fa6203c58284dc33505d326ad.1788479509.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <99c37e861d74328fa6203c58284dc33505d326ad.1788479509.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 07:56, Kelvin Zhang wrote:
> An on-disk orphan block contains a variable-length array of 32-bit
> inode numbers followed by a fixed footer at the end of the block. A
> compile-time whole-block structure cannot represent the footer position
> when the block size varies at runtime.
> 
> Remove struct f2fs_orphan_block, introduce
> struct f2fs_orphan_block_footer, and compute sbi->orphans_per_block
> dynamically in init_sb_info(). Add helpers to access the inode entry array
> and footer from a block buffer.
> 
> Update orphan inode recovery, checkpointing, and mount paths to use the
> parameterized helpers. This preserves the on-disk format while decoupling
> orphan handling from compile-time constants.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
