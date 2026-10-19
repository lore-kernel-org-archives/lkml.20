Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB773D1CAF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792379256; cv=none; b=YF/Mp3f9ZZOZXRrq9nYZEh7YUnl5s0j6wORxTopG3LcuzxVe64HsM43ceN5Nz3QnkbXcyrPbISntePS4YFooAcSKF0db0CrIdxKOezHNxNiUnskL8Cr+XbqHleu6RZ9MeAq+NSCGG1FHFzKSq+8spuD+gPjec6jn0L73M22QXeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792379256; c=relaxed/simple;
	bh=jHTAibrtRN7JuUQrwM2e62mHU5jiaYp/bw0LtOz50b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApJ3KXZ1orU9v3Dq2PUXhmgKXYNTwvnlklYt4ubm4A3VdHuICDGUz8yagA6UgEQxmOz7rVztKVYzIg59r/eZzqf1BOGZ+Ov36XGPGVTXjoV8Oydc195OQKOFc7wBuY9vAHy4g/ayohjXcINez+lZrl7KibZ4ml2j+47ePkdexWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=LUXCdm2w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gGiEMMsx; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="LUXCdm2w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gGiEMMsx"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 4D972EC00DB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:07:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 18 Oct 2026 23:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792379249; x=
	1792465649; bh=PpXCkIvtnB+W+dsNuGgJoyHlr5x81ZPt+BBZ+R6r8t8=; b=L
	UXCdm2w50sBdJci0o7loQiPA02sOU6AVjEBgyqymLl9O5lcsNF1fjCan/zwS4gms
	hokqvJFR0b6aKsYuClxCSNFKyhTkm3qMYq5EP6Ysj20OFcjOA0iezJSGQ0gmotdt
	TkRalwfIB8fnf3+/H6dQtiu4Tb/Rp3wAnqdI5N65VACyg6VIG7hfY5eOySzsHD/Y
	sVU/ESqdDK5gtjLyS8q5aGMEJYsk5OoSqidhNgg1FOkeSzXJ85bGoMANydC5mvXm
	gR6niRPbOmsMU6m56o9G+4vJw3GEac+t83/3JSNXpqMhQX8LTezN2OD2et1UBIIb
	zaQJIb+9TlT3fJMbdzLmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792379249; x=1792465649; bh=PpXCkIvtnB+W+dsNuGgJoyHlr5x81ZPt+BB
	Z+R6r8t8=; b=gGiEMMsxwGPq2S1jLg9G8bM+af0mbI8OaKXzcF3r/Sv84LpMMf6
	x9j1sMzSASAfPTVWooLSi0QzTzV7gA5rabLcC3FQfGbL8Ry2Z2s/EemJANqBsL4i
	F2rY8KoMwUN59xgP75EolIiKnVBBlFjMFVKczOEVxuQuYmJa0J2g7j/o82VVgYSy
	kucwGOBCcKIwNtX4vWz+mm+ZbRCq0UvAHZCzvTjTUUj/oEoFXm+RyJ4io5AGmP6r
	974HDk56bHFH45XM78mC12766Xg+P5x/D6BcSeejwWIM4Qm2IwTml87a8hONU58A
	TZITvAYs7HLn8Vcc53oYmQp9Ri1xxaTVIng==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792379249; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:TQJ9wLuxxngDyDt7rt8adlVtomndoiO+tzwVug4vtLl84gC
	lxgn0I+b4T83j13dLawpchbEFm4zmjF8UGte4HQ/GUxVlpylR8idLrmPE9nG8JGf
	KOg/euTOqm7EZdMenq1cSEe5j/7YUIe5jC2INslgjuvPCwgeQuVqR88Yg1OBOa8v
	Qr1QcQPT3CNPxOXRgQFwsQGVtwY2t7757yposFuBGmjqhod9T9pj/0XMuhJEgHnJ
	Yoo4DPLqd2bH/bvNsEdCS8T4CUKB/IPSb0zgL6WzMjTtLxLv5d4KhC8nTQgmW9Nl
	X2mOFPh3kvJBy/S3Pk77pFNBYcBDLAoqhN0M4og==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:4DDPGcKkTW2DqOCEH2A34Gappt2dKZ0g4CtaJjgJBc4=:jHTAibrtRN7JuUQrwM2e62mHU5jiaYp/bw0LtOz50b4=;
