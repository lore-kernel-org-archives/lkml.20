Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD10309EF9;
	Fri, 16 Oct 2026 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126500; cv=none; b=mcuNrCoNseXL7sw6X3UhvP3pZKc6WGwVVKWfkXP1h18IEu9cZ0Tm3e9zgTFWzndnxm3AGWjzRnIxXEw26DDyk5OZl5CciGVjF2MDuIxAAiCZ+JkBYN3LvzuWy2m2uWNl7C7lU9mphQXFSeupfoI4bQyws4map1hAytSO8+1B7fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126500; c=relaxed/simple;
	bh=wjRxoxkSzlPizCOIbpyTZ+uVRedy32KRAxYS8NUJjao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9CsOEchBo2f0jREYcdloHSJlCBrQigg/JlhLqqcEgZsao86GyPgMkMJlM4AYf1gCuBPejtAxB3NYjH8rBVKcBAWRCmtiNMfZWkQFykrq6t+KyZsKZTJPc8fZWNLXClfV7jtw0JsxW4k0UuA8lJKmHb+/LjKFnWuapolZby1LtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GAoUdjOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GAoUdjOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630751F000C4;
	Fri, 16 Oct 2026 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792126498;
	bh=RqtK5nQZlDPiIkEWsrh4UjcsPe8SRCMcr4buHlMrTH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GAoUdjOv94X+8g8LoWzGuigb2lJLHbN/IIpX1KeywPkMBRhcMR87fYoj0qIZ8tfYt
	 sfwAwWI+TNrnBhYmOyyuFZJt8yLA9NciUtM55xrBG61UluX3UrsA4kryRQ7TkadS7J
	 ysg9jFzrJjOma02IqQJr+gNkJ5Fr7uN16Hm+g+aw=
Date: Fri, 16 Oct 2026 06:55:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Okhuomon Ajayi <okhuomonajayi54@gmail.com>, outreachy@lists.linux.dev,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add blank lines after struct
 definitions in gbphy.h
Message-ID: <2026101653-repeal-deploy-2aa5@gregkh>
References: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
 <fcdee571-d94c-a5ae-5ae5-b41977f22073@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcdee571-d94c-a5ae-5ae5-b41977f22073@inria.fr>

On Thu, Oct 15, 2026 at 10:17:35PM -0400, Julia Lawall wrote:
> 
> 
> On Thu, 15 Oct 2026, Okhuomon Ajayi wrote:
> 
> > Add blank lines between the structure definitions and the
> > to_gbphy_dev() and to_gbphy_driver() macros to improve
> > readability. This fixes the following checkpatch warning:
> 
> Thanks for the patch.  But I suspect that the lack of a newline was
> intentional, to show that the #define is closely associated with the
> previous structure declaration.

That is correct.

thanks,

greg k-h
