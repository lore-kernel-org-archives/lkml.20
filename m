Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858528;
	b=nUAo94HBfTQAbhEqK/BC4wwh+Qr+oL5fc1Av3bN3buHtp+3fqut6enWKljCiyR3/eHFj
	 E9qd5AADgXyGv5VEoACiiaBzhLKWIHUdADZxSbIwWIJmp/4vTyCPHccL+a5debJgEezOI
	 2+I4JBj1sm76Kah1V9wISfxGqPGvwpaa4xLHBoEmQlcIJm4SpTe9HSt8Jvd6y/YjkdKK8
	 oW6vXgcG2AutnIkn1uOkWMdlSlWubMmd/Zv2qI7foKIaqQhyT0EgzdSLDIXdMT2Dy1fiX
	 nN91c1ZWCgWBjlA4r8Hokwhn5fPv5LbJ5bE7jeSmkEeMRepVE/t5OJNWTotbO1FJQSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858528;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=agI9AZcjlcABwNXd8gSX+qg6fWruBT4JR3ByMj7fWQM=;
	b=vi6zpJKxRJP0jVqAkr55xjNJTPa/PCRDSksii60kpRf5usXXHAR5WmIqaIdE0ut0u1NM
	 DRIhLbmHDLYnUPLSLQuMGLq6NcnpeS2713jMej8OaXvW/JcH33IzhHVBSfJbwQqB7w4tC
	 VsRvilmP0GzsvCuZrlkJUytoM2yKg/1kVB0aNbvUw8KKZlArZ8plCX+/N1w9dYHmm6Qd8
	 oFHIpIcQO00E1W2PRR/M2uFtbGlpiDuP7Ui9fvaR5hMlI0/DeNIIwUOWmMhTUQkHEfM1B
	 gc2ZEgSa6nIjWZmngAeuCATkUMrDYXrvgc4xgSXQhO7GYi3UodFELvqTFLVwB3jHADw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWPTS1+t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B03606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWPTS1+t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696531F000C4;
	Mon, 16 Nov 2026 19:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794858527;
	bh=agI9AZcjlcABwNXd8gSX+qg6fWruBT4JR3ByMj7fWQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IWPTS1+tmPA+wbHrpEoNmkW2+4xuFyUqI8/tTVO0eHT5qiFzP0PyEPtB3qjTw7HNP
	 sgQw2F4mSNLR3uwu3YinlW0x1EQAGT3U+EY9iehi9XqdxsKjHUAb6v8T7U/wgOF3wT
	 rhnl05ZbIV0rscUno7cA8nlQ1sZwGLk8RwzhxF5Q6XG1VqttMKXdsG8f0oFFyTtoSZ
	 9Bpp5irCk7K/Cc+Bed1jmzDXp7tOeSqnh8EHV5h5poeLxmMEl4r6hbUst3dmr1VjZ0
	 QhqRsA6eoJSlJozWCF7BT73eyqA59dr5Y4DxW66xFHdc6YnV1RDuVUsQ5213YgikUD
	 sqfZvvWevmHnw==
Date: Mon, 16 Nov 2026 19:48:45 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, andrealmeid@igalia.com,
	qkrwngud825@gmail.com, zhanxusheng@xiaomi.com,
	Gabriel Krisman Bertazi <krisman@kernel.org>
Subject: Re: [RFC PATCH] f2fs: fold casefolded names of F2FS_NAME_LEN bytes
Message-ID: <20261116194845.GC229817@google.com>
References: <20261103030712.1514800-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103030712.1514800-1-zhanxusheng1024@gmail.com>

[ +Cc Gabriel, who maintains fs/unicode/ ]

On Tue, Nov 03, 2026 at 11:07:12AM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> utf8_casefold() needs room for the terminating NUL, but
> f2fs_init_casefolded_name() gives it only F2FS_NAME_LEN bytes, so a
> name that folds to exactly 255 bytes is not folded. In a casefolded
> directory, creating 'A' x 255 fails with EINVAL under utf8:strict.
> Without strict, after creating 'A' x 255, stat of 'a' x 255 returns
> ENOENT and creating it adds a second entry.
> 
> Fold into F2FS_NAME_LEN + 1 bytes. Existing entries for these names
> are hashed by the name as given, so on a miss also try that hash.
> 
> Fixes: 43c780ba2624 ("f2fs: rework filename handling")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> RFC because new entries for these names get a different hash on disk.
> Results in a VM, with dentries dropped before each stat:
> 
>                                  'A'x255  'a'x255  'C'x255  'c'x255
>   current kernel creates 'A'        ok    ENOENT
>   this patch creates 'C', 'c'       ok    ENOENT     ok       ok
>                                     (one 'c' entry)
>   back on the current kernel        ok    ENOENT   ENOENT   ENOENT
>   strict, current kernel        create 'S' x 255: EINVAL
>   strict, this patch            create ok, found in both cases
> 
> Each fsck.f2fs version matches only one side. 1.16 folds into PATH_MAX
> and rewrote 'A' to the folded hash, after which the current kernel
> cannot find it. The dev branch rewrote 'C' to the raw hash, after
> which this patch finds it only as 'C'. fsck would need to accept both
> hashes for these names. Encrypted directories are not tested.
> 
> Is the second lookup acceptable? The alternative is to keep hashing
> these names as given, which fixes the EINVAL but leaves them
> case-sensitive.

Sorry about this bug!

I think it's actually worse than you say, and this commit doesn't fix it
entirely.  A filename can "casefold" (really NFD canonical decomposition
+ Default_Ignorable_Code_Point stripping + full casefolding) to much
more than F2FS_NAME_LEN bytes.  The decomposition stage in particular
can result in significant expansion, up to 3 * F2FS_NAME_LEN.

For ASCII though it is indeed as you say: they cannot expand, and only
max-length filenames are affected due to the off-by-one caused by
utf8_casefold() unexpectedly including a NUL terminator.

I think this shows that the 'casefold' feature` isn't really used for
anything other than ASCII in practice, and all the complexity of Unicode
normalization wasn't needed in the first place...

But I suppose this should be fixed anyway.  The approach of this patch
should generally be okay if you increase the buffer to the required
'3 * F2FS_NAME_LEN + 1'.

However, please check the Sashiko comments
https://sashiko.dev/#/patchset/20261103030712.1514800-1-zhanxusheng1024%40gmail.com
as some issues were found with the implementation.

- Eric
