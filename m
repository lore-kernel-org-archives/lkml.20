Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ADC3BAD81;
	Sat, 17 Oct 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224474; cv=none; b=phdckzJkMCmgxy/zw0Cu891RMZGO/mMbnYIBgTsV7RWn5jyE6gXig4uXAifGXIMf1dS2etrlCkf5d4g0obIr84yu1sXfmT81jWfEEquoVNnxiOaPU5TiGmDyjpHqEP2God1e7dyaMeEzAfBJ+1AO5aWaGxYAKA7Axon66EoxrCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224474; c=relaxed/simple;
	bh=g89AN2yF+Ekw5o3VXmh9nSWtiMD/2vcXr4fEOZjFJ10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlqlqN36mLPc6OKsfHIHgXd571oNCsmc8YCTlp72TtPm9XgG9a9hApphWLEYvCOgWtsQhHtWuKGdCPeF4eHxemQyB41/t1Ff/GJvFD7CpGYKwEezr4WDBkindJz6yTB5x9+drr4EJEXf8noGCDFgkMcZXcp5oYHh1uLnHO9hMgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QJ3JDu+d; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QJ3JDu+d"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4j6Dv04Ml3z4Cqq;
	Sat, 17 Oct 2026 10:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792224460;
	bh=g89AN2yF+Ekw5o3VXmh9nSWtiMD/2vcXr4fEOZjFJ10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QJ3JDu+dofcqZoyKBzd5c4olyISFz2NB2rwtmtk++5K8P5DcEdXmyzxNSE9YTaVMU
	 SndT2gY0i87Mu3r46CJ0cftA5TXKz399F7xMId52laAwj6tw6kT658uu9azj+0dnK/
	 TiaOmCHqd4diPWhrr8L+yPM0KIb9yufr0TUEhLJxsltpRaLvTjgl23VJr6Qvz0K6qm
	 Xmn8+fCVZzVCohfK9wp4WHBtwQMBO91d+vMfITOFlNVPmje/LsGzB/u7hEF7f5mTFT
	 /dFsiMhLc++DBWBgVKCvKOQPQywLLsaCDh7pFjEVRG0D2/llu7KaVPLa28ptYFmKd7
	 IMQE5PlHkfQsw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4j6Dv03dHSz7yj9;
	Sat, 17 Oct 2026 10:07:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j6Dty3lzsz8tj1;
	Sat, 17 Oct 2026 10:07:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5728F5F985;
	Sat, 17 Oct 2026 10:07:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <bcef59f8-33fe-4bbe-8429-307630dc6bb5@leemhuis.info>
Date: Sat, 17 Oct 2026 10:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] docs: submitting-patches: say which commit a Fixes
 tag names
To: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
 ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leon Romanovsky <leon@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter
 <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
References: <20261016152828.3765695-1-sashal@kernel.org>
 <20261016152828.3765695-3-sashal@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20261016152828.3765695-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179222445815.3544558.16625418263184150989@mxe9fb.netcup.net>
X-NC-CID: w1EBfir0i25NAvF1BLDTL5K6dECBeNT1Qlv15GUpwBMqw8zzAT0=

On 10/16/26 17:28, Sasha Levin wrote:
> The description of the Fixes: tag does not say which commit to name when
> a later commit made an older bug reachable, or when more than one commit
> introduced the same bug, and both questions come up regularly. The
> commit that blame points at is also often one that only moved the code.
> [...]

Thx for this!

> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -608,6 +608,15 @@ which stable kernel versions should receive your fix. This is the preferred
>  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
>  for more details.
>  
> +Name the commit that introduced the bug. ``git blame`` and ``git bisect`` can
> +point at a commit that only moved the code, or that made an older bug
> +reachable. If a later commit made an older bug reachable, name the commit that
> +introduced the bug; a second Fixes: tag for the later commit is fine. If the
> +same bug was introduced separately by more than one commit, add a Fixes: tag
> +for each, but do not add tags for commits that are only suspected. The Fixes:
> +tags tell the stable team which trees need the fix: those that contain one of
> +the tagged commits. Trees that contain none of them do not need it.
> +

How about this instead:

"""
Name the commit that introduced the bug in the first place; hence, when
using ``git blame`` to find it, ensure to not settle on changes that
just moved the code. If the bug was introduced by more than one commit,
add Fixes: tags for each. If some change according to ``git bisect``
exposed a formerly hidden bug, add a Fixes: tag for that change, too. Do
not add tags for commits that are only suspected.
"""

My line of thought here:

* I disliked how ``git blame`` and ``git bisect`` were mixed up, as
those are mostly unrelated in this context.

* After thinking about our recent discussion some more, I think the
Fixes: tag for a change that exposed a bug should be mandatory. That
buys us three things:

 - Everybody that runs into the problem and bisects it will be able to
find fixes for it; without that there might not be even an easy
connection to get from a thread with an earlier report on lore to a fix
posted in a new thread.
 - For my regression tracking efforts this tag is useful, too.
 - It's useful for Linus and maintainers as well, as it allows to
distinguish between "this is a fix we need to apply quickly, as a recent
change exposed the bug" and "this is a fix that can wait till the next
merge window".

* It's a little shorter. Maybe the "according to ``git bisect``" and "a
formerly hidden" could be removed, too.

* Feel free to add the "The Fixes: tags tell the stable team which trees
need the fix: those that contain one of the tagged commits. Trees that
contain none of them do not need it." again, I have no problem with
that. Or maybe strip it down to "These tags allow the stable team and
everybody else to find bug fixes relevant for them." With "everybody
else" I'm thinking of users running into bugs (see above) or downstream
that maintain their own backports.

Ciao, Thorsten
