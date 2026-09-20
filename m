Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64E1A5B8C;
	Sun, 20 Sep 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921913; cv=none; b=ouokiGh80RtADRmh3NjGPuLRRwGvYhvqXQjwD2C8pyshrxiFcx/qVw5fm/tAYTxpEw08eMZxxAheUiiRVX0qU+ldrewSuTYCL77VMqLpK4V2n6/1mNFDjmp12MgdVB2KwBZLI4LckY6M2Z3sGZvtcYkbHhAOoDsNmQk3WryMxNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921913; c=relaxed/simple;
	bh=4AKHkU+yWRL6jRN9ZZUMq5XDDr2VBRHd7b+YAduOazo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2hvg5uobMLJs8wjd5Lkp4UzumofyEjXCU3w4DlzkrqInLJ89ACj08fQw86ZMhmtZJ98o5skRMjoA9C1Zj0zXcMrOyTwVkzgG4qsL0HT2xpAri8RzrXXR8TfO1IcxYfBmkBTcrtyOOaMXRjHhSPt5JguJTpTBuHmoENNFKaQ8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 1BB407189CBB; Sun, 20 Sep 2026 18:31:49 +0200 (CEST)
Date: Sun, 20 Sep 2026 18:31:49 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, Kees Cook <kees@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Remove regmap_config struct from allocated data
Message-ID: <arAKdVU9CVeNMu-c@desktop>
References: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

Is there any interest in this series?  I know it doesn’t improve much,
but it should be easy enough to review.

On Tue, Aug 04, 2026 at 01:46:20PM +0200, Link Mauve wrote:
> This is a follow-up for eeafd9e12144fb6249e1510f9db8a4aaf8155a0a, after
> which I found a bunch of regmap_config structs defined inside of other
> structs, even though they either completely static (in which case I put
> them in .rodata), or needed only a single dynamic argument (in which
> case I put them on the stack of the function using it).
> 
> I found only these three instances in the media subsystem, which removes
> 192 bytes from the allocation of each of these driver instances.
> 
> Link Mauve (3):
>   media: rtl2832: make regmap_config static const
>   media: m88ds3103: make regmap_config static const
>   media: ts2020: put regmap_config on the stack
> 
>  drivers/media/dvb-frontends/m88ds3103.c      |  9 +++++----
>  drivers/media/dvb-frontends/m88ds3103_priv.h |  1 -
>  drivers/media/dvb-frontends/rtl2832.c        | 18 ++++++++++--------
>  drivers/media/dvb-frontends/rtl2832_priv.h   |  1 -
>  drivers/media/dvb-frontends/ts2020.c         | 15 ++++++++-------
>  5 files changed, 23 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
> -- 
> 2.55.0
> 

-- 
Link Mauve
