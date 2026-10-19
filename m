Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0F2652A2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375039; cv=pass; b=I0HBsVaGOaIrWnOVh3tv5HZTAZxTwDvMQMS1A42ixrMVRIzmbWBSfW6UwBq/vOeRIS/iriFoLG/j87FGD9Mk5SnV9ef4+B0saably2sC2V7o5hvTiVzpnE4KUzA/qtGM8DcP2NI52p7JZ7M7s5eCWB95hlq3TZIcTujCG0akNd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375039; c=relaxed/simple;
	bh=VViPh7OnXQ7WsZkAwbFjPgPYCAuEYt1IC/1sZX7Ven8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qucYqPq7KzEJo1IomiXVtxtzNvcE1wnajVKFLYzjQnutHYodNyJsXnIhsFCN+5nBAjeK0jELR02QzwbKsbR/VobAYsZUbFEcYq9WPxUMXakE9xQ8KM7mEpdGSS13c/e9YHmDzV+F+i4SGVs50Md0fVW7HUYwDEsznLZGnJOphdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9Fhstd5; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9Fhstd5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so1433074a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792375036; cv=none;
        d=google.com; s=arc-20260327;
        b=TaLwefAnJDqTkvmHNXARQxugL2PWIV7hMCimLBgsu0DURTrclZCHR1oVEK7Kqx65ac
         O4IfE1VGnGCY9qvZkfnRTC9w492uLq8kVLzWSUa5nl5VGEGAWC9e0iuwzRBW9eHPm10P
         ZOBKjrRgHXw3qlLnSJMBflNUWyTCHodzjo5BXBj0EkNv2zwcLOy0Pvr5Jsvft1lpeaql
         4qYIdNQM6MkZxq0zp8zthE6jTON5il2W7k75U6MwJtjGJ7YkfbwZV8YshOnYFuU+CMHd
         cyzGoQ4xHY5KrfT2VBTK6Jta8VXMhhg7LO+Ytn5PatvtTEmESVL9CLyFkoeamOo11f6n
         koqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uu2T5CQkhWnsUGc0Gsza1QExCIhxJWw9L+EYhkzHHCQ=;
        fh=Tx2oErUh//z2gmZdPsYIP8dJFOvcCNUey2GCWCk1ZSU=;
        b=PpIRUheOg4Xv6uVP9qVObd99Zxhoaj5mIOXGkFvu6c34zq72eZIK2cokOoblqA373V
         OaefpUd9Sfws3Bi7/G6K6p8+fLk3xbmSCPK672l4y1wgGmm8h9xoR46Vc3ek6IHChOT2
         Q5l/J7f1/0kkDsW18EFOXn7DuhxIIN5gmBMDCjZ2qtq0ZsIC3aIoCL8OxlUW90CdpKgh
         jZObekmqZ96aBK28XLu0U4zufEpsb4bZKK4wIoW0F9PFP1ffCczdOvsZHpP5jK9HG58q
         toufwBhD54ybtzUVFYdCsPPgEojKGE2uhJNCmd7R3sEvE8fC9O1riaAdMJzLZDovnQLR
         4n0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375036; x=1792979836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uu2T5CQkhWnsUGc0Gsza1QExCIhxJWw9L+EYhkzHHCQ=;
        b=q9Fhstd56PDdL5hsKsQnp3CDKcDE3gemaB7OI6TnhXl1BY8HKm5i0P1av2w8GpPxFm
         K4p+3V+Y1/2SX4aaYogTMupe9NtJW97B1YROE9s3BxPHOKG+zFK2qj3/w/yoVSfDp7oy
         TA1UyecZpfPtE1C8AgFFldbTkdncr0prfHSK77VCP26oP1Aq4Kb7HyRYf7xUlEvKHNXS
         tnWZWKWDkg3gXh2XrIGCSHIx8DA7rWT5s63rREGjItdaX+MVyg32vIQ/qqqW12jmpuhz
         xoyt/baRKAsFAD6kNaRQfrGABEBPSb5HqObx9aF9OFqVPk9uNBhvO9MD3ZaR5E/t3tPh
         AQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375036; x=1792979836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uu2T5CQkhWnsUGc0Gsza1QExCIhxJWw9L+EYhkzHHCQ=;
        b=oyFvJ93Ye5z5uBH/yWEl//bb4lH5qMDIfNv84E6lAU/kY+M+ZRXLBO0kF0HADHe467
         wwbwT+FGXS45oPZUDql68ecgMNB0YoxCX3WBJNAQhEeZdiCiy5El5HBXfIc+frrJ36xB
         7z73Xyy57AGbWTTvQlK0CFO7xZJX71jfs6vwCZBWpNVi9TwaKLIvB0/547FuIZX/ODig
         kIcCYi0QeK38DCQKn5xHYMbtBfVAQ1PM4jVOs/ZtLP1wPsCK/gRAsrY98H0GqhkmvL1C
         1utIY2DpxnYmfylHjI3M7zjsYdqbZQQC5I3y3KTuvpoubS7pic7uCzhwv11UWZvlRtf/
         IzEw==
