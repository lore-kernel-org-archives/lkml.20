Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594194;
	b=qXPClcc9HtzUmkAR5wxCCHBi1g0RfhCCW+ceuGo29/HCRb8Wv+EjZC27ywSdQRG9ZPZ1
	 /8nDKUaev5N8eEi9ynJuFetFiYroYycQWCCAW3OqXj89SHMxng21OnXasmM0NV43a4o9c
	 Ux21qDnNpxgiZ/GuBjgSn/8GJA59PO6P25cxSQhneEeXU4Cp7gpADKq71XdLZla2vS4Ds
	 O0pJYDVS1CIx2PdusXmSY5SPeLn+w3hta7W8e1pkiP8V4gMjoN7+VoinSrub3PJ1g5B8/
	 j4txeg8jwq3dtIko+0OSGVQbxC7tduHlvK8BT7aOsVogpK+sP/hIfGVCRoWhKh61EIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594194;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ps8jnieIBUvXKQt8okCCezQ1Z4XeJY8OG3ZtaCjBE/4=;
	b=uNPNANuKvwzWQeaFepSidbYHc0egtN20VXnfOybqqZRbqlaN6lkDU07/Vxcnaomb7H4F
	 YONaqI/0QuACb+PmPpvfzFzFv36/FzC9pHVsWpUgEPJ7c/rFZFTiz8J01WuTU6Nrm0lnp
	 wQHez0SRMAKI7bCAQbWpXQHlQQgM0PLkPxUcGVjF7yDGtwhEKDJJO5rldd2w0XngYxdcS
	 OfKAw2RJYd9kdPNeGaFve+0OIYhSEiVcjS+FoVg5opTEC9RXFGYpSYCFoE4cBCmXRWUas
	 MyWrqgEBjFsxIs/KYpp5x/5yHDbKmmsV/YcYjS5Wbvs0nO//qhzXhfJP/lzU7L4P/Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=A9yovqxC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hCAsqppb;
	arc=none smtp.remote-ip=202.12.124.146
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE6A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=A9yovqxC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hCAsqppb
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 1AD171D0018F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:36:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 01 Nov 2026 23:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793594192; x=
	1793680592; bh=ps8jnieIBUvXKQt8okCCezQ1Z4XeJY8OG3ZtaCjBE/4=; b=A
	9yovqxCegX6wIWLDLL8z92b+NcFUR6C+qIRh5FVhPt/pM2xSx05EdwUJP73CyIY6
	GHsFPQTMUyooOpoTP+q9S3xG3YoU66EnLgI6ye69YEfkQnftHq6gsjJfkN1w3v36
	SnL6S+YRQua62Bs4etdkjEvk3Q9knPqNpiNpLhV7aTpx6u1voH2OEaR56pzFI5Mn
	HLq+3bduEZUl97OYqmxSPoGCoWbL24r+8CkSWwrXnTGx4MbXZh4GLLKOJYUDrs7b
	bcGuDHb/E0gyLWsgh7qXInPzje6LGKE8qTmYqaodxOFIHWTM3dF0BPbPOQDw6VwD
	JaNrTfsqP4jFbBKctC2/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793594192; x=1793680592; bh=ps8jnieIBUvXKQt8okCCezQ1Z4XeJY8OG3Z
	taCjBE/4=; b=hCAsqppbdET8OSsJ2FPEw0flZivlUBS6DW1v7UBaHLzLAkxDDAJ
	1e7BTSz+XzvRof/In1IdxWzUAOwf2R3GBi7HbgudjBuQiV6i7VDxtRaMmPm6fQex
	CCksfK1H2yoxkWzkqvcAvYeUvFr6cmS4qtIbgA5+qOjeXSpyoMh+BEzWo8hWeCAg
	4lCgUza9sh7z/ajVapHBehwOSbp1Mb8EGLXnxSYj6JQACDAqedQfmx+w30a3U1FU
	ALtH/fgCX01U4WeWgqFvWeegobRIZzpYYsRgSCupfVnBYWKRBsEDrWKacJmW/9xv
	uQ/ll6Jt4Fu7Fzi2OmWSggwZL42uV/aEUSw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793594192; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:te9Talat231G0mlZsSwF3ZqtT0l2pdKR5DbrR2cotlQNF4x
	Nszi+ePkOYRWTO5ROTucFRA2e2AZqZAXH+XCHB3Cevz1ZYKrVIKxNPmsGhspMqQQ
	H7DcVB8Tb4MiQTjIeOZoiexFMX3lOSvCjY9F8FxBzS5xxA7bpYIBAGueYORyUaIU
	hk1kuey7ErkOIhrHGSikStIO3aPDoMrP/YQ1fFQLvlI+JmvEhW6I+hm8a1OIj4BA
	inalaCTpJl3uy9f/qmDqIjhGtd4jISZSxdX9sDISQAJFnBtOrQudq6KzSm5+SvRT
	LbI8JqWb6b+4/oD376NjraIeZA5bX4H5GcyOHeQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:pGTUg3s5Inf1+R0yQZ6PpzA3zn2xB5g7Sfwi7BrP6UU=:D06H3y4bSA2VD3+5kMxkcfHExhxxAl6AboudfnqLBGo=;
