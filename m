Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63C364E80
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595773; cv=none; b=Fcn16vRLCdBO/qw7gDNgdhT9fDPj2jzppryVfBkjBqxkKsvntnlrBnDjR6L9TJYbzaSfCqAcH6gxKsB/syv5eBEeimmN4RZwmx6bf+eBGpDO2xFcExkkfcd5unG2myi1CdvFKlizeKU3BkEis1S9C7yNzl/V/tl4NinTxQJ28oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595773; c=relaxed/simple;
	bh=vEeyZK4V2ruIVySEM/dMdyR5+TQdeGGjWW/3XKHIbQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSjigruE/KS+On9jgDSt0R6g1p0lisU0vMe7o84o++vE3SaBcYcUh3iILr21fLm8dhh73Znr07LNHLlAmIvMVfRfVLnUCZvcqpat8q6u9CtJ+MmCEbvO3Ddl+G8wzUnrUmB+K552kuJc76WROQ1dPK7YfHdmNCNyOOQljTKt8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=YEqeCnO8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DBeb+BrY; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="YEqeCnO8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DBeb+BrY"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 55A3D1D000B5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:29:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 21:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791595769; x=
	1791682169; bh=lSdz4YHJZ/2yYplaxkwQEUwAKKNGrpZKu1XPqVEivTQ=; b=Y
	EqeCnO8Wh6AudiJU+v1z9JUecXCnEMB3xv2aa242Ls/MEF+dyhckz3pGFlJKO+hh
	+YrkkqfriLgY1csP7UsUa/my9UdN4bLrY13qKpNy8qeeANktjMMpTjS1oC/yD/7s
	fOYH8LjWUE/DZfCu8SpZcIOxr4QiDUXowJ5GlKU0sgZOO078Ejfx5ry26msiH08P
	OZn3OWyGqYSFl2l6qdBEpODGBMKgMqMGPKUOpvTuref7k7p6SAuAszjQgxe3UKOJ
	BTwO1jDvyu1T++9VgUUdZaSEFhBi5gLVLXk5cAvcdLHn8QOJ5iatmgBYPM7D+ROG
	2Jm5sffhXPqajl8SZrDAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791595769; x=1791682169; bh=lSdz4YHJZ/2yYplaxkwQEUwAKKNGrpZKu1X
	PqVEivTQ=; b=DBeb+BrYNY9xBn08WSrV0IDpR8JwRoFdTBHXbgsUvFqNsu+WPy/
	7stWWba+n3W9T0ZVBGWsRWCwwpr5BBK6/01ZOHDGjmPOTLDluJZQLqTjHiYNGnGJ
	Puiu7U7EIowIaam7+wEpxF2GBIu/8psVrTH0V7F+T+wpGg6t7QHxSmRWN3BO2eia
	J9Iy6lvbK2wjT31YMQk4BP6GfHDpZE81Zf/PbHZk11+0Kjn5ZIUj6AYf0Ikp5dqr
	913vCZ4NOdFSPwc+reCYNxfYBpCH8sZAdNmmiat/lFL76BPzDesQPeo0Y9v/kTxy
	WkNPROL1otT7j428WWJKBHbo9dgW9mXf48w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791595769; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:jsRaIX+UQEy/lP6DZSh31yawaj3U1A9BiZExRSzLNL31h/H
	q6yIdAaAbwQe8+E+GVdb6yEBjcYcTpIa5FLz63GLH4HhYiwWFE85K5ijTJP4sMY0
	Fpv/oCDiWp3d34uXuNB/24FH2th0HpShdRacrNFS1G9bfz+JwynmxsAwEwb7O2Ur
	UP1P6LhyXAd0XXyp092F0rOqujTTAuC3WA4IhRvqUPBl3i7aPy5zSJRoFAPdNaVW
	mYDt1u/1oEIP2yG/18NIIK7OgnyU1reUb7HmrXGsYfVhe3pZqITjTxYncIbQDFFR
	9p5ZjgU7pdjpJFdaiDSFZh1KH+IqNrw46r3JwLw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:WmGlklgFXmGhzQdzX+PkM/HCjd1Nf7Ddrw2x2ruJWx8=:vEeyZK4V2ruIVySEM/dMdyR5+TQdeGGjWW/3XKHIbQg=;
X-ME-Sender: <xms:-JTJargPiKRSgLBZG9BcRVeXt3ytkYQH0lq1GMT0lOYDtCvJXYAfQg>
    <xme:-JTJal9KiIFxQKA2UvslijsyHaNM2KSz7JSmLbW9xcagRoAS273uUd1RMc4hwfaKG
    Icmk_2tbRy1K7g2FBEBfgDWLUeajMcVGEdSq9nY8DDpKYR65SwkaOZN>
