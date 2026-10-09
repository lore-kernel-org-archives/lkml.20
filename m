Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C791B983F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791505341; cv=none; b=WKpwemM0hFgkr9vR5yAq45LcZC079cxiGqa3M7bCeeU/NUMz8d9hTIQV/chx8bKttLwoKdK2lwqUsNGxbn1peUip6gVqoPhzvYP4F8Onnxu6s2dGoxvXoOu1HCzd/dzdDBwKd8eiIaPi0P0a6s0dB5wgYmoV63EfqI+MDrmH2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791505341; c=relaxed/simple;
	bh=/LG/kBUYcfDw+XJrbmpq0J8dcrVTxAKe7TmfiozsELE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPdD90AkdxosWcIxkwePPHj8wLAbmoYyepAKJeB+1Xjgv/924b29EvpgMV/jPM3u8myI0sjl/vwC+4VIIIBxnzEBHOjhmFDS/H+YOxPBTTn2DdKcV0q9kDpbp8cE/P6tfNJHchbdh3qeZsY6olzDzllY5+RheyqUBseavLssxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=dwB8JxaL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ma+26YPH; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="dwB8JxaL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ma+26YPH"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CF6DE7A00BF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 20:22:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 08 Oct 2026 20:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791505339; x=
	1791591739; bh=uYN44cNXKO4ATQAeqK571RTfnbDl0xic5yYgSrkxiNc=; b=d
	wB8JxaLy6mTNr7Bn2iT77Ki4iRe03FEf4hkoQTO9qXksnqnfiit1qS9E9ydE65Fn
	QTZrxdh0ucsevbsgKLKj6zOK+px4RuqTV/E7K9HzP4SeBTPXth69iGUwSv5BOYKN
	HjtETCCfVa7sTGCcf3UDI0UT9Wnx11FwBoQmW2h6/EGESuN+HmcEamTUoBddN8bq
	Ei7drLaVczILF+u+Xc9MxXFUziiTTSbFHGuIB5liQS+QEY6kzdekzAM6tA+YRMfi
	p5DTrhhQf+5oqveVvqDZ4kpKxqBdvaGh1Uuhn/p+1oitv2GzA6v8HgLSlkD8X0TQ
	RQvmhTAKJ4aaQ2T2n7bIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791505339; x=1791591739; bh=uYN44cNXKO4ATQAeqK571RTfnbDl0xic5yY
	gSrkxiNc=; b=ma+26YPHxtlFog5OqsoHLvFBZF2D/ot0ZvJck5iRWjfedzmairE
	6SKpSMpUt201EC6TWerLBJ/+FdhAce3NUE99aFqwT3A95lrN4TmPOX0sC34TuSe2
	HfVBRWa1NX+c3FH2aJBiVkEyXh9rQBotpHuIJQuAi9Ym+8SISOFJEZA3bhsPFiz1
	6Fkrq7OQjPYuMCy21QkRxxP5sQaPP6FdeHLYdFQaiEPIO+OvROGJkPOUqZQ56dfd
	GSMinsOWm4a673bO85h9UEA5lSL0xeOEXMYlrk6g4giWcp7kTQp5UOdsWHxNeV+V
	9KVMFTiGGwAU25KBjliAY4U4wbyduqMs5gQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791505339; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:YCfTk+aAFqePr4fu77M6sOvLjiOGgyklILx8OvRLfkhuRyl
	5XMLIFofMb/+TlH/o14eadHz0c0Q7vA/y8nykiraLoXQigi+uLFSdp7tLJjC1v3Y
	B4L6vzcqcxqzOKDlcRJixbzscLDnsrN4/uwYmAOFee+oDjbUhdA25ez0jwRtWTId
	nKDPvjyv6PGxqnRqNmDxaunHQyt8hXpIQLODdKKG9TyB5/C1vEDAQ0O5HbsNHVdi
	TD/PdLNaF2fQ+/K8FSoAlXuAQd9LOzCm4Sp22plSbwupHsh+IbBr/CcQQwe8Jvvz
	D8/S89FO8DI0IAIhnWQJNVoyG6KO0pn72Dk2BtQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:vgKCjTSwS8p8bMc9zGz8MxGyjRZp34qvLiOIhrrnCYc=:/LG/kBUYcfDw+XJrbmpq0J8dcrVTxAKe7TmfiozsELE=;
