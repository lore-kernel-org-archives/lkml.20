Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA7E48F02F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057067; cv=none; b=tv57Puxy+PUZ7isz9jCim5FENx/dccTTKpXmW3J3qM8WwLsKXvb0X5duLD2LfMdqf9TvXX2dMUYDJ5V2P1Xnn2I/rBIFlXUxHErBILv2asgRaXQzj/c1ncULnE+psNhtbtmCwwI8ret1eyvlzwE26OU8WKGRgvTZDX1OqYqzt2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057067; c=relaxed/simple;
	bh=ElBhcqsUM2Ad9S8ZEGyEN9t/tY74rVMwa0Q7cwzZwxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYkfQmvDfldxguSAGcALpuWDACxOBP0eKJ7Eixa1bqtfvAcb3FJHH12eN8DRMXgHi5pskqNWyCY8Rs+sKm3RECPU3rghqOtI4gaGRn7SqImf3ZO+s0jNL2DUIM7twKGtH9qN2KL3yhIRO0zWyS7NHc80btF5I746M2cs6848Pm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOUlU9aP; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOUlU9aP"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so25380325e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790057064; x=1790661864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZ4t+Je/NuLiMzspe4ek1fsrc4XzG00tppqvK5+4Vd4=;
        b=cOUlU9aPDElGa3P8qm8wIjdeSU1gtl4mttHu2+TmctwN1+nWAI+Oo39N0H6jU9/J/T
         jqJDVEtkYbKjUClvhJJrcdx2B47ZFULZ40TCWw+46wygywHKHXgPdkFV0ykdLSfowyno
         PAQRq+Z4YvmvI0hIwKgoM2VNWAeZuWpv7/9HXhPvWZC2mC4VqQSYR53BV7kmhGu3nKln
         UmXQjPUAfiZax8mpmraWbmNs8NryCIJuiuoG6CraO3bD9a0K6LIsl8Q4M/u7Nt9GeNbI
         /ppGrULftKvqw/Q0rLiecsZEyj30/NE4itnhHvQ/nncP9Jj2SXR69P9wIPR+Fb4wh3H1
         PEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057064; x=1790661864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZ4t+Je/NuLiMzspe4ek1fsrc4XzG00tppqvK5+4Vd4=;
        b=Z/GN/ip8JjM+Nj9MrXKGVN4fsSQYKzepVPuk1QJFHAbyr4wGKzMo3WlSSMccTksrKm
         +81GPEoVQmSvmT7oe8Z+X1ru/2cj3tCXqA0FNJ0kb+7Zq12wyKAMi6N9clg3Tzw+Ve1j
         rsSLF5jKUebIRVstmTB9MP7NtY7pgsRSgpBlys0qjlFw3TurnzVQ44m5fF1lzXwHQQLe
         6c9eKRNv8cpLWEPBfz10vAJtI7OusRddaAWkUHwisG2RysSS01Mx4PeZHtBcdJS8yDSj
         jiZK1IfpFebV3/zKC92wXcR5wF5cDbW95k98DEVekBBHv8kbQDmHVpVVmyo/+xL3xMOe
         8bxg==
X-Forwarded-Encrypted: i=1; AKwUvBznozvRqqz4k4ZV7G437sALbvHv0yLqtRR09/XwTRg+VHX6n6KNPZCLFGAmQbDZNWBlmZENpbyHWYox9U8=@vger.kernel.org
X-Gm-Message-State: AFuF++mb1NZqzapYjeRR5fc3kFlOLMPu0M5q0PLca/Mk9yGsE+EOYuHA
	TL9MjfalvkOJ7ZKg+mEHoIMU9spAYtExuTarkfsKoEJ9SpONXycJ9H5gxYOjLirj
X-Gm-Gg: AYBFou2ey8Bdd5H+4K4WQKIf7s0S8AWAzf5oQyKreNJSk0xRjxT9BIM6HmxxY4RL582
	S7/p5qKqP1MUN2vZhmvyy68I+JMwxmob+Vuz6JBUPaUGHHFs7ifeUnkn3gKYYfI50XHnOZ/uhOJ
	XL1me7s94P8usz42kPKwGluRZeJU7v9gkhyw4rzAGGpCHSoT6fmQHONRwaIFRA12uGE5Z/zEwfU
	vttIdviq7WbqQdJ0hiJdEbVtetwdC2ZUfwicrT/UR1en4FQwchrkxhldPnc8njPz9lTteeepxR3
	eDJLAeVzKNnMx7u0/rG3em7CyJq1aVHAxBgjFQLDcf6ODqRSuC/ZfvYWy9n89PV+29NfbneLEe5
	lgkJ624q7gdwcF6g4E6BA+T0H+54WtRXQi8zlVGHFXX2i8sJK1XyGEEQekGdHdPfhTbI7hGTvKq
	fG+ciVLGte+My2up9tB1yJxP1L95EfQMR7RuBnYZsfaH2tA2Zs3mYwEPKETkkccIFl84MclruHQ
	B+AefYIqWn5xroVTEWc+BfYYwbRp+vm3O1HXhNSDWnX7y+vK6QamD5SnlxvjcDXaKLu8VUjzwz/
	xJ6in4qAp2cOBuJ2r9tJt7lfWo9IbNRwLDFnHXJrUOSbv11iLsVRXNbFFZmyUyPysQ9Jq55YKg=
	=
X-Received: by 2002:a05:600c:474e:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fc5743c69mr172251345e9.29.1790057063419;
        Mon, 21 Sep 2026 23:04:23 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a5e6-3401-ecdc-1e24-2e52-02d6.310.pool.telefonica.de. [2a02:3100:a5e6:3401:ecdc:1e24:2e52:2d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862793792sm2769226f8f.31.2026.09.21.23.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:04:22 -0700 (PDT)
Date: Tue, 22 Sep 2026 08:04:21 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Hao Li <hao.li@linux.dev>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Amery Hung <ameryhung@gmail.com>, Swaraj Gaikwad <swarajgaikwad1925@gmail.com>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: restrict can_spin_trylock() to preemptible
 context on PREEMPT_RT
Message-ID: <arIY0wMQjCCsqidI@gmail.com>
References: <20260919171443.90512-1-kmehltretter@gmail.com>
 <DLJHZEZMLW0F.27OPPS218CX9Q@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLJHZEZMLW0F.27OPPS218CX9Q@gmail.com>

On Sat, Sep 19, 2026 at 06:17:30PM +0100, Alexei Starovoitov wrote:
> 6.19 had this check in kmalloc_nolock() only. alloc_pages_nolock() and
> free_pages_nolock() allowed irqs disabled since they were introduced,
> and arena was sleepable only under a mutex back then.

Hi Alexei,

Thanks for the review!

> No. This kills bpf arena on RT.

I have now confirmed by testing that the RFC breaks both BPF arena paths
on PREEMPT_RT.

> As Sebastian said in
> https://lore.kernel.org/r/20260831143500.x-saxdAs@linutronix.de
> raw_spinlock_t is fine in general. pi_lock is special. rq lock too,
> I think, since rt_spin_unlock() can end up in try_to_wake_up().
> The check has to be about those and not about every irq/preempt
> disabled section.

This leaves me unsure where the boundary between the MM and BPF fixes
should be. I see four possible directions:

a) Change MM so _nolock() allocation remains safe and can still succeed
   while pi_lock or an rq lock is held. Existing BPF behavior would
   remain unchanged. Is this feasible, or would it require substantial
   allocator changes?

b) Restore BPF local storage's dedicated allocator, and document, with
   debug checks if possible, that _nolock() must not be used in those
   scheduler-lock contexts. Since the allocator change would restore
   the behavior before f484f4a3e058 and be confined to BPF, could this
   also be suitable for stable kernels?

c) Have MM detect those contexts and return NULL. This prevents the
   deadlock while preserving ordinary raw-lock callers such as arena,
   but task-storage creation from scheduler tracepoints then fails
   deterministically.

d) Combine (b) and (c) restore BPF functionality first, then add
   the MM restriction for other and future callers.

Are these the right alternatives? In particular, what behavior is
intended from the _nolock() API in these scheduler-lock contexts?

Thanks,
Karl
