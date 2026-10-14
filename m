Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476937CD2C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959459; cv=none; b=dvuDyuRHokAJNEDyjj69jYJ0ZqGLx9G6IlTwpObW08fgzRt5y6VwOSVmrJFp/Mka/ioZG/o7anABlBqmbIyBp+3GXLMLFBtY5OhydUTmmDBNWJ4NM3SZqZ6c7EexNiSWobP7LOzx9nd+Fe9PxQGSgxQtDpTJVEYhaeVn1dlt1uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959459; c=relaxed/simple;
	bh=rAqJBY8dv5+WMP3CBfvKTe8EJH3Fbbv74cbOG+BQnvc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A9YeYy+dozv9pRFaJH4+QGouxNI1FI7vPFaK0NYFsB5FrQ4fsCBcO366nL1COvOcFpYBKn50+wGzKVkMvwkigjs144l7ECbZlaT71KiG1KnoqDYHZ5h4gutbnmEl93wBgI1Z9hyqaMYz3nSGq8cKIDAKXblDLQMTtxLKNbzQBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPgp40P3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPgp40P3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE71F1F000FF;
	Wed, 14 Oct 2026 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791959458;
	bh=rAqJBY8dv5+WMP3CBfvKTe8EJH3Fbbv74cbOG+BQnvc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=TPgp40P3n/o2tfHr/KQ3IaoR5s3Bsi2GjmugWz9MjAp9qcM/qZ3mR9iSkh3MTMwji
	 HsCp/nDA+8bqHKpNQ/dUepGTwqec2Y3XICiMS5Fjy9IF+3Ts2qXS3u/f4dKYS2AT/f
	 UZtduNTiJkHbV4egLYb7QhTvVK/+gPOpySvxGdgEJwUL6iit8U1zsolEiTJuEvSC+Y
	 kAqxhYCsxdMPwcnkST2mY2g+oFvBn5F33F7mvhMzKo1q6HBrwhkSqbCbTxAVWgcvLd
	 M43GinIwAyaeZRmS+R/1x5oexZZAAOLTS0snN2u2IXwN9ER1xGnLUOeKM2SMhwCLHt
	 AO48c61WIV3JA==
Message-ID: <24e13ed7-d1d3-4c3c-ae3e-8734c519b87e@kernel.org>
Date: Wed, 14 Oct 2026 14:30:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: erofs: add dev branch to git tree entry
To: xiang@kernel.org
References: <20261010070623.1766952-1-chao@kernel.org>
 <asqt-vM6LOPyqz_p@XiangdeMacBook-Pro.local>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <asqt-vM6LOPyqz_p@XiangdeMacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/26 05:28, Gao Xiang wrote:
> BTW, could we request sashiko folks adding erofs mailing list
> to their review list as well?
Done, FYI, it mutes by default, so we need to check review comment in
UI(sashiko.dev) by ourself, let me know if you want receiving review
emails whenever there is result.

https://sashiko.dev/#/?list=org.ozlabs.lists.linux-erofs

Thanks,
