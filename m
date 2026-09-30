Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C835C6AF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755318; cv=none; b=A33lLlMEvGDXGX0me0HrcMRZBMv4vFysWXU4sIyET1Z/Ni+09RP+flbEj4Yu8V+dwSSe+51fyCITVIqCg/eL3LLbe/Q/YICHjOC7+4Jquf1391r8Fhih7jsBB22FpzAi35gb1DgGLiReI5Xazxd9I0APAc4laOb/qYu+vbqrlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755318; c=relaxed/simple;
	bh=HaDRU5apZLH2XZn6ZKv3bhFE8CWY5TqPcghxiblRyLk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Iam1Ls71z4XEP9+lx63jMZQj8NwT5WibSn1fD6suU5WbYBl5jSQBL6yHJSszfyCSiitxAuaGTQyQgBcWAQsUJRMx1iqEAr2Vkb/Jb+lmZ6cB5ef02aNfm+jDyv7FxS5YKvwEDSvUN008uJtVVTexEHy3T3YQDBkWoF/GkvvPSg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdhSLPfD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdhSLPfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFBF1F000FF;
	Wed, 30 Sep 2026 08:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790755316;
	bh=mdcJAQl+W8tBL1aeydL1oDL5UIGU1+BTd8hClzUjYEQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=fdhSLPfDesTuRyS/RI8wThEM7xi6+mkmSKnRTywZy7NOoDrksGCqNcc+vbgNgaNA2
	 K5/aRtrcQjaqa9Cf4v8zh8POdjQV7VhlHsjSluS1DMgo8MQsBnqIbkhAie/aYmMuEh
	 8CNm+99yK+3+wDCH30LIcp9BelJ3XFv2YMqPvgLZoYZRKXIq3/73Ce0+ZdTajv9S9w
	 qwXpx2osUxuRO68pyfoD39lV7hZE2ScoRk2PGOmeMmk5GjS372Rif+jFG9QRE96Wdr
	 xgojF4uGTmpKxSkZBGUQFwxNn0LxYo9uSH+nLkeonWTB71yqIxhg4pR6LMlQ1TMgdR
	 3IMMJhUq7Pz2Q==
Message-ID: <c72042df-4b66-4cdd-bccb-5abd1e3b6da7@kernel.org>
Date: Wed, 30 Sep 2026 16:01:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Kelvin Zhang <zhangxp1998@gmail.com>, Daeho Jeong <daehojeong@google.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: quota: fix unused-label warning
To: Arnd Bergmann <arnd@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jianan Huang <jnhuang95@gmail.com>
References: <20260917142222.1591270-1-arnd@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260917142222.1591270-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 22:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added label causes a warning when QUOTA is turned off:
> 
> fs/f2fs/super.c: In function '__f2fs_remount':
> fs/f2fs/super.c:3142:1: error: label 'restore_holder' defined but not used [-Werror=unused-label]
>   3142 | restore_holder:
>        | ^~~~~~~~~~~~~~
> 
> Fixes: 3f140a60c92a ("f2fs: quota: fix stale lock holder on remount failure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
