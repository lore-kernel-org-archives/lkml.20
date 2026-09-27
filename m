Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880C93B4E94
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790476946; cv=none; b=CgRkOcHuRkDaWhWx863nRoszmEd9sjwRxPaJjVTDchTgmn5nTht/RXBgYwOKHn4/IaCSU5E6El6LdrdsN63SlZWe1YFsyWWjGn4Lu77env3BaLit0Ana7Z0us7UE2CJgNrMNkv/vvAoU84Akx7uOMCtUHFPbsBJiyLKam4Vwstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790476946; c=relaxed/simple;
	bh=CwNv3PDCpSo/2PKr8cuJGpWe7BPaOvLrDZKrCkc++FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cj7tJfnHhfCif6aF5kNse3WZ5Sl6fApv4ow1k07xADDLb42Dz0SgIj/q1EJiRIzIdlukPWaqGFSB5ixLruMQ/3amUwiVNVBK5A6Xc2qN9qeLF0to/KHHIXbMhNqObbfdceTpdSrSfh0vdqFTsVx0lHYGOwhlBv8ydbsZo9EX3ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cIiBsD56; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cIiBsD56"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 2F7C2BCFC9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:42:21 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 05570BCFC0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:42:20 +0300 (EEST)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 6E4241FFB50
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:42:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790476939;
	bh=CwNv3PDCpSo/2PKr8cuJGpWe7BPaOvLrDZKrCkc++FU=;
	h=Received:From:Subject:To;
	b=cIiBsD5611vZ5JrRx9Vo7W634DbXvRx0RJGj+LVKfDNvvhBncTFQRa9uFY8G75owB
	 vNFNXvNnpG5TdY6krdvf4SgtBXdH2GtL30dSdjK1LQa6I1dfCxRfmRX38vKjGHyZ0D
	 Ao4Lu7giYHe7HkcwADrd6Ny/cPpnR+/KTLfgzkBkIRdpvQ2mkwKnc02S6BWR+3TVS9
	 lcPLgCiN6XDolrJGz1E9+xbincNQZUXLtrO2tPdFbamNKM2h7204vnMgzAfaQL6G5X
	 CEON+2uXDpWHCh5PBfdhd3MLrWnJy+HewZb5e9sqN0kWXeftKzdAG6O6+lFDzJglJ7
	 BNaeErIVMXfkw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.38) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f38.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f38.google.com with SMTP id
 d2e1a72fcca58-8814e797a5bso290889b3a.0
        for <linux-kernel@vger.kernel.org>;
 Sat, 26 Sep 2026 19:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwG3pX8HF3tyg0Y7oM9bGHZtuIM30vqYzmv6Qi0TPol0LftTLXZNwPj3FxvP7vlSw8XcGwZ1XlysXQEIoA=@vger.kernel.org
X-Gm-Message-State: AFuF++nfaGHW+xyLkKaYFEKHEolg93By059155e6kOjZLVgNJweVSD1P
	bzLXqFIUrerP7ER8xTGL05xUNN+VL2EBPsKWwO3cymqVVp5azjNf6TeXtV1J/3NNYBir8gjD2yE
	nX4GOPLqeO9MyYkLUsYNpq3afT+rvVto=
