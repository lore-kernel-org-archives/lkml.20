Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E484F5DE0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774756; cv=none; b=ppJhuYHbp8In34MFTiJhwSVdZcy5XsquGYoWPAffnKBIB23NHwf/orHhyUSJOHZ5D/YvE+MNu7QVp29vTLADL3GePGWMLgDSaYdepFhV7gNiZCQwOMOl0erz++QrX1MAYLbRGhndLVrCRE39QtoiED0eBMGKpX0cgRtNrdbhqCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774756; c=relaxed/simple;
	bh=h8LC4zG3xluGBSlbEPxdFWVpWp7yOIeABkuDqTBBG+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OA5PnVLD8P29pWEGP9yLIsGQ50QOHdDjdPsc+Z4ER7xZrs9o4Se+XsiXLe0EYvN57bT7W94CTeGpV717BKxc0CKrotV/2GKRA5j64R2EL73xMq45bHnCWZtKgRDjm9RvF5OVtB0Ya5SBGlx5f/Q0FXVzrPj+sYBi+v67PTG0G98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqUz1XL/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqUz1XL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03E71F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774746;
	bh=h8LC4zG3xluGBSlbEPxdFWVpWp7yOIeABkuDqTBBG+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cqUz1XL/1ehj61CpvFJLb1L5BWrJ8YHT7JrF1yRb/HMMp9HS4/KrBC8mFFH5EduDY
	 ShMgeca3YQYO23Dd3KVveX0UlI/0YONlQ7dg9g2K5gGsi4k4gcKrNv9Byx+CIloSjC
	 cscAVc/UNGX8n45NCVfDNpxX87R+S7jPBMdjfwcv73ZrGzkTpDxHvQKJpqHoZJjQfV
	 HXUnc+DmK411qnNiFzuec3BU5HaU6i4j/S7xWNTNd9cREsNITltMFeSwEPPYWhoBz6
	 ffu8vKGRgDrz+m1FieCY7x23FdL+rRU8ag3fWH2nIKQePAigNLxnrrbcxRT5bCLUd7
	 vs3ijEt/MfRhg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba40cb7246so356153e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:25:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzBzqn4vYf0lM52YW17n6R8yc3DFSKcf5daQWUn3p19WqqPLqjkqYnnl23GnPAIS/aLC1tePcmlYSRJnjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWWiGYmhC5kBtiVhfrheiLmA+bvrS/a/WvMeJTxZs2f5DdoQlP
	jPIy3Au/W2MKSygQcedCcJnvqv61asIkW5qsRxlEiCpOLGO/SZYPGTjCBq3m5gedLt64KfDcNTA
	ii92aPDvrgZj4AT7RQSnGmapghJ3EacY=
X-Received: by 2002:a05:6512:2522:b0:5b8:9a2d:399 with SMTP id
 2adb3069b0e04-5ba402cf166mr720103e87.4.1790774745668; Wed, 30 Sep 2026
 06:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917230916.118382-1-rosenp@gmail.com>
In-Reply-To: <20260917230916.118382-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:25:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnEXWmR5QBNN3tHze14L=ZxNiPFjzAu_UYCsuhhDRwuqA@mail.gmail.com>
X-Gm-Features: AclHuK96BQXqlJdrlTYF_UApdGxb6JH1AR5guKpB7P822RZ_e3cOcQKF8gTwOpk
Message-ID: <CAD++jLnEXWmR5QBNN3tHze14L=ZxNiPFjzAu_UYCsuhhDRwuqA@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: use raw spinlock for MMIO regmaps
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:09=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> The mask/unmask handlers run with the generic irqchip's raw spinlock
> held and call regmap_read()/regmap_write() on the GPIO regmaps. By
> default regmap protects itself with a plain spinlock, which becomes a
> sleeping rt_mutex on CONFIG_PREEMPT_RT; taking it while holding the raw
> irqchip lock trips might_sleep(), and PROVE_RAW_LOCK_NESTING flags the
> same nesting on non-RT builds.
>
> Configure both GPIO regmaps with .use_raw_spinlock =3D true so the MMIO
> accesses stay atomic in hardirq and raw-locked context.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
