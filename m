Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1E4A2A5E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856511; cv=none; b=eia27K1p6mrXxI8CZA97w7I1xGUrfzs6dIOnsLlDwR7kDply9oVm1DcQWX6iV5TyFlXy1bRKeAC2uPRIF7GtdCe3HIBQ6gna9wsaQ9AGcQiiPHDSERy/mc8H2NLwSDEtXuktPmhUPGKrWoo8AfAh/DuvKy7YfiwxUmTwxgyhn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856511; c=relaxed/simple;
	bh=4YflbMOHkg0HrgzDGAXA4qCdrbT9GdmpSszMcV71XXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvW2rNWyMsmJH9XDbmusNfH+GUwaLm83tkLpbQx4YEAeNjAHXv9sYbTXquOCLWiaW6a+SD8EffyrhH0TcB05SJQfK3tH/n9om5I8naGJqxcmkEvKNeXJ06ISKdNL+c+CSBmMC4SCnYnCbKycoY1kkYDn6VBwuqloOjZGL2yv9A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pOKM/XTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pOKM/XTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6991F008A0;
	Thu,  1 Oct 2026 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856497;
	bh=73/yoLHRCwElG/nCSvuLJjggT+8ahlZ1DruwtxaY+os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pOKM/XTwkK0/KkS7x8MQq9mHcZmnLyFmLXJhr6Hze19k0QAqo3xfxVn+WmtPvj7oX
	 u7Wp7DCQmln3em0NiioEIGDxGDwkCwsF0+zGn2hl3jc+A8dg3aIxLJIy+DIKz5Ckoq
	 VzZxHWDO1BP54pKetKo5KJUAhnYxDRG2An8CXlas=
Date: Thu, 1 Oct 2026 13:58:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 09/13] drivers/misc: Stop using 32-bit MSR interfaces
Message-ID: <2026100121-pedicure-shout-525e@gregkh>
References: <20260819102314.1499258-1-jgross@suse.com>
 <20260819102314.1499258-10-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819102314.1499258-10-jgross@suse.com>

On Wed, Aug 19, 2026 at 12:23:10PM +0200, Juergen Gross wrote:
> The 32-bit MSR interfaces rdmsr() and wrmsr() are planned to be
> removed. Use the related 64-bit variants instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/misc/cs5535-mfgpt.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
