Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD08E38AC65;
	Fri,  4 Sep 2026 05:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500885; cv=none; b=ptkfEbGEstGDwMpV949LaPEZ9UwxHlIhoY8qe4D66NCLQK/aEbPIlFCKQaBLNwI602ERTereEgltFBI7toB3SFpruwmghhgdAV0tuFVhHeypqOkxGsPXIyVKKr0/xsQGaZyL21W8fXu64wR8MXihjs+B+R/CJ+dIYZM5qjZwqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500885; c=relaxed/simple;
	bh=W8RBbz+XXrNAiGf0dEzEa5e85chLBxyTzdi8DHtfQW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq04kRW6ObBNo/GIjqN3XGiUm0uFC9dhzjHxHm+xbWDQMDnWgGtglTlm+oDibxvoh2hRaiZhJCiDeqS6hfacggcbzVOY6tfn2TvEC2XeTI/kYoakf38nSKAfWxvzXs9Cuq90DRTc6sDBzcYqJm/Dmbwd2ChYr73Vv33i7/MjldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=szp/19aX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="szp/19aX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258C61F00A3E;
	Fri,  4 Sep 2026 05:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788500884;
	bh=PMYXTVjEdcDWnPvOcERCkaaUJnBRor3Y/ruS6Wk04hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=szp/19aXtJ5IfHSljqrd/seeVkBGTAg5o6/Nys436Ig6WYSQlp4fLsMpMNTNvwSDP
	 yIOB2nDZOm3n1hAsWuN0tZhpdVSEY0eqzzjy6e1Aav9FKr9NKEyKP2r3YQpgJpEFqn
	 RsMfiU0nuGX79TkBk4sztjcB2vWY8uVfVEOg0EFc=
Date: Fri, 4 Sep 2026 07:46:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suraj Theekshana <surajtheekshana1111@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
Message-ID: <2026090450-prolonged-tucking-0a55@gregkh>
References: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
 <2026090416-humbly-remix-5d86@gregkh>
 <CA+_JcNRPo1dojU4EmegM5Fv-YpZqiyd_K7SRz8km1VzzPv2nMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_JcNRPo1dojU4EmegM5Fv-YpZqiyd_K7SRz8km1VzzPv2nMw@mail.gmail.com>

On Fri, Sep 04, 2026 at 10:54:49AM +0530, Suraj Theekshana wrote:
> Hello Greg,

Sorry, but the mailing list rejects html emails, please fix your email
client and try again?  Also, please try to not top-post.

thanks,

greg k-h
