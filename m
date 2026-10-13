Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FD3B6360;
	Tue, 13 Oct 2026 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872964; cv=none; b=n40yFQV4iuHkZJSlmTH2EW9N4EwqWRpP6i1S2BaNeILZ7v5sJySdw+Wu+s5HYp/tGGuRrFJdj/dI/R6qx9CNTqL6g75uVUUCLAGZjp1UcaFC0JOi8LvVL9sY0W21Kx4ZjgpZkdGzsdjJe5NbBGY6Q4kZyJjJEQcCoowvUbQ+kq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872964; c=relaxed/simple;
	bh=pSklaDpuPyvg7r7DuDox4q6/NqbyS3V9BDvwqb03vl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M91Qfma+9EcrhQ1KkHW8ae191X+9nybW/uCyOE73zDaLN/YMuMtq/MH533wS5dWPWTZ5bgoNFF6ew+FbUMJy9PV9uB6zVT0dlnbhY1XJPZkhqjZskMvkzlO7yfHgRAWssagkTgxqe7Vc/Ir1WUf0IPX4IVFqA6nQXWets490Om8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bksPQPnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bksPQPnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23931F000FF;
	Tue, 13 Oct 2026 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791872962;
	bh=g7n2HMC09iJPFYJPuys2gP09JJ8k40tak6JFw4u/lQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bksPQPnCqM1mp1Hz13PezHpcDTCIVLTjIswmiUXgE7z90t7bUN4ddT6Ql+xzl0y+U
	 cgNRm1MfYjZ4bw6xKUntcbdm4T1XV1N9UbDkdgyI9gEWA7NP+hiYgGOGzY/+zIxI4Y
	 Yw8ULgrkb/Om/b7uQhIsiXMiGqDFPtVgOKsT6TTE=
Date: Tue, 13 Oct 2026 08:29:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
Message-ID: <2026101347-sway-occupancy-52e0@gregkh>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
 <6d259ee3-a737-4074-9066-3b01e3673e1c@altera.com>
 <aq2x-bwWluxr8oMh@vbox>
 <97d2287d-17ea-42f0-aa62-69473431fea7@altera.com>
 <2026101350-tipped-connector-6c05@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101350-tipped-connector-6c05@gregkh>

On Tue, Oct 13, 2026 at 08:12:23AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 01:53:55PM +0800, NG, ADRIAN HO YIN wrote:
> > 
> > On 9/19/2026 6:03 AM, Thinh Nguyen wrote:
> > > On Sat, Sep 19, 2026, Ng, Adrian Ho Yin wrote:
> > > > On 9/11/2026 5:04 PM, adrian.ho.yin.ng@altera.com wrote:
> > > > > From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> > > > > 
> > > > > Agilex5 integrates a Synopsys DesignWare USB3 controller that is probed
> > > > > through dwc3-generic-plat. This series adds:
> > > > > 
> > > > > 1. dt-bindings for compatible "altr,agilex5-dwc3"
> > > > > 2. matching entry in dwc3-generic-plat
> > > > > 
> > > > > arm64 DTS enablement is posted separately.
> > > > > 
> > > > Hi All,
> > > > 
> > > > Gentle reminder for this patchset.
> > > > The device tree patch has been applied by the DT maintainer.
> > > > https://urldefense.com/v3/__https://lore.kernel.org/all/02d94760-6e5e-40cf-9354-63b9bca5d682@kernel.org/__;!!A4F2R9G_pg!fOoRba7F0n_QcIeLW1hJWdqm-cZ-1LeU5F9IMVQONnR-eK5J5_SUcboibLdpMDbyKiobonza5DWeJd63mx8kk5_kzayZsEM$
> > > > 
> > > This series has already been reviewed and approved, and the
> > > corresponding Acked-by and Reviewed-by tags are included.
> > > 
> > > It's just waiting for Greg to pick it up.
> > 
> > Hi Greg,
> > 
> > Gentle ping for this patchset.
> 
> My queue is huge right now for usb, 1829 patches/messages to
> review/process to be exact.  To make things go faster, please provide
> reviews of other patches so that it's not just me doing all the work
> here.

And after processing my morning emails, it's 1897 messages to review.  I
think I need more coffee...

