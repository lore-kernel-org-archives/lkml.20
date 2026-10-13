Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C56560AA8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930377; cv=pass; b=EohizS+cNPiZzN1msNXsR1tyv4NxRS6lD2OZ+TBEdwOKZwrHI9E4+2T/YZ5HQsdBOsE8qef8l2Z88kXZK1prCPdnqPj99SbClsUyEOvzbXpkUqBvXqp2EJAdM9TjmRX6pHZ0LrliEAJr/y0ix4Quu1/TvP6qA9ZGgEMkIPZM3zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930377; c=relaxed/simple;
	bh=e97obOSaBF5A+CDMxcrni6hxHYCVamGCzvFlkP2JwH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cukSiJg5KJ0M924gpTQf9gnPgWsTuGO9uXz+dUcmcm9+Mft5ptqNwDUJrbQL6keoTSKWgnIhxxCp2rgJV8UMUl87X/FeWo16oRmyjzHHcUKxyVBkfCigedALMMOQYIn2NUaGlxoE3MlQ8znAQNc1R9gJIxlE4jf8+UrqUNlR3sE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gx5cY/0n; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gx5cY/0n"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so164255ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930375; cv=none;
        d=google.com; s=arc-20260327;
        b=UGDXTLe6Av5TMaawJPPpG52dgVe4f0nZ+rVapveymrlnDUd3eQRohZwtZLIID4ifl2
         3CwvkdRADOcq1Bcwb8pL83F08tezZecdGp1qCv888UKxF0P+W2evFBwSgQk9wmExEZeV
         t/3T39b9U2cMsXXMvG7TV9P4aGlhah6AXt0rTlPaao6k1fqpD+ZX460lncEhulnLsBRY
         ys0UA1qBdvX8wVmHls3mu6iGxQOO5GAtcVS7v2fdaH17bZodubpaGpZ1Rp1Cw1We4Lwo
         fB69ZQNsykwfv21oK1lpQs76kN+O1qRgbnNsZmjzc5O+4rat0y4mXbBjAL8ljfyP3iYP
         1r+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o4Q09YSNA5+tLu9OvcCxqGnBvUFwTFzGq4mB2ylO5ZY=;
        fh=swykw1+0VS9OLs3D4aJBvnu9xNu8a92imShz9RLfHcY=;
        b=epYjQHEQwudET33+IwCqk0mwv5RwXCkd+kP6tU7OwioEwZk3lDQaQaLIQ2AEPzwF0L
         uzuYkCmbB+m1osivDbTTcQElgLZkSAkKwkM6yl6qTLXj906pHfoMDcb0oFOkMIiJwvp7
         WyxpEncZExUmlSmfBgKvl+h1GQcSnzsxpnPCS3nzEZJQVhIA9ikWhGRpG816GOw8CHoo
         y6U84bwPfcOSgN5pzjOnWKyiV279T2CsX2wOw/HCvdsWHbJQ4v52bAyyuE7DaKfyovbo
         +/J0Kn166hrs/cW82EJT2q7QiKGux6WCv2LzhZhGMQxRlAYX+jQ+TWl/0c0ZuqYpjS+A
         6G4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930375; x=1792535175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4Q09YSNA5+tLu9OvcCxqGnBvUFwTFzGq4mB2ylO5ZY=;
        b=Gx5cY/0n2T+TX1Jjci9abHdU5GkifM4O2FaGpSduj2vDdLlu/72ZX2mrV05+GNjeYH
         A9uTy734iEekvblnCy2+/QI/EKfyjKWqDMU6ZMFB3ZZgowtKKT7X+xJLBut1AnZeJKuU
         avD1TfwrOOIX2XuGYBvPjhIMGNmgXgbxXc5twtFLCqc3Kv+wxeVmG/4OAbIYIaliC0/Y
         T3YzyscW9qUJPgqeyRNgPruECQvT0RmGwyFMEpEbMRx/mEFUThHRC4TcDHL12nSnUxL4
         Q+0RJccrTOSKDpUW3NZG2d+RN0fZby8fEMXOXLaTAA/KA69/9zV3rbasrN7PXvWF7eay
         vN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930375; x=1792535175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4Q09YSNA5+tLu9OvcCxqGnBvUFwTFzGq4mB2ylO5ZY=;
        b=smY3Pp742CT6t3kD3tTQCgpB+sl+H31ZeiameuQZ65jfFGmPZCyf8g2EfDWsf23Cb2
         azpPq2ZNNzrwyNDQdNcD0maEvYto/aqrh7NSp7MSfnaPe469haJIKmwoCAX1A+42KsN+
         U8e6aMXXlFOdSZZko20onB5dpBpTO6sGmW13xcmyKlIzw/VZVXmrv94xyjFMQ39xySSn
         8C7Lwh5xUUK5J4XwoaXy27tUQFOEQ3PCW6ayTBxBpYKzxAwzsP+NLpLXso3vHP9XfPrQ
         ujLIlZ2uxvcgWORORJjuq7nSutchj1zIQHx2hBQQT4fVlYvD/f4K7sdC5k9H84R2oDoc
         yEtQ==
