Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE5F37F320
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842247; cv=pass; b=tZCWsXgvvuZzyJM+PUR9PkN1r3XlWUEoghZ4XnkZE4bxNnojLwiLrB9VtmSwA+ByhirhEpffgj/APOOv9oqZcyt8Vi/HHStYYKN+70I7MwMZJBdU2bCYBphjHv83CM5D/fEe0hyqBxpivcKhzekgni87HsbPSw2aTz5oLtq4o/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842247; c=relaxed/simple;
	bh=77D6s9s+jsNDn7chkK8TqOJckNVj5ac1PYAeMd2MXCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHc0Ao04EXWBJaQA6AC5p7fB/b3P5JIk6XDy7w1ar4wkiPNTILqGg8lga04yiRbzndBa+TxkIY22b1CwQy+MRc6EviyiV6ZsEWEYdjk6bWvZKGbBUo0zzfU5NDag+u0trepG+s+gs78bHNGK6Ah/M9TcU/5u2d83GOyqtm5LavQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXnK6SWc; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXnK6SWc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5337c7b9937so544451cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842242; cv=none;
        d=google.com; s=arc-20260327;
        b=HhBGllvn1NaHIyLTZdW7gHZAVdLJltTgf2L9ahZ1g7uwqA7NenIQaUbvZ1Zp+tcFRc
         K0vaBNWlExMj5lUPF9/O+vyo5A4XOSlKOCcKBqwnXAUHjH3am8mYfSL4/2tp6ffAvWLB
         xcFMck8Wr2npdgRkNlPeHcqzJlqhSf7x4+lwchKS0BHKoaJhS9AB3z3OUz+gaNnq8ba2
         ogbQhx0b8pFOX2++6Xvk0qkBEbDHfGdemLcNBfAJBZEbQb+/RGz9+WINOiqYHAewqJSG
         uOM4gCW2lkDM/sMNOSKyI+Iso03hPAVm3vUWE9+JN0kSRBFVlR48b0mDqOP+seyDh4tu
         v2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ehQxFvZATNgrzjzCw6uWnISjlL6Y3isyt66JatobNHM=;
        fh=PHGruySD5/1+y31tntwHIXWb0mO23mMvum8zash9/Hs=;
        b=cobqoGIj7kV74SGlbXZkdT0HCzOg1Q58NgHdUo4ZQgLPDyRbw2Ts3WXfpCkFk+ebRa
         SY0bacMYIrlrtdYbmEuXJ+Y7DgcOrXeGfqkMXAdhzhETX67eTHU8WsTOv0Yb5naNWW+0
         Vsdi9HfxpGIWeF3WC13i1y4gaWRfxZIeGCZssWoyuOxyWBbEjWSgbPpvhtkGkSNZv5+i
         RhPSOFkPBdQxr/J50myYxenson/BmcvMrsUEKlciyX+Ki4465yHXSSJan1yeZxddnTYF
         RqD2otbl8jp30vvxMWDjCNZ/rN9cV0zYOLZv5VaS5748q6mBKJ0yfMc+EbNBFS/jqeKU
         Cfrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842242; x=1792447042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehQxFvZATNgrzjzCw6uWnISjlL6Y3isyt66JatobNHM=;
        b=tXnK6SWcXvRfX2cH3vug89ONbtcVDpeVLnWfBKw4OP+Jmzj3R+rZjc64Lir00bCEg/
         m85jLsVxAPOcO5HVHrfyUrgJ+ORDnGng2/AMcgUZ6/vDwsvWwXJnh5o3s+HZhtWhGsiQ
         C9lRFUvPBNxGqlnEZ4wCAqnYJ2dSEyPFzJHTnw8wNoPKqRWV/G3ACQLnw6I+9CNJQeiv
         2Xm2CFqDENP/YysNlo9Ma1elzujnEOARQyIogOpztv0vzkzMa976gVTs8er1m+wQVWlB
         8pKEc8WSo5s5APmRLpJxOZ20G2cRzFPXlXqbGc1+yml0oMgwtcOTtzmJm1bsO9eRYlDM
         ZVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842242; x=1792447042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehQxFvZATNgrzjzCw6uWnISjlL6Y3isyt66JatobNHM=;
        b=Oj4En+gw2iwSnN0XLjle40O3mLNLZ7LHDQ4vxerRb9f4M7Q31177dXUd3ar6JD0Bho
         Py3Isw2Kls34BYPCtl1CRl2hH7eXDsR1BfFZrdVMFiGExOeeKAC9GvqEZ6lKsQe57KuD
         uQ/rciziyiPeLcjqCNXyoIfjl8YDbUCZZo/BDB22pcSH+KXUyKNPNE+rpIt22WHH/FJw
         p+eODj54N3DqLAGop0grLr/pq489FeEyhrMjRaRrr0CKjhahcT6TySqVNDjGFTxlBysf
         4ktJS2w01TMOvHZjzHuztOPUdbhl83bPoNA6LJMHJi9ELv+rkXBs2izw29TgLB5jauN4
         9WjA==
