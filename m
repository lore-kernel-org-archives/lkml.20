Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E05558207
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873160; cv=none; b=k3Saq752ibhmdy+pdkz1BrvQYL4a2XfF4o+0yV6rcFQtbfFLqm4aAWwQaZcjNcsTRz3Dv7/gz5b4sIIpduJc4E8thTCaxJzVfUtw0Ufj8YVIcA4Q1gSWTry0JEVOsGlJTV4W2shaQXc3l10cLF/RmEOmpz0ZQM+1Q/mKVpb+ZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873160; c=relaxed/simple;
	bh=I5bgQLL3mOz2emhCrq/9rK0IrbEOOeUKQmpFrejvUao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WfKEmKFKTpL+vakOxPUejuibKZuOvMkEpCgLZmFFoa+SCARIcpJuOkq++V4EW3kPkWH9Ph4z9ji9HL976lkALFp/SDPS1SsJQu2c/hzRwfq40piX2yGdlHotb7GLk6XGjzqviEkAzwlWiu50/z8neUCwKPi+hZ7auADuKJY3Cjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T81wdDxo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T81wdDxo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96051F00A3D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788873155;
	bh=m5aqyxE6+jxmKoeT0KNsiR9Pz7T3xO0C00yyx8tqkHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T81wdDxoEeFusn7KNahrxnUhA0L+QqXtdQv9MkdSA6g1Ee3TRP+ss0Cf8FhA/JzcI
	 hpPw49nIqChzGSiXCTyb9pxD9A0ZJEKPMLNq7ggK2TN8edk4k+uOS5GwRyxv6c6IRw
	 BQdmW/sjW5oavcHJdFAivqOsC7TasF5wLbZ6QGTlVB0V6Bmz4uPmXFtp4SHnqkx4PX
	 8+BJQq8Iy8Z6QGGjI+Z7M1Hlm8cVy3Pzw5EBjY75SzWH7IkfFeG3C1b84g1TcGgE/j
	 +hdzBbY44bQm9MPe3/HShw/viBUT60vvpRc1uNOlGk04Ml4pkynrl4FPzZqz8Zt4MM
	 pbt8+KCQtY9FA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c250f28f1cdso741102566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:12:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNiAZv0ieSgTKcsqmuqgo07VJlJVZGDjPsgYdjVxRQkF9Si2lwFJ9BvQ3UZ9hqtVBp76SPvR8nZmYCQq8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVYeHJtRX+N/K+9EOgLk8nLNEMqaDUFSqQJF7V36vPpY5xYIN0
	RT3ZI+QMW9omU/4cJJvn+vXUOq85+Vv/OVGbGT3LL8bqArs2QF36lY6IaPIq30WzmzC7EhZuOwq
	bWl6Z/YiapY//HHlj/vUVhs92Nce9LA==
X-Received: by 2002:a17:906:478f:b0:c26:19de:9ad5 with SMTP id
 a640c23a62f3a-c2619dea727mr1058176066b.45.1788873150708; Tue, 08 Sep 2026
 06:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907062017.5881-1-hemanth.selam@gmail.com>
In-Reply-To: <20260907062017.5881-1-hemanth.selam@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Sep 2026 08:12:19 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+qAyYKDSFy1DiOMvdQu9ENK1gCa2tp2SMZiAE5yQpRQQ@mail.gmail.com>
X-Gm-Features: AcwNN1Veb5dPZANx3rRgo31FccZ0cifgahXe8-HGm3cwQxAGhNhQLOqQFSSk2GM
Message-ID: <CAL_Jsq+qAyYKDSFy1DiOMvdQu9ENK1gCa2tp2SMZiAE5yQpRQQ@mail.gmail.com>
Subject: Re: [PATCH] of: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 1:20=E2=80=AFAM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/of/base.c        | 2 +-
>  drivers/of/fdt_address.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d71ae0449360..9e249286be71 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -700,7 +700,7 @@ static struct device_node *__of_get_next_child(const =
struct device_node *node,
>              child =3D __of_get_next_child(parent, child))
>
>  /**
> - * of_get_next_child - Iterate a node childs
> + * of_get_next_child - Iterate a node children

Still does not make sense.

Rob
