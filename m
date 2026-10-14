Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0345326A3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985904; cv=none; b=aMkORhfJiSVzXq7ky3v0AKZ+2fz5sP6rSIm3bP70invn7dbr0stkSaCssPGxDxv7S7CbUtQtXDX61k9V7jrJLxUpfu5gXJBpd5U5Ke7GH4leiIDxFW8JQaMNGIjV4l3rEZ5ImOdRo6F1H4GZjtEk2R1jFFui73YcLmt0Yq58e94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985904; c=relaxed/simple;
	bh=tgmSYRODldtiyEy+JXapeeoUqKtXmFc3P6QA8yFixoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmZlpj3/kvCyObtgRAkeFfvl68G1YfTc2GFlxH6i09H5EhSmxpTd489krNwVfV8rY1lhidlzh7WBWaBsCaMtSqzPP65bNgB15zT2Tgm3qJac0RfY+MucodEUacPyjnpnXHHDXkC6fy2Uu/GcNq3a7cRm4XTDm9vvQWdYmIUyqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso1861478a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985901; x=1792590701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IEXfd68nGcyHVRwrJJo9fpBrzQEvxp+Eo/L7XZpCrXA=;
        b=PfL/08/4YA1aD3e9w+QhKnLm9lCliu/kh6Its3EA2T924ygvQV76RkCfoIoKY8Ywks
         aaizdNy4xuHo2numHlVhthZYe9YXOS/lOxC1UESLFMBK4/AaDiHgUxwC+Tg7Qawwz2r9
         q86Q3iBN979L0e+4IoWIgb+MWJn3o0dRu16XVtNoJ4as/sSIhK/7TbU6SB7q58GLRyV/
         Wxo8Rh4R4U7xwV0G5aAZ/i8bBp96VnrG9mayXcpWJ6FE4A0bZJvWMrxr12TkdaKWci7M
         MVHYODedjMjCWQOgoh2/hR7NcYEEEzTJjte3n2EdUnV5Fm3KtNI64Y8KETt7pUiDGC5Q
         MsRw==
X-Forwarded-Encrypted: i=1; AKwUvBzqb6+3o+ZM9QX8JOiClONciEFQiCp2+sh/V521Bv9AZVhP4SUHxFj8FatdlA1CtbEM76PSWHiI3JH30tY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+qIYMI7nBmvuhznyMfovoOhNPuw2I3eyabZX7a/mh5D6l54tc
	wLry1hzXe72l+2pm7l4wi5G3OGeSxe/QBfeH1e2PJMZJUjPXOf6d5DuF9bHubxP7nFA=
X-Gm-Gg: AYBFou3FRJFPgPdub4b39KqohnpEJh8ChA/5TmDOlgM6NxKIaLUajllyvTOo6JnCz8r
	Zg3YD4JvOHmsaSSut8oNSgPaw2uUVdv1ew5vpR8WYrkRFuCHTVFmr0tIbYZG4Ckhf0y67OdQWBS
	QUrHkMZPr+y7aG+9ZvcigHGEAI05qvFYX3rmC366D7nEgpFI1+EGJstAClDMEABMWAs+ecdiXWh
	+7OZ3rmq7gDgDJg4ZP9/cKBSIWyrjCIUMcuJJNDP3bxX5DySMTTxrIsDiwCpvwppZ/RABxHq4V4
	x/cssdtol7tB/S1uOz+3iZg6JRYk6l1lredr44y0veTI4aG+npS3/FaZSlQS3a7nmmrV/60Q0FR
	mUy00PyZ6LETLp3/tyJ41Uj25qHjrfhF5z1FB2a3n9GsiY+oze5zQgjGqN//4TWH4iiGZm1yHNa
	RPvJS/9/bQiRO+FcIobTyweHbcGu2+TaeMQ9ltW9ZlHRI7xbmsnhkc4eVRcweI+jhdYxPI1ZW7b
	p8OKBsgkPj68726pBz1up9vZUxuYlp+OyG21m7kB9WXoe4=
X-Received: by 2002:a05:6402:450f:b0:6af:9de2:b1f5 with SMTP id 4fb4d7f45d1cf-6b17c25d1e6mr14182110a12.12.1791985901387;
        Wed, 14 Oct 2026 06:51:41 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b3esm1208450a12.2.2026.10.14.06.51.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:51:40 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so1322114a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOBTx5PGThVYJMg+kpPZ2RuXt4om+NSGQNbk6FUhGHl7lpGpgE93pRAXVS/xPSEOC5uDjRVpEbLWrdpEI=@vger.kernel.org
X-Received: by 2002:a05:6402:3046:20b0:6b1:da03:d010 with SMTP id
 4fb4d7f45d1cf-6b1da03d6b8mr4816329a12.23.1791985900158; Wed, 14 Oct 2026
 06:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012213452.1863248-1-sashal@kernel.org> <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
In-Reply-To: <202610122047.A9E381A@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Oct 2026 15:51:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
X-Gm-Features: AclHuK_-G5twnGpuXtga5uzESM43gtwqSHGN6ArqXvmpzC19Pilix33WOTvsZNE
Message-ID: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 05:49, Kees Cook <kees@kernel.org> wrote:
> On Mon, Oct 12, 2026 at 04:47:14PM -0600, Jonathan Corbet wrote:
> > Sasha Levin <sashal@kernel.org> writes:
> > > At the Maintainers Summit, Ted asked whether the stable trees have a way
> > > to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
> > > are wrong, often because the author ran git blame and took the first
> > > commit that touched the line [1]. We use LLM workflows to find the
> > > commit that actually introduced a bug, and others asked us to share
> > > them.
> > >
> > > This series adds them as agent skills under agents/skills/, together
> > > with a skill for writing commit messages:
> >
> > Time to argue for a more fuchsia shade of mauve without actually getting
> > into the substance of what you're doing...:)
> >
> > I wonder about the top-level agents/ directory.  If we regard this
> > material as documentation, perhaps the "skills" should go there too?  As
> > readable text, they might just help to improve human skills as well,
> > assuming we think we still need those.  Under Documentation, they could
> > be built into the rendered docs and made more widely available.
> >
> > Otherwise, if this is primarily a development tool, perhaps under tools/
> > makes sense?
> >
> > I lack strong opinions here, but figured I would ask the question.
>
> I was expecting this to appear under Documentation/. The agents are
> designed to read human text, so let's make it at least passingly
> sensible for humans to read too. :)

The expectation is that the agents are becoming better in understanding,
so more "instructions" can be shared?

If that is not the case, perhaps we need
Documentation/translations/simple/, cfr. https://simple.wikipedia? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