X-Forwarded-Encrypted: i=1; AKwUvBzX4q3e7FB0LmI6HHDrdD/5Yh56XZ5rJb95IVMh6X9FbXbj33p0TOt+BrSYif0QllD1JklpKnVWmC/3eyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRq3wj/QCy2wz2jmj1NCIHztqMFAPwXfgS6nZeLUKh6dFJkX/2
	HvwjCqV5UAjbG5aY5zoRteJEDdHLcWufRsJXAltwB5aSuwwRYVqcytubJG5JpiLbcgadvzqiEa7
	AEBZpg8xAVx5VIIEV1VRRy8Y3T7U9FG8=
X-Gm-Gg: AYBFou1sTaoopwHlsmNp9HFMJdJojAUHfCOeyb810dshQlMpCpBKusYzihirJNRCWDL
	b25MDOIGtZJUGqbCBpdqy451uaSAH7iLBmtIAt8iC5uzNnH4QAFtYI5sEtkLnSVZLFz0qje7s2q
	tM4J/9APBej9RqRtxNrhDvytQRe+pNk6Pa187aavQ2u0geVcNBECB+JlOuWNV9/G/VGUQ+w1t8W
	pwnrZsn0w373KUAYJgFSK65CX27OICIgM0b2pbYELhJBGsF+7TwLvYY9oCBntJuMdTOv2xkBCsO
	0NNhpfq1Q3jYxobEP+78xa7kzNMxxEcl4RZBc/l6c551FZMz9HDratO32oekVrHekJNvHgTB0Fd
	DF8tMurxKTkZUDr6qO4M49bA8+2DTsgsy7FgPxkKLKnx59vUXIxKW/zltFzRHKyfrN7GlekGEEQ
	iYRnK1frChfTveQ2wKAyg7iPjZZerWEqvAOrxrRk7Y7QGNpZF9wzK3TbgfoS5dwVZa3w==
X-Received: by 2002:a05:6402:46d7:b0:6b3:af2b:3aaa with SMTP id
 4fb4d7f45d1cf-6b3af2b40d7mr2758333a12.34.1792375035596; Sun, 18 Oct 2026
 18:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019014438.199718-1-rosenp@gmail.com> <179237452010.3290.14331369140080870388@kernel.org>
In-Reply-To: <179237452010.3290.14331369140080870388@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 18 Oct 2026 18:57:02 -0700
X-Gm-Features: AclHuK-is_PhbKGnyMvnRjhFXlqCIscHeBJ45h-hIVHRpjpoiN0ZUW6yNuD9i8w
Message-ID: <CAKxU2N_zyLN7=MOvB60L8J+2nUfRZM10B5S+iotU9279JwLw_A@mail.gmail.com>
Subject: Re: [PATCH net] net: ag71xx: reallocate rx buffers when changing the MTU
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Chris Snook <chris.snook@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:48=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
Sashiko flagged this on a performance improvement for net-next.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
