Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E8431B828;
	Tue, 29 Sep 2026 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690569; cv=none; b=CY5qKjIgxv3rBoPOiw1Wk5wANKhBZvks21AhyqFfiGnctLvLV/T5629wGbN9lOC9qftXinrFkIYgRUff+0lJXLQQmslyPxRZo55pLcbxSCBmgh6WZGQL70O8MviDplloQVtILEz+dMc5TD5lY+gK1BfLbrHc12UjfmCjtDyY2jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690569; c=relaxed/simple;
	bh=TrvYmb9DkziSIF/B+0BGURjySChn5iDvqzf2anbk3OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SV5RB0AjabgGiryuqyENU7E/NqJbFt81CThNxhnHHYV6/IAfKViY0Hfqy62W1+3Tz4Ne0ypEbcHg8jsByapGv7AbwGN2ZjnHExcvDqz3DMxHL+vhbt42xa5ZazV6BO86Ot/huPt3L+C+sh7mCvxvaU0LMcQ/qYTMb2G/2x4BxH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k49IYMvO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k49IYMvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD8C1F000FF;
	Tue, 29 Sep 2026 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690567;
	bh=yAADnxK/n0LyH0ialHFXmJBruRlaKaX3bbQzPwXC/Xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k49IYMvOV6d2bDlsuGk+aTX1sTjso9qDGTvFFRiMb6jwjuBbVkeJjRL2mnVp0GXg+
	 3DKukqdwu/5LWlxPi3O1S47Zn5jUvj/5L7itJr8Bu+T8UsJvzBlzOisbU3O8cyNwr9
	 iTLx1/zTZyzHqygJ31Ps1OMkKt/ClFwErqgSDZe3X6Va5NY2zviHqnL7vN1WGNkqPC
	 Hfry0AFTwIW3HOOSQui/wGYRBuEOICdLa5JrEBXRnb7s7ddPI9VyrqpwMKrflZFgNC
	 lwJAO6Vw8Ee3Zpt6z+ePUBHiaDvIc1bB/AqlVdQUy9N7BuLKuRoz2PRdOhI7TXW7Oe
	 wtQlcRpvUdkqw==
Date: Tue, 29 Sep 2026 10:02:46 -0400
From: Sasha Levin <sashal@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arvFBqreU0qahkXx@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
 <arkiyMt2NIydrPhE@laps>
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>

On Sun, Sep 27, 2026 at 05:24:46PM +0200, Antheas Kapenekakis wrote:
>On Sun, 27 Sept 2026 at 16:06, Sasha Levin <sashal@kernel.org> wrote:
>> If someone adds their sign-off without understanding what it certifies,
>> that's on them. We can't have agents add it for them just because some
>> people would ignore its meaning anyway.
>
>I didn't say we should make the agent add it. I said if someone wants
>to do it it is up to them. Not you, not the mainline kernel config,
>not this patch. And disabling it does nothing because the user does
>not understand what a sign off is anyway and will add it later or
>submit without it. In which case you get broken patches anyway and you
>solved nothing.

Again, that's on the user. Your argument is saying that we should just drop
this whole DCO nonsense because no one understands it anyway.

We can't stop enforcing things just because users don't bother reading the
docs.

Nothing is stopping you from changing this behavior to your liking either, but
at that point it makes you a downstream consumer on the kernel, so you get to
carry that delta.

>> If you think a hand-written AGENTS.md would do better, feel free to
>> write one and propose it. For now, this one seems to be working just
>> fine.
>
>No, I am fine with one not existing and it would be my preference
>actually. Ideally it would be added to .gitignore as well.
>
>That just does not address your need of steering novel contributor
>plus LLM, which I tried to help with. But if you do not want to put
>more effort than a symlink then not breaking our workflows is more
>important so this patch should not merge.

All I care about is having all these "agents" follow the rules and guidelines
that the kernel community set around LLM contributions. I'm not trying to
improve the quality or make it more efficient. This patch is purely about
having the majority of LLM agents follow our rules out of the box.

If you want to spend a few months trying to massage an AGENTS.md to the liking
of your LLMs-of-choice, then go at it.

-- 
Thanks,
Sasha
