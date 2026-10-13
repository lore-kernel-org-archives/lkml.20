Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6642586F;
	Tue, 13 Oct 2026 03:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863727; cv=none; b=g5KFOJMA5GJMbWbbQKmQWccyR3ZAG6Q8Eg8hnNTZLpmmFVdrkXE/asfea5q9d5DknfyLwlvoxHqPFOFY82UCloPVIoq+FFvIedmNlSWYx6yPPO4hnBYxdLPeS3MRvFrMzokPX9428+6WIz2fSb4XUheziKbiSZLFjRPwzT/Ekzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863727; c=relaxed/simple;
	bh=J4mnlfv/cdNhDxuQInO2hTV33plUnkz9wuKluI8FoPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7NaxUl/yZ5+8OSrvidaYqAr1JKxQMcGVZVwu1c1Ims24GMQmEWVeZPBpmD8m4NawJ0RtDhPWlJctJb/YPV3G0jZuoKPpDjkQqCZNV7NGw9a1wenA7N+ClXuZviEHQGJ2bJOqZ9vfcR38DGZZY1tbWYJsKptOTDf2XzfssVFl3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NevIXHWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NevIXHWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB35F1F000FF;
	Tue, 13 Oct 2026 03:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791863725;
	bh=t+YUNfuiqgmvEt+mxqXzg03SaI723QNUcqZZNdfCc/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NevIXHWBTa34TPTpmiY1ulwd5uP9+siqezahjw1A8f+BPdDzP8/3/oAPrSM49tv9m
	 dt9XGTgtsmQ0TXkZ9OrKz0Nc9ePsgswqAdK4vwZSb7EseGkhRXGohjClfXQArXj7yr
	 yenDmGYovrdr6z9SLv6VKeRrJEKmEoxp8qU25VacbVg1OpV0pIqHYgAVbOCZU49LTS
	 nzIQflyfUOoMDlIOMdaXinQCq7P/i4KH/Dv2JRyyxRr1QFTtb6Tqs7s5dg/u7sTqBm
	 RGEx1Gju3yP30Z5+xoSAaYiZKJxq8mhu5Fef7dsrq0ZDTCE08TCD6DOYT8nlT2LBPE
	 GJDF4wYFIS+GA==
Date: Mon, 12 Oct 2026 20:55:25 -0700
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/5] agents: add a skill to determine Fixes tags
Message-ID: <202610122052.0C2001A48E@keescook>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-3-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012213452.1863248-3-sashal@kernel.org>

On Mon, Oct 12, 2026 at 05:34:49PM -0400, Sasha Levin wrote:
> +Resolve revisions against the repository being inspected. For example, with
> +``fix`` set to the supplied revision::
> +
> +    git rev-parse --show-toplevel
> +    git rev-parse --verify --end-of-options "$fix^{commit}"
> +    git show --no-patch --format=fuller "$fix"
> +    git rev-list --parents -n 1 "$fix"
> +    git show --format= --find-renames "$fix"
> +
> +Use ``git diff --cached`` and ``git diff`` to inspect staged and unstaged work.
> +Read the surrounding code at the pre-fix base with ``git show <base>:<path>``.
> +Do not assume the current checkout contains the historical implementation.

I don't really like having "how to use git" in here. Especially not "how
to figure out what the staged diff is". That is way off topic.

> +Useful read-only searches include the following. Here ``base``, ``path``,
> +``old_path``, ``new_path``, and ``candidate`` refer to identified revisions or
> +paths; replace the example line range and expressions with relevant ones::
> +
> +    git blame -M -C -L 100,140 "$base" -- "$path"
> +    git log --follow -p "$base" -- "$path"
> +    git log -p -S 'relevant expression' "$base" -- "$old_path" "$new_path"
> +    git log -p -G 'relevant.*pattern' "$base" -- "$old_path" "$new_path"
> +    git show --find-renames "$candidate" -- "$old_path" "$new_path"
> +    git rev-list --parents -n 1 "$candidate"

For example, using -S and -G here can be *extremely* slow. I think it's
best to keep this skill as short as it can possibly be. Adding these
"off topic" diversions seems like a token-eating mistake to me.

The overall guidance about how/why and where a short-cut isn't workable
all read well, though.

-Kees

-- 
Kees Cook
