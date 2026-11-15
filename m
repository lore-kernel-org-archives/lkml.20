Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725252;
	b=5eLIG+5CiThcSFGWzgGQ+TK/j0DDxcqZlKDf6xGYpsAtG5faQfiFGWUOQ+Y5sHxqge3z
	 nwJKLg73p9lurQmuAFnOAkF+Bq5XyDM+TzDBcVnU2SKmiXLUHWqpSzOFFjv2AzBI6IzB5
	 Vlbd6gb9NAUVsWwqJXX0mcAocGx9aBJFwnlk7+1h5j7kg5eVuKudm2cEvO9D4hO67XZ9R
	 P2udf9ffMAMDX0LDIci3bgKYtrzdpD0aFIrCvKRpGLel9iUZxaWHppDpT90yw/mSZlBlb
	 nTj40d8x+yUnzwl2gJLlZCDcOTsbzHxQIPIPoeI5UmjbEmTAXChMmeH7sV7QVhCtLng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725252;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4HAjrXPrfcwf3DdVlXCgx9Lu6i3VT6EHbvwugPPf3CE=;
	b=TDL/u/LDs5PbctjYyUNE6r0YR5VTA97/TzMOdybeItRf8bZc9cUTfW9gJDYSu/HAoECg
	 z8pFUgwp82tPONseWpTt3To2RYheKWcQtCIQI8muQMH0jBE7NmFjToYdssfXoZClI8df4
	 UkhbUDdqcNGxkLdsgq3sYZOiVxwDKwq91bbUlzAtPhVNXQQ/+HPEwK0zgUXGcnKAkOIEu
	 DX/KhaYhnzHMg9GxMmVcReY0YA6qHX2inPv+BtzrkMaWte0GnIFtS1F/5Rmh1Gl9Hg0fI
	 P0hZINjFbyTnwCWzaduyGKZK9Y5aUoiB7iV8kwOCA+SA8f2ItA1k2tRq6oWgSHREN6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sga7+Ei7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFE606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sga7+Ei7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D2D1F000C4;
	Sun, 15 Nov 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794725252;
	bh=4HAjrXPrfcwf3DdVlXCgx9Lu6i3VT6EHbvwugPPf3CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sga7+Ei7O7GcefvdplYgPgdCXS4eUuASHq8ItMV8SMHKTChYHNl42sHVH22fN6Ypa
	 CnnDRlH6mQCP3hM54nm2kIlPRvhUMgENuhTfzPlzGVrXvlYo0tTB3FyVVGKmYVGYqI
	 q6jQGV3PQkUVICc96wIrNp+2WOYcxHyrX3j9y5N0q9VVVWpkgbyqX+BIfE4wCSSoqY
	 aySZ9VSne76rg8zpwT3iOxGPlBle09s5Us5LJcayoy7iCPthruyjoL7w+lQRTUka+6
	 Lf5gxus7i4mLsAPPQDxHWfqlx8iC3vyLyCFECTuaOOBTUYBkAx2Yo+qgl5hcFZ+aBE
	 tB/d8Q9CD4Rbw==
Date: Sun, 15 Nov 2026 08:47:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: Reject bare rodata parameter before architecture
 parsing
Message-ID: <avlVfiKASeue2HsY@kernel.org>
References: <20261113202321.91770-2-blum@kernel.org>
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
In-Reply-To: <20261113202321.91770-2-blum@kernel.org>

On Fri, Nov 13, 2026 at 09:23:19PM +0100, Thorsten Blum wrote:
> When a bare rodata parameter is specified on the kernel command line
> without the '=' separator, early parameter parsing passes NULL to
> set_debug_rodata().
> 
> Current hooks already handle NULL safely. Reject NULL before calling
> arch_parse_debug_rodata() so architecture hooks always receive a
> non-NULL string.
> 
> Return -EINVAL to report the malformed option instead of falling through
> to the existing warning. Also remove the now-redundant NULL checks from
> the "on" and "off" comparisons.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  init/main.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 7b0c8c34e6a9..768b65f2498f 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -1566,12 +1566,15 @@ static inline bool arch_parse_debug_rodata(char *str) { return false; }
>  
>  static int __init set_debug_rodata(char *str)
>  {
> +	if (!str)
> +		return -EINVAL;
> +
>  	if (arch_parse_debug_rodata(str))
>  		return 0;
>  
> -	if (str && !strcmp(str, "on"))
> +	if (!strcmp(str, "on"))
>  		rodata_enabled = true;
> -	else if (str && !strcmp(str, "off"))
> +	else if (!strcmp(str, "off"))
>  		rodata_enabled = false;
>  	else
>  		pr_warn("Invalid option string for rodata: '%s'\n", str);

-- 
Sincerely yours,
Mike.
