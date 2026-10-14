Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865444999F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013892; cv=pass; b=IkVc/p8cwmYIccnU93vjCOxfHU0mz/8A4NzFJYGCNTcwC/n1HU4BnttmKJJLorfzwSumvRiAmZOo24VlLt5u6oCb0Lpxp+TmNG/P+VxwL4qKRXwcQHwjqI834bVNlFrieJ2BSEHQZr1/l+5SxMpNiJ4qa8VZCA0gYD6g6xVDWig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013892; c=relaxed/simple;
	bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj1nBZeq+VoH8RB5k3kqwYnUwto7IhVFLoNbjWTuMhs47PSzJBwOnPa8i6q1OGysEoAc2TV8eVYoZox5Ip5xNqSsbRXzOSNGLWFEYUF+ZJxuV5D2Yza5DRhUNRXMVG+EEGQKb4QUSg0xpC0I+Ay8Uk3q/v6sdjSVo1ND8JskhEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGTX0rAd; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGTX0rAd"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bb5afa736so559985eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013890; cv=none;
        d=google.com; s=arc-20260327;
        b=Jg5h2Z1fLwjakqu8rZw0bdZ/x08O0jinZr3xr+JkJoN2M6dJVszu/zLEeVkhafP9Tt
         KWG1HbJtWcEhG9Wtaqfx3dFaRzRHPaUfmbLGnT6/MErfRMdy54mNy/j/W6rATS1Xqzp4
         FRIm2CXQkbj1SeQ/52xjNKQaN06WyYszG6kpLgCcBbCk4TAsHJ3pJj1hDQUeHHXnHc31
         t/gCMKM4ubwBtnMGnrUCItEAY+iEYslaiXe+HJQjPsar7jOmemyzYLpFKsEKS+dbS78e
         TFAUaS7YmxFLF9x55PPGHrCpmJ3PahFSIezWVK+6R4bBWtZXXYVqK+xS8ESGDdiGKyCJ
         ro1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        fh=pkmdG25yQTJ/nUZTDUqXhTkyGArSy0nRB7JuenXQ520=;
        b=AMtozlnAgGDRczzVrKIU1q/Q3CLAKeuOq98DwiQSfiEIf/d57yH/ZchbjdJqGiI+RH
         hIAytYLDMrK6RKxi2EKEOm3d8Kyqd5fjQrAOmmUqU6O4O/gR7epME+Iwh0ehfRL0/7Bl
         K66eJVEXKggJQcvZpfveA6V6Z/RHuJPdakUwP1n99etJ4w9mMZjU7/pQtYZC2rtv7JND
         zSw/LPjqW6jOP78+WMOm3nmut1ArtHq8pTV71MbRek/JZ5dFQUOTlp86uY4RxDZxbR0I
         ZLKMvgtXYE77+BzKwJZhs8SELSksG7/YM8AwII2xZq+5geP7VzJqFNIpR8tSAziiWF0H
         3pHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792013890; x=1792618690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        b=hGTX0rAdLrHkQZaD2CeBaZKsVbVF2IkLrZRo1HfoeIVqYfX676cT4xfAvr13VPkyhK
         sRPwCWgqD4GMtK6r1i14dwVNSJwU/pfvsHlWDQ9VhSNb5JFwd9/Ms7rurJ9AVVkWpBU/
         xXCtaoz4XFOSsDot9tkzsV4tr5s9pdQDXKtmIa8KD9XrYz/tfH38lcBx3cXGQPCgswMC
         PfJWnWRjq4RIeMmzJF2zJ2PapE7g6TF43Mf3pN57dx62sg0QCrNuNlrX592M6ktYxwMG
         wLBIgW3KNJc/JGkgeUw3o++Yvk8R4hHN/aypJtUQFUdovlmvgR/w7g6tAR0tG4udjVC4
         ifBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013890; x=1792618690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIMe7cm+aeq0QgaGLv7REq10S4I0iNcdx9I6hnFrFPQ=;
        b=ntPl95ygdNgYPPrM7uJAojlZ3rIv0ZSxOshP7qfD3BuHKg0oSMray9Qt+eBbqHR+x3
         O7lI4O20qUmnyajLIlcx5blUvnz/qFjfZXZ2vDRXhjiBySTU7e2ZzX3b3CuxPt+sXc9X
         4G11CpGJpbkXsM7/h3qs4jzfIxF3cnAs5uxzcC8UuwM1eC7DtSokM0CULR9lKxUTm+hV
         nO1nrfVqWec4iQ7KfQ4J0nyxDsHDzuk016YXGjJ0G4PgkrhZ7DZRPosMY9F38QhN+C0A
         HtKIn3v8E+kpgms6CCAlPTdOpMrP5iU+LkAJoz3oeydfWaI2HlI2KqQyQujLjOY/DIEb
         oEeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS0Pghu3o0ZQh0usBp+949olKTolAiLevYSYIAexD5n2jK/otxz4JSzb4LbNsAhAsDAHMamTnp/hrrU4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRXOgiHw4KrO976pkMbziEqvAEhJZX64sRTPH1nQzpSBKlrqIk
	wRm1xxBbqOHMyRPHROU7YkvNuywkRqRKg3N12Gfi4JZ9seSCn2woMxmOIwow76sGZbYeZIt+Jyt
	uGlIs/fsm/fHC7XSD3neVwUPGlCM9KEU=
