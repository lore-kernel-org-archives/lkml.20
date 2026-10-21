Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573016;
	b=uYZk3qJGPRtALDbPDH/InlnDwqvMAASmofzsyyzSqCG3amyeE3FEs26MElBC3ma3srne
	 kywHn1/1fueGUbCglfPAcrKp4c1pNAG6oPKnliGEN0ohrceFsVqoC/x+OfAUJfznPQbyc
	 F1fZ4cRuWf8j2y0u6nLzG8W01OA+cQEQQ/3fVByk4Edyt+cWDh6rv71qV6B/utmLX9Wpq
	 8yDW/qBnyNjb8fkXIo1v2+qK/66jg57wPfnsjlB07Y0bxF1PxzlYcwzrx0CTBqeAY+PFt
	 lmbCnsb2Buk61gSqCbC5sF1KELs9NbUMNmjSCxVe/YaFa7sYyEgnkaiytk2pMlmLrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573016;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SIf+wKLYHtIOa2fs6GA+xJQ9mhiGEJQi8Vfrtnjdw4w=;
	b=rr5LSOGruAgWojiAtsxxhdoWF3U8FCOHgXGS2+ue8KAcmfOdMze+LJylqJNfveVm4GK1
	 OC5fSnX9RZVgV7e+kkCyeNKxw3XT2Nz/jiIs1UySkwya46Z66cCPA9CVo5HUO/REfFTft
	 5SBuGy7531i25tUv58VfvP8b84NFS6h6A8Ml6hmKCTvjCllV9B1wd0gDzB/8IuFJ0LUQt
	 7iPlxxxh9Vku6mu4AhZg1N7Nn8xs0TDZBfOneyITyXxKWDfGGDyNQ8BrWqUKS/hf5JRAD
	 KnaVo5rxlNXKpsFKqyZdjakHQACJj/7jjHiZWCOimkeEF/F70W+HA+tVnSoC8D21WEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gU6KFtyX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262C2606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gU6KFtyX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FE51F000CC
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792573015;
	bh=SIf+wKLYHtIOa2fs6GA+xJQ9mhiGEJQi8Vfrtnjdw4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gU6KFtyXA/eWF6UAj1J+fcVGy744HCQe+rorS9Y4zWwgTi+XXVuVhRzl7gHJyU8Oo
	 WoPzNGFmjKWUByO5sUlv0lOWWvTcIrKXRnIhp7kNi4V0FT8FumM3106eH7nNVlZGjd
	 csxLp9SE6sGldurxb7MLEOcmfvbGC5Q1WQJ+RjDvb8iJ8xgkMyDJNBVwcFOslyPMN7
	 2fQSxE1dabLQusZEVTD6PAGWE2kci7K+KnC/QtZpGjKIRdyUhEAETu+3qD4Nkj0/RJ
	 qMamiMudZOKn/Xdwqz+dX0n3Cz3xz2EbfsU/B3+Ob0xx0VZSQUObTRd3TmcVxhORIq
	 YT/irfw3m3tQg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c423b145922so52249766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzsU3g+jxtmxslf+VB01sSSc+Aody1NYeFHcgo/CqWK8VXN4C7IPmwVWrZZBu6M71dNNfFjPx9OMek9bE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPOeBJRpmxDY/LlRqpPJRFO1LPG6zrhy56ZaS/wtriUOEILGyX
	b3c98HxunX0Pe8DUEXcYPC2moDih0sJXPQJG4Nq0rxYTY8bMwk5wDRSqfFgaKv+pIgFVX7lXu5D
	+YKHV5RN0hLyO//i9Ge+IRqizdAvEUYw=
X-Received: by 2002:a17:907:8687:b0:c35:d50a:1352 with SMTP id
 a640c23a62f3a-c4679607763mr110430566b.11.1792573014394; Wed, 21 Oct 2026
 01:56:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792345559.git.jan.koester@gmx.net> <CAKYAXd_2AUVQFZWcmk55fBU2Rk-REb-onj38whT=kNCuZ=COew@mail.gmail.com>
 <0cadbdcf-6074-449c-98f9-3aeda3756160@samba.org> <TYZPR02MB6959BC66EECFB5D178F92012E6672@TYZPR02MB6959.apcprd02.prod.outlook.com>
 <9b5b0f6c-9105-4e30-8608-6f222b0e2a6e@samba.org> <TYZPR02MB6959812BFC392957EDDA8C67E6672@TYZPR02MB6959.apcprd02.prod.outlook.com>
In-Reply-To: <TYZPR02MB6959812BFC392957EDDA8C67E6672@TYZPR02MB6959.apcprd02.prod.outlook.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 21 Oct 2026 17:56:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9ppcrwJEcjFzsqOq0SoD81E5GXDU1utEVP6=ywaL+o9w@mail.gmail.com>
X-Gm-Features: AclHuK-rqrXSSN_U5qyAKwHz67uGRda1ZtrQ0Kdn46xBn0-lPSiH6U1qPyisTB8
Message-ID: <CAKYAXd9ppcrwJEcjFzsqOq0SoD81E5GXDU1utEVP6=ywaL+o9w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ksmbd: NTLM pass-through to a domain controller
To: Wang Zhaolong <wangzhaolong3@outlook.com>
Cc: Ralph Boehme <slow@samba.org>, Stefan Metzmacher <metze@samba.org>, Jan Koester <jan.koester@gmx.net>, 
	linux-cifs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	Tom Talpey <tom@talpey.com>, Wang Zhaolong <wangzhaolong@fygo.io>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, wang zhaolong <wangzhaolong@fnnas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 12:52=E2=80=AFAM Wang Zhaolong
<wangzhaolong3@outlook.com> wrote:
>
> Hi Ralph,
>
>
> > may I ask: why? What's the benefit over using something mature and Open=
 Source that already does all that and more?
> >
> > Just curious. :)
> >
> > Cheers!
> > -slow
>
>
> Fair question! :)
>
> When I first had this idea, integration between ksmbd and Samba's AD serv=
ices
> was still fairly limited, so I started thinking about a more tightly
> integrated solution for ksmbd-based NAS systems.
>
> It's great to see the community making progress on this, including Jan's
> recent patches. I'm happy to see that happening.
>
> At the same time, I'd still like to try something different: a small,
> Rust-based AD DC built with ksmbd in mind. I don't know yet whether it'll=
 offer
> any real advantages over Samba, but I think it's worth exploring.
I strongly support this work. The benefit, as I see it, is that a
GPLv2-compatible AD DC implementation integrated with ksmbd could
provide both file sharing and domain-controller services in one
ksmbd-based solution. This could be useful for NAS systems that need
to keep their software stack GPLv2-compatible.

Thanks.
