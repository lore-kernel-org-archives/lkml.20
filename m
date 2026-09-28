Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52801296BB5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790568081; cv=none; b=b+yUnFOC+LeB2DEwrlj9B7BGQM38AJjXuatYLdku61QmmGu14cx3g7xKjJ6pELbsmhaujekLJWZf36ZIe4uyTYfSTCpz65mNt9OwL8++NupAdfbxJ31tsLYggyEdkzgHr1Rrx5RWy4k+3WM611Wwq2+wrJ2wRTDJdBvudOfDJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790568081; c=relaxed/simple;
	bh=t9lIO9jPx9tLmu+3pl0BVzaBqs5H27Fqt4Y7zpeZREA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXaRt3vEnYwm3e4TdyMlISl6/LvSV6nOSM5RkBQqmebkb8Fl52xs3uNIw5n2tOL0YUne/+cO4Y8SHz7dZbrIr0NjM0n5KFgjLT4GSWyhDDLQGNz9S8RqL3sHjaM1Iyx/OfncV4Z3cQRxheSigIOeGxrD12cgkrZHlZovjLTeMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tvib9L42; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tvib9L42"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so20631285e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790568078; x=1791172878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mE2lXRZQl+Z+cNHB67MitfJivylbeFjdASOukrkrveg=;
        b=Tvib9L42FTz4Gor5wmw9ZvL5nnPiSFS4foLHw4+ejKdBd3FAYwLX4LynT1T9HnlFPF
         D9nQIGT41s0OhiQm/sdfWVVJYY7yw9G0BARtHXoTqrjXIfNn9PWEBDXmgJL8r6DgaZJt
         VL2zmg20x2afqP0KrGcSgjj4vMgExYPMhvUN/HTQpapkoB1bbQfrhQ2h6Ly/IODODVKv
         jW09uB826PNbs7VrniPi8XLY04Rn11o052eDYOluSiqpepiOU06ASXyabc3hZg44pWPZ
         XraTvPCT/ciu+aPmwF86Ws2HUenkiunhNCUjZhwY6qjhbZaS0BwQs3HCqd8AxmGHh9Zz
         FwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790568078; x=1791172878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mE2lXRZQl+Z+cNHB67MitfJivylbeFjdASOukrkrveg=;
        b=PzXQhEXQikdXs6K7G6luMy6Au6pd5inK2uPxlRJgL+rJeLPxuCR7u0hUCGNqeF+7az
         zV454yVAterH4NCzHII8olOgLyBNdwrn3zAeS85TVFqdUKuf98CSB58c+D+p1qkFsj72
         srmO+ntMqsx/28DnA++VNZz2cXh0n5HnBRa9ReO+2zvBZiIuJyIH8fKLIQ5wv/Rfj4wW
         blFNyG28COFcQbkcYZ7mLZGXsv1An1U2T76uc650URGHGFqqp8xVRWPA3U+LH0Y0fMj0
         /tEEAi1p0gEqZGlioeciXyRdP5zqvHznXnfIesHyO3ni8XmUqHyQSAsTvyY5zj74rPoZ
         rRfw==
X-Forwarded-Encrypted: i=1; AKwUvBx/FBPALo6hftKKoLuZ3pe8PcSmNBtbbCN8rrFj6oJlLIJ5SswekpOhzNAaJFxcZOGnqkQInRH8MSMr8jI=@vger.kernel.org
X-Gm-Message-State: AFuF++ln1xsZk0VOqzmsLiCoGcttEGaWCmE9k7CDzEAYFKOp6mmGeGy6
	krKJGnuZ/kxsqGVDNttXvTTE8rcnQnStifD6q2Q7dIj8IomVKhvXBCO4K7fMdA==
X-Gm-Gg: AYBFou1qPvy0deYQqi8N+oUjbCqI0y94nLjUo6cbcJ4J9lfe6wFuggEVRqObZ+YKZHc
	jGRONTexYl0UxeSOR2uUd5Ws6iJOg9msy2UQVsnMvA6boFQAoRroTkauApcBGf7vqwNFAHf2au8
	q/lWGkVKE1lOk/3LE5ioiqPTq64he4x3/xwvIzZ8rX1CSxrz+XbRUOInlD1X3tWuPy60dO0HGTd
	RTdBZA2JCjNpQ6P7sy6mUfsmyTUgcYSwjhpO2n7nzgUHQnc5MvBqH8ylTej+e/nN71X7bSfibB2
	HN35Qh+B8ancDatrf/M86/OUSxRQdazww9ouKO0BcvTlGDivIWzni6f4/3xx/zAj026hwJSA7+k
	tK747gLTVxxRqFk3uWKMO24HVRPPHavpGKJ5vNaFjmTskP7MVVL1x0eBnzZY277ONTs4PHrTCL3
	ZqdB27A6U5vZop3EiZRsE7ZqHvE7WyTm5YaIVAWE7wFvyvqRvm58wd7AnIeo2+sCDgYvp8aR3Xz
	j/tyrLIrS1dU+vqU8nRduIx4nQKLUcmrM0ORgiQVBVRIb2upEbXrS0APC1cR4gsgYbmwGKuMekq
	YwiVkQ6LzNPOZjPeAjMgAliIaDo7KKhjna9ND++0ouwXf6PIbGVXMH8UmF4oIs0VKPIAg5s9wYp
	Vgfc=
X-Received: by 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr193825975e9.20.1790568078324;
        Sun, 27 Sep 2026 21:01:18 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm26778794f8f.20.2026.09.27.21.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:01:17 -0700 (PDT)
Date: Mon, 28 Sep 2026 06:01:15 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hrtimer: Use the mask to clear TIF_HRTIMER_REARM from
 the exit work
Message-ID: <arnmPC3_rbXgy48W@gmail.com>
References: <20260919144027.70250-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919144027.70250-1-kmehltretter@gmail.com>

On Sat, Sep 19, 2026 at 04:40:27PM +0100, Karl Mehltretter wrote:
> TIF_HRTIMER_REARM is the bit number (12), not the mask. That clears
> TIF_NOTIFY_SIGNAL (bit 2) and TIF_MEMDIE (bit 3) from the copy and
> leaves bit 12 set.
> 
> So the function never returns true, and the copy handed to
> exit_to_user_mode_loop() lacks TIF_NOTIFY_SIGNAL. If that was the only
> work for the loop, the task returns to user space with the task work
> still pending. hrtimer_interrupt() sets TIF_HRTIMER_REARM every time,
> so the next tick repeats that. Task work queued with TWA_SIGNAL from a
> hrtimer callback stays pending until the task does a syscall, takes an
> interrupt without deferred rearm or has to reschedule.
> 
> A task which polls the io_uring completion ring in user space sees a
> timeout completion after 30ms (median) instead of 70us. 2 CPU QEMU
> guest, HZ=1000.
> 
> Use the mask.

The patch also fixes longer delays I found with NO_HZ_FULL.

Same 2-CPU x86-64 QEMU guest, nohz_full=1 rcu_nocbs=1, polling on
CPU 1. For 6,000 3 ms timeouts per kernel across three boots:

             More than 50 ms late    Worst delay
  Unpatched       239 (4%)             991 ms
  Patched           0                  5.7 ms

Most callbacks run on the housekeeping CPU and avoid the bug. A
traced local expiry was followed by a 737 ms gap until a
call-function IPI.

Thanks,
Karl
