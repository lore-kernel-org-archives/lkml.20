Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2453BD241
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697835; cv=none; b=sZiNuFp7rf7Q5x9NPmORacMF2kEdZg93KQOlcnK/kBDuETWmA8rmrXO9OWaXgp/6HxNlzV70Zs6Ba7gAl8mGh7akM0y1Jyi+KW5qxtFLwFybTGjfKVCcREg0oOJLLpKqyy/fppZw73ALMrovrBnMzDemB7EbI0dxRjFnakJRkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697835; c=relaxed/simple;
	bh=M2nHyuU5gdjrLDzh7U/zR+Ad+9B3Xrf0Jwhj6DusBHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCzCdZtps15Aky3ohRloUWkfDwSpzAbkeSpOeXdB4d2bEmqBeyFg8oDEmreDGkHqq7FrojXalNKqECu7N33Dwmv4Re4dJUZsubRKtGgj/Ki03QVmxPQTYmJJ0IDwfv3Y695Usf+a8IBE7qZWqizkNYWjMU4HsfbwEU+uHzNvFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCjz828T; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCjz828T"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso186862a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789697827; x=1790302627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vW0Y3swTiioWAd7nzTHn4G51gEl3jxVd3j9M10H0xqA=;
        b=YCjz828TUeqR1Z6rjvuVzUt+SkLJueTzJOThp/H3drE9wIjTsLOVrOSyVuxjBSmkIT
         9kWP7hX0g77NNR6jjp/TFdDmxTuEdM4D4y46G5IBAonMk8SzepVCO9/hiPtj4BiA2oRu
         Vb+nUWUYKmpl3wpjy6UoNabsJVrnzaCwZWvKFP3h6oRKfOeJecYXR9OxM3NmxLTntMLN
         bZrzBEbSrvz2+OR5S4hTRHrkBeNngwAdeTxKkvXOR+YQHCkL9VHWZkUWtN00/ak4Rbjc
         ugKreYOTpL6Wbc7L02T4oBOgmyN2ckRAE4buJ6y/mxjmH/i5HWlh27zPi2QJim1ACfg3
         qOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789697827; x=1790302627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vW0Y3swTiioWAd7nzTHn4G51gEl3jxVd3j9M10H0xqA=;
        b=oCDNmbJtSxhiH9CGxVlCC1Oxzzuk/KeAt4Ij3uD0nYOpmal/hOl5Ejsg5ZuKy8r52w
         GtAmTkoRJ0SmRohHk/WhRWIv3XfgMv0QFOLIBFZHoWFnFJZAdcyqLrOUnDZSYdWDOV7T
         XDPiotyP9J5EOo53RdHYYhFC+aWPW5sx9/fdKjoM8PijkNn9kk5LeTlAR5gMWT5Z3eGC
         uaTIjykArPUuC9kEarNu2QocoivUY1B3vW4OQaZaUSmjtEHmz8BML1i2bXa1pemm5dlE
         KHV9Mymqhsq8yiAinvzj053Jibnmjf2EEM040pHm+mQcyEs5nd0v6cF72mMmG32OjeEa
         dKwg==
X-Forwarded-Encrypted: i=1; AKwUvBxBibvvuzMyLBtolMYCDhOViMRvxt+1FHDeMbpPutw29iuH7u0t5hvVHxkmGEgd56WOtNJO9P4l5Kc4i1s=@vger.kernel.org
X-Gm-Message-State: AFuF++kZBDLWPVwvgMy6ecPF4QOK+Q2oxqWRLcmaSaYhwHcM7p/0LWws
	wFECGw2ecQNg4W7elydW8TYM0RkIyaCr5jr0g872YJZgXDjsohGJfFcx
X-Gm-Gg: AYBFou2EnC+mlcqIha4NUnb9SRyBcC8FH/XlSgz3COP2X/LSDGkfP9hHVr5PSasvPVA
	5GKakNcV8IjQ0FC5cHozVQc+cSjDN8YkVouqT2FgOjk/+VcQU/Eh3o7mZypSvp+Ti0m/DDIHi3o
	g02aGRILIp/Qyb2xeg6crss22rqWQljan5qsL9uilPM72XvS9JsyQp2poJicf4nFhiZ5Qy9/CU2
	bPgtWm/Ii08K5uROWjEKFFDpuD1zupIVZCqbIlUM45wFh0eJYnT+Yile7pAn2dt01wx3mhYrikZ
	Q/N981JeR9A9A7/i+OuweeG0jgEp6QRyjsIUglUWxTVPE83UDiWOb3PO0aqfnTqs2hM9t68SpB5
	pDGjDEhbUd29cl9YqR9eOmLPo8Hf69FIpMkGFVML57BCT7jdNI+yY1JCxoyFIvwpMK1cJcGDpJq
	RNtr4aZBTiQ5AzDziWb+McLY/vyl2sUroEKaCk012nIa6Lz8zKYAY5+Ad2jEUCnIM9IhbrRMNa/
	xjbpPIB81PC7s/n5XlF
X-Received: by 2002:a17:90a:d443:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e54f9c08bmr2061562a91.21.1789697827210;
        Thu, 17 Sep 2026 19:17:07 -0700 (PDT)
Received: from kernel ([103.219.206.124])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfc2346sm715786c88.4.2026.09.17.19.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:17:06 -0700 (PDT)
Date: Fri, 18 Sep 2026 07:47:00 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: clabbe@baylibre.com, davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, jkoolstra@xs4all.nl, lkp@intel.com
Subject: Re: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Message-ID: <aqyfHB1xBWFSvOl9@kernel>
References: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
 <aqpmOzURNFOm78ls@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpmOzURNFOm78ls@gondor.apana.org.au>

On Wed, Sep 16, 2026 at 07:49:47PM +1000, Herbert Xu wrote:
> On Tue, Sep 01, 2026 at 08:12:52AM +0530, Mohamad Raizudeen wrote:
> > The driver currently gets the core clock and manually enables it using
> > clk_prepare_enable(). This requires matching calls to
> > clk_disable_unprepare() in the error paths and remove function.
> > 
> > Switch to devm_clk_get_enabled() instead. This lets the kernel handle
> > enabling and disabling the clock automatically, which allow us to drop
> > the manual cleanup code and keeps the probe function simple.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> > Changes in v2:
> > - Dropped the devm_crypto_engine_alloc_init() change due to build
> >   failure reported by the kernel test robot.
> > - Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
> >   this patch.
> > - Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u
> > 
> >  drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
> >  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> Please take a look at
> 
> https://sashiko.dev/#/patchset/20260901024302.5407-1-raizudeen.kerneldev%40gmail.com
> 
> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Hi,
Thank you for pointing me to the sashiko review. I have addressed those
issues and a couple of other bugs the bot found in v3 and sent the v4
here: https://lore.kernel.org/all/20260916174227.5581-1-raizudeen.kerneldev@gmail.com/

Thanks,
Mohamad Raizudeen
