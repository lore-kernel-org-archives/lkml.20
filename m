Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014A137266D;
	Thu,  1 Oct 2026 05:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833116; cv=none; b=KA5bgjTKo5P0JeBN77TBe6Cs/ulYca+yjHzAbpQ7V2njwRHoMnvQilhe52eqAnuWBZBhTWOEMNwn+Nmb/feGmjvIOqGAhyefdBOTsCDzoq3tV8rOiKWUMmEVWJOyQL2otsvZs4265+gKcOntmNp3fyobgqNc1YU9RgUbedd0/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833116; c=relaxed/simple;
	bh=C+y4DRUjU/xUreJchll+Y+5d6tZhsSspyPvJ1e56sO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3Si2i2sPDAMovYgyeP8EMy3VMH/hQiq3+7z/khsm66DJ7FqrY2c/AIRioBr600j9YfdigmtkBgG8785vbEr/0YVigfxKfk7ci1PHYs62U2M0CT9MczFylVnndXu3LMFAF2pZSTwsaCA+QNjtASEm9s5yh4nR1hdVxWU9EOnwms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DqpRuW6B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DqpRuW6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2271F000FF;
	Thu,  1 Oct 2026 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833114;
	bh=GlMMSHbVkvgzMsrwrKJVd9G49mMRDr2YQ94384ErCWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DqpRuW6BSFiHlIx+rC6MBmcthS6m0vMnMZWYQ9zEUi0nwboIjguaXf5Dqu8MGa/bd
	 AIxJnRmUrTH/+SC/ApfBY7RICnJ5eh77JF+7T6sRPsqeS0VB3x7VlKcNWsMJ9sAl/y
	 DryUPiBJTG8W+OA91Q4yZB2QhLw9nHbusHBaHV4I=
Date: Thu, 1 Oct 2026 07:38:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Remove manual ifname allocation
Message-ID: <2026100116-joylessly-icy-055d@gregkh>
References: <20260908115654.3406-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908115654.3406-1-nsvatoslav515@gmail.com>

On Tue, Sep 08, 2026 at 02:56:54PM +0300, Svyatoslav Nikolenko wrote:
> The manual ifname allocation via dev_alloc_name() is redundant because
> the networking core handles interface naming automatically during
> register_netdev().
> 
> Remove the ifname module parameter, the corresponding field from
> struct registry_priv, and the rtw_init_netdev_name() callpath.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
> Changes in v4:
> - Rebased onto latest staging-testing branch.

Still does not apply, can you rebase again?

thanks,

greg k-h
