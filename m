Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420205;
	b=fTeBChBv6MuBjz0Z2Pz8mX99Hlg7G+yTey21DC0aUFSv6lGOmaDKydd7SvTf73kTdhbd
	 TGKmpG8E1LBnXhwfe4m8G5S0YKR4WQ6oKmMgEtoLQi/kJ2Jli4OfBGw6xvZ2BQAv8WIHG
	 Q4le90HmjJ1DdENiIChGbaLCOOh8VqxS+vwUqBzLuV8dzArtkUsy83B1SFQmKxgBmzuve
	 52gWP25qEl7vP+Y8OrwOzE7j5osBvSkhlsquRHnFB2PK9CidPmtnXUW2jK3PEqDIRUSAc
	 47vQ63aB+S6qHLts9YLh/blGN80mSht0hfBqDdBLfbgh/eKf1Py9CZSQziGPyeowdBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dr4r/lEBb5xuUcD8BOU9Xdjlpmhf/DQoTif+P9r4G1U=;
	b=iuXCSOGuU3LaAfBui09Sdbgj+OkMH6DNXLibIwX9nUDjMURiWnJLitbcsArdmFUd8fPI
	 VjgE3pqndbbJhaPF4Ws3PBe68fkGPhJIasvJ8KDcNx90XQyDpVb0NSRJq1J0KwgSNfn9b
	 upaOJuYh/rk9K8/+wRAu6gOQfWA4y6N2wLxnA5YpfkN5kssdwFmFh0E2ZoDAD83hikky+
	 IN5GijsWSlw50Jwgb91M91EkSJFfjoUOaGzI0jzuvuepSfLpmnsn788r+j7eq0NqiBNBI
	 uYDMYpG8jr4ZrzoKi57vpuZYEMyqMWcHImhOsqrLuimNPoObMKuyPotPpkBNycFhzaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=INPcjmg3;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70013606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70013606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=INPcjmg3
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48ed0b68895so954870fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793420204; x=1794025004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dr4r/lEBb5xuUcD8BOU9Xdjlpmhf/DQoTif+P9r4G1U=;
        b=INPcjmg3TV6T9OKJSme9EMV7D4kdpVtFWP1ounWUGIKHzb/eM1tLHvJ3upGmuNvPWo
         Lt3FKZwSQJs8bTqPUeU9YpE7748bQnO0A6HbrM/UpuQFWRa6PoVDsXo7c4Gdv4+mKhfu
         /0KCBHMxZLnn0w4uL7YBaKCjG+mHTLgpkAvBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420204; x=1794025004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dr4r/lEBb5xuUcD8BOU9Xdjlpmhf/DQoTif+P9r4G1U=;
        b=ePp7d80ci6yAO+W4CwZjHTfLjWnPwnc6XXCwqQjecmcOMhmag9xIj4AL/Bf5FXT7w3
         c9O2Ks8Y0jswFck1wFL/3J0H1rFiy37n9eTIdyhPkpHGRt4VI50ySsfG9tfXI7qDK3+0
         uzFR/yBXAEmjgzBOQATxJP6u8HgjxXElIND7K1w2VpOqxYj+Jo7HC6eSPlMdm6xW24Pq
         Fdyd7tI0WHUd5MDpgDQEn+TjvAT+g9Zk75LheXOlW4/vc7tIHx5bJgtTtJfMQBqWwTFZ
         u/jzm02Iy1w54PTMnDwGBS7mzspHP7NhqA2FWXa9Q4WZzeBD6eEDlNibDk+JYMyHKjN8
         lKcw==
X-Forwarded-Encrypted: i=1; AKwUvBwdIQW5Qs2PM0g6nwiqZvTpqPowOEc2CYXUi3nx5/1vZ/ETDL5t0ogVIMcrVP+/46qnf+5B8dh8uCe08oI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbA8CE7BCguOUNjGynrmEGlT8Jz7MPA7hkYwZEE7yldq0/eXOc
	+1I/PEsjGIxcFMyUStWcs7iZ5ehleaz5QY4UflVd2UXiZd/1q8pbsf2kp1MEdwjJHOtoMQaUW/K
	s3m1RbDtU+A==
