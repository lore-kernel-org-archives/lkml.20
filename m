Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794297;
	b=EkKna6UkcWQKBBytITm+W6JB42Bymm8yfzDzqbRABdcBe60e9gy3+jItjhe2S7/Gakie
	 ar5IYsStqqGEXlB6ie+g61WKfeyJ9cKWTU8yXjBh2ukEEcX56jjrecEEBDL2FKQJD1OPg
	 BFNlZj0ol8E3wli4iGT2lOk8gU4+N0pw+ZjXCQE0n8s+2Fyaj0DG4OHkYSpWHYy6+9b5x
	 wWE+DPAuCPpKpDlbO9cFEDwnkg+XuTn1PxhIQUw89xP9vwFD1/TFPC1JZU45WI7FuZQ5m
	 ongU2Iw8UzPEIamxVaJrIejUyrmVT9vdJLSBd4lYRTSYxthHkTS8sHsoQibijV88K+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794297;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P1YQxp3XsCTd1iLiQ6IyjPG7JvNJZEb/3zHJJtVDzw0=;
	b=YLrkLZUeLVfp9NswSPAooyP5gXxv7odeYLIx0QYArp6W71LGGGr6+uc5/9tPOT5xUPBF
	 G9aPKoGRU+gJHHHy9FN3FrQJuCa5wJMwgumcDeDTyiCxZde7l5X1efu6bDgP+GI2J3w+/
	 WKSbl8zt8YEZfuQ86DpB6G05hhbfSs5xxFMc4eRgwqAAoT3Vr7kUCmdbDQcCLw4NhEMnh
	 I1Y4a7zMajxsAfE5cE5rBaj7rrTchXvdXCSs/oetxSorIpfZsJm6n4em73a77ALjhMW4M
	 t50rI/zVNyH9xhaobW+u4CG6O/3RprW84wY3WdV9L00HXpIukPQJCn46Rtv7oiQDOcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+OfHKVc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE01606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+OfHKVc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7551E1F0093A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794296;
	bh=P1YQxp3XsCTd1iLiQ6IyjPG7JvNJZEb/3zHJJtVDzw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f+OfHKVc20zlD2vQQYsmK2EZu14j3FQdm5D59yiF+0/UZfxlu5q9/bHsUh7SWGJ65
	 UYeLWbxuXpvY8VjGQ8E8lfgRw504OtohnwjG/wjGLRqhogwdIc2cLhvOl/TX0l+5yU
	 CW8lhpz7S+/XDHcm4HjoGDKPEzZ/Z3TnHMYNXn1lFiGsgcrqx3X8TiLIEXpOqSdUpf
	 2NsPm+RSxY0w2ptwMiBbfoUKQgpDIEBOiUrL+c2HSmGriS7c9FNqz7WNxOZ08v8aFK
	 HToUPIqM4aRM20ugCaImD4tUtNw5eY5gJD4iB6S7kF1ayt26rlPjfeSdkbcG2znj/o
	 6rRsbKolYHolg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso655375e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:11:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByLCaGPgBRFo9pxWx5RqQTb6px3efEHUWgTZor4Rgfg3DMRBNOko9c013ZpHJCE13l7qNwmysnFSXYNDsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/+tKHmwVXV+0xd8/d1e4KIMuY5nsmTjLi7ri46Sgec+8Ht6n
	yeMDo0QGTDKxDKt2R0wuoWfoqo8gaMFRI/1OKLNUqCfisAte63lEs0HxbUIz6F3K1ktPyw04dJX
	cOc6HfCiy27hTM0R/C+sGtz3dsJgNlls=
X-Received: by 2002:a05:6512:1250:b0:5bf:b945:4334 with SMTP id
 2adb3069b0e04-5bfd9583e31mr5118063e87.67.1793794295307; Wed, 04 Nov 2026
 04:11:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104073813.42429-1-amittibi123@gmail.com>
In-Reply-To: <20261104073813.42429-1-amittibi123@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:11:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLkvgQN+6PvYD5jag_hGSkMcyw37PS1qbPHBPJooZ9ZqjQ@mail.gmail.com>
X-Gm-Features: AclHuK-0hyE8vjWYyjjwFPCyxZUvs4LI93ctjtI7wKXVJH90efTHDZ845WZHkoo
Message-ID: <CAD++jLkvgQN+6PvYD5jag_hGSkMcyw37PS1qbPHBPJooZ9ZqjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Replace deprecated DCS display-on calls
To: amit <amittibi123@gmail.com>
Cc: neil.armstrong@linaro.org, hanxu5@huaqin.corp-partner.google.com, 
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, icenowy@aosc.io, 
	jagan@amarulasolutions.com, robert.chiras@nxp.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:38=E2=80=AFAM amit <amittibi123@gmail.com> wrote:
>
> Signed-off-by: amit <amittibi123@gmail.com>

No commit message? Why?

Motivate the change, especially since it adds a lot of code to a lot
of drivers.

I guess the motivation is multi-context but spell it out in the commit
message.

Yours,
Linus Walleij
