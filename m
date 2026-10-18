Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67143F8B6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323676; cv=none; b=OGhMW6UfTp4Imkd91e1qPEVqNpi0Van81Y8pV3zquotW2IIrUAheF7iVeERca/k1SEIKBN1qh7f04ZaGkHQaFzQpnaEJpPbXDSuaMCRcnlJG7pTSWjQWt8vT+t9WzdeVGjBoLIC/WpqZRcn7CEEH80SC0CWQZ70WxijmPouSFkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323676; c=relaxed/simple;
	bh=41jZF0FhRZvxgRg4A8KoMKXC0gkjAiETiNceCeHp4gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K34KiwuSPi9M6Muvl6r3nMUh597hInnD0qEkRcRbFHTLv0ccMbc5MgJPWZOZznZ8GYoZzDE9uezHVK0t8cdlZApbq8r83uYv1S00cB+tw9/rZy/UHa04UfrVAnxOinVqBdjBnaBkUSIlHDvWQQMeILSK0dcTkWhVb/cMsSqDJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=cXgYvDIC; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="cXgYvDIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792323671;
	bh=41jZF0FhRZvxgRg4A8KoMKXC0gkjAiETiNceCeHp4gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXgYvDICv/LaLhpT209gxk1h6KkbzFKd2AiRC7T37O3yBBJeiO4YCzeXz0gTFnVp7
	 NxuQA/zx0dem4r7X0LfQW0nUjXEjXR+FzUbKczU7ZY/bUG7jVP6vEmv2gdpkQlFZ84
	 dpz9RvKG8cCFA4l4DTR7kYSrdsJVYuYseLA8cqtY=
Date: Sun, 18 Oct 2026 13:41:11 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: Fix WIFSIGNALED(0)
Message-ID: <dc1db82f-1f48-4742-99d1-1231f64a0ece@t-8ch.de>
References: <20261018105341.243797-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018105341.243797-1-daniel@thingy.jp>

Hi Daniel,

On 2026-10-18 19:53:41+0900, Daniel Palmer wrote:
> WIFSIGNALED(0) currently returns true, so a process that exited
> normally with status 0 looks like it was killed by a signal.
> 
> The macro uses a trick of checking whether status - 1 is below
> 0xff but is subtly broken because of using signed arithmetic.
> For 0 it computes -1 < 0xff which is true.
> 
> Do what musl does: mask the status to 16 bits and use unsigned
> arithmetic so 0 wraps to 0xffff and the comparison fails.
> The mask also prevents bits we don't care about from sneaking in.

We already have commit 368fae47c6ca ("tools/nolibc: fix WIFSIGNALED()
for status 0") for this issue in nolibc-next. This implementation is
masking the status with 0xffff. OTOH the musl implementation of
WIFCONTINUED() is also missing the masking, so I am not sure how
necessary it is.

I'll look into it some more.

> Fixes: 8c934d4822c7 ("tools/nolibc: add helpers for wait() signal exits")
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
> 
> I'm putting off sending anything else (dirfd and some other bits)
> until after the merge window has finished.. but this one seems like
> it should be fixed sooner.

Feel free to send the patches already. We won't apply them until after
the merge window, but we can discuss them before. There are no other
trees with changes to nolibc, so there won't be any conflicts.

> I found this while debugging an annoying issue in my homebrew nolibc
> based shell.
> 
>  tools/include/nolibc/types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> index 8f3cb18df7f1..d241629b9e67 100644
> --- a/tools/include/nolibc/types.h
> +++ b/tools/include/nolibc/types.h
> @@ -119,7 +119,7 @@ struct timeval {
>  #define WEXITSTATUS(status) (((status) & 0xff00) >> 8)
>  #define WIFEXITED(status)   (((status) & 0x7f) == 0)
>  #define WTERMSIG(status)    ((status) & 0x7f)
> -#define WIFSIGNALED(status) ((status) - 1 < 0xff)
> +#define WIFSIGNALED(status) (((status) & 0xffff) - 1U < 0xffU)
>  
>  /* standard exit() codes */
>  #define EXIT_SUCCESS 0
> -- 
> 2.53.0
> 
