Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37E51AFFC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165200; cv=none; b=XZi6EKGmf/T5Qvvtq3uXyCJ5tC99oN6J5CwAc9a2jhnpNyD6IX4jYKBN27u8WMNkqh3An/zBkJqxIeSgmPkDjGJcy4Kv/bGJhrpX4Fa5mXtjUPDeb3bfYXgQdbozKvexP2OIM8qwL7VwS4iKguZWRrkPRQvLV69gAyVCnmnFsA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165200; c=relaxed/simple;
	bh=df295Gzf7AAoOpP4l06yOj5pqltdt5Y5MSTs6NS2N8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0Rehd1YPsxjbKKRfW7Law7xq6DjMn4cQcTGTMMq4ghoI82Lh/vYLIQz6IUH86XNu3iewpYiG0catZb0aqEv3GJEqwmdaVwbhiIGDJN4Msw9Kr9jwHjBNBAP8xu7ZbcFujGnbek2E5agSA/sGE0hqCBFIbrBnbPaBYWrHbbje4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M7oXO0On; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M7oXO0On"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so9375455e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790165193; x=1790769993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8UFiTfYv2REZAhIVNIQyM3dHlMFK5/ksEshi9iNh5l4=;
        b=M7oXO0OnA/GGXEGpQLRRipXXl+InbDDvUUAYIcnA56n+w65n6zhcmN/Ulj8qIx1NYz
         1zlOUd5XwtVhc7C8kIzG6ky/W7iGv4QiqAFyoOZHqzUO5K907UDZq3ocTYLrCzohnNjj
         cLahGOYg6uuhNSgkKV1QPlRv3clzdLseeskO5NsaJC7l/I/YNALGICzmBENtukNeakrF
         OPM5oGFGRXg9WhC9TwLP28powalvJiP5df5zdnstjHFZCe4epNupPMCxrM2vVHf8Cish
         JFwq6OQMPyJPXPDhdWLEM3AUup8jfOMW2nsnBk8frisCnMuVQgz6aBp0zyDZNdX/EbNi
         2UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165193; x=1790769993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UFiTfYv2REZAhIVNIQyM3dHlMFK5/ksEshi9iNh5l4=;
        b=W5UgzsOxWyNnEOV9ca/BXETjRBmk+QMMzXH7BnDdf6DYq0/kotQL8nfsP1H6X5J8nK
         YCeUngRhpU2Bfxhsyigw7V7ItftZ1yYdaQwg8QVAwuiZPyqp9oVKROH7DT3/bvDhGqsI
         VtAD4rBVv8U4naj2x8ZYiXOKiFF+F28Q6230ncyaGue30b12WqQ1zpavOT5nRoysi+eR
         0hbj2ky4xW+UdH2XeCxOg8z+7OyRrml//fb8swDGwwLsuDXImbqKttDZX+zVURXGr2IZ
         c4Odg9Jst52/+75B8JgEwpl79X0MUN68Fq609j6N9wif5QstyaCWrja1eW/k7dJxvEO+
         Xl8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6hufFhIAzrh0UYgCyw1Emc01AqWTc9QvDmOb8Z8etUZ6WzpP4Un23pJGeyZSuvgoTAHoXFPhTo/+6OcY=@vger.kernel.org
X-Gm-Message-State: AFuF++lQrxrHskzhvT+kBFbHbsn/iHoHcezBWSjVeHi5qQupJqNC6sTq
	d25euqhCpD5hvAtKWr39UP2atcKLfgQwPz73MU1GedaNUspZonQkT2H2/ks2vJrhBE4=
X-Gm-Gg: AYBFou2kyXZXx8hSnjLDNULzwPhCfHjhYzl1v/g9S5yWADSvsRcoLytNm3hvJOBgCYc
	GVOetS/8jGxlqA9jB/JTDcGbcxKmyD8Dy/3BrxA3bmRji4JtbPbWIzOtp7ojvU+g07dsJgognly
	0v0YTnyDxlIWu2kndG4yA7qMSTWMVsIJSw5N0sR3/o/yjbnWei3HBOudger0TXzKMmKKe8VoZPo
	xDNn/RC1Gb47YkdkWPeYrd980jIQ5rZ9u1VaxMEpwyszVSmcYdpqx/A1RtrfaH4LXT2N6aljexP
	/NdHI9Sm4J2Gxe7hMZMO1ihJWMTU3m00DciWx4xKqdr/wIpggRyhAWuqkgZZoOBK/dVg5dlZU+q
	1VHvokNuk9YmIAcd+V+fT/RTMTSjTsWe1CR0BJbu3KnDZ35dkagZ41M/l2MlyAM992QWzyoWa4s
	x9pntZa74UpLvKRfZyz3KWZnz6fPx0Pocy3c4GjvEbsKj+pXgvnfARUK9F56ALeX3vQIJLP3+CL
	rXWCpOLyXvLHls=