X-ME-Sender: <xms:UBPoajt28tqSDM1yK8QYqaFFHEovnvhajHYAe6IKx9ALKU27ZYruqQ>
    <xme:UBPoasPcoyBJzBh7cUfyeBToIu95GCGq0r7eNr6dx0gXluhRy04W8co4Ol6SZpSX7
    1SEMlqWJU63EIst2s9hRS8dt4Kk6apcVnzQdK9Ta_5ysgsgu_PvIbA>
X-ME-Received: <xmr:UBPoap2sQSZkGNOGsEYwYZAOrR8fDdgJCJnF9uoS6_QoPfCKublO9b897aWC8Jddj-k230k2jEWtTpnRTTmvmVjD-5_e5w>
X-ME-Proxy-Cause: dmFkZTGQf5CGUGC4oBa05Ym+fbEqJ0QxZV0RRQsZply85Hp+hMkK3iZVnXqliZRqGp8DOR
    qxjMyYNHRYFU3pdZytKRNn7IxkA3oKmnJnhSgE+yVCrA4At1i69xfsQt6XQFGp6BfVOc2u
    oLr3dCjbY12svB6GQ8i3C2jYBY6ySmBvS8zwrv5XbH3Yr/U3faMY5LQ6a2/QS3xkNjraVp
    EYfluJL6hf5UtFRu/DoMJedxebQ9GgxtW1VDTHJscn8z9TJ822zxHiC3w8bBxtVovgnqaO
    1EaDsOBNkFn7b/GNODUyZDDIp8x0IcfEDhOZD5QIU5Aj8JLX8s4I+VXajsA6xTvwPBCKtn
    q3LVlbYH7Vq9fEa2K+pk10neQcyqGP0ipMYC1D3EU+AUtJiwnYFAnQiJhz328/e0GBzltC
    OAY6hvg4DZwI6seyBJFysewWVU9uUmQ7rkyc360ENdprF9kkA2tnUq56LpS+chcBGmpTna
    vf5TvmsuyMxQ/p+o9BpEMEAD+rkjMSoM/44k5g+pR9VSL73rK9Kxo26aUJfk/QT9cT7Azs
    qTdgMO7wT+oxjLAo0xpOOa5epcZ2lWQmz87d6j06ilIgILpDU003tULqROO6VngkYhzIc2
    xnh1QfFeKPtigmzXWizspiOmlpU3Mcw35sxBKP1QFxtQtsGlzMyc+KVCdiIA
X-ME-Proxy: <xmx:UBPoagMOWZyEjv_KijDfnBJTPNfWYFkNa-Xq3TC5yYvr5kQwWnHYQw>
    <xmx:UBPoah2zGIdZ_bwjhm07NhtifOXvWlePYNkCl4foqSIjgAnWGuEQDw>
    <xmx:UBPoavERW17V5BVhI3xth7yQOMkFzL1vUMEINOHP1AavkjgODuIJtg>
    <xmx:UBPoam43-_TvjTqZwLvPZ0N5kPwsOS1nPpgPXidXRpvoYUjEbeIAqA>
    <xmx:UBPoakVmBlyZPyThMEVCbcqqVXBcvesDU6aruGZYLfAqEsmY_HmG0ulM>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 23:36:31 -0500 (EST)
Date: Mon, 2 Nov 2026 13:36:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: cdev: Check return value in
 ioctl_get_cycle_timer()
Message-ID: <20261102043629.GA1188344@sakamocchi.jp>
Mail-Followup-To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20261029101545.3216-1-sreekuttan2156239@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029101545.3216-1-sreekuttan2156239@gmail.com>

Hi,

On Thu, Oct 29, 2026 at 10:15:45AM +0000, Sreeraj S Kurup wrote:
> ioctl_get_cycle_timer() ignores the return value of
> ioctl_get_cycle_timer2(). If the latter fails, the output fields
> may remain uninitialized, causing the caller to use uninitialized
> data when calculating local_time and assigning cycle_timer.
> 
> Check the return value and propagate the error to the caller.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>  drivers/firewire/core-cdev.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to for-next branch.

I prefer this submission to the previous ones from other contributors[1].
It's concise, to the point, and easy to read. When using generative AI in
our work, it's especially important to keep the intended recipients in
mind.


[1] https://lore.kernel.org/lkml/20260617023554.2789907-1-michael.bommarito@gmail.com/

Thanks

Takashi Sakamoto
