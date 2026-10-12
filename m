Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A4B1990C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845221; cv=pass; b=Mq3PjhDxsSn0xIJT0/tfUAmVoTXMGNoKzEUyDjYXBp60o0LLeSsC6L8p//eCjG9S0+8s4BuZ7RLJCmio80GJmszsexjjoK5PVC1YeGPaD+z+PihafRuFXKKkVol2p8Asxq5JYMUQBOaZiDsr+lYlzf4clgi3yBfq8Utc/liBlFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845221; c=relaxed/simple;
	bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOHF5Z9s+g2eaOvNOAUoRkHH+RQYD8U397eo1Sj8PJhUkAIdryjrqzF80bxo1VoIMYiZudqm+3FqRQQ/hzqPdr2izAF2N7jel7loUNKWWO7UJag39305xZ4yDduVXJO3Blps2AMzlv+HPSiN+OKEq75fJMW5EAJcCJEY7Z6sqVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lhJ0/cwF; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lhJ0/cwF"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5337fa12431so578251cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791845217; cv=none;
        d=google.com; s=arc-20260327;
        b=G2R5647xgPFg2j37ipSsEYJzthfamK+jEn3dbI1f6rrWM5ZE3TJ0qHQIbCND7VYmvV
         rOFtv+wPy8MAnyMbn7X1DZLeJ04TUhNypQNnp+UhrKJ6WKJa/+81pOM0bGBoyStgYQbW
         Oq15CE5RO2x2pKg00lDGZne9KbPwgf/RHwglbN01RUdE5QUp3pOieWxzFMs0Y8055P76
         K6fD0/qsuXlIn/zEEJCeHnz0+nWLEOrjmN52F8PZIiOoyTzMDCuw0gRy4MUPOq+IXhox
         8DAcgjr5jz/4bhd25J4e5E+IvpA0AlP0N8e8cmyFNPGsfLCOTy3jyb9o14n7mvafDKzW
         n0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
        fh=BlYPQcftBFQu3948/6/1LE6GsMGcr0QQXEfMreT0zxM=;
        b=LvnY8jJWyftoIJjQ4GzTuOKn8etOsoOrQuM4zcdA2KLVwo4RDnDx5gX7G/B+ZbjXlf
         wIRCfbGnEKiSsr+hO6b6k1ThcYUzlZpzwE4Kcv3V8eT2j/JlvE/tyuaSDqnDPg5bfOms
         0NdOEyG9X4v5XjyajfXc2Vl5PhKJ3g1Zwq1mvXXGA19eDWWAAkvBAS5V1S+G73Y6iylq
         QbnS8MQQuZ6rmoA2T12xlSZmE7ny6tUW2Pn3xnPuqtIi5QciGP9oGdqib5nhfm2X+EPn
         iJ6b+GMbx8cA/u2nfqSoJecw7Sv6GIsHJh5EBv0BiSk5v6wCRcAHPhL1RJ5JhRdy9ydl
         SGqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791845217; x=1792450017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
        b=lhJ0/cwFdQWf/2bVpInNeLDhUOQEPN6t6y74mzPuTbwYM+UgFz6JtDLvGRy1rR6Jgl
         cu73rNvLL1FPRpVN16q0h7KmP9notVAbJJ2hiLzeXPiK4s9QiC1dw64NVWaDPIukNXad
         Mp7CrTjkpZnNcJ/Oefmkl43J6LpJx30Cv1w4je9ezMFE6uyBIeRNJsxlkqDmKYwk3rux
         kF9QeG5EdEjrls+fK1jM0ULhiNlIoPgJ1niF2AfPPct8HtbyXTeqZNOuemWLGKJ6Bkik
         e2VMVBBYYVmAhGBy2miI2ATfmR8VvoPoq0vWIhCPfGLQIm6pTK8+RHog+JYY82YeP0IE
         4q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791845217; x=1792450017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RhPTPbxOil0nNbcCTe++QZ3I591tZ3jVFSRYtTAyr8w=;
        b=DTallZY8plBRuz3rv6kifrzeUmuEGeA9keD/6rO5HssFUeCHJCFLg06FvZmCyA0g30
         I18qPbK+NEYr+LuxNyus5/I9O12eUUUG9k2NNnew1QRc4Nj6HLXyZsWiLrprLaUXenPS
         ONz2jrpUzJngTfUaFgrUMJVKdgBR8Lenu3K5nygwpo1Ug+nJYsS4U45KE+hF/yQppqUk
         64RKAJzOCRYeT1X0GbwAMWizG1yP86xxYWxSUNEaP2+BJMR/8qHdjoX+m4VPQhsfQL58
         9gdbmVnX4+jRv/QTnMInQMtcZMypDlC9uu6PrM9qYuBI8pyr0771wSF5JikS5te3patd
         yDGw==
X-Forwarded-Encrypted: i=1; AKwUvBykX3zZviXCJbiudrnlz0Ulk4Aka5GvUpWMC6N0jSQOd5vW5Zcz6ZE4jZNbfc16L/rQC4lnCQNEoUfazF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZZpYHSg2LC4rSnhCIt+sEpJW/tGRMgRSz+dlDjtUR7wa3kuvp
	I8T8ASyvkWk+tfNv3Cfj2Dx7hsquC94Dp6/3BsCNq7mErdvnaqSGo0XDn668BVB2tebw74mCXib
	49z7arMJ3UZ9aEaa/QzfhZL7KF0NbAboXB/4jyJPV
