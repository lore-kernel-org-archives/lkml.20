Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625BF30D3EB;
	Mon, 12 Oct 2026 22:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845242; cv=none; b=HCGs88U5vFxaOeRs2/RVEa59SUMM2D/79byCOV06/CdgSPNzQhl1FwnwY6tUbxTUnddBm2kM2khwftDr5lP3opUJuaduzCScKkvo4JfnDN4jGI5vmvU5x+bK4yCUPclpV6ycKFHRH+1ZkbzfJOKeUOBSSREf5qAt5x0gGL33LTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845242; c=relaxed/simple;
	bh=lO3hYstUc7DzsSd9NZZIoY9nl1kfdGbzMtG5Ks7VECU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MaCgmICoecVf8/4x3ScFzTARumh1chiW4mk9PPA0uAGfTkONIRdPHZgI3dqT6JNvUipQnqhFPDLAL0VhA2Qgw11BXTYHdIheH+MOBhpKY8Nm3FEGiteqXOXn2jYA1V5pJc5Zk8aKe4R7igja7uRrHPhxf5XUZIkHbAjt6TNGrk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gA4n+9iy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gA4n+9iy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2A81D408F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791845235; bh=L5mVvdQ7SkcC0vgiumo1qpu0fc0kTH3GV33hr4acS+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gA4n+9iyyKJZ2fnZ6ppvWQIE4dReKGeDhFWqVP5fc+jNjukORsCXVqBuYOOZCOemX
	 alOdpbYBKT4SHBTuO4piW53z8ND2J6zpAWB2SA4Bw3o4k8EKhuacCKmCO3UeCqwyi+
	 C+Tlfyms9DLZF215UNzHn4X/NXIaGrQhjPU7cZj439cvFKdT2pu1TgvaCk2zBk2/Kf
	 NIOd6jixwRV0hgGYVv0gOVmg1eYWAf2f0b5Y8vgPgEHkuLvtTALclxu53uccvka3CE
	 P1kzZFde95yUhR9tSJRgvByqt24krpYEQX/tvgdrZuYBjqb6ICVjC95veHW1zyBclY
	 +3x6SF48m9w1A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2A81D408F6;
	Mon, 12 Oct 2026 22:47:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
 ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mark
 Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, "Michael S . Tsirkin" <mst@redhat.com>, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
In-Reply-To: <20261012213452.1863248-1-sashal@kernel.org>
References: <20261012213452.1863248-1-sashal@kernel.org>
Date: Mon, 12 Oct 2026 16:47:14 -0600
Message-ID: <87zewiy1sd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> At the Maintainers Summit, Ted asked whether the stable trees have a way
> to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
> are wrong, often because the author ran git blame and took the first
> commit that touched the line [1]. We use LLM workflows to find the
> commit that actually introduced a bug, and others asked us to share
> them.
>
> This series adds them as agent skills under agents/skills/, together
> with a skill for writing commit messages:

Time to argue for a more fuchsia shade of mauve without actually getting
into the substance of what you're doing...:)

I wonder about the top-level agents/ directory.  If we regard this
material as documentation, perhaps the "skills" should go there too?  As
readable text, they might just help to improve human skills as well,
assuming we think we still need those.  Under Documentation, they could
be built into the rendered docs and made more widely available.

Otherwise, if this is primarily a development tool, perhaps under tools/
makes sense?

I lack strong opinions here, but figured I would ask the question.

jon
