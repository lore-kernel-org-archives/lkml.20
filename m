Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7F48E0C5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300551; cv=none; b=lLxw2UaRqoFrNU7HM2eQ0X7CgdBLa9+WRWD0gldYVCginUJC//+Xsj5VkcfO9J4odaom+TyA/BcXiZrGAqHCje+92s9wzLxHZ0/vMYtwORtYnmsAUgUmKZORRhL9OEcCN18xTXSND6UCX55UXu0LayvvD1NfwDT2V/cEo4o+YI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300551; c=relaxed/simple;
	bh=dq948jaoMaEB3LYVgNxryC4BevIUKD9Bh6F8q6HBkwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i20jU9khzAsMmKRv1riM4X2eR0YYY+eBrFeS1pyagXuxp5sLxz6wxDyYPhLrB9lDCkJTC+v7yILC8TVIr5S8Ewo4bwcTwxE3abrfnTjaFJ7oFtGmrm79IQ9bEOW2L27deHj4wtXm6GbZf4J46f+W8MW7CbzHknfd+dUeIU42yuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=XXZmrOYM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xG5Iidc/; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="XXZmrOYM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xG5Iidc/"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 0315F1D00169
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:29:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 06 Oct 2026 11:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791300547; x=
	1791386947; bh=e8eXYtY+oREDaA0FgzeVv9uzs8E118cpgp7JTwvR2PA=; b=X
	XZmrOYMBnPaBGwozJChARL5sEYXeqm9F8b5mFV0F/ANbDM1rE2tcSWEL0bf/uEJq
	QyLwo1J3AALqU1nHqK85sX5ZmEvXreWpJYSwrPCV2dODdBzOU3zlxOrt5R99w4sc
	7XiCTqAUQuSBRW2zDNgOjJ80NT6fq+dv8HZWSnhyPPvyS/ED8DRy42gRoXff4wGm
	s5cqw5j2BaZHHSUSeCCI2B6C9P17m8P3AyOy5UALWU4YhlY0RBO4T5IVAcjsq6oz
	KDxgv/wALR8jhs0x7YQ1dGaJCxyO2sbkTMt74h5GRpViIXIQLvq96eBvA9R08EXO
	BdBfyVP3KnAONCJXK0uNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791300547; x=1791386947; bh=e8eXYtY+oREDaA0FgzeVv9uzs8E118cpgp7
	JTwvR2PA=; b=xG5Iidc/aH2rCCICI9KNqehnP5S3Lp0X76YYNXVNF9ZbGJ067UR
	GOTK4IdOLXVBTUML6rifavbl/Xx/Xtab3k3+ae4PLwbldQ4qMEPJyyrlMJtVOakX
	ngmMZAbepc9spCONhxMFDdv6fHgghg5CU+5sq2+lwNFfHeBY+qc7vfL66cBc6MVS
	Rx+Lvg0qlKkr3qYkXSRvZpiV/3su9hNvrnMm1TmGgF6TJtQyWt1ibmwKRVR5yWlL
	2G4l1Z4RlzyMkSut4ZZRUbp1WngwiJuZ79I4Hh4P2sWRy084wS4MCmYYVQMnIfnC
	uv8/Vt5RIjswWOiveQkyaM6alEhWvwldBLA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791300547; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:hmlf0JESZW+D7uhSD6++RY36ODhMUZEN/kvU8wu0i8nbps9
	aKuVsu0X8qJdf7E11jTq6vV1WnftOsq4bMQ1+RC24I6EePvz/EuGoiniFggOX+ZJ
	b3iaIH6O2gLZlwQ2OtDUHp4nUohZkKi2+S8pcmNpY00aJ2KaVQHaSTAlkEl+wMcb
	1FpNXwDLvvzieNIPiKeve659jjzkJ64e65B296875d/7EXqmL95x5osCbgkEejuE
	IckrXXAmZMo27hD8FWeAuGpFldyEoAS0arVVvZg7PKvYwtaNatNWngBVBoMo7+qn
	3QBDHAqC3+hl1NrARzo8wBNcKvUJFZWctePGI7g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:efH8BgJF9eVPXBP+iLYC1M2ISEpw93h1whqYI8I5Beo=:dq948jaoMaEB3LYVgNxryC4BevIUKD9Bh6F8q6HBkwI=;
X-ME-Sender: <xms:wxPFaubPGpy3T3Jh6EljaEB6W1gcHRCKvnNGCa1ICpGsMla6rarfkA>
    <xme:wxPFavVxFdLwLjj-F2-UaXYt9EmQJxM4Vx7GYB0w6yfUHCIKFJC9W5_OicFZGCR7O
    yOscP633mWYx9daROFgGHeXd5Fr5XJK8fQncV8md4V2u_jtN8VpwXU>
