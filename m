Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64F3B42E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844822; cv=pass; b=IV2+Iczo9fIiwkpwdvljSXHIr0m1PQ8KQBhNzwaUOMLZ42evl92Ii/nXzbPCJutMW7kK7yYg/lTaAlBg+bDDeJyR1gJQmlZveZ1HI1T4LK9ukf4ybMnP0wmqXzmVkd6kyU5HOGFDVeCV7OKKj0jehEITXsjf9q0enPg6z8WNGfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844822; c=relaxed/simple;
	bh=CFhoFjD7GvPxBDPjUjStqpBpMojlj/Tky/SlADcDkcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlLYCqA317lDq18T5c02Bn6ur140d5CuRr6Kc81QlS+oUu3+Z6Mw45Seiu7+r06WwWLhyhi3o49wjnEeHJGdoAM9Wgf1ERSbtDoiI42ykw0Xarz26XMvFvjeukUxU65eLVl8zntfTL+QVHoBcZaxBgvh4XZ3T1e315Qvt+LUaU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B50bR23g; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B50bR23g"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5337c7b9937so553401cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791844820; cv=none;
        d=google.com; s=arc-20260327;
        b=beIvAjQgSt5/7x/BaSkQpjx09IuohRyGJOLQfoAPz2TupAyBi57gxHW/dVjp3f7uGY
         PBJEfycDNBhHuH/QszktGc4mv1sZt0soXqmjhxN6xLOtjCtt7/xnX/ZJkPHnTaoWP9u0
         JsrEWi6rvEa+9J9eIoEnW3fK75AkSxRV3da3HmswtiHjMCuYze9lfNtfYC8XIsf+cOGX
         CQRv0XOhBW1pI2FV/kzDsg8rlzSyVIb1vnq+vZumFGfCQI774YuJudnHJVO1JoIfOb8q
         Yl3qsIViPsFjf6IefQBMOjZNON/pbvOQk1MleUPVZq+PH0W04WRgBV8iC+Gd8EclXzdS
         zDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNGYidXZtaytiL7v98iVEO9jLb4pnmAyRJWu+GLbhwc=;
        fh=M4uH1E/wXTEw4KOJ0decI8fPqnlj5KjZwq+VYWTpJhA=;
        b=pdyYHLJWdnhRvBhpvXD3WTqqjAkiNeNCTfqpq5KuTp9HDwtQhg3zPAzGneeIMbus4p
         C8d4aiPiYoMKeUiy0P3Mjh10dNL8ciPPCouO16oaqzdLMP89Ou4WjCbXjtc7lAR/APYz
         ZaoHxXyLBYlU+c53FIZqlqerJZyjpixMSpqMJ/Vk5rcu0HguqL+6fzWRjCuc4EBJq7Xe
         xwvkquuaD4OFFSiHamnBLPaJpkL26I34pBj/k1JcHhASQela7TefuAJoePWvrbgyBwWt
         RI8w426mgcic2C+Mu3es6I+gvvVbQrFh9IXGmQxFl37uyOxIKoRZDiE5sIKPRSKprgqk
         T7mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791844820; x=1792449620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNGYidXZtaytiL7v98iVEO9jLb4pnmAyRJWu+GLbhwc=;
        b=B50bR23gJkaUih23V1httXSI+5wMU7zt8eUxQczEsaCSv6V8AIlHUVzvrGDHEIYEKG
         fUi4B1ycR5ATrXroCrUsY+vffsYVU+WkAW0z2mNV54NlFJMm/6L11tOm5zpDhjUVnztg
         QD9EdiZRiFi9dCZ6UZbETU8Wv88xij7qCC6wY04Jjqx43CM0S5YZOGCk5GVfIThDU85p
         5c6suovmb9XtDFDCh4hv5ZM2nrVfh0HWOws5elH9hTQHjcmZ2EFPaIqdn7qXSDAD38DL
         E0v3e1PXxeD0aVSDG/n+NQGRGsNCTb0cc0mZo0HUpd8LiBtkhk4j8Cxujs1cmcF8mptb
         V9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791844820; x=1792449620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNGYidXZtaytiL7v98iVEO9jLb4pnmAyRJWu+GLbhwc=;
        b=ZeKdXPVWioZDU916uapLaDBc8DqYgHH+J2IW42JJA4p6Q6igVYbXW+6nBUKBCWVmUm
         siuNjCpwirMH/xwj5j/W4TUZ1WgZtOov+M5bJreueA1u/RRLcdG4JAh1koceETfCBHoo
         ftnrB6fKNIgEIK92CsEVJaPm3jYEnmQJTXMXFTArFf3zklspGe6iaaH+sJ7CKt7CxF2M
         CdEXvMeT2iMA4vaiP1YQJeJx7RxmuefORUxzHdEY3UKFAjG+qWyyBInyQa9FRBgt/CNF
         zSPjS4kQ6psSjSFwX2dzlzxSisu7BwRkh6/hfa9ikFDhP2Im2NQg/mWFn2Du0mpjbbTP
         gjUQ==
