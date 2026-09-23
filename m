Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B22457E53
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149315; cv=pass; b=TpCtzN7B8Sa/NZ6y1Ujl5RId7B4I6zixAJIviu4qeXwXG9ceN/nCTESxdE520QrWZsSB/zDNJQctxxKUWwvMhV4IK7GG3KMrDrs35ATmJWnllzL6ALWnFRL5ruhej+6mOinnuTmSs5B+5Dq1R0dGEYCJmL1sj6BF0rFDOZdgfVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149315; c=relaxed/simple;
	bh=meb1bAvawCq/Ib8QpyVS9dzYsYkDPtpweSxQpaNTp0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvbgnNubXSJ+sdKsz52JYWPjXGvGm+YEaa1G3cvd0fgR4+JxdYfCD7cZCIZBgZQNTdmU8vwH/syiHXrr8Mw4I8eaLcXWaR+6JfRw4aE9AOSuGtqt4qw0SjJuBK3RYaOKcTPMbryOxBh1Yfnp9rHGBOG4jpTpZVg2VKmQTclCRx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W8mQfAi5; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W8mQfAi5"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53113d72966so136391cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790149305; cv=none;
        d=google.com; s=arc-20260327;
        b=jtmeRQHEYe0lJCFvMUElXeUqSEGt9YHyC0XOFyrmi7wNGn6McG4wAAvVJOAYa+5PAk
         MRGPSmsU2vfK/AHIUIdqI5PmptWeNNeNRW4gK1L7dgalp47AV/nPwHh2q1NL/7iUcUMr
         6ZdqIrg/U7sRkhDXJOb5kSJS8x9ErGcZeeqcUH11YSNyfxuCYN8FaYIQQNDM3EN3RtKW
         Y2dcVjD7kNMjgyozebd1yBrldrKDoczOIQiRzo5eNFAWSvkycXstGDPwiHrDLV0GF0JX
         X+GuTqntzQzCm/YqWlxAfiB7zChKeywLrC9HX+TC+p+U687+5NhV5JVFybotUpn118GS
         9wGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=meb1bAvawCq/Ib8QpyVS9dzYsYkDPtpweSxQpaNTp0U=;
        fh=B6d6er2DAVCQtknLjR/TJ27UsuHkvc41FpGXkQcPWac=;
        b=MODw0egdj1EX8migyLFO9EcfVEmtiUtDtR04PLumiH23F8aRjun8Ce3gTc6h+jAYaE
         HhyGIrD6c0MNThpTUe2ghbnViCWUrkf5qgvWsNEww5ME/GuA1m/T/V6Owr4e/MFdLXyF
         j0BpAFGk1mxmxTEse/+ra7t7GSNuqB+rM0Al62RGJ4ct+vLjE3gora7hWprjIfZDaC3W
         2JUgvtmnYL3eJaoOVGounX+LzSqj98IuT0Y+OREATgWVXEpYoXfDjpkoRQC7WmnEJ80h
         xWHxRYZhOh8s/ZTejCpFzPDM7TmR9sMrLL/isapm3o76zWMHYoUKLadNatZeWoOImbfQ
         Y7Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149305; x=1790754105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=meb1bAvawCq/Ib8QpyVS9dzYsYkDPtpweSxQpaNTp0U=;
        b=W8mQfAi5fknrVsqLQojpfMuUz7nqIsVD9eU8Q/KsRk9ncgzi1eD0ZgzLelurwrKXus
         7I5SHiSUa55RMsci2iURrYte/QzO+1Jueun0FR/jlb22+Yin1ODVKm5ezw7AKaBwVeTM
         DjuCY9kXxiX4cEqEaMSmlBdfSly8DDP9k3i4isA2hkP2HgVZO1RKntA72e1J0Q0aofPw
         wbFe/pgEDZjtkG0/C2SH4nDBbjnvgnQobDLYmlJ+8ofNHk5pz0vXHyjZnfU4jU9iV42i
         9+OmneFUQdEvZny0w41v9fXMemTiPqkW++GdrvU/97bvUQlN/SYeLJjGhJdZ33p4tqIn
         Ydvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149305; x=1790754105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meb1bAvawCq/Ib8QpyVS9dzYsYkDPtpweSxQpaNTp0U=;
        b=RKut4jkAELbWfTrvR57Dg9Ve1JenWaLcaCHoTwd7X5E5MRNm9EK/kUlXGoKjfLFc7u
         meUYCW8sHDHScY09ogKOIpPULkXBbZv75aID+cuPc/G95ofI0bZKkAJ1P6Jshba+aoKo
         NhPTtg+zYAmwbRWJ8SyhqwgHK5k6HpFO6oYEKO4BI/x60GB8GpkpvdKTdL7QmqE3JxvM
         E5qwNv7Yi6b7yHqzOQf0fS+KrrpaHg5FPkg/hjSyfD8tSO747/7ytGUCmRDt5pIaD5gP
         8wUamV59WcvL8Ny1ODVJRpXcYqe/H2pxSaE85HUkuIzT3ypwVSSznhMA1l1ZyhIkhTSl
         0avQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjzr3qz4/CMy2l9ko/apM4cdXwj9QuXw0bhp1nOqiUDbPPbjd0Ni25grXPlplGeg5uKpUpDY3q+fq0elk=@vger.kernel.org
