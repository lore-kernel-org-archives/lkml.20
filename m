Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5D3C454E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364118; cv=pass; b=NNosZuUDatEDjygPsLokBODAjxAm+XD/aTklP5w5eMm+Y5XMYkh+Er0wDP7d0stbjhobqpH9ebadu8Lumj7kN9znHD4MgyljjOvitmbH+rq80TwYIsyF3CKHclzhkYw7CBDuO0zySP3bNmS5KmMKnaBeYOCFREUOWvFTDK7g1cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364118; c=relaxed/simple;
	bh=0IW1K39bUjbjXvWSvmmWacltjkQtUrZ5RcAt6MAY8Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgGkoImZDtK74FY1yQ6HTKL4BXRBwHsGbciO9wDaE30O9na3XVXp4Vy/Q0HPuo5mqUwdhLxD9d07bCSe1pLF+oqSZP65HpEZ8AsSj2hHN1HyMMrN2VJmmRahujQq4LEAIGXyU45Qc+QeZhYPiEnYd4/lHTwKZ5GYeNzMXPQNoDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su7K64Kt; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su7K64Kt"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso144004eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790364116; cv=none;
        d=google.com; s=arc-20260327;
        b=DNaAL3n3XOw2GOrf279lrlk8FeW3+OyqHbvxlMCroin1Sc7+brlW4e/q7TnJIxHuBn
         dHuVNILTCVbfa64SZ204LusTH2vz2sNAI14IXKgiCWusB7l+oopuS37p+X00JAxxWQIz
         CPGfpV9Z6BUYnmkU3NgH7SufG3cereyFl/bEboK2WTBpqYM0G6DEYVL2uA5fEy3QhMno
         yEo9zf3xXlli8c1vGkLw+2UywVigBU7qM5FSNWH7ez6Wt3XZMbFC24DPbupEhmAz0mqz
         1pF615wXbBWHGS5a4byj/Li5uNI1WNqElaQl33d4Jxgt3khIE5u3OkfvnSJfNSlkW5iX
         9fVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
        fh=aDpn/pSB6N1cqyIypdPbCZGgmaNME6/TnMULmKhdjoc=;
        b=ZSOSCZXk6Bo9EmXtqzAPbarV5jjmdQJOuq3y1bA07Bsbd2DZxFUOQIwRk+6f1JI7Gd
         AB9qruFGIV9mE+nH0+wkpBxyyKx3lhXLQMqreSDr6VP9kEwYXSofaIGgGiiN87jgW480
         ALcgoWgKY0BCJm96+F0whmr5xd9bNCwUPVZBPSE+x9vJWhHb5aGgfAcpKTy6OcJzNQ5x
         Es/CrnkqM7tVX8lnhxL1nJPcrtzzD1I8xGPtuyruPQ6Yi4FxaYudB83GfKJj73YcKLXt
         Ig8i7FKZePCdf4hUhlgceBJ6MGvbm0VjYwtbp9pzK4NMq7it22jDAgIZHKiacrbCAw4+
         JyuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364116; x=1790968916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
        b=Su7K64KtEWJvyMYzOgNqZARFa7wmIcFCvwHtBdoIRMEvp45LR30yD74r7mEcoOpUMM
         4QwErxaBmjHajexpLObneQpXipqVAiVhyS81p4XbYTE6N8WrpEf7FrWfw6TFpqt+8wWK
         XTGlmCYY5gY7DVzTH7v3qz7N7cpvgVqYxvET0mlJk2MBN+1YO+JFAEkXFwIyfSBOvzzV
         c6N475NYffhyKXAJEkYS/OJT5TKYE98re2C2v+Wf+zAbqq6pWIjbgGuO2xrPGplPL9LX
         aN83RmJlprSyuqTN4WpB63AesYdH+I4Dp0UTpHXJF2zgpva+gbV9oPb6isOhZtYy8CTP
         tRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364116; x=1790968916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dru4kSgzG1LoMXywHn0mKxjt1DW7+3ANqKAV2u0yg+8=;
        b=XfxqEnUsMz07BDHy0ZhaSSAYFJ7yW9iea+gOh5VS9+ldvxr2T30aHUEQjWDDZhSGMb
         7yTD1+hLJeTGiEk0c/qwfjmfA+YlTVT7ER37ui3jdB4chUsJIO+oXFsVVEijuDYxLEij
         twOiBegTK9qeb703Ro+m8TOrzoKyGYqv0fOBF1WCcgPwSaBkJN66jdocLus5R1Qs7ojn
         LBBX9ooLzGAvmCPS132Euh5zVLopClwXPBuuFuqM5K0jVShExNwjDiGhx3nyO//jvH0m
         2D1DDUzFQBSZrbBMoIP/5PnAoevz+dRZYIPHUbeLLxRbKxFdR1q2J4W/4YFHwXJJkUwn
         il0A==