X-Gm-Gg: AYBFou0ckjK5CzUL7wm2Z9wVsfR9X8XM334Ez5X+KlS5gkiqgdpZCmniY3klvkySewS
	PaqJRsvNQDtQLQGpPndxcKa7S0/B6r5/6bRR6PEkO63pDtfNPoudYWs9E7iJzYAXjfy3U/EC2Ng
	WWywsR0S3ISMukK8dxY1pxU8upT+Fafr+GKS96zSzj9iKkP+NdBluIlkjF/WH2dsuJFON0OvgcL
	A51HWH6h13J+sIvVLxdv3TmdYbXI0UGUNOa7LJ8DPZqzVvAH0Oh4cxrbXiaXfNd46Lc2WEb2ORf
	7QNNGChTrSQHbcWhgrfiCrhCZ4D4n1pu2MRChxn7f7yhMS/Jm6euznWb+y9yAIpk2W4BS5mx5xK
	QEI2zC6sx1DQSmg1etChT8wIOI2ld8k43xu7fXBrkjxfT/8bucI1SbiehD18Ub6eZ69ybyzzk3x
	bQBp2Owj0t2nTTMnZ015psfAxawdhTnlux8nL49VZnZc8vRmF1k3UHWkeEiRv1tA==
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr33060104eec.2.1792013890143; Wed, 14 Oct 2026
 14:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps>
In-Reply-To: <as_Cr4FhzyAh-kC4@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 23:37:56 +0200
X-Gm-Features: AclHuK8tgzioW0we3H5Jmz30FnP5L68F0LOvV3GcndlE9PwqCRYyUXS4gK8bCWk
Message-ID: <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:58=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> I'm following the specs[1] for these skills, and my testing showed it wor=
ks
> fine with a few of the more common tools.

What I mean is that they don't get automatically picked up by default,
e.g. Claude Code and Codex don't seem to.

The website you link (in another subpage, not the spec one) mentions
`.agents`, but not `agents` without the period.

So what I wanted is just to confirm that, at least between those two
options, there was no inherent advantage (or disadvantage, depending
on how one sees it -- I am not sure if it is actually a good idea for
all use cases to have them automatically be picked up...).

> We can open the markup language discussion, but I'm concerned that doing =
that
> will break some tools logic around importing these at skills.

Hmm... Not sure what you mean.

Cheers,
Miguel
