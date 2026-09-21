Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540110F2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959635; cv=none; b=G90gqQoJJoKljSWdD6OGayT9XRa3m/Qm8asVJ4fSY9KN++o9zq8W3P+jZUz2MP331w0wlednuhuMvu6i1jqY3q6B5sUmEw2I1nao2nRNVqHPzHg2c/Xgj8MI5D2FPR54CJB0d31DG4pG3uR8X10m31KlX4gQcxUME3EAJavHxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959635; c=relaxed/simple;
	bh=pISPWpePI2fbjerIovJ72lXMoOtbL057TYF6mnwpPPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oESQFzmORaq/QYbcwUGm92khSp3KbPsHyP0wTgvI3U2fPgjelZdu4B01ecoYRu9a9a8Thj456NOgZ4LGpqraplh3sZ7cEDy20lu4tNYr7ZkKiFxOX0bToiXMBuv3EUxEuYUw+bXYxoAciljUOGZ4xv2axBmaqdVKEbCqIOlGgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=KSgVA/sl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LpBM/8tH; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="KSgVA/sl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LpBM/8tH"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9F80AEC00DD;
	Sun, 20 Sep 2026 23:00:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 20 Sep 2026 23:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789959632; x=
	1790046032; bh=uAByvWQJS+Z0ymh8ZD3uSiicICsBkN3AGPiqs8PdNHc=; b=K
	SgVA/slxQazt0vBAKeEEYkpwDVyimkGdLXvpoMd2UPK0B2emtCKQxSWMcfVB8MEq
	PiGd44fxjTOLx846zww94WC+9ujmexXOtDETFQG2xuwJgxbAik7uxLfdxaVkleXE
	0jhVdOq0N0u82VK6VsB+jufkpzCDQhKuXUtZvfD2w8oKXHyq6U4PCy/9L4B04UI/
	EsCwJ9yq2oDpnTedKwxzGBRcd6j7KzA7eJ3sqlzf5HGR2HGVZ/ONkZtpukFTbkSy
	bxtUrXdeEI0O0Cv6cLPUBAwau+qKhxx/45WtowvsCe50TPB4fWyjM84WKdMw13Jt
	ZTnTm1mGXPj2hsVWqYOVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789959632; x=1790046032; bh=uAByvWQJS+Z0ymh8ZD3uSiicICsBkN3AGPi
	qs8PdNHc=; b=LpBM/8tHxqSgKPgdTxHoHPYeTZtSz2wBSkYqB+Ny/sfeiziLOo9
	xGfINXDyo/sAcjA7JcOkwhvZ/cAqTRKOcnSmtgsxux97zd6yAlO1PWKO7d8hT1gl
	S1md3QGXwvc1195vbkUWWVze6CcJtFLHu9fLCjZ4ZDZBjr68C9Tvtznmx4x+1dqW
	vjPMV3AW9xhfXaASb2JQZatgT/fQ6nDjs97P8pznABVz6ktDZ+zgZER6/3UAtmBF
	NOl+ulLK3JelNspexImZZnvjLuazC8RFG/q3W86IkSI34IR386ZNhSdF7d0jIObW
	Ca/YI3EZKwxlV94yzEEr05+n7vovr3bLN+w==
X-ME-Sender: <xms:0J2wagfOTOrDsXLHWEEM5cogpCzzXIL7kX-H7HcL0c2__BgxtKhS_w>
    <xme:0J2wagJMHOyPtPHYpqczgFcE3EB7Vkh_Ghn5zvI4llbvJ0vsdSrt9ej_KSmngyhE7
    k-kuv5SuBZnGmnBr7UmnJkmEX67UV6yeiX8c5ruOpDG8-2mkrGqOzFC>
