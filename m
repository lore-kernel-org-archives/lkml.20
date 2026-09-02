Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C0430F92D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329391; cv=none; b=JwMcKwvbVlmx54ek4kkjrHFxdYLyLUvedQZ1Xk7oLc8PVtwJMYfEGX5Wp4GOqU0vKchUoeTY0Gxy5Q43ce8M9kOs08x3/rWGkzd8V6VAK3zRIpsM7WdIRQPnXxVFXctARQBf1zo220pT/Qxmax23pKt5fWtKHGGYmwaQu9efX/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329391; c=relaxed/simple;
	bh=VDXWvbRR4DHriUaTDPVIH7M6ZKvpVV5xMIOlQUUcaRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxHphRklDVgxBvW6kazeSD9kinQJoeDihPduxB8g55l1TLmGtXFDmxVXBlZxPCrvl4BwJOzEvyuGw8rs+obHq3X2GAWhhYUNZ0wUTwrvXGSh1GZXmhBbpZdSgCwZbtHOByK8vKbJmw1/PhQUgf3zlmoWBfJX7Y8TT57yRf2Kgfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cMzY3cEo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=n1sbqUSW; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=1uxOg+Wk; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VhNAt2HA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cMzY3cEo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="n1sbqUSW";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="1uxOg+Wk";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VhNAt2HA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45E6D21F4A;
	Wed,  2 Sep 2026 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788329383;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7OnDZJCaRB6n+hE3JFGFzyjBmw9S7sKcPUv2w1Myt4=;
	b=cMzY3cEosKsmS7ZH4erv7JrsVfFJ8R3Y45TSEymrQhmmQM3pN15h3OykfKHdQ62zXLrqYz
	Ie3fmloOUJKUichVpRW149euvK5O9IeKDueZHHhQWcW1gYvOu7Yde+TIHcufXINfCDWnCl
	qYh6NZcwJu4AUVct3rScsSz9ifBr6fs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788329383;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7OnDZJCaRB6n+hE3JFGFzyjBmw9S7sKcPUv2w1Myt4=;
	b=n1sbqUSWWCKC5SGScLWLaR8kyiNrerCMzD0KBr2MXDLbs3QDBxMWeq6IHmR3DumsThsv9n
	KWF5cP+fEl8j8JAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788329379;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7OnDZJCaRB6n+hE3JFGFzyjBmw9S7sKcPUv2w1Myt4=;
	b=1uxOg+Wkz1FLDbmXnYnEStcn0vCn6HtdgNPnIRaPQzIf0V6fkPg1L3OuMWvdqrIbEG1Rmt
	by4GGlrk1L7+ErpT/peXNrR1QJhcVjL+a4iXDrQtd+u2+jyr5WpDypWU0Z441iRkPkH4Ko
	x0O0r52s6U/Rlak0LwcKT2tzgUTQRW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788329379;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7OnDZJCaRB6n+hE3JFGFzyjBmw9S7sKcPUv2w1Myt4=;
	b=VhNAt2HAlKkNEeoGMluC6x6OwX2OeF6FF7irO04jG7sU7AHWhDPuiuj/CS+r9i7fs3g41g
	32apNCO/2lXPCHBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C879D13736;
	Wed,  2 Sep 2026 06:09:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id in2aL6K9l2pGbwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 02 Sep 2026 06:09:38 +0000
Date: Wed, 2 Sep 2026 08:09:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: Re: [PATCH v5 4/5] checkpatch: Factor out the check for UAPI files
Message-ID: <20260902060937.GB890950@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260901105642.851234-1-pvorel@suse.cz>
 <20260901105642.851234-5-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901105642.851234-5-pvorel@suse.cz>
X-Spam-Score: -2.00
X-Spam-Level: 
X-Spamd-Result: default: False [-2.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.cz:replyto,suse.cz:email,wikipedia.org:url,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,canonical.com,perches.com,gmail.com,uniontech.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO

Hi all,

> DRY.

https://en.wikipedia.org/wiki/Don%27t_repeat_yourself

Maybe I should have written that I wanted to follow the same approach as
is_userspace().

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v5.

FYI I tend to drop commit this from v6. Function would make more sense if all
cases were just matching any uapi header via @\binclude/uapi/@.

>  scripts/checkpatch.pl | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ead35e6abba7..97bf952b0fbc 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2678,6 +2678,11 @@ sub is_userspace {
>  		$realfile =~ m@^arch/.*/tools/@);
>  }

> +sub is_uapi {
> +    my ($realfile) = @_;
> +    return $realfile =~ m@^include/uapi/@;

As sashiko found this was wrong, it should have been using '\b' not '^'.

> +}
> +
>  sub process {
>  	my $filename = shift;

> @@ -4673,7 +4678,7 @@ sub process {
>  				ERROR("MALFORMED_INCLUDE",
>  				      "malformed #include filename\n" . $herecurr);
>  			}
> -			if ($path =~ "^uapi/" && $realfile =~ m@\binclude/uapi/@) {
> +			if ($path =~ "^uapi/" && is_uapi($realfile)) {
>  				ERROR("UAPI_INCLUDE",
>  				      "No #include in ...include/uapi/... should use a uapi/ path prefix\n" . $herecurr);
>  			}
> @@ -6683,7 +6688,7 @@ sub process {
>  		}

>  # don't use __constant_<foo> functions outside of include/uapi/
> -		if ($realfile !~ m@^include/uapi/@ &&
> +		if (!is_uapi($realfile) &&
>  		    $line =~ /(__constant_(?:htons|ntohs|[bl]e(?:16|32|64)_to_cpu|cpu_to_[bl]e(?:16|32|64)))\s*\(/) {
>  			my $constant_func = $1;
>  			my $func = $constant_func;
> @@ -6846,7 +6851,7 @@ sub process {
>  		}

>  # Check for __inline__ and __inline, prefer inline
> -		if ($realfile !~ m@\binclude/uapi/@ &&
> +		if (!is_uapi($realfile) &&
>  		    $line =~ /\b(__inline__|__inline)\b/) {
>  			if (WARN("INLINE",
>  				 "plain inline is preferred over $1\n" . $herecurr) &&
> @@ -6857,7 +6862,7 @@ sub process {
>  		}

>  # Check for compiler attributes
> -		if ($realfile !~ m@\binclude/uapi/@ &&
> +		if (!is_uapi($realfile) &&
>  		    $rawline =~ /\b__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
>  			my $attr = $1;
>  			$attr =~ s/\s*\(\s*(.*)\)\s*/$1/;
> @@ -6931,7 +6936,7 @@ sub process {
>  		}

>  # check for c99 types like uint8_t used outside of uapi/ and tools/
> -		if ($realfile !~ m@\binclude/uapi/@ &&
> +		if (!is_uapi($realfile) &&
>  		    $realfile !~ m@\btools/@ &&
>  		    $line =~ /\b($Declare)\s*$Ident\s*[=;,\[]/) {
>  			my $type = $1;
> @@ -7424,7 +7429,7 @@ sub process {
>  		}

>  # check for #defines like: 1 << <digit> that could be BIT(digit), it is not exported to uapi
> -		if ($realfile !~ m@^include/uapi/@ &&
> +		if (!is_uapi($realfile) &&

I overlook that regex on BIT() macro is different from the others, matching only
^include/uapi/.  It's a bit surprising for me (shouldn't be all headers checked,
also the arch specific ones and these mirrored into tools/?), but I suppose it's
just me missing something.

Kind regards,
Petr

>  		    $line =~ /#\s*define\s+\w+\s+\(?\s*1\s*([ulUL]*)\s*\<\<\s*(?:\d+|$Ident)\s*\)?/) {
>  			my $ull = "";
>  			$ull = "_ULL" if (defined($1) && $1 =~ /ll/i);