X-ME-Received: <xmr:wxPFagghJiUws0T2H_DVgNUNDG4KTqkmY3pqHu31KnbE3iznvUqD2goBYJEWomR04kwXgl9hkQ_YmQh3SZxXfpN2D_JwrA>
X-ME-Proxy-Cause: dmFkZTFcJDpnIEoaWg0SCNrEg9VL1sbsKKHhtnGw3PWQlCVmN/UfGQY7pHSls/dT7RuU3B
    Ch6okomxv17eNfSOlUv2k85FVQ5IlGqkISy5gykVBjhl8nzVFoQyRlTvTyil2E3bzuOxhz
    HKEM0Mjdu6Uf2GUq2WtjyabaDEIAD+QhF+QzWDK+stbvmCbIobXKwLs0SjYL0t/Ql3S9Hh
    TANVu8HU8+URhNeYdFxB0W0/p8zOin7LJrPotCISPj5zqaA0CQsFoMJVhxrQVilUcL8K8c
    5bK+JQJ5PvJuWMw0wdX0b68FaBc3/9194xjh1s2Asryk91GFZ2Kfq1Dy3vBjDELZhhqngO
    /yANUd3WkYMKHGV6Na8PNQuGf5ZhMrnvqzSJ1Z1w91oSShJOvw5tHI28fa6avML+vyNLfP
    wixsC2iLrty8hZD/lTcqWM94K1ReWCFr1wlOKNWpmV0OgG+VL428455K0t3sWWQrnFByKX
    BFcYBOfTErKIBRfseTu+V2XzwuWWGhrzV8fcub1SRGFp3gZLBFu8UCCYRFMGe9J474rWNY
    lGljWSECSnHcY7Yh6Xn5d9mpS65jzK2de/iXJYDuJWYgCr6Yp1DlYcZbG6eN43VcjVoUSG
    /KA7boszOxevXfvG/FIzccSafK4uw8woWAgNZvsF1ZY76absePv0HBWEoFpQ
X-ME-Proxy: <xmx:wxPFatUr4ROaVk7Vct4AMusYjTeNUj-HVGRnqGz3j4nzgA_Mg9_mEQ>
    <xmx:wxPFanO6Mb7JWXkdVDa1Ipg7b3YK0v3VfX3qeD9DITgHkd2PaNKnLg>
    <xmx:wxPFapashfYIo0F_WYNmWAzpFz0NgDpc5TQO4bHLbcbWuq0OQ5iatQ>
    <xmx:wxPFajpIv3LtnaKTcWZ2FgZrB25ilOonKxfuR-JpwI8gfu0ZeH4lGw>
    <xmx:wxPFajOANJkHHMjS5J4Kg5jl0hDjiXpC8wixxL866QgXz68tc9Ulu6Fc>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Oct 2026 11:29:06 -0400 (EDT)
Date: Wed, 7 Oct 2026 00:29:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] firewire: core: expand close_transaction() into its
 callers and remove it
Message-ID: <20261006152904.GA101743@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
 <20261005112544.240552-2-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005112544.240552-2-o-takashi@sakamocchi.jp>

On Mon, Oct 05, 2026 at 08:25:40PM +0900, Takashi Sakamoto wrote:
> The return value from close_transaction() is useful only in
> fw_cancel_transaction(). The other caller,
> transmit_complete_callback(), simply discards it.
> 
> Additionally, the pending transaction queue should be enumerated as soon
> as possible to prevent the issued transaction from completing.
> 
> Expand close_transaction() into its callers, and remove it.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-transaction.c | 66 ++++++++++++++---------------
>  1 file changed, 31 insertions(+), 35 deletions(-)
> ... 
> @@ -201,9 +191,6 @@ static void transmit_complete_callback(struct fw_packet *packet,
>  					      packet->speed, status, packet->timestamp);
>  
>  	switch (status) {
> -	case ACK_COMPLETE:
> -		close_transaction(t, card, RCODE_COMPLETE, packet->timestamp);
> -		break;
>  	case ACK_PENDING:
>  	{
>  		unsigned int delta;
> @@ -218,27 +205,36 @@ static void transmit_complete_callback(struct fw_packet *packet,
>  		// local destination never runs in any type of IRQ context.
>  		scoped_guard(spinlock_irqsave, &card->transactions.lock)
>  			start_split_transaction_timeout(t, delta);
> -		break;
> +		return;
>  	}
> +	case ACK_COMPLETE:
> +		status = RCODE_COMPLETE;
> +		break;
>  	case ACK_BUSY_X:
>  	case ACK_BUSY_A:
>  	case ACK_BUSY_B:
> -		close_transaction(t, card, RCODE_BUSY, packet->timestamp);
> +		status = RCODE_BUSY;
>  		break;
>  	case ACK_DATA_ERROR:
> -		close_transaction(t, card, RCODE_DATA_ERROR, packet->timestamp);
> +		status = RCODE_DATA_ERROR;
>  		break;
>  	case ACK_TYPE_ERROR:
> -		close_transaction(t, card, RCODE_TYPE_ERROR, packet->timestamp);
> +		status = RCODE_TYPE_ERROR;
>  		break;
>  	default:
> -		/*
> -		 * In this case the ack is really a juju specific
> -		 * rcode, so just forward that to the callback.
> -		 */
> -		close_transaction(t, card, status, packet->timestamp);
> +		// In this case the ack is really a juju specific rcode, so just forward that to
> +		// the callback.
>  		break;
>  	}
> +
> +	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
> +	// local destination never runs in any type of IRQ context.
> +	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
> +		if (!find_and_pop_transaction_entry(card, iter == t))
> +			return;
> +	}

I realized that this expansion has a bug to suppress the following
callback, since the condition 'iter == t' includes the local variable 't' 
while 'find_and_pop_transaction_entry()' macro initiates the 't' with NULL
for its internal use. When receiving one of the above error acknowledge
codes (e.g. RCODE_GENERATION at bus reset),
'find_and_pop_transaction_entry()' is evaluated as NULL, then the above
return statement is executed always.

> +	invoke_callback(t, status, packet->timestamp, NULL, 0);
>  }
>  
>  static void fw_fill_request(struct fw_packet *packet, int tcode, int tlabel,

I'll post v2 patch after enough testing.


Regards

Takashi Sakamoto
