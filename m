Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8F4825D7;
	Thu, 10 Sep 2026 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045047; cv=none; b=X7+iv6fmF2oBfTH9/b2fIUt30bzDCqOh1Ydu+qp7PHauzHbOKuNX/+Y6n21GjubSm6/WY31OQ50oUsQ/uuXDMUUhykQgmmqKLZFzAuvey25HM8S95eWufmHbpwretCicWIliYrHO/24bjkaNLIqWHqH6lZI6D0t/Js0xB07yJCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045047; c=relaxed/simple;
	bh=DnmztxTXXbQHVTlsrnWRFCspQkAvUMFgOHE7g/BEQ+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XI8m2L5NUzK37qtUCyg+n5MNBo6WGcohGGKZ1VZhrX89qZSWc4aX+MBUr1tDojVw90lFtjSe91LhjzjbiduXr2lF0Tj8t1EuJ18IdsjkAasOYINJzcOxeyeVx77yt7rA0w5nTmUtdZSmFX3aRsggZAq4rDjTYGUaB8dpFrGQ2/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7JQZtCw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7JQZtCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082941F000FF;
	Thu, 10 Sep 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045046;
	bh=cz/YkmDWGz3mcK6Dzae3pwfaI2yep5VtJAfvg2O59O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7JQZtCw+h4p2K1XQmB3av1dP1Egl/Qvg9JsWc7/olyUQ/itMtSs/FMHJLb8Dmpzt
	 CNPEhhneUzgqGBwTvVnOkhUJAgBD5Ox4+r5I2xifiBeICKgBBmTXwBJt0WLVeHjotr
	 mIfQc/ijHAoWBwjQCwGcTyDUjm65/yDnGA67iQdO3ukgm5nU5FtCdAl0E/TWQa4LRb
	 5FQyoKclPkFzPqZnsdwH8776t4aC8xS++MqTb5Wa2hXn4jOHFKa0VZwuLtyK6QJEl0
	 dzQ8/K+RoRb3TeCoA9sS7BpXg9PVl308irrhFwVankuyrXfRKpcalUhRlp+dD8mZtg
	 4BN8gU2s8xxCA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x4eLD-00000002grF-3Wxy;
	Thu, 10 Sep 2026 14:57:23 +0200
Date: Thu, 10 Sep 2026 14:57:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and
 updates
Message-ID: <aqKpM7QaTyKzmqSe@hovoldconsulting.com>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
 <aqId-z4u65j7Szqi@moxa-ThinkCentre-M90t>
 <aqKpBqAYm7HKg20H@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqKpBqAYm7HKg20H@hovoldconsulting.com>

On Thu, Sep 10, 2026 at 02:56:38PM +0200, Johan Hovold wrote:
> On Thu, Sep 10, 2026 at 11:03:23AM +0800, Crescent Hsieh wrote:
> 
> > Just a gentle ping on this series. Any comments would be appreciated.
> 
> It's only been a bit more than a week since the merge window opened.

s/opened/closed/

> This one is still in my queue.
 
Johan
