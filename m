Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C78470EB6;
	Mon,  7 Sep 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779161; cv=none; b=WyX3ISemMidwCyj15oTe19qbgbxD0bHNNz4I4WNopwjB3v22BvKFmoRRVcSztalbndEnOpmv+yr60SVlj94ncQBavjRqNymwNUOr5+0EhVWaQJyRJQXsiNqxEmvDEWA8/0+cAmp56xCwTJKzhCg55sY7OSHXUHWmBm5SRnkwp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779161; c=relaxed/simple;
	bh=iVxLW+SFQK6mvKI/2nWAPUixPE4MDKow5h/SV69v8E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2PLb49s9ChmPkpZ++4khZYBa6blh0alDGkNnh0INQykeL/+Zsi1hRdo9zZUcyBYssDN6WY7wB+yJBaxzb239JJsAVP7YPgbaw7HkPHwgFP5597H9ZwZks0JAZ+pkBo9Onh7noqmFduG/cKf1oth7dxF3hzC/hPxkM0J+NuEGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cy1E7XFI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cy1E7XFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788779160; x=1820315160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iVxLW+SFQK6mvKI/2nWAPUixPE4MDKow5h/SV69v8E8=;
  b=Cy1E7XFI9MIupw44BmsQJ9D0YFi6di5o/xIfjNb8rrTBwhtfwEpbc8G9
   aCQ2SPPdnnhNOWxwAm2/5JBdOJvak7mv77GHKCEG93yRHj+TWh697EFbZ
   anb9a4YO8qefJAP8eBOuUkGt8yJUTumtU/3OMnsQl5gBWgv9/V3P77AE5
   /RH1jfdwIEd2Oq9t1diptzpdW6I2byIOM+GwaZvbpP3NJX6cvebCSF8QS
   NwGWsSFnEvYneF1ihKee2gVqqRSbYsf8JV8v7xur6fKP+OJ2LC7X1a3/y
   w1Ba5t5LDHZc/chYOtaNnHxqM9CwR8yil5WWGofWEoAGHxJyrm4YjwRYa
   A==;
X-CSE-ConnectionGUID: kYO3mbibQYalL426ruepRA==
X-CSE-MsgGUID: Sn6TcANPSg2sLY90KR2HMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99775959"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99775959"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:05:58 -0700
X-CSE-ConnectionGUID: a0oW6NaqSvyLGCSDKUtpnA==
X-CSE-MsgGUID: 9NERDJonTgK8P3+8F4LcQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="268105414"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 07 Sep 2026 04:05:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7AA5799; Mon, 07 Sep 2026 13:05:55 +0200 (CEST)
Date: Mon, 7 Sep 2026 13:05:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Retry if notification enable timesout
Message-ID: <ap6akwNAlqmJPMOz@black.igk.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>
 <anMmhwSSLEAnAZZI@black.igk.intel.com>
 <b98ed1c6-37fb-4235-8ebd-df350728f797@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b98ed1c6-37fb-4235-8ebd-df350728f797@app.fastmail.com>

On Thu, Sep 03, 2026 at 02:18:08PM -0400, Mark Pearson wrote:
> On Wed, Aug 5, 2026, at 8:03 AM, Heikki Krogerus wrote:
> > On Wed, Jul 29, 2026 at 02:21:50PM -0400, Mark Pearson wrote:
> >> Found on Thinkpad E14 G8.
> >> When UCSI notifications are enabled the FW does not ack the enablement
> >> itself. Future commands will be acked correctly.
> >> 
> >> If this happens try enablement again and confirm acks are working
> >> correctly.
> >> 
> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> 
> Thanks Heikki.
> 
> Just curious - what is the process/timelines for this subsystem for patch
> being accepted and making it into Linus's tree?
> We're tracking this for being able to get it into the distro's, but I want to
> make sure maintainers are happy with it first. I couldn't see it in usb-next
> etc, so wanted to make sure it hadn't fallen off the radar.

I'm sure Greg pick soon.

Thanks,

> Mark
> 
> >> ---
> >>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >> 
> >> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> >> index 49f1c53721bb..ea25c44c2850 100644
> >> --- a/drivers/usb/typec/ucsi/ucsi.c
> >> +++ b/drivers/usb/typec/ucsi/ucsi.c
> >> @@ -2082,6 +2082,12 @@ static int ucsi_init(struct ucsi *ucsi)
> >>  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
> >>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> >>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
> >> +	/*
> >> +	 * Some FW may not ack the notification enable the first time.
> >> +	 * If this happens, repeat to confirm it is actually working
> >> +	 */
> >> +	if (ret == -ETIMEDOUT)
> >> +		ret = ucsi_send_command(ucsi, command, NULL, 0);
> >>  	if (ret < 0)
> >>  		goto err_reset;
> >>  
> >> -- 
> >> 2.43.0
> >
> > -- 
> > heikki

-- 
heikki
