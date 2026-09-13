Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5EB3F12EC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323490; cv=none; b=dXpyvCVPymm1bFeVsYWIZ5iIz2uJg6RAUA5Tl2NChcnKlcJQWb/kYKnotqAAnd0DXkMaQ4XF8ICXztx+37e/bBwzYzhOz0YRyeoTb/qUAjFuif9AyZOIDWold7b4XCGwE6/XGrGZlR+f0mdKynYfL7jzkW2WvNjn3HtxX5Eyi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323490; c=relaxed/simple;
	bh=H0NFoS9+2y7iZqveSZFJoD0OGDeXA5Y10KsvqOJUqwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5ntAF/ZqeBkfs5hAQItwXMZVllB4OBM5t2f9+E2K7gnbbVOmiPtU92+WN85suwAhoBprvISnuHqFZC2Sika4Sfm3d86SDYduhX8owxHPZ1pX2A0vkPNmkVoTiYciaCq3cyyuNELQJ0WaUS/ECg33GxTY8eLfFkPaBDzlE9JyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAMpZ/FM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAMpZ/FM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF3F1F00898
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323487;
	bh=H0NFoS9+2y7iZqveSZFJoD0OGDeXA5Y10KsvqOJUqwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WAMpZ/FMenYD847yBag3A5G0SlUwxT22NKSUd6o4iVEe6MY7oTxufILfllw6VdUP1
	 T4o7ACM03eZxz8niSdPhsrlSzZ5dpCM7WrGGwx79uBd3vAfnYydpbzqg14WOe3/DQ8
	 OJPLDz0+NDRsis56sUTfowj1KyCpP3q2IrSTB3ee6qtvo40MgOPcqYYufpamcSHyX/
	 49uv4/1IALQjbFeBjApGQc0GGOU08Z9SuSxXkUiXPXtm20XiYfiIFhgV/SrLuldzGa
	 kFR53Y1gnR39taZ0N+DREjR1Q7ZZlMO6WUbVOMDfttS6KfMjC2MkSCvYMQUCMiiOJp
	 qeYY8aq8q4WRA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1455026e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:18:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymrK/GhZ1IKyE3INGREdRRwPfnB6D8LoDbUZVObRswW3FY58vF6dRZC6WT5ExLfAvP2/iYFUIJUx8WDtU=@vger.kernel.org
X-Gm-Message-State: AFuF++nYO8HT9uqHE+nUG55S86kbKv45nBhHvQpMfleErp6CHtzDKqJ9
	NpJUMKwQCTe718GYzp4h+zOfeP7bUbQ7BEZaaHRHMlG/St9Dk0eH3ahm0HtlCl/sHPHU+56SX0G
	oYW80eIdkLzA35lyl8qcp37LmU72aaOo=
X-Received: by 2002:a05:6512:3b13:b0:5b6:1a7c:25 with SMTP id
 2adb3069b0e04-5b8a8ebf0d0mr1454068e87.40.1789323485809; Sun, 13 Sep 2026
 11:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info> <20260912123827.3aa54e58@kemnade.info>
In-Reply-To: <20260912123827.3aa54e58@kemnade.info>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 13 Sep 2026 20:17:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
X-Gm-Features: AcwNN1UhT3IBhd9sabdzVfWZkJmtNd6FtdEL70-jgYFlsMV8Amx-h15txYxKTIY
Message-ID: <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, j.neuschaefer@gmx.net, f.fainelli@gmail.com, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Sat, Sep 12, 2026 at 12:38=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
> On Fri, 28 Aug 2026 22:32:18 +0200

> Andreas Kemnade <andreas@kemnade.info> wrote:
>
> > Add ZSTD compression to still have a quite high compression but with
> > not too much boot delay penality.
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>
> Anything left for me to do here?

I think the patches look good.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put them into Russell's patch tracker:
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij
