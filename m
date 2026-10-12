Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6023C51D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791767013; cv=none; b=A5FdKWD6Q/RVT3b496egq+lnJOezgfyQXG9otKF9QnzfTolOqseZn16bacGWAlsAAOzs1LTvur1OwVyB+fitsdOUqpC/C/4hm2hOlgypdLNrCjtg/h3w/SJx9gAiQ+xSe56cqXSXKGsSya1oH253dwgNmVNUmCMFakZzq0SWEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791767013; c=relaxed/simple;
	bh=SL3C8VNZUCu/3dO8gqZPDMB1iiNPhzqbYyxt/EzaBo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDK+nGCKd068GaWS49W8DISipQ04pXaVzu+fBvrMRZ0G4On+Seoz9d8L4/t5Xnym4z77nFFjwo1XIXztMXOQcNWhy0LJnLgovPUgbdJCaINlDToPIask8UxQpglw9TEmb/IdtRGU2D2K0QsZeN51BdZb8+b8SROXq2c9qrESsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=OJ+fKBYr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CR1FRWbt; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="OJ+fKBYr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CR1FRWbt"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CFC5B1400087
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:03:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 11 Oct 2026 21:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791767009; x=
	1791853409; bh=UTO9iNgAsf+LULaXQEGfYed03Ub1HTRDjxqHtr3u/Zc=; b=O
	J+fKBYroD1NFWrozMD2sqmabnLL4DMRhS6lVzPow2bpT4laXdJddvxpvIl32/iAk
	cYSBmIFEsyydq9PE25VUjNQv8mJ+8bYVB1Zn29FJCy9Yi9q7KMxUHiarNo5CwGbr
	Qytf73lJ0s7+4TwKbrTxeSCgoNrSPof5zcIw9DZdT1i1J6SvtlckUhjvIjC4sMsP
	qUQaqUTOUB3Ac0Lnx751gi8ksCeYl9d62poEg2IYS67Y+4e3ZVeWxGnNUagVEB74
	dvpdZALH2QXWsAMKXhP88F9gMNAVQkwfLxel1tPKw6Y2t4Edk1c0MlLLUAsc5UjH
	YBzJok1OJ1UkIfHGLGBGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791767009; x=1791853409; bh=UTO9iNgAsf+LULaXQEGfYed03Ub1HTRDjxq
	Htr3u/Zc=; b=CR1FRWbtSnAgpZO0r0kOAVZHxGyP/zBr+R5RVMQ5BOcOY5719Sf
	dDrfQDkgAws96sY55gSX2i5hhC5Evomn5pnSN01XPo/Ik6Sge33VOzX5EYiqVg7V
	9CW4a6EOOP5voXwVPiXGqCEaSdKC+8wI9s+Gz/n7kjhitL9K+jy3X/A3ksZbZljc
	uYBcNOy8Rf57ciK0zruOEKNpZYjOxLKbvdeDnBiSRrJp2K/X37Z+LXEXGyVMZohf
	PT8Kb7Nw1qQbjRuG0vJ8K7nJT7wWhdU3kry3uatUNUyfqCQmLk2vyGpi30qAJX2v
	v4rf+US+KWd0MTsumrkkxtObsNACA95wQCw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791767009; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ies0eJY6FGG4LKk0xqXoM598f4n/BD0h+dBruaI3qMashn9
	1P5BxgjYDHTQyoJfxxDnM5OoqCh6c11wNjU86ukiHexyWpy61MAumY13h1nrbHtb
	gYicA7oWQWvSQ2PzsjlwrMp2DZADIzvL4BuN/3nJw22YxXt81iBTQvyeFr5nYERj
	Je7or5G/0eFM34EGGqL1H81SNrqHJl2fqnDX/qhqvtKXTQmaAXFfG1r0JPNwd82a
	GvLmMvY3MYO3OuECI21vXSMdLDOUuYm3siOfkPu4I/vKoHfLk/xjiaxW/U/G/DlA
	Rj2u4+sTERd2SQl2N0x4Q0mHZZMOYZx8VFq6X0w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:NBs3CHI86JaCEOAnwkGqdJMJNm2IYZQAEpZdG6FxnFU=:SL3C8VNZUCu/3dO8gqZPDMB1iiNPhzqbYyxt/EzaBo8=;
X-ME-Sender: <xms:4THMaqUmNwTmSOkLKl2OGgnQQ3T2FnQSJm26rtpggE6mvMDt8Eweug>
    <xme:4THMakj7KTafE6U7yi8iSrb4kTquWLdriwH68HRaoj-jgtFU4wpIShNKc9UyIJE6S
    Lw4zdtLrvLKiAVNg9ZbvLMwsx61OeGU3DOOLMpSiJKDMjozLmJezqF1>