X-Received: by 2002:a05:600c:4512:b0:49f:ce72:e930 with SMTP id 5b1f17b1804b1-49fdf250dd6mr35125455e9.34.1790165192708;
        Wed, 23 Sep 2026 05:06:32 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d978fsm65364285e9.9.2026.09.23.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:06:31 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:06:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: David Engraf <david.engraf@sysgo.com>, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
Message-ID: <arPAwpfKLSv8ZwpY@pathway.suse.cz>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
 <arOdv1HHPWzXgW7h@pathway.suse.cz>
 <arOnowDZHimj_86C@tlindgre-MOBL1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOnowDZHimj_86C@tlindgre-MOBL1>

On Wed 2026-09-23 13:19:15, Tony Lindgren wrote:
> On Wed, Sep 23, 2026 at 11:37:03AM +0200, Petr Mladek wrote:
> > On Thu 2026-09-17 09:05:51, David Engraf wrote:
> > > This fixes a regression when a console option includes ':'. Commit
> > > 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> > > introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> > > colon. If the colon is part of an option the name is handled as devname
> > > instead of ttyname.
> > > 
> > > Fix by handling the options first which will add a NULL terminator to the
> > > string.
> > > 
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > > @@ -2646,24 +2646,25 @@ static int __init console_setup(char *str)
> > >  	if (_braille_console_setup(&str, &brl_options))
> > >  		return 1;
> > >  
> > > +	/*
> > > +	 * Decode str into name, index and options. Start with options, since
> > > +	 * it might also contain a ':' used for DEVNAME.
> > > +	 */
> > > +	options = strchr(str, ',');
> > > +	if (options)
> > > +		*(options++) = 0;
> > > +
> > >  	/* For a DEVNAME:0.0 style console the character device is unknown early */
> > >  	if (strchr(str, ':'))
> > >  		devname = buf;
> > >  	else
> > >  		ttyname = buf;
> > >  
> > > -	/*
> > > -	 * Decode str into name, index, options.
> > > -	 */
> > >  	if (ttyname && isdigit(str[0]))
> > >  		scnprintf(buf, sizeof(buf), "ttyS%s", str);
> > >  	else
> > >  		strscpy(buf, str);
> > 
> > Sashiko AI has the following comment:
> > 
> > | Does moving the options parsing and null-termination earlier in this function
> > | leave the loop below with an unreachable condition?
> > | 
> > | Since str is now truncated at the first comma before being copied into buf,
> > | buf will never contain a comma. This means the comma check inside the loop
> > | over buf appears to be structurally impossible to satisfy:
> > | 
> > | 	for (s = buf; *s; s++)
> > | 		if ((ttyname && isdigit(*s)) || *s == ',')
> > | 			break;
> > | 
> > | Can the comma check be safely removed from the loop condition?
> > 
> > And it is right. The original code copied the original string into
> > "buf". The new does not copy the options any longer.
> 
> OK
>  
> > It would deserve some refactoring to make the code cleaner.
> > Something like:
> > 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index f4803fe05a0a..966744fb4bcc 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -2672,17 +2672,18 @@ static int __init console_setup(char *str)
> >  		strscpy(buf, "ttyS1");
> >  #endif
> >  
> > -	for (s = buf; *s; s++)
> > -		if ((ttyname && isdigit(*s)) || *s == ',')
> > -			break;
> > -
> > -	/* @idx will get defined when devname matches. */
> > -	if (devname)
> > -		idx = -1;
> > -	else
> > +	if (ttyname) {
> > +		/* Detect @idx in ttyname and remove it. */
> > +		for (s = buf; *s; s++) {
> > +			if (isdigit(*s))
> > +				break;
> > +		}
> >  		idx = simple_strtoul(s, NULL, 10);
> > -
> > -	*s = 0;
> > +		*s = 0;
> > +	} else {
> > +		/* @idx will get defined when devname matches. */
> > +		idx = -1;
> > +	}
> >  
> >  	__add_preferred_console(ttyname, idx, devname, options, brl_options, true);
> >  	return 1;
> 
> Nice, you could now initialize idx = -1 to start with to leave out the
> else for setting devname idx?

I would personally prefer to keep the else part because it makes it
clear how the "devname" variant is handled. But I could live without
it as well.

> > I see two possibilities. We could either merge this cleanup into the
> > original patch and send v3. Or we could add it on top of the original
> > patch.
> > 
> > I would slightly prefer v3 and have both changes in a single patch.
> 
> Having a v3 sounds good to me.

Great.

Best Regards,
Petr
