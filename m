Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E2F48989F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592502; cv=pass; b=lqe5FqjV53bDM3LTpWzazez4cR+TCTwEMsgdOsDqPJLYY6f2eKlg2PhmE8RXKycOPOUbeJ9VJ0dEiGKI8SdJ5yx6MTs13EHabfH+x47SmlSpfIy/QvHK31QvAhlsSCg2iAN7xbKUp7ku+sv3Z7kA6pUZHph7DKfEkU7P6Ua6tbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592502; c=relaxed/simple;
	bh=sUo91pSuaQ2x0OPtDMUB+dNEhNgWYHB2Csjpd3LjUMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miBX5KpzvwTZB+P3lrRTr4TN5eMZ4I+0nTmnTgGMaVwJJWLcvQYx1z1KbMrRbT173bNRv13IxLlyvuIPi/MI2rqA+EL9CAfYuIpTu9iW7U+Ejsei/8mEXrOfHYUJfxJDk+Nyl2lXwNb06ohQBh5VyRNdU2EiKId3q0oFAE6Tllk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMCdmA9V; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMCdmA9V"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d07so2372570c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790592501; cv=none;
        d=google.com; s=arc-20260327;
        b=OdWc1EZOglpn07AKDDgDsV2ZSWIJ55UaEuuAv/tt/HZHiUvlBPdCsPrGm/sIq7Jhr3
         QN/4ZlATGBCgmBe58c8gQ9C44QwFUp5HOeYv5i1D51k0/pCU2FaKe5TpfxEYUHxboMKq
         JmdZBUVrexJx3x9Asp+UDnlljmjIANMWVCr/9jSGjIn5q705ycmP1qDEDcNrfckpuR9N
         ajXkmkv/16TcHZ2iYLnRvRPrvHfGztgrV4XOOuTYun+Fcbdw8Rkop+aH2p4WiM/wU3qC
         xQfsPPzt8xfR1LS5jn1G8iIuEAUcWl250Pp/iioXMfiZcgPUjvbA6xN03Q4+LPwgUG/S
         dezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Knqn5twxYaRHsXIbqCPfgf4Fy1uK557FouFumzF16VM=;
        fh=4WhjEDvAbAivkvuNLUghp3OQOWVe1z/ugNiXmFjJty8=;
        b=PB11mzOtMIoF344N+9WGJ0BBQxzNP4z11NEUicTzcbLWvBAU7/VrNyYZBduHfUnPz3
         5/tpESBrp/dhFwGDpY9t6c/3mjYv/MAsBYs820cu0r1zO3Qi20tiYJp4ufISBDP1TJ4Q
         HNFT0CkUClw+9feqwI2vKNfXHRb3ibodfZzxK9wpdSkVoFC6Uk0nOAtlCQlUwVEh3oQZ
         Y+eyB/bldCKBfJDlEHm/uIZcE5+/L1VX6o9PcxkNP4yLKJ61Vzi1EwaeQvVcbYAc73JL
         fp/oUiQBFnYD7xs/f5ZYMEVFro1XqzNP8pRc4jJaErKKTtpAMXSteBH0CmT5Fcmpqqg8
         /nhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790592501; x=1791197301; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Knqn5twxYaRHsXIbqCPfgf4Fy1uK557FouFumzF16VM=;
        b=rMCdmA9VrtP4W21yWmP8Fh5CYiKodP0o5VQQyVMurRGwWotZkJzS8tYD7lU3nFo5z0
         DgLvRMmOFcIH8GUG0ZK5vsaiZJNpu1u3R+EU8IwFO4iJfP995jprrryTr3Jaus8JzSFg
         iAYTDrICn8A2gX/1heSe5fptTaV3LR+ZD/4U8WbQjkmYDhnixNt4gPU15v0DbQNQF5OY
         OMQ4+pUoEaVL9iZEtftZreRiMt6EZkH4EAzIK8LpAjFuOSd7aezfCw5M1mBbeG9l6A89
         Krm2+suUSWNAKPksOnGO2sT28nNH6pyC5a5J3DADIGEPVwmf8zXOkzRwpbfYQzJgD7wl
         EGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592501; x=1791197301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Knqn5twxYaRHsXIbqCPfgf4Fy1uK557FouFumzF16VM=;
        b=xQjs9SaBuiwSSf7VONYFoeP8Xr8+KMR6X/H87jufLCXw2wqeWcq1mO5mqrzphtZx6z
         aOr4NeTOELaX1oiwf5AfpmBuKKMMfHQy+TthdtsT6UbpBNdrDBKnTuhNkWm2ktQXqmf6
         u43PAjKfyE2GVH3O+CnbUupcCfc3GEVfBTvRDiJOcNFOkjUrkjLeKvd+gbHriNedpk6+
         M5to5CsXhTZppz3rwobf8v1AEQydHIT7Zi1xuiBgw+bkSfzSr/0dbYYxuBgQ9N6bcESI
         oeVFY+/W21Qm+BDjYc3+rLtSZuZuyDfvw5oooKX57ORMkuXrDNuJ1UZ2EUgldWY8ftCs
         5Ftw==
