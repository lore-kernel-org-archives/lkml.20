Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D93BE620;
	Tue,  1 Sep 2026 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271826; cv=none; b=Z5PtvbimQFCz5v1+Es61R3Gku3NEO6xT4YIR/8CQrfrmZGm1Gx5RZBtyl2kIoTKuSW28RwpNa7v4gON1GQIDvwqMEw/8wZBYTt7kIruXkpg8Me85VaS2nfF2i63bTL2OapybLcOvMg/G1qQ6uZosejgkL9eIYddrRGrsUFK2Th4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271826; c=relaxed/simple;
	bh=Zfq8q0bbfvmBbEsQBeH6pCvR4ahx6S0nEFgFg7fRqKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF/DikWruao0Ku8DD2p5L8ZtmDEGb4LP1dCNItHHQOZdnpDk0YhvuoGbTS9r4I5FRJRSLZMZSuxFKt1j3IF8w5aAH8iZ4J8sL7F+ZkLX/2lZTO9S4Gv2dl0EfGyKbnfdstMyrT59QKV4XfEcZRBLX5wbm/cAtaHZAVcM+07fSzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UBDi8GSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UBDi8GSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56F41F000E9;
	Tue,  1 Sep 2026 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788271820;
	bh=0oZFZJRU8T3mXJOZmvdMOP8WVxz5gwtejM+juXIF4bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UBDi8GSiFO3nCiMdfGnEBHLmpEePwNtIryhGxkceCriRi31b47xkdCZejlMZvOzKX
	 hljD/DwXJdQwTUXKuGni5CdDRrI9Wklw5jDjUhKDlzHNGd29RfK3Nx5W7+mez01EjI
	 QJfEo1+fI/CrjtB4rftKnOwA+9MU/O7beY95WyZA=
Date: Tue, 1 Sep 2026 16:10:15 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git@amd.com" <git@amd.com>
Subject: Re: [PATCH 0/5] usb: dwc3: xilinx: error handling and teardown fixes
Message-ID: <2026090147-overstock-smoking-1ed4@gregkh>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
 <ao4xQgvplTIFQk7K@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao4xQgvplTIFQk7K@vbox>

On Wed, Aug 26, 2026 at 12:22:38AM +0000, Thinh Nguyen wrote:
> On Mon, Aug 10, 2026, Radhey Shyam Pandey wrote:
> > This series improves error handling, resource teardown, and system sleep
> > PM robustness in the dwc3-xilinx glue driver for ZynqMP and Versal
> > platforms.
> > 
> > Patch 1 switches probe to device_get_match_data() and adds the direct
> > property.h include instead of relying on of.h for that helper.
> > 
> > Patch 2 introduces struct dwc3_xlnx_platdata and moves ZynqMP and
> > Versal setup behind plat->init(). The struct also defines an exit
> > callback slot used by the later teardown patches.
> > 
> > Patch 3 fixes system suspend and resume PHY handling: suspend now
> > powers off the PHY before phy_exit() and propagates errors; resume
> > disables clocks if PHY reinitialization fails after they were enabled.
> > 
> > Patch 4 fixes ZynqMP init error paths. Reset handles are saved in
> > driver private data and fall-through error labels re-assert only the
> > resets already released before unwinding the PHY when init fails
> > partway through reset deassert or PHY setup.
> > 
> > Patch 5 adds dwc3_xlnx_exit_zynqmp(), wires it as the ZynqMP platform
> > exit callback, and calls plat->exit() from probe error paths after a
> > successful plat->init() and from remove()/shutdown.
> > 
> > Radhey Shyam Pandey (5):
> >   usb: dwc3: xilinx: use device_get_match_data() in probe
> >   usb: dwc3: xilinx: add platform data struct with init callback
> >   usb: dwc3: xilinx: fix system suspend and resume PHY handling
> >   usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
> >   usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and
> >     remove
> > 
> >  drivers/usb/dwc3/dwc3-xilinx.c | 132 +++++++++++++++++++++++++--------
> >  1 file changed, 100 insertions(+), 32 deletions(-)
> > 
> > 
> > base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
> > -- 
> > 2.43.0
> > 
> 
> These patches look good to me, do you plan to backport the fixes? If so,
> can you Cc stable and re-order them so that the fixes patches go first?
> Better yet, keep the fixes and new changes in separate series.

Yes, this should be 2 separate patch series, one for 7.3-final and one
for 7.4-rc1.  The -final series should go to stable trees as well.

thanks,

greg k-h
