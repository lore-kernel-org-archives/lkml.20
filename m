Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E544EADC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790445290; cv=none; b=S5eku2mm3xeeJUzglu3hh7n9N8t0QAZAEcrQo3izuR+U1fTEbzR7+XO3U3c8DwGotKPpsBol6fLA7suqJPtgKmhR60B6akSDJFZKp93jN48di0FBYp4OO9ZTPhpX7qHP30bDKuoHo9dbPYnkImnqSXoMGdLLCT4mqRkf+SLaZOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790445290; c=relaxed/simple;
	bh=IwTob38rh9Nx3ag7H80F2xgQ+N1EfUyDcOwbdK45NAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CP9pj1vJhmYFpiDHT8Ee7QPqYkYzikMgMuu4p2p4agEe/Owta+ZhYvAIqrX01fNcArkIQ5okwI/DIkgrL9e0Y2rNdOsTVChfts9F4tkEDZhAcFkWv/2GFf28Mb3HraK9jnR8vDGYMKs/aIybaT7532iviNMcVPFBB5tW+qp3fO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JHfEfDTQ; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JHfEfDTQ"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 2628340019
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:54:42 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 124253F235
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:54:41 +0300 (EEST)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 59F961FD64F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:54:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790445280;
	bh=SzueBkeQ0eRG00xEUOwz7fXE2kK3yYyEowQoqM97mDo=;
	h=Received:From:Subject:To;
	b=JHfEfDTQ1FLZSEzgHrUNcvFNvVztIYFu2MhsvaNFQcPBqTXc2VD/3L+RehtRpd9SA
	 eBIOv8EIc+j8tdyoKew64OHexN6mb1XfZ0oNMl7uBnLADT/0arG8QDIoM1XkoJwFvt
	 m1S8lR+5wI1FDZH6P3eicdnIywl/biYQMJzls0ZH8pC9qsRH6FHHCOB1EZinP2W5Ek
	 q0nfOS3Ye8faFMpQpPnjwhfcC8XY1eUl8Mykqra3l2MEmMvFiioRNF2g8L0zFp11lx
	 EYC+BMAoTWX7IvmXjh9UT0Z2DO0qCiaAnZfu9ePVp9eK2y4+7eyhRfkcP41eDXCLHm
	 vsl4YNx1LwHGg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.140) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f12.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f12.google.com with SMTP id
 d9443c01a7336-2d747f05ffcso7938945ad.0
        for <linux-kernel@vger.kernel.org>;
 Sat, 26 Sep 2026 10:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwz61BY/Vn7b5Veq2mqFCbrcUgwKT+CgnbkNSasbyfM9ZavG2h1fIb6FCD9ArRsq2rvrMcrCKNqBbFkOJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSdcetRprsJjf9hDY2hyCq45/lnDWoO8Khgnc87vmv9s/f9Ju+
	V6zX56pa7En5i0B1hgNXO+IsVlEBwTXd4BBDUtfDeQ9ejrNG7jNgdWzax0C7apSBIRhN37dQ3u+
	+/kz+1fs05tQv8OOyyGbMjqCKU70MjrE=
X-Received: by 2002:a17:902:e80b:b0:2dd:c053:e0f2 with SMTP id
 d9443c01a7336-2df7e43e2e7mr68505505ad.33.1790445278841; Sat, 26 Sep 2026
 10:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
In-Reply-To: <arfpV7IXRAHREMzO@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 19:54:27 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
X-Gm-Features: AclHuK8r5dYvXEgLVx7Rw1HHqS5_fpk0bTtLL8r_IaRHZREQZj9kC2xc02FCrTA
Message-ID: 
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179044528055.4105903.5455350926623680743@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 26 Sept 2026 at 17:48, Sasha Levin <sashal@kernel.org> wrote:
>
> On Sat, Sep 26, 2026 at 01:12:33PM +0200, Antheas Kapenekakis wrote:
> >1) Agents already read the readme. The canonical way to force load the
>
> They didn't in my tests. Without AGENTS.md, neither agent opened README before
> committing, and one of them added my Signed-off-by. Could you share how you
> tested this?
>
> >readme at least for claude is @README, not just README. Even so, the
>
> With the symlink, README's content is loaded directly, so no @ import is
> needed, and neither agent went on to read README's other pointers.

Ah, a symlink. I missed that. I read that as a string. Should be the
same but better. I do not think all agents support the @ syntax.

> >readme is not tuned for agents and results in context bloat. You say
> >that README is small, so it is ok. But it is not, it prompts the agent
> >to read a lot of other useless readmes. [...]
>
> It didn't in my tests either. With AGENTS.md pointing at README, one agent read
> only coding-assistants.rst, and the other read that plus generated-content.rst,
> which coding-assistants.rst references. Neither opened any of README's other
> pointers.

They usually read it when they need to. I find it is 60% of the time.
Of course, this does not compensate for behavior that should always
apply. Sol 6 also has the annoying habit of modifying readmes
randomly.

> > [...] Another issue is that you say
> >that it is only read once, but that has not always been true and
> >perhaps is still not true. The Claude harness used to append the
>
> Every model call resends the whole context, so that applies to any AGENTS.md,
> including a hand-written one. Either way, most of it is served from the prompt
> cache.

Specifically for Claude, they used to paste it before every message as
well to steer the model better. I am not saying this is right but it
is what they did up to May. I am unsure what is happening now. This is
a bit of folklore in any case and it varies by harness. Nevertheless,
it underlines that agents.md files need to be carefully crafted.

