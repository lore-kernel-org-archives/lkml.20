Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794467232;
	b=MM+5S9dNGaa3TMgLmx5LGfPt4tkPQibKMnJSzMbubTkaouGQ2VMhgdPy+ycOfCKVqYxP
	 sSWMHNE+IqTsyK4TfMcl6wLpxBbjFPIQ2G56ofEgGEk08pCmuTIY2tJZ132HcTAdBKhkt
	 FJReMxeLILiHS7J1j6Oghrg4mzup4W5spvzDqRLbLkqStdIm3XDAxzP84UcStD0VibW6m
	 4oqAewRSW4CyggumCL1uUfuyrRMs7UbUzlN7JHQIdTVDBg11rmizPJQjUP+5c/pGBNBSP
	 Rl/D2Af1iMgdmn/0MkaI+elU+WRwUGa4qBPfCEKmn/VzhIOLwFZ4BwB44KfvMn6gW0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
	b=g43SGMaIG59UlY/sddAiHmjpRuOLlwcp7+Aq1TKZ2A7+gdNv2XUHYnKZ1G0Zlac0cq33
	 qytBPKzXQRTCQkcGSd8XZJLla4PBWu7tpSavvZUmGYpIm4/1+WnnZaiB41rlQls6Mpvlt
	 n46jc1phyA5mgXpkVuTKY3jVb7Xuv6z9oX19RvjSUhN6PMC/S/+iRopn1qQ14Aggm+rAN
	 MEHZSvxu4soEi8E9RjM0nrqZNXluUfHQTrhVIBC9UdyQ9CBYmGdYdHQhOS8V8yORSLajn
	 c/aGKvUa7Me/68YG4JncSilgj5uwee6KcJxvwzdWBC3PFgVET2gB3N4nxDqgXkP6ETw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc44pbNc;
	arc=fail smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C619C606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C619C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc44pbNc
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3719e3cb82bso133114eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794467231; cv=none;
        d=google.com; s=arc-20260327;
        b=eE2YWShhUvMqFU4w/a2LUu3Wuu67BpKrHYPBJP6d17muFB0yFXpwQ0jlkHweO4gvh6
         NbQ2hgrde38UMA1hoCGMGbpljNdlF0k2Yi1JLdU6x6rFjlL2mURodWPtevb35cP8+cIr
         v7p/hqONeMBCnBDCX4dSnJAMB0Ay3Z5GbD/OV6WLW/ZlQ1vSUrhhNN0jEZnC85lSP8vp
         o80RT0kWdj0vWOCwysJEO1qhz6uiRB62fWE2xUeuSyxbIS9l8cB2upmdaArfxh6JIQML
         4SzOK+8ii4vwk4LM0vetEVRm7fdtUAKW2EXpPbCEK+S4DRwRC1bWlsMAv17cFGeXWFW/
         1KxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        fh=Kuo2545Yi0F9m4O+sR4tv1z1T+de9YnmzbLYqWPRJmE=;
        b=VHRYyUfa2eheilPSpe3/tYBt3azeDyQLk2fwpfKEvtOVAgj6zl5Ml+FhIi/2N2WGgc
         fO79Hhp4yKSlQp+5QiqQhwPC6iE7eXBZR4lgP7zWW+0WyTMCo8UR17XZkImxnMx3anMb
         AA+Tru0c0IRtBG/uT+8Qel30PI++Q2grTNhb4FR0sZEyR+sl16YXTl6+fTXbr8rvSxOK
         SjAAPCysITyxUMOqpTluSqhcqS/jevn7OUgTm4z0nHoRRNcmcVT9EiutpfKLBUeWe5GO
         uhWGvWjnazyY5jQ7eq1vdl1aZ2Thbz78iMO/ooWD1So+bj2B7viAHzl0EYiWVZsZf72c
         yekw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467231; x=1795072031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        b=xc44pbNcxltUHGg4tunSUmN04e2U/jKsJUsnxPYcvA+qqm01NnKPXgtlnQekS7ByVq
         4AtP7iHvVolgk7MNR4QfFlGkEmt+3sBlL6oSmEktDhFPu/wHAnGbFh0jsqXMaougHBpI
         gHoW2ClvogVyVXvDiOeyl/DtSGsaERvHOwPNTFiQwuYZ3N87WzCUKI1ouIuw2rv1rSJu
         ocHwePSnJq+Q8ldOoYCTJCmzWnVlmSFv49wORYfLbrRHdk5QrrM3JmrTCLlA9wX6en6t
         KdeT0dTF/ux5bGGwY8xtfpaAQ0WlrEw0/9zk41gT10dn7W8jceJBbGr8FB+1KspVxMe7
         9xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467231; x=1795072031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        b=GvuY5hu5fO3aoxTsonf2qBJA+llka2rwGMTTXZQ/q3QRYHghvwRQesDo76Zx12VE2O
         n5wYsUhZn6Qsq9VcUsZ43rAvrQc0Ys6mYlXwwzC3nsnWVy6JzFZz2DhPJ7NVFm9m1dNj
         LU30aIazgyfw87tJV3mi948Q9cXpYU+i0Qmqi2XeTEV4ejINUm5zbcmuJs6s1vh35JyZ
         ooSwH53it0VMm+gq6dyYqvI5dSM+1sK3d7a+ZlnLZe/jDfRKvuN6NUDj4uVYt22GRtio
         yIi8Sr5hV53usLrFpwXtkwWPKqu7SotYA5AD1Dm0Z17tlqgnsEKcRMX97HVEGjJLF7RZ
         W5uQ==
