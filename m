Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508410;
	b=aZhh4Dla/MH4KL/rXTMxFyXp7xFDmWrDx9x4qkKbZkgrp5kUXaqxroCRcYHFRPR5K/VE
	 789XfWKpCMBaKFsC0fKz8UKqN2MIwAj8xF8v1DZCP9HTDvENOZ6tsu8CmiH0UKUZ2KC6y
	 LJvhC+0CcNlTAhfr6TNr/aXGOZJFt4GRDCDVJ6baUH3H9N+ezbQOaNQEMnuRf/o8y2IFw
	 1jJlkADwfbzSkWW+5cr5BLlXCS8EviiGm1KUpN9nqZ87wn171D7MWXo/0NMhH/1ADYDbo
	 27DjDvK5NxIEP+h/z9zPYc5rluRuLJjl474GXMLOjldKqaBykTVGTF+7nrM/yb80XUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FmhP9MeZo5Es0js2kSt8GfipastboIXrtB3uKJCSmzY=;
	b=kMj8SkEn0dhoVMQKOfp0Bor7asKz5P+0PNye58ZG1isfI2uPHTINKJWBvFpk+hQGngeC
	 gm3jF5e9133DC9POVyEiTk9zoLPbEcLKCVStWXjmpyhusJ5l7bcJp5Z/yVYrPS25i72ao
	 sTTsATRrL6F/8inMhBGxXtbmDSTRaa3oWSpqHE6jDfwvRJIdeyTcsXmEjvzd4wd0yd3/S
	 9H07DWFxZlKF6GLwdMRspCXECXglOGCnJR1OQ4f3kEIMfkRQLFteaFJPvaKjw3v0gK65l
	 oYCXZPVM2qARoBxKN6noNNftWvHENCuJvQ8yGgn1hF+EWi949TZ4VujxM+S/Dd3lxrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMeS2P1h;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2009606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2009606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMeS2P1h
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso29107a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794508408; x=1795113208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmhP9MeZo5Es0js2kSt8GfipastboIXrtB3uKJCSmzY=;
        b=WMeS2P1hZnTnffr1aH08d83wzDWTn8SllmQoVjBf3rwrHkLVXzy1iOzvRfrU1VsPTB
         jU1VKFpGzM5Lm/RctBUlZ6hO7tOIK49ulN95pPVl6Nyzo0QyTEKyd2TOr4cf778mVlJc
         Ta1Bk6/+hlIl5XHqMXSAFLWvJLMXNmWbuf8p9S4oNSbmqU6o82kKZVysyADSS9vW8xyz
         qR7Q//akUvVsLlOBQTQc1WmjXhAIkYdnimPAn9nmGXpL5lZEQfyERPZlzAaZ051xmAuM
         2n1qfLW8Zp5ShIvL8P6Uu4/aOzmeJhvjW2kLcKn/C1ys2wKnCHf9j9p9ed+InWCDbEkq
         Kdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508408; x=1795113208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmhP9MeZo5Es0js2kSt8GfipastboIXrtB3uKJCSmzY=;
        b=pHeSykIrRmUmkhx/IOXV+Yyyw0ZIhLEDEYn0wbsTd8X5sSYn0TBk3T/Ebp0iEOkpvd
         MGcPOUkIHRzxoBqm0slBp1HxPILY6yFmLU/L208HzG0K/bTEngUeMMBiVnqWl5Yyn/7L
         uU/HEeQ1yHlyt3+UrqEZpj1xbcdvWRpJGuiT2CEbUS44ZxU2WbvQIE8DoLfqeAgcKekZ
         XBg9GYjpwuvOtvw1VtL55ytP4u0DfYdBDv0tweCKluPxTn4emVFdgVIBNBDYWqH90YFL
         d7jRVkzctfNY2d/ygXDoSO9WectuBth4zHe5ihC5mgM+R28zbFBt08dgnykBBUglw3ho
         Cjtw==
X-Forwarded-Encrypted: i=1; AL+hErGCHJjqYghNyiWAgINaYQlsLrZMXNGPqHXFM4Ooox7TN036o4qKch1ll1N83w59xUOws3XKtVpYKRzwySk=@vger.kernel.org
X-Gm-Message-State: APuU4Z96xQsy9c4aljouOiUYCiuMPUn5TNM1bTsENMBW/qmkP0AJ/MXH
	SkKugv/CuRB4mQ06ShZ/Ww81hG2CFhbn2XqunZr5oyudYnmXfYwxM8Bl
X-Gm-Gg: AYBFou0p63sODSSMKdirMSoVJXcw3deX/jk2C5qQD+CB9VVsE9RJVxhahZJW36uhVcG
	4c8ROGIBkwJPzUa/XRF6TNl3uu+j/I5YuV3B4IGP0PO0JiICayZ01XDQEv1/5oUlelrdFTTeOPK
	e7wwT2ffqhpZ4QiQv5mG5hpm6epmV+vbhOCkw0CElY5Yn8GgGLH9etQkGs7B+VrDtGJjGFWh/2/
	Ltep6Fooosmm0L+lrWdouKasgjkIMysu8qv59PK8YwC1Z8lS5rIbPLH+IvaYjhGGRzDkk1UQlvi
	cG8JWuazyXwWC1uGLfsnV3j+hniLrYjArQex41Vncm/H9jvwjlwqf2/fmvyDZCMRksvPZGHkowh
	jErVY+mNNdOy+Re53i3Qgv45iYEuBPdlAEzFiEid+BuW/BKcX6AOCY2sMqkXGtJ8kZ2H2q9E6Zc
	qVTxZsg/tFNYOLNHnOAGlRdsoniskFyCrdc1EQypfuTJfcynLd91NX5i5BQTi+asMKL7Ro7/Jy0
	hMDCjrBWHuLuNVE6WjeuqCi+KYJB7Pa6kJI/PwckwDHbkcKa60WCxkRdrKUdBr4kf/JPXdI8Tfj
	Qf85gWjVj38SxVIv
X-Received: by 2002:a17:907:6093:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c50963856fdmr10734066b.36.1794508407688;
        Thu, 12 Nov 2026 10:33:27 -0800 (PST)
Received: from krava ([173.38.220.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm7085066b.4.2026.11.12.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:33:27 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 12 Nov 2026 19:33:24 +0100
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Alan Maguire <almagui@kernel.org>,
	x86@kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 01/13] static_call: Index code text reservation lookups
Message-ID: <avYGdFtNMjSrdc5l@krava>
References: <20261109194916.1089703-1-jolsa@kernel.org>
 <20261109194916.1089703-2-jolsa@kernel.org>
 <20261112082709.GC2668804@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112082709.GC2668804@noisy.programming.kicks-ass.net>

On Thu, Nov 12, 2026 at 09:27:09AM +0100, Peter Zijlstra wrote:
> On Mon, Nov 09, 2026 at 08:49:04PM +0100, Jiri Olsa wrote:
> > Text reservation checks scan every static call site. Build an address-sorted
> > index for core text sites and use binary search to find the starting point
> > near the requested range.
> > 
> > Module indexing is intentionally unsupported. Module reservation checks
> > continue to use a linear scan, avoiding per-module index allocation and
> > teardown complexity.
> 
> So this changelog leaves me wondering why, and at what cost. Why do I
> want to have this extra array in my kernel and such.

right, I'll include benchmark numbers for each change

jirka
