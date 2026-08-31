Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139649EC40
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186161; cv=none; b=c/8V8UHVa2kH0WJrvqI6Zs8SZGcY2L1lFjAv/M7Baw7UBb4zghiF+ibKP+nnhlASJivcXPfbXgN8rRqbE5D053iNNiTUjN4HMao89H0SiR+JwHQqH7pg/7dOdX6j+Mjp0YF+BDaYg01KURk0obDNKxwzgXxYbMhlRsandIgux0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186161; c=relaxed/simple;
	bh=ssy/+J48udsvb8s5cNNtStK7Eh2FqnexA8kGVzmIffA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvB3YouTwvjqTnS15bg0SpwDrBls9MappZ/cA0F9sao+v3g3QP9UJ0dDwXW1667eOeUlCdKSa9ezoAIrpWHyq+YLbYnGB2nmIXzS5arBgGmaJUiIrjkdofFJHjTRFeIgEYqJvTSzKBr5NrIj8NE/jclV37iH8TK4dfMKCsYLdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W4++9lNm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W4++9lNm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so26292775e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788186158; x=1788790958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tISTQ9tiSmJaPWdMAEbXQLoa5N7JlHWWmdz6lYTqvQ=;
        b=W4++9lNmY7OAvvJjC93HMwoh6is4Hz+LWZJJXR6qpAPqNmWj3nfAN1NhLLSYc+/73L
         GpuNNsTB0ZZFpYB8fU8LBrNR2TLc2UPX3WnJLyxqpHgc51bx1sbHDqw4SsNvohSkldvZ
         MC9fUpMkCj+Pj+uKbQpzVyM4m4PX9k+BpNGEMSMfNT+kuu6nmCXG+0YU+noT9rMYvRAn
         QRmeityfgN/mO0xpp9eHKJUfGwSjIBZA12a4ZRwjT6ainhFq+FrSSnY/EbwTJogA6jWC
         LYPeZHeTxxE/f0AAzZjWkzJUgOdGh6W6XnL88HanJNu6cdEBUBpUh6gPo9/H6nmXchJc
         ZcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186158; x=1788790958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tISTQ9tiSmJaPWdMAEbXQLoa5N7JlHWWmdz6lYTqvQ=;
        b=s2vmArxoOBlQMRUA6ImYB0sw64kXFYt+2gTETjy4D7qWLmn89V2+DKKQaPd0lLSi+C
         1i/NUzI6H0zs+DX4cttgpVdzP2KuxHw7g4R9hEkvq6CIe51JqhgBhNEI0C/2h6bjlNtD
         gEmTa3YpX6u2tLv+BQVTKdVsE9Dm0a44J3XMEl9g5tCT6T2X6gj9XOqToAoz95h0SMx+
         u0w/RKI0axOdOnVollmG1GL8TuEqB17RYxTKQbrHQ+g4k7gxZ9r3oCNgoVf4e3eUzjXz
         YW79lnD/z+95CKaxTAXZ+328ayNWvJxEQSYSL2TWzNvExqot+1HOF0a5Xztjcatu0Zoa
         QwFg==
X-Gm-Message-State: AFuF++kbPflFN+jsYrSQ9NSLskdu8E2Z9/Xi6yUJQ/BzOPqMIs7Bf2Jf
	mHeYf5A0y2sCQSY+/KdquQg/sAsM/CrfJ7VY8D3z42yysr/3CjGKhdhpiY2mPJ4hOm4=
X-Gm-Gg: AR+sD10rl2z2jR1lJHWBCB94Wmfn4dhUSvo+TmFYcMFqv0DcTh+VLTFoG42rIgdEzkW
	zxYPP3wEPBp9WeIZ3xo95EfNsKeqpOXAhs4mvtwWaLcWjylCdOo4p60P1yIPLHJuDo2Q0q6U2v5
	mipWUzJ+goH1xFbRBtD1skVo9HbisebGmTMnG33iJ7tx0R7kMQH8WcZuDN5s9QigkuvNG28mP5D
	hyGFrWlwf/RCgZZGomsD8AwLJsaFDvGm7YuaOl0tr1602M/7dsVN+Tb3KOoqLLHBozQPdz5qUMf
	UKVycVrlmai/xYrOlCgeEYOahhnZBYPfHrEVz5yTvQq5VVuBGZ+O2Hz48bgrBtGVqrLIJl7KdfC
	pYQyRHjm/nBWi5TbWmMeCb/BvmrykHAy8c7vr93BfhmkivlmKHQyy27JRxFqo0pMyn3BUA7zwtQ
	ziMC7i4WUZEWAv+sh97gEv8xM1QOdLb9e9ZfLdX9PANXt9lDEX0Oceo+DmB4jbaQ==
X-Received: by 2002:a05:600c:6091:b0:49c:d60c:74e0 with SMTP id 5b1f17b1804b1-49cdc44a420mr20771505e9.13.1788186158256;
        Mon, 31 Aug 2026 07:22:38 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm619531775e9.2.2026.08.31.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:22:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:22:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH v2 1/2] vsprintf: Don't leak pointers for %ps without
 KALLSYMS enabled
Message-ID: <apWOKw7uqM_4R-C3@pathway.suse.cz>
References: <20260821152614.2202196-1-bigeasy@linutronix.de>
 <20260821152614.2202196-2-bigeasy@linutronix.de>
 <ao8MnDuF9nnI9KxG@pathway.suse.cz>
 <20260827091407.yUpoFiuF@linutronix.de>
 <apAIhJImGHCCPEH-@pathway.suse.cz>
 <20260831133021.PtgflU-O@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831133021.PtgflU-O@linutronix.de>

On Mon 2026-08-31 15:30:21, Sebastian Andrzej Siewior wrote:
> On 2026-08-27 11:51:00 [+0200], Petr Mladek wrote:
> > 
> > I think that it is a matter of taste. I could understand that
> > "(unknown)" might look more obvious to some people.
> > 
> > I would still prefer the hashed pointer. It make it consistent with
> > %p handling. Both print addresses in this case.
> 
> For %p expect a pointer, for %pS you expect a name.
> 
> > The motivation for the hash in %p is that it is slightly more useful
> > than a static string, e.g. "(address)" or "(pointer)". The hash allows
> > to match the same addresses. It is not 100% reliable but better
> > than nothing.
> 
> but is this helpful?
> 
> > Also the hash makes it more obvious the connection with "no_hash_pointer"
> > option.
> 
> Assuming you know about the no_hash_pointer. And then you get a
> randomized pointer. Enabling kallsym would be a _bigger_ help than
> rebooting with no_hash_pointer.
> 
> > IMHO, the only drawback is that people might confuse the hash with
> > a real value. But it is easier on 64-bit systems because the higher
> > 32-bits are zeros.
> 
> That, too. Do you continue to insist on this hashed pointer output here?

I do not insist on it. IMHO, this does not have a good solution.
I wish we got feedback from more people.

Let's give it few more days. The merge window has just ended.
People might have more time to go through pending mails.

Best Regards,
Petr
