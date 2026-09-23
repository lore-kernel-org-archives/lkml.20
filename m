Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CE7480326
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158768; cv=none; b=XbEIT6pMOcbzg8jzHNKGrjLm/FnfkKyUNzV5sPH7pcnFWbumxzj+eSVYVjc29DG2aK1ApPP4osWsIcO3u35KmaKlLmviKXJSnBTxPHnp16uGdZ5fW4AxqVSP3c45Uj8HntEeDEdEwkGJqt8a+vcf0QX/tkdmayMpSfYfzfU8JcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158768; c=relaxed/simple;
	bh=vs+hV/O1q+B37AsXF8WXSS3DE6kdN4ABZ1uCLH5nzoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejToaCO/UqK5vCQfLsSfbje4z4LTqJTrnxl4RGw9eCr6RHj+2jkWTt+0r3QMOhuyLYxyVB2AQCMFcb17XgzWWXyg2IJAS4OsiBYEGX9SLjWqIj9EXffd0KtyiyZIc2zcZ4guZfzlG7aiXa9L/q1Iw/twvZvA4BrHzhzGT5Ilo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DC4PhnTR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DC4PhnTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790158763; x=1821694763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vs+hV/O1q+B37AsXF8WXSS3DE6kdN4ABZ1uCLH5nzoI=;
  b=DC4PhnTRsceZsrL+gPiyjRjWgNZopKNYK6275DpodFNLYVtQv6I+Bw8x
   UHXT/BthT+xs9b7djo2b2/Y3Io7Ne27r8ZO+BR71zmWr4uP4fWtBmzdRh
   xqOxHmZpT+xvGRX/D27oDkfCzkzzPgG/sRyb0m1I7GLNShIyZnToVfoig
   LbCR8J6tLI6qgXBUYJB9Jcwb7eMVd5K1vu7SAqT1pJFkGsRvXjwVkj+QQ
   ZXn4EBFNB0uxGv9utaXZXczJB416sHLtZbNbWfCenaSxD/EhLu3OwAby/
   xhSiOfL+zriS7RM0aYmTrRwfLCl0M3sx/Qp4cB5H+P3TkQ9F4SDgRFD5H
   w==;
X-CSE-ConnectionGUID: LrtaH5boTDandlNxDlNGQA==
X-CSE-MsgGUID: 0BWcfsMVSUiGqMT5nNNhiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90858830"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90858830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:19:21 -0700
X-CSE-ConnectionGUID: dB/1enjvSU6hf5qfoamcNA==
X-CSE-MsgGUID: YQB32fXPSha7aU6L+h8DKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270065936"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.235])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:19:18 -0700
Date: Wed, 23 Sep 2026 13:19:15 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: David Engraf <david.engraf@sysgo.com>, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
Message-ID: <arOnowDZHimj_86C@tlindgre-MOBL1>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
 <arOdv1HHPWzXgW7h@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOdv1HHPWzXgW7h@pathway.suse.cz>

On Wed, Sep 23, 2026 at 11:37:03AM +0200, Petr Mladek wrote:
> On Thu 2026-09-17 09:05:51, David Engraf wrote:
> > This fixes a regression when a console option includes ':'. Commit
> > 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> > introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> > colon. If the colon is part of an option the name is handled as devname
> > instead of ttyname.
> > 
> > Fix by handling the options first which will add a NULL terminator to the
> > string.
> > 
> > Signed-off-by: David Engraf <david.engraf@sysgo.com>
> > ---
> >  kernel/printk/printk.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 6d3d18a50da74..f4803fe05a0aa 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2646,24 +2646,25 @@ static int __init console_setup(char *str)
> >  	if (_braille_console_setup(&str, &brl_options))
> >  		return 1;
> >  
> > +	/*
> > +	 * Decode str into name, index and options. Start with options, since
> > +	 * it might also contain a ':' used for DEVNAME.
> > +	 */
> > +	options = strchr(str, ',');
> > +	if (options)
> > +		*(options++) = 0;
> > +
> >  	/* For a DEVNAME:0.0 style console the character device is unknown early */
> >  	if (strchr(str, ':'))
> >  		devname = buf;
> >  	else
> >  		ttyname = buf;
> >  
> > -	/*
> > -	 * Decode str into name, index, options.
> > -	 */
> >  	if (ttyname && isdigit(str[0]))
> >  		scnprintf(buf, sizeof(buf), "ttyS%s", str);
> >  	else
> >  		strscpy(buf, str);
> 
> Sashiko AI has the following comment:
> 
> | Does moving the options parsing and null-termination earlier in this function
> | leave the loop below with an unreachable condition?
> | 
> | Since str is now truncated at the first comma before being copied into buf,
> | buf will never contain a comma. This means the comma check inside the loop
> | over buf appears to be structurally impossible to satisfy:
> | 
> | 	for (s = buf; *s; s++)
> | 		if ((ttyname && isdigit(*s)) || *s == ',')
> | 			break;
> | 
> | Can the comma check be safely removed from the loop condition?
> 
> And it is right. The original code copied the original string into
> "buf". The new does not copy the options any longer.

OK
 
> It would deserve some refactoring to make the code cleaner.
> Something like:
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index f4803fe05a0a..966744fb4bcc 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2672,17 +2672,18 @@ static int __init console_setup(char *str)
>  		strscpy(buf, "ttyS1");
>  #endif
>  
> -	for (s = buf; *s; s++)
> -		if ((ttyname && isdigit(*s)) || *s == ',')
> -			break;
> -
> -	/* @idx will get defined when devname matches. */
> -	if (devname)
> -		idx = -1;
> -	else
> +	if (ttyname) {
> +		/* Detect @idx in ttyname and remove it. */
> +		for (s = buf; *s; s++) {
> +			if (isdigit(*s))
> +				break;
> +		}
>  		idx = simple_strtoul(s, NULL, 10);
> -
> -	*s = 0;
> +		*s = 0;
> +	} else {
> +		/* @idx will get defined when devname matches. */
> +		idx = -1;
> +	}
>  
>  	__add_preferred_console(ttyname, idx, devname, options, brl_options, true);
>  	return 1;

Nice, you could now initialize idx = -1 to start with to leave out the
else for setting devname idx?
 
> I see two possibilities. We could either merge this cleanup into the
> original patch and send v3. Or we could add it on top of the original
> patch.
> 
> I would slightly prefer v3 and have both changes in a single patch.

Having a v3 sounds good to me.
