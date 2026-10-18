Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686104AB1A5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329328; cv=none; b=cvEWa13oXhJN9eyV+6yYuCOoI/Qzp4B6qTL+nRR90pJCnNPLSvF77GWAn+3TxwzYtRSh3tmhVcr7eD/LGhtL4R4KvlL0Jz3oVjzrj7Lf/N1d0rcjX4GN88TgzUTj8ofIH9NXMdDLeQ1o6ffq18dndF07rqZzbany7vbqO8Htvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329328; c=relaxed/simple;
	bh=MgZY1aNc2MBO24p2fUETlxqDch6u/scArT+m7IGfttg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kro+yFKUYqTEFfYzSkGRKEULOcl7tZCdsZn6rpyLyFEFGvBnpmupGNtaM03GSa3Wp2rrfMjUZWetuo6QL6SvZD2hbSXkHTQVpbvv5mV7Z/aELp7IAa4YInudFFQe+PAMMKykh/4hvIDSCpyfdzGo4EuWqlaInB7yto/bwxAF4kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=wg1BBe/k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K5EWWgQP; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="wg1BBe/k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K5EWWgQP"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5871814000E6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:15:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 18 Oct 2026 09:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792329323; x=
	1792415723; bh=+wopayPbcbGJDTZiD9/kays/Ff1BUCvpC136JsS+/Mo=; b=w
	g1BBe/k+IvHO2FhReMWW5q0xLlVIRgeM7gA4A9uTulxQzzSPQrj6/WWZ6svRQbIl
	Py+DcX1vamcTaDtf1tIJ7IgdlpPA9YZRrJiq5rxXO9tujVzorL2Ur8IlTGQMPHyS
	mw7CarA8/76POHjHBVPxpbubjvGwCJwr623uUy1CMiUf0560SBXocHQdvdqmtQ+j
	bbzXKOLeKHZ7YyZ0mmyNWmqEhmmU2RZNwtn0ysb7gz6hZEE7slFk6ruFibY4Mfjx
	VCnhE7j7jmOd+ObxL1yOQ1R9qJfY8o6akx3/L+BYsHJPqbknl1tvVOapTiDGpadT
	1GLGBOpoNv/ak39YWU0sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792329323; x=1792415723; bh=+wopayPbcbGJDTZiD9/kays/Ff1BUCvpC13
	6JsS+/Mo=; b=K5EWWgQPUgfwz4NAyT4y3R4NXsmGRcRGlIQLdaS5s2+bTBOFFIU
	FUWbnSxgcWv3GHk9ycZmXTaYeHJRqbd30pYeWA2EbpNA7SYafO23Z8QHFrSZao/3
	AYFaJqq7fFoJPuT4JtZhOKgY2LkMqkb4kF4YrjXpTwQ9a9Dq9P4LrmRrvw1JM2jn
	wQtx3ut7h3GLZwPBy7hYROHiHKo7XXP8ONFz/PEu2dgecqAKD0oBbVtI9tsCT0I/
	ugxx3mOLV1QjltnXI0eREQ7fNnl7gsGEwRlIoirhzuMGH2JG+Bql+lCEdU2yDZDr
	UlslIKW6DnGKrcr7L4L8fZeERgeHuCCldaQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792329323; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:bgBIQD9JpafyOQCeebCZ0JXo7GqzShZi2nv01uXBWWgWzja
	CJdGcA2a64q+e89Q8ALPE0h3LHhhugpYNa6e/Ux1KhnWfdS4DbenZVtvPWaUUTw1
	V5RMV/YeEtiVtdN0eLrENwMTdBZgMjFDjiMRCubqpIZD6JvM4ZWeXkY29eiE0SB4
	E64zK0IUWqKkb47IDDn8z41yDjfC+xS5vCrTAKSbm2oSi90jb2k6Xsfe7yUHAN5O
	jMJ6w4Djfl1MrIVoFjr+3ZJbcQk/gZZrs+6sdlHJJFoPFpHMVr4PGQXhAK358OXh
	k0T6lEJdz326PF5ln3+wIExEhUPqbxuc9+SCyIg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:S9YVp+vhiazJZNFK1UtKFQkt0gTo0o81oUuIChI8IiU=:MgZY1aNc2MBO24p2fUETlxqDch6u/scArT+m7IGfttg=;
