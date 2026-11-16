Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858575;
	b=rEUJKFkBGXX+5tez/R3GNu/9f2XQ4s39h9RY/ryhiqhGts4k8HzI0yD/SCiCb1cpwa/y
	 NzdnJeT3k2/3qbjPc1niydL0aERrADYh44LeS4VW4Ch3mam/djGxyvQPtNtJS1epl5+Oa
	 cW22ERm+uadZWnAoB1aVldBG8iKNJ+0KaxgnHFccu0gTzGX05h/q6muvAiSrL6zOADzGe
	 vOsEkoTPabTL8dslDLU+urTMYogfup6V+A8b6qMiNSDSxQB4czUsocdao70mMPAUQt4gf
	 n0PPfqFMIXd30MwCvfxEw7W0TnHsUKidSjsb109uYHSv3QqZp6lkNEVgXIQtmiqX7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858575;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OTGtWs9a3gMImL7KSXTzsJvanhxlJQWi8e+1/QuInqk=;
	b=v5hwaphk1AlfW8a9n1mb4e1OA3Jh3Uz0GnTC+H8CgqY796vnbbPs8i2Flqg8PUxN+EAC
	 AyvHJUARcuco72nWmiwXL0+h94bgMO0f49hfAxXqq9yo1UWwu1ooyk3GscfmaBWrVMeW7
	 RaJ8Tcr/dKw1VyKllcP0PdNER+Hv5mj9eR3Ct6kXIeeiWWZzuCRYZOrEXw3KbPBVAyKum
	 4I+cide/F7Zxf/1aRNgSLlXcpCkedA5KWa6p5hOnkGlgpId8Em7/GLKHDfMeTh8muY84s
	 ooZtxzIaElEVkKV0zoju5obAKTpVfzNbJz9KTe4EU9JvcI1pTpvfrhWHy+pGIKeY54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=JF7WNPGM;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA3606A31C;
	Mon, 16 Nov 2026 19:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=JF7WNPGM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794858572; bh=OTGtWs9a3gMImL7KSXTzsJvanhxlJQWi8e+1/QuInqk=;
	h=From:Message-ID:From;
	b=JF7WNPGMmyCXgQWol/tZKz/dwyTZ9hNkiC/tu32A3CYqztnvc6LqBt5CNp779Lz4B
	 kZdNUsr5404kS99hV6gl+UuXTiqi7TKHoEGtSppWyvtslELr/6w5XSoaHTR6h/jq+C
	 b/wqIVvGAz/3caQh+JqlwHv88lNr1+KCjRXuneGw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id C71D6C094A;
	Mon, 16 Nov 2026 20:49:32 +0100 (CET)
Date: Mon, 16 Nov 2026 20:49:32 +0100
From: Willy Tarreau <w@1wt.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <avteTGm8ERKN83QX@1wt.eu>
References: <20261116191436.188098-1-sashal@kernel.org>
 <20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>

On Mon, Nov 16, 2026 at 11:34:53AM -0800, Andrew Morton wrote:
> On Mon, 16 Nov 2026 14:14:36 -0500 Sasha Levin <sashal@kernel.org> wrote:
> 
> > "Describe your changes" already asks for the user-visible impact of a
> > change, but changelogs for fixes still tend to say what the code does,
> > why that's wrong and what the patch changes, and stop there. Whoever
> > has to decide if the fix needs backporting is left to work out what
> > the bug does to a running system.
> > 
> > Say what that means for a bug fix: describe the worst a user can see
> > and what it takes to trigger it, say so if the bug was never seen to
> > happen, and say so if it has no visible effect at all. Give the
> > paragraph a label so people can be pointed at it.
> > 
> > Coding assistants are told to commit a fix with a message that
> > describes the problem and the solution. Add the user-visible impact to
> > that list and point them at the section.
> 
> Thanks.  Hopefully this will reduce my outbound nagmails.
> 
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> 
> > +For a bug fix, this means saying what the bug does to a running system:
> > +the worst that a user can see, and what it takes to trigger it.  An
> > +account of what the code does wrong is not a substitute, as it leaves
> > +every reader to work the consequences out again.  If the bug was found
> > +by review or by a tool and has never been seen to happen, say so.  If
> > +it has no effect that a user could notice, say that too.  Maintainers
> > +and the people looking after stable trees decide from this whether the
> > +fix needs to be backported.
> 
> However, I fear that in these times this isn't strong enough.
> 
> The question used to be "will this bug impact real-world people doing
> real-world things".
> 
> That's an insufficient question to be asking now.  An additional
> question is "can this bug permit a sufficiently motivated, well funded
> and LLM-using Bad Actor to cause problems".
> 
> Real-world people's real-world workloads don't use an LLM-written
> exploit to set 16 CPUs hammering away at an LLM-detected kernel race
> for an hour.
> 
> So those fantastically-hard-to-hit bugs have become things which we
> (and those whom we serve) care about more than we used to.

Agreed but there's a difference in who makes the effort. When it's the
attacker, it does count. When it requires the user to be complice (as
is frequently the case, typically in security reports), it's no longer
the same as what matters is that users who did nothing to shoot
themselves in the foot stay safe. Those who shoot, well...

> Maybe this doc addresses that elsewhere, tl;dr ;)

Willy