X-Forwarded-Encrypted: i=1; AL+hErH7qsz/hcTeE11EhpBP2xDyMCEf7DmtO75VosgQC+v/B2AwQ38Br05gZ7+eQ9+ukTsQ7qWVu6o6D1Ewp8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qO5KZRgm3S1bL/mjTbT0YLhmy6I1iukNyUGw0Wq0OKxTT+ZM3
	znuUtAxcEuXjcpWesj5iyoJbGk3HuiqvcmljnWlproZ5HYvFRkAgAtSj2hazUKeWZC0ReMwXXeD
	sGx48+8kHY+sgLslsIhVcULf4lsp6YGE=
X-Gm-Gg: AYBFou3ul4B7PkQiKO+E+D8OGkZ6xxnNnI9cGyT66/x20/zwWdLwJ+Rnbj7Y36RThzZ
	EvsOL7ttr7aHzz/RAQ4WwSjUda0BJ1fZzaTxVX+PUyQoBPGW8YplSxboQO09wJxL+ucOQd9wJ9I
	IW53GofrqikZIognaxxLaZoj/RM95Q8vmpY0K9XIqSRKwufBvSOLCkYcfRKwh0TnDfNBSRBH7ts
	DdmscagJrr41qzNQmW7S7D178FafFN4xF20VjDpLlA17bh0vqGdEpvSBNwnkXgxgE0yHM3QJytU
	/hfn4c5MiV557BM8JmdH2GkAxHbDzisLOBFaxez1rgHUTMcMh9Q9FuzkiHrap+k8phwx1OKstam
	UyRMTHYHZQFjEKxyrQPhRab9kvauSvKM+tGd/7gqeFBkL3lDmJ0oLlp6R1QvpY/pwdQmSGGpz34
	z8BNd4UKwLne92KVxWU5itmuZYHygGUrP5lGsOkdxj7+yJkj1uTf+Uyq/zRTE2N5Vcwn/ZDCxDS
	Ag9tpMvUUURzyo0jvHXI/cZaYpJz+K6WxbhqzJsyfABzeURJh/54pl/2Rkbda3S5uFHlqxRamUA
	rxp5Ehv7XKupJ7QC
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3767fe8f34bmr7678043eec.0.1794467230848; Wed, 11 Nov 2026
 23:07:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225940.1573565-1-tytso@mit.edu> <20261111225940.1573565-4-tytso@mit.edu>
In-Reply-To: <20261111225940.1573565-4-tytso@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Nov 2026 08:06:56 +0100
X-Gm-Features: AclHuK-0Vjsbk82ppS8gYU_c-KZHXRP49X84VVchA17Y0XwPYJKcU9nKf-NQksU
Message-ID: <CANiq72mNefHqXnfy_mh_kyRT0SfM8rLj1kRnc-Y-qmdaDq0nvw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] agents: add a skill to determine stable tags
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Leon Romanovsky <leon@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <error27@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:00=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrot=
e:
>
> +Read Documentation/process/stable-kernel-rules.rst. It says which change=
s go

If the LLM is going to read the file, then I wonder if we should just
clarify this (i.e. the list given below) in that document directly (as
a guide, i.e. still acknowledging that the stable team decides in the
end).

> +Judge a change by what it does, not by how its description labels it: a
> +"cleanup" that releases a resource on an error path fixes a leak. In pra=
ctice,
> +the stable trees take:

We are adding Rust soundness issues to `stable-kernel-rules.rst` [1],
so if we are going to have this detailed list here, could we please
add a bullet point somewhere in this list like:

  - Fixes for Rust soundness issues.

?

Thanks!

[1] https://lore.kernel.org/all/20261020163358.176088-1-ojeda@kernel.org/

> +  the code it changes. Otherwise, if the Fixes tags are unresolved, so i=
s the
> +  stable decision.

When I was reading this, I wondered if "unresolved" had a particular
meaning here. I assume it is referring to the output of the call to
`find-fixes` and how that affects the output of this one. Perhaps
something like:

    Otherwise, if the find-fixes skill cannot determine the Fixes tags,
    the stable decision cannot be made either.

is clearer, i.e. being a bit more explicit and using the same words as
the last paragraph?

I hope that helps!

Cheers,
Miguel
