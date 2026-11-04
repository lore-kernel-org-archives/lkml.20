Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782579;
	b=d/ER+7a3+LkGd+5x41mcgNMNxiHUdst8fxRvAmKpIaEali8QgtOoHFNmwXKXqskGyate
	 C1bBFIQe/Q0Pw2oYYneVJWrvsamCKHcIbbvIx5m7MIiLfZhSBaiW3pDx5MI5Eb+Lp0kp8
	 q45KZOndlhlJRBtukfKXnkIMTKrAXJx2D1HbNN/OjZ2khVVNO/XiDgd7KPZDjefrN9rZP
	 CojTM9QEkkVDX0m0dFD6BPIn94VC9m7QNbno5rRu2Tb/dIvzOozoTP5qQSBCUJtHIOnCx
	 Jqc9gcZln5vEBjX9YjYs9P9E+IiO99YAo3sq2jXx3bq9XhHYHavxjl0oCo8q3Rdaw9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782579;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qQVf7f8PLUUHBAmAuq6jyGQHg8S9QNMMQm8JtMB1S4U=;
	b=bzJXOklgd1WdV3iRCC0Zphqd+uhLNI9QTb0owJsf9BJ94C+hj1tkvk8+WDFIcywWEAPT
	 0JiPjDnYfZ58E2MKHoL6RELIsE3FZKBwr4GqhJ9kQElQWCLq7qRO4Rv0Yh3J4e1bPAJmW
	 fAU/ZpuIR/G9cp7WfwMI395oZhDPcHN6REqQQWPhmVnjneToZna1Enoel/iUb5051eTfQ
	 uLo3f4mAQqtUII8kBzfTMGQXfUbsFl+xkyvUfBuC/euqwu8xMq2MRzHfRkBczhnwAPfgx
	 YHeJS4fjHT43YBhDp7lQCDU3VOJAWxoHo6bNPSN0nRsVwRUkkg4WKDK/XF0B2PHCNIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="mu/vzX2e";
	arc=none smtp.remote-ip=95.215.58.246
Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB54A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=mu/vzX2e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SqR9VFOeiKuAqJ+nLJmdz88eGFRmKKQAFSp14MozLnw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782575; v=1; x=1794387375;
 b=mu/vzX2egO4H0XxpgFl7mSyNARjp+fHTHsrx4JNMo2YK8QTutryukhmv1zONKDtiFOe9EV3f
 qWsS7XHPkZuWsjq37wfTvQKv0CeosFFMq4ounwaa7IaMMTvhaVTbyXXHsIY30U86VExVZ+sPlOb
 uMtvtTY01LNh5N6t7D7xjmXCKuY0Gjyvebt9P9ei8e5CGHc5r00jga1rDo8vchmJqWRFoHzVS5a
 5QmS2ONcim5tk2g6K1t9zLdSqVkWYdt13HDHDu5aUXAuLHkBStoeQQ6dF+uHaqzA71LYWtbXRj4
 GfsvZDcOJetyCB/A9udH6VpbJXJMeI5d6Ncyu9v4lkZbQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36180429a31982d8;
	Wed, 04 Nov 2026 08:56:15 +0000
X-Mizu-Trace-ID: 36180429a31982d8
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 16:56:12 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <kernel@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: How to attempt to gradually eliminate the compilation output?
Message-ID: <aurzLOxEnoUWo3Hz@wyuan.org>
References: <aurU4uKyIUBl9-CJ@wyuan.org>
 <87y0b99i6p.fsf@trenco.lwn.net>
 <aurpUltnbwWw3eyx@wyuan.org>
 <87tslx9ee9.fsf@trenco.lwn.net>
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
In-Reply-To: <87tslx9ee9.fsf@trenco.lwn.net>

Jonathan Corbet <corbet@lwn.net> writes:

> Weijie Yuan <wy@wyuan.org> writes:
> 
> > Jonathan Corbet <corbet@lwn.net> writes:
> >
> >> Weijie Yuan <kernel@wyuan.org> writes:
> >> 
> >> > Recently I've sent several patches to fix warnings.  But since I am not
> >> > familiar with the actual codes of theirs, I'm not confident enough to
> >> > touch some parts, but only the most obvious ones.
> >> >
> >> > Since this is a goal that Jon has spent years for, I'm wondering if it's
> >> > possible to periodically send out some email notifications, which will
> >> > use the file paths from the compiled output to find the recipients and
> >> > kindly ask them to to deal with these annoying outputs? Perhaps we could
> >> > use a script to do this.?
> >> 
> >> I think that nagging others to fix warnings is not going to make anybody
> >> happy.
> >
> > That's sure and that wasn't what I intended. 
> >
> > I'd be happy to do the work, but putting myself in their shoes, I worry
> > they might think, "Someone from nowhere, who isn't familiar with our
> > development process/workflow, is sending patches and just adding noise.
> > It would be quicker and easier if they simply pointed out the problems
> > and let us fix them ourselves."
> >
> > For example, last week I was about to send a small patch when,
> > fortunately, I searched lore one more time and found that an equivalent
> > patch had already been posted to their list, but hadn't been merged yet.
> >
> > These warnings span many subsystems, and I worry that sending patches
> > before I understand their respective workflows might come across as a
> > bit impolite: "We already have this fix in our development tree; you
> > should have checked first."
> 
> Well-intentioned patches are rarely seen as impolite.
> 
> It's always worth looking at linux-next before trying to fix something;
> if there is a fix in their tree, it should really be there as well.

Thanks, learned a lot indeed. It turns out that what I was worried about
already had a solution. Will take a look at linux-next each time later.

Thanks!