X-ME-Received: <xmr:-JTJaiqCM3XNY-BnN4uO8QJEGhE11CiIA8qdjK4vXpjB-O6MCepFCJYBOJdIPb0HeHgY6R2k8OHI6jPr9_y7R55LBTmhiQ>
X-ME-Proxy-Cause: dmFkZTF439oUElHXdKlvqnskIeCIgFsYSztpkaZ31beVfWNqgijPD7knRieV6Pfd4x2Ffv
    HLiw40oeApdO9lAps4G4K+POwF0KBX9QpVUrTnPkFPSTpZNOYffJyVnRyO2rZbyTdTqKbI
    MeVECSkZ+d8D5TO0uxzaeUMN07YSpyoSnKSjdfXzYE5F7Kemahw/nKVGvRitH5P2/kXeoM
    lQKt0N78ksp2cMfKTkzE1TCiHGPX8Bi+udqga75IP0cEbAmiWSFD1Mb2wGRzRGTn0ZnD1G
    yDT9glYAhBsJSy69M/60c/aX0/FTqK7QPLjgZ0Tvo/FLfMukQykApjXQ+qggkbK3u5XbOV
    lSkJBifytY0q43yPwFSxqCO98Rl8FYfWrlTkMU4CSPgLLiPa7Yiwe4XvoUnVV0rfotulew
    0RwSF1seMkCXXRlgBKuEDOzL9OIc5wczI0Nz/7enVxQvU2h8o38OKErDxl9lzymLNtAE+A
    fMbnN8F2JZqrlhc4pkRQEAQLhMA8zNZit/FhlOnMVorALjxEhwDG0HqNrKuVOSBafVNbFU
    DPinuQGwEwEbN7el3ky2LQYP1gCNmN6GNgmxATS1yjEdqP3+jnHWzbWDCXCwmCcXikeNl0
    GkNyZ2eHPZEx+nLNJcStpIWspAn4zAItU1q8V+RXdu5hS0JJ+hjluE4qRuGw
X-ME-Proxy: <xmx:-JTJak8TMDZLip2ig90PYzZ8pmhuyRwERDEPuzYv_eEZquUOMerGuQ>
    <xmx:-JTJamXlOW4SF7o7BaI7TjDH5ntdXnvOY3dkIA5c8wDegkv0pXpS8Q>
    <xmx:-JTJaqBhrbMB_IEF2Y4winhEUDymmC-T8a3UYP1ovhpCTLtIxmG81A>
    <xmx:-JTJanxZhjpQStAxHu_4F02-GlBL8v16Z5GGJae7Sr3qI_xKyuVUxQ>
    <xmx:-ZTJahXAw1ccPvKp8oUnR1NrHU-TJM-xoXd4xhk1iO_mfHD32VVhu8CW>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 21:29:27 -0400 (EDT)
Date: Sat, 10 Oct 2026 10:29:25 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] firewire: core: make execution context
 assumptions explicit
Message-ID: <20261010012925.GA300419@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261009121048.282982-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009121048.282982-1-o-takashi@sakamocchi.jp>

Hi,

On Fri, Oct 09, 2026 at 09:10:43PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series is take 2 of the previous series[1].
> 
> Recent code changes have guaranteed the execution contexts of several
> functions in the transaction layer. Based on this, this series adds
> might_sleep() calls where appropriate. It also adds sparse annotations
> and lockdep checks for several locks to document the expected locking
> context and help detect incorrect locking behavior.
> 
> Chanes from v1:
> * drop a patch to arrange spinlock usages for reconsideration
> 
> [1] https://lore.kernel.org/lkml/20261008234432.251412-1-o-takashi@sakamocchi.jp/
> 
> 
> Takashi Sakamoto (5):
>   firewire: core: add might_sleep() checks
>   firewire: core: use sparse annotations and lockdep checks for
>     transaction lock
>   firewire: core: use sparse annotations and lockdep checks for topology
>     map lock
>   firewire: core: use sparse annotations and lockdep checks for split
>     timeout lock
>   firewire: core: narrow the card lock scope when accessing node_id
> 
>  drivers/firewire/core-topology.c    |  3 ++
>  drivers/firewire/core-transaction.c | 70 ++++++++++++++++++++++++++---
>  2 files changed, 66 insertions(+), 7 deletions(-)

I realized that Sparse nowadays seems to be excluded from in-kernel
context analysis[1]. Clang took over this function with more sophisticated
features.

Let me work for refining this series with Compiler-based Context
Analysis[2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5b63d0ae94cc
[2] https://docs.kernel.org/dev-tools/context-analysis.html


Regards

Takashi Sakamoto