X-Received: by 2002:a05:6a00:1954:b0:880:fe7b:bc55 with SMTP id
 d2e1a72fcca58-880fe7c018emr2997244b3a.56.1790476937863; Sat, 26 Sep 2026
 19:42:17 -0700 (PDT)
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
In-Reply-To: <arhtsrVb82vr6U-p@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 27 Sep 2026 04:42:06 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
X-Gm-Features: AclHuK_psYyUaNN45oZJW2syw4hvksOfPWRWLYazFH1JdDm07FTCr7i1M_cdNyw
Message-ID: 
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179047693962.1894507.16818258808980396093@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 27 Sept 2026 at 03:13, Sasha Levin <sashal@kernel.org> wrote:
>
> On Sat, Sep 26, 2026 at 07:54:27PM +0200, Antheas Kapenekakis wrote:
> >> It didn't in my tests either. With AGENTS.md pointing at README, one agent read
> >> only coding-assistants.rst, and the other read that plus generated-content.rst,
> >> which coding-assistants.rst references. Neither opened any of README's other
> >> pointers.
> >
> >They usually read it when they need to. I find it is 60% of the time.
> >Of course, this does not compensate for behavior that should always
> >apply. Sol 6 also has the annoying habit of modifying readmes
> >randomly.
>
> Agreed, and the rules in coding-assistants.rst are the part that should
> always apply.
>
> >> >agents.md file before every message. Unsure if it still does, I do not
> >> >use Claude. agent.md files should be specifically designed for agents
> >> >and handwritten. Moreover, they usually need to be tuned for the model
> >> >generation in general, if not the provider and model specifically.
> >> >Which brings us to 2.
> >>
> >> The rules README points to (DCO, Assisted-by, patch format) are the same for
> >> every model. Personal and model-specific tuning belongs in a personal file.
> >> Your sample shows why the shared part should come from the tree: it asks the
> >> agent to add your Signed-off-by, which coding-assistants.rst says an agent must
> >> never do.
> >
> >You are correct. Agents are tools. All of their outputs are the
> >responsibility of their users. They cannot apply DCO.
> >
> >For me, I make sure to review copyright and test my kernel patches
> >before sending them or pushing them to a remote. So my agent should
> >add my sb and the assisted tag otherwise the patches need unnecessary
> >cleanup. This is my personal preference. The mainline branch should
> >not poison my agent's context or provide conflicting instructions.
>
> Your issue is with coding-assistants.rst, which says agents must not add
> Signed-off-by. AGENTS.md only makes agents see it.

I do not have a problem with coding-assistants.rst staying as it is
now. But it does not make for a good agents.md file. And neither does
the readme.

If the user asks an agent how should I use LLM assistance when
contributing to the kernel, then the agent will find this file
correctly and explain the basics to the user. So it works as it is
supposed to already.

> [ ... ]
>
> >But as far as I know personal snippets are meant to be additive. I do
> >not think there is a widespread override for agents.md for the default
> >one. Codex seems to have one but there is only one google result on
> >it.
>
> Codex reads AGENTS.override.md in place of AGENTS.md. Claude Code doesn't load
> AGENTS.md at all when a CLAUDE.md exists, and Gemini reads GEMINI.md unless
> configured otherwise.
>
> The agents are designed exactly for this model: the upstream project has it's
> own AGENT.md which is relevant for the upstream side of things. Downstream is
> able to modify it as needed, either by carrying an out of tree patch, an
> override file, or whatever else works for downstream.
>
> >A large generic readme that offshoots to 30 other readmes is not an
> >appropriate agents.md file.
> >Documentation/process/coding-assistants.rst would be a better start
> >for a symlink but even that is not particularly lean and would likely
> >degrade modern agents. It still contains offshoots to 4 different
>
> Changes to coding-assistants.rst itself are fair game as separate patches. This
> one only gets agents to load what we already ask them to follow. There's no
> substance here - we're just making dumb machines behave better.
>
> >readmes, and the "Procedure for finding and fixing bugs" would degrade
> >most modern models. They are already RL'd to do what they are asked,
> >and conflicting instructions could lead them to e.g., commit when not
> >asked to. For example consider:
>
> [ snip ]
>
> I get that you have concerns with those docs, so feel free to propose patches
> for these.
>
> I do not thing we need a seperate machine-only readable set of docs. If these
> "agents" can't do better parsing those docs, then we shouldn't bend over and
> write them their own versions. I'm okay with doing better at pointing to those
> docs ("RTFM!"), but I don't think that a fork of the docs is sensible.
>
> If you disagree, feel free to propose changes to coding-assistants.rst, as this
> is really a doc that gets read mostly by machines.

I do not disagree or proposed something different. Agents can read
docs just fine (rst, html, they can even read assembly code assembled
just fine), and the existing kernel docs are fine for that. But they
should only read them when they want to or when they are asked to. I
did not propose rewriting the docs for agents.

