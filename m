Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3215A3B9930
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848929; cv=none; b=b+aRTcSV7vha8yKkrKF9HWtzNcqylP5Pzn71bilBQEUrMlqkgo9VmvDe2xtUYvzwABeCVpRXsQRbuEO0HkaJjimVHji1V9W7juxfZm7VhOiv5DAX7oVb3SVwAq8D2t5xZm6w6rOfma6QR7xdGn2oF0+FqWgfmOSdyehTBtgR3pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848929; c=relaxed/simple;
	bh=cZKgj3D/QBbHx603TqUmJN5p3kPVVSIt80OP1Z6lwKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2eu0FaeMLRXb8S6TUnl4MJRrr1wnSRY4nJZKWtptO1odepaIcnlxbDuZdh6UoaW4C1HrxWXSK5VByx6W2+RuZ5sFAiPBZGO8OR2AASjkovzDYEuY1X6IlV5VPAzFiV1Dhs9unva3tF0dd4w1D9rAVekgAu8RfLmqWKfo9orqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ro+qf5Qt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oe6FJfH4; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ro+qf5Qt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oe6FJfH4"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 166CEEC08AB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:48:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 12 Oct 2026 19:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791848926; x=
	1791935326; bh=8J8osygYk5rPNF8MQHsG1aMi9o4p4mp2nCFf3vLvGJY=; b=r
	o+qf5QtHJUGgqUrzGwrL+K0ROpFqROfuOJDK/6APanxOkreAXCll4G5EoEns7pv2
	r4YtR6rCxuh3XAR4S4YnkcKP8UvYqLa+5mMnYtIRrvLSfDmtifc51pmzABGpReSN
	tplRhTWQ2aDT0fv7SMPl0iQL7FsmPMVqOjKhWvOb1N1Nv88cgHUrfTjs+1yf2Itb
	FWQakJ+1LTlPk1Ekfs+zIKuE7TUB9oHfAUbxaxKU6xKArs5mWdp/SITrTIz9UfEl
	0FLv0wIZ8+b4MMN9xH2oatkrNuq2aOLU1t3p2tpMTVqA19Tlx327XZvIEMxHwNHV
	Cl+x7tdmvr1hhNUE2Wq1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791848926; x=1791935326; bh=8J8osygYk5rPNF8MQHsG1aMi9o4p4mp2nCF
	f3vLvGJY=; b=oe6FJfH4U78RV1sjReomB5g3cfUVTJJSXwlTlspSPDJS2c2w6n/
	izahh+B5EhkCxV60AKCDm65H5uS1+waES5melBnkj8Rd0fS/67g/UlygWH0rO2BC
	0qjfxDbeCIPDzIy8fidgQYuXFD4uNGGMNvw/XD6E3gusbiHjxDFupjdeRhYjjRZd
	vd2jugQAo+d3w1bqPjl3x+H3bgt/I5hpTN0Iosw0fdDEdp+wY3Is8kuScj7ZMz9D
	96YDJ0Fj1+AOsZNFUTcBD/po9WL0ksV3LzizoOvUCHHxzefV5UURf5m1omBAbkxL
	Jtx5HTUdeFEnVgYiFwksQ5TEJXROD0s377w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791848926; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:UXxfPHZX7D5d3c30gJFmu1JwzylSyQ6z91MShVVfTu+9bNt
	wrp6I/zMBepHZ096aDy35bDvt0+oiEI225cs0bJHuwLs0tPp6zE0dBG+abSyF0Lm
	Imklx1DmVAo7EKLAnsiC4vLowRsCMMHUy0pm+A19Hhw5MsI+co7/IzvcCf87t6K6
	N+kLhh5gqS2ACagSG3nbemXuWutKIO1ZcWsnoDe9EzCRQmqd8+B3NYIRft3Kp05h
	lsAn7IMd7hxL/PJTrku7Y208qBDe0chjXDzCJgfzbR8rjWusgH6tgtsms9xpCvZI
	2lkWx4JZ3QR4rPmpNnp5kQtHbuYWbdj58N68DZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:9Pp0uXyER0T6bLt1JrEYvMCu34fInz8h3r5M9x71PYQ=:cZKgj3D/QBbHx603TqUmJN5p3kPVVSIt80OP1Z6lwKU=;