X-Forwarded-Encrypted: i=1; AKwUvBwRt4IvJ+QIPT4awaTkUfR+nHXVWKyuyjQSYEMRFSw2Yhnb+phiCiAqcq411hB1LPJMUegS6+LZCKzMneo=@vger.kernel.org
X-Gm-Message-State: AFuF++ljmaMjT0Z5kg6xk78yTm7xsblCLOBSZxzr08xzRVjySgI9fGQM
	xSIHHufci4fOWnMk6kkgjwR0a7wl7Na9FMm2qjdZKdUh5mMiJLUgLRE6xiqE0/DuGFnc7GwNAIt
	Bs0DLHoP9MfaugfyvckIivCqwrP5pcuo=
X-Gm-Gg: AYBFou2jvNHiBbxJcFrGtrjmKFdVZoFsHoP+2WRyEPfPw5mwKi3dUiHreHQdg1R6Xg1
	vHB/wo7TP/HLHr4lOQ58u1Z3aqsZX7AZyjB+YMMNDKEiXmTPMLdP6hgGVKzT+h/FRoLT0moEdmB
	pLr8pGCNGQZWLf22fJS+DaQ3XkYaWmqrhXFzvhDgjT91REZK+kc4L4oG5u2wzGaC0cMLPoVxcoY
	Sn8iNdUlNM4AXKX+YM5WFfuWT8HmcCNOQCufcE+eIhezxr9XPgABGKQzQ9q+7SmOoNXNHOQLpFz
	R4Kd8EhWW+C4HdJ6I9wNcSgSvRCAzJ2rWI+q4/8zLiJbPiApZ1oY9r9lwR5siK2PM4afGZfURFc
	ojqShGrn8JiwEbUoHTq23AHCz78aT4tMKiTGWA0MVIg==
X-Received: by 2002:a05:701b:451c:10b0:143:8212:a43 with SMTP id
 a92af1059eb24-146cf7ee027mr1494267c88.1.1790364115701; Fri, 25 Sep 2026
 12:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk> <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk> <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk> <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
 <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
In-Reply-To: <2eaa0128-4cda-4f26-b9de-311add98a1fa@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Sep 2026 15:21:43 -0400
X-Gm-Features: AclHuK8jFToXH3081DCxGG9Esr9QUklLHKbLHdj7sbwsGE6fMm6o6HW2DqiJZHQ
Message-ID: <CADnq5_M0uB6uRvQh3jEZGVEFqmU0wp_w=wmsipXqz=Nq5QZwhg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 1:03=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Sep 24, 2026 at 01:01:15PM -0400, Alex Deucher wrote:
> > On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > I'm still seeing at least:
>
> > Does this patch fix it?
> > https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1
>
> It seems everything built fine today, I'll try dropping the workaround
> commits for Monday.  The drm and drm-misc trees are still failing due to
> the original issue.  Thanks for getting things sorted.

Thanks.  I've sent Dave and Simona a PR with the fixes so as soon as
that gets merged into drm-next, this should be resolved.

Alex
