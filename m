Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172849CF4A;
	Thu, 24 Sep 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263218; cv=none; b=c9YECACiwEQm5u/jcZWtqAmdt4fsU0zjzxrw1UaTPhQ2cn/fl0ii/Ag+vN3svN9M96VklNBA/0V2RifUr1QzgDFPC5VuJGXsl1dWezhx+jDsUOVGMGXHpMMNCab41oX3bQLxpxh2KNx2HeCBIUvTgcWKV0bjfXPyYprSqNv6vXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263218; c=relaxed/simple;
	bh=wxEuJMVBoZbga0STtRr92plLtm8vInH3FruD1jhYEKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1gaKHNt8ZDabBpJ95NYPyzOfuLWa+IJkijOwSLo9nM258MH4B4Y5jbu5DiB5lQek3c+YOg3mP+l1KiqC8Fbi4t052aeRuMi/AIWGPq9DsE+/fqYtVnvXTPEXLrgwPM58iiwoVvuBlGGuhc67l9xho36jqTfAil4R4lVckfhqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYKsiDRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYKsiDRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A09A1F00893;
	Thu, 24 Sep 2026 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263217;
	bh=1TonUH49EnMB6u8c5h2Nyyz7RxZIjpN24Wb4b73V2aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZYKsiDRjSINDvO2HkBvOdZh3eV1kfCLgy1Yf3Tmsf2ocaM3IyMleG1PCydVJD2+Gm
	 ZR4pq7/p86HNVIuvjU+qpH98naiOfC0zJQ+yNZ7Xf3vMrL6Zt2kypbV9JyfYY9W/5i
	 EsnuJfH8XbG0dyKriiAgOsCf+mt6EQve6eIeKG56vpCe/LlNmroA5yAlEiGgGxzIy7
	 xYZ3lWpm6ff6+xq3ER8P06CgLRluEYnHIX1ylQq0Nn7dqplnLgXn5kzv3nVphn+H0o
	 7ZFSX628FOmj1DEM6fwNqXYCX6vaEq3DLc5FEw0OKc3JvgibnHsIoe3vpYIr3NInaA
	 QyPjRZaKTZPYg==
Date: Thu, 24 Sep 2026 11:20:15 -0400
From: Sasha Levin <sashal@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arU_r7Sl3gnTX6nG@laps>
References: <20260924134945.3095661-1-sashal@kernel.org>
 <C1ABA2A9-E1BD-4A89-B5BC-59C06D807D0D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <C1ABA2A9-E1BD-4A89-B5BC-59C06D807D0D@mainlining.org>

On Thu, Sep 24, 2026 at 04:08:08PM +0100, Bradley Morgan wrote:
>On 24 September 2026 14:49:45 BST, Sasha Levin <sashal@kernel.org> wrote:
>>Most coding agents have standardized on AGENTS.md as the file they load
>>automatically from the root of a repository. README already tells AI
>>tools to read and follow Documentation/process/coding-assistants.rst,
>>but that only helps if the agent decides to read README before acting,
>>which in practice it often doesn't.
>>
>>Add a top-level AGENTS.md symlink to README, so agents load it on their
>>own and follow its pointer to the AI guidelines. This keeps a single
>>entry point for every reader, and avoids adding a separate copy of the
>>policy that could drift from the RST.
>>
>>As an example, two different agents were asked to "create a new commit
>>renaming the release (in the Makefile) to AI Test".
>>
>>Without AGENTS.md, the first agent added a Signed-off-by for the user on
>>its own. It should never have done that: only the human submitter can
>>certify the Developer Certificate of Origin, after reviewing the change.
>>It also used its own attribution tag instead of Assisted-by:
>>
>>> Makefile: rename release to AI Test
>>>
>>> Co-Authored-By: <model name> <noreply@...>
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>>The second agent added no attribution at all:
>>
>>> Rename release to AI Test
>>
>>With AGENTS.md in place, neither agent added a Signed-off-by, and both
>>used the Assisted-by tag. README itself mentions neither tag, so both
>>agents followed its pointer to coding-assistants.rst:
>>
>>> Makefile: rename release to "AI Test"
>>>
>>> Change the release name from "Baby Opossum Posse" to "AI Test".
>>>
>>> Assisted-by: LLM
>>
>>> Makefile: rename release to AI Test
>>>
>>> Assisted-by: LLM
>>
>>Both agents also followed the kernel's general guidelines more closely.
>>The second agent's subject gained the "subsystem: summary phrase" form
>>that submitting-patches.rst asks for, instead of a bare "Rename release
>>to AI Test", and the first agent added a body describing the change.
>>
>>Assisted-by: LLM
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>NAK, we could add to memories that to read soandso file before every
>patch, and then it wouldn't increase tokens then?

Could you help me understand what you meant here? I'm aware some agents use a
notion of "memories", but I don't think they standardized on it in any way, nor
how we could incorporate them here?

And as far as I'm aware, nothing is free here - those "memories" still use
tokens.

-- 
Thanks,
Sasha
