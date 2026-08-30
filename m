Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F45270808
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788115713; cv=none; b=k15CRH+6sGkacTUA6J2WOFKiEZmvLE1NlilGaA9CBTwEvMyR4sFMZpgKZlkiikMpgju4mStxU9bHwe7vH+VBDnOv1w+cRo9MK+dX5c2ewbul6gR6LxK8EbhAZW+zl7SAO8XFKz2DSGKsaOmKriPD7A/qm6bXBUVPpuFsou5DJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788115713; c=relaxed/simple;
	bh=+IHHKVceA7sm7Pm6lLoeiRxGIBoJr9Lu4oRKPYd4tGo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FnmHJ8/CDZ+1vV91Gg2/cyezrC4BRwwV2pxSPD3LmR5NUihbL6OkCfiBbeErElsMa1hDFJE6XjVupqeU2EXOni9g6ohsnKBk16xxlAXA7JzmDRzBYGOmZ9Xb0f2/P374Z3rzJ6tf5MPVdhuyP4UUtGfV0keJLtvZRPj0187uZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=hhqKVq+4; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="hhqKVq+4"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id E14DACC9AC;
	Sun, 30 Aug 2026 21:48:27 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro E14DACC9AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1788115708;
	bh=+IHHKVceA7sm7Pm6lLoeiRxGIBoJr9Lu4oRKPYd4tGo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hhqKVq+42WLg5dRPel/bI6PGVnw7IpqQzMnFCw6wlxPIGHCI7oyBAtr/3ttef2brK
	 R1hZPFGwMuTTMPXeDky0BOZ55IF3vOMvJDpPSa9ru3k8usQ+ePgakiWivxywxTVhCr
	 FdXL9jQiIVjBRnGB4WADjALNwwmaCpDNF1mUvpvTg6XlSF5u63HMMOg2wsF4hvK1tq
	 R/ddVfVuLUQShWzX+wVNJDa9nO6cwWtu5IWjZoGyPMQEC8ZghvR4qF/1vbSLMO8gNs
	 8glxC80tYb2DE9WRun3mnUMBYNt3mmYm1qNUTUITHsWX9g6dOk+Ucq5YNK/iSoQG3W
	 RrGOlqRi1gkMw==
Message-ID: <bf1bcc338412535f817252bebc701f979d476423.camel@rendec.net>
Subject: Re: [BUG] KASAN: slab-use-after-free Read in
 irq_migrate_all_off_this_cpu
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, Farhad Alemi
 <farhad.alemi@berkeley.edu>,  Mark Brown <broonie@kernel.org>
Cc: falemi@asu.edu, linux-kernel@vger.kernel.org
Date: Sun, 30 Aug 2026 14:48:26 -0400
In-Reply-To: <87y0dncvgi.ffs@fw13>
References: 
	<CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
	 <31cd7357e666ecc74b7a995641b3de3c0aa1bd0b.camel@rendec.net>
	 <87y0dncvgi.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-08-30 at 20:30 +0200, Thomas Gleixner wrote:
> On Sat, Aug 29 2026 at 16:34, Radu Rendec wrote:
> > On Thu, 2026-08-27 at 22:41 -0700, Farhad Alemi wrote:
> > > =C2=A0 BUG: KASAN: slab-out-of-bounds in
> > > irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
> >=20
> > Thanks for reporting this. For everyone interested, please note that it
> > had been also reported by syzbot a few days before:
> > https://lore.kernel.org/all/6a8c23a0.dbb3a75c.7844.0001.GAE@google.com/
> > Currently there is no follow up to the syzbot report.
>=20
> The syzbot report is useless. It mumbles about memory allocated in the
> networking stack which definitely can't end up in the interrupt
> descriptor :)

I know, and that's why I asked for the reproducer :)

The stack trace of the UAF is valid though (and pretty much identical
to the one in Farhad's report). I was just trying to point out that
it's very likely the same bug.

> > > Our reproducer.c is available upon request.
>=20
> See further down the thread :)

Yes, I saw your and Mark's replies, and you're clearly many steps ahead :)
In hindsight, I admit I was lazy and didn't bother to look further - partly
because I thought it would be easier to investigate once I had the reproduc=
er.

If I could go back in time and start doing this kind of work 20 years
ago (or even 10), I would. It certainly helps figure things out much
faster when you've been doing this for a long time and also know how
the code evolved over the years.

--=20
Best regards,
Radu
