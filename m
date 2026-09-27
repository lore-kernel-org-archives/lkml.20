Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A03B14D4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522711; cv=none; b=J20u0aTwM/BOPiEY8hjJ8SrxnBiaZ0sIitzhf8K1TDAbBi1cfcj5ZHTajrtOENAyoJ6pyk+qrKiriWuetQjpGftAjvif/wBluWsCe3dntDiwNwSzcvANwv5Sqv99x7I+99m87hF7f0oDaQGQy4HdPB/0g7IrNF3FbmTsiVoUcio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522711; c=relaxed/simple;
	bh=FXXpJ/m9SXukOR9/+jLznrCe/cNx5vh4cTIHCCH3gWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRsqZtcyx06cr0WI5sNh3tA3zkyt9eOKCsTYWh3jMebioFMyoXmQrMwMpU6U4B9WQh7wDBr9CGu/bP32i6QITa9XPmtkoGWPJJvNUyRCEE8jtFnKtiywUe6zYHECqZF8bueJZ5AAqDmu2kXFBZS0op7pPfEoDOgqpN2u73ZAM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Td0C+GuX; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Td0C+GuX"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 2BA81BC30F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:25:01 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 736CFBC1AB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:25:00 +0300 (EEST)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C27D21FFE9B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:24:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790522700;
	bh=9EYxKZEwIcBKKrTrbFHJovIFWFpfP6CxRE7LLMHZgf0=;
	h=Received:From:Subject:To;
	b=Td0C+GuXZGk7kXxr5cm7bmsWTTTklLf8DJw2f5vJkrpzJCFvFEnPVLSlJ3Vrj6UhI
	 Efn4CiH+UQJq3u6Cm5HmJm8klC6hkyPUy1I6UVbCxE7MJ78r9aug74vPHxMkLl1cv9
	 JdxNls/0G/9yjU+CB4BbRe4xPHRB1DJT/iPaqBUDlC50kgCsr7cquINVU4nIRux7s3
	 Yky+GZ/BblNDIvSGNb0NPHZ2xSNWntnanw5Ljiy/fTfxoAaKrTrw6VVyJU6Egu1yt5
	 lzJKk6KsuYZy09O5+R2A6RC83KQzxIUmexEH4cUsoXlRSSTwGLENupIkZs3U6zzdzU
	 69YJ9/ZgM50oQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.140) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f12.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f12.google.com with SMTP id
 d9443c01a7336-2d747f0135fso14891375ad.0
        for <linux-kernel@vger.kernel.org>;
 Sun, 27 Sep 2026 08:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwPZ68S+NOW7IDcQML0fpGLOqK1FD45+I3Rya9HuEmEvSosLXAKIVCdDl5MUQQGbP6A6Afsi15h+FRKkpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUXkG2E6ireVjG+eaDg630x9Gdo488CWF0wBbS5KzPmGGF8ZPJ
	PZcDCEj6rtS5f1TMDqJO0NEwnUIs/EJu0zn4YIIkO/durv98UUQYc7Mex6rJUi+2l5DrLhaoyU8
	F7U76AbPeDjnXOi4xKRE2HXzPmet7tfY=
X-Received: by 2002:a17:902:e549:b0:2df:b488:ce8a with SMTP id
 d9443c01a7336-2dfb488f124mr23563945ad.11.1790522698228; Sun, 27 Sep 2026
 08:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
 <arkiyMt2NIydrPhE@laps>
In-Reply-To: <arkiyMt2NIydrPhE@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 27 Sep 2026 17:24:46 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
X-Gm-Features: AclHuK9DhCqbDuB_P4yOxKuZHeEYmaVaVByVS3N5p4Pxi_MwKGSGKZJSHGkxkTA
Message-ID: 
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179052270002.1201252.17347530658202262862@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 27 Sept 2026 at 16:06, Sasha Levin <sashal@kernel.org> wrote:
>
> On Sun, Sep 27, 2026 at 04:42:06AM +0200, Antheas Kapenekakis wrote:
> >I do not have a problem with coding-assistants.rst staying as it is
> >now. But it does not make for a good agents.md file. And neither does
> >the readme.
>
> What makes one good? In my tests this one did its job: both agents
> followed the kernel's rules, for about 1.3k to 2.4k tokens. If you have
> a case where it makes an agent do worse, I'd like to see it.

Small, self contained, direct, lists what an agent needs to do and nothing more.

2.4k tokens is a lot, it equates to around a 5% increase in spend for
an agent that compacts at 250k context and has 60% of its billing be
cached input tokens. Or a 5% usage reduction.

For, in your testing, adding an Assisted-by tag and a no Sign-off tag
and closer following of domain subject conventions?

