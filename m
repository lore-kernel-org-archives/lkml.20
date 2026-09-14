Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71474457E46
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391319; cv=none; b=OU0APh9nyzypYcmMe/GrVc9H0HEnt4t5rSUWNIVP0qJGNUWeERmD6y/OTN8dto17TUXAx+9fnmzS7an0knSQUdXGL30awwgaQu2pylFsh+P+WmU/+VGYsCyb8jshSmLwEgz4JguNN1+ti1YPICCY3bXkz6/rm1xEn82Bxj3f4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391319; c=relaxed/simple;
	bh=AhyArlsdJFxWR5l5eQx1dxwpUh6a0v841RKBjmC/iWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvdkcELt9wozB7i6qE2S8QX/ew0mQMQpdv2tdHeyZTUIXnYu5Ud8pko6PyvxLaZeQQOCOSQQgdA7+PiUWsltdkL605QaVFkQvwgNvB6c8bPaVWZMAEJsKL52uh2uBPJn6HR5hi/R5PxHdB08glf5yC8uFcRB0/upcmIpyuP5jWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADj0yPB9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADj0yPB9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso18559835e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391316; x=1789996116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM4Dg8T4wQ80edoAcdxcHGiEKOKi0zWb3doBvunGEGI=;
        b=ADj0yPB99xRIODUJxK6pCbR2gWeu5XBxIsNe4TQ5OMioa5blKleMam10/I1qQ3h0kn
         5f/mIU42dmJDt8xoGv7EX5MH17Jad8/2uB086hwPpUl+Fr34MCVGK89inatBGK9/PPMP
         j+DdEEZByoqIciONS1pIbH9Vja+Tb5jmT+RazYENuvCo8mK0w5A22bYZWKfxp0Zseswf
         WxOhgTFZwa+RjnTlHLkETVbwgiAiZP1Vvta8b5iq+sOesx3zHWop7yqFp8FiEwCxKN3e
         cfbWs/XwWdted91F4MnxzbJO/vWkr2x66MTJGmIlNVTZTvISkecKkw1GTBK8aVievVe4
         2UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391316; x=1789996116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM4Dg8T4wQ80edoAcdxcHGiEKOKi0zWb3doBvunGEGI=;
        b=fCCDD/k2QLhpHHjFBbUQerUDTUva4V+0guLm/Jnd7wKv5Apgrah8mXilbHK94tunP8
         jL1zXyCDqbkrPGOV1vHCaluheQN2TZT0tffA1nr5l2rcjQ9dVGgaV+f2OkL8e2QfI6kj
         npKjzTaRfo9yJ+gKryf6dZhdgnYNlVKNJICrfww1GUFkVNGnA4bFVVTnuAkFRhAJaUOG
         eRiZoPVUdkEDv4HTNZ2wg+CIbgOLGlQaI7V8WvtZw1U3uLnrhiSxREaflY++9EGHcN8i
         ejdYk/XFfOHGIw9HzfRjE139kQ4UoSyff6nmQTtfYvu7MaPXcaCXHIUpPabzHvIYObDL
         zuhw==
X-Forwarded-Encrypted: i=1; AKwUvByx3/3dnrtijaBKyLkrG2CB5iHAYdQlmjKTRQ8wmO7X0I2TO+ZXP7SV35kF7QaN5BvS1NW5rv+87RhMWts=@vger.kernel.org
X-Gm-Message-State: AFuF++nMuZEUc/7BxpAQTlHx9F14i9gem+Yi4aEfginHL+YDP2R/g9mX
	JeFAQsREikx50kRR2wRacNRcnaKkcS4CSd/GL6s9rUTiQSCCA3F2xzqN
X-Gm-Gg: AYBFou34x+AR+4fnt0wubciNxosg6KuJPeIabydvOQJi+Q+A55mwSigQ9/tjv2tIyfE
	CAP6lUEGycjRdFNeB2DeL3ehYYAaxhbrF0xzY0hciuV6Upmuad3ryAXkM/s26xcUwoCS0nKOb8t
	a/TCyIjKR82C/9/EmDjT4oijSat7cn09rnpWgHq5tRAYYvS6WaOvjmT0Mma+VAoc3Ecdtt9MZnY
	+vReVD3lOgntj2VQB2Set/2PtNl5lFsgYz6DsFYeRKczO/RJkuZB1KAXo185NhppnBSyU1l17yE
	IFP+tHD0QuO943IZgcHZubsVKUZCHI1o8yJDgdKnNB70TfuqNCJJSDmtDR+Q9NxRJEsZFKCFsjt
	BrwhEnk0uICvPSS30iFSPwrIldUH0XpXrGvKD9yYp7UPMUwB8Uw23KxQLGVQz4eCNxlu4/KfC3N
	HBzkDKBBqcDRrodHHLo4N64gXxQhdDhFVHqyIqX51bHtXFteFbnqBDAxtO/h5XPZACrYWY5tgC2
	pf4dzmZIJzIedk/zQzP3xqGEdSXRVnsdpXD
X-Received: by 2002:a05:600c:3585:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49e7a669264mr36467535e9.9.1789391315444;
        Mon, 14 Sep 2026 06:08:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm26999720f8f.2.2026.09.14.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:08:35 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:08:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260914140832.676eb1ad@pumpkin>
In-Reply-To: <20260914120352.GE3500130@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<20260907084133.3696-4-david.laight.linux@gmail.com>
	<20260914120352.GE3500130@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 14:03:52 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:
> 
> > -	for (;;) {
> > -		/*
> > -		 * cpu_relax() below implies a compiler barrier which would
> > -		 * prevent this comparison being optimized away.
> > -		 */
> > +	for (;; prev = READ_ONCE(node->prev)) {
> > +		if (!prev)
> > +			/* Lock acquired */
> > +			return true;  
> 
> This lacks {}, but also, is not ACQUIRE like the return you remove
> below. Did you want smp_acquire__after_ctrl_dep() in there?

I need to get my head around the acquire/release logic.
I think the READ_ONCE() in the for(;;) needs to be an acquire
(matching the smp_cond_load - which seems to have been wrong for ages).
I may have decided that because the smp_cond_load was relaxed this
read could be as well.
(They both need to be the same.)

> 
> > +
> > +		prev_ptr = decode_cpu(prev);
> > +
> >  		if (data_race(prev_ptr->next) == node &&

I'm also going to remove that 'optimisation' check.
It is there to avoid the atomic below - but it only fails under
race conditions.

David

> >  		    cmpxchg(&prev_ptr->next, node, NULL) == node)
> >  			break;
> >  
> >  		/*
> > -		 * We can only fail the cmpxchg() racing against an unlock(),
> > -		 * in which case we should observe @node->locked becoming
> > -		 * true.
> > +		 * 'prev' must have unlinked (or be in the process of unlinking)
> > +		 * itself from the list.
> >  		 */
> > -		if (smp_load_acquire(&node->locked))
> > -			return true;  
> 
> This is an ACQUIRE.
> 
> >  
> >  		cpu_relax();
> > -
> > -		/*
> > -		 * Or we race against a concurrent unqueue()'s step-B, in which
> > -		 * case its step-C will write us a new @node->prev pointer.
> > -		 */
> > -		prev = READ_ONCE(node->prev);
> > -		prev_ptr = decode_cpu(prev);
> >  	}  