> >agents.md file before every message. Unsure if it still does, I do not
> >use Claude. agent.md files should be specifically designed for agents
> >and handwritten. Moreover, they usually need to be tuned for the model
> >generation in general, if not the provider and model specifically.
> >Which brings us to 2.
>
> The rules README points to (DCO, Assisted-by, patch format) are the same for
> every model. Personal and model-specific tuning belongs in a personal file.
> Your sample shows why the shared part should come from the tree: it asks the
> agent to add your Signed-off-by, which coding-assistants.rst says an agent must
> never do.

You are correct. Agents are tools. All of their outputs are the
responsibility of their users. They cannot apply DCO.

For me, I make sure to review copyright and test my kernel patches
before sending them or pushing them to a remote. So my agent should
add my sb and the assisted tag otherwise the patches need unnecessary
cleanup. This is my personal preference. The mainline branch should
not poison my agent's context or provide conflicting instructions.

I do understand the frustration with people not following DCO and
agents mistakenly entering the sign off. But I do not think poisoning
every kernel developer's agent context and blocking it from what it is
asked is appropriate.

> >2) You are suggesting starting to track agents.md on mainline. This
> >will make it so you dirty the tree of anyone that uses a custom
> >agents.md when they switch to mainline for a submission which is a
> >major annoyance. It'd be better to gitignore {agents,claude}.md on
> >mainline. This would allow anyone that wants to commit theirs
> >downstream to do so, while allowing them to copy their agents.md for
> >mainline submissions.
>
> Agents already have personal/override files to handle this.
>
> We also already track .clang-format, .editorconfig and .rustfmt.toml on the
> same terms. Ignoring AGENTS.md would leave users who don't write their own with
> nothing, and a template has the same problem unless someone actually copies it.

You are right that by default the kernel has no agents.md file and
that perhaps it should. The kernel is already "unintuitive" in other
regards so that used to act as a filter. I guess with agents it works
the other way around though.

But as far as I know personal snippets are meant to be additive. I do
not think there is a widespread override for agents.md for the default
one. Codex seems to have one but there is only one google result on
it.

It is assumed that agent.md files always apply for a project. So one
would have to be universal. It is particular to the kernel that it is
a very large project with a lot of downstream use-cases which makes
this problematic.

So the problems are:

The agents.md file on mainline would always apply for mainline
submissions, requiring gymnastics for upstreaming developers if it is
not appropriate.

A large generic readme that offshoots to 30 other readmes is not an
appropriate agents.md file.
Documentation/process/coding-assistants.rst would be a better start
for a symlink but even that is not particularly lean and would likely
degrade modern agents. It still contains offshoots to 4 different
readmes, and the "Procedure for finding and fixing bugs" would degrade
most modern models. They are already RL'd to do what they are asked,
and conflicting instructions could lead them to e.g., commit when not
asked to. For example consider:

> Write a fix for the bug. This part is not optional: except in a few very rare cases, an AI assistant able to find a bug is able to fix it.

Duh

> Note that fixes written in the same session as used to find the bug will generally lead to better and more accurate fixes as the LLM's reasoning context remains present.

How does this help the agent?

> Build and verify that the fix works either using the reproducer or by re-running a complete analysis; drop any fix that doesn't work and try another one.

Already done by modern models.

> The fix must not add build warnings and must pass the checkpatch.pl checks (see submitting-patches.rst).

Offshoots to a different random file bloating context. Modern models
do that already. Sol 6 even runs checkpatch unprompted so it is
context bloat for that model.

The only models here are subpar models, and indeed looking at the commit text:

> This was tested both against Qwen3.6-27B-Architect-Polaris2-Fable-B-F451 ... and Opus-5 [1]

Qwen3.6 is a toy model. 3.8 is a bit better. I use 3.8 to tune some
comfyui prompts and it works ok. A professor friend likes it for doing
some simple programming tasks too. But it is not something to be taken
seriously or base documentation on.  Esp. if it affects all
developers. Opus 5 was considered to be a very bad model too and
horrible at following instructions. But Opus 5.5 fixed that so it
wouldn't apply to that and degrade it.

In sum, adding a default agents.md is a big decision. If added, that
file should be treated with care and be handwritten at minimum and

(i) completely universal and non-conflicting if a global override does
not exist (does not currently) or

(ii) geared towards new contributors and cheap models if it does
exist, and proposing an AGENTS.default.md is fair game AFAIK. But
getting harness buy-in would be the problem in that case. But if it
does happen, you can get more opinionated and make an
AGENTS.default.md file that makes agents dumb and has them ask the
user: are you sure you want to post this? _This is a big driver, it
would take you 6 months and 12 revisions at least to merge, are you
sure you want to spend your free time next year on this? You could
make a helpful bug report instead._, I noticed we referenced code from
X project, are you sure this complies with DCO? The copyright notice
does not list the original project, what license should this be with
OR to GPLv2? Review the driver, you authorize me to add your Sign-off?
etc etc etc.

Can be annoying enough to force experienced developers to do `touch
AGENTS.md` and optionally customize it and fair game if it does and
AGENTS.md has been added to the .gitignore

For context, my job the past year has been doing agentic research in
academia... so I guess I sunk my teeth in the topic more than most.

Best,
Antheas

[1] https://github.com/torvalds/linux/commit/3d7c44f73765d98665fb97a4fb89c002c88ba1b9

> --
> Thanks,
> Sasha
>

