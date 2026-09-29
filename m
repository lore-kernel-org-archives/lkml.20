Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AA52BE22
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699721; cv=none; b=EdYUpbinyxDx25rdVcExGDKTJZVQI2Df7ZPE4tUjbfHI4X8phZL+nsPlE6SGlD2L2TghcF2/NvzgdhpxA2gDcz2NNkLztkCnYl+mTklHRFo+w6OIj4gV3vHIISMTdYtj4h+6LdQvUu6kudb3s21JCAvfReovGPzLbKII4XDzjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699721; c=relaxed/simple;
	bh=/h4oyFpdb/42oaB+VKIalhMWr9p37jtmBtfmqH685lU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hYCMCmmep5NBx5rznaFlTFh6E0Gtrq9FIR0t0q0Wsu65X1l90uloysfwy4i084SdOj7fEUvDmhQcMYuZTcsR73hnIm8wVFAxm0olko09YMsQSL5QPI2uhRcERaPz6LQFE5JbukqKxggjNv3Yp+HeQuR7QMYL7lkTFs3+93e1CZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=D2Fse7Kw; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="D2Fse7Kw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1790699712;
 bh=EF61LIjtkYvJgIxFOWJVrSB6cIgCGKPgebbZQSvs8RM=;
 b=D2Fse7KwHFmeqrTsFpLqd6C5cV+hZkrvmAymngILSfnGw8DdLePKJ6/aLuJcg0sC7k0IwFzqg
 HZfsIuZGLOTnGgx9g2XUt7sR0Zl3V97cN/EO6pDSJMnHMg6RihXlpaKvNgMNxehvRqxHnTN+lsE
 Tb+Yd5k+GadqMMxZQSDPrJhZG0110kSJ9ik6W7JASkRKXdEv6HdZx9Ds39FNm/K6wb0yzxzW4/n
 wHk7zSsWDcuLFMPqcoIrhZLEfJFAQXulF0/DUn01F/P+EtuJ95c7aGxMECxI3rFlN6w+zeeL4Gp
 Nlab1YpmlhdPvVGEsO8jUZ/X7Khf4CgM85Uuq7dsPHqw==
X-Forward-Email-ID: 6abbe8bbc06199c2ee5e36a7
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.16.5
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 29 Sep 2026 12:35:06 -0400
Message-Id: <DLRY2GFBXTLS.1492NTGXSAPGB@ubuntu.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Levin" <sashal@kernel.org>, <corbet@lwn.net>
Cc: <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260924134945.3095661-1-sashal@kernel.org>
In-Reply-To: <20260924134945.3095661-1-sashal@kernel.org>

On Thu Sep 24, 2026 at 9:49 AM EDT, Sasha Levin wrote:
> Most coding agents have standardized on AGENTS.md as the file they load
> automatically from the root of a repository. README already tells AI
> tools to read and follow Documentation/process/coding-assistants.rst,
> but that only helps if the agent decides to read README before acting,
> which in practice it often doesn't.
>
> Add a top-level AGENTS.md symlink to README, so agents load it on their
> own and follow its pointer to the AI guidelines. This keeps a single
> entry point for every reader, and avoids adding a separate copy of the
> policy that could drift from the RST.
>
> As an example, two different agents were asked to "create a new commit
> renaming the release (in the Makefile) to AI Test".
>
> Without AGENTS.md, the first agent added a Signed-off-by for the user on
> its own. It should never have done that: only the human submitter can
> certify the Developer Certificate of Origin, after reviewing the change.
> It also used its own attribution tag instead of Assisted-by:
>
>> Makefile: rename release to AI Test
>>
>> Co-Authored-By: <model name> <noreply@...>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> The second agent added no attribution at all:
>
>> Rename release to AI Test
>
> With AGENTS.md in place, neither agent added a Signed-off-by, and both
> used the Assisted-by tag. README itself mentions neither tag, so both
> agents followed its pointer to coding-assistants.rst:
>
>> Makefile: rename release to "AI Test"
>>
>> Change the release name from "Baby Opossum Posse" to "AI Test".
>>
>> Assisted-by: LLM
>
>> Makefile: rename release to AI Test
>>
>> Assisted-by: LLM
>
> Both agents also followed the kernel's general guidelines more closely.
> The second agent's subject gained the "subsystem: summary phrase" form
> that submitting-patches.rst asks for, instead of a bare "Rename release
> to AI Test", and the first agent added a body describing the change.
>
> Assisted-by: LLM
How do you need an LLM to assist you with making a symlink?

Okay, all the other conversation aside. When I see an AGENT.md file in
a code repository, I see:

- This project likely accepts LLM code (which is true for Linux)
- There is a file that provides a cute little "all you need to know
about this" file for our matrix multiplication machines
- There could be parts of code that are entirely LLM-written. (may or
may not be true here?)

I think the existence of said file can also imply to someone who is
meat proxying "here's your AGENTS file, go wild!".

I don't see how the addition of this file is worth it, aside from
helping LLMs, in which the users of the LLM should be directing the
agent to the proper documentation anyway. That ensures that you have
a human directing the agent.

Honestly this looks a lot like, "we have our altar to our LLM
overlords". The kernel existed without LLMs for years. We don't need
a file to make LLMs happy and then have LLM companies say "we are so
important we made a major project that runs most of the world's tech
infrastructure have to provide us guidelines!" - which I guess we
already have.

Anyway.

Don't we want humans to read the documentation before contributing?

I feel like this will just lead to more people going "Agent. Read
AGENT.md. Find bug. Hiyah!" and then meat proxying patches without
generally learning or being helpful.

This is an opportunity of a sanity test for humans to know what they
are doing before just throwing stuff at the LLM. Why are we throwing
that out?

And if the argument is "but tokens!", then won't it also take some
tokens for the agent to process "oh this file is a symlink"?

I find it hard to take this suggestion seriously.

> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  AGENTS.md | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 AGENTS.md
>
> diff --git a/AGENTS.md b/AGENTS.md
> new file mode 120000
> index 0000000000000..100b93820ade4
> --- /dev/null
> +++ b/AGENTS.md
> @@ -0,0 +1 @@
> +README
> \ No newline at end of file

