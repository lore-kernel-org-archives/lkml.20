Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390152;
	b=RbcjY0KEnCLfHBsaIBOvzIOdce3lrfJ305D6YiVJIlbdeO31TbRLhlapn/he6QIsq2Um
	 1m02CeCSbEihFJkNdQ1y7Hh/0GcG0RZrXGbWHVfs0qCfbzshosjq1b7L1b8OtXKUbIy2p
	 +N3Z54r7ndN4V+UEFzopYydn5G4VS4JTp1Gij+VOgL+4qjJMcqj1dRr2jWyXwie/VhX6f
	 APol/jaE42FYLqk2iwQPTiZsvH9Mpos9IxQVEQuWwB9a1qAIkPaUqvo4OXFQDuYT6CcK/
	 gTUBlf33vsifKgrA2BF35YMfRryf/UODFJEjNdu5tv0JG3H40VsNuqtbXt4PE40T6Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390152;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+UXs3lHVlQsYdFZ0M6ic3j3lh1I9mB+CJLu6Q79BNGU=;
	b=FKMmCEOhwUtg7d+Q3/XbtZc9o7Q93HqmfP8T9zFGFpJleHDi1c0BINfmmE1qVIJGBGut
	 uhrCLY/ZnrhTS8L0/pnmaYEnK51ZaCcD+95HjN4yCv70sZE9zlURfnSaB1bWE104Vmd8l
	 bMo5JsX3jHvmFDRsaISzDQc2fLjIUdqo5FQ0DPXdTSKDttz4q9eg66Cgjh3A2Dzlb8Rxb
	 1p6AySNdlOPgLvjvxIR+rsLhpLzTKdggKFF/k2wYkU0b8S025TFo+IXY9HAiX6JS2s8IP
	 J2q3QA8huY/iKJrTjBo4vowWHQcSY//Rge3lkqBn55QfJuPZTcPYEIAIS/S3jmK3b0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYbwkVPQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B60606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYbwkVPQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552301F00A07;
	Wed, 11 Nov 2026 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794390152;
	bh=+UXs3lHVlQsYdFZ0M6ic3j3lh1I9mB+CJLu6Q79BNGU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=dYbwkVPQ4PpwEJ8bCBzaHbXiBh6++nCCd20jv0GNzamf5Y6RzbLZk3c4fkILl96CU
	 vsq3px58d5jXcQOU5ueifEXt5bGwEo0GF4m4Hv+U9ehRIb4B1qDrinq+XWLq6RHV0y
	 52DiSMOcCLtPEXVvQvpbVHkaCTGFrz7CADcsYjy5teyd8ixbZLYw5McZcEarM9pZ74
	 w+ewx2EYcsaHjK0fgZqK3CdkM+yjlGCGTl0mxlnECtxC+vmCAC/YrytzukORZx612E
	 l2G+Q5RolRDekLTZirB82apYZ0a0aw0V/eEl/S6rgJoAFzA8FXWz7j5mA6R+i53yxU
	 XrCy0xAH4a4mQ==
Message-ID: <64dfd4fe-46eb-45b5-9eb1-ab0564bc2d47@kernel.org>
Date: Wed, 11 Nov 2026 17:42:29 +0800
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
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: require CAP_SYS_ADMIN for fallocate on pinned files
To: Hungyu Lin <dennylin0707@gmail.com>, jaegeuk@kernel.org
References: <20261108075357.43331-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261108075357.43331-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/26 15:53, Hungyu Lin wrote:
> fallocate() on a pinned file allocates blocks without zeroing them, so
> reading the file returns whatever the blocks held before.
> Documentation/filesystems/f2fs.rst describes this as "zero or random
> data". Commit cad3836f9eb2 ("f2fs: allocate blocks for pinned file")
> added this while F2FS_IOC_SET_PIN_FILE required CAP_SYS_ADMIN, but
> commit b13bdf03bb80 ("f2fs: allow all the users to pin a file") then let
> any user pin a file. Since then any user can create a file, pin it,
> fallocate() it and read back data of files that other users have
> deleted.

Android should be safe, as on-disk data from user is encrypted, it will be
decrypted only in memory w/ user's crypto key, there is no way to read the
plain data from disk directly.

> 
> Require CAP_SYS_ADMIN for fallocate() on a pinned file. The documented
> use of these blocks needs write access to the block device anyway, and
> Android's gsid, which creates pinned image files through libfiemap, has
> CAP_SYS_ADMIN. Users without CAP_SYS_ADMIN can still pin files, but can
> no longer preallocate blocks for them. fallocate() on files that are not
> pinned is not affected.

Or maybe we can call f2fs_secure_erase() on the blkaddr range after
preallocation and before return from fallocate().

> 
> Fixes: b13bdf03bb80 ("f2fs: allow all the users to pin a file")

Jaegeuk, do we suffer any permission issue before above commit?

Thanks,

> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/f2fs/file.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e2c0f5083313..d1b52b41a1eb 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1973,6 +1973,9 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>  	block_t expanded = 0;
>  	int err;
>  
> +	if (f2fs_is_pinned_file(inode) && !capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
>  	err = inode_newsize_ok(inode, (len + offset));
>  	if (err)
>  		return err;