X-Forwarded-Encrypted: i=1; AKwUvBwcfb3EA425rwsED7oQQ4elgMnoMTnn6AXagvmjvtQuGQgA7dS7DD+tQwaf4fy1WaccY1dsnBXgy5xKx2I=@vger.kernel.org
X-Gm-Message-State: AFuF++md/uDoHErqbjGnu3HMHqE0JcPP2eWZvvfIxcXn+iU4fM8ujmAW
	hSiLWUVryAGJAICvDe2FJ2hWWQjBNrvOL2EcC+Na8CnyDoZUHgBkpp7roOYoOyQ5+w4Ug0Yjjpq
	9l5fSqs7AMObNqP7cLqRudAywS4y1kPGC2pqDao9c
X-Gm-Gg: AYBFou1+BOubCSGriIUwHLVzQfL607+6eCfiHY48dp4vmItIEqFZmzrSt/fHchBmJ26
	oU58dlkxq8bh+w50RyAvowtxf5ucvreidhjiad4Vg3BYbDCswOrlR3JUV8GFTKskgcsJC6bRrFP
	WMaGKX9FF12kfS1C5nGwVOGdTdqJYYv/oopMw1FCto/LKeqxz1OB05FaRg7f/f/mQdhuYgbNOKh
	y9IoBuh5Z0fmShb11hLYyCsA6RMaDzKgODPBZNU17NQtk4KcsP7/c1GikV3+nx4VoCm4J0TaHFV
	C2PLyAZJm6I30YKjMYf2Z2xvrXD3y9cGB0Z/YcYd2ZMb/uAE5j+9Ae0K0q3E2YpjqMmI5Tlwa/7
	nvm8cMqNCl7U=
X-Received: by 2002:a05:7022:ea8b:b0:13f:c02f:60b1 with SMTP id
 a92af1059eb24-146ce67f53amr9443650c88.15.1790592499770; Mon, 28 Sep 2026
 03:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org> <20260926095405.56438-1-emmaonana18@gmail.com>
 <87o6dk3uwy.fsf@trenco.lwn.net> <c13f6823-a304-42e9-8876-5b8e8e3569f4@infradead.org>
In-Reply-To: <c13f6823-a304-42e9-8876-5b8e8e3569f4@infradead.org>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Sep 2026 12:47:42 +0200
X-Gm-Features: AclHuK-uVZla7B_L_aK897Glrjo5LeY8TZ8za-E08uwUhBk0Dyp5Zhwe5M8VU3I
Message-ID: <CANpmjNPE698Quk_+thwRf9kK_xnCQ5_CzaYHJW+dBM0iqXAwow@mail.gmail.com>
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct declaration
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>, bvanassche@acm.org, 
	peterz@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, mchehab@kernel.org, aleksandr.loktionov@intel.com, 
	kees@kernel.org, tudor.ambarus@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 20:41, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 9/26/26 8:16 AM, Jonathan Corbet wrote:
> > Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:
> >
> >>> +context_lock_struct(debugfs_cancellation);
> >>> ...
> >>> -context_lock_struct(debugfs_cancellation) {
> >>> +struct debugfs_cancellation {
> >>
> >> I still think the tool-side fix is the better route: `debugfs_cancellation`
> >> is the only one with a kernel-doc comment today, but the next comment
> >> added above any of the others would hit the same error, and we'd be
> >> fixing the same warning again.
> >>
> >> The part that really sold me on changing the tool was a general ordering
> >> issue in `dump_struct()`: unlike `dump_var()` and `dump_function()`, it
> >> applied the transforms only to the members after `split_struct_proto()`,
> >> so they could never repair the declaration line itself. Moving the
> >> transform earlier fixes that, and a full-tree A/B test removes the
> >> existing warning without adding any new ones.
> >>
> >> Would you and Marco prefer the tool-side fix, or should I respin with the
> >> `debugfs.h` change?
> >
> > I think that making the docs tools more robust, and avoiding the forcing
> > of code changes to make the tools happy, are good things, so I am
> > inclined to accept this change.
> >
> > Omokefe, I have to ask: did you write this patch yourself, or was there
> > LLM assistance as well?  In the latter case, it needs an Assisted-by
> > tag.
>
> While Bart's patch could work as a short-term/stopgap/workaround solution,
> I also prefer the longer term solution of fixing the tools.

Having more robust tools would be my preference, too. I'd like both
styles to be properly supported.

Acked-by: Marco Elver <elver@google.com>
