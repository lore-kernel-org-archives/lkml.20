Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA803BB9E1;
	Thu, 15 Oct 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075512; cv=none; b=syzNS6Kp6FCr8//XOZfmU9+eKFjHFU02TjIoxYYwEb+y6FzsKeXTgCN7nGrbUnlEuPjhk7KICzNgfnlmspnyjSs0EEvNz5pl41k3GVo7L/DYRcMXSXGif2rbKW0VijLSCQ4qJa99Jr0D5Qnr4fsLuZpuX/R9pITnDRlSUo/K0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075512; c=relaxed/simple;
	bh=ZVspSdLfqyqTMBSsrN1iiYN2pAbiJDmMq8wFJ3UhAEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXhNbtKLeQLIlfWxdTIlFsF6z3SuWmHoqeql19xaOa2RH2VPlkNbooYAvvNkaMq77VtwLtSb6HYMN2S0Z0FwxtCugoLY7e8XY337Vuh8JiNm7Ba2U0a97YYoKiVZSaB0scDSRrqYIx5jSheZ6310mgzDzSl/AtuhbJkseimAdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MEyu41OJ; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MEyu41OJ"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4j59bV6pMcz8gWx;
	Thu, 15 Oct 2026 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792074935;
	bh=ZVspSdLfqyqTMBSsrN1iiYN2pAbiJDmMq8wFJ3UhAEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MEyu41OJ8Ft1KiXg6Krryv0qmgJkSTcAo6HGpj1Htc846Z6Ex+iXStPTQ1cfjLaIC
	 LJSvhn/s4xZabyC9uHOAiQaDD/9N2O+z5EvsFdhmGjMJkfJJiB9n3FZS+XhPyfjBCZ
	 8eiB5Q5mndDrHnfRIegvwS61YJ1yzwec2qXusaV6wNxRw9VQJnCWZZn/weR1LSOmnZ
	 eUUrL5VB08/ETr+GKS2JF2A3GYrjtYoxkhP/FuAW1z6Hm7b8rBvs2GdQYgHgAiuPLX
	 Lpivx/Mu/qdR299KGMklIo3UE0E+px5d3o/xKzK3xlCU1ihFt/aZwWirEoynVohLXR
	 fjjEJVRk1q47Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4j59bV65JTz8gS2;
	Thu, 15 Oct 2026 14:35:34 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j59bT1qDyz8sgT;
	Thu, 15 Oct 2026 16:35:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 086F85F998;
	Thu, 15 Oct 2026 16:35:28 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f7734347-efe7-46c2-96d7-0d9d6ec19e67@leemhuis.info>
Date: Thu, 15 Oct 2026 16:35:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Theodore Tso <tytso@mit.edu>, Kees Cook <kees@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leon Romanovsky <leon@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <87zewiy1sd.fsf@trenco.lwn.net> <202610122047.A9E381A@keescook>
 <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
 <202610142149.C3CC39B22@keescook> <atDWaGJegsI3_Q8K@mit.edu>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <atDWaGJegsI3_Q8K@mit.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179207492877.1453071.7645524880375575979@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 086F85F998
X-NC-CID: 2IxlK7UaX/jvliR3f8JfSN4Ng8x683WTrLJDzR7QFy6rIHEir2Q=

On 10/15/26 15:37, Theodore Tso wrote:
> On Wed, Oct 14, 2026 at 09:50:47PM -0500, Kees Cook wrote:
>> Exactly. And the rate of frontier model improvement has me convinced
>> that there is no need to spend any time writing documentation to be
>> consumed _only_ by the agents. If an agent gets it wrong after reading
>> our existing documentation, ask it what would need to change for it to
>> understand it, and then see if that makes it better for a human too, and
>> send those patches. :)
> 
> We might not want to assume that everyone has access to frontier
> models.  At the very least some people might want to use things like
> Gemini Flash instead of Gemini Pro, and there will also be people who
> wants to use local LLM's.  Even if we don't care about usage of more
> modest LLM's, there is still an economic (and environmental!) reason
> why we might want to make sure that we promote token-efficient usage.
> We certainly don't want to assume that LLM's need to read *all* of
> Documentation for every single prompt.
Agreed, but maintaining the same information twice is work that as of
now humans need to do -- and having information for one task in two
different places targeting different audiences (humans and LLMs) most
likely will lead to small or huge inconsistencies that cause confusion
or trouble.

Can't we prevent all of that somehow -- maybe while also improving the
docs for humans? Is one of those frontier models maybe now or soon
capable of generating and maintaining dedicated skill files for less
capable LLMs from documentation written for humans? Or at least pointing
out inconsistencies when someone updates one side but not the other?

Ciao, Thorsten
