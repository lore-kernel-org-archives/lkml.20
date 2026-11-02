Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636677;
	b=TgFrWXzCEjsMBX8xUptkB1TA0osA7SCzBBozIpnxQiJ7fi2+OXjg0Hma9ZGxIudvdygJ
	 XUX/20J7o4mMHtXP7lAzPl6Zw0VL80ZJiV4k+x1QpSjXA+69SoJtKxAneHmfTfKBSJ+fL
	 4sw1O0rQlHVfhyGqN4/pp4l+szGNjwYjTJdkHgluDJUUiEYOSNNJRFXxxF4CDljhEcKnG
	 KRkzS0ePLw9DUCxX7txqioGdBb0bnW0j7RpspKF2ZnnOywyDtOKOhdNRhQaxiZHqKhqWN
	 2DdeMFJ24uki0s37/1KHuJM7L0EgUymUtubpStBwD4pZp64Ne1PytLd23esJNLF2KDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636677;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=4q7osnzMdJWEM2zxqfnHVAD5rHiZ7BTrhZ4d1nRLsQQ=;
	b=ruszxYeCipgbIRX5bvM1f7Py5kYrlGGQvVIpYlOljbr4v+h1i5TWNpUB5Upy/4N1QMgL
	 H9qS7XQrl4mNrNA6nKTKoX8mMzxCdskT2YR1GmtLrh9KsJFFQeB8PcExhUypBNAf2rAdr
	 XVjeJDZuqU4YZV555YDDbL9UzsTukvEw0dcC+LxuTnB2ePGyRUcVzf5D1Yt0uf0Xnn4K4
	 erqmQ98HB/GBEpeyfpImw5Ca/53Qkvhsb84zosVAnWPe08OYik8f554PUD207sJlhdRK+
	 Uw33+SHDWFLNn2Qq3aA290vRrfYz+6USwF8g3Wsh4F1r03BzPTHsTzh72qigGGgYjgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=bPcuwsdW;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4E0606A918;
	Mon,  2 Nov 2026 16:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA4E0606A918
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=bPcuwsdW
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B6DC940430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793636675; bh=4q7osnzMdJWEM2zxqfnHVAD5rHiZ7BTrhZ4d1nRLsQQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bPcuwsdWhAVosB2pKGpbGSUPuR7i/EiMgoTJG57+PT45Umbv9EhZbYI/THDOW3Jk5
	 QqfxwV6/tOHk/KyhKWnPAiCkzvR14eulu6KYFKKHHar2Aeq5n1rZ7kUp3BpMkLEgy/
	 C5yrFLfBjRzxJeOx/KaRvF8nZYMcRtY7mIjrZIT5FjR3I11h3pFAIg9V8GL0rR+0Q4
	 Uf7uaWzTkrXfw8+TmUidO/0jwRFZlCaGm6x+51PEbs1e+phrcbQlrA5UcxZ5nK1azY
	 Syp9sVyLv3q7ONu/fvbzUc0Lzvxn5ZyfCpHEfONU+R+pSabVocyVTdjHyQXeecT+pg
	 6votB0Cud6OOg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B6DC940430;
	Mon,  2 Nov 2026 16:24:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Bradley Morgan
 <brads@mainlining.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, "Michael S. Tsirkin"
 <mst@redhat.com>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4] docs: submitting-patches: say which commit a Fixes
 tag names
In-Reply-To: <20261020142534.3533478-1-sashal@kernel.org>
References: <20261020142534.3533478-1-sashal@kernel.org>
Date: Mon, 02 Nov 2026 09:24:34 -0700
Message-ID: <87cxsncibh.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> The description of the Fixes: tag does not say which commit to name when
> a later commit made an older bug reachable, or when more than one commit
> introduced the same bug, and both questions come up regularly. The
> commit that blame points at is also often one that only moved the code.
>
> Say that the tag names the commit that introduced the bug, that a
> later commit that exposed it gets a tag too, as handling-regressions.rst
> already asks for the commit causing a regression, and that each commit
> that introduced the bug separately gets its own tag. Say that the tags
> tell the stable team which trees need the fix, and that trees without
> any of the tagged commits do not.
>
> Link: https://lore.kernel.org/r/c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info
> Link: https://lore.kernel.org/r/20261013003535-mutt-send-email-mst@kernel.org
> Link: https://lore.kernel.org/r/atCI4q2HvqVXOag1@stanley.mountain
> Link: https://lore.kernel.org/r/bcef59f8-33fe-4bbe-8429-307630dc6bb5@leemhuis.info
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> v4:
>  - Split out of the agents skills series, where this was patch 2/7 of v3:
>    https://lore.kernel.org/r/20261016152828.3765695-3-sashal@kernel.org
>  - Take Thorsten's rewording. A later commit that exposed the bug now
>    gets a Fixes: tag too, as handling-regressions.rst already asks.
>
>  Documentation/process/submitting-patches.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

jon
