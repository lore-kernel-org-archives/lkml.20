Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF63A9DAE;
	Mon,  7 Sep 2026 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797540; cv=none; b=UaijrO1O0A3T0Z57KRIvkQ8nphRh/15kURBNlemsS0B2nVHK0izarHyzHBycI8wDlW4UJk7DAuTD61hzzoLuRPse0+Mq5Imc5aYCxIhaBOMIuR6DyfFes9mSEYzjx23CaUeNJhPw8B+s9dZd9Ic5K96Z/4YvDfbTa+qbwtf3sPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797540; c=relaxed/simple;
	bh=EGYhOuFLx1JoRYnD/mTx1Ojvb5W8pQr90Y28HWndFuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5tCdltLi6oWmDh3/PeufKL+UX9bMwYVSSElD+7HDp7c6fiyVyw9cHOgldz4ktGs6bzNdy3rFHXZlBaSgw2IV484U2o/IguMqfRNBPp8RbjFDAMCE5g75zGlgi6hG+/4aPz3PzC8drUi94szdVSC3Z6kClRs4PYOrXz4WLn0V6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BzgYzTt2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BzgYzTt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84D31F00A3A;
	Mon,  7 Sep 2026 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788797538;
	bh=gr/pUYq+YEg5ra5mQHzcle9hcIQi5fkgA0KEOGsQIEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BzgYzTt2RYQNg64/rYTY7KNgh7bweBvktNUtgbxBzfFAXf1XDx8Rx8jh3RrSn+3Gk
	 dbXTnQrZ8lh1zdoeBNpGe3jpFB156Ndkc1moyerA2b9bi9nj4ePdPAgGq//SPl5J8b
	 3qH8ehdgU3XFFeofYE4BCaxuI6DI/nR7USD/AxzE=
Date: Mon, 7 Sep 2026 18:10:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tianchu Chen <tianchu.chen@linux.dev>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix protected RX frame validation in
 decrypt path
Message-ID: <2026090706-uncapped-footbath-8692@gregkh>
References: <f718ce8ebdf9fced440fb47bc921026bd24ca879@linux.dev>
 <2026081946-trolling-handrail-ecac@gregkh>
 <fb7186bc58696dc2117139adef454d674c705ef7@linux.dev>
 <0f2ad51e4486aa048cefea748332f833fa7ec57d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f2ad51e4486aa048cefea748332f833fa7ec57d@linux.dev>

On Mon, Sep 07, 2026 at 04:00:11PM +0000, Tianchu Chen wrote:
> August 19, 2026 at 11:11 PM, "Tianchu Chen" <tianchu.chen@linux.dev mailto:tianchu.chen@linux.dev?to=%22Tianchu%20Chen%22%20%3Ctianchu.chen%40linux.dev%3E > wrote:
> 
> 
> > 
> > August 19, 2026 at 10:45 PM, "Greg KH" <gregkh@linuxfoundation.org mailto:gregkh@linuxfoundation.org?to=%22Greg%20KH%22%20%3Cgregkh%40linuxfoundation.org%3E > wrote:
> > 
> > > 
> > > On Wed, Aug 19, 2026 at 02:22:47PM +0000, Tianchu Chen wrote:
> > >  
> > >  
> > >  From: Tianchu Chen <flynnnchen@tencent.com>
> > >  
> > >  The RX software decrypt path mishandles crafted protected frames from a
> > >  malicious AP in two ways:
> > >  
> > >  1) decryptor() never checks that a protected frame is long enough to
> > >  hold the 802.11 header plus the per-cipher trailer(IV, ICV/MIC).
> > >  
> > >  Implementations like rtw_wep_decrypt() and rtw_aes_decrypt() all compute
> > >  length = hdr.len - hdrlen - iv_len. and a shorter frame underflows the 
> > >  unsigned subtraction, turning into OOB reads/writes.
> > >  
> > >  Reject such frames in decryptor() before touching the IV.
> > >  
> > >  2) validate_80211w_mgmt() uses the skb before checking whether
> > >  decryptor() returned NULL. On decrypt failure the skb has been freed
> > >  before being used.
> > >  
> > >  Bail out immediately when decryptor() fails.
> > >  
> > >  Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > >  
> > >  Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> > >  Cc: stable@vger.kernel.org
> > >  Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > >  
> > >  No assisted-by: line?
> > >  
> > >  And you have read this:
> > >  https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh
> > >  right?
> > > 
> > Thanks for pointing out, I have not read this before.
> > 
> > Assisted-by: kimi-code:kimi-k3
> > 
> > > 
> > > So did you test this on the real hardware?
> > > 
> > Unfortunately I have no real hardware.
> >
> 
> Hi Greg,
> 
> A while ago I had no access to real hardware with this chip, so I was not able
> to actually reproduce and verify the bug.
> 
> That has changed: I recently picked up a board with an RTL8723BS from the
> second-hand market. I can now confirm that the bug can be triggered by on-air
> Wi-Fi packets from a bogus AP.
> 
> The v2 patch with test report has been sent:
> 
> https://lore.kernel.org/linux-staging/7848fcb635963ddb8474924ed71fdd687b5d6ec7@linux.dev/

Great!

> Hopefully this time it is good enough to be merged into staging.

It's a bit wrong, will go comment on it now...

