Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4D6361977
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745109; cv=none; b=k19Dcu/nPRHZXOJ2epT4b3khN509EX0mLGdZN2/CvPNc7feh+/Dr2VsgczxoqjOSNS2SCSWDTo2GFdnB2un/E+B9IBrb4xLBy4FIwzPfwMhPes0jasO0hq5zbdNs4hXzAsIjgs6MOi+pfFh7kjYVn8dG31Y0Ohplveyc1H3D9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745109; c=relaxed/simple;
	bh=AqDSNOwmcHl4cR31yxAgWr2XCJN7ydUtB1mAbLpL3ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAN4zpMZpN70vK6nH0Q/6uOcAAjdrzcvc18qBHBQnyQloYhIRHjxt0kWG3vQhB5daUkinHEoxHn5gzYNXT6bC92/080/jNLULAT2qguZzens1D58jy3d9RU0XrtuZQ4DfIlk/LTDe8gWP0zcFOnAbGB0DrEtBEn1Z0V38a/AVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDUoNlVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDUoNlVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAA81F0089C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791745108;
	bh=xJ21hrWJH9axY4jAzpc++zD1/Jz3sz4ZEQgfOFJFd5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CDUoNlVKUqiIfO7gEJk0phd6PeZibTutj1jf7d1zh5TLBsyp80wRhO789CMFl3fDd
	 MoBMzinZCtMwGcNtLpziS0sNwlHQKT932S36AtzRbxlbiLDlGFWjTsUJwBMPU8uWJt
	 DeuLF1JOsyrixewCXQ3HFUu4q/GZeqHjxSnBtXFg5U0cIBPlVL1SzmXlCk32zqiBHn
	 4+IzpCZisFqpKOW+oE+hfZu3oM7mcqQ7aGmWHJmYZ2p5yyLuyJPalFAQMXTYcTbaSS
	 vMxUq2L4bXdS/OrT4NPPR0/LDsU3ExfCceoc/bnV/IaP8LC4XxfSm1XgFInGbQycW0
	 hq89UyTUDrezA==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e56c287b3so107712585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:58:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgjo47RmjYGDN02FJqYGlphAHiIjsODBtMm6H9ByT/1jMFNXWvtOPAOzVlYrqrTVxNRahOcLJ9LdF9sic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrnpJYPgoc6da0fa1sqF0dHoZaR1l0DjeuFwWTJMFuncEo95Te
	mTjzmxvBF9/d69WNMn3Xieoutc5exkvL5H1A38UNE3yBRBXn9uvT9dhuGbnrXjSFxtKu3oGQwkd
	c50KEtDgngycPHJMenidGJ2WFIqM8wi0=
X-Received: by 2002:a05:620a:46ac:b0:93a:11a4:223c with SMTP id
 af79cd13be357-93ebd0c6dcfmr1205596485a.9.1791745107243; Sun, 11 Oct 2026
 11:58:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <55b68f507686cadfcb1fa4f8524ae042c7657be8.1791664234.git.jpoimboe@kernel.org>
In-Reply-To: <55b68f507686cadfcb1fa4f8524ae042c7657be8.1791664234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Sun, 11 Oct 2026 19:58:14 +0100
X-Gmail-Original-Message-ID: <CAPhsuW5V-VEf3WUAo4LiLMNdXdiWJ0o9zeLx9aTasQfh2LK2LQ@mail.gmail.com>
X-Gm-Features: AclHuK-26tgjgTPgu-Qekfg2JGvHW8bPLOcwCrFPyxDypmNmI5Dx7Q9i19_Z47E
Message-ID: <CAPhsuW5V-VEf3WUAo4LiLMNdXdiWJ0o9zeLx9aTasQfh2LK2LQ@mail.gmail.com>
Subject: Re: [PATCH] livepatch: Add Joe and Song as maintainers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 9:32=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> Joe and Song have both been key contributors to livepatch for several
> years.  They have graciously agreed to become maintainers; add them.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Thanks Josh!

It is a great honor!

Acked-by: Song Liu <song@kernel.org>
