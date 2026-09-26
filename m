Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2E3A3821
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790413123; cv=pass; b=YMJiOrmXKgGoiBhz3IDH50y9LfL9jK1919M5WMnkdSQnIKRtZLDcyp3xVXuyqoFRSCBJNGzbKxhw0j8x1NLAEXEKm1skkWGcabZQgpR+R/u7vKlqepYRFh2L8jv6c4CjFAODXUlbgd2KlJxzsCdIBh6CijXXSGOkj03RHNf/X1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790413123; c=relaxed/simple;
	bh=OQCD4U8C6TSULpjCMi6zqQfbL1jDsjPO8gEeTcXQ9ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9+AyQIYT1yHQIKkFNnG26hMKTnTicyDwHdNP/tq5Waqj0S8o5jRtmihU7knO673tUWao6njYBSvFJYEkRS/8yRatds/hj15jQjuvr5TnIkfdgx3smplhyD6vfAXWsQzObuR0o47UK5D9gdGJnX6yavzPvepPvpGBt6sUE/LbEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSYTolPR; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSYTolPR"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso812718b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790413121; cv=none;
        d=google.com; s=arc-20260327;
        b=Jq2hDpMqoBclNqYLZNEEBmouJD84UThlkVK9BfyVsSRJO3OBVSo2TVKelFa8PKOl0X
         /Nly2fBKGWPQCbyCkXaI9Q89p0Ig8kwyCYxvbS17/43rrOiYGlCSkRgeMO6WfLNf59Z7
         h1KYoRx5gUmCMhsnFANJmapCnIHCyyZWoUstZXlPKd0SoDcA6iPplg9U4U2TchsG3owR
         tlPFYKZQGEaVRrz9MpeM6t6A59QjkkA3yLr6ifvD72SDtnIZ+t5uo1oCfiqzBu18OqN3
         6hbv+pTvkrN9dCrYwPc6+s56WbHMRP2Mxd0tVUCbQXTQeVB8LoYnCaqwLtMPmKkcs4U9
         v2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/L09o1VH6+wZLPxn4ggW0hajBAb5iNl9Iz95qERtT3M=;
        fh=Xex8301DFt44SswF80fE3/10o7PGXAWPT/Lf7O2Afi4=;
        b=pUuDW1FyKauaCWr0pWrdfCArYk5O7NNwh3d07VH5edrwAR6ExGLtQgbkGAnffHGicb
         FjgfCP1jWJYbF/fd6a3m7bPQJ2S8iKd+pBgJVZPrEGbhSE6SdVZZcaxhPr9cFVtE+yc9
         yWhaM4Z05tl1PEyF4YLBMTSfqUsPxAxDvY4GSLiZE7DoxsAt49/h+pj8fTe9JIhdnFq1
         pAeim1YwLcdMwXA3H22VHtn/4llgU763oOSdpSh6llxPf+j6hEsTHckNVwDqKpJUhzK8
         FPoJgDx4yyOAWaiN6F2n78SqPnTartnaPRwZbl1OsSJNtU6SnDWBJ6YPQpjTkkPIBOaO
         0SVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790413121; x=1791017921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/L09o1VH6+wZLPxn4ggW0hajBAb5iNl9Iz95qERtT3M=;
        b=CSYTolPRzgZlXug8nntuD1ZxxUI7cyA8q/h1dOoSB1wtzFHB/26be7YDhfhxClkn88
         rq6PxPmpGh8kxrnxM5xisoEVGOSRdNH5kQJDEgF3xU5iMcaRwsg/SlVNFSQkkjNtxaKY
         i7D6dH0uWDn9cPvHoJNYfNI/9WU2GqAdSW3VF83stEmDsMEA4vkTaaguvLNcE4wIG1ro
         TrqKxvV5saQ6Vqu38/n7wbaeHbMnmbYe5lzl6vbZ/c+L7wYRL/cbI1AoL38DoXFl2KrB
         J5d47rUT0q4vjPycTe/J2HPrpglt8Uk0J/FKJuOEEZTodsUuR8Shpp3cC8FaRdM9nBKI
         X+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413121; x=1791017921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L09o1VH6+wZLPxn4ggW0hajBAb5iNl9Iz95qERtT3M=;
        b=kev+Oidk7ahWuxzNqOvIxvAHV545czKjHzGCPP4HXCeLUtANCi2K2N2P1vp72DUdmN
         c/4e2LruHf8yBqOLYR9WPT7KL99NVUiZFlHlaf+Kq+NCmty+rdkU3CCdntid1QnFKIKp
         3dy9XRLFAk8LyvPlynzb99e5lCe7wI8980H45/olD4XuhTiCBlVzBb5HEmyiSZOu6kyA
         MDt8xUrabOdO9MJl48po/4NnpawWYzN8vhRkgwUDdydrBBQu+nXObQQYuJXVqH+PyYgW
         s0pMdmp873lHKtW7AbOGGLu2q/Hfhrj09Df7mGWaCYorwPLMTaDqyqkvn4oBWU0nBi1P
         IOAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJgpPeLG79SFWd0nOiC5vfmC33ntmgVPXlW3HQsTIZ0G/AjJgnY0p4GNcbKdllA84ewdTsI8wcREx8xW4=@vger.kernel.org
