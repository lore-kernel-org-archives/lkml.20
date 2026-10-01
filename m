Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA6C331EC3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856434; cv=none; b=sEyj+ONFT2ObVlzWhdoZd4FrH4KqZIxD8Kxucif594ph9d7/ztc14eqrgeo6zLVtZ0WcfLQfoVDkmDpibPEpAwFSVOSADNoEw+HSt8Vdt83iWMnhnSlSrtod6GXAr7SOw2T9vQTIaaNzfU/flU66NJ6+969dexnSLpEhuhdS3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856434; c=relaxed/simple;
	bh=TEPgwh71d1iVR9H9iEIGJIPip2WRDUVsKKhB6kU6+tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kE12x6uLM2T8nsTzURqE/x8RPZpqilhXZf55/CqjEEZzRSBjCOyfJ2F6lSsKcgj34GmWrXg31lEJyThvUcJnYVEmEFsiEPE9bOizI9Nzk6eDdCtgJDCYflwez3LXQ4X2jPklDy6Me7/ISQ16J9w4JTp0/+zVc1RsvnFoPJi/Fa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyoVUl4o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyoVUl4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2711F008A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856425;
	bh=TEPgwh71d1iVR9H9iEIGJIPip2WRDUVsKKhB6kU6+tc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LyoVUl4oK0D347ufMsJVmcxwA4UpVGeGcyVdP1JyYxT7ciqkJX/lPgmMlpuvvklNi
	 LMV4jt9XJmI9D+5AolrG3SOUikCd3Jdd/LrQlFcPhju1xMHjY6RHL5cuLLu2UEGJoz
	 2TQiZOaWKSLzacmKbz4ucxqDR99TuHSoXalnB5JaS1rGyZ8LiWLK6PbL7MR/Q7DArZ
	 yL7BTHeBVo0tKMZ2UQ2XxGmxv7m3iPZiDzSJ+oLS88O0xG5cHWwmOquhmqyboWTiB2
	 4poCkS8kLLTX1FfX8V+XrUOx0jUVwNPM4RDcNG0x3JxxnLD7qUJORFHKZDh15f/BDL
	 aEYfWLlEdXpFg==
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-483c65c2fa7so3821457fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqPnET9SLOIqr4ef6ngC4CWI0pEYTudLHFmxk/kovO70xt2G/hF0vsYv5NkPEqWu5TW7z01ndb/7cp+vw=@vger.kernel.org
X-Gm-Message-State: AFuF++mVhNctVuuDKU3CXgMAkcmKnnXyUKs4ak8CxKxpriS8AmKTQfM5
	rUb+LgqgfLVkY7+LmADl9ANeiYCenxN3fKALsuFVkLEKgpCL7EF9kHcjUmP7YIMoVIzQgrFAI/N
	smsz6MDJ6fClhecsfRv4Kkbs/aJXc2eQ=
X-Received: by 2002:a05:6870:178a:b0:493:ab63:38b2 with SMTP id
 586e51a60fabf-49dddc1f962mr4370408fac.57.1790856425108; Thu, 01 Oct 2026
 05:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
In-Reply-To: <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 14:06:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
X-Gm-Features: AclHuK87xvSHhqipUtSb8ZJDrXVfGoCDfVEBsjNAbCB2k3nY-ppHcCl3E-2w_rs
Message-ID: <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:27=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Yes, this is a known issue, and I already provided a quite different fix
> for this[1]: the A523 manual actually lists a PortA GPIO interrupt, even
> though this is pretty likely not functional. But specifying this IRQ in
> the DT fixes the problem as well.
> The DT binding does not say how the IRQs are assigned to the GPIO ports,
> so from that point of view my solution is similarly usable as yours -
> though admittedly yours looks a little better and more future proof.
>
> I guess we now need to figure out how we want to handle this in the
> future, and add an explanation to the binding. The A733 has a similar
> problem: PortA does not exist. This time the manual does not explicitly
> specify a GPIO IRQ, but conspicuously leaves a gap before the PortB GPIO
> IRQ, so we can use that as well.
>
> Linus, Chen-Yu, Jernej: what do you think?

Can't we do both patches? Maybe there is something I don't get with this
code...

Yours,
Linus Walleij