X-ME-Sender: <xms:a8bUanQrjnig7T6zLg-SkEs1q8whnidomWZdtnsXfeh0aRCJl047hQ>
    <xme:a8bUamsBXd58Mp0A6r-fQxUxR6d5FLIuLvlkU5FH-rGcOCi6lb58k5_LfvAScYKqC
    M5-Pc3ALTSBAVjpEvt_PIRMfBt7pmaz9foa55PvrPfTfXb5OtAf-FIc>
X-ME-Received: <xmr:a8bUakY6Sj8kHC7REBjL5kOEVzrQFqxs9h5YnYi2rrFqsIL4H8y1DloWq3BM8LOf7mEal_McEf8d2g2B-uaw81mfXqoq>
X-ME-Proxy-Cause: dmFkZTEOJekWQ/8Afzc1t6DnDhoteOzV1iQRg1O9IXrhYCk6Be1jG1zSN8WC7coKdNducQ
    Vjb85IcIeIaqfLgVlR9gF/Ndd/qoiWhHGB/2VhG9+EWV7BYDR7ebUs0O/KP2k8x6/53Inm
    SdOOqi/lUGtFI/QcLV5FW5X6N4QVbmhbG+YzSByW13N88leeWaIaVNv3pRZpbBCCiZG8u3
    HGfL6m5YwayzSh0jPzVWPMnAxiQLtPh6EduPxGfj+FDDu4D1yjo3bfnko2K9ZRRSJzLCVJ
    kfGk88w1nag6wm6lphQD8QYqLzJ9V9VnW5aCMZJei22hizp4fwHdyMCqhf1PhEGe7JqxRY
    6uEI2YMmbMrVsIy8WLgfdsZnU33EDMWy7OSWAdCQB9E2eLN1ORn55lfrJWO3/sVbmHvb60
    rIryhFj5v9ZTwvMJ1PT8okogfB6T4oYXWx4N9s+3bAxp6VvfI0nrOUUR/PPTdNUfl4kOAk
    Yf+9opcUxUGq9P5yfjvkZ0nqa3ktZrKAHPgHz4j8ea36DPd1ewinqOH7P75EmvMV2me5Z2
    OBIX/OVTv6SPlchH7d3PzKvvn7WL1ZkPkWowbl/Xk8aOy7KLc8f4m9oS+CtyJWUJxTpYW3
    fDTomls8P1bTxA7LPX7OTc9nTAKTmR7I5w/cy3IqCPUSyt3AniOGXGk1ysJQ
X-ME-Proxy: <xmx:a8bUajufFa3hx1HZJjDw2eL0qgdCLf6DFeC16hj5VAggesNxqK89fw>
    <xmx:a8bUauGAPO-pn99oMEbn81gEN0I4Wx-lEZR9dBQaZIO74gRN1EiXOQ>
    <xmx:a8bUamz9yteoj135leG79qokHWLqVvyIblmNwoZ3hArbQYf9UelanA>
    <xmx:a8bUalj3Kr0BfUfO2ioP2faFgtCQv5zV0UdWBrEc1_2kJ1RwG1yoyw>
    <xmx:a8bUarH-zU6l0j8ttZj64n7BiL_qe6RkLl9-2W1T38gHLWPuwrt5bnFp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 09:15:22 -0400 (EDT)
Date: Sun, 18 Oct 2026 22:15:20 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] firewire: core: simplify pending transaction
 cancellation on card removal
Message-ID: <20261018131520.GA389835@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261018063056.329226-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018063056.329226-1-o-takashi@sakamocchi.jp>

On Sun, Oct 18, 2026 at 03:30:53PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series simplifies the handling of pending transactions by using
> workqueue when a card is removed. It also improves the checking of
> preconditions for scheduling error callbacks by moving the warning check
> to the scheduling helper and using compiler-based context analysis to
> verify lock state.
> 
> 
> Takashi Sakamoto (3):
>   firewire: core: use workqueue to cancel all pending transactions on
>     card removal
>   firewire: core: check precondition when scheduling error callbacks
>   firewire: core: use context analysis to check lock state when
>     scheduling error callbacks
> 
>  drivers/firewire/core-card.c        |  4 +-
>  drivers/firewire/core-transaction.c | 76 ++++++++++++++---------------
>  2 files changed, 40 insertions(+), 40 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
