Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D122765DF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919700; cv=none; b=Yrf8WRPptwkhBmpA14VkqVJDrr8+AdoLfywwAfHWzTdQznp5Q7KG389pi1RP4Nfsgsedi91idc6+VPrE2y4+zl3aTvhnJH06cDUzVtVBtUVRsmVt1jnGynHVBoO5xJ55qzeiuom0Ln7CEUricMBES/OHzedN7F9wOeqgOavHxqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919700; c=relaxed/simple;
	bh=MmfvCyFQfwDw69Jh5cOPPX5Qz5hD0QVgapHxaz6GMb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLbrE99jBlMfSMqI1cZgce0BTTDrmAXViZG59o0Jwwr+BW6uxOliwmUynRabTICxp76A+ggfuXi6DY4zn3csl/aDrlL+OXR3DupGufbZMuw4iNJNIm/8rRj1Z/7HYxnwRIjdyvIO7nyjhcBS8xSMKMjTwe6qeNXEq16IUrULIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=hHCDXTYG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="hHCDXTYG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1787919324;
	bh=MmfvCyFQfwDw69Jh5cOPPX5Qz5hD0QVgapHxaz6GMb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHCDXTYGSnKoF7T+RPbpxcPFF/66zW5740cVsrkxZ2xI9bd1MFHjsSb3L6rjGLPZ5
	 +FhHb2JNKsZaG7MB2HarfEI7U0ZZd2mtCmcUl5S8hBZq2KCjtmEDEO8RMb+bWz7Ht1
	 4BmaNYR9AUcR+yztf+Xxtfu4gJaVc7HJpAyO/MBY=
Date: Fri, 28 Aug 2026 14:15:23 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: Add dirfd()
Message-ID: <e201e5d8-b3cf-44a4-a1ce-a578ec9d9aec@t-8ch.de>
References: <20260828112204.104111-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828112204.104111-1-daniel@thingy.jp>

On 2026-08-28 20:22:04+0900, Daniel Palmer wrote:
> This is useful for things like fstatat() on children of directory
> opened with opendir().
> 
> At the same time use it to replace the two places that are converting
> the DIR point back into an fd.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/include/nolibc/dirent.h | 38 +++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/nolibc/dirent.h b/tools/include/nolibc/dirent.h
> index 4e02ef25e72d..ba229b215a0b 100644
> --- a/tools/include/nolibc/dirent.h
> +++ b/tools/include/nolibc/dirent.h
> @@ -27,6 +27,18 @@ typedef struct {
>  	char dummy[1];
>  } DIR;
>  
> +/* Internal dirfd() that does not set errno */
> +static __attribute__((unused))
> +int nolibc_dirfd(DIR *dirp)

This pollutes the applications symbol namespace.
It should begin with underscores.
But IMO we could also just keep it inlined in the two users.

> +{
> +	intptr_t i = (intptr_t)dirp;
> +
> +	if (i >= 0)
> +		return -1;
> +
> +	return ~i;
> +}

Could you also add a test for an fdopendir() -> dirfd() roundtrip?


Thomas
