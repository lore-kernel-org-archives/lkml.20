Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178E418A4E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153568; cv=none; b=OqnSqhY2RVeIDzqzPcAqNLyKAbn1kFxz5XB5wRSK9ow7Q9OzwHoEVyukEuGoFkbz/oLCIlMcJ7yH03QMYjApB3zfJYCDPfr+fDxavlNXWWnE5qD38NeqN8GAU2136oeVYveKCHldOqb0MNdE8p7rYqf1l5CyPctik5Xuom9r3Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153568; c=relaxed/simple;
	bh=6YhkbJp1GnUua/BnwV/Uk9eXhGbblMwtm/j+KUHmL9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjPmE3tP45fvMzUenQ5WwVSH8vE628x1flPX5+J57pMa5vbOaMouClahTF8oSIodGfmtWovFwprr9K3pbFgkxPaywVNPh0j5eWqpeepJFSlr9WG0Lt3kElnrPebooonFEGBVU9xHU12LwDqQCgbVOrV6rAXpjEYFer+eyYXmBMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=I6CtNNG/; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="I6CtNNG/"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db09so3473146d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789153551; x=1789758351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NmoGr5wjAgJ440TiKD/XfvIcttgRzXNwAMzNiaW8FPE=;
        b=I6CtNNG/w0rhgQzB9T/lkNZwl2EYrH72MBAKNKAH6N1d6IJVKSjaR8Fne7TLGzH1bQ
         otcYtJgNUHqEoy/vlKtK1qhY/QLvldAx3/0JyiSc1YVkGtZjqEGWUU5WnuQhhQU8BmVd
         ioXpiOyMOBrl8gUAZM3xLFx+O9e5D03JPwciG2/g2Qtr8lRzbdzgZ84zKL/H1aFW23/E
         eb+7u512WiR0Vt+dBJV1dPTtoE4zgQYXUcDt8Z+Z98wwVg8hwMeIcCWusVxWGnOTeBy6
         aCDdrFkaaDs/3HyPVXQDKVeqf1TMJkB9qbUh8X5E93JFelrSFJ90Z9UrFvkMiszOX+M+
         xMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153551; x=1789758351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmoGr5wjAgJ440TiKD/XfvIcttgRzXNwAMzNiaW8FPE=;
        b=fP2iWqmjgkMn17Vzc7JWVfbEwDUudcsJhyMzJr/L/eWRF0tO17iZVXsPYcqK9n1WsS
         ziVbKmrkvcP3lUJ4igyPuxu9rCVm9dhcK7V3rPD5uw4oA6gTfGv7krvCx43l4HeUrh9C
         +CL59EokRvCfKhh5ff12X0J/uIvEQI4EBsjnqcFgsqMlK4grjNSOUsFMRqZzI0tVN4Yc
         KJZMof+NUJOddmg/Nf4zCTxygYXtozxTV7sTjfWYMP9Hd+4EFS2ejU61LH3CWMIHaNuj
         7/OkvE0fvURjGQ+CB2qK1ZzjvV/UbmmQmjBWLr0L8X+2sctE7mGebr7iYc3nHU6VYinH
         x31Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjDERIafinJ9rJdm7XMj8LWPElnfz2Ex3Q8Q0J1QAkBi7b/KS4+GcAT/ElvM72QvU9RKkXnGcje1hxZ3c=@vger.kernel.org
X-Gm-Message-State: AFuF++nrav1MpwsfQ3g7cg4Tsq/5bj37Nkw9wC04SimtZmyVkORiSI5R
	RySyhGAirPwpnMm5pdtXsYyTmjRzReFfnY4WQb+F2SqgcWFS0BN4p4IUo0I12kLM5w==
X-Gm-Gg: AYBFou3nmkKVpsdFwrdsHU3PpikDs4pHqZ5e5zcopdexVvEV00AbMAeg5Eb8Ib/HBCS
	9S9fpp95imvJxCUYbkz70UJrr6+RGoPXinJjUucQJqlNAFcVvZxvI8csywQXnvQGbidRBCF+RXd
	7Pi+VvcgsiRaYuSwNKyql1ltYy/MXzfHgiBHJDnlVUAxvNjyQCj9AIF7BCpbdcBwFppzZNne8L1
	mHEg+GfBGiuCH/PuQQvjaD7DzeBGL7vV/4yCB6xmeVDxvo+1zpyHz/DVQVjYG7qLqDgTnDcgXJD
	tr/hdKG/af5slWD8HT35I31TWPyJHfLSJ+FoV6KxLRSQcPTfxCYtrgNl7QLSPOw3jJ0fOuooUun
	8CQQPopmOYgMVQYgPHziCbcyP/c8vuUzTpPgmcCZ9PWY9Si0JbFTptEmBcodKKMvKpxSoX8RJ/E
	jg33uSprcpOkgdQfvkHOQ+fYDyehU54mXkfLZhOICm5bMF2ugLU/8dIqdLBZR4VywaThPBkRDZ
X-Received: by 2002:ad4:5d6d:0:b0:910:346f:1027 with SMTP id 6a1803df08f44-912120fb756mr87544426d6.37.1789153551126;
        Fri, 11 Sep 2026 12:05:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f2033e7sm28071926d6.4.2026.09.11.12.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:05:50 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:05:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, boqun@kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	"Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>, stable@vger.kernel.org
Subject: Re: [patch V2 1/8] signal: Prevent exec() race
Message-ID: <3c6865d9-a4b0-4fd9-a6d2-c4f4e1f94d29@rowland.harvard.edu>
References: <20260909095518.GL776954@noisy.programming.kicks-ass.net>
 <aqFNV4k6DcbyxYCe@localhost.localdomain>
 <20260909124555.GM776954@noisy.programming.kicks-ass.net>
 <aqFw--VfXWz-yZt8@localhost.localdomain>
 <d633542b-2a2f-4adb-82c1-ea650466f63a@rowland.harvard.edu>
 <87pkymywth.ffs@fw13>
 <adea7b13-51cc-4603-acbe-9e6d5baa5247@rowland.harvard.edu>
 <aqKu8nJqPsmKOo1d@localhost.localdomain>
 <541b1db8-8649-46a9-9fa1-1b5f93cded7f@rowland.harvard.edu>
 <aqPzzMlPpXMNZ5WC@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqPzzMlPpXMNZ5WC@localhost.localdomain>

On Fri, Sep 11, 2026 at 02:27:56PM +0200, Frederic Weisbecker wrote:
> What I would love to see documented for example is our case: acquire semantics,
> which are described to apply one-way from a single memory target, are also
> transferrable to other memory targets when there is a data dependency
> involved between them.

"Transferrable" is not the word I would use, nor does it describe the 
way you should think about this.

This is just an example of the fact that ordering is transitive.  So if:

	write A is ordered before write B (by an intervening UNLOCK-LOCK 
	pair), and

	write B is ordered before read C (because C reads from B and is
	on a different CPU), and

	read C is ordered before read D (by an address dependency), and

	read D is ordered before read E (because D happens to be a
	load-acquire)...

then of course A is ordered before E.

The exact nature of the individual orderings -- such as the fact that 
one of them is a dependency -- doesn't matter.  What matters is that in 
terms of the times when these operations execute, we have A < B < C < D 
< E.  Naturally this implies A < E.  As well as B < E, C < E, and so on.

As such, I don't think it's important to send much time on this in the 
documentation.  It should be pretty obvious.

The one thing to watch out for is the imprecision of the phrase "ordered 
before".  When writes are involved, the order in which the writes occur 
is not the only factor; you also have to consider the order in which 
those writes become visible to other CPUs.  In the example above, we 
know that the UNLOCK-LOCK pair causes write A to become visible to C's 
CPU before write B does.  Therefore, since write B definitely is visible 
to read C, it follows that any read on C's CPU that is ordered after C 
will observe write A.

Alan Stern
