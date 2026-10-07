Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A94B04AF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370708; cv=none; b=lFUG/7339wqI3OsLaSVDXWXCuIeV0Ug4HKNhJovBYvJdWU6/TEP5Nk2LV2ezvNbM9ZPHsOS8OS7alHaHgfgb0x8vZ1ZFDhkG+OR3XrmHMCh7BEnTfxWSNnMD5WLarohlGo99sD6eEd5yvD1A6TIJlyAfNF5+kcHixljJ7+uZ9Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370708; c=relaxed/simple;
	bh=LWqH4rnKhkaeqZsMRrWYyA8Vi+baDRXZJhcaHBpXDjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZb+UyJ65PEDJKj3hVBDpOtiKIqdHZ4RG5D+bl5vj5rNUvz/lvdqmRVLitlS55lB+YNdXcBNLZt+gHIzrUBGZdXkxT3hMriw+6DZpVPpcS2eq+DJPTlAD+/4diBbyeeSiW1jgpAoJSvTebQpA3Br3vm1K+mpCf5yISUDG9vzywQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nGWBHaeX; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nGWBHaeX"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id D68965E5FD
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:57:49 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 231DE5E54D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:57:49 +0300 (EEST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 801B6202BB2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:57:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1791370668;
	bh=ddvlJM2l+2DMR1hq6/JuDx9Ck+W72pk1Eaag+1Bwh1A=;
	h=Received:From:Subject:To;
	b=nGWBHaeXAIwp9tozsRL2DHziNOq2Vo6tMtY7dUAU8FZfE778BDouRPUZiaPDfwbkE
	 QnanTwARg9x4zGei/4zt4AW0iaMGD36dcZ+hn5XO7lswYI6oumm9fROQLL8oqpehHk
	 7ymuunXP2xkCXiMWDWxdeQH1o04laIR5xWKNZKfj6WK2JbbtBMenWSjYSnkE/HR0JT
	 xWQgbKKj0qVxLdYSry3/MDaQ2wf2wQKjCVkCjFXHyYFvWPD0YsuFxX92wRmfKIs+yh
	 JX6Fy3yihe79ewJpErvfjlzEIjmc+hgjccSfVwteWN46evPkWtC2DxzAJFuGJo0xUQ
	 zjK8UxMyrewLg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2e60f9af6e6so3598915ad.3
        for <linux-kernel@vger.kernel.org>;
 Wed, 07 Oct 2026 03:57:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzn9TSpl4AQdsx+eovyiosJ2VbYQ4UqBKPt1uLko/8EVnyxU3BjQG5vzoQACzTbL0TfnDk5s2jlR51yOQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkSG0huJJ2AXUM+RolLdj5hbXVDqQeF+wxkhdn3/kncSJ2qxZH
	YY4agRgzBfP++Kvgxid9aZe07fi0CRDR5kFj1aiO+F1hG2wyikE5CePNk3EUdbPatt8PYnO0rub
	G9gWgL8v80//aDnl1ic74aihbE0kg0eU=
X-Received: by 2002:a17:903:3c2b:b0:2e2:d26c:df9f with SMTP id
 d9443c01a7336-2e6003c5d79mr19039435ad.51.1791370666132; Wed, 07 Oct 2026
 03:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
 <arkiyMt2NIydrPhE@laps>
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
 <arvFBqreU0qahkXx@laps>
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
 <CAGwozwHOttyNkC=sdVFCZYKZzhSE=cmUMgNd7cukpEE-WXm9Vw@mail.gmail.com>
 <asYINZIUxBL8I4n9@laps>
In-Reply-To: <asYINZIUxBL8I4n9@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Oct 2026 12:57:34 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFfS8qzy9K_WZRWJ_3UD_8YR6MVn6QZ1HaKPSNVsyHVLQ@mail.gmail.com>
X-Gm-Features: AclHuK_BeZbeRs6xrVuF5xmld8_euALCHxim7-h_g1D573GzFHOgEnKcEC6QxnA
Message-ID: 
 <CAGwozwFfS8qzy9K_WZRWJ_3UD_8YR6MVn6QZ1HaKPSNVsyHVLQ@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179137066812.274959.1116075252667833463@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 7 Oct 2026 at 10:52, Sasha Levin <sashal@kernel.org> wrote:
>
> On Tue, Sep 29, 2026 at 06:10:42PM +0200, Antheas Kapenekakis wrote:
> >The kernel forces you to have a local version file, otherwise it adds
> >a .test wart. At least on Fedora. So there is precedent for requiring
> >the user to create a file to disable some default behavior.
> >
> >Similarly, you swap this series into a two parter.
> >
> >The first patch gitignores agents.md.
> >
> >The second patch adds a phony rule to the makefile that symlinks
> >agents.md to the coding assistants rst or similar if it does not
> >exist. People that do not want that, like me, touch that file. Not to
> >the current readme, please. Be reasonable. Yes the coding assistants
> >rst file is not ideal either but that can be fixed later.
>
> But then you would need to run make to "generate" the symlink, which would not
> normally happen.

We would make the dependency part of a basic rule, so it runs whenever
someone e.g., compiles a kernel. Yes a naked checkout would not have
it, but after an initial make it would appear.

Something like:

AGENTS.md:
  ln -s Documentation/process/coding-assistants.rst AGENTS.md

basic-dependency: ... AGENTS.md

This would cause the file to be created only if it does not exist.
since : is empty afterwards, the rule only runs when AGENTS.md does
not exist and does not replace any existing ones.

Best,
Antheas

> --
> Thanks,
> Sasha
>

