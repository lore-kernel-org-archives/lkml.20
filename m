Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565805;
	b=2lclqwmvBRftCSyiHpZKs8TkuU0vuDdHuL2gWA1oSUE/v8jkUeHA/RP8LV1ZCL/5hl1J
	 VKZmuRVveYlVEFg3VgauNyCaBYe5IWVRh0TQRVtLscwkik70wtXrNPnz+oc4Se9VFWKU2
	 IcMO7OFXZ74O7xbwjTHO28dnFgzz+CKpqHwx7sCI6q3d9A0JAojk9kn2aojeRGikMEr/2
	 5Yw9QvdBhB2jab1j8NCNSdKoR3zkyxRvtGTjFfVr/hQpF1De6ltbY+8KBLecJP111e020
	 X90DcapLC4vY2tslFSgz+TfTjcChs9z8hF8mtXJ3+NVRsq7FJV1XUTwiMZmoQiyXL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=9rXQGeSiKD81MEO9qdjhKEn808cWRhiKFu4mDEyu76g=;
	b=h4bJGjXC1ZfT3rhFGqUQvlYXFFvtySrW55U6gnBTjL+fDZ+yvZTFn0DDbrJZubrUhD9i
	 uirc6r0mZXRMzEHxO6IT6A8bHk0vuQWYp9CJiv1XwA1j202XMkAKqD/mE/UQaafflCodo
	 8G7gRV35nOjC7LWncodBPK8WKERsvOhsQFQTklJmxvbpc0h+mzCXFHa0rAUoh6eNPfQVu
	 uYOBAUbRylKEiW0U2ulv4gnc+1ndFw/wrHI9EF00BszOJizaJC7Tn1WRznQoF5xzWgFOr
	 ukxz6ipLfOVfh/l3CTAvGV5b/NBmgkoOzG6EmhQNkSel83NWfomUNtUd3dMNJrUbE+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Ij4SnPRL;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB93606A31A;
	Wed, 21 Oct 2026 06:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Ij4SnPRL
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4j8g776R2rz4GC1;
	Wed, 21 Oct 2026 08:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792565795;
	bh=o4ruxWv2FWaoyBr/xnxm4H3fO7czPuABE8xG2t6lKX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ij4SnPRLbzzUWYA0kNOP/bdE8uD3pwMk+NCeCV6GujkTxBe3jevz0Lyl5qawVBjoR
	 RWzmz4jwkzEE57BvUvvP/SIvBsAebPygQx5E+VpMUi6eEBCxT3UirPtlb5FWGGpsn9
	 pQ4xZlkZ24KTG0/Dwwc7t7OFULb9w6aSuNeTRf6Rf549398cQBCyeLnAVlVOmTgfOy
	 Rj17IoAf0IS1B2Z0tq0lSxBOjoLI+II0IXziNs4vwKzSTKhDiW3R9NvDEsycH7ebqA
	 HqMEcIhBfU3ojp0+eVhSHTEDsM65b46oCskvnLlfTU3Trz7l5QYLrRhWZkkN73J0zv
	 Xw0MpZ/0hNsYQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4j8g775jDsz4DYg;
	Wed, 21 Oct 2026 08:56:35 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j8g751NzJz8svH;
	Wed, 21 Oct 2026 08:56:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C517B5F8D5;
	Wed, 21 Oct 2026 08:56:25 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <abe59717-d93c-411b-821c-b6fd24965960@leemhuis.info>
Date: Wed, 21 Oct 2026 08:56:24 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] agents: add a skill to determine stable tags
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
 <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>,
 Bradley Morgan <brads@mainlining.org>
References: <20261020161642.3713052-1-sashal@kernel.org>
 <20261020161642.3713052-4-sashal@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20261020161642.3713052-4-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179256578661.3277645.2559729892547317636@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C517B5F8D5
X-NC-CID: kU6fDVoTX8z0gDGT7j8xPwh4tyHdoweebvpnHiSTGe1mjVzA4R0=

On 10/20/26 18:16, Sasha Levin wrote:
> Whether a fix needs a stable tag, and which releases it should reach, is
> decided by hand and is often missed or left too broad. Add a skill that
> [...]

Thx for this!

> +
> +Judge a change by what it does, not by how its description labels it: a
> +"cleanup" that releases a resource on an error path fixes a leak. In practice,
> +the stable trees take:
> +

Shouldn't something like "It fixes a user-reported regression" be in
here -- maybe even at the top of the list given that "no regressions" is
our #1 rule?

One problem with that is that LLMs from what I see in sashiko's output
might interpret "regression" as "something that changed to the worse"
while we usually mean "something which used to work for somebody broke".

Side note: Ideally LLMs would have a way to clearly identify such
regression fixes. Sadly that idea didn't get traction when I suggested
it two years ago at the maintainers summit. Maybe it's time to revisit
it, as that would allow reviewers and maintainers to differentiate (and
thus prioritize if they want) regression fixes in the days of LLM patch
influx.

> +- Fixes for crashes, oopses, BUG and WARN splats, hangs, lockups, RCU stalls,
> +  deadlocks, data corruption and security issues.
> +- Fixes for use-after-free, double free, NULL pointer dereferences,
> +  out-of-bounds accesses, integer overflows, uninitialized data, reference
> +  counting errors, and memory or resource leaks.
> +- Fixes for races, including data races.
> +- Fixes for incorrect behavior, such as wrong results, wrong hardware
> +  programming, or endianness and type errors.
> +- Fixes for problems reported by syzbot, other fuzzers, or the KASAN, KMSAN,
> +  KCSAN and UBSAN sanitizers.
> +- New device IDs and quirks for drivers that exist in the stable trees, device
> +  tree fixes, and device tree additions for hardware that existing drivers
> +  support.
> +- Corrections to documentation that is wrong.
> +- Performance fixes that prevent lockups, stalls or hangs.
> +- Reverts of commits that are in a released kernel.
> +- Fixes for bugs introduced by commits that were backported to stable.
Regarding the "backported" in the last point and related to my earlier
comment:

What about fixes for bugs or regressions that made it to stable series
via a mainline release? Say some change merged in the 7.3 cycles caused
a bug that is reported only now that 7.3 is out -- that should get a
stable-tag to end up in 7.3.y, even if the change was never backported
to earlier stable series. Not sure how to phrase that without making the
LLM put a stable tag on everything with a Fixes: tag. :-/

Ciao, Thorsten
