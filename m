Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F54F7CC9;
	Tue, 13 Oct 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898566; cv=none; b=G7I5gbB10rajyVzOFxtJItNC2FDomFxu1HfffQme4+BvRxc3ayxT3xmUZnoSWRPpLRw1e6Q9OhwR0jHZnWYPbAznWmhORCmaPrI01IUW2aYctBjb7pwWBWhj9xgygak3/JqckgTgP64CLFItS4Fge37ngzyb2+IkVAsOD+blEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898566; c=relaxed/simple;
	bh=M1RpNe+fn19NUmtB8rF012bOdRyYnhyIvNqmej0drZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka1aK4pSa7F4QHgCF2X4LUaUqhEGTQpivI8mveCExV51eb/vxcda2fLByDmAx5S8IWol82pja4X27MGAd5Ny8lY2BfDAuYDHr06hDXYRMdfDNZi76p2Gx2WHqkZdh4Bsbf2YdHi3HN1r6ZEXJQMJoYScSD9m+PnReo6DHfkebTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aMj0XRZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aMj0XRZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4521F000FF;
	Tue, 13 Oct 2026 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791898565;
	bh=Qih6lUW0+W4MJ/d0vrThaVXzypdp+hA18v135PEjfdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMj0XRZTclZGPJWkFgnw3VwihLBOLrQsNYHBev5WSeyUjf0xhzRkMa3mVPRpMEUHl
	 ZXmMUPlAHs/X1BrpEqNT+EyDTHs2PIaxdszWqI+nZCkZoCoqoGEIzvYw378V1riIAK
	 jwdH+iQHLFDSj4/9PViIjv5y+sSwsHqL8230GA2A=
Date: Tue, 13 Oct 2026 15:36:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: Re: [PATCH v4 0/2] staging: rtl8723bs: struct rename and cast unwind
Message-ID: <2026101355-improper-elsewhere-c20d@gregkh>
References: <20261007090736.277636-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007090736.277636-1-timo.joannin@gmail.com>

On Wed, Oct 07, 2026 at 11:07:34AM +0200, Timo Joannin wrote:
> Hey Now,
> 
> This patch series splits the v3 patch into a 2-part series as requested,
> separating the struct renaming from the cast mess unwinding.
> 
> Changes in v4:
> - Split monolithic patch into 2-part series.
> - Removed dead struct phy_stat and unused prototype
> rtl8723b_query_rx_phy_status().

Does not apply, can you please rebase it against staging-testing?

thanks,

greg k-h
