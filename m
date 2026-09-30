Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969EE50EBE8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803112; cv=pass; b=f00m6ZgyVnX6u7UZEzgYNrFGk/yrgyxj675tMeHVBmwIwsLYDe9OOUaQSj4oUmx05oerUcjELToztGOCXgy9TD8ZSbRnohAy7ciKJaHD1eWMmsKrnPpJ5YgwVKvvUdeXJqIQRUrfT0BxeuUT+VbAvI+lkg57z7gR37w3eYjx3Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803112; c=relaxed/simple;
	bh=vYDu3pNyo3OsJO6d/O3VZzLmE3IFiIY0WZiaLgZfM1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YE2nxN3Y4/d+gj5i0PIWeWvMRXor092RqEggfy2jR+vwchYYQoCnXa8Nu6rvgpsoA3t4KNfg0FMQBdx8bh8j3kbp24uqCexAaNfzAww2LhhwH5R8kFJ5Hpn0Sz5Zm8Pw/rRigQPsqTrFaOCRVC7iMjFFCYnApmVHEaa3PHe9R9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DgXAvxNw; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DgXAvxNw"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337fa12431so41321cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790803109; cv=none;
        d=google.com; s=arc-20260327;
        b=hKbLDVLeWd2uUKM0gHegOV1VU2vNsFwiDSyBmZzj7SPUtzk9pKfPuLhVuIE1MEMFD8
         4oWPPTySzMgPwwjIZvnNAyAIHFul3B1M6bFKpUd7Oc9Q5HHplcZjg0NcF3jFOzYsMTb/
         redsA0ltfCFxpnANnikX17u2R2FtYmiqIJRMeMWj+vaE3ApWmZfo7UgHlPJgUixgu0sp
         pMhXk8UlnuE5yoNo4Enzh9otuEfVVUWn5cYSp/9ATK90P9TtNtvmWlIYVZkjNMqS5V1G
         uBv0An/98+XeFnOqFr5Sut2L9xD5iK9KJK155H/3V4pidL0gapKVJ/+j80JeYZ7tEZAp
         NKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYDu3pNyo3OsJO6d/O3VZzLmE3IFiIY0WZiaLgZfM1A=;
        fh=fWiuKgC5XE4GznvkcA+MLrwCNw6wyJFYlnNw9JECBQ8=;
        b=BUxClXqWS45tE8dzTXcTDYxxtyl72F9yaSiw7ohNjG22DBE7L/gqigTGGINYorutHz
         KnTw6rgnK/myWFkOossw0cNzUTLxlQrMztilSE/uQHnKc2mFkIHxQT5tnjO8dyyxjeH7
         +5T7peJFyTbGn2c9235pNknau/H1q1Zest7QDZ6RAzO4Pdm6q/SoDXhePJjB9mlIxR5f
         25KueXJh6ajqZfzqBDQ/pDBVIgOnEhqUoDX/DY512pz39xyuikNijIy8bIzTsb9Shw92
         BufzJ+/2QbzsxCYjA+iZQTj56kVOow/rayMTcQZnOOt0TJ+eX91iKye4k5Aaoqa1NEiL
         TjDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803109; x=1791407909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYDu3pNyo3OsJO6d/O3VZzLmE3IFiIY0WZiaLgZfM1A=;
        b=DgXAvxNwpjgbBAVR/Trl/MZChuX8vXrK3OsduT8DWjLH1kWyM7QAaPKYuaxITun4mJ
         hUzutYsLbusolmI53XJ5z96XbU5C5u0IVQkAw4HLjjnzkvFmbJ5RTJ3kfbviLblcKRdg
         ZS5ig27mbcMosN/uHlRARxOYup13L+GjJjB8RU2qFwxNu8QIpUGkA3yuT/LuriAlo7Cs
         o4MdYkX4PQ4pn5sjqI7BO/xXID4Yt+ZebKdy38WvCNyxAUjOyU8Bxx1IYwMXAw+QUzBY
         gAqXgCH5f/EsTa1uRitPAbcVPVTWz7nIYKwDVwwx3cdKDjcgiDiRaSO2VfO6Q9LQrTGE
         jfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803109; x=1791407909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYDu3pNyo3OsJO6d/O3VZzLmE3IFiIY0WZiaLgZfM1A=;
        b=VspQRy0xkXR5s7OfyX4/7/uxNj1Kf6QARhzkI4wuK9VY0BGf62NAhLuhnnqnSuW8ku
         /Jb8NyMFIQLuUqcCYtDmaAgCouYD2rHMv/QH9a1WlO5RR1RYI12pnZq2xd+Zl/mYlWZo
         EUvS37KU/8JswfYQhVfJf/X0jbl990bhb5vKKsyWsxwcojfDg5FyyL6JulF5Tni66/FS
         A6qX/xGtyrQfgz4gOH++IZ7r/0SVHVLKCrGH1ZvwSEayW1Ls9xDL1FZDxmmTCcY/gVvW
         qr8lQPpZPnlL0s4xhvo+xi9vILxaSdQH47KRlmAaNzNA4ivqdC8toZ658ZwMvfIQH291
         0tlQ==