X-ME-Sender: <xms:3XHNau0svPwQb7lbNmesff0aPoyvwXG2JZ4Jcg_kHq7G-m7IFEIRIw>
    <xme:3XHNavBX0sSMaEs3q0S-nFJ5AzPZpCe1UpInpc3lbfiA1kn5g-NtCPWBAk-tiI6Oy
    btQRWuQk4ZYGFLFbbnM457nDA4NqUDBYSUKD6F2xd9-yKCTVT_9T2ln>
X-ME-Received: <xmr:3XHNaueOl-NbAJEbvWlxpyXlS8-CQ2eb6helbSgblctJKKi-v_jyhUJqkEVWWqouKKk6iCtAVNVL8LLOpfIMuE9QExNFng>
X-ME-Proxy-Cause: dmFkZTFSUApf3VWDfYkq1W5C3LWxoVc7TB8hdl43JbXSyADDxS81IyHNVseslDVtVwQLzd
    pwXKWKM3+tL3OvGmS4ZcFs0prG7LyMvS4oZySM7/Xl94slCwvvmzaIJGq15uM50sWhECug
    83U6wcH5YvyR65XOhaiHJpNQNaVJ7j8S2sRbOCbFyGI2ec0+a4zLax6y+EvVUqoyaZ8WyZ
    i6aWE1wDNaq9J8WJGKWJI+ibK7WnqqOQj4tZPyig9nn2bQYQQlLLiLErcroNfqOQtiWN9c
    hjVA9vlFzIz1Du+OA5wSNr6OXOW2flA4Ow9+219G3AptZVmfk8lVG4rwoO3atcjQ2DtVol
    u6VTOBuNy1WLWpzEjCRPxwWHfYC3fr4nOHzbwz6FCH0N00RnHp1HjXak90CfBRcehZQgy1
    T9R7DMO/pcJWH03sDZmRbSXRpb/XQxlTDMaFHUNKkl81o1GlcWi4PGhdidc2ru9rq+GwMK
    yIocQf6NEuXmiaEkFXSabkPJWE35DABC6EABOr6q7wyK3X43HpeIaSrJiSWJ4Ai7dJP1ku
    xMqiJQRYcnrfVNEZ5tjasCbYph2GDnbRmHnrnmO1uYqOjRLpE3mwizzrb7Q+/XtjLb6dNG
    awhFsyJIkJjBOP7JcwdHAbzxAvb9WpfH9Vq70C3T7GH9/FmtfUpCCkEOmlPA
X-ME-Proxy: <xmx:3XHNashNd7644OiRlm1LOoy_wzikqDLXcSur1zpv8VQyTPYpT1CTyw>
    <xmx:3XHNauqAokhh3qPZf9gxu322lP93w24I5slmNEbW4B4Ff1HzjPxvKg>
    <xmx:3XHNakEXjWJrRrFatJ_OzBBqD_Q5-rReR0QWKafNzu3ys0_bNC0Afw>
    <xmx:3XHNaglVYbsG_Fibg0dtrPiFogTpa55jRZyCYZ5q_O6J1c3_xI22BA>
    <xmx:3nHNarJYGK84UVh8IaMTV4b_ZOIPDUuTCa8kKpii0V5e4rUgJynBJ6_5>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 19:48:44 -0400 (EDT)
Date: Tue, 13 Oct 2026 08:48:41 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: use appropriate spinlock variants for
 transaction-related locks
Message-ID: <20261012234841.GA569901@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261012015739.530731-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012015739.530731-1-o-takashi@sakamocchi.jp>

On Mon, Oct 12, 2026 at 10:57:39AM +0900, Takashi Sakamoto wrote:
> The spinlocks in the fw_card structure protect transaction-related state
> from concurrent access. They are acquired mostly from process context.
> The exceptions are split_transaction_timeout_callback(), which runs in
> softirq context for the timer wheel, and __fw_send_request(), which may
> also be called from interrupt context.
> 
> Use spin_lock() in split_transaction_timeout_callback() and
> spin_lock_irqsave() in the other functions. The latter preserves and
> restores the caller's interrupt state, as the callers are not guaranteed
> to have interrupts enabled.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-transaction.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
