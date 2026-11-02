Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629154;
	b=03HK1FMP1X66Mw7+28ru7LCy/or6QlYHIHCHGx/ONGdtHABA9B6MTGO/6Pc/8e8uz1ce
	 XYaqARGuKeCACJAyKbKJ4PMVSXYeHu0giiS9uNt8xqqv9mQBBFe0/RAI+GsptD/JItxO2
	 BGFX91R4d+kSiQ8xR06cnk0fescjnF1JdOYCdjnWWSFqhRhX4zhVIy5X2rzzayRC7o89+
	 5CnA8IJ0UyloHKaUP9INwJRIeDpVdMlNSpoc9Vc7UF7HhRf3ta9LfZLIxzBoJgF8TApjb
	 olWpPcHcFmqMMNRjbr1ZLdib8oyJ694oOUpU0/iLLVlRTT3GWxJIS0sZoZUYZzm0G9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629154;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wkEluUfj/WGVtgyuXSTnsXKK+ML7sa6Og8P63qV/4ys=;
	b=GBqfQ3BqPOdSyjqTcfKTBLxtXC88lHgIT0gg2pXNJTmGP1cDleTSI0NuXIIHuYEOMEKK
	 UKja8QW2gC8Lok1Nl3xBkG3ie5fE4jHP/BXk+Hzu5wVJMw8Y8tD/ApfHOcKCmTPP3cuP8
	 qY2s/0HoGZtqEjsVcUK8b/VpPMDR73KHSajwz5q7LFMmJvT674IgvaIiQLDX9ZshaFf8o
	 OoboTybZFJOkfvIiXXZ5gooS1Kr7nvQEb3R7/HsMEZIrSI/a6VQvsL6poVNTBpD+aK2UU
	 vjtheX5GPRzSz3zTtte5rjXRHXpWigbBge2cOBoUXMtF6iUJORrCE/MKv+A3KuaklhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A596606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414FE1F00A28
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629149;
	bh=wkEluUfj/WGVtgyuXSTnsXKK+ML7sa6Og8P63qV/4ys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SYnrR5sGrnEETLcEXUpwjRAoNUEZU/8BpDdXjyBEy31IHpDIbqGXTm0P5UzOcj2yF
	 jVarqm+6Tdd4MCiSOZ5j0HdYM3+XM6Uf/8WxZPovDbQAbXIj43bwQbrD1t0cIg6AuA
	 4K6m1Gpp6WAClSITQyBqHyStIyQcVes8nlnbr1lVmkAYkV0j6NjEUsYiQVfVeWG+Fh
	 yPf4zO/Uxm+zSCkyRDAD/xc0omH2+GiW2E4kqAxDch3OEubVWXmFn/o6DRXII52oCl
	 MxmdpnFDkZk2sJKcfEEtJsDGoTAilqku+h1ji0YKVgwDpyw6xec8/ikaS/nWy+Jmm5
	 MCHdeh8J0a1hQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso2578699e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:19:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxqZu+ftM9Vf4tXkLfU/bL36kqUU69hRvOwxnqaUINIaZkGvYXmAK3OH0spQYb2nEqI2Hp6yTRLUOKhEdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tOWoDj2Z75tCRAvwQgWGnQzt50mDKB66ptPe7rAXdSzuW8gWb
	uMmTB3ntV8hPi3PyFiaH5+IcIAE1/g+lZkwcLdc28cRQ/f6copAoCIR05F49J52ofGbmZPwMEgx
	FOJgvGwhqYsL7+WvlDURmC5lVGJksBXU=
X-Received: by 2002:a05:6512:224d:b0:5be:3e0f:4901 with SMTP id
 2adb3069b0e04-5bfd956e604mr3140207e87.39.1793629147649; Mon, 02 Nov 2026
 06:19:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin> <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
In-Reply-To: <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 2 Nov 2026 15:18:55 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
X-Gm-Features: AclHuK-gOvZIt77BDkYuF4o-ILwXjzx7KMGEzFhwi_4dJA8B8VxZMsmTmWfgoNU
Message-ID: <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: David Laight <david.laight.linux@gmail.com>, Joe Perches <joe@perches.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:12=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Nov 02, 2026 at 09:32:06AM +0000, David Laight wrote:
> > > LKML has become mostly a firehose of patches that are already going t=
o a
> > > subsystem list. The reason is THE REST: it matches every file in the
> > > tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> > > single patch. During the week of Oct 1-7, 2026:
> > >
> > >   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
> > >     sent to at least one other list;
> > >   - with ~2,100 subscribers, that is about 29 million deliveries per
> > >     week for LKML alone.
> >
> > That sort of implies that 2100 people are happy to receive all the
> > patch emails.
>
> Doesn't really matter, since those who are at gmail.com aren't really
> receiving "all the patch emails" anyway and they are impacting everyone e=
lse.
> Gmail is simply not usable for high-volume mailing list traffic.
>
> There are other, better ways to get all patches that doesn't involve
> subscribing to SMTP deliveries.

So it occurred to me that it might be actually better to stop sending
messages directly to LKML subscribers and only make it available for
download somewhere and as a Lore archive.

Is there really anyone depending on receiving all of the LKML traffic every=
 day?

Rafael