X-Gm-Gg: AYBFou3kBcQYSr75noqAsdgIiR0p5C1NGeH0lklXoPJkYjOiaSNwxFCBNBS8eGnooul
	r+Wyg1xL6DbOqJZFbqoRJX57peATUUXjp1YRHIyLGaJAXN0ssnLRYJn817PfbhVHpF56CfkfJy1
	l6b8vRnbZY650aAFXZLdpj2ZUXS2BfHyrKrRJsNzKfgxXPnin3mvdYJSm+Tjrubff4J39vv4BwC
	U7mUUKe9LqneHfnBDdXF2mh/L5pGSna7FWOjYwJx7YhI58mrTip3sj38W8oFPgRaisoqEBvZVG3
	dhxTNPG60hct3Lwz/HJreeYZwi0gbim2GYkxVRUdEE27V8k3WWKzh4pshG9Wk5mTsdWA2ITTbxR
	uHjJdvu5dokW9okXwXVwI
X-Received: by 2002:a05:622a:1ba0:b0:534:313:9b4e with SMTP id
 d75a77b69052e-535b321298dmr38673911cf.5.1791845216797; Mon, 12 Oct 2026
 15:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
 <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
 <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
 <CAP-5=fXFYbuV9MtJsVX5hUPKDOxcjtNTHM4-qR7Q+ncsPq59UQ@mail.gmail.com> <CA+=Fv5QHzus2HUPJNFeWMCFSrOjvr8xhkPie2CLSbdjgK=+j8g@mail.gmail.com>
In-Reply-To: <CA+=Fv5QHzus2HUPJNFeWMCFSrOjvr8xhkPie2CLSbdjgK=+j8g@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 15:46:45 -0700
X-Gm-Features: AclHuK-ozzc1SZ1dDdK3H95QIDfp6Kr1nmKiVr9Y7a1gGwdz5GDz1Mrtu83sdx8
Message-ID: <CAP-5=fUk=me0TYTyyHojzrGzW2ZF2Jyu14QezdjdN=Z=siwmrQ@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:38=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Hi Ian,
>
> On Mon, Oct 12, 2026 at 11:45=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > On Mon, Oct 12, 2026 at 2:41=E2=80=AFPM Magnus Lindholm <linmag7@gmail.=
com> wrote:
> > >
> > > Hi again,
> > >
> > > On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmai=
l.com> wrote:
> > > > > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > > > > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Matt Turner <mattst88@gmail.com>
> > > > >
> > > >
> > > > Thanks for doing this!
> > > >
> > > > Register selection, recording, decoding and user stack dumps tested
> > > > on my ES40. End-to-end DWARF unwinding remains unverified because t=
he
> > > > installed elfutils 0.195 lacks Alpha unwinding support.
> > > >
> > > > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> > >
> > > I just pulled your elfutils patches and ran some more tests.
> > > With your elfutils patches, DWARF unwinding now works on my ES40.
> > > Both existing and fresh perf recordings recovered the expected
> > > leaf -> middle -> outer -> main call chain.
> > >
> > > As documented, samples whose CFA depends on r15 stopped at the
> > > sampled frame, since r15 is unavailable. Tested-by tag already given
> > > to this series.
> >
> > I'm finding this fantastic and exciting to follow! Being greedy, does
> > the cross-platform DWARF unwinding work? perf record on an alpha and
> > perf report on, say, an x86. It would in no way block this work, but
> > I'm keen to check Matt/I wired this up properly :-)
> >
>
> Tested recording on the ES40 and reporting on x86-64 with patched
> perf and elfutils. I hit an existing offline architecture-detection
> issue in my for-next-based perf tree: it selected x86 registers for
> the Alpha samples.
>
> After two local corrections, both perf report and perf script
> recovered identical seven-frame chains for all 391 optimized samples.
> The r15-dependent workload stopped at the leaf, just as on Alpha.
>
> Both issues predate Matt's patch in this tree. The places to look
> are machines__init() in tools/perf/util/machine.c, where the host's
> machines pointer is left unset, and thread__e_machine_endian() in
> tools/perf/util/thread.c, where the session->data check for is_live
> appears, to me, inverted?
>
> Locally, setting machines->host.machines =3D machines and changing
> is_live =3D !!session->data to is_live =3D !session->data resolved this.
> These changes still need broader review, but the Alpha cross-platform
> unwinding itself looks good.

That's great news! I think the is_live issue was addressed here:
https://lore.kernel.org/linux-perf-users/20260905-perf-alpha-annotate-v1-1-=
97380433ccb6@gmail.com/
and the machines issue maybe in:
https://lore.kernel.org/linux-perf-users/20260918062620.2145220-1-irogers@g=
oogle.com/
Both these fixes are already queued up in perf-tools-next:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/

Thanks!
Ian

> Thanks,
> Magnus