X-Gm-Gg: AYBFou3DMlf9rx19tJFnIUGBBbcZcZ92EgsIu3iHcPE92SeNQKjnE1kFo/jAUDiHWZO
	TfT1/PepL6LKc0h3bIe9pvmEQb2dEdcMqFLhnpxJM087QGWn6aDllnwrWmQT2aWnAzq4pnfJO0C
	MPECQ7mve4pTVFXb+FQqz8vpWRGOutWmnhg44oFofEjCHje/qCazmBtyxOGvhEHHabuzEcR8o4p
	D1jUFYgKAQTIX5BwDQYYpsOYNrII4xJH3QEgqKiHM23vLJFJbC5PIL5Ni3yiC9SiKXHaAJJN4Iv
	tbM844H08j/GVBGv0IZzkAJp5EojLwV5WNrFfkBjBvLmn4FKXJS2zQfnNTZPsHzy0GiN9Y79Lal
	kQ7PuglJBtUCpDk54yHMJ6DODy4PR0vBZcKARh3lJeyYybsYn3PtRmXP15J3OpCR2/GJ9TFasVr
	2XcFBV72B/GD1eXHTnGKb0vog5zwc+FSz0kuZzUg0km3DRo0XrqjNT6l5yWyL7sbeC0k+DeqOgs
	6KuzuS5EwcXWbRI6+mDS/L0hCwmLvqImxc0Qptdge2UljwHBDPDTiFYojyFb5d4xffZHGNmYtuv
	DsOuQRVpU7tfAtI6ymT/oQm8JEcBFWf69eCayuCV/fKtMapUE0NPtiC/ZhwXletBkwlBeYO2rVK
	OzEpf9mWe
X-Received: by 2002:a05:6871:8903:b0:498:c323:4a90 with SMTP id 586e51a60fabf-4a9076e0878mr2842634fac.33.1793420204314;
        Fri, 30 Oct 2026 21:16:44 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92196a7eesm1457788fac.9.2026.10.30.21.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:16:44 -0700 (PDT)
Date: Fri, 30 Oct 2026 21:16:40 -0700
From: Kyle Zeng <kylebot@openai.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	linux-kernel@vger.kernel.org, outbounddisclosures@openai.com
Subject: Re: [PATCH] iommufd: Reject opens until module initialization
 succeeds
Message-ID: <auVrqO6e2daXFwCW@com-75606>
References: <20261030042345.74537-1-kylebot@openai.com>
 <20261030120845.GA3889730@ziepe.ca>
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
In-Reply-To: <20261030120845.GA3889730@ziepe.ca>

On Fri, Oct 30, 2026 at 09:08:45AM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 29, 2026 at 09:23:45PM -0700, Kyle Zeng wrote:
> > iommufd_init() publishes /dev/iommu before registering the optional
> > /dev/vfio/vfio compatibility node and running the optional self-test
> > initialization. Either later operation can fail. Since file operations
> > can acquire a reference to a COMING module, an already-open file can
> > survive the failed initialization and refer to freed iommufd module
> > memory.
> 
> What? This seems like a core bug not iommufd.
> 
> files take refcounts on their modules when they open via this:
> 
> static const struct file_operations iommufd_fops = {
> 	.owner = THIS_MODULE,
> 
> If the module hasn't even loaded yet I would rather expect the core
> code to not allow the module refcount to be taken, and if it somehow
> succeeds then it shouldn't allow the module to get yanked out from
> under it.
> 
> It is hard to guess what crashes to be more specific, but
> at least misc_deregister() is safe while files are open.
> 
> Though I wonder how module auto loading works..
> 
> Jason

Hi Jason,

Sorry for the confusion. This is supposed to be a two-patch series and I
accidentally dropped the first patch.
I'll resend the patch series. Also, I have a reproducer for this issue
and can provide through DM.

Best,
Kyle
