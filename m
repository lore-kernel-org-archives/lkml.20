Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C79233945;
	Fri, 28 Aug 2026 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895533; cv=none; b=eitvJeUtwfwUJYuH1Ojt+fhU+jXSIFue4kN8OniBSr4EJdvDremhF4LGKroMUPeXaFQJutcpvZzEEVwzJr3g/q/YGDQ0fpKeSNgt4yPNVS4+LVIMyA+cINO3MhkMa3+0UInI+RfYeb7ASKt4/PFb/sKCngZR2ODLXFvau8y4JM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895533; c=relaxed/simple;
	bh=S/KKRjoodI2H0WtySuHUlBxcrG4TT5ASHD+cuCKWOFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=el4J4siMIbO/70biktSKvZyI5wGVDQk8jexW+WeI1Onj5d4Js6CUGi/C5A6a2d2C+/ulDwF6kpYe4dSxPEkEzOg8U9QuPj9fVS0VWpbMpOs0YM4lNS+gSfJTs8DCPZGj82Gm+Qp5t0b6yfuIwbYO8SmBgfFOPid458BNL1CaiRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R+Op+lUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R+Op+lUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFA11F000E9;
	Fri, 28 Aug 2026 05:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787895532;
	bh=naUxH0rI44TVcqO09UEntF2VzM+EmqUy6E5MSXa3Vmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+Op+lUSQy4oCLm+K6hpMMNf9ZUlaItVp5Aqd7tzOVRV/5Hr3ORLk2zrnj4G5SDD6
	 iYa0/fmu6cRugZCB9lxUkFD+SFU3SRjYgrUWCmn+NyPu8WHGt4qYAJMYNZdmKOHtrQ
	 5+ZrDfjxlfG04FsjpP3h2SaHYWc8zL9/jO6FvSpc=
Date: Fri, 28 Aug 2026 07:38:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] gpio: usbio: Remove bouncing maintainer
Message-ID: <2026082836-albatross-patience-e24a@gregkh>
References: <20260827155127.2334936-1-dave.hansen@linux.intel.com>
 <apCYT42UKw9V-u5Z@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apCYT42UKw9V-u5Z@kekkonen.localdomain>

On Thu, Aug 27, 2026 at 11:04:31PM +0300, Sakari Ailus wrote:
> Hi Dave,
> 
> On Thu, Aug 27, 2026 at 08:51:27AM -0700, Dave Hansen wrote:
> > The email for Israel Cepeda is bouncing. Remove the entry.
> > 
> > Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> > Cc: Hans de Goede <hansg@kernel.org>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> 
> I've posted this
> <URL:https://lore.kernel.org/linux-usb/20260803164533.58833-1-sakari.ailus@linux.intel.com/>
> earlier but I guess it hasn't been merged yet.

It's the merge window, will pick it up after -rc1 is out.

thanks,

greg k-h