The equivalent agents.md file for the behavior described in your
initial patch body is:

When committing changes in the Linux kernel tree:
 - follow the conventions of the file (or folder for new files) git
history to derive a commit subject and body
 - Add Assisted-by: LLM (LLM is literal here, only LLM)
 - Add no Signed-off-by:, only humans can do that

By the way, if  Co-Authored-By: <model name> <noreply@...> is Claude,
the recommended way to fix this is to ask claude to disable
attributions by editing your claude config. When Claude goes to commit
it gets a system message asking it to add its own attribution.

Unfortunately, this is user error unless you like to give Claude free
advertising (which I assume with the recent guideline changes you do
not)

> >I think there might be a misunderstanding with what an agents.md file
> >is meant to do. It is meant to be a small file that lists a few
> >notable things agents should know about a project.
>
> The spec at agents.md doesn't say that. It has no required fields or
> length, and says anything you'd tell a new teammate belongs there.
> OpenAI's own AGENTS.md in the Codex repo is 320 lines, about four times
> the size of README.

The readme you symlinked is an index of readmes, not a set of
instructions and not something you'd tell a new teammate. It is not
self contained and when self contained provides no usable information.
Ir relies on additional tool calls to derive a policy (more
expensive).

The codex agents.md is on the larger side, but it still does what I
said. It is self contained (other than some API detours that the agent
won't take most of the time), and lists how the agent should work with
the project. It is also qualifies as "anything you'd tell a new
teammate belongs there".

> >Why should the kernel make an exception here and say no, this is the
> >agents.md file you get
>
> It's a default for people who haven't written their own, the same as
> .clang-format, .cocciconfig, or .pylintrc. Anyone with their own file can still
> use that instead, and the spec says "explicit user chat prompts override
> everything".

style guides and formatting configs are universal. I doubt any of us
have had to change any of those files.

No, people cannot replace it with their own. agents.md files are not
meant to be replaced.

Yes, they can be replaced on their tree. But when switching into a
mainline tree for a submission, the default agents.md file comes back
so it either has to be universal or gitignored. As you noted, recent
codex versions have a .override file, but this is barely documented
and not standard. As of two weeks ago, Claude can read agents.md
files, but this is not on all occasions and comes with caveats so
claude.md is not a replacement. There are also at least four other
popular harnesses you did not list alternatives for. People should not
rely on undocumented behavior to work with agents on the kernel how
they want.

You need to address this on your next reply because you skirted this
and it is the major issue in your proposal and why it should not get
merged.

> >what is the point of creating a
> >shared agents.md file? Is it to help experienced kernel developers?
>
> Yes, and everyone else too. README is an index, so it helps the agent
> figure out where to find things, whether that's an experienced
> developer working in a subsystem or someone asking how some part of the
> kernel works.

It doesn't help anyone else. README is an index = wastes tool calls
and destroys the environment when deployed on a massive scale (as it
would if this got picked up), while containing unnecessary information
that degrades model performance for everyone

You also need to address in your next reply how it helps professional
kernel developers (ie is their job), that will find your symlink in
every mainline checkout and have to replace it manually if they do not
want to degrade their models. They spend 40 hours per week on the
kernel and if they want to enhance their agent, they can spend 20
minutes on an agents.md file (which I assume a lot have and this patch
will break the workflows of)

Addressing the above two comments is not optional and you have not
done it yet. I raised them multiple times.

> It also covers the patches maintainers get from people who never write
> their own. In my tests, two current agents without AGENTS.md got the
> basics wrong: one added my Signed-off-by itself, the other added no
> attribution. With it, both got it right.
>
> >Because omitting sign-offs is not helpful, they will need to add one
> >even if they do not understand what it is
>
> If someone adds their sign-off without understanding what it certifies,
> that's on them. We can't have agents add it for them just because some
> people would ignore its meaning anyway.

I didn't say we should make the agent add it. I said if someone wants
to do it it is up to them. Not you, not the mainline kernel config,
not this patch. And disabling it does nothing because the user does
not understand what a sign off is anyway and will add it later or
submit without it. In which case you get broken patches anyway and you
solved nothing.

> If you think a hand-written AGENTS.md would do better, feel free to
> write one and propose it. For now, this one seems to be working just
> fine.

No, I am fine with one not existing and it would be my preference
actually. Ideally it would be added to .gitignore as well.

That just does not address your need of steering novel contributor
plus LLM, which I tried to help with. But if you do not want to put
more effort than a symlink then not breaking our workflows is more
important so this patch should not merge.

Best,
Antheas

> --
> Thanks,
> Sasha
>

