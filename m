Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028643F484D;
	Wed, 14 Oct 2026 17:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000129; cv=none; b=MjnLlABPmb9aAMJxWJ4iYKe9BThAjzLVgF5uAvy2Mo9g89IYARZdVNQahQRtLxSu/rWGXoL+oigfd9JQY6L2K4V2ooH8WhamLBZiVlA/iyxHj+qlKwPauEXHLcUVM1/o3pVG+MBVhQmOouwvjSPIN9vCAx8qtcqrGFeyHVkhh4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000129; c=relaxed/simple;
	bh=j7pLnvwLCIsfuo4PvntDi07O9ysgjz662GK9qLAtf7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uyf5cS1Bc2A4ObM0MuzGAB7rLXLIEqWyJdwqxtLDBkkjjY8W6kvXYOuV4YbLY/PuummnW1eQBhBDv1Qoy0YOzFS8x3eBKYpZlhdDc/MWzAqNzGsxOV+EYP0M3rRLcUmETPP2nSN6b5lFfHjRZbE2Fcwt8mOx9Nwi9qI/5vZPm8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RP4vps56; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RP4vps56"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DD2B408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792000127; bh=0KYrnYM6QjdVX1pTyqLj1Cr1lrP/8/nMbE2Zn6BvIDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RP4vps56w1bvnVeTV77pSuryuperGu1zSbS2t0aqr+baYqP2FMQDRYnP8udLwAkOU
	 trXBZzzmSs0FkRVIy0OKvq/BS8kUUhdzVUc372FhPitO3gmBygtJ3nFeR2Ly5IaKJ8
	 BoU09TjrFlaM9Qzq3w3MFaqH45Grzb2WGX8RvDsLAu5MAYoQVs/aZizsDoMoSbnfxp
	 JQcbtIBXJ4aq78BiiJ5JxM4tE5m1hgAqJfJN/rKrQcaVBYYuTtaQeKsSvsdyfMR0r9
	 N4jniTTyRMCdfozvuR7iOISvm9CDuq3bc39GRt5pECuVtiopXvu8IhAZuVm6tRb+gp
	 ey+XCpyHsqL/g==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1DD2B408FF;
	Wed, 14 Oct 2026 17:48:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
In-Reply-To: <20260924134945.3095661-1-sashal@kernel.org>
References: <20260924134945.3095661-1-sashal@kernel.org>
Date: Wed, 14 Oct 2026 11:48:46 -0600
Message-ID: <87ik34uq9t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

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

I'm still not fully thrilled by this change, I must admit.  But I have
gone ahead and applied it; hopefully it will help to improve the quality
of the patch flood some.

Thanks,

jon
