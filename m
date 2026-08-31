Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E93DD525
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169327; cv=none; b=eEmG1AtzJCKy9dcOhp1MxW2kWvxqHpYF2yUTg6VBywPwgfMPT8HT/BEuBv99TNt52/pXY3SO5l+Spx9iRNWxCrmKwRxfyBXnXz15+CG+13NhWwoJoTfT4fNJXQ0j2gkBa20Ya2u4llTHtrBLbJ3MK4TDW4SFJY7MYNYPdX1kRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169327; c=relaxed/simple;
	bh=OKS1IeTeFnAELTHRFSEYn+7kKIxqFvd1JBZznNMYwUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOgwB4HgUnu1Ku2QQfTkDU2hIZEn3OTC1dFNcVqFxp2UCWvNVitjJlnBjAkJSw01QDLUlSsvS/JgMgKgbmI8j2usf6O+kjaOL7PWqMIFdkOMHvnsixv3eZNSnJ/as8QRgKxzphnu2/7OHfCiR+YF6pFP5od/nHP5bUQncgLG+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=kyWomCCO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OJF3Zz86; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="kyWomCCO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OJF3Zz86"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0E6F0EC01E8;
	Mon, 31 Aug 2026 05:42:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 31 Aug 2026 05:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1788169323; x=
	1788255723; bh=ZIyohmL0TOCGlnNL19meDR0a7yz+KdX57/3EqrecHRM=; b=k
	yWomCCOFqWycW7JseUI20G+2ykxHNi6ABnnsZqxfJfTcwBCHD26Tw+UBkn6Hit/O
	XJcXln6RUDXqQqxh1nUxZY4csfjjidP2hcJEL/6IgJ5QPs3It7B2UtYWXF18Wq4q
	scDKAa2lhdsoOTPTtdrZ3dEzU1PI75zKztFZN6CNFIK20BZMLU8X8EhrEaqW2uxI
	pvOPtf7w02BhATGQGQHatO6gvb6rJPbfKz0fGXG6UYPT7s9AIdKg/Ikw7Vnwc16E
	4jByWkxgXdGAw6e9rnvBdpET7533aCH+4H/TQ+FJ1FWUP9uK9+AEyyMJZ7ax0Dzu
	J/Najmyv7XlyMBc01PR8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788169323; x=1788255723; bh=ZIyohmL0TOCGlnNL19meDR0a7yz+KdX57/3
	EqrecHRM=; b=OJF3Zz86UsnXIVg21ZlrJ74Vo7ZU7oZWiVT5x9AlojeK/X34XvJ
	QdPriDT8mKdU42d4eQbddGk/qXlUvrMPx/3hNFOzDRKHVDUCs7mHXjTbRx263uiy
	Tb7+Pa7diHbgsbqwV5OkiAZSuCZG8STinBowhTRuVzCiwxLyRnh8mTIzRgUaEzbS
	tNCE/JykxOQaz7aFg6Y6IZ5+cIloUbZHgHg5iOevv8QT4cCsZH8ajLL0+OcuCIeY
	XmLQ7cjr+4N263t4H14gkzTtaGqHn9sKcs39D2s49S2aRu4WQMMwnhbPwJyAYwKR
	kR8zB4XRVaglloX2xGfNJQcnM1HPly2YQuA==
X-ME-Sender: <xms:akyVapS_2uRd2nPK70t_GvjG-0WgUHTIVPILxpBZyAMm69Sj9QoRhw>
    <xme:akyVaqgNfdZei6VYV704rhr4FUHTXkOZwYKTbShRj1bSLvvOSZpC5a_ang5RDucl4
    eC_wHtuzpsnb0PU4GJuuvOgwD-73smRq6yR6ZAx0fnJxjuZ9JoKitMR>
X-ME-Received: <xmr:akyVah48xV75zPNZalfNkiv_rtXu5AQ3Qb9O8Cx57bhmZYhgtbpNDHKh6LnM4XK86CKSXSJkLxpz_UoWXVel4s3UoQ21>
X-ME-Proxy-Cause: dmFkZTFfE/8kYAaENLgqtGi+CHqPBYhFTt4Au0imeybvjxdGroZ5z009tYxwooL+CHaXr7
    f9vf8sFucG7G4dMWIEhIg5RoR35JOQ8b6NCpUu4oqfRWUb3GhqHn9Ef0v1x3J7b5VSup2T
    cws1J5sQvC2BwzPWPlkwgaCYsd+74xf4OgUTquZ4we88ED7W8ZmdRs5T38OPKDaKZQr8vz
    +3isa/8Pj8W+k145tXvFazBeuSMjRGu8WxiTJo1AxbqN0oiohwDNkXCA3BOX3YTqS2NpED
    BKliqaGD7nrbr8oz5ttt35SSAiTQ2oZM0MjBvDAm6IbyLx/QnLFyKEXBDwigl6mrwpiqtM
    zbaF+tS67wKHkTJyp/InGRDZqbg21JNHV3me7YLJkJBEJcAEJn+srzeBnDZz8PDn0lOv8b
    NIX0IGuiDs75CL07x4zG74K8B6uZgRnepmKHH8hTX30dU7n3At9Dz1+b5st6GbYW4XEtjo
    aErByaV+OlAxSQp3NpjUFUz0sfQHREjsHgl1XZaVxI88n9uIPT7yq/qFbD4WkbsrsUB7e8
    uCcqQr/A8rAfAM1N05+PD4KxnL+YEkH52+RPtSqeYZBoWmECH6Fg3X5/V9furkhH0szpYf
    6gFwvID/vRR19AHc3u5gdThb/DP7CicTVva4speHpDnvPIksmkET1z8OoCXA
X-ME-Proxy: <xmx:akyVavANNwiguqA4UGvWiG3V1m7aYrE0ODokdiRtiqEdVPclb4pkYg>
    <xmx:akyVagaZCV0ir48Zh02kmnJJ72LQePcV8ra7Y32Ylr3pnqm6eAYJFg>
    <xmx:akyVaiZMSOXzrZSUUEA9IGlbTe8a_yznqTHxpEZShwl-qyZ--allWg>
    <xmx:akyVav-dJCkCt9vrmrZEb-qJQ00IgEb_zJYD__S6jzsxr0GE89uBZA>
    <xmx:a0yVarPGYCXqaE7jS6ttEKNjKSrD1-g8Uccj07KB9Pltp_Hpq9xjw5pO>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 05:42:01 -0400 (EDT)
Date: Mon, 31 Aug 2026 18:41:59 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: ohci: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260831094159.GB1799124@sakamocchi.jp>
Mail-Followup-To: Triet Hoang <triet.hoang.dev@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20260820083034.2087217-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820083034.2087217-1-triet.hoang.dev@gmail.com>

Hi,

On Thu, Aug 20, 2026 at 03:30:34PM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations from the suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
>  drivers/firewire/ohci.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to for-next branch.


Thanks

Takashi Sakamoto