X-ME-Sender: <xms:cYnVaoL3US_s4KHT8hbYia5LQY3W4rr9oAMKYL81McdTfQuYbjDtXA>
    <xme:cYnVamF399mPPBxogTr_E57tX6m6gEg6-lXhF2zHUHdjcC7hVd9ueuqcIQgPCVK6t
    oe_Y7jJikQiImOgm3sHUtuj9wQq17Q8PKx1I-aD48WaiC9qpCL2WsEd>
X-ME-Received: <xmr:cYnVagR40ThBxky3rlkM4oHMGY6YDySZznTgH9Z3hoaCE0YdAud47PSuEZ_qF-tZXTIL5ki87Q62_LUinuKLqrMPU7FPqg>
X-ME-Proxy-Cause: dmFkZTE8JY1geYk9O+D+DSokuL7tWgf726nu+VBq5BLuLTmqpEJKCp6BUjGru6/+FiGBbW
    6PYbtjCAeWsw08HIGSyU5GVBB6ANpg9Xh5GSm7FvaI8uyygAwYf5WBiU68iLCeHM/G3W3I
    AFDxBH11zB/LX++2iisss6P2iFWV1Rgf/MUSuBuY+NeN8qbkhDTRwtc1/E4s+IDsejJwFM
    Vh6f2NowtSn5npmu24fqzDLrBxnOBuKuo1nuz27q+nnyb2qM3VWSP/Y7vDYNI261PQuDmG
    8fkK6z9HjeQ1xsOJuhqi4m0VpbO++kFWwJtTpzLhd9EJTlN56aKr6jef1Gr0e2NV0osnP3
    /pj29Du8msWMmPHzN8x1qbcmsUrIweR61TuvhN2kttJ6HeJlkTi6Kt/MvDD5qPLgBWEC3k
    7RSx9+vYyM9a+JcbFaBQwCt+Sos3R5mLpOimWOBBe2vXZRfNRDBGBG5SxPSkiDcgQwCrhd
    9i3+/YCA26HU6SqYA7MWx1VM1WhWI93zA0pQku93dz28zkPA4SW36FT7e8bzsu0Gb14K5e
    OcClExSa1J/gNZixCU93C1dU8003vGvY3H1BZrBQ3s3iKHuswM3UZBGScZkb1SpiMOsPN/
    wII6AQgLwt+ITKDc0qPfRz3xbdsm3rkTtIcOJxljCFMaPZyeNm5wNwWRSNlA
X-ME-Proxy: <xmx:cYnVaiGdSxwej1sg1D2NRstC_6dJAYzF1irB9kGzX046Oy7VAx0SaA>
    <xmx:cYnVas8_Xk-4ph_ItOcThRnbDSq0xJpmvvgiEyNHt9iWfm1lH21UZw>
    <xmx:cYnVasIcG38JSmazYcDvQVtoYWFzOJFLLZbznkp_oSOhSohwtpGUEA>
    <xmx:cYnVavaSt22c1_LDFVBT1eC6Jbf2kR0qelMHya6gDfW_ThOVY5zO0g>
    <xmx:cYnVaq_RkFeIm2aJY1d7WZC3xznjNryEVOl-lEWpzMHvN9r-TKc9jx5P>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 23:07:28 -0400 (EDT)
Date: Mon, 19 Oct 2026 12:07:25 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] firewire: core: invoke packet callback from
 workqueue when removing card instance
Message-ID: <20261019030725.GA48580@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261018132955.391090-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018132955.391090-1-o-takashi@sakamocchi.jp>

On Sun, Oct 18, 2026 at 10:29:53PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This series is take 2 of the previous series[1].
> 
> This series updates the dummy driver used during card removal.
> 
> The first patch switches to a designated initializer for the dummy
> driver, which contains mutable variables.
> 
> The second patch ensures that packet callbacks are invoked from a
> workqueue in process context during card removal, maintaining a
> consistent execution context for callbacks.
> 
> [1] https://lore.kernel.org/lkml/20261016135948.85343-1-o-takashi@sakamocchi.jp/
> 
> Takashi Sakamoto (2):
>   firewire: core: use designated initializer for dummy driver on card
>     removal
>   firewire: core: invoke packet callback from workqueue when removing
>     card instance
> 
>  drivers/firewire/core-card.c | 88 +++++++++++++++++++++++++-----------
>  1 file changed, 61 insertions(+), 27 deletions(-)

Applied to for-next branch with a small change that both
disable_work_sync() and destroy_work_on_stack() are called for closer.work
in the final part of fw_core_remove_card().


Regards

Takashi Sakamoto
