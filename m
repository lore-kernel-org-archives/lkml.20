Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7463ED3CE;
	Fri,  2 Oct 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933349; cv=none; b=Kp2mvzMZ+UBS7UvR3L/vUtfWNcnehe4vD2hNfSgA3/hSS9mADCiDmJGiCbwuw5s4Fd67zoSkzJfau3KL5K9Tkg5QIPniQOQUtrj9fC83XfDDdG7nUP+LXEVd8aHczaQ+PxlidxWu3QyK+H4Zr43fNSoiAWUveVCwI4U+zP0Kyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933349; c=relaxed/simple;
	bh=4r4pdA6V1trjx1NIb9LrUmQokkQ4LKOjMbcXWDvBK3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxiVDvoFroETlpmEMtgZt0cVogj2BoXdNMKfh6KkiG+nOC7hiCc2j2lZOacB1WTzcZgjj3IdQOOQCSuQCnrKL2r1VW7Q6bhu7C5s7/c5FK3g7b/e8pSxHh8RNGjoE0S+CRJ/HEFg/rJ1K+zKePgCpLMQfeM8TgsiJtiRMBRl9DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bpPbd0cM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bpPbd0cM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687341F000FF;
	Fri,  2 Oct 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790933346;
	bh=SRoWf2wqbfBEbqSEq04DpriXW38jlq2Q9kbJqJbDTBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bpPbd0cMdYcoJq3bPxhGT7iCLiUS2nx4raPNJ3YwvA1/kIlvr1hGOgz8JNkG+uC6c
	 9LzQCfc6HA8X+FOsdJ0YPUAYssWOP9eprWDVQ2g5AMU0AxnyIrgBCDRVKmML9FX/a5
	 frPSwTp6S8qrPLSRI2/DKQgu3lKeFIsLCabbblFE=
Date: Fri, 2 Oct 2026 11:29:00 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Message-ID: <2026100239-swarm-hacked-015e@gregkh>
References: <20260924110429.1557653-1-lgs201920130244@gmail.com>
 <ar8iVIgFdBpIbCsl@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar8iVIgFdBpIbCsl@vbox>

On Fri, Oct 02, 2026 at 03:18:38AM +0000, Thinh Nguyen wrote:
> On Thu, Sep 24, 2026, Guangshuo Li wrote:
> > dwc3_meson_g12a_probe() enables priv->vbus when the optional regulator is
> > present, but dwc3_meson_g12a_remove() does not perform the matching
> > regulator_disable(). The probe error path already disables the regulator
> > before rearming the reset control.
> > 
> > Disable priv->vbus in the remove path before reset_control_rearm() to
> > match the cleanup performed by the probe error path.
> > 
> > Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
> 
> We should also include Cc stable.

Maybe if the sashiko results are fixed first, this is dropped from my
review queue.

thanks,

greg k-h
