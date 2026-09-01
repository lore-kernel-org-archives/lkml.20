Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91447799B;
	Tue,  1 Sep 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257394; cv=none; b=JJGcJY+ReoMriLp1IcSnveDa9xTjfBotfx46UAdAXQLUckGonbjXAZoO5lLerLjt85nOkndjnvAUHdHaHmpV8pFsb6oqSzGYSyLR+ViIUuo6igTsPCGt6njKPmUUnmdpVhX0eGWyFzUmldKndHQJYuTSTU9Lu2b2yttxsTv58Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257394; c=relaxed/simple;
	bh=OIijcZHvOlCGNsjBKFFoQZkrFxXg+wlaBqtZEFqI5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qee42/+AVKlClf8MYrMUEGTkQjLr0mTD7LFFRKnCzv1OfuyknkcgcYp5t4r8Nvr2j57lU6fur+kbCLvuTffODJ9+OmSyaS19nJzrpIc10HMtqX7fHyvtSXuazHdTM18t1aMRsbK8utxpWHOnIMSa0vVOx2uQqN3+rqiWwQrobyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dIdgMq5W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dIdgMq5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740BF1F000E9;
	Tue,  1 Sep 2026 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257393;
	bh=JbaFRSncwQU7nHmw7z5RwgRfydaiyCOcsa53G0wUMU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dIdgMq5WjgZhFn4solAg4lBDLKs6AiqHzLRzTys2VnCqqF4x8ZXRi3mNNrYZQQdie
	 svo9zH6mF5Io6j98pwAOnc4xRvoNVbHPYik1nwvdYCwCDHLPK8ATOBloXCEAcHSfjW
	 /l8jrvJf345sTfZ82cm7ELdgRtvD8br6HuGwhoLE=
Date: Tue, 1 Sep 2026 12:09:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philip Nielsen <philipnielsen64@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: avoid CamelCase in rtw_efuse
Message-ID: <2026090135-crushed-magician-7986@gregkh>
References: <20260817154555.81451-1-philipnielsen64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817154555.81451-1-philipnielsen64@gmail.com>

On Mon, Aug 17, 2026 at 05:45:55PM +0200, Philip Nielsen wrote:
> Avoid CamelCase naming for local variables, function parameters,
> and static helper functions in rtw_efuse.c as well as associated
> prototypes in rtw_efuse.h to adhere to the Linux
> kernel coding style and clear checkpatch.pl checks.
> 
> Signed-off-by: Philip Nielsen <philipnielsen64@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c    | 120 +++++++++---------
>  drivers/staging/rtl8723bs/include/rtw_efuse.h |   6 +-
>  2 files changed, 63 insertions(+), 63 deletions(-)

Does not apply to the staging-testing branch.  Can you rebase and
resend?

thanks,

greg k-h
