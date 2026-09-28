Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECAA4E021E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608326; cv=pass; b=c69W3YDFKxYbQhqZjEwM+F1F7/aFGEgVPWc1P5TH/O11H7Q1gSpRfudbxDonY32DzQ5A0m9b8bKqRp28KiU6K0ZTJVUAwb9E0PsBCAgTXsIpoxEbzfo7+OpNgjJu3DVT2N4bVzGeCTNst0MCettCmpE+2zJrb/sfmsnr3nZWQ4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608326; c=relaxed/simple;
	bh=cxpTfer2sMLmLTmjKf53yCvqaUBCk1EIHEd1pxLD0u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQwgvLDKnWplIHxLZ9YF0xZ8eU1WrCo3EpMTVPLgiCUQY75HkE3Sz8i6ZPxDKc9SO8SOenKVbVGf3+/gnQjqdjrq/tuj4GWJydvmbwFN8n2Vzk3RxL/F8rRjfNIVEzeNRqOBHnaHpFgFTPqyofEp/T4tzJW/z907Ie35tMs1TOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbJfg3Bn; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbJfg3Bn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so81965ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608325; cv=none;
        d=google.com; s=arc-20260327;
        b=moOgHSYS/ybl3oeijYa0SsjZy4P5lAX/hbfWdkMbsAeUmUSqiERXyFZxb9IWe6jNUF
         Z1FdRPvaGANjEdKyyBOZekBvPdarnyNA+cTKS8PhkEB3HDtJUdxj2zpNZTGuO4vEcuCY
         1sbTGc9eWfRD0KPV+SGFfxWBH56CKeeumR5Tg2Id34wg/GJxPgXAzwu46Nt/aDPSHilm
         wdN2effjJR5RnmrlO4FZknVFIX2z7pzKBGY8wGeJtWkfK2zNU2macWBbBUyMo7Nh2LIp
         IMkfgE99L5HSRyqu8FFenxrhon8Po11W1qBB0lFMLFB8q+E+WG4PDh3v62ScFN2O6t5x
         HovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o2oSZa5m02C7TagvPW0aUMVOvbBcJY0xL3Ym+Z1In0U=;
        fh=8OKZvOT2QczSg56Lii4an3BbXkugIDE+9zax51BXgzw=;
        b=ceqyv29qairPjCUyDs17Qc5EBXiB1OOcKiXZv214VngnApWrkNxpiCf3Ebgd+qbAZF
         m1+RkS1VdJ4dkFEcthqeyw9rCS5oGZO0aP4KtBrdDBR8YA4dWZOGCzegTbOYdBrem8IO
         iIzcHASWGUYN/dGhKJDg3a3YOAhULO3YMSmNfZXu7X/EdwYOGEW2lrxS6Pdg0Z9swJW+
         v8L+iRPnejEIw2LD4uxP7MyY3mjMMEs+ljvwP3hp9PVpwRb1ZtVcLFlU4dTyLS2nNCxb
         dbWMc2wYNIoCXmCk23EmetdFtOlBwgrItFHEOO/pz+RZCmxkpXakq88nrwYr4UwUR+/2
         CeTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790608325; x=1791213125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2oSZa5m02C7TagvPW0aUMVOvbBcJY0xL3Ym+Z1In0U=;
        b=JbJfg3BnWID/7BAbuNO+/Qmk5hClQTbZai22t17Y8pKIbcL7mch0D1+jGrelBXAGF6
         QhcDeU/pD5ZFyN9OmiugBOLnk2Qg0hhKGfBPkZuN5cKfFhUric9EG9Y+gSxrVy9DVNgJ
         7G2GhRpoKL/fc2mU+364KH9PErHmd9JYvIai+Rijw+gVRq4xFJwxjl4UncbbfTVFk9qV
         xUqpjOyG1tGqC1o9Y0YEY4zHbPgbeTia2b0nEpJJqhdt/ojATFCBPJTLz8V02sPdlEZp
         YqJYZJ+8v9r2iK32aBgdGk+Mq60T+lpsxgKaIEx9eB+pg8y0K7OK251MCWQ5OZtmBErt
         GT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608325; x=1791213125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2oSZa5m02C7TagvPW0aUMVOvbBcJY0xL3Ym+Z1In0U=;
        b=snAheeWTNPUzkRH7eUpET3QtyjeJqtD8QLLtDVfmgodsVYQO6v19myRxIAu6ADTSv8
         jdNv0P6VrxxIC1feQg4CHI0g/eQFQj+kUXZJGtkcuJKO/dFYUO7M4Xtshmh3XIayFvn+
         YZwzBg7hIOuasUl2UKznne9N8CEEU+1189+OF9vuA2lOUt81Y4j6f06RURfwkp4K8Z0f
         I7L/nUOt66nEYumQ0TA9VN1TwFUiYC6XY6OcTQVIbYljkKZIG+khhKGMRbQJ6j1Y70mk
         fxJPuqGofMTs0ApQVbzQxLXEPSi4bScsr3/mjbuS7BlJRWtDLPINbbSdB5X37/Yyu7Yv
         xA1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9HqHCA4HbEWNVOkSIZYfh3Xs0d1BWQYzmsYZ+EydY8wHFNoMuiXbC9Cu1CtQc8t/kdAQ7kV0iS5hFiB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8+eFQddCJ43Ojbi1TdUOgJcKE193JfAjG+f6CiEhK91DDKdOa
	RL0qCXtKDMasSs72pYewhza+y8341HDt65NkXqKPwu2HiVrFeWFLgxvuY/PM/edwOgx1kbAGgeA
	L8/HEa1GA8q6g8kTfzoFOuf34BR8veLAKRkSC73db
