Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499343;
	b=UN7GJ55/JPlh0Bw55CCqqP5uPas4WBemcdPPkQRNJnIV+koXN5ZMMMerCFwMW/6B1p2U
	 ofhydIz5ujKtPgEwP8CTMc/WS0lmLWHIkg9HmkgZLaLqJZ8XAv7Lhd/C8+XRlYTRPO7Gw
	 z0QHijM9x6nfY+mscG9RQFlDp+bt+qsv08iyxQ7JgzOB5OE2g9GO1JMS6tMXw9e/qFJji
	 KrJo5Pzv0B3SfF4aesWayoc+IPXmJnh0xBpqOdIs3NkpTH/3Moq5X8cqrME4dNEzzduVS
	 ePuf1UFjX9NbhjRdPxQAgnI9RfryYPEM4QXVK5wMtbEF/8M+WZArLFKCVz2e8qP+WtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=KPbEAvPl/y/xmk/lT++UYTQF1+NtwaKu78SSBDxxR8w=;
	b=ioptU8aIOqgrafRre7M1l6ITwtCYTa2q2KnMGLmTDEZ+YgJ/EzbX4iVnathzWjvFlH2B
	 Zcdcs6d4qLdbc55hIBilfr9j+rC8XKo+MLHb+yIshqwI6W+A4uxYY7RVPdwlts7E7FcIG
	 zjmK7FgBh+pSlILI+Ns1VnE9loLRIxT8k0Th/spZUC8LdzvodVhG1hnYqp7I3qBJaFGy4
	 ChVmBWsmyCVC4JHxYqZ1I7dEU9mxL76YAOzx62hj/GqJJXwHgLpRmnW3oqqpjWI4mNYRS
	 sXxgB17bLzrPuKQ9fI1gZ7VQiiEy/etQQOlgH+Wvxn0giIjLxGd62chrVjFdYBPSJTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=NAqPDYQy;
	arc=none smtp.remote-ip=83.166.143.175
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3164606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3164606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=NAqPDYQy
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j8BY12r25z2sF
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792499333;
	bh=KPbEAvPl/y/xmk/lT++UYTQF1+NtwaKu78SSBDxxR8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAqPDYQyFiwBn7Ubnq+D76aSFPj7HeI9OsB+/dpqs8Z3h+Vf0OUEsGXq+Kwb8e/Oh
	 xQ+iPNnuWYvItWz/u1NGng+DrAISbQAVr1tTEe14ExyNgYlkCcm5YtCvtKMShqxVfG
	 zupx2l2VBryJw4cbbO7dY475Hyo/NDPVbraGJUMI=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4j8BY05fDGzr0s;
	Tue, 20 Oct 2026 14:28:52 +0200 (CEST)
Date: Tue, 20 Oct 2026 14:28:48 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <20261020.ij4euziuYovo@digikod.net>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
 <atZepZTcoR9teu-r@sirena.co.uk>
 <20261019.Za1phooV2oom@digikod.net>
 <atc6Vczti_EjFrQq@sirena.co.uk>
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
In-Reply-To: <atc6Vczti_EjFrQq@sirena.co.uk>
X-Infomaniak-Routing: alpha

On Tue, Oct 20, 2026 at 10:54:29AM +0100, Mark Brown wrote:
> On Mon, Oct 19, 2026 at 11:11:20PM +0200, Mickaël Salaün wrote:
> > On Mon, Oct 19, 2026 at 07:17:09PM +0100, Mark Brown wrote:
> 
> > > This issue is still present today.
> 
> > I removed these wrong kunit checks Friday so it should be good now, but

In fact, I updated mic/next Wednesday with a new patch series addressing
these issues.  I only added two (unrelated) commits on top of that
Friday.

> > I notice that linux-next still has the next-20261001/landlock merge
> > commit instead of the latest changes from mic/next (which should not
> > conflict).  Could you please confirm that a normal merge works?
> 
> It was broken with whatever I fetched yesterday hence me reporting it
> still broken and merging the old version, I've just started the merge
> for today so I'll find out this afternoon if the fix worked.

The new commits from Wednesday don't add the bogus kunit lines (i.e.
there is no kunit_suppressed_warning_count() calls anymore), so it's not
possible to get the same error.

Merging mic/next into the current linux-next works for me, and
./tools/testing/kunit/kunit.py run --alltests works too.  Please let me
know if anything is wrong.

Regards,
 Mickaël