X-Gm-Message-State: AFuF++nBFY47BS3XIHI1Qur37X3xxlEsjgVdis74rmqjYeb0qkL94BTe
	IXHS2R/diaqadJNdkAMOn/b8zNnYx0qy8AiVkYe6ZVcw1jNM759OZ7jzUocsGBqHHXPofyJJ4Y1
	7/MhM4hv+y8WblJLwpsxvWnXwMd4R4OAjwhmpdGij
X-Gm-Gg: AYBFou1RG/v+JGud9p7no3QxX6QWCBygIp9gLNogO6I85tKMmnVO5IuWrqUA6rdrOeX
	yy32s7GRCWHlpI0spKrSZDoDuJ/shR/KitTTizgTqN9GTQszxAOrruHajRbzDXkimSs3eQzBxiJ
	TORb6koyufSTRwNBNU9r0MaNUeYkVcHvg/EQqcLghniWSC/f+TUNsNUMzY+fYexsZ2zGedt0s0v
	3yHlpGpmSQQhUStzzeF3BVRECO83m3I8fHGDW4r3QKFvrbZPrVUOAJ+2mIfKs662WmW2HYBX2+k
	mWp1FyPTlmmSJYbWq3qD7jzxFCkvhKqnBit5oSoaVg1UAtG2fQh2Rfw=
X-Received: by 2002:ac8:7f43:0:b0:532:ad75:e432 with SMTP id
 d75a77b69052e-532ebc71886mr11204181cf.8.1790149304297; Wed, 23 Sep 2026
 00:41:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922215548.398541-1-chrismelnu@gmail.com>
In-Reply-To: <20260922215548.398541-1-chrismelnu@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 00:41:31 -0700
X-Gm-Features: AcwNN1VapWtcX2GGSDCIJrm4EXoEzaxFJtfKpxb1AM3c9K7F1JzWeyqMfOzL1aE
Message-ID: <CAP-5=fV0-yvc68BUSKoSajHjHY_A6COgbEJYiFxRg+G-8LeJhQ@mail.gmail.com>
Subject: Re: perf stat: worth documenting task-clock/cpu-clock in perf-stat.txt?
To: Christian Melendez <chrismelnu@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 2:56=E2=80=AFPM Christian Melendez <chrismelnu@gmai=
l.com> wrote:
>
> Hello Arnaldo,
>
> I'm learning performance engineering and ran into this while playing
> around with perf stat. perf-stat.txt's TIMINGS section explains "time
> elapsed" and "user"/"sys", but I couldn't find task-clock itself
> documented anywhere, even though it appears in the first command
> example, as the very first metric shown.
>
> This apparently came up unanswered on this list before, in 2013 and
> 2015 (2015: https://www.spinics.net/lists/linux-perf-users/msg02405.html)=
,
> where users asked about cpu-clock too, without anything ever being
> added to the docs. Would it be worth documenting task-clock/cpu-clock
> there? Happy to send a patch if so.

Extra documentation always sounds good to me. We added json
documentation for software events not long ago (it shows up in `perf
list`):
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/arch/common/common/software.json
There is also documentation of cpu-clock and task-clock in the
perf_event_open man page.

Thanks,
Ian

> Best regards,
> Christian
>
