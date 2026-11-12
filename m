Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514340;
	b=Mzs+6rTq5jD3x7FnLrDXEhjp7dapaoUZFc1RIGlUAJ2RdotC7m6Gp4phmnnJurlOtr0y
	 aSNEdxfWqDhbydWLSYMMOkxG9WbuZ5T0Lv/cnNgde0ibf5ASSO/KN8P68hk2eVBAV5/Db
	 FVGUUzPpCo80IXiQTa2ELMw4fIqhrY1L342qaCU/JRJmT7YXnw/i3IrOO0PCXudQn6zwy
	 IQJEXeOzMvzidbYnZsHvIXtBWUzMKrncxY/54ktF0B3N2mT6pl51BAkxQyUFxgVCRnSbw
	 lB7cMM/ArN2JcG911GVQhzEI3CjDtuoI/CdKjnbN1uQ2HsQuFP/yQ+0GWXrO6h4EYUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514340;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eakRgnWHv93CEQPpJprbZeATRfmw83XT/BkhRlCQLg8=;
	b=we4hfwzvJUhFk5fCqWfmlYB0RbJZntbirHLanlrm6wuT0dOTQ2FpSxJAsIgZozuLVEwB
	 JUrjgr9ZcfTWuLGZuEcax5TGEf1Evl6abUWRdGmZ2HJ4dQBqjiPeZIz+FARWXoTi4xBWT
	 uk3B5CfD9Qu+OqaJiM/zngwBJTvenp1yBXXd6cl3q7vr6YF2omVQqGCIeK9SvouyTRkKt
	 J/1wzEtJKFfVtH1Sacc9dVUaAAS2rQbQBIKXVI9tg3SOqyTDaT2rcldfWgUX4TXHbnmh4
	 hc65mbqdV0uifbrCG1hgQA13UUC/PrYu6pcDN23gmect6zPVHTrTmFbCJLLQkPOZJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bSHbJVnv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E0606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bSHbJVnv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9F01F00923
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514339;
	bh=eakRgnWHv93CEQPpJprbZeATRfmw83XT/BkhRlCQLg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bSHbJVnvKo5zci/a1AG3EHF0wmI3lxnUuv9gNNDuCIUa9Xii0VLak9IqJNPLZgz07
	 Ep6uTeYWFnkORVWYYXWAyg7SZgXCKfvNk6z/NhDifM4Id8WAepGw8vhSpVItzOqscD
	 TF2VhaDh2DH2yMOTWY94XPcZy9echX8uG/ncBVHz+DJB5Pr9MgK8ft8ydYXyix3mve
	 hWrCBu+M9W+3Ln+9mf4dO2kVpEd9Z//hls+ej6fWmz+gownoDGd2DyLr0VO7cJstov
	 /3YNA8WdNblZK+OsyjcZjgG5Ukde7JElh2g3+Jlod2YdTbI5vfAxx3cuANNhpcxa16
	 a74kXQpbTvR9w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adef977ad9so1426321fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEDMoV2UQqtfNslVEBUk6yPjTX+DKuXOO78BPP38vwBp6jtRWgpAbtEAXLnjZKKZridvzKRePV+LnuzlV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lcJNLJIKt4KsdesGxJJtcvm75BE8Q8Wtzj2nq1DgLCV5l3wAG
	c1cFe/s6ZmLzjixAt2q9qqpLWsuqqCQ6q9gXMXs30I+ozj1aKTgh5fNSmGYJImtrv6+yFnMrYqq
	DDeByxMB+KmcTZ+mmx1MMRWLNZoCu0bM=
X-Received: by 2002:a05:6512:1325:b0:5c1:4c83:ae37 with SMTP id
 2adb3069b0e04-5c1705faa61mr179985e87.2.1794514338096; Thu, 12 Nov 2026
 12:12:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225940.1573565-1-tytso@mit.edu> <20261111225940.1573565-2-tytso@mit.edu>
In-Reply-To: <20261111225940.1573565-2-tytso@mit.edu>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 12 Nov 2026 21:12:06 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jQh5o8rT0EDZ+zMXmPn8i0Dz+FoRK92OeYGeHbzrf4Lw@mail.gmail.com>
X-Gm-Features: AclHuK89jLhFcAKrJXWTO7te7t_zZMTV5xHcIHChc6as7m7NjdEkpvKrRplXSrU
Message-ID: <CAJZ5v0jQh5o8rT0EDZ+zMXmPn8i0Dz+FoRK92OeYGeHbzrf4Lw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] agents: add infrastructure for agent resources
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <error27@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:00=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrot=
e:
>
> From: Sasha Levin <sashal@kernel.org>
>
> Add agents/ as a home for skills and other resources for
> coding assistants. Describe the skill layout in coding-assistants.rst,
> together with the rule that skills only inspect and report, and add a
> MAINTAINERS entry covering the directory.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Link: https://patch.msgid.link/20261020161642.3713052-2-sashal@kernel.org
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>

Fine with me, so

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  Documentation/process/coding-assistants.rst | 14 ++++++++++++++
>  MAINTAINERS                                 |  6 ++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/=
process/coding-assistants.rst
> index 509dbf23a099..b8f2c74e46fc 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -19,6 +19,20 @@ For guidelines on content generated by AI coding assis=
tants see:
>
>  * Documentation/process/generated-content.rst
>
> +Agent resources
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Skills for coding assistants live under ``agents/skills/``, one director=
y per
> +skill with a ``SKILL.md`` entry point in the `Agent Skills format
> +<https://agentskills.io/specification>`_. Each skill points at the proce=
ss
> +documents that apply to its task and adds only what assistants tend to g=
et
> +wrong.
> +
> +Skills inspect and report. They do not change files, create commits or t=
ags,
> +or send mail. A skill returns its result with the evidence for it, or sa=
ys what
> +is missing. Do not fill a missing result with a guess or a placeholder, =
and do
> +not finalize the work until it is resolved.
> +
>  Licensing and Legal Requirements
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..eb348cc9588f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -734,6 +734,12 @@ F: Documentation/filesystems/afs.rst
>  F:     fs/afs/
>  F:     include/trace/events/afs.h
>
> +AGENT RESOURCES
> +M:     Sasha Levin <sashal@kernel.org>
> +L:     workflows@vger.kernel.org
> +S:     Maintained
> +F:     agents/
> +
>  AGPGART DRIVER
>  M:     David Airlie <airlied@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
> --
> 2.53.0
>
>
