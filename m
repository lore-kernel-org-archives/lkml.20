Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F183A6412
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260349; cv=none; b=oMhjQ/6aV3dYibhczX/ZB7qYEupyjmgZcBfmIpJXou2Devz61ZG4jjhbE6qFtt3vFxndaE9fu9zMcTNi3jI9fHwy2/OKMqejfzISsW343DU61tZ2DgRmq7Xagig9X6GCi+tDuc8F5Pncp36Lp4Yykc/vjCQKzqvQnQDx7/J9R8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260349; c=relaxed/simple;
	bh=PqLStjrYy2mdoMAqGUCxTiw3sN/NUMC1nV+1l8Ds8Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2joS6RKdtSyg5uvODzVGNrYaiNnFs8O/SxbWAav+alzfEaVZMa7/EIj0nFKmlT/ozUTTdR9ujpfMR14x+eaBOi/hf0UFQY9Bg/4DrlBG1NErOOW+9YneX5lP+D8H64izk7DMstvy/ytsXU7lfXf8ZeHbbXzVrX7R6xmO3Dv6tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=RuIVPY3D; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="RuIVPY3D"
Received: from macsyma.thunk.org (pool-108-26-156-67.bstnma.fios.verizon.net [108.26.156.67])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 68OEW7pc021026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 10:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1790260331; bh=ImkhVgU7zqWDU5YMRKnMxraEsKongRHo5Ff2LLGNEZs=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=RuIVPY3DlI7KmHfUpX/7LBojRsOH9Kf9Uak8nIwJPLG/PU3HkiScyULEoRbDYiQ1n
	 fewyJuN5+u1AgxPONGWfzZioKmn1E9t5NSssOwxg8S7+BjGoyivGuyxjOdBM3afzSt
	 NUcJ7TW3aclr6IsH0mOv4+B4mNAl/mvCWFKugjF0gndEXIdQ3RFA+qAEvlWXepR1db
	 a+aV+w0wHHROMeRuJA9FtUT1oAPEGVTShqZ7X5x1wF1w6KvXMR/sU5EfdSc7uSVHS+
	 5whutVy4+CdBUQ0o/p3U/g2kjGB0O363CsDaCOOXac/rcA/U27QM5U+10Jihm4bshY
	 62A8dZ1CoE/8w==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 477841CED30D; Thu, 24 Sep 2026 10:31:07 -0400 (EDT)
Date: Thu, 24 Sep 2026 10:31:07 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        skhan@linuxfoundation.org, rdunlap@infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <arUzB37qmq1WREh_@mit.edu>
References: <20260924134945.3095661-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924134945.3095661-1-sashal@kernel.org>

On Thu, Sep 24, 2026 at 09:49:45AM -0500, Sasha Levin wrote:
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

There's a lot of stuff in README that isn't going to be useful for to
an AI agent.  This will resullt in an increased amount of token
consumption, that could impact people's token budgets.  Prehaps it
would be a bit more efficient if we explicitly ask the agent to read
and follow certain process files, including coding-assistants.rst; if
they are preparing a patch, to consult submitting-patches.rst, etc?

     	 	     	       	       - Ted