X-Gm-Gg: AYBFou1nAVfGXMdBeBk+DBuUtez1WAyvbMmUhL27hWZLA4djCSUAbiz0iOg7MqVMmPn
	5ZlsM5lj/z1FPwz/pHWPiehLk51Tdb/TXPTaVYz+X9Q40pASG2zkUaCXrGMyfxBUw0SKOOrYc9c
	H0oy+5iTr6XqTm0Kp6dGeHxEAhwwQmqDMOqbrIOcyiF6U5WyUyh1DuQxAnd6MFK3JWfvhcK3Y5h
	/ljqCLVWSU5rwR7b/DDxu560envXY/PGkdGC6i4VWZgacbMdXcaJQYadKZ69ZNRfjrTAkO+zlau
	RnLB5CWJT4AUM7GHUCiXCMvHT/mWwYvVjRI5/3dhGT0Z+MVpy5StC3zHwzqUy1sc+hgzux0s04N
	Nb1dYEnxC
X-Received: by 2002:a17:903:1b4d:b0:2df:96ca:d7c7 with SMTP id
 d9443c01a7336-2dfa622759cmr7214885ad.10.1790608324149; Mon, 28 Sep 2026
 08:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-james-perf-mypy-cs-disasm-v1-1-1bda909475ce@linaro.org>
 <20260928134642.GE14479@e132581.arm.com> <79e7cb39-b4af-4ac9-b72b-b01872603cff@linaro.org>
In-Reply-To: <79e7cb39-b4af-4ac9-b72b-b01872603cff@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 08:11:50 -0700
X-Gm-Features: AclHuK9VzJqnLWWLa_yJchAEgAsHiJ9270-56uCWBGNQX48AES5uJ19677-R9tQ
Message-ID: <CAP-5=fXeSXGmC=E+Wznn2L9yReMCx=6Gwe=v-6hHbu=q4ZAyDg@mail.gmail.com>
Subject: Re: [PATCH] perf python: Fix arm-cs-trace-disasm type error
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:52=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 28/09/2026 14:46, Leo Yan wrote:
> > On Mon, Sep 28, 2026 at 01:58:09PM +0100, James Clark wrote:
> >> The perf sample dso_bid getter returns a string or None, matching its
> >> Optional[str] annotation. Attempting to decode it as bytes causes mypy
> >> to report union-attr errors, even though this was behind a conditional
> >> that checked for bytes type.
> >>
> >> Use the string directly, retaining the fallback for an unknown build I=
D.
> >>
> >> This fixes the following build error:
> >>
> >>    python/arm-cs-trace-disasm.py:266: error: Item "None" of "str | Non=
e" has no attribute "decode"  [union-attr]
> >>
> >> Fixes: 279b402e5143 ("perf python: Port arm-cs-trace-disasm to perf mo=
dule")
> >> Assisted-by: Codex:GPT-6-Astra
> >> Signed-off-by: James Clark <james.clark@linaro.org>
> >
> > Thanks for the fix:
> >
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> >
> > Just curious, have you run this script and compare the result with old
> > one? Seems to me, the build pass is insufficient, we should run a small
> > test to ensure the result to keep same.
> >
> > Thanks,
> > Leo
>
> Yep the test still passes. I assume the "if isinstance(sample.dso_bid,
> bytes)" part was just dead code.

Sorry for the breakage!

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian
