Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFD47CA9D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791929475; cv=pass; b=PQyf1lkndUakco0fhSX2sxNWxOXaSD1O5zmmRNzkHSAhMapYwq0f+rDcuywwCrRYhTNpvryJtO69eUHXa8AcvsPnDa6bNE5vPm41EDZtOZsTZrxCB3k6O/iyWfKvLHFB6wCpC7almnH09rd8S306o33uVhHCf5XZPM9xD8NSa4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791929475; c=relaxed/simple;
	bh=FYTV9FNBFSb9ojtmdwQPjMX2y3qFMZRTL6lxs4fSGMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8/3hsKzXDPw5PPMAx0fLL0mL8U9AJbrz3bGJvI+YOseUxlKfbce10gUwqkew80Yc+vaLyq91X5066ycja3AB9JYQpUBvwUFDWwpkyWXF4qI4VvC0t0duMfFnHxRYiwY/uJTyAbmQFJDe4dBXJEmNKioi7PcjczjzRwQA1dEb80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mr6PaSgn; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mr6PaSgn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so185525ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791929472; cv=none;
        d=google.com; s=arc-20260327;
        b=hoxvgImQN0q3rQ0HIPX+hOJgnEofXY7lRvXoQXSjCwXEJ2F1H2DWvpVXVGm908kIP2
         ApmeeJSVoaaeu+5Yau3fnukt8T4cGWDBauPNf0AgMcb7eADu/RSzuwAB+qXbt6s3/d7p
         YPnByU7+kkOUNXLicD9nFpdBVTG5RnIGLGlTh+GKsZN6+3F97nPTpaeNxUdLl81dlQIn
         6q4WUj7xPVes5njgrSczZI+RwHNnyuE8K+xznQWHql2/XN3NrQ1Rh3po2FUc6Y8dR7w8
         ATzSRVomnu+cWgOmSsRaFpz7OKHiXx0RyHfZW7lqkdV/L1qNoqa9NfkvrDEdmE2CgbFb
         vw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/HmaWIj5cIrehfzfKKvA+54cdWoeGQYgmlrlmSSeWo=;
        fh=/11cSgze8XgFh0NtG21PjJx3RNmhxjbfTKjnICFTGLc=;
        b=l0CwyjoV8nmG7fmi3iDBODVtztb6LL3IzAhUKHiq9UfeLgPPNMZArKLPa75l/zLssO
         UHhXknE5I25pGBnmQFy0OUl1xrkjqSMJqPNq4uPInbBic1bWoq4O4wnL0Iu6NW4ipSyw
         asgt9aekoo9+9XcpTqaxth0/3AMrEqpxyin5zcyZAbrUSIAG4Ef070I6f7hfGSPluIAM
         eSAV5fvJTjjw+Pz7cssVHAOofJV6ixrks7n0oXk12ip5LVdCv/ctGmf5VHyboRYcNM3W
         QEV5HAC1thgPtZVeCnBXs+Jtn6jZhFzUDEG6Ed0i9cm8ojKHDSo8Y9UO/r1WjSfn5jt/
         YHCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791929472; x=1792534272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/HmaWIj5cIrehfzfKKvA+54cdWoeGQYgmlrlmSSeWo=;
        b=Mr6PaSgn62Uz2fYQ3vRqWrnK8ggrLb9QlTS2HRhzhJlh/5cwuNHowT5rmnFVaYSqtM
         /1T464omC4gElp93jq+FlW3XgoR6lrAyT9UqypPJXnmfgNAPQqhMnYb/AuxgZlRslBBb
         eSH+DlCsHAwnSUY9aNyEKj4dOtjVVEMPXCf6SnZHHh7W1As1DMvGVkm2/1H3Bm9Ll4zY
         Ay5pEhKx8FCcmvtXBqPc1lCB2yRiaoLAUH1jevRpYbk9wLUpsuUmmJL/lXJ8HtigO5mz
         eW5Mqo30ccwEKI9Q9C2xMg5J20dPloYSzUD4dSGg/M/JBKfAC+bj8h6RI1V5UT1aspIc
         0m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791929472; x=1792534272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/HmaWIj5cIrehfzfKKvA+54cdWoeGQYgmlrlmSSeWo=;
        b=ykumPvrmvC/bvgyxNwQjRffhzVvrOEEz8pElDe7d9rp38j2y11DURPhjxB2YxC50Q5
         1/g3m98CMSO3bwKx/v1DYT8Zgb0Gmc4oyuo3WjNQNpkjH+tTfkB8F9eE4xZvpS+87e4u
         ohrIfV04tV1FY+0ggtzvZl3XGpIeo4DHFaEvtsWBv9PnUW9FBdcp2nTUhwCOi+AeSJ9D
         z23Vgnh0tUZ3gzS2mvYb6swECb1USW/WdaSGlE6NZREbZm4gvQBcnOMjJckNz+Ky7ZIc
         zI4qXAmbm+oyPPJeK6GsddcahBki45sywLvW1zSZNDFRGe/C28C0bSCIEeQd+ngNHBeS
         qCkA==
