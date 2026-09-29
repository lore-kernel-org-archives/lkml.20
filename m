Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C543ABD8E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694211; cv=none; b=EXWrYLuDuHxrVjtBx5VuBLJGiUOwq/ZkyUQnhviNNAxaYJGs+ATiFWi8acHTdhK1uYQvZjG+kbEvGIcZPcgNfWPhIFKSxgsajPtG135wxCih63NaJvGoYXtZFKQMulXEf7lqz+eXnyH5kn9JlPwGfmUbXuD+5TtFFOvWPMj95eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694211; c=relaxed/simple;
	bh=IMBdnMr73s0jPE0vT1t1QudzkHs0ksFQ9CEx91z8OLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ofc6F7kOktAqu86BqmWnq+ibpzhqGgq6XOr/BXFnYTdJUHLfn+6gwy7GdbyIxm/4s6p1H7Ewlkq48J5W2OX9ihxDTl3Y6nzShTziiphpfxYI75E9fWEpr/j2s76i7xjzgkt+OwBgnF2qLsWxBa4OYaZco0HKPhhUiClg8YTui+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=U6evshf6; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="U6evshf6"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 2A7E8BFDD5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:03:07 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 9DB2CBFC6F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:03:01 +0300 (EEST)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D4A541FFA2C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:03:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790694181;
	bh=Fq7ixrFiJrmYh9E7sS71VmUBnUyVUMq7Y9wxXQgpMoA=;
	h=Received:From:Subject:To;
	b=U6evshf6gfAMbKLrRKvFLepOuI9kJjEhPEwI6HEsuMrtbeY+O78ma2bKdGDLBaJop
	 FAnTlUpU8urGAOhyiSAqdhDK1Fa5sAWF+q6R4i0nYOzyarz3B8w7U4KmE8hI/CMtVM
	 8DO0sH81Ak5w1vWz8oWSmrbR7tg+zudnK3GqNoITZqgLyIR/1Fxg5JxvA5dQFjR9ia
	 S4dRDmvzXd0Llk0h/T+tLgGYDMnjLWgZUA8f/bdmp1SERPL/w80niYp9t58IFw9Fvg
	 sOyX4Pvb+dAbfEbu6kARt+OlQxxxT2nBzlIWUgFOUPH0HdgDMiwKjqO0YPOio+PMas
	 iBM37/WIdmz8A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f42.google.com with SMTP id
 41be03b00d2f7-cc797656e36so1349150a12.3
        for <linux-kernel@vger.kernel.org>;
 Tue, 29 Sep 2026 08:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByo/djN+e/l2ybsmiEMUSG0pcKLXEgFkcPIJKjOSjn98ENmVGrXPuYIekTdUFjK5tCCILO5YaRUZAnoSwU=@vger.kernel.org
X-Gm-Message-State: AFuF++l8cN36nS+lm1Wf/6WQ58vAGEWPLdrOVoT3J9NK4Wa2q3rYrHno
	X2iiZVu5vmi+lfxRf6QE9enLFtHALwXWdWnT1Ip2qFmCemeDvr3GlYijve4Jwr16teHxChzL6AE
	JroLLGt144EuoInqmadQEfJTmq3XDcoo=
X-Received: by 2002:a05:6a20:244d:b0:3de:5212:ef48 with SMTP id
 adf61e73a8af0-3de5212f325mr8517722637.37.1790694179386; Tue, 29 Sep 2026
 08:02:59 -0700 (PDT)
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
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
 <arvFBqreU0qahkXx@laps>
In-Reply-To: <arvFBqreU0qahkXx@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 29 Sep 2026 17:02:47 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
X-Gm-Features: AclHuK9Ma94Rjlyw1gzwy_ntdbuZQiV23QZbvuSn28lrhRiHscyF7HyryPiPfqg
Message-ID: 
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179069418114.2556220.14943200790236293670@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 29 Sept 2026 at 16:02, Sasha Levin <sashal@kernel.org> wrote:
>
> On Sun, Sep 27, 2026 at 05:24:46PM +0200, Antheas Kapenekakis wrote:
> >On Sun, 27 Sept 2026 at 16:06, Sasha Levin <sashal@kernel.org> wrote:
> >> If someone adds their sign-off without understanding what it certifies,
> >> that's on them. We can't have agents add it for them just because some
> >> people would ignore its meaning anyway.
> >
> >I didn't say we should make the agent add it. I said if someone wants
> >to do it it is up to them. Not you, not the mainline kernel config,
> >not this patch. And disabling it does nothing because the user does
> >not understand what a sign off is anyway and will add it later or
> >submit without it. In which case you get broken patches anyway and you
> >solved nothing.
>
> Again, that's on the user. Your argument is saying that we should just drop
> this whole DCO nonsense because no one understands it anyway.
>
> We can't stop enforcing things just because users don't bother reading the
> docs.

If it is up to the user, then this patch is not needed. If it is not
and the kernel should make LLMs prompt the user to do a better job
with DCO, then this patch does not provide a solution.

I never said anything about enforcement and this patch is not about
enforcement anyway.

> Nothing is stopping you from changing this behavior to your liking either, but
> at that point it makes you a downstream consumer on the kernel, so you get to
> carry that delta.

I am aware. The issue of switching to a mainline tree for upstreaming
remains. Your symlink would come back. What is the solution for this?

> >> If you think a hand-written AGENTS.md would do better, feel free to
> >> write one and propose it. For now, this one seems to be working just
> >> fine.
> >
> >No, I am fine with one not existing and it would be my preference
> >actually. Ideally it would be added to .gitignore as well.
> >
> >That just does not address your need of steering novel contributor
> >plus LLM, which I tried to help with. But if you do not want to put
> >more effort than a symlink then not breaking our workflows is more
> >important so this patch should not merge.
>
> All I care about is having all these "agents" follow the rules and guidelines
> that the kernel community set around LLM contributions. I'm not trying to
> improve the quality or make it more efficient. This patch is purely about
> having the majority of LLM agents follow our rules out of the box.
>
> If you want to spend a few months trying to massage an AGENTS.md to the liking
> of your LLMs-of-choice, then go at it.

In doing so, you should consider the environmental impact and cost
this symlink will have by providing an unoptimized indexing blob to
LLMs which will also prompt additional tool calls. Then, the headaches
it will cause kernel developers that do know what a DCO is or want to
have a custom agents.md file, specifically the git errors that will be
caused when upstreaming as the agents.md file will be dirty.

I get what you are trying to do. But you need to address the
underlying issues here. You can't just handwave them.

Contributing to the kernel has never been "out of the box" and the
kernel is not set up for that in multiple ways. If you want there to
be an exception for LLMs such that they do a decent job at it by
default, if anything to prevent a flood of patches with obvious
defects, then I would agree with that goal.

But in that case, you need to make sure that people that know how to
use LLMs and know what a DCO is are not negatively affected. No, it is
not ok to append 2k tokens to everyone's context or 2-3 more toolcalls
for every agent thread. It is also not ok to have to do gymnastics to
remove the symlink when switching to a clean tree for upstreaming.

And even for novel contributors this is not ok. I am blessed to have
the disposable income to pay 100$ per month to access LLM services.
Even so, I have to make every % of usage count. Novel contributors are
not. They are typically using free services, 10-20$ plans, or local
models.  Those models are disproportionately affected by a poor
agents.md file and so is their usage.

I would like to see these issues resolved prior to the kernel
providing an agents.md file or similar (if it should do so) and this
is a very fair ask. I do not believe I am unreasonable.

Also, the above is a prerequisite for adding a default agents.md file
and does not pertain to its contents. That is a separate discussion
altogether.

Best,
Antheas

> --
> Thanks,
> Sasha
>

