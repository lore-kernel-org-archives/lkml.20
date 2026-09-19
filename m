Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9975522F767
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837615; cv=none; b=SLF1bx+xVig2WAj+OG7xZyK4wL46kGt/uuKuB4rs72QCAegum5qfHB5oECVt6ksKr9FnF68TZrXtwxvvbLT3TjZbAVphhhi2fYAH8/8k36U89j2vbhC+xwOwXLjo0T5NCdkj/QZqJIu8nlEZyukH83Y8wAG/oFOWkpjzzlJWDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837615; c=relaxed/simple;
	bh=u36MjiEqXs39fNOYa7M2eitiO4tZva/VUMm3woA92yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWvLlaEPk1+jQzX3NZVfM6qoFls3wLrvC2qUlBGvg7t3QzlAUI++P9Pr9gOBlXRCYmq+2PNlpN7SngqNa73sr7C3TmJxekcwGre2H+wH06+Uf37p4KIxgWNTkks09ts+32w5vJIBVAXWCZDsrw9U1UZSYfAtjfroO0lH3bNSqus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eFm0qGot; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eFm0qGot"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso3040958e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789837610; x=1790442410; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4EVCCJGMVi/Jgl5olIITsEJ4O030sdS93t+4GDKvrY=;
        b=eFm0qGotWc1FLCi+mlEvspx3dvaYCv/fBLgKJnL1XlV8/OxKbLF5rKRaawhubqm4cV
         xaW5MMjYDe2PLKw+7ElMG5/18vHTutUzhvPomexwl0FOUNH6RWZz0GFd+qvLh1x6bWsR
         EnHPP90w309hq2JvOhMgc4av180XdBJERflKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789837610; x=1790442410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R4EVCCJGMVi/Jgl5olIITsEJ4O030sdS93t+4GDKvrY=;
        b=QDMyUkoWvhEM+wofjxZJ5Lih8UTLp0G94917g2i6KxIqgYVCZVBupkwJE5fRQUk/2H
         5gMcCUKuJ4iMVCSy56/XiMqnYcItDIVMSvYhpyVcWepJE7Idhsvtkikt6ruPyzaQl7Sn
         f7bd6R9xEYnKz3KaWPja/i5IOmN6zgOXLfGvum/AQXyDTp6jMpw79sq8Utj4OVVAoq9x
         sL/wHQEjZkHphFSY+eTltrlqk74soDVPHjunvcElAaMeVbckyBPmx3d2TQepr1517Djq
         QGHfg6nsmL5c9TrTldla5MaIhmEETXVJdOcyNx8xrlQEz1MMdICoLMjJB8odPYC0xKQB
         5K0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvt9iikXyttsthE71I29TO6AtLrjU0tB9aWZl4I7kGWK7WkXrPGg4ZOyui9/XO9Nr9EK3cascrUwpoeWM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCUVrvCAPFbdlnUc5pJFuCaoLsa9kwxKJrBCrCOz7UK53TaKgn
	Vm4uiyadw3AqhmCJukv1/pyo3Un9N8z0oe0/hxQU7MEcg7tutXiPK2d9TlWuM/3jgT7yXcbqoEL
	lBUxluDjuEA==
X-Gm-Gg: AYBFou1/FaokImWZvWp/LKvQGDEnHiFqWiWX03Vr1gACOgExWFIW8DxL1xq6/T25/ms
	eOT5Zz/7v/qfr4y1V/zAWZU6tkyNG8Phlp429/FVPstv4urCbDpbVDa6d4nLEIBrhZg2gVhBIWB
	viq0JG0uM4TI72HDmUe26lyOGve/DT3PaZ4X3xPqAju+I9h42qDOWTz42HOMIMDiufrMrkfq1OU
	RYWnkli4GX50BYvT4rpTLNCTTiWr4aoqyd5Dft8EOxN4eM9Lfrg6Zx/jmG79IKt1w2IPUKXFlgA
	fdzgH9gy+Up4k9I7vQops7DPx+lDwkj/tsP+U1lHuX/v+uAPvh4jqVxp45oAZD/BmouJKjLi6pd
	UvOfYVLopPqR7zgjQNRgA4afGs0YP5l/aUaGgZ6zX1AkF2rEtRbd0QKEGs8vdbe6EOsHK5lox4W
	fion7nX978qvbi/YNCINmVHj6vEKW9ecZXX6y2tpzYDTBFpG/bsbEKagfOpEAv+rYTke6Ls0F6U
	n++SD87dwc9s0uQ+oNSVXSjH3YwM6hBKf2Lf4g8CiSpKOMaK5c=
