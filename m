Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B72483BF6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594384; cv=none; b=d5pBGI5TJ6KgKbWzI0pYIT+ryxFp8m5JL6BbJzjixtVrg7La7qeFddwrRI4+Us9wyTVS9Wd6vG4Dnw/w7Q6mwRrSLv4sixn/RBYvmQxuO/1PfXAkjJ7kpcQWeUk4ElQe+wsI+vuFJvLTj4h+TASt0JqEElWnXlePCe93CzzvePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594384; c=relaxed/simple;
	bh=17rMwzyZvMupJpY+qw4G+Rdf9lfg49Qchc+3qTXZaPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHqMpeb6SmOGOMNuXY32COTsSFDc+0DkjLnRlKFC4QNMifYi5cbx9EEw0KN/FlC4Lnud49i2NJ33gPP2rDTqqghh50N68SqxP6VrCnCSA5e/9ANochqrgNfksydWWPjtx6XArKb26nFba8muZpOv1DdSI8i6hWE2DWm0HHv+8bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f73SiSnZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f73SiSnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CC31F000FF;
	Wed, 16 Sep 2026 21:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789594375;
	bh=UPrxWso2jS9frylLdy0Jy0Nxd5S7abxn3XuSWz2Dy0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f73SiSnZRvVZuvo0fToEh5hdb+xgrmJGCGftS9N89GzwsCH8RnZjAmDsHqQlVIn7+
	 E/sMajFArESRXECSJnosiIgeAZ7aKIRKrx635U9PFfrCAz8yTPic9zjkiNSsNHANhi
	 JZCbZTSSFb2Inze5+aJWbe3eoUO7qJ+fYHh2aFGSYabUwgi6N2hfpHarPp/Jkno6bm
	 TCsI8nkiTEhdNpLZt+U4GRmD4cL9312J2O7L+EG3HSa6wDJdl+DlodxfNBdAmBQzya
	 s0VeHVCjyGpPg4Wc0o43jnGuXdKqxE86BMF6mkLYxp5syhuFFgkl3QA2x45wk0l1lM
	 lF7cso8ylVBmw==
Date: Wed, 16 Sep 2026 23:32:50 +0200
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: fsl_rio: Use snprintf() in fsl_rio_setup()
Message-ID: <aqsLAuX8mHUe5ls2@kernel.org>
References: <20260630144951.692473-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630144951.692473-2-thorsten.blum@linux.dev>

On Tue, Jun 30, 2026 at 04:49:50PM +0200, Thorsten Blum wrote:
> While the current code works correctly, replace the unbounded sprintf()
> with the safer snprintf() in fsl_rio_setup() to follow secure coding
> best practices.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/powerpc/sysdev/fsl_rio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping?

> diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
> index eb55dabb4748..077c03cd93e4 100644
> --- a/arch/powerpc/sysdev/fsl_rio.c
> +++ b/arch/powerpc/sysdev/fsl_rio.c
> @@ -612,7 +612,7 @@ static int fsl_rio_setup(struct platform_device *dev)
>  				kfree(port);
>  				continue;
>  		}
> -		sprintf(port->name, "RIO mport %d", i);
> +		snprintf(port->name, sizeof(port->name), "RIO mport %d", i);
>  
>  		priv->dev = &dev->dev;
>  		port->dev.parent = &dev->dev;
