Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700F483825;
	Mon, 19 Oct 2026 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392298; cv=none; b=E61RY6z29Sf48kj6o9PsSjPv1AieILpYX7RmgkWv5nu5UcQWib+00PygMseF1Z/mRbVBfoOsRRNRridLZskkQkXV2rY2QUl6u6wQF9OoFGI9fc8RBhfFbegxjiCRfBp5SRCFLmEDcI7ANT8ed3Vh18B+RLe7VyXL80PE17VXnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392298; c=relaxed/simple;
	bh=lqbJEObwBrdWFqMbuvMSTaxauNLio7+eV26yKqdwg0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEWhq+CBCgwSVOLeocgLvC7GKhwSFWFT+hlVzEXf2micHX2HT1GaYFed4/wLNhNk/ANDu5o1Xa+9ARyGYurWn2AT88G1fOBU0MHUpSpJ3TzDtcq7czRWaLy9gN/X4+A90RXtcaGq6+4RuHDyHp9XYje5mPMXQf4Kmnm2IYw+ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EIqS7BwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EIqS7BwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91891F000C6;
	Mon, 19 Oct 2026 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792392297;
	bh=dFROdIku4+PQRXecwdlgWRgsOyT7CP7FHtDMXx3nHwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EIqS7BwBx5crAqP5vmMU9xht6AIlU7N4H3znUyF5o3IQtYeS1OpYogzE3QaArkY5e
	 ROjEBmTpId90KxaH3Vg7eNyjP20Ad+sndi6VafSnOHLBPwhu5231f4Oj0jYulXe/NM
	 2njB+E2qq4r4VhCm2/q4u88Q22bBXJViVwvg38Lc=
Date: Mon, 19 Oct 2026 08:44:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yu Zhang <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: gadget: u_serial: use-after-free of gserial in
 gs_write()/gs_flush_chars() remote-wakeup path
Message-ID: <2026101924-scratch-ripcord-03cd@gregkh>
References: <20261019033446.73554-1-yuz08559@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019033446.73554-1-yuz08559@gmail.com>

On Mon, Oct 19, 2026 at 01:34:46PM +1000, Yu Zhang wrote:
> Hi,
> 
> gs_write() and gs_flush_chars() cache
> 
> 	struct gserial *gser = port->port_usb;
> 
> at function entry, before taking port->port_lock. In the
> "if (port->suspended)" branch they drop port_lock and call
> gserial_wakeup_host(gser) on that cached pointer, with no re-check of
> port->port_usb -- unlike the sibling gs_start_tx() path in the very same
> functions, which is guarded by "if (port->port_usb)" after re-acquiring
> the lock.

Great, can you submit a patch for this after testing this on linux-next
to verify it's not already resolved?

thanks,

greg k-h