X-Forwarded-Encrypted: i=1; AKwUvBxwkCASK1y+zd1Pzin0rf65sS6slijI0fE2uRsYoJyYN8nJ98F63B+De2PjblIkVEHzNCmjPk29uMfvtr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwbgpePLapgwbwOw1qbIZYl9EmFXSbkxMp/NjcW8IyY6FJHLDI
	k18NsNNwnc8iUMymmhpeU9RaPxlJLcKYUV0gxnY/PRuqtu7BRVYp8o1ica/qQYj7Z/7Qv61VM7J
	eOKSWceE+J0wSY+6NoUbqqhRa0D6NPuPEHJaABFK3fZ0CTHVcTuzcIgXy
X-Gm-Gg: AYBFou0wr1mNn1nR0fudTr6amAZKWwoIA35jybSvzR+AJwC97hzTSe1cc9x+/KsPGpk
	IhCGbdlFHVcSRyseyrIyiLlowsyB3yu/ft3hc8pqaQLYYlw3RB7qFz6P6BKSWFhaXp1y+ozxlj2
	mwv8YSf+NepCF7KD7aWJW176cRIwCbi2jlqc9vIXFGfWYw2YKbHyIDoZ/th6vaUCn/k5H1n0gSz
	i3vYRWgC6qEfji61vVdUwnErU9SRGyx0AtVIPN5Ssy+6dJxxkBajftNARBIdD0C6fNrNbOq9Ww6
	52l8Ae3e11ip32ymZSckcwoLVEwryVX2SqinxFjmFv68ViySMwhb3hFBVDhz0dhDqURSYJDM7nu
	Hmz+WaszxSQ==
X-Received: by 2002:a05:622a:1ba0:b0:534:313:9b4e with SMTP id
 d75a77b69052e-535b321298dmr37938601cf.5.1791842241862; Mon, 12 Oct 2026
 14:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929011837.4157334-1-irogers@google.com> <20260929025345.88829-1-irogers@google.com>
 <asQoWrGYmM-lGx5G@google.com>
In-Reply-To: <asQoWrGYmM-lGx5G@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:57:09 -0700
X-Gm-Features: AclHuK_ybq9gU44rwx4KLDqmYiNpgPWTmX98N4vk2I0ttWfcqLOVXmnn0LnyrzY
Message-ID: <CAP-5=fXsJG1AvkcvKg5abGFD5sEh2hs_KAfDnTohZV5-33TV+w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] perf test: Add per-test timeout support
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, leo.yan@arm.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 3:44=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Mon, Sep 28, 2026 at 07:53:44PM -0700, Ian Rogers wrote:
> > When a test hangs in 'perf test', the entire test run hangs and makes i=
t
> > difficult to inspect output from other tests.
> >
> > Add a new TEST_TIMEOUT result category and a per-test timeout (default
> > 60 seconds, configurable via '-t'/'--timeout', with 0 to disable). When
> > '-F' ('--dont-fork') is specified, timeouts are disabled.
> >
> > To enforce the timeout:
> > - Place each forked test child into its own process group via
> >   setpgid(0, 0) in the child and setpgid(pid, pid) in the parent so any
> >   subprocesses spawned by shell or workload tests can be terminated
> >   together.
> > - Arm an ITIMER_REAL periodic timer with a SIGALRM handler (using
> >   SA_RESTART so /proc status reads in check_if_command_finished() are
> >   not interrupted by EINTR while poll()/usleep() waits still wake up).
>
> Do we really need this timer?  I think poll() already has a timeout so
> it'll wake up on every 100 msec anyway?

Agreed and that avoids async/signal issues. I will fix this in v4.

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> > - Check elapsed child runtimes against test_timeout in finish_test() an=
d
> >   finish_tests_parallel(), sending SIGTERM first and escalating to
> >   SIGKILL after 1 second if the child process group has not exited.
> > - Report timed out tests in red ('TIMEOUT!'), track and display them in
> >   the test summary, and emit '<error message=3D"TIMEOUT" type=3D"timeou=
t">'
> >   counted under the 'errors' attribute in JUnit XML output.
> > - Document '-t'/'--timeout' and '-F'/'--dont-fork' in perf-test.txt.
> >
> > Assisted-by: Antigravity:gemini-3.1-pro
> > Signed-off-by: Ian Rogers <irogers@google.com>
