Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054776;
	b=Bp9e3hN0ZeEb2RPDU1fHr8FXftY3HfW0d4hh093jNsd71awiE47P5hFKtUPwUd9Wrdp8
	 IGr0uwmpPl6ix/m8XgMClK7un3RGTnl0AM2RaU84zJWV17aL1+qVS7umHMCE71R4JLoW5
	 /nrb+o6aDnqs25YBtrQtgM2bsnTNv8DAxtjDzKjJndRIK73ssRWxaFDUG8HvLPG5EaSuo
	 a17rElkiyntbaLX8qExhjUgXcm03Uj5t4HnnjXv+2yMqaGzU9SnYgSijejEJva7PlfyXb
	 uHe0NqBCeJiDR6lq0OpgnUrXStRZvSJWEZOteDX+tA7R6C8tVQK9gbW9ChVmBhIA+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
	b=SVlgGpcSGe2VHvnom2SXz3Nk0JoqxvRoGQW3nxRnvZnUSXNLwzy9nZZ05YwWpvCrp/cO
	 gf/GLA6y6uBhIOZ41vpHdKwUW3zNbT2Ti1GQwzbMnt6AEMZrfchtBCH1hSS/RkgBSkVyW
	 8iiklkx06k5FEDeZ61TLdO+87IH8Wc1PXD0f+ay1VEaEYK5/aOaJT7bO30yTZAmaTwmsQ
	 nj/GKKWWMq25hmC8PLC8iJYFLBgeO5rC/89FmZ9iCUUYxzm1m7lsExuPh1WrW4emztY21
	 GNKwvPCV27su7VV5jgsB6/A7LHVd3YCg3d6x/dn5Lfv/PJT6wJIcYzFjVYWHY359hZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FkMZwh2x;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0B6606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0B6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FkMZwh2x
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f1cf92c9eso430061985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793054775; x=1793659575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
        b=FkMZwh2xzPGwRXd/6L6YakG28E0XxcbpH4yKhlkVxLiFKRDjnkg0rF4SuQFtOzIsX3
         f5EydNInmzCSCkyh6zkwX5LrW6pJx+yykjP8eF8zTTd4GpSQj2j9YnRNaZqf70z8RmUZ
         V0j9HOG4zRyyPYbjGh8fDJ0CD1b0yexVSSPmIWU3JWr5lLooPlsfB7nv06CCSg5v12eV
         SoxqEP3dz0sh5FDLSqHEK/sK60fYdYH1JO0HlXuGIhkW+uO84PFYtLiQpk8JsiURcZjY
         uPsNy3n6D4nHtcEj11lG1ob2im6ANFeMkqY+1XCA/fQxPdUxjOQ6lMGPBUzC0mYbVssK
         Q32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054775; x=1793659575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
        b=pF5+Jb27kbqRPNlsLPOcz6EIo2/IZ3u3xNzUrtHOw2rvmoUjomHGUCv9MTGfzbT882
         EzmkirndoMnSbVAYsvUsbd7gspwff70R/URMkAPdU9RSsHenma+dj0JTZlc7Lca85WIB
         Pui2KoCBhaqgNhR0OlZoqzX3Dq10BYoQYxXxcHbulRTM5SrJZzT/fKGpWCS3tUYXLniE
         yelzzreYYeOHgem1EW0CTBU4+4v+iyCPsY2E2d4inu7WVMD6DXoYluspxuL/J3fU0Gjn
         w+/i3rgmrcneWFf38kSeqDGf+OsB8RfQ8yKYJzB/CB20lhOMiaswrfzTPlLrqhDJ/NY7
         pPYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiztzc+931qN+ToxyYJViuQ9GJ3Jinoxt15taxz7KoIWus/7JxaptZKRMCVmMnGvMiPLWEBr850HV+qqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNJEKtfV62vnOdPoOBA/ri0LMN03wBEQO1kPcuWkXI2iSZzQsq
	KDRiiFXEIB17/MnvbbHOrCtlKNqB5ZFfw0/JZ1591zz6i7l32E61KK+V9vbZI6nN50M=
X-Gm-Gg: AYBFou1nR63zzAyX0pW0/s9KKBYbAPQtUPeyxtGmVjy61Wkme56iJIk7Uzc1OeAK73J
	vZ/XsSlNLxc4vLv5zGc10d2DGDRk3Fhhm9gNOQCPhUe7mhLB63KIshZizFwj1+gWlhFcad/l777
	pv5Eq0Psi+g7mlhBvq65VDMyErswmVPsAeTkD+oeb4luBtuv8wYEHK3lG0bOqT/y1aksEG5ePjk
	JvIyAEpRztsqf1P9uOggAhtfqBcCA9L4y1iM1lAmQ04MwxdgcX2CkW5hdaIuhIHic8oTUJV2g0Z
	Yljm5dg+9gfxyBNZ68wrB5VAKWZpMgxOgfLXcTDDwmdbiKOzKN/MSlz0X+18fi5C0lmDAEEDQd7
	tH/anhKgf5pOKu60TbUTHJRGUvxG2cQVXg1MT5Ke7MpNiTP8dY54nKK+CT2skLewLwa/XB9o2TC
	hTIcxUp+yOO064vXXzd/c6bm3xr2IbrwTAhorVaI38B3mraRsw6gZ1pJnU9Kh/3voMcLcuDni6X
	3otANyd95A6Y9mx+nQy/wmkrTW0+GEQMCUDJSkCVBLg2CPrNrtZ73c7WA+TLg7uXTxkdKiMih4u
	KL+oOkyxAfg5ILdBPlEdr+zETefSumKboZNtlw==
X-Received: by 2002:a05:620a:4728:b0:93f:2eaf:64cc with SMTP id af79cd13be357-940ef942794mr1259449285a.44.1793054775098;
        Mon, 26 Oct 2026 15:46:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b20e0sm810207185a.3.2026.10.26.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:46:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTSF-000000087nJ-1Z9f;
	Mon, 26 Oct 2026 19:46:11 -0300
Date: Mon, 26 Oct 2026 19:46:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026224611.GB1685504@ziepe.ca>
References: <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
 <20261026184312.GA1685504@ziepe.ca>
 <2026102604-tint-catcall-433e@gregkh>
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
In-Reply-To: <2026102604-tint-catcall-433e@gregkh>

On Mon, Oct 26, 2026 at 09:05:06PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2026 at 03:43:12PM -0300, Jason Gunthorpe wrote:
> > On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:
> > 
> > > This is needed for two reasons: to save hardware and software resources
> > > when creating a large number of VFs, and to allow the PCI config space to
> > > be configured *before* the driver starts using it.
> > > 
> > > There is no in-kernel alternative.
> > 
> > Having userspace involved in driver binding has also always been the
> > plan for confidential computing needs. We cannot have a device driver
> > bound across some of the HW transitions like TDISP shared/private, so
> > there has always been an expectation of bind/unbind.
> 
> What, why?  What forces that decision?  What's wrong with the proper
> driver for the hardware being bound automatically to the device?

It would be a proper driver, with a real match. I would expect this to
be done with sysfs driver_probe, which is like bind, except it doesn't
override the matches, AFAIK.

There are two sort of related isues. Userspace is in charge of
sequencing the new PCI features like link encryption and TDISP. They
have complex authentication policies tied to them so the kernel can't
reasonably do it. These features change how the CPU does address
translation, effectively it adds/removes the iommu - and that can't be
changed while the DMA API is active or it breaks every translation in
effect.

So.. We need a gap a system boot when the driver is not bound so the
PCI stuff can be done prior to driver_probe, and a gap if there is a
PCIe error of some kind to do error recovery and go back to the start
to reauthenticate and reload.

> > For this case the existing sysf drivers_probe is good enough for bind,
> > but we must have taint-free unbind for PCI devices too.
>
> Why?

See above. That should be the easiest thing to ask for! PCI is hot
plug, disabling unbind makes zero sense from any way you look at it.

> > I think this patch should be reverted ASAP, it is a pretty major
> > regression for a lot of users.
> 
> But this use case hasn't even happened yet, so what would regress?

I'm reflecting the other commentators, I care about VFIO too. I think
tainting every hypervisor is unacceptable.

But for CC I find myself one of the maintainers for that now and many
people have been diligently working on this bind/unbind direction for
a long time now. If it goes away I have no idea what could replace it.

Jason