X-Forwarded-Encrypted: i=1; AKwUvByyWTr2UShz3kDO9N/9guKM/R421o2onsvGw+QjaydbVVI7KMEaRJX1gewNcB8VfeYV1ZqICHaSSgBuxDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTYpaE4EMZWaRjfG7Uj3K7UE78WiH7vzVIL3T2VRVdOOYexa8q
	sYZqGFWIzYeGp72Nx2IoX+1kWRWfrFrZhPNTp03p9G6CP9dFkSbv5XPaeE9qjg26/8HjN8lxPkM
	BSsWwBBNnyUuCfQcZZfVfnmFE/DQPUj0ZSZbzsuMZ
X-Gm-Gg: AYBFou0ya6pocDHCtj0GubgwJi7CMoAbu/o4Y3mV0UumSubj4OgsZ3Pmsc24mSJzGOL
	IYgIiLX+MXQMcgzEjJje5cmS22FphNZbSW8IXz+QoWJvAn2YfZJNT+8B0qSuy1MiXRIavGuunqQ
	MTtPE4qobYnmKrCXBrgWg97vjQ7iPXQFeFzWbQV/xxpIf2JWMdde0QWXmKWZyyVsNWzgV8XQvYd
	4iDXc5sMSrzR786uDd9dWG1t313vOOkoYcYwB1Gfq/H/4BJa3X8/iCf+hGOx3325KzdtelwCVK2
	TdHXmurGuuwlY17EMzyeEVUMw0YXgly56Bm2de6aFVTriA5leH/uI09byhJJFpF5gQoZUEA+9e0
	uSDQBuPD9
X-Received: by 2002:a17:903:2b07:b0:2df:96ca:d7c7 with SMTP id
 d9443c01a7336-2e939abd25bmr287505ad.10.1791929471359; Tue, 13 Oct 2026
 15:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013182458.1234616-2-irogers@google.com>
 <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org>
In-Reply-To: <871bf440-5b43-4d63-83f8-15ba96719fa6@acm.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 15:10:58 -0700
X-Gm-Features: AclHuK9zqPxbei3yiEwT_Je-bqqvc_vKWZJxCFnB8AYrF-IAVVVXSXOd4HXS8b0
Message-ID: <CAP-5=fX1XZu=3scB1-hA2ppcM0+sR7t_3=C7fFx=kGikm=dLqA@mail.gmail.com>
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

On Tue, Oct 13, 2026 at 12:44=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> On 10/13/26 11:24 AM, Ian Rogers wrote:
> > _context_unsafe_alias() does not use its parameter 'p', which triggers
> > -Wunused-parameter when building code that enables -Wextra (such as
> > tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
> > Explicitly cast 'p' to void to silence the warning, matching
> > __assume_ctx_lock() and __assume_shared_ctx_lock().
> >
> > Assisted-by: Antigravity:gemini-3.1-pro
>
> I think this should be changed into Gemini 3.1 Pro. I don't think that
> the "Antigravity" part should occur in the Assisted-by tag.
>
> > diff --git a/include/linux/compiler-context-analysis.h b/include/linux/=
compiler-context-analysis.h
> > index 8302ebc2ea8c..024e303188ad 100644
> > --- a/include/linux/compiler-context-analysis.h
> > +++ b/include/linux/compiler-context-analysis.h
> > @@ -243,7 +243,7 @@
> >    * alias as a function argument).
> >    */
> >   #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
> > -static inline void _context_unsafe_alias(void **p) { }
> > +static inline void _context_unsafe_alias(void **p) { (void)p; }
>
> Why a void cast instead of __attribute__((unused))?

I agree; unfortunately, the macro isn't declared before this header
change needs it and I wanted to minimize the change.

Thanks,
Ian

> Bart.
