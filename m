Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0B351C13
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422416; cv=none; b=TlD4beGCXzKJAfTU86HnmTa/8chnFWjfShxABNsrlG/Kt96cAlIm4uKvvyuL8xj0pcKFuAT64wGQS18KIbHMM5m7fuD3mPpneYwUDx6rS6gxadyLQsTd0KoyshFsjuSz6DFw59J+4GeMJhgC+Z5jgLkyaWO+D0zqXGEkEyXmXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422416; c=relaxed/simple;
	bh=aJUvp2lTS4CVRjzK55gqV5Yvm8yeEBUKdJkjajatusU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez1dwVgCtZThuieGIsFB2ZHCpKp3Ufp3nThY6o+F+pT7ninafgqt/MBon4s55M0g2slTl2gk5ukvXVujH5zOU3wOuO7Tb5ZqsIIselL0foFzASoBfMS83Z112IF7iSxwH49Nckfy994moLzHa8Kges5pygvA1ickZyixK0XqAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MMCq1JoF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OeKd+sM5; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MMCq1JoF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OeKd+sM5"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D1EAC1D0007C;
	Mon, 14 Sep 2026 17:46:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 14 Sep 2026 17:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789422412; x=
	1789508812; bh=rV4hIDGk/S/YMlY9KJOFoms0YAtJXXMQmbgSWLspSv0=; b=M
	MCq1JoFWmrtfr6KRpWP9irbf+C5GlRdp1+eGUnHV5n9Q4LjvLYd8UCNwG+P0Z0iN
	7dkZOm4EtPUX/Sdqa3I//ZVAYFzYUPGXSSuUNS/iswCO0WNA2am4dagb7x454Gy/
	SQ11TVoTGC1gfHs3aO1z2dYDZWycGW95wMQkSIuqBSCOI0JaDayJgyQnadQTggTW
	Kql/Y6xO2LL0C+XICre+lJL/NFyvLvYozlC24dpqF1TvRuorJgrZeopQmWJ3ipFr
	LyatXQ7ARM674waxD6CYVdcCCbwPO5pFFEcV41Mfl4aq+YxPoRzZyEksMPbzNuA+
	+U9nnecD1kvix8x/Qizig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789422412; x=1789508812; bh=rV4hIDGk/S/YMlY9KJOFoms0YAtJXXMQmbg
	SWLspSv0=; b=OeKd+sM5Ov/rbo5SD1qOXTQ8MdMfHYbvpVQNi9NXd6khDdCONzw
	0MLezzaActi3/myGTTBpGLqKWIf5Ji/nc/oR5Cd7kWapii0zj2tUwofAoKgAdjBF
	twddBEUS1OyI/Z0Hw9FDkZ6AgrVwaYnIwlYVFiiu9anQwOuIz2wY6RMmnCwgoPK3
	6j98itKuUEAdfxKlvVIIKatbNLfhib8/5CytAUbnD1haUu16kMGMxwN5/ueAT383
	LJSKuxNfTBR2Sh9WB3n8iP9MGPjFH0q6U68r4ReRT0R8ZmIzObbG+AM8KZPWzr+5
	r0iZ3fPhJ7b4OyF15pUOyc1TFE8x+kVKA3g==
X-ME-Sender: <xms:TGuoajH45FXJftv-ikRFXLh-VowF3EFRrMIcnSO_kHOh9KrMZhXw3w>
    <xme:TGuoauT7f7z5RT0fI-Sg2NPBRQL6Zp5E3vRFVSnsKfHaiqnoeLfu8A_aoZLsR5zPv
    RDVWVRDHJ8R3aWtEDV0D_hcruJ7cQ3nGqavYkyyLnsf8w_PD8xV_exA>
X-ME-Received: <xmr:TGuoasuVwxbjgbKa33xtU72C0QQwSFYXjw10b8azL4RgMIlYnDzrRYhA6j1vle_vmJwW97EcWytIewdcz98BwFYqxnbD7A>
X-ME-Proxy-Cause: dmFkZTEwQiXGdN7a/j6N0CyhUksMdSKLUU3+Lut++zNG+qjXL10wpOw4u226o1EQOSJzoA
    Vivb+qm/m9SJ/vYD8YYtLoPvHUTqlRD7yMzco+nKx5jXpGJmRVnwNTAYgshN3nIQQkVo85
    F2QdqKwQHid0LulQ0MeV/LcUf22AXd12ZSjsWY4T12rK2eeJitETyHKOh6u3l5B2s4RxvR
    PsjhPxG/9V4KoGCWWcyA9rh69cudeUL682pQ3ioe54tcIcrZ3xTpTqR9kLrhoGCzzYpXyo
    3af8lIqpCd/cm1lT8Mxst4/gmaChPFElXDSaRvftnVX4t31/9m6v2BOHjx7aSr+caAW8Ct
    lemFyMrxQcTDDrqTbLIZSr1EiUpbSQzE6C5F+BVC43O4E0a0TiD+6GK5tW6DJX5vqxrf1u
    gPwXaWo1it45YOCmqCK0UQCN04DsG5bH2QEepxU7QaSajy6e+kECTqiFQDPLhA99JF0UW3
    IeACLvOg/w4J0lkdejTc+fatQh0MdpCT2JY2j0J/i5/mLlQ94qCQxug7Fewi4WDj3ZSq5n
    H6aHEm4Y6sjwRXWA+7JoUilm93xntYHqmD60Vq/Mopba9K86SQS0iDIyI98qL2qBFDANgO
    sZ52HD62pD1Qva9WXFt/EJZY1LJfofcyyCzSi/T7U4YrM0LUsI3qbS3HNbng
X-ME-Proxy: <xmx:TGuoatwUlyiJuxDxQV6jVaE75Jw5kuAYuUOXOVdWy1wljEPNzlu24w>
    <xmx:TGuoam48duPcOfQmTXqxcDnwLblijWScIPFSmwva5nxl8vzlWFe9lg>
    <xmx:TGuoanWG3N7stazmY1wiEKOZrjyMsrnJ9QYNe2WbdBlTPOIpJNNePQ>
    <xmx:TGuoai1mDKM8PljCrtpGRtbgdQqu7cW0yexFYgof3ErntbDNwX3fQw>
    <xmx:TGuoahZ5bz9ugm7xq6UN7TmoI8fyVaEuv13bWeiq8flluK_1QHweZ-dQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 17:46:51 -0400 (EDT)
Date: Tue, 15 Sep 2026 06:46:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] firewire: ohci: refactor local AT request/response
 handling
Message-ID: <20260914214648.GA211204@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260913101356.156420-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913101356.156420-1-o-takashi@sakamocchi.jp>

On Sun, Sep 13, 2026 at 07:13:51PM +0900, Takashi Sakamoto wrote:
> This series refactors the handling of asynchronous transactions to the local
> node in the OHCI driver.
> 
> The current implementation has several special cases for transactions to
> the two CSR address ranges on the local node. The code for detecting these
> cases and generating the corresponding response packets is spread across
> conditional and switch statements, making the handling difficult to follow.
> 
> This series first factors out the detection of the CSR address ranges and
> local AT request/response packets. It then simplifies the response handling
> and separates the request and response paths into different helper functions.
> 
> No functional changes are intended.
> 
> 
> Takashi Sakamoto (5):
>   firewire: ohci: use in_range() macro to detect CSR address ranges
>   firewire: ohci: add helper function to detect local AT
>     request/response packets
>   firewire: ohci: refactor multiple calls to fw_fill_response()
>   firewire: ohci: refactor local response packet handling
>   firewire: ohci: refactor handling of local AT request/response packets
> 
>  drivers/firewire/ohci.c | 137 +++++++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 59 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
