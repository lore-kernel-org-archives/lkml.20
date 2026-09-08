Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF6339382
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888729; cv=none; b=Nxgccbzf3/ZIwz1I8ALve+4zfGoxGnqTpaRXv/81EidtA57RSjn/1mWkQyskFd9lWHSAuoDyzEg6vHvzbzMAY00SDdy/QOZEzlsL6oeNAoPPBvRUlgOTsCPdSDeDgVSsLEoR21xA99CFYpADbNRZoIDriOLU5C+vQ+bp10zPnH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888729; c=relaxed/simple;
	bh=6JIlt6oRgX4aHn0hVogF9w/JbTbSr9xxJ3EQWLN9Xyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X0M7F+plniQveMqF+DgLuUusHTrAuoFe4rXpGPxD+U1MCH4FgP6OTYNcF6rP8wnKuu7HcszAZL3OUiDAHlUNRgHDqft7Q0wKj9IETLf8g1D75Ms/O6z8AEqwiQ+tBkkXOUt8tqPfffCy8yCYfDmM+t2YU/kTx510epjk6ToXmfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iK6w6z2j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iK6w6z2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788888726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4WtaTTgBItQ8IiXr6AeflHG0tfmvAFO+w6dYKY9XneI=;
	b=iK6w6z2j91xSbQ/0sCyFNrnClNgE4mxMM/GlYtpxBOGWJM7BQhT6dbNBKQtjrPHJMqdgvf
	RFQoeXQq4xSPKaogk7OV3b8Ss4U5MPNeNrZya6VKD4j3H4/uZHktKM9SUyqcb1giL5R0iK
	WuQADr1CMoDxvtvG3Mecjh6RZgXHv94=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-YsE4fdhvOGibw2HS6bTNYw-1; Tue,
 08 Sep 2026 13:32:03 -0400
X-MC-Unique: YsE4fdhvOGibw2HS6bTNYw-1
X-Mimecast-MFC-AGG-ID: YsE4fdhvOGibw2HS6bTNYw_1788888719
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C15A31954117;
	Tue,  8 Sep 2026 17:31:58 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54AE91800346;
	Tue,  8 Sep 2026 17:31:53 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Olivier Dion <odion@efficios.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,  Peter Zijlstra
 <peterz@infradead.org>,  "Paul E. McKenney" <paulmck@kernel.org>,  Boqun
 Feng <boqun@kernel.org>,  LKML <linux-kernel@vger.kernel.org>,  Thomas
 Gleixner <tglx@kernel.org>,  Dmitry Vyukov <dvyukov@google.com>,  David
 Matlack <dmatlack@google.com>,  Marco Elver <elver@google.com>,  Sean
 Christopherson <seanjc@google.com>,  Wei Liu <wei.liu@kernel.org>,
  Mathias Stearn <mathias@mongodb.com>,  Chris Kennelly
 <ckennelly@google.com>,  Blake Oler <blake.oler@mongodb.com>,  Rich Felker
 <dalias@libc.org>,  Matthew Wilcox <willy@infradead.org>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Carlos O'Donell
 <codonell@redhat.com>
Subject: Re: [RFC PATCH 1/5] rseq: uapi: add rseq operation definitions
In-Reply-To: <874ifzwx3e.fsf@laura> (Olivier Dion's message of "Tue, 08 Sep
	2026 12:01:57 -0400")
References: <20260828153349.8061-1-odion@efficios.com>
	<20260828153349.8061-2-odion@efficios.com>
	<lhua4q28z30.fsf@oldenburg.str.redhat.com> <874ifzwx3e.fsf@laura>
Date: Tue, 08 Sep 2026 19:31:50 +0200
Message-ID: <lhuy0dbd4zd.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

* Olivier Dion:

>> Would it be possible to use actual CPU instructions running in userspace
>> for this?  I assume not because it's not possible to restore the
>> register contents.
>
> Well I had in mind another solution, albeit some might find it ugly but
> I think it does have the merit to be explored.
>
> Basically, instead of doing all the operations in the kernel, we could
> setup something akin to a signal handler by pushing a frame on the
> userspace stack and resuming the execution of the thread into that
> "handler".  Userspace is now responsible of everything, including
> returning to the original IP.

On mere context switch (not signal delivery), I don't think the kernel
assumes that there is a valid stack pointer.  These scheme would change
that.  This would be fine for managed code, but this scheme has to work
with arbitrary code that reassigns registers temporarily.

(We had a longjmp on POWER for a while that corrupted the stack pointer
temporarily, and that was visible only upon signal delivery, not regular
context switch.)

> For example, there is a CPU-stride variant of the reset operation.  I
> dabble with this operation to cache a TLS that is global-dynamic into a
> per-cpu cache.  Thus, making a TLS global-dynamic access as fast as a
> TLS initial-exec.

I don't think this can work?  The problem with global-dynamic TLS is
that it can't be a single memory block (it may have to grow).  Even
if the access path changes, we can't relocate the memory because
TLS objects must live in the linear address space.

We can do away with the current complicated scheme in glibc and use an
array of arrays, where the inner arrays follow an exponential growth
policy (for size and alignment).  That would still have dependent loads,
but would be quite a bit faster than our current global-dynamic scheme.

  New TLS allocator for glibc
  <https://conf.gnu-tools-cauldron.org/opo25/talk/LQTU3G/>

(Sadly still not implemented.)

Thanks,
Florian

