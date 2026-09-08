Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28B559CA2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883320; cv=none; b=dkueqYoMtLQ8BTFNTuiSiJYkUmDoJDs6oTpvTVlU31LqdGqIrqy9r79vE1jfZIhD5TG1EHm6TlUTxHLIi1cvHwQYQ7Pwq+cHS1EZecJCdbE2K+dWwc0D07f1wXN1vNXMOzerh0pxG5xaSORd3IyiFS1oebOiBFBq0CwZycGov48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883320; c=relaxed/simple;
	bh=yaBev6x1pDC3vXUmt2RhLbEpcdCihB7k6MXUk7ANKmE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uHolnYXYvqqBmF3fm5sdnnLtYDFW9CfjaEXcCHbSJLUV7XSzogvT8kB4cvuD6icH9YB8pAqGeXDgp1iJ70ZCqfPJe7SSr4ntaC7YRv7FSziZy035FCYU27Q5EkcRzIuhzqOWk8PF0xs9g9bcvFOw0/l+cifNmE5LdYMtDf6SHy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ougS9SQi; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ougS9SQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1788883317;
	bh=w7AqlwipuMPzkJSp3baFGeJqXcM7kW3BtoJJ6zsvqac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ougS9SQi8VLW2FYu52Eg8z+qMHgtJrbE+st/FCUSRcQx6yBDkdlF/ii6f7kxRzpQ2
	 QYr98jaa2bAQ4GOht7OjO/UfiA02xe9RDc2UUutY8M3qqL/qpCyjzBbor8UGSzvdWf
	 /RxY6StlkKCcvYpBD805evKaRztimLSg4XnM7Epj95aDjZEiSpkY08lkX4EojfOAqA
	 q3iMsGBh9QcgM0X76U+O/bRXx/DcTb6s8gazMUYDXC6JCqmpMHFq1zhZnGgovG+CRi
	 sYllzb1qEyyzZX6yymgzjcFMLV0U1KLMdyHPiKmKWa7x9SUJNjl6a25KPEwNj5brXR
	 QLsHx4Dfm+ABw==
Received: from localhost (199-193-172-8.cpe.axion.ca [199.193.172.8])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4hfTGF3wg4zZ3F;
	Tue, 08 Sep 2026 12:01:57 -0400 (EDT)
From: Olivier Dion <odion@efficios.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra
 <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun
 Feng <boqun@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, David
 Matlack <dmatlack@google.com>, Marco Elver <elver@google.com>, Sean
 Christopherson <seanjc@google.com>, Wei Liu <wei.liu@kernel.org>, Mathias
 Stearn <mathias@mongodb.com>, Chris Kennelly <ckennelly@google.com>, Blake
 Oler <blake.oler@mongodb.com>, Rich Felker <dalias@libc.org>, Matthew
 Wilcox <willy@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos O'Donell
 <codonell@redhat.com>
Subject: Re: [RFC PATCH 1/5] rseq: uapi: add rseq operation definitions
In-Reply-To: <lhua4q28z30.fsf@oldenburg.str.redhat.com>
Organization: EfficiOS
References: <20260828153349.8061-1-odion@efficios.com>
 <20260828153349.8061-2-odion@efficios.com>
 <lhua4q28z30.fsf@oldenburg.str.redhat.com>
Date: Tue, 08 Sep 2026 12:01:57 -0400
Message-ID: <874ifzwx3e.fsf@laura>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 31 Aug 2026, Florian Weimer <fweimer@redhat.com> wrote:
[...]
>> Indeed, TCMalloc relies on the behavior of RSEQ v1, that reset the
>> cpu_id bits in the RSEQ shared region, to invalidate a per-cpu pointer
>> cached in a TLS. This hack requires TCMalloc users to use a glibc
>> tunable to disable RSEQ registration for threads so that TCMalloc can
>> register its own region, overlapping the TLS cache.
>
> The commit message does not quite say how this addresses tcmalloc needs.
> I assume the idea is to reset some other data structure and not the rseq
> fields.  Is my assumption correct?

Indeed.  That would allow TCMalloc to not have to overlap their pointer
cache with their RSEQ area.  In other words, they could be using the
glibc area and be compatible with the rest of the ecosystem.

> Would it be possible to use actual CPU instructions running in userspace
> for this?  I assume not because it's not possible to restore the
> register contents.

Well I had in mind another solution, albeit some might find it ugly but
I think it does have the merit to be explored.

Basically, instead of doing all the operations in the kernel, we could
setup something akin to a signal handler by pushing a frame on the
userspace stack and resuming the execution of the thread into that
"handler".  Userspace is now responsible of everything, including
returning to the original IP.

However, we need to be careful with things like the red-zone, the
shadow-track and the extended states.  Other than that, the only thing I
am unsure is how to handle nesting.  Perhaps someone with more
knowledges could expand on that.

> My concern is that this would turn into another bytecode interpreter
> over time, basically reimplementing BPF.

I did think about adding BPF type to run BPF bytecode.  However, I don't
think it fits well the goal here and would make the feature unusable on
configurations where BPF is not available.

Overall, my idea with the RSEQ operations was make that could benifit
the userspace as a whole instead of handling only the TCMalloc
situation.  Otherwise, I would have just name it RSEQ reset.

For example, there is a CPU-stride variant of the reset operation.  I
dabble with this operation to cache a TLS that is global-dynamic into a
per-cpu cache.  Thus, making a TLS global-dynamic access as fast as a
TLS initial-exec.

Thanks,
Olivier
-- 
Olivier Dion
EfficiOS Inc.
https://www.efficios.com
