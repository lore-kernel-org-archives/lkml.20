Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85041A569
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360219; cv=none; b=are+X3nyKUEZMncZV0B4/oXCVua2ys1HftJackycRm9IRaY3OT6uNishkuO4T3IxJzjSzoJcDVvTBsrEe2R9bo9WHS9sxCpPrZlhxFghr1xACox+C43PFqC7fmU6u3FWUhSQ5VSQITRqWCDK2xSOr67saD5YX/B5pW9QhPPyGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360219; c=relaxed/simple;
	bh=0gIS1iiHEyB6oqPBxbXvlr4pEn10Q3OtEUdyf4PWS+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ayua+OU8QVf1QP5Sc+XFCwZR9kLWeVWlgc+qpx52NHb7cpz8A2Rc2L1OCahcVWLZihBBxb0DE+oFmjZZsNzVvdWDgNSKllRmWsNn9NxiM21jXDLh2jHFva/8Sxv+0P7WRTxTtRaNBIhPMnfV2vUy9SVgPJMwe5tleeqiNqe2qec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QSFR74ZE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QSFR74ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1791360204;
	bh=0gIS1iiHEyB6oqPBxbXvlr4pEn10Q3OtEUdyf4PWS+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSFR74ZEKaiFQ6cDylF0etbIOFYoQlRKikToCbGAAVGTyXH+e0xc2uAMw7IigoXhr
	 yT/XmHua05ZrUrGNGCP1TKW/c8VfHtR7FX3+ZxxJud54nvQIIaQWrUrY9N1aqDxvwx
	 uN6cORKrFHIDNFGeavWITgznlL13DFtpk6EvDCYk=
Date: Wed, 7 Oct 2026 10:03:22 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/nolibc: Add dirfd()
Message-ID: <770e16b1-d52b-4b66-8773-9657f20c1a76@t-8ch.de>
References: <20261007052914.888956-1-daniel@thingy.jp>
 <20261007052914.888956-2-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007052914.888956-2-daniel@thingy.jp>

On 2026-10-07 14:29:12+0900, Daniel Palmer wrote:
> This is useful for things like fstatat() on children of a directory
> opened with opendir().
> 
> At the same time use the new internal helper to replace the two places
> that are converting the DIR pointer back into an fd.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/include/nolibc/dirent.h | 38 +++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
> index 4e02ef25e72d..d282ea8eb5d3 100644
> --- a/tools/include/nolibc/dirent.h
> +++ b/tools/include/nolibc/dirent.h
> @@ -27,6 +27,18 @@ typedef struct {
>  	char dummy[1];
>  } DIR;
>  
> +/* Internal dirfd() that does not set errno */
> +static __attribute__((unused))
> +int __nolibc_dirfd(DIR *dirp)
> +{
> +	intptr_t i = (intptr_t)dirp;
> +
> +	if (i >= 0)
> +		return -1;
> +
> +	return ~i;
> +}

I'm fine with keeping __nolibc_dirfd(), but the diffs would be nicer if
it was introduced in a dedicated commit.

> +
>  static __attribute__((unused))
>  DIR *fdopendir(int fd)
>  {
> @@ -49,15 +61,27 @@ DIR *opendir(const char *name)
>  }
>  
>  static __attribute__((unused))
> -int closedir(DIR *dirp)
> +int dirfd(DIR *dirp)
>  {
> -	intptr_t i = (intptr_t)dirp;
> +	int fd = __nolibc_dirfd(dirp);
>  
> -	if (i >= 0) {
> +	if (fd < 0) {
>  		SET_ERRNO(EBADF);
>  		return -1;
>  	}
> -	return close(~i);
> +
> +	return fd;
> +}

(...)
