Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D63DB310
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451612; cv=none; b=iG15j+iO7tBSOBNjZAybjcA4MhWbGbTCAa9EvSUEEtxQi5wUpFalGgkL2G2AjzoUXcSgkPHcsBM3gy+9FJOyHnDJNDGVz4br7k2DSpLLa8cZokvHzKxHGeylOGul2+YPS8fBQAQum5m/jMw9XCLcHPQSOW8oGie3KNhYC6Hg8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451612; c=relaxed/simple;
	bh=Gt9wOt6ppWinNnlK25gmA8B5TgnA7EoQQNGwpQhgqhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTH6DE3OuQjXkk9MMAyghsWN2ZGIuhszaQyPpQWVQj9DSacZyMLnRDt4cGMvg9ZCWeTdb+u5CwnM6XG15fjhAK+VIuqyusPMlm+NT75M9HuvvR0Fe2F5+jU+TlL59nhAFDyK1yh/gmNULmudks8R4yCg8ltWBM14u70k0SJDzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjz5do9c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjz5do9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678311F000FF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451610;
	bh=Gt9wOt6ppWinNnlK25gmA8B5TgnA7EoQQNGwpQhgqhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mjz5do9cqfDHvrm+G7S07/jhE6GVNePDHu+bXqvTdKUk+YIB8+NfkjYZOfMPvHPe1
	 SHZmL8QQ4DUuoF2rZY2XEEv6l+rltbK7ZK/9GTUVpIwoqWz7xBZuncJXupRoUEmMjs
	 nKvVLlYS1E62dlGwRCCpSqmnLZt7fGjsFn2E3eRZuwPyWVVbhD1fummMM8cvy2DEsd
	 TCF53VHltwQx9u/Y00sj0cukczKm1wSDeFVOet1JjtEDTyH2++rh9dbjPjEPT20Xvk
	 PhhFn7/5C5VBM8AvxzPhyHxgx7Vtm0G11uT8APuZhrzHyI2NRNdUiu8T2xkW+j8KEF
	 4N5RAXcFbZsqw==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49e0ee9e7afso1020542fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfn5oghDYLo0o/fu00IzDfK+ntSnc1/dSZU6CqKQmVgL10JZZj62EphX5Gg3ocJUoCvrUYlJyt8jpaRvE=@vger.kernel.org
X-Gm-Message-State: AFuF++md5zeZ2VIHsp6Jndnv3mT2EicnRtn4GcySw9fg+FkalYGHnpiO
	sKaG9HprOKpC7dMYQcbo2aM9qG+DbUj9mDBpu2r+3fwPjtnNGzSca8IfW8hjFU24BJ6ul4Z1pux
	RLKzp7KRtL6dhU0AnXiM5HiYprmwmsm8=
X-Received: by 2002:a05:6871:3869:b0:49c:3eca:25ef with SMTP id
 586e51a60fabf-4a2591d9e5dmr3983078fac.8.1791451609827; Thu, 08 Oct 2026
 02:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org> <CA+V-a8sSaGYcMUpXhX+mr2C44zLj2Hgnwj4pQS1t5YrZN1ejqQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sSaGYcMUpXhX+mr2C44zLj2Hgnwj4pQS1t5YrZN1ejqQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 11:26:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLk-VZ+hv2+x++kq5K61ORxOgYgqmu_wCw_sX5k6-J2h3w@mail.gmail.com>
X-Gm-Features: AclHuK-KUSWV_pbziOSS0NdajQVOl_Xc-5mQYGJWfN3ER9TYzr2GWSy9oAbKNzg
Message-ID: <CAD++jLk-VZ+hv2+x++kq5K61ORxOgYgqmu_wCw_sX5k6-J2h3w@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: mali-c55: Fix IRQ lifetime and wake handling
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:43=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> Can you please share the dependency patches or branch, as these don't
> apply cleanly. I tried the latest 'next' and 'media/next' branches
> with no luck.

They are just based on a clean v7.3-rc1 from Torvalds:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Db4/mali-c55-irq-supend-resume

I can rebase on media/next and resend if that's desirable?

Yours,
Linus Walleij
