Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9DF49B466;
	Tue, 13 Oct 2026 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871941; cv=none; b=pOAXpuFuXJe6OKORahhNaROAYOLYPY6q7FYJzrSK/NjAT/etsS6Z7959LsMy53ENFFjHx2pEAs92228d2iScoVATUzfCEptztlZLrYCtF8kRqPYowpo8eR1qqQLKCJflfEhIXIpRdotEbWIjKjppmznTLKFQwckbPw9NemjBfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871941; c=relaxed/simple;
	bh=ntH6XcLShiNFT3fSwBT0L8ICyrvoFumP/lMwY+cseAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmrsnAvTmAQqRXyqH+pDTkiPtp6lTEA2R0INoO5SF/vqxLnj5YaE2dXw0RrSAl+CHM5pns3LYYhXiydzjNLd6wwdNScHTjT6BsCTZUgjgc6xZv3plaPi+46mbSZvfvuihfNkFka5QZAShoSalLpCOFwM9+J1tU+t2RaCal4ODmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=13WB43tq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="13WB43tq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4435C1F00893;
	Tue, 13 Oct 2026 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791871938;
	bh=OdWLacQ89y1wlnetyhis4WnaYoxYp4ILZ1n9NV/GM7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=13WB43tqyS3K7xrI/pXQrH4ibtxFKOzw9UMdZe/MHvy2ZOdyDpYTV66WfwvpaZZIF
	 NW0Fmc6wv0yEdMIo8OGaxiXbQ8O6Zy7gtXi7zGU51skTFAxCZ3c8KwrRrJC1WKmFZ6
	 pt00GeC3g1cLq3hCkoYLciOG6U2dtDpmQkc7LqSM=
Date: Tue, 13 Oct 2026 08:12:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "NG, ADRIAN HO YIN" <adrian.ho.yin.ng@altera.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
Message-ID: <2026101350-tipped-connector-6c05@gregkh>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
 <6d259ee3-a737-4074-9066-3b01e3673e1c@altera.com>
 <aq2x-bwWluxr8oMh@vbox>
 <97d2287d-17ea-42f0-aa62-69473431fea7@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97d2287d-17ea-42f0-aa62-69473431fea7@altera.com>

On Tue, Oct 13, 2026 at 01:53:55PM +0800, NG, ADRIAN HO YIN wrote:
> 
> On 9/19/2026 6:03 AM, Thinh Nguyen wrote:
> > On Sat, Sep 19, 2026, Ng, Adrian Ho Yin wrote:
> > > On 9/11/2026 5:04 PM, adrian.ho.yin.ng@altera.com wrote:
> > > > From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> > > > 
> > > > Agilex5 integrates a Synopsys DesignWare USB3 controller that is probed
> > > > through dwc3-generic-plat. This series adds:
> > > > 
> > > > 1. dt-bindings for compatible "altr,agilex5-dwc3"
> > > > 2. matching entry in dwc3-generic-plat
> > > > 
> > > > arm64 DTS enablement is posted separately.
> > > > 
> > > Hi All,
> > > 
> > > Gentle reminder for this patchset.
> > > The device tree patch has been applied by the DT maintainer.
> > > https://urldefense.com/v3/__https://lore.kernel.org/all/02d94760-6e5e-40cf-9354-63b9bca5d682@kernel.org/__;!!A4F2R9G_pg!fOoRba7F0n_QcIeLW1hJWdqm-cZ-1LeU5F9IMVQONnR-eK5J5_SUcboibLdpMDbyKiobonza5DWeJd63mx8kk5_kzayZsEM$
> > > 
> > This series has already been reviewed and approved, and the
> > corresponding Acked-by and Reviewed-by tags are included.
> > 
> > It's just waiting for Greg to pick it up.
> 
> Hi Greg,
> 
> Gentle ping for this patchset.

My queue is huge right now for usb, 1829 patches/messages to
review/process to be exact.  To make things go faster, please provide
reviews of other patches so that it's not just me doing all the work
here.

Ideally I'd like to handle these this week, but that's if nothing goes
wrong...

thanks,

greg k-h
