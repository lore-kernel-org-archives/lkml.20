Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857695;
	b=uxwYx+7W0JDAVdgH/R+UtAGQgGsNm0tcOdmjKsZnhgNAJpUlX0wIp2L+qCV12XJoDutY
	 bcqv/qRasj/vJzwGXsyK3y3wwsk6haMmUp3oArsqM+mGrNZ1OP2KY0Oz5u4L1zqFoQMOL
	 pzmxNYEtGhq7iSu5oKKgyYk4/bwEWYBNZ9uGPWTmjl19q/hFvSZItcavcoO2Ue16GAJXm
	 roxQyizBrMy1jAmi3w95X9JEsd9zGMkU7Nfomj+Z5XuAT4FqqSzh+uVeE/hrN+KXaMoPP
	 bw2+LuLvyRoovgyXe9eW52HJDjAqgCeP2eHJo5uk3M58pJH6GY8OYSReuxUMGZBqPmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857695;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CXg+h8pMvpj+OaybWO/NHX/EsF/d+HTAXg8O372Bn5Q=;
	b=BsjtaO7wopivLtvPNCb+2xU9X3hRg8AvRvRmYVIii3LeEPuEmwgdr5d3I5v6smcAcYqi
	 3rBECngmg1Zkt9LWLY17CfjyhMrYAid2rgmhtfluCm2WGLo4s66T7SX6FHLFE1MtqaZIC
	 ET+wdM6iTd1XiaYFLXquiY0V1NSUymZrC7I+32O1znE5dgqDasUtqHJeb2ggc/VM8/h5x
	 Bl+lPpJmH3TC9UjFkfSIDhjvs8549KoAoCEGRu1jdNE1TWJU9Om28NqLMn63Fb7SxNl+7
	 7n+agt7a/fxUZe2GxT+sbyxajKTJlQKWk498FIXqstz0MyMbmhUTeWzbvfIw2fY9ZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nFvc5Go9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1929F606A31C;
	Mon, 16 Nov 2026 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nFvc5Go9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA0F1F000C4;
	Mon, 16 Nov 2026 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794857694;
	bh=CXg+h8pMvpj+OaybWO/NHX/EsF/d+HTAXg8O372Bn5Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nFvc5Go9dk7FyggSClN3ZBh0+9fg1Ea4ROZnCknN4whFd0KgrQjtNvKrO8+Uqcse7
	 XfA32sPo+VquEGFY5C4i1tOZvIEBZXEMi2KaeeRMh826b4w97ILcVs/4cwfgy8tWnu
	 hK7J3XuqOSL8g8k/GXbJ+gGi8RpUQolR7AGXHUCs=
Date: Mon, 16 Nov 2026 11:34:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>,
 Willy Tarreau <w@1wt.eu>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, David Hildenbrand
 <david@kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-Id: <20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>
In-Reply-To: <20261116191436.188098-1-sashal@kernel.org>
References: <20261116191436.188098-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 14:14:36 -0500 Sasha Levin <sashal@kernel.org> wrote:

> "Describe your changes" already asks for the user-visible impact of a
> change, but changelogs for fixes still tend to say what the code does,
> why that's wrong and what the patch changes, and stop there. Whoever
> has to decide if the fix needs backporting is left to work out what
> the bug does to a running system.
> 
> Say what that means for a bug fix: describe the worst a user can see
> and what it takes to trigger it, say so if the bug was never seen to
> happen, and say so if it has no visible effect at all. Give the
> paragraph a label so people can be pointed at it.
> 
> Coding assistants are told to commit a fix with a message that
> describes the problem and the solution. Add the user-visible impact to
> that list and point them at the section.

Thanks.  Hopefully this will reduce my outbound nagmails.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

> +For a bug fix, this means saying what the bug does to a running system:
> +the worst that a user can see, and what it takes to trigger it.  An
> +account of what the code does wrong is not a substitute, as it leaves
> +every reader to work the consequences out again.  If the bug was found
> +by review or by a tool and has never been seen to happen, say so.  If
> +it has no effect that a user could notice, say that too.  Maintainers
> +and the people looking after stable trees decide from this whether the
> +fix needs to be backported.

However, I fear that in these times this isn't strong enough.

The question used to be "will this bug impact real-world people doing
real-world things".

That's an insufficient question to be asking now.  An additional
question is "can this bug permit a sufficiently motivated, well funded
and LLM-using Bad Actor to cause problems".

Real-world people's real-world workloads don't use an LLM-written
exploit to set 16 CPUs hammering away at an LLM-detected kernel race
for an hour.

So those fantastically-hard-to-hit bugs have become things which we
(and those whom we serve) care about more than we used to.

Maybe this doc addresses that elsewhere, tl;dr ;)