X-Forwarded-Encrypted: i=1; AKwUvBybArh8jRNt6F6KCMC254cna7+M3ceq9DgxiMcqKJ8i68IuBhWf+p1E6YaXmv+BlaOoqMZ2Cy0KZvOzFjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCaJZd+0kQUtwmKMe1g68JFzkfGluJ3sCN5HODPMt1jIV9gn3E
	YVIlBnKK/+EK7NToYqliN9ryHPecyNJHcOGymQ9ij4dSoBRPKrXpSpsJ8q8ayWavXaRr1LiWi3F
	+pCGil0f3B4ywjUg3DN/PA3jhq5sgKdCm0oWDsOky
X-Gm-Gg: AYBFou2cgHdqBbrXedMC55z8BBWz5/sH8nOVL3mtLiwvqCsOtRG/IpeNhDq99xMW/me
	i6/IlyIxZGmoLbhu6Yz2Yi4CtVP5cKR+ciwzTe0IuMIDF2U7lhJcD3fRvqgaMETv+ouvnW6vm1u
	7d3ZLR4O2ZKtQMLBJ44dpPdKwueghGtFLYyVStXnMSH4T+B78KKmiEJApJ5F2BXz1WxLWgBkcrB
	UhFv8YCg22xzPORZ9Dqc7NYFmIGn/GbThBikqdMVEoTJKAr3l/c8XfX553kvE1E9Fy6raqRhiv6
	TzLLX2JuhUQzmyJfO3UPbsEPmjSgknttd80wEQCbTL57DKHOJLCg4tGVLJa7M2kxoTk+1I2/2qu
	Y/9Rr9GPbT9k3Fa0HkZc=
X-Received: by 2002:a17:903:124d:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2e939438b27mr346965ad.2.1791930374188; Tue, 13 Oct 2026
 15:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013182458.1234616-2-irogers@google.com>
 <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org> <CAP-5=fX1XZu=3scB1-hA2ppcM0+sR7t_3=C7fFx=kGikm=dLqA@mail.gmail.com>
 <56cea1ea-a4a5-4c26-a15d-732415986ede@acm.org>
In-Reply-To: <56cea1ea-a4a5-4c26-a15d-732415986ede@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 15:26:01 -0700
X-Gm-Features: AclHuK-gmtH3OisE1f-Puo1s8QVH6C5PZ7oWuzSB3BanVBcur38Q_IjsKLcry1A
Message-ID: <CAP-5=fU1fBNwnMWjjzqz+SNW2n5NWsEYeEbXd8QGBXfoCTADYA@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] compiler-context-analysis: Avoid unused
 parameter warning in _context_unsafe_alias()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:15=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/13/26 3:10 PM, Ian Rogers wrote:
> > On Tue, Oct 13, 2026 at 12:44=E2=80=AFPM Bart Van Assche <bvanassche@ac=
m.org> wrote:
> >> On 10/13/26 11:24 AM, Ian Rogers wrote:
> >>> diff --git a/include/linux/compiler-context-analysis.h b/include/linu=
x/compiler-context-analysis.h
> >>> index 8302ebc2ea8c..024e303188ad 100644
> >>> --- a/include/linux/compiler-context-analysis.h
> >>> +++ b/include/linux/compiler-context-analysis.h
> >>> @@ -243,7 +243,7 @@
> >>>     * alias as a function argument).
> >>>     */
> >>>    #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p=
))
> >>> -static inline void _context_unsafe_alias(void **p) { }
> >>> +static inline void _context_unsafe_alias(void **p) { (void)p; }
> >>
> >> Why a void cast instead of __attribute__((unused))?
> >
> > I agree; unfortunately, the macro isn't declared before this header
> > change needs it and I wanted to minimize the change.
>
> Hmm ... as far as I know __attribute__() is not a macro.

The kernel use generally comes from the macros in
include/linux/compiler_attributes.h. You can see similar unused
variable warnings being avoided in the  __assume_ctx_lock and
__assume_shared_ctx_lock macros declared in this file for the
!WARN_CONTEXT_ANALYSIS case.

Thanks,
Ian
