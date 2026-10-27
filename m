Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133954;
	b=t/h+5wobsZh07/HeWw0ecNfqmcXLnjEmsQyEm/ZTVj67C10+zfx/EKftrkYSUfs3Wfts
	 Y5cyUMtX7elA/BNhaxOVx5h0OHjdICiFIYW9DlmNDuhLLd7OBZ6JMr3CcT2eOqOZehWbd
	 y4+o7QuCFmfeOl/GDTRblaPWmkQ4oF8P+DQ2H5L5JiWL6R8DSXbMyYBxd1zuqWdUeeMAd
	 /HxF0WntAsSE1ZNfQAtaI5eDI2Q0bf4valkzKC+6jMBA3xBU7BQa2jwkUk38aUV2SCuP0
	 JDeglwqiKMEuj9EKMttTyDDsHvLJc+sha2redwOGqr477Tsv+i1Y0GSbemtqr3KLp7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
	b=L0TP5PsZoIS0ltOSB/jLmzQvvMEy1AVfndjcx1PBFBR7S5k+krvoHhwdEEqPwMVnT+9x
	 3h6l35V0fGka21Ayy+QU8mN5xZ1nOMYvxdLMApgN0uXLtc/vZjrqm+p+z36SgwVQWFED0
	 POAtS+J2lc6MhlqUxZCmRP6f2E8rJVz3YrDLOcFPjJlV3RXb2bjHHFIDQ9lKDQudio1WS
	 5Auers2bETmR8AHjIcG/RyH6OenJmXdbosctbgdr2qLlvGM6jRbpraSBM+mO1/XXnnpi/
	 M+kIMZ5e4Z3rNju3EfsKqyXrqO87orAUVSb5z41sWZdMPW79C/mxZyjzkPxWIU2yfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEf2kU1f;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA76606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA76606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEf2kU1f
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so169628f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793133953; x=1793738753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
        b=eEf2kU1ftB795WE7MnbSaTyOCX7NTKGkzk4h64H7eSvOmMJXzCI2DdmJ2DjnsY508U
         lJ9/wLvptGD/dpw9vCh85p8FGWCJwCpCrXy3awW4eI2qRIjHtx7197U2ecMUBNBjZzUb
         c6qE311jpqJ62nqWBS+tRzX6FrHTpCjsFfZfqEIu2slfW9hE6i+WNXYnOOjv93czWgMt
         dfDwdgq4UCDdpmcfQbfv7Mkh+W5hQi6+uDAmIkuLsw5Mm8tnDoANYkKy0tq/qDSEwO+q
         Z8CIb7ji2aLTYgaU65FYpzh7dnmS7/8YvlkuGjI2UXErC3yb/rx84TPR4wyQft0JmOPa
         kimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133953; x=1793738753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
        b=IjHP/xUnH92oGOs7gTGSczMVc8rlw20ZjPJ4eOcPQvzRRvcrTxUxDLu0z7SWUXaf8q
         7GHKRuODHsNQld8Wp9PFb8tpXXK5uggmGafZHj251Y4fF8J22aYQ/aIl7WoKVvsEA1gL
         3oCY9bwgWvYmrNtWeL/O5lWUDw/4uHRX8hh3YBjgyZjGtY4TH7iNJALzUayJ0XEUxSD1
         1m5GTjMPm3Mf3q36w/C1cck+Y0vWOyDifIVidsRLuupgRnAWLtzY6U4SubgVGxkZ7OWc
         PpqGt61m16SkHUzCF91u2XmETGHH23xC5OBARRoMZ0O1rZn7FIUE40k8rvjtYx1QepI9
         9JWg==
X-Forwarded-Encrypted: i=1; AKwUvByFekeLz60e9+oE9QxGq8GqL4pSdK/9ibLRiT3/wOoANTosN3aJKCHRs3pm5ZrCtS40qwHFuNtiamFVE5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP6sN70qVsM6jzFgk9E1eCYoH+giatnjuJsRk026O89fHlaXl3
	lBKraSl2ZUOdYLVTHmLejX5ofMTUtAyhGiQtRFSZrxNml/hhHIJFQPgr
X-Gm-Gg: AYBFou0RaGQIzjzWGUBa2oz8xnDSJ09Q0F+Q0sAf6ocQqeH9bVJBh884KxNOASE+5HN
	hWYfPrznq8qn7o8RoPJcTyeMgScuwkbs3emRLPkXEhejVxpA58gonRvUyTih8O16EcD1ozri46q
	sjD8osKP3JnRc83hu6Y3Tqc1EIyA4f8cz1HzlyDB79sN6nkUCpXTNbInjcvhlxygQJsEXXgyx6/
	a6sEAvDUNQ0zzJ4eNthF9kh4NO7j6OaefTemhnPnuiUd7IXoO+/GBUPRwkBpYa8nE71UXbCOdpk
	XqbpMl/HK1KX9ALay/FrvuBKiyNB7HS0IepC2aeYvSFBOfq5DwEIFUa57U5uW3127UOgV3MN74X
	mtWmZAdngE47iywfoj+BS6nKPiUyWDKp8fjdmmLsll16dzaDH3lOqb2eoE8+QFaw32i1H6cqKt4
	ynRp1L69wLkwW/3H3ToGY5POpPQCNupoE531n7yPcIB+nUo/xM+txz7t18C1pG5DHhvZjYEEUNK
	V+sBMDIoFdQ9/b//7qoZgOp4T1DgHVlx/rky3w7v8OZAPF5C9jD+q+LJ7fDQlq+N3RK2E/8b56n
	4CC50kCyRJdZEQdxnhggNvdyk919LRpire9qzInxNrBUudxFO1LXSeUixGzF2/KnTOe/jtVtRTF
	jByojY5eC04whJ+CDxdewUlLEiqi4/8XcZjZ5A6B8QqZLs2MAPWclhMrq
X-Received: by 2002:a05:600c:6208:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a9643d51b5mr2268405e9.2.1793133952638;
        Tue, 27 Oct 2026 13:45:52 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2ac-9b01-21dd-e5b3-2a30-2e97.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:21dd:e5b3:2a30:2e97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm24338968f8f.39.2026.10.27.13.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:45:51 -0700 (PDT)
Date: Tue, 27 Oct 2026 21:45:50 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] io_uring: final close can hang on a stopped
 submitter
Message-ID: <auENFo-ONkpSYcNq@gmail.com>
References: <20261027043521.99446-1-kmehltretter@gmail.com>
 <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>
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
In-Reply-To: <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>

On Tue, Oct 27, 2026 at 12:04:59PM +0100, Jens Axboe wrote:
> >   3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
> >      then stops itself with SIGSTOP.
> >   4. After confirming that B is stopped, controller P tells A to close
> >      the final ring fd.
> >   5. P resumes B after two seconds so the test can finish.
> > 
> > B keeps both pipe ends open and remains alive until close returns. This
> > excludes pipe HUP and process exit as completion sources.
> 
> This is working as intended. With the change, close() waits for
> requests still in flight, as otherwise they keep files pinned after
> the ring is gone. If you SIGSTOP a task, then that task can't run
> the required work to complete it. A fatal signal will still kill
> it.
> 
> Unsurprisingly, sending SIGSTOP to something may prevent it from
> doing work...
> 

Good point. This is not a real regression.

Thanks,
Karl