I think there might be a misunderstanding with what an agents.md file
is meant to do. It is meant to be a small file that lists a few
notable things agents should know about a project. For example, see
[1][2] I made recently while working on two projects. Most projects
are limited in scope, and most teams use the same LLM agents more or
less, so it is easy to make a universal agents.md file that is then
extended lightly (but mostly not) by individual members.

For the kernel, this is harder to do because how people use the kernel
varies a lot. Therefore, people should make their own agents.md file.
Just like we make our own deployment scripts, our own debugging
scripts, our own patch preparation tools, and set up our own email
client with custom routing rules (which takes multiple weeks to get
right, far more than typing out a 50 line md file). Why should the
kernel make an exception here and say no, this is the agents.md file
you get and if you don't like it, go figure out how to override it
with your harness? If the kernel should provide documentation relating
to how to make an agents.md file with example snippets, this is ok,
and mirrors how other components such as checkpatch.pl are provided.

An agents.md file is essentially the list of 5-10 things you do not
want to have to re-explain to the agent every time. That's it.

Yes last year, RAG, context optimization, memory techniques etc etc
were all the rage, but after the labs started RLing the agents
aggressively and doing scaled rollouts in VMs all of that has gone
away. Agents are now designed to discover a codebase in 10-30 seconds
fresh in every chat, without advanced memory management, do what was
asked, test it, lint it, and deliver a result.

And modern agents will also write kernel code and compile it and use
checkpatch and deploy it and write synthetic throwaway tests and
enable debug fs and sync a partial module so they do not have to
reboot a device and read /dev/mem directly while creating a kernel
module without being asked to or with a special AGENTS.md file.

Yesterday/today, I made a USB C controller driver [3] for example and
it works... Then a Zotac Zone user appeared so I wrote a hwmon driver
[4] in 5 minutes while the other agents were proding the battery and
type c of the samsung device (yes, there is also a battery driver).
And the thing with [4] if you look at it is... it is clean in an
upstreamable state and only took 4 back and forths... 1 month ago, I
was annoyed I could not use my 8bitdo controller outside so I just
ported the SDL protocol from SDL to the kernel enabling IMU and back
buttons outside of it and Steam [6]. Again 20 minutes. Of course, DCO
needs care with both [4] and [5], so you see for example [5] says
"GPL-2.0-only AND Zlib" because it is a mechanic (LLM) conversion from
SDL and [4] clearly lists and credits the source on the preamble but
sheds copyright because only registers were referenced. An agent.md
can't fix that. I had to write those comments and specify those.

But in those, I did not use an agents.md file at all. Therefore, to
come back to the original discussion, what is the point of creating a
shared agents.md file? Is it to help experienced kernel developers?
Because it won't because they do not need one. And if they do, they
can spend an hour and write one with their particulars. If it is to
help new contributors, that's fair, but without an optional agents.md
standard, how do you prevent getting in experienced kernel developer's
way? And also, how does that agents.md file help those new
contributors? Because omitting sign-offs is not helpful, they will
need to add one even if they do not understand what it is, and the
problem is they do not understand what it is and telling the agent to
skip it does not solve that.

As I said, both [4] and [5] are derivatives and needed special care in
the copyright and top text. If I was not careful and added my sign-off
without the preambles, it would be a copyright
violation/misattribution. But I had to add that myself, the agent did
not do it, and me adding my sign-off manually after that would fix
nothing.

Best,
Antheas

[1] https://github.com/anatase-org/anatase/blob/master/AGENTS.md
[2] https://github.com/anatase-org/spaces/blob/master/AGENTS.md
[3] https://github.com/anatase-org/patchwork/blob/42a339c18111b17bb58ca28cd72fb3eca21cf2ec/drivers/usb/typec/samsung-emuec.c
[4] https://github.com/anatase-org/patchwork/blob/5f66acf71de3dd59d0b7504a3168d1dde44c5064/drivers/hwmon/zotac-zone-ec.c
[5] https://github.com/anatase-org/patchwork/blob/04d0b68af73d5e801c97c272ebbbcf5e7ebd9e3a/drivers/hid/hid-8bitdo.c

> --
> Thanks,
> Sasha
>

