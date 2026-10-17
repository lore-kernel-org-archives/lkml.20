Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE047FB1A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244790; cv=none; b=OQa6QqQl2rsC30flil+29M1WqwenOCH7cpLoZyoBH1/sdp/OO3zSKOTsxA/EJf09vh78EgSxKwO/Qxa/1nz6k0tiztffGVoN5W08zuYy0Av3Dv28KMklijBSUjBwMHVFjONvaGbrqL1e79ofc6DW7bzirjIOIB4mBdGifMtK6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244790; c=relaxed/simple;
	bh=3DPK6cH6FljcWcEzc8QBsxgrvL5qSlEw3yTx8FrNJmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWSkj6JQGjpzNrSiEN4NCEITQ/SsoSQmo57JIE/sTSW4beXIYW4VrkVne7oiLobEkaLlV2HgoUrERFsKSmQHC3lFe9vZlyW/47V9F5FbpSlaB9TnR/7dvN5HYriY90+yonWQlRB19IMk6MYkjDoEGHf4zzQb/3T1vxvsoBHzah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqYIDubE; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqYIDubE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35c76e9614aso1323158eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792244786; x=1792849586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF3VtQyRsgICOKVzKwtZMUAurVHYZDeyL4UhBQXKZWc=;
        b=UqYIDubECfAXQlQci9SzO2nhCWnpDu9WwAumNVq5mAP3utnITZSAQ7G7zACj4680V0
         wxEihNhAe0DbP+g64dTwHCEg0xYKogNW4fiVDWDcpl7KN2PQgsErflpH12O/2ze2e77x
         q3LeTvPhHMyg9HrwgSyHmdgA7eHig9RgAP+vStoZ9XdEE9En7/hNCbxIuCmLE1nzA4u6
         fuXmxzBCdCbSNhIsAXCDRdZCrC4y0gM9ZnkIpur2HcqbbdvPGUSD/mTQ99zqrL6nvMGI
         Gt7hGK6rb2h9jZOtVxzxRSYIo5ai2Jnrr63RiI3e4MBFo8LcpIkQxmXnFXyjipNS1pXb
         5lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244786; x=1792849586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF3VtQyRsgICOKVzKwtZMUAurVHYZDeyL4UhBQXKZWc=;
        b=SNGpe+AgQXpnU9ngoOnTwoQ9hPPCz2mdCsnuzs4ayG6HrY/3vtNkUMMXde+cHUt/Ce
         qUr2kgH7OZNqjeiL8Oav+RApNBYNELZML7v34jjxR9EkqVHPHF/+tKAW43L02gfHkw77
         Y1QT5FzXdQc6lo/bHxM3v2T3owru0e3irvACigRwEI4X4OWHeD+0W8ZV2JcdJxH3V6Xd
         BrimbU8WNycMIjEW0p8J8a1RPsCUhIqVnhS6fHuLoJIObUKC9eYP5UwDBCXZE3SmTgfT
         eayZPZKnVUBKcKgDjLpiubhqgqC/vvDFJ8XNTry4ph6H9hIeEBYNaixKTWuh6PK9PCyR
         1qaA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Bpoju/Gy5C5e2585YSmtPpFUSdvZnTnKMS8GxT7EAVxVS4GfUd06zsqu7jkUTW9YGHwnhzynxTz/MNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE7r3gEmPC8IMnBl38wDtnNPNgLkvwK+OGXb53mk/rOOgTpken
	l4P2otMIbKt0d7EgPakLv9qBzas5BrJxuQxX3qrtdbo4P1KfSVc2NNeQ
X-Gm-Gg: AYBFou24wtBuZaTOUMdXuMGQDZnVGsjbzG+r63dsu28fZkPZNlmmz06on7mCqZZF++S
	uQ2ZXa/JPxjj7yRXIyss3mssYYeFEsumBCU036uABIklTiWCozCrE/I35UyetIpXfk7QwNPQCEI
	TPL4R/PQlqpUTN9fEuXxvsbfMGfLBZLNIG05PbMDOsdh6l0GBGascVyJoCpplkgQCA9psQpti2o
	qoDB8fZoHv6L5YGUey0DEOmGyHQB0JOav0W36AUAdsh3Bj+YsWDMaCNb9wl8kW0RHZVDTow1Gj/
	JySkxVtBXPpP0knwZMhzPNo3S4Z9OfwR7YwKlrq0XExIzwBlsXquP2HE+VZWY7sXja/4Fjy9Nec
	oeKbMNr55LHm03nCGZnuLhcv9943xavockwG5xO1fMjaLENs3eWNdNPmPmhcteF4D75EFy6qsrC
	RH8P+ZgSkaJHAW/cnAzuL9onNJ42dP8Pe20kfH5P2KYT6/fY8LN9WXvQ/W1/Ypo1RAh6xWJf3WW
	zKi
X-Received: by 2002:a05:7301:fc09:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-3619ed14879mr3861986eec.5.1792244786348;
        Sat, 17 Oct 2026 06:46:26 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:be87:82b8:3e01:5e1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm20337821eec.3.2026.10.17.06.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:46:25 -0700 (PDT)
Date: Sat, 17 Oct 2026 19:15:57 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, vireshk@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <atN8FallRb8IbXT0@user>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
 <2026101707-routine-hatchback-4a35@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101707-routine-hatchback-4a35@gregkh>

On Sat, Oct 17, 2026 at 01:20:39PM +0200, Greg KH wrote:
> On Thu, Oct 15, 2026 at 01:52:38PM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Use %pe to print error pointers directly and display their
> > error names.
> > 
> > Keep PTR_ERR() calls when the numeric error value is needed
> > for returning the error code.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> > v4:
> > - Return error codes directly instead of storing them in ret,
> >   as suggested by Julia Lawall.
> > - Remove the unused ret variable.
> 
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - Your patch did not apply to any known trees that Greg is in control
>   of.  Possibly this is because you made it against Linus's tree, not
>   the linux-next tree, which is where all of the development for the
>   next version of the kernel is at.  Please refresh your patch against
>   the linux-next tree, or even better yet, the development tree
>   specified in the MAINTAINERS file for the subsystem you are submitting
>   a patch for, and resend it.

This v4 patch did not apply because arche-apb-ctrl.c and arche-platform.c
were removed by commit 2f75b2eac999.

The fw-core.c changes from my earlier v1 patch present in staging/staging-next.

Only the change to uart.c remains.

Should i send a v5 containing only the remaining change in uart.c?

Also, should i keep Alex Elder's Reviewed-by tag in v5?

Thanks,
Pavan

> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot
