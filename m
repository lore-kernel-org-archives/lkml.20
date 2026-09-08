Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2B579838
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905743; cv=none; b=s4MJI/I923jBaZACkyyJh6GErPED5wx73FhI5a3Pp6H+G5ysaEstGDyU+Gfikz/lP2KLcQuJc1bVfL5qDuGtlpMKh+eZoKWllXkBNKStueJf+pe8vtAVSnfjLQaUHqkYdiCrUZQvXy/3kANVpKBAfgANFiyAmHzfILUW0TPGGmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905743; c=relaxed/simple;
	bh=YdeaSz1ZMpPi3WNhWEKVwleFNUmSr1j6NVx2DNuRh5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EXoNokC6JFiVF+MEYUSTE3kNFTxPGKXBGTVoD2mv4k4LS8GRpUwmzdyeEN0Ob3dTRetZdP9RNPxIL96SicoVOLEp98rk/7P/xgZ52KVSlXLOvJods1LOZctBV6Bf8txG3wyTFRraJdmr6pTpFvcnFovHUi2I4DnnCqE1pOGUlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRWL2rnb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRWL2rnb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51C11F00A3A;
	Tue,  8 Sep 2026 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905741;
	bh=biOXQY29VUqFI2tf6h3jT8vQ2QWQDuZsZ84Sh2bREdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jRWL2rnbb4GuMHvrfx/N4vEjpcWQWuHG5LH+yf9uWSRXjcICCOw1I8sY9yA4vS8x1
	 vk2gdNwhTHe8XRNqvMGuit+o61k2A02gBcIx74HjzWN0pTb7uHIO7eo8diRXmfvw8h
	 k5j5MYk9a2iwxO1Pw/exX9Qznj/eA8DnlUjmeLyRHtqkgLMPQiH+RHDmEfOmcTCdeV
	 pJi3XAMHdz3pwUF9O3OWsdHSisoRgIHLOCaEN7icKmUoxYP5Avk5aoLkOWagLPnANJ
	 VHivxdZhCyZnJim6SqZtuWm2t3vaCQRCP3M6Res3bjoU18CVBYnlkpo5BGsSpzuKiN
	 ZNukwfz5A7MLA==
From: Thomas Gleixner <tglx@kernel.org>
To: Florian Weimer <fweimer@redhat.com>, Olivier Dion <odion@efficios.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra
 <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun
 Feng <boqun@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov
 <dvyukov@google.com>, David
 Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, Sean
 Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, Mathias
 Stearn <mathias@mongodb.com>, Chris Kennelly <ckennelly@google.com>, Blake
 Oler <blake.oler@mongodb.com>, Rich Felker <dalias@libc.org>, Matthew
 Wilcox <willy@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos O'Donell
 <codonell@redhat.com>
Subject: Re: [RFC PATCH 1/5] rseq: uapi: add rseq operation definitions
In-Reply-To: <lhuy0dbd4zd.fsf@oldenburg.str.redhat.com>
References: <20260828153349.8061-1-odion@efficios.com>
 <20260828153349.8061-2-odion@efficios.com>
 <lhua4q28z30.fsf@oldenburg.str.redhat.com> <874ifzwx3e.fsf@laura>
 <lhuy0dbd4zd.fsf@oldenburg.str.redhat.com>
Date: Wed, 09 Sep 2026 00:15:38 +0200
Message-ID: <87h5jz1jat.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 08 2026 at 19:31, Florian Weimer wrote:
>>> Would it be possible to use actual CPU instructions running in userspace
>>> for this?  I assume not because it's not possible to restore the
>>> register contents.
>>
>> Well I had in mind another solution, albeit some might find it ugly but
>> I think it does have the merit to be explored.
>>
>> Basically, instead of doing all the operations in the kernel, we could
>> setup something akin to a signal handler by pushing a frame on the
>> userspace stack and resuming the execution of the thread into that
>> "handler".  Userspace is now responsible of everything, including
>> returning to the original IP.
>
> On mere context switch (not signal delivery), I don't think the kernel
> assumes that there is a valid stack pointer.  These scheme would change
> that.  This would be fine for managed code, but this scheme has to work
> with arbitrary code that reassigns registers temporarily.

You are right that aside of signal handling there is no assumption, but
as signal handling can happen at arbitrary times user space should not
play with SP unless there is an alternative signal stack, which has its
own nasties as we all know.

If there is truly code which needs to trainwreck SP for a sane reason
and not just because and has a good reason to utilize such a
library/functionality, then we can work around that by a mandating a
separate "fixup" stack per thread to enable this functionality. Then the
screwed up user space stack pointer becomes completely irrelevant and
the only interesting register on the kernel entry stack is the return IP
which got pushed by the hardware. And provide an option to work without
this indirection of course. :)

There are probably other solutions, but I really want to move this to
user space and not introduce yet another limited single purpose
"interpreter" in the kernel, which will be "extended" and duct taped
forever.

TBH. At some point we have to stop pretending that we can support all
possible insanities and their arbitrary combination. That just limits
ourself and puts the burden and the complexity into the wrong places
just because.

Thanks,

        tglx