X-ME-Received: <xmr:0J2wapGm9Kud5wacN6TdI8Fn3RkfD2JiSoZ0ZGAF8ofKFS0J6qLsJonGN2FSgK4eyi33yysc2ubSUNVnuTJ119czH-VRFg>
X-ME-Proxy-Cause: dmFkZTEbnTz28j5lBdezYK6M9WYp3tbJ5RB0a+kHGiqAqCOHKXdmIvAAN9rNzMEABE6KCr
    qKpoppEQ/dFKrLSirqV9kOISw46HXhGWVn56P8yeBr8geUs7kOEuK6G3Zlu7NWvtT87fXH
    M4t4Poi/m4OWmTOZ+a879GgeidlfsPH72x5wdOvXghOS1LTsfic01GtXbptT6GpKlNO+Ax
    JjFv2QwMpKRY8pwSqOtH/G788p8V6RacAiGCoYSJw+NZRarouxAxNXdPE8ONSHEpN3dU86
    tQagKugjbOMakt7/esiU21yl0JMsVrppWmN3UQ3nOSXBJvQLET9K+BDTLjXQ8MYNkEbZfr
    yW7iPOU8CKu/rF8I/XNY2gfeHqy5G7u2mZfLhVG36G6rkvclKW3Rm2EZl2P2O1W2EhMhL/
    9Di6sn9nykFUEB7zZ5xvegg3yeGTUFKLR6uE5AY5XfaybqzxQsal/D8+PczikoEO0pyZmn
    ziHFbql5BxAOx22se3yxLUaiTV+i5wYwxlthUS1sRvHoTNpvvL/eDSm45gh2lK7ApOMNel
    7C0G9jjKhwqpW3mKvbjfyNiguakgKumbphI7yOAFs+k1rex0QiX4OpM7wbYRCcv4eTpbeJ
    nmf3/BY+stxZTb8Z5os+mHF4XsbR7wiLTCXoNb0F7LJa6ogQ0LbZ5czJOyvQ
X-ME-Proxy: <xmx:0J2waiodFe53SDuLMfWhLNSROPcny0Y7wn_YH9Tr0O7WoUTSnGO12w>
    <xmx:0J2waqTZfYG_oVOVGrzKxdNIYRCgeMYInZyGKCgTW8cZ0KrmHqL3Rw>
    <xmx:0J2wanP6IMEO-vuDdApOS5JcRaORavNY-wNvk8IfnifayWwKlIJp6w>
    <xmx:0J2walP9j6x2Za5EIKFPJp6y09jTNl--qi91S0Ktj2nWDo3Ekf3A9w>
    <xmx:0J2wahyK00IlbeehnnE__YS7XikpeIBQmV-KAcijm7-jZeUiX5NACjcn>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 23:00:31 -0400 (EDT)
Date: Mon, 21 Sep 2026 12:00:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] firewire: cdev: refactor packet callbacks in process
 context
Message-ID: <20260921030029.GA283306@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920083659.191855-1-o-takashi@sakamocchi.jp>

On Sun, Sep 20, 2026 at 05:36:54PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> The address handlers in the cdev layer are now invoked in process context,
> following the change to use a workqueue for all packet callbacks in the
> 1394 OHCI driver[1]. This allows the cdev layer to use GFP_KERNEL for
> memory allocation and replace a spinlock with a mutex where appropriate.
> 
> This series first updates the kerneldoc for the address handler, and then
> refactors the cdev layer accordingly.
> 
> [1] https://lore.kernel.org/lkml/20260919115017.859169-1-o-takashi@sakamocchi.jp/
> 
> 
> Takashi Sakamoto (5):
>   firewire: core: fulfill kerneldoc for address handler
>   firewire: cdev: use mutex for phy receiver list
>   firewire: cdev: use GFP_KERNEL in address handler
>   firewire: cdev: refactor add_client_resource() to drop GFP flags
>     argument
>   firewire: cdev: refactor add_client_resource() to have release
>     callback function
> 
>  drivers/firewire/core-cdev.c        | 50 +++++++++--------------------
>  drivers/firewire/core-transaction.c |  8 ++---
>  include/linux/firewire.h            | 22 +++++++++----
>  3 files changed, 34 insertions(+), 46 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