X-ME-Sender: <xms:uzPIaiGGEakCAd1g1ipoDMAl3G6wLJjGr_lIhCyKdY6hoBZg95X7kg>
    <xme:uzPIahQLPidg9cA_18m9gPpeS5ij3g5Q2QrLMSsmQtONAKUSsfqLB3pyJTtrNEihS
    -h-_Eik68Yq_ohiKgYyRM0SemFxqoCuGoBPO0N_JPqvu1AhkUqCK0P6>
X-ME-Received: <xmr:uzPIajstletjWDXP3pA1cT_A4D4mDi7dx_ix4hkfcMp5OwStAMGPWkEKjZIN2Pkj7CR86ccLLJxQ9AJa9YCsZezeCA_udg>
X-ME-Proxy-Cause: dmFkZTG0VSET79bmHtwwbGMA4O+hbVN3uJH5Z5BAVENfUZwlUpEcl3UwKcldlaUTuVtarn
    iZeoCoR4sk0jpON5/2y4ufDu8FbS/4bRXB2G7Za4EUPKMMNvakgU8pBgKmAsWH/WYdJ6M0
    5kQZZI5C16F/1oMmmfHJ7Tqv4NcEDTV1amddr+nzFdGEiOn+yk6Zse33QOB+OFcMBco66g
    G45JajNQPaOOnYJHQ2FzDCSmkxX7k5QH7scS1b19FFGT7gWGTWc9V86sa8DjtgVh3/HpK+
    1D1LqWYfv7AEeT88NK7o8LfZgYZi224P6ieoVEjFYgi6R2sTLZmWGNltt47cg37VU9oSBb
    gqwcMxVAozVzv5D4RSDeqrd/dCNYNiKty1sjDVDhfM6hOb6ikrl6pzcq3HXTsoThbVpJel
    PT/4lgWsffeJllQPMHGkoLURD/awIyifoctBtLoWRhjuSRT8WpuxAYzbuSSylJqGVmTB8H
    4Jzfs86zpz0DoTqPnr6wDEZ/MNBkyrtNLnPmd9A9PZsCwKVUzrrNUV1cdfOy4nwwAyyHr1
    cWcPWXfxluHoSYnfqUT696P/qkNxZJ8uhnmDubEFXL4keMmisFyFLtrBPIDVj6YNbciKF5
    OPDSbRspLu281bs3jifMaRv9J/BHUxACUwRouKFTQlJNG148KUl1xXJeklxQ
X-ME-Proxy: <xmx:uzPIaowvI899dVzwSOw6oNIMDS7HpT7Q8tho7QWc93DGpPGFhwHYyg>
    <xmx:uzPIal65V-eMCr4KY0FZn8g7Q824J4j8DKxVGVL5nlS7h4Qq-gtEmQ>
    <xmx:uzPIaqVYXmmZXNTHWE-FjNPgoHkfrI6SlGr8qMyNDGQ4qK_SYKtMAQ>
    <xmx:uzPIap0EaqMRFGvE4xMRMA53T4AesJkcSwrJvuDw1vQGInvk8WHueA>
    <xmx:uzPIaobKYlzC-8lwW3hbeaH8j95i4GUc_zH4s-dfkCr1inhbHt_Pe7p7>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 20:22:18 -0400 (EDT)
Date: Fri, 9 Oct 2026 09:22:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] firewire: core: use spinlock_irqsave() appropriately
 for transaction list lock
Message-ID: <20261009002216.GA258845@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
 <20261008234432.251412-2-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008234432.251412-2-o-takashi@sakamocchi.jp>

On Fri, Oct 09, 2026 at 08:44:27AM +0900, Takashi Sakamoto wrote:
> The transaction.lock in the fw_card structure protects the transaction
> list from concurrent access. The list is mostly accessed from process
> context, with two exceptions: split_transaction_timeout_callback()
> acquires the lock in softIRQ context for the timer wheel, and
> __fw_send_request() acquires it in the caller's context, which can
> include hardIRQ context.
> 
> Use spinlock_irq() in process context and spinlock_irqsave() in the other
> contexts. Update the relevant scoped_guard() invocations accordingly and
> remove the unnecessary comments.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-transaction.c | 27 +++++----------------------
>  1 file changed, 5 insertions(+), 22 deletions(-)

I realized that the change is incorrect in the way to use these spin_lock
variants. Drop this from the series.


Regards

Takashi Sakamoto