X-Forwarded-Encrypted: i=1; AKwUvBztKQaGbr9DJiGKMhkkgwUF3+LdKkgVcvCnVSeqRvRUBSq4UjivH40UV0JUqwyGiQzLPJY8fG1gaiN42nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB4Ss+BdGhrNW8+mufIaQCK1+df/2mFRc2iUENsGhV5LTRWdJM
	EDEjGhGOBGa1DiJwTJLlkFczhcnnNkeOlzNvGTk21Vso1HQXoECQbwhLWaOkPxONAVhMCX0OiP/
	59PdgBbvgfUtSUQRehJRK0fKmOiGXfZ/umHIuO5i1
X-Gm-Gg: AYBFou1n4H16HxBwU7lcRsayiniCb+hFSKMWtZYc1mrNSfQYlHaG+fqkTRISmNwtj+J
	okMiqpS6LQpR0rlDD3q8dscz/akefi837LjTM1LuJbLViuuQMevUZ7HjhZ2L7Tagm8FFikXZqa2
	jkmFwAnqnusRjJfzzMqMVQtC5bGZNIYy6QFZUbgK2p6BuB+V+8MCxIkKz3slW5vh5cKR7ydklAr
	AjLPQHiFvvJP+Bi/9J+rT/upGRZ5qoSacGtgDb0TksrTzsvuZrQLD3ka7A4Nq6u8ry4n+0KXCNu
	jGuJ375YUgQAh9wBk80D2ZbQtUw7q+MKeGm0qlo8auUffMNsqgi7rM/EQq7o7Fkj877YvR/yVGq
	cQwPLE2A6Iw==
X-Received: by 2002:ac8:5a0f:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-535b2d9b1e9mr37970391cf.1.1791844819458; Mon, 12 Oct 2026
 15:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006161309.3078488-1-acme@kernel.org> <asWLmvF-3YtoKJ7j@google.com>
 <asYDREqTrh9ZDUhm@localhost>
In-Reply-To: <asYDREqTrh9ZDUhm@localhost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 15:40:07 -0700
X-Gm-Features: AclHuK-H8y7Po0uJuwabFCXT24Vopb_793VT6i4gOliUNjQZCmpiBVVeoFB13og
Message-ID: <CAP-5=fURC_-ez2eNXjcT378ttO7iKMHhjrexxekqDEDU-suRpQ@mail.gmail.com>
Subject: Re: [PATCH 0/6 v1] perf test attr: Fix the re-enabled test
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:31=E2=80=AFAM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> On Tue, Oct 06, 2026 at 05:00:26PM -0700, Namhyung Kim wrote:
> > On Tue, Oct 06, 2026 at 06:13:03PM +0200, Arnaldo Carvalho de Melo wrot=
e:
> > > From: Arnaldo Carvalho de Melo <acme@redhat.com>
>  > The test passes with 'perf test -vv attribute' on x86_64.  The AMD
> > > encodings come from the amd_pmu_event_map tables in
> > > arch/x86/events/amd/core.c.
> >
> > On my machine, the current tmp.perf-tools-next which contains these
> > changes fails like this.
> >
> >   $ tools/perf/perf test -v 82
> >   ---- start ----
> >   test child forked, pid 931585
> >   /home/namhyung/project/linux/tools/perf/tests/shell/attr.sh: line 20:=
 python: command not found
> >   ---- end(-1) ----
> >    82: Perf attribute expectations test                                =
                 : FAILED!
> >
> >   =3D=3D=3D Test Summary =3D=3D=3D
> >   Passed main tests : 0
> >   Passed subtests   : 0
> >   Skipped tests     : 0
> >   Failed tests      : 1
> >   List of failed tests:
> >      82: Perf attribute expectations test
> >
> > The below patch fixes the problem.
>
> still without your patch:
>
> root@number:~# perf test attribute
>  82: Perf attribute expectations t: Ok
>
>  =3D=3D=3D Test Summary =3D=3D=3D
>  Passed main tests : 1
>  Passed subtests   : 0
>  Skipped tests     : 0
>  Failed tests      : 0
>  root@number:~# grep "model name" -m1 /proc/cpuinfo
>  model name      : AMD Ryzen 9 9950X3D 16-Core Processor
>  root@number:~# uname -a
>  Linux number 7.2.7-200.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC Mon Sep 21
>  18:25:57 UTC 2026 x86_64 GNU/Linux
>  root@number:~#
>
>  I reproduced the build failure in an ARM64 Debian Trixie machine,
>  applying your patch to try again.

For the change to use PYTHON:
Reviewed-by: Ian Rogers <irogers@google.com>
I think we can fix the attribute test expectations separately.

Thanks,
Ian

>  - Arnaldo
