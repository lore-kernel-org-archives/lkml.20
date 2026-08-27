Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866F2D0C7E;
	Thu, 27 Aug 2026 05:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787807178; cv=none; b=qEPO+Wtti7k4Tb0DEm8iy70oBqlDhZ+YggN3v3YZT+IC0UsdMCWgIGh5q/WhRqDc7Pmm090RqtvjFXeCGTfAgOb3d5JKqscdy0HtRqRikNsx4sGaggaG9Z70ap27weuoLWa/OKv5oNehsa7ylVfoWHKvQVUXrRpaEJlgh64xpuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787807178; c=relaxed/simple;
	bh=0SbWVk81NSvWiVEymtaQC9KkKcEe1BhdRuENR95FLIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckuc7EX+1KbNx/hYQ4Rjw9XON74hvSQlUv0wuzrfTCknFthl2nvR9H8lUmIiBJYAEeIAbhlpcigWEhvslmftKbtAVerwdX7q3lKosk3FQFYgudpuE6gbXq/7PdvhiZS6bl28k8ckUx/E/2pjBPKWe64v15oZDpXGt3VHbVibESo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LLgSx9Eo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LLgSx9Eo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BD51F000E9;
	Thu, 27 Aug 2026 05:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787807176;
	bh=DE34z+US3g6UhDyZ+cyjk0YKv5xtZEJ59OP0oiZT5qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LLgSx9EosB4UIXG0raO6bnu8dmRqt5ElZDtbf69oDBw5wFbEwoWXb8y6PUn5boLRc
	 OWIKmy/fe3LIdkSQ7GeaAYBNANhuflmjv7t/K58ByzHRqBEhq7rF/KI4RgwWj7KX3L
	 dlGKrxYIMwvV/I3rkUw6rkdCSPdGyQt2hAmjB9dQ=
Date: Thu, 27 Aug 2026 07:06:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Godana Emiru <godanaemiru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in
 xmit_linux.c
Message-ID: <2026082744-decorated-turban-7e67@gregkh>
References: <20260826194059.12003-1-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826194059.12003-1-godanaemiru@gmail.com>

On Wed, Aug 26, 2026 at 10:40:59PM +0300, Godana Emiru wrote:
> Fix a handful of coding style issues in xmit_linux.c:
> 
> - Remove a stray extra blank line after the include.
> - Split two chained assignments in _rtw_open_pktfile() into
>   separate statements, one variable per line.
> - Wrap the long rtw_os_xmit_resource_free() prototype so it fits
>   within the column limit, aligned to the open parenthesis.

These are different things, so this should be a patch series, each doing
only one logical thing.

thanks,

greg k-h