X-ME-Received: <xmr:4THMal8rycdD9DDvngoagsmlG16sxXgxIyTdj3la3QGAIO2Yz7507y03poQbxB6UMmN4bzvAmGPDL2hIA4Sc8uXTQbM7sw>
X-ME-Proxy-Cause: dmFkZTEMdJzwH5zBH5KRwGiDuvBtoHvefKFJ4slBS81DwqHWTA8PwErc5VEs2huY17W8Jb
    /hoGExBg6aevrqvj+KVH3UNa2Xjgf08wIJMN3/Y1/yxAgCAegcpr7VyrGlAqHOJhg9rFlp
    ecgoXMiNZh4g+FX52rKJZOiOHMxhnwL7tjpC7ua/zWzSJJPcznQjWJO7G8LHZXVUriZYFK
    Z5JShMnXJQdEV03JiasH+0Mqb6JRNIa/4ZhQ5B4cUj/3iylaZCQJ1Tm8mged93DX+jGL49
    vLLTSOPW6q6P4H5TZ6wfxMQJbLJG8diasNaz7Fhqn70NjtJZRK6/F9lHqW/5xth0/IaPe8
    3FUVAElhrfhoQTt3gxJnFFNlw51FJBWYIBh/+WtdxyDAJDvZ23bz9pXQ42pSXbUpjiVauM
    4TrM+imGVpvNKzN05qgZoRX0V/Da/uHfqPtf5BF6q+0TLLKMHVzcC7XkftyYisi8a6wF1K
    SiT9ysaPg81qBi3nA6QYi5Y1Ec/i/s0QUp/VPeF54Ev/LbuAPgxAs6IQm3RaV3Ih+5SVq3
    /gUCvSZ0x8TVU8D2s2oIrrC3kJKRE/JPZMCBBk6mrEAvwLMm4+rDoiiuPmVdnQhP4fSBZz
    8BR9cNeHIv4qed9MqaYAenn+ryxPaVmla8Y1jm5prWns15Zi7Yk8i7Xpzjlg
X-ME-Proxy: <xmx:4THMauC8ysjSb3Asp_0Zcs02zWLGPHmy-VNdZkeXHA9TMxidWbBKlA>
    <xmx:4THMaiJeGN4L0yT8gPRnRDzeH7V2Bxh5HXUyjlU0UOamUPurybCj8Q>
    <xmx:4THMahmYHGpFCrDaCzkvYWNDK8wLdQV4agn3n0j4ObWYqAVud9g_hw>
    <xmx:4THMagFBXfibH9nvAnorbWPaO65jJ5U24acW42_Q5uXPYCm7lddhWA>
    <xmx:4THMairatzPRWqlh46Stbajqp7EHFAC_bEIN6JtWFjveVlYJLJwyuLOy>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 21:03:28 -0400 (EDT)
Date: Mon, 12 Oct 2026 10:03:26 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] firewire: core: make execution context
 assumptions explicit for transaction layer
Message-ID: <20261012010326.GA518749@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011063146.497455-1-o-takashi@sakamocchi.jp>

On Sun, Oct 11, 2026 at 03:31:40PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series is take 3 of the previous series[1].
> 
> Recent code changes have guaranteed the execution contexts of several
> functions in the transaction layer. Based on this, this series adds
> might_sleep() calls where appropriate. It also adds context analysis
> annotations and lockdep checks for several locks to document the expected
> locking context and help detect incorrect locking behavior.
> 
> Chanes from v2:
> * Switch from sparse to Compiler-based context analysis assisted by Thread
>   Safety Analysis in LLVM/Clang v23 or later.
> 
> [1][PATCH v2 0/5] firewire: core: make execution context assumptions explicit
> https://lore.kernel.org/lkml/20261009121048.282982-1-o-takashi@sakamocchi.jp/
> 
> 
> Takashi Sakamoto (6):
>   firewire: core: add might_sleep() checks to transaction layer
>   firewire: core: enable context analysis for transaction layer
>   firewire: core: use context analysis annotations and lockdep checks
>     for transactions lock
>   firewire: core: use context analysis annotations and lockdep checks
>     for split timeout lock
>   firewire: core: use context analysis annotations and lockdep checks
>     for topology map lock
>   firewire: core: narrow the card lock scope when accessing node_id
> 
>  drivers/firewire/Makefile           |  2 +
>  drivers/firewire/core-topology.c    |  3 +
>  drivers/firewire/core-transaction.c | 97 +++++++++++++++++++++++------
>  include/linux/firewire.h            | 16 ++---
>  4 files changed, 91 insertions(+), 27 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
