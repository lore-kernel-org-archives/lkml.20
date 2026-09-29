Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832551DE07
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684497; cv=none; b=JsLRFSvGsT4/04sb8dAOnRWlpff3+8PLv2l69pLUpLlqaItoqN/eSu4HzIdMETGwEhYDLHtqakFaw5nr+2RrZWyohHn9TzyJ66JgkeLqKUoHjX7/K3FeBPBhDUDv4oR/pJg6X5Dk5JaGOJUa5MTy9CUEbbkVKUQCXB1htisdt7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684497; c=relaxed/simple;
	bh=PpMH8U/pPdCVrP3zbYUGG+KFeHW5b9E+d4OZz9eaBbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MpWHoexDquhwq+lEkiyoT4HoblIqxjlUZN8mzyzFA0dolu3+qOA7Q2jiVtu/HB0AFGf+f0704sGfhzpsgLuoXW0YFQGvc2EEKST8947nApcO2wyKUGFWQem7ugbngq+te6+Xit5yqXvLSxINHyoc/gcCPW9Imfps4uPfVBKoE3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDM4Mnrx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDM4Mnrx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835F81F000FF;
	Tue, 29 Sep 2026 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790684495;
	bh=X3bqwk3+cDRvWYWGjVZUcZQ7RbCOEMBI5L5e+lOcX+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nDM4MnrxtdnX3Qyy1/CuGqu0ugV5rZLXKgkdSxKYw3n2uQuVMLv3NTHv/Q6JB0E7x
	 Fj+9kztFUdqQzc79VmUrKGnNWn/j+raEP2Pgqm5Vx+b23S+Bch+xo8dhWZZF+If4vX
	 OWWmdnbI/U1gXXkycqt6VCZx2s3tyhghKtv9CbjanIsB/oj4hO1klEeAkHXNXxbYZx
	 3kp0LPbMZiU10p+4smadsDGoxhTHuNg1m/R/UaKd720wGS51lusWnPes4ovsk+jYg4
	 HWXNvvVNrMqjII3BsJ89RX7Y+bP5gcS77MHSTKrAvxdsmgzdeCDkdKxYyoqEeY0tOm
	 aSeRuoZhfut7A==
From: Thomas Gleixner <tglx@kernel.org>
To: Kunwu Chan <kunwu.chan@gmail.com>, anna-maria@linutronix.de,
 frederic@kernel.org, mingo@kernel.org
Cc: linux-kernel@vger.kernel.org, paulmck@kernel.org, Kunwu Chan
 <kunwu.chan@gmail.com>
Subject: Re: [PATCH] timers/nohz: Annotate lockless accesses to got_idle_tick
In-Reply-To: <20260920085434.2918331-1-kunwu.chan@gmail.com>
References: <20260920085434.2918331-1-kunwu.chan@gmail.com>
Date: Tue, 29 Sep 2026 14:21:32 +0200
Message-ID: <87qzici6yb.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Sep 20 2026 at 16:54, Kunwu Chan wrote:
> tick_sched_do_timer(), called from the tick interrupt handler, sets
> ts->got_idle_tick when a tick fires while the CPU is idle.  The idle
> path reads and clears it via tick_nohz_idle_got_tick() to detect
> whether the tick handler has run.
>
> The flag is accessed locklessly from hardirq and task context.  A
> concurrent set can be overwritten by the clear.
>
> Use READ_ONCE() and WRITE_ONCE() to annotate the lockless accesses.

The following scenarios still happen:

A)

              if (READ_ONCE(got_tick))      // reads true
-> interrupt       
       WRITE_ONCE(got_tick, true);   

                   WRITE_ONCE(got_tick, false);

B)

              if (READ_ONCE(got_tick))      // reads false
-> interrupt       
       WRITE_ONCE(got_tick, true);   

#A is harmless because got_tick is already true and #B is harmless as
 well because the got_tick read result is only a hint for the next idle
 invocation.

As this is stricly per CPU the READ/WRITE_ONCE() does not change
anything in terms of ordering. So what exactly is solved by the
READ/WRITE_ONCE()?

Thanks,

        tglx
