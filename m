Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900682;
	b=dszq2lAVIR+w2wLWA0YR2jYIkOtGg/33zHgRzjgyEPdx490ijWYnq1dTJhK7VkxVZkid
	 vaCZQnVNPF0XrPKeNCnLvsEQ75Yeju9ip75mhntxSzWoMKLfBl6MvBJye+MxrV0K1m13w
	 nU06xNDB1wTnp9Sc1FIKwDR3enUCVLQ2ciq7ZZN5r6PyEmcL2t7jL4J1ZDgaHhEQAbd8s
	 75/w/6bTD1wZKphcyvJlsU0PWCFJXGb/OSx4qb/50GqITYnfIP3igmBx8dUSn7kV1Tlte
	 OquYWKu9DbbdGPJLjV3FYxraClQ9Zlg6QoyM7PSi6lmUZWZwayc05G5nwZci2uaEUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nZAOGAjOf6sEpVtM8pdi7ewS7F4GJROoGs03Q8/6ak4=;
	b=x35jwn6mTrdLHTZqxMsNBaFrUF6cJNrv6yQdFlTNitEwWdWi2UdnFB7hE3tHg7C9aIwM
	 vq0K+a9u7FiWGfmuzo2XlW4TIiXjjGLl/pS8y3Nrwb4xByoQR0VtjXN5UrER1Vp2XuTne
	 0D6lLO2dV+0wCHjJpQDiMuVkf77qIgn/fKQnBhzzWm2/q2KPsSSCgK8ave/e3qHdOyF2j
	 +3I9cGx3rg5TJ1INs2i5tjK3Ass15VOK89npTVkcQP7JuAAMP/St9y5FJ3hL4pvg/ty9/
	 cUGm+CBoNkaTytdMsL2eap97jDUD9iJ42/vZV5of4fWXrf6IYeNN24GDrIHh+4r/8UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nM4HyT51;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC8606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACC8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nM4HyT51
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-945ae2daa66so209557485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793900681; x=1794505481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZAOGAjOf6sEpVtM8pdi7ewS7F4GJROoGs03Q8/6ak4=;
        b=nM4HyT51BzNzQEZm0VzMIBTMyd4jC8paorZJ1Eklr1/wIQSP2AbQWGWTQ3QRqIlvDK
         MYz9O3rXsd8B96sXmIO0m8PnXeQvMeyzxnyVX4vi3CNVtCU2mXgzQXrf7Wfm11fnmW8s
         2oIjtAXP4KEPMLzjhgw+bXM7Yy/oZ+tqxpZIlnuryuWD7ZevRwG+JyENVz/2mqmm5uSg
         ETJQSF9/8ijH+KEzTcenCEpwH4gD2B6Fl+fdv8BKhgnZeCQnK0Z4iM+hZhjg3awhLDB4
         kEYOGrql67xj2rbYPY7GuL59Fm2N8y7Bj6HfcBUBI5BbospXsv3I8FyH0+iSgBAE2uK2
         P3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900681; x=1794505481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZAOGAjOf6sEpVtM8pdi7ewS7F4GJROoGs03Q8/6ak4=;
        b=bmN5jOY6JAweY7KrIcrWZpltojmpMDgSpaBkVUkbYkELchuF0wTZsk06Gns9I+jrw4
         cRyh629pVx6foZYIRdNUxKRexlaU3sl8dzqeAmosc6bLopFYLhIsvihCNvV5hmne/xA6
         OdtEIh7bfqcBD0nvhZF/mOsIf9e9OiqYUxWR439P2WS57ig3baYjM4Z/6oIozti4Etvx
         dDZRyxVF9EpA9PDFfumPNTA/xmZe+V41kQIAhEq8aDu45mmYj+Bl4UwyxvYHW/qnFMNa
         sfIbBM1ivZgBss7xeZU9LDKrqhvJjU6qgc7e5OGU6q1yUFe9rBnBVjmZOc7tCoVEBdhZ
         51Fg==
X-Forwarded-Encrypted: i=1; AKwUvBzeYXtM3FlMdmE5iLPq1IUVvU55rpncwyXEsMz1qRa7XF8GoPoPQ7TCwvCc5ykyHpfokw9OAvqj3BwwkcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LVbWGh+h48WwCJ/TrQt0FcPYRwWcwmLSAqXwH/600WM8w+S0M
	z6OAE+fZAkS7lnwkIW2eXzDvlZpLhmgIZCGIqzoeVWtjm3Al65fE7ovjTJBxN4aZT8KG6mLVHVW
	JduIYubm4