X-Gm-Message-State: AFuF++m0MYnk/O4RX6asIQat4+jwnQiAtmenfZemZWqLhz9dpRS5xN6/
	gpkeN/Mb1Zt8UCtn7gDS5JXXgKXGMItL3+Yf2JkJibhBXwFwvsMm6sLszGzd1xAYo0OZRvzUoiM
	MJ4GUen63j890LhurKLN3Xj3wRVNnlhszErhBVc8=
X-Gm-Gg: AYBFou0K4AFeFKc/kE7T0b+EyluQmf7992JZyhTA68lqs9yVOtoPVeRN7aoXHwqMUfz
	glnK7miGUnwpEefPWK7QoNyCmTZBwfe+q6U5m8iGeC9ilCb2ihklLaN8NJ6QnGAm9Ifldl4yHrH
	yTn15tVzqGeTecbuEoj0TSE4djzV20MF32xIOTNc8UEGcT99uj9vNnaNOl0e4Vjgz0bjreT6oRU
	a0SYUSkxGn6YrDMJLu6PHOJQU/y0fGRosLDOas7iTOG+2sw4/46KEyVc7ceqoUlyjQOWqiAAxhy
	lOcFA8gB+DJ+/kmEIaCP7e7WBNAAeOYYpBGu1aes9Nn+HUbIWVOx
X-Received: by 2002:a05:6a00:14c4:b0:878:3705:2513 with SMTP id
 d2e1a72fcca58-87e9dfafffbmr6515627b3a.51.1790413120991; Sat, 26 Sep 2026
 01:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHDTbUFX=8aAQnwv32hqmwHKkeJR0UA5XfZtMZRD1H+kV7uCzA@mail.gmail.com>
 <arZxz8rz6H6L99l4@hallyn.com>
In-Reply-To: <arZxz8rz6H6L99l4@hallyn.com>
From: =?UTF-8?B?5rSb56We6JG1?= <chengjna@gmail.com>
Date: Sat, 26 Sep 2026 16:58:30 +0800
X-Gm-Features: AclHuK-bOuJNx3l9TfFNHTrSM9DJ3Be_0lgB2lf05O-Hbf3wNGEnjS7yIL5dJN4
Message-ID: <CAHDTbUF=PmRfFHzmFnqhpwB7h1paL2DfMQMgFpdAEwUsVWzeWw@mail.gmail.com>
Subject: Re: [RFC] Proposal for a standard Competitive / Protected Session API
 in Linux
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for the reply. After thinking about it again, I realized
that my original proposal mixed up two different layers: the
competitive policy of a gaming platform, and the generic mechanisms
that the Linux kernel should provide.

I now think that a Competitive Mode / Competitive Session would be
better implemented by a distribution or gaming platform such as
SteamOS, rather than being defined directly by the Linux kernel.

For the Linux kernel itself, I think there may only be two generic
capabilities worth considering.

First, a unified and stable interface for userspace to obtain factual
information about the current security state of the system, such as
the boot chain, kernel integrity, module state, and other relevant
security properties.

Linux itself would not decide whether the system is "trusted". It
would only report the relevant facts.

SteamOS or another platform could then define its own Competitive
Profile based on those facts, and a game could decide whether it
accepts that profile.

Second, a unified Protected Process / Protected Process Group semantic.

The purpose would simply be to allow a process to request stronger
isolation from unrelated processes that might observe, read, modify,
debug, or otherwise interfere with its internal state.

This should not take ultimate control of the machine away from its
owner. The user should still be able to disable the protection, debug
the process, or modify their own system. The upper layer would simply
be able to determine that the protected state is no longer valid.

The resulting model could therefore be quite simple:

Linux Kernel:
- provide a unified interface for security-state information;
- provide a unified Protected Process primitive.

SteamOS / Game Platform:
- build a Competitive Session on top of those mechanisms;
- define its own competitive security policy.

Game:
- decide whether the current environment is acceptable for ranked or
competitive play.

