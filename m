Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504076;
	b=AHB72YSOB6/HnDcMs5dU4/gvw12zQwlpWJBU9hEIwVsBFLromg7exoFfQBU1Wo8RPdUe
	 D+xflFyEpeFEBcpEBfmB2MZ5XliU7Oi9uP1PawTC4t4PniwCM0NtBxazs22fs6/kQq7hE
	 zJnXH0SmNijBtHpjh8GgI5IsdtbmGDXX/Gu2j0rmztXiSu99uNsL4a1GzbWZ/tdvE8IQm
	 zobvsM+4GjTdEUKyfIcvuOAimBRnCCjG3p/WivhDcM+OR/WkzkWr8T9VXBHgPIz2/+eNd
	 BEtaOUbZ5TeWtBExqh8zaUFa3OHoGKhU1PhwVwsM5i4Po2b/kbGYK41+A3lFMHvksRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504076;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=i7dIlVTrfi2tsXSNOJNuqQjhDng7dLWLXE4flMPdj/Y=;
	b=LjCsiD0nF1Q7j3XI/lsTdVb4YOUz13uDm3LQrx/uiapIFyDznPnDti9iaiUORd84AHD9
	 RHKIj1+X4DdZHV5fkcSbFNtnbdBsFm5pVsjllsvQ/V+sGJ5N7GqM/KZ2HvGtqJtH/BAhG
	 Pk68/I6ZvuWF/5k5UWPLlSDYJ6ZHErFGX+LPCqScfzcLzDe+6m40IJY24z3FLxxJtsB1f
	 kONCZS1hVWTT1jQ/oDXhnegiQyzlg5Hpa5rlhE+ScpF+IFsKH4sQLuiqy6XXUaeqN526u
	 LLxvSPWRTk62z3fbAZmQV+JHI9wF1BkR91UDjhLGICt591nJSgGZfwlpiQZxeO3Sigw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=gZQl3Exd;
	arc=none smtp.remote-ip=84.16.66.172
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=gZQl3Exd
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j8DJ82dtZz10P;
	Tue, 20 Oct 2026 15:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792504072;
	bh=i7dIlVTrfi2tsXSNOJNuqQjhDng7dLWLXE4flMPdj/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZQl3Exd96vtnxLoecu9JhzvwJP4Vf3jDDI0+LP0lOwehoF/QRHrziO9uSfreaQLV
	 zVRcat56+alIwqCX9v6I0UlHT38R19B0D+hj6ZAb3kYlziT1p1UKwn8HsBuvVM8HBc
	 KhFfRe3lGvJCs32IDEMgAwPgt5Vba0Gg6+SqyCDc=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4j8DJ75Vbgzt7C;
	Tue, 20 Oct 2026 15:47:51 +0200 (CEST)
Date: Tue, 20 Oct 2026 15:47:46 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, helpdesk@kernel.org
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <20261020.Eetahchaez3C@digikod.net>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
 <atc6Vczti_EjFrQq@sirena.co.uk>
 <20261020.ij4euziuYovo@digikod.net>
 <atdmcnGhgZ9U8g_S@sirena.co.uk>
 <20261020.shai5aMoosai@digikod.net>
 <atdtpq6msC2Fhy4I@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atdtpq6msC2Fhy4I@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Tue, Oct 20, 2026 at 02:33:26PM +0100, Mark Brown wrote:
> On Tue, Oct 20, 2026 at 03:16:51PM +0200, Mickaël Salaün wrote:
> > On Tue, Oct 20, 2026 at 02:02:42PM +0100, Mark Brown wrote:
> 
> > > What I have today is f349c073889ff7694b470ca34dae9bd94d47b0cc which is
> > > "landlock: Fix superblock use-after-free in release_inode()" rebased on
> > > the 16th (I just tried refetching and there was no change).  It seems
> > > very surprising that there might have been an infrastructure issue
> > > fetching the tree all of Thursday, Friday and Monday?
> 
> > Commit 0da3cb3db77e3fe2202ddb637f6d27668dc360f7 appears in the
> > transparency log:
> > https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/commit/?id=0da8a8d3dc37ec9a71b76f9739957297d64d4b73
> 
> This probably needs reporting to helpdesk (CCed), when I fetch:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
> 
> or go to:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git/commit/?id=f349c073889ff7694b470ca34dae9bd94d47b0cc
> 
> what I see is the commit referenced above being the head of your next
> branch, not this other one you are mentioning.  I'm on the fra mirror.

This head commit correct.  I mean that commit 0da3cb3db77e ("landlock:
Enforce capability restrictions") was the one that fixed the kunit issue
and it was part of the commits I pushed Wednesday.  Anyway, it looks
good now, thanks.