X-Gm-Gg: AYBFou1ltFNyENDfoIAHukJFyqDQ3wuOUj4U6Sy2OkgC3mJYNGgGscW/x/GYPYQ67oG
	FZMs1rSqfZw7bbjgzVA9F4eODeVhtEVARS/2CPFOAqYM/EL2+kVbN1osiJ1jjAuXry8lkzScYCq
	lyNdgPn3ce9CpFv3IUXtYSC+oEIwL0oJ9Z8XOMKO6Utt2fGVdV3gqvP1JLYkSXgban3VnqDGCJW
	/J+YvQFFfCyLVkgOPeprz65J916sQi9Kch6eObiVgicMVDxqVFVigIFpoc1Dk1yTZBNLFyaDOQJ
	hXgXQrLA4zKZrfyv+RcgBysYJhzP8EMA48nGFYdVwNHacglXOzg5rL2nZ/FKhQd7ec7QJLPyZgr
	KH/64FFyPsSuqfeeM4Zqq8/Olgkbbqflvq1a/1BECIicvi7PfXZckHdSG9FhXqvxGjMVqbcJMB5
	Adc3QjfrO/eXJR4N8veuq43sPXde4nuSynaY+59nkjF/OZqgWLGzoOdgqdQbf9V/dvWBXyweCMf
	2uO6G3GusVZww9mYFjuHeJSEj5Z0Ged0auIsXwy/22HL8E/EcqW+Z3Dijm6bxtT1dTbVUgJHQ6Z
	kE201oicyDAS9olQOwtNMlIFm8AU5RKv8OfMjzh6TDwH2Q/V4g==
X-Received: by 2002:a05:620a:4409:b0:93e:f97f:f245 with SMTP id af79cd13be357-9442173e65fmr3211975785a.30.1793900680581;
        Thu, 05 Nov 2026 09:44:40 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea68fa5e2sm1219756d6.1.2026.11.05.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:44:40 -0800 (PST)
Date: Thu, 5 Nov 2026 12:44:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
References: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
 <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>

On Fri, Nov 06, 2026 at 01:23:36AM +0800, YuanZhe Liu wrote:
> Hi Alan,
> 
> v4 drops the port owner exception.  You are right that
> USBDEVFS_CLAIM_PORT hands over the device behind the port, not the port
> itself: the device is driven and suspended through its own fd, so
> letting a request poke port state on behalf of a claimed port does not
> buy anything.  With the exception gone the helper in hub.c and the
> declaration in usb.h go away too, and this is a single file patch again.
> 
> I kept the interface class test.  I agree it should not matter for a
> device that follows the spec, but it costs nothing and it keeps the
> check in line with the two entries in hub_id_table.
> 
> Then the -EBUSY for tools that switch port power without unbinding the
> hub driver is intended, as you said.
> 
> No Fixes: tag and no Cc: stable, following your recommendation.
> 
> You mentioned that usb_hub_release_port() and usb_hub_release_all_ports()
> should synchronize with outstanding URBs sent to the device on the port:
> kill the current ones and keep new ones from being submitted.  I would
> like to write that as a separate patch.  Should I send it now, on top of
> this one, or wait until this one is settled?

I'd wait.  Also, don't be so quick to send new versions of patches.  One 
or two per day is plenty; you want to leave time for non-AI people to go 
over the current version and comment on it before sending a new one.

> YuanZhe
> 
>  drivers/usb/core/devio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 486ced74405e..d39ef9a80ec2 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -878,6 +878,23 @@ static int findintfep(struct usb_device *dev, unsigned int ep)
>  	return -ENOENT;
>  }
>  
> +/*
> + * Return true if @dev is a hub.  The hub driver matches devices by device
> + * class or by interface class, and a hub has a single interface either way.
> + */
> +static bool is_hub(struct usb_device *dev)
> +{
> +	struct usb_host_config *config = dev->actconfig;
> +
> +	if (dev->descriptor.bDeviceClass == USB_CLASS_HUB)
> +		return true;
> +	if (!config || config->desc.bNumInterfaces < 1)
> +		return false;
> +	return config->interface[0] && config->interface[0]->cur_altsetting &&
> +	       config->interface[0]->cur_altsetting->desc.bInterfaceClass ==
> +			USB_CLASS_HUB;
> +}

More than is really needed, but okay.

> +
>  static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  			   unsigned int request, unsigned int index)
>  {
> @@ -891,6 +908,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
>  		return 0;
>  
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change hub or port state behind its back, for example
> +	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
> +	 * being released, is not safe: the request is passed down to the HCD,
> +	 * which may walk per-device state that is being torn down at the same
> +	 * time.  Port requests use USB_RECIP_OTHER and hub-wide ones use
> +	 * USB_RECIP_DEVICE; the hub driver owns both.

That last sentence is odd, given that the code you're adding doesn't 
check the recipient.  It should instead say that IN requests are safe 
since they don't affect the hub, but OUT requests aren't allowed unless 
the caller has claimed the hub interface.

> +	 */
> +	if ((requesttype & USB_DIR_IN) == 0 && is_hub(ps->dev))
> +		return checkintf(ps, 0);

I'd do the is_hub() test first, since that's what this special case is 
all about.

Aside from those minor points, this looks good.

Alan Stern