For the ordinary competitive-gaming threat model I had in mind, I also
do not think it is necessary to immediately use a
confidential-computing environment such as SEV-SNP or TDX. That seems
more appropriate for a stronger threat model.

Thanks again for the feedback.

Serge E. Hallyn <serge@hallyn.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 21:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Sep 25, 2026 at 05:14:46PM +0800, =E6=B4=9B=E7=A5=9E=E8=91=B5 wro=
te:
> > Hello,
> >
> > I would like to propose an idea for a Linux API intended for
> > competitive games, online games, and potentially other applications
> > that require a high-integrity execution environment.
> >
> > Linux already provides a number of relevant security mechanisms,
> > including ptrace restrictions, process memory access controls, LSM,
> > Secure Boot, kernel lockdown, and kernel module signing.
> >
> > However, these mechanisms are currently exposed separately. A game
> > that wants to establish a trusted competitive environment may need to
> > detect and combine several different mechanisms on its own.
> >
> > I would like to ask whether it would make sense to provide a unified
> > Protected Session / Competitive Session API.
> >
> > The basic model could be relatively simple.
> >
> > When a game starts, it requests a protected session, for example:
> >
> > competitive_session_create(...)
> >
> > The kernel checks whether the current environment satisfies the
> > requested protection level and returns something similar to:
> >
> > ALLOWED: the environment satisfies the requested requirements;
> >
> > DENIED: the environment does not satisfy them, together with a
> > standardized reason.
> >
> > While the protected session is active, Linux would protect processes
> > belonging to that session from unauthorized interference.
> >
> > For example, depending on the selected protection level, this could
> > restrict other processes from:
> >
> > debugging or attaching to the protected process through ptrace;
> >
> > reading or modifying its process memory;
> >
> > obtaining sensitive information through /proc;
> >
> > using other kernel interfaces to observe or interfere with the
> > protected process.
> >
> > The exact interfaces covered by such a mechanism would of course need
> > further discussion.
> >
> > The game may explicitly terminate the protected session:
> >
> > competitive_session_close(...)
> >
> > Normal system behavior would then be restored.
> >
> > If the game crashes, is terminated, or the protected process exits,
> > the session should automatically be destroyed by the kernel.
> >
> > This would ensure that the system cannot accidentally remain in a
> > competitive/protected state if the application fails to shut down
> > cleanly.
> >
> > A major advantage of this model is that game developers would not need
> > broad permission to scan the user's system, inspect unrelated files,
> > or monitor every other application.
>
> Why would they need to do that anyway?  What are you protecting them
> from exactly?  Cheating?  Secret stealing?  Playing without a license?
>
> This sounds like us going out of our way to enable proprietary software
> to lock us down to protect their "rights" - DRM.
>
> I guess what you're promising us is that "this way you won't be forced
> to run crowdstrike and tenable and intune to be able to play these games"=
.
> But 1. I still prefer to say "then nobody *needs* to play these particula=
r
> games", and 2. I could just compile my own kernel with
> competitive_session_create() being a noop, so you'd still be digging
> around to make sure I didn't do that, right?
>
> > Instead, Linux itself would establish and enforce the protected environ=
ment.
> >
> > The game would only need to know:
> >
> > "Does the current system satisfy the requirements for this protected se=
ssion?"
> >
> > In other words, the API would provide a trusted execution environment
> > for the application rather than granting the application broader
> > system-monitoring privileges.
> >
> > A simplified lifecycle would look like this:
> >
> > Game starts
> > |
> > v
> > Request Protected Session
> > |
> > v
> > Linux checks the environment
> > |
> > v
> > ALLOWED / DENIED
> > |
> > v
> > Game enters competitive mode
> > |
> > v
> > Game exits or explicitly closes the session
> > |
> > v
> > Protected Session is automatically destroyed
> >
> > My main questions are:
> >
> > Does Linux already provide a unified interface with similar semantics?
>
> I think the closest you could come today is to run it in a
> confidential computing VM like SEV-SNP/TDX.
>
> > If not, would a Protected Session abstraction like this be worth
> > discussing as a generic userspace API?
>
> Possibly, but the first objection you'd have to overcome is that
> you are asking us to reduce our rights on the hardware and software
> that we own.  E.g. not being able to strace to figure out what is
> missing when the software isn't working - yuck.
>
> > Competitive gaming is the most obvious use case, but such a mechanism
> > could potentially also be useful for other applications that need
> > stronger protection of their process integrity or confidentiality, so
> > I do not think it necessarily needs to be designed as a game-specific
> > API.
> >
> > Thank you.
