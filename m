Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B448381D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014009; cv=pass; b=pyT3c9YJQc+VozL5VsBTyr8oZW6FlUb1rcL6m8byXkgNlTn/KncP+4PK0TeeJnbynl/4rLLZQz0nWZ6t+x5ZLV1J0MBkEB/KewsUzjOaq7cUWHw8P9qvrQWbD+uFg8fyX8Tjq4JXFPHc+mCSFhUKZfzOYPgfi18r+7wRndT+v6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014009; c=relaxed/simple;
	bh=6ByUElvTvbGXIl2svxkrXNY8+hn0etgON6GqQ6cyQTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYlKE4is45lZd9g4f06RHnsXqm7nrgRoXOOAKH8qJXhEUNH0qMaRBAUbO+U2LLYgb4lhjt87R6gXk4jS2O+HcFDnz5kz/DoCHzp8r8sP7+LTKb2vyfRJqDINRHrpATRRcfC25rPXrvU2tRCEozjFhKGE6tGyPt11AWu6S2xn2XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiR+2g3Y; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiR+2g3Y"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35179d0747fso369518eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014007; cv=none;
        d=google.com; s=arc-20260327;
        b=J9PLPL8PQ7OnHeA2Q2VdyGyE3FSklbQZ6HRV/CDD5o3FMmGu2l9dvqijxjZjaqIkw8
         vZI8qnfIDoQUbAww1HHhGeXcjRChlU/qcOoPYpgTHiPomZTvR7/1n0WW0ZkGLHOcSNQK
         fQgHCx4IY45z1yPJAbm8MsevlknywUD4ARYqoGQO7nmnuho3fsgUiA3eY8DwTBjz5d2S
         Ezq906smpfIEkYBB7AunYLOYHIPJzc22FF+HPdi3rccOBwTfxbssJ3V44aUzWG4ixcec
         qscQK0vVvU2IGHrUOV1617/QLD2bUSyJ8bAH9cm1b1aB3naBfkGWBCjaH5XDIdgulAdR
         cY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        fh=wqzT8uUwJRALCy7Qtu4O0UfSiFwkvGkhznNk0WVUsOU=;
        b=h6q7TATuhSlBxCkruT6NcPxNf843r7x4Z4LaxrSAcmLqK4dVronnntCrhSkv5uUY2Q
         U7mnEyP8Vi5KBIKQl9603fszJV9ee87EgZqj6t2Ix3M9Isn7pCnccFb9XEafaLVrxpK7
         P5pMyxxiEGLh79/uq5kPfs9I/EC9QSrfneyM50JeH8FCr1Pv9eWlIb7x20VvweC2gOIa
         L5EPUrH9bqI6QVleECrsimaOUv2bXOVBD8r1Wl7N0Rz2LrHoucqVtCKouDPbxvveeq48
         Qqg72+mGovqHvixz3dkUf4wMCcZXmhyoERR6JxkkPXvCi4Dt8yAArcELJqbLWV6ojisx
         Kp3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014007; x=1792618807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        b=QiR+2g3YVMWIX/sccYpOtiP//hCbHX0pWh0i2YDhfspvo8ESjM18rSssYbqCrmB4+u
         VY8H3VSiMrGN/LEpNY9cGAEVXyTC8yhwM9TX+ZCqb7M67G4nQHm5y0Dso1m/e/Iwv+Xw
         IegSm6MjwopcOKuICFNT9SGLvOH9HpyDqUbL6a0u92xN7e+7zr4uKi4JO7gUeUUZd104
         rteU1AuRaMe5vJvDxYesaWwDwILX2d3EYY/tbKsIs8WAB2kk7C42MRxQ1lZdo25KKPoX
         Pk9zcRwXYSjZasSFnoqpKzHYfjDKXSMD29+zm46yd8TTIecDtqwsFnR7Y9OaQi+AgIgf
         OLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014007; x=1792618807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        b=QHykTT0wxpM58oE/2AATqz3TDe0QjfDQ584rnZYeqOvhtjlVfwtoL1SgdXN6zYOpHd
         uqraE+vxKViXP1MG39fSrm8Sco8KOhoIu7bH4P3p4Jcx1V7JglJMcKaPmxG8kmOvKUuN
         +zQY7K6gJJssVGMePHxneanOewqx5Tpj6A6CRLXdtgW8ivUs/QoW0GR4Pzc/EgpOr/Iz
         CC+X1FLWyKguinlFxzJAi0kDAWUfn+zC72aIa2E9LYUD4qs5d8w/h6tYFbsaXhbbR0ZC
         PHbbNVnz+35IJQwyS9eglJsypO1xeZpRV+peyLXlZ3jdUzaBv5muVgQWxDvhOWZfo8m0
         TEUA==
X-Forwarded-Encrypted: i=1; AKwUvBwOmIl4M9phxgrMHJERhBlccUwV6hazG94aCM0IQ0bkVbmSI1l2buncFwQBEjAD3rj/ddTd2wBBlDPbcEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLriHL0pv7jIW5sxkbIW/xhgFbQSEPk4K5LVYwhLE3i5etEOJan
	WXNsvDiiKhXWrmLVAXuI/9LEmZNJeE8lx4ezLPDprv+jT62AhhRK50n/283AuOtjNk7R2xHSzu8
	eX7dsg+30x64lhRVEgWssyqwK1kl2jTc=
X-Gm-Gg: AYBFou1gIjrmjoRSq/CW77I3TUMFeQd73CnU5w5Fpm98P1rVXeeQtrqhP9fcXogALfR
	NXT3Se1XCqdsvIS9Y2bgqnuwM+qCYanSuC2yUK/yz67T9KNlZ7rUaG3M6c6ke3K0vD5w8fU31id
	f8IrT1tAnuvPGGVJwLHrRFo79C3patpMjXiGAgGcRKHPTb2cslIJ8DHLcy4AlslCFU1Vav6ErzY
	njhzjJ4p76cVKDThkEg/oRigcC61F+ajGywuVDydfQV5Kir4zdSv+dMo55BU4TZ7yBnRTdReKTg
	MhUWgolscb+TL6giUwiWT6XbJxFFhRj8Ea+v6zVrXVsl4ow1HE8w0zrn7PZTKrC0r330AUsn4WU
	G+D9F7dCHA42m1zoHAKXjbDiR5L2gKR9+UVfLDvnGho8wyulRsLtTW7n+RN+klGnVX574HD5vbW
	USYcVnSu1fi5uHeAIx1svf+lTY4dZllZVr5ph8nkuWuEdV3cscbI0=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr12948382eec.0.1792014007399; Wed, 14 Oct 2026
 14:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <as_j3DawEZQWA4ls@mit.edu>
In-Reply-To: <as_j3DawEZQWA4ls@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 23:39:54 +0200
X-Gm-Features: AclHuK_5--FJcHdnSAu17V1pN7IFpqktYq-YEZQOni6awj4McI56yNQSA9BFuz8
Message-ID: <CANiq72k1jOGG4JUWE_8AYwqnJbFRGieG2SBMJ_LLVb8GdjtxdA@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Theodore Tso <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	corbet@lwn.net, ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:29=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote=
:
>
> My preference is agents/ because these skills really aren't docs at
> all.  This is especially true if some of future skills invoke python
> scripts.

That is fair -- I was thinking that some skills will probably refer to
other files in `Documentation/` (like guidelines), and thus it could
have had some value to have those "properly" linked and have tooling
check it and so on (since the documentation already natively supports
that).

On the other hand, one can just ask an LLM to review if there are
broken links nowadays... :)

Cheers,
Miguel
