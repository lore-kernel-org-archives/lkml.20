Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562952E063;
	Tue, 29 Sep 2026 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691173; cv=none; b=GwbVgku2nhct02zTDDLYJlMUHRHxqGVChh3nrPmNUHCd5dxDAtxd9YYxxBxyIssFUbbtGwxrkjXI+AyEFO4wrDzKA6htkBVFFI9XbfpCgybbnVLb1aXpnTRsZ8lVQBQWAsv4QVaeDF9NPfb1w4Te06Tqqo2WKGfGgyF0JIf+2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691173; c=relaxed/simple;
	bh=szSFMY0AWAILbKkJ9Dy/Yz5DYTk8REhbT2KwxcV8Gt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NN5q39Hi7yCJK6egA0M56nfrTmzAjDdASunP/PF+xafmoLF1JQvIrHSpYRgRht8tScoSou5qNw3oDl/zJzJn2M4TU9CHHXTKCCoKLXWIv7xqN18OaONUrsZdJysDHbBytHL0mAIVNhyUwuFz7ZzxOxcJV0ek87x/3hFPFNAtXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NaS+1nBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NaS+1nBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE1C1F00898;
	Tue, 29 Sep 2026 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790691172;
	bh=szSFMY0AWAILbKkJ9Dy/Yz5DYTk8REhbT2KwxcV8Gt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NaS+1nBoAfHGvE2WcWj8evAvDRkrQXKs6pc1Ib+TXgEeKNKcMtGwmuTySBb+jQcy+
	 hYAqL+qNNsDD+U8Rh3kADLOypIyxwbZHMVJvJ/K44Fza0yOEklk6IAit5X53FU37UQ
	 xVVcZTYhddLUXJRkqBlzNH+kPZ5vOa3o12SpFX0Y=
Date: Tue, 29 Sep 2026 16:12:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Amirhossein Hajimohammadi <info@hajimohammadi.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: stop overreading monitor interface
 name
Message-ID: <2026092934-jacket-monopoly-dfe7@gregkh>
References: <4E27F487-1146-4557-8A26-51F6E9E2E2C6@hajimohammadi.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E27F487-1146-4557-8A26-51F6E9E2E2C6@hajimohammadi.net>

On Tue, Sep 29, 2026 at 01:38:19PM +0330, Amirhossein Hajimohammadi wrote:
> Patch attached as text/plain.

Please do not do that, please read the documentation for how to do this
properly.

thanks,

greg k-h