X-Forwarded-Encrypted: i=1; AKwUvByDhVTjwJX6VIVsKAykrrIkZpmpv1eVWbhpTNphG3nycnyQ+0CAkbcoNuprEwpghfjnrGbywMP0KO6uUz0=@vger.kernel.org
X-Gm-Message-State: AFuF++nS9v0ds8oBN6YdFniv5aAwv2FFxu7JuorFdIXXbRClnCr2bzIc
	BUpD0dbWjko49pw1CsHyi4sPHPGYhcIDF27qpuPiW0xir9+rnS6JwvS5hG8t6hk16f1DD8Gj+NN
	3Alx9a3Ac1nWrr2uNMfrPipAXZcSp1rWpJM271i5J
X-Gm-Gg: AYBFou0qvNOlDepy7lWN/ejiJVftGqwXq8wRShDSzMVBjL+b+u9v7YE+o8Vpo+cyi78
	W9m6a9g+pioEdFqAuzOfhEKselnijvsGqhwJCTzJcvc1rbo8wFjneel9N4zfsbwF/69WOqn7SBJ
	WtiXkacSuDqORySB+Fibvkyhqnw1+4WC6Bmp7nNC9j2SqtU21wpsbFCFw4jTWhm6zZ42yuCtz6S
	0a9ToD/i7ItMlbpSvDXD0PZI45/ywaMneU+ME4CcCw3GsLYaYBdDzMPutWvLoJgWPjdt8OKTCUg
	YnlhqkXkOLTF/9PC3BxujkqekumBLYGT2HQztKEtRL5q8Sy48Gm/SjCcuOayxjPgbMZAIOI0/Sk
	1k581WaxM
X-Received: by 2002:a05:622a:4a8e:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-533845a5bf8mr4298921cf.10.1790803108578; Wed, 30 Sep 2026
 14:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
 <CAP-5=fWLp5c9HYZ6oTsfPhWprz3uMTT=mt3M-OVu8GEjzSpEww@mail.gmail.com>
 <CA+w=M=Tdyt=s9FTvDH_4ozk_1MM09J6xTdLrsq-WNhQ1S+ACXQ@mail.gmail.com>
 <CAP-5=fWMF=HrQwBObz1ryc7e+=0iJAwT=QSa0neYT73xCfqAjg@mail.gmail.com> <CA+w=M=TP=uMcYd2SEG0NvZ=2uLNKD8kekAEVsrBjPKGTTn_9XA@mail.gmail.com>
In-Reply-To: <CA+w=M=TP=uMcYd2SEG0NvZ=2uLNKD8kekAEVsrBjPKGTTn_9XA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Sep 2026 14:18:16 -0700
X-Gm-Features: AclHuK_kvMYvEXpI-wbQi_zZJPOlW9oCccx2FoYTlhFSxpCnDIAcYTOGRSeSQN8
Message-ID: <CAP-5=fUhS2n2MFoiSFp2GKBRR--bYwc_30hSFx-t27BL-JzHkw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] perf script: Bounded and lazy symbol loading
To: Alireza Haghdoost <haghdoost@uber.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:58=E2=80=AFPM Alireza Haghdoost <haghdoost@uber.=
com> wrote:
>
> On Fri, Sep 25, 2026 at 2:56=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > So, I'm pretty against the complexity of dealing with symbols that may
> > fail due to a memory pressure issue.
>
>
> Hi Ian,
>
> That was aimed at --max-symbol-bytes. I'll drop it in v4.
>
> Following the other thread [1], it looks like we agree that lazy loading =
is
> worth having on its own. Whether or not the reference-counting series
> lands, loading a name only when a sample needs it is a good change. As
> in the numbers I posted there, it cuts memory use substantially and
> makes perf script faster. I'll prepare v4 of this series without the
> cap:
>
> 1. the ELF_C_READ_MMAP fix
> 2. reading DSO data from the debug file the symbol table came from
> 3. the shared duplicate-symbol selection
> 4. --lazy-load-symbols
> 5. the lazy-loading tests
>
> Patches 2 and 3 stay because lazy loading needs them, and Namhyung
> asked for them.
>
> Namhyung, on that thread you suggested a limit that prints an offset
> when the name is not loaded. I said I could do that for the byte cap
> in v4. I'd rather land lazy loading first and add that limit later if
> there is a need or interest.
>
> [1] https://lore.kernel.org/all/20260928075237.3055101-1-irogers@google.c=
om/

I agree with what you are saying. Without `--max-symbol-bytes`, I
think your series is good. I'm unsure about the symbol changes if
we're not embedding the name anymore; it sounds complex and possibly
brittle, but I got distracted by the max-symbol thing and lost focus
on that part of the change. I am still working on a v2 patch series,
but I'm using a slower but hopefully better AI agent. I've been
unhappy with the shrinking then causing reloading, then causing
shrinking and so-on, when running perf top. We should be able to do
better. I've also added back into my series a patch I dropped a while
ago where missing line maps could trigger useless execution of
addr2line and a lot of wasted time:
https://lore.kernel.org/linux-perf-users/20260824062841.1529489-3-irogers@g=
oogle.com/

If you post a v4 I'm happy to review it. You know where I'm coming
from with reference counting and shrinking, so hopefully all the work
can complement each other and reduce memory usage. Perhaps put the
less controversial patches first so they can be merged and not get
blocked by a discussion on a later patch.

Thanks,
Ian

> Thanks,
> Alireza