X-Received: by 2002:a05:6512:3b24:b0:5b6:183c:5c95 with SMTP id 2adb3069b0e04-5b8c18598damr2000189e87.51.1789837610306;
        Sat, 19 Sep 2026 10:06:50 -0700 (PDT)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com. [74.125.229.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c796f20csm678616e87.83.2026.09.19.10.06.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 10:06:50 -0700 (PDT)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso3040940e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:06:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWcRJ7FzyzKbxqm4tt2ASDjbpGpunQWCChsF+X2RFZu/9HQ0uiXVZZuJuczYvHG8q0GqDLEao28yvEj0o=@vger.kernel.org
X-Received: by 2002:a17:907:3f17:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c2a15b4bca3mr522411266b.33.1789837224119; Sat, 19 Sep 2026
 10:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9669b34-12c2-4cf2-a887-315f581f0789@paulmck-laptop>
 <20260919000056.3132131-1-paulmck@kernel.org> <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
 <6B1FC39D-6EB0-433A-8E49-E5EFC9379AD7@mainlining.org>
In-Reply-To: <6B1FC39D-6EB0-433A-8E49-E5EFC9379AD7@mainlining.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2026 10:00:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjyniJy-CX1muCrsZp-i-sLGRYeRYEPN7sw9orRZUCwag@mail.gmail.com>
X-Gm-Features: AcwNN1WCbh_CXATf-FMT8x_ZS8yd9pmRtrkzEOhM9i8GXxqTrntEHha57Im_sMA
Message-ID: <CAHk-=wjyniJy-CX1muCrsZp-i-sLGRYeRYEPN7sw9orRZUCwag@mail.gmail.com>
Subject: Re: [PATCH 01/28] hazptr: Implement Hazard Pointers
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Boqun Feng <boqun@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, lkmm@lists.linux.dev, 
	Zqiang <qiang.zhang@linux.dev>, Wang Lian <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Sept 2026 at 09:35, Bradley Morgan <brads@mainlining.org> wrote:
>
> I think hazard pointers are good, what test do YOU suggest we do here?

I want to see a single real-world example of "look, this speeds this
real load up by 10%, and the kernel code was actually cleaned up in
the process because hazard pointers are great".

Not a microbenchmark that tests just the hazard pointers themselves,
but a real kernel feature that has been converted to hazard pointers,
and in the process actually shows improvement.

The ONLY reason for hazard pointers to ever be merged is if they
actually buy us something real.

So I want to see that 'real" thing.

I want to see how easy/hard it is to actually convert a real current
user, and I want to see how it actually results in measurable
improvements in performance.

Something *core*. Something that everybody uses. Because I'm not in
the least interested in a new subtle feature that interacts with the
scheduler and is only used for some random driver or (to pick the only
example I have ever seen) AppArmor.

Now, obviously, the thing that would impress me is something like the
dcache. If *that* can be converted, and it shows real improvements on
some real benchmark, then I'm sold.

Now, I don't really expect that kind of major test-case, but I do
expect *something* meaningful. Not a driver. Not a test module. Real
code.

IOW: "Show me the money".

Because the kernel is *not* some kind of acadmic project. Never has been.

I simply don't want to merge something that is touted as an
alterantive to RCU - which we obviously depend on very very heavily -
without something *major* that actually uses it and shows the
real-world advantages.

The discussion about hazard pointers in the kernel has been around for
a few years by now. If there isn't some real core feature that was
converted to show that, then I think that's already a failure
indication.

I'm hoping that those patches and numbers already exist, and I just
haven't seen them.

                  Linus
