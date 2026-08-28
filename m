Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39F3B42D6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910118; cv=none; b=e/qyFHQmfIO1L/eO1vJZ7EI1Y10r5Q6uxsMLx39b1g9Ey2Kat2zJ7+vq9V1uxzKFRAwMODGg9nFwicYXCAPs4hnPo6hXxnaN3S8uqbSrftHIza0JBmEFlztqv+iTpfB2tOoFoPcvGdxBvGC9W3xyEYqrp3OSyuspYruX0YM4iYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910118; c=relaxed/simple;
	bh=I+yycvL7kbCiGhMgumbLZm9D+j4e5nUXPmc8W77Ihng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxLbDs7TgwQEWPz3SOfkKFsAP3YncxlPZKaQywx2RaGkwXS5IEjr0Fis6igkRX+O8nOxHAuc2vU3GsCpk34rQ6zW2gP4oXAFJ5x9XsSGP466ERXKZBmYeUyqTDO+CCpoU5sGsJieyjh7xTtUFWzOiEkKhhPT1lV1lluHLDg+FjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OyFE8byP; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ctsVzP+P; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=aG8T1nM8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=v5gmQsaF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OyFE8byP";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ctsVzP+P";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="aG8T1nM8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="v5gmQsaF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B3E01FAA7;
	Fri, 28 Aug 2026 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787910110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N7+M+675Qd0BTRqACjcz0X65yrV7wou7VRu7g7oPqw=;
	b=OyFE8byPwQAX7z5kgK/jAGim6IgAGnQpiNuBPSgCsmQrOTu4atc4x5qNMBGPjnDSY8vr2u
	GdW3kIyYLciRaxe3GB2rJJufJKsRynfz1YRX4p/uchm+9GcL8xji/DJT3Br0Au5j5eyHOO
	DlVCJIukMPsoFGZ8bPfPi6iF0n2jYDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787910110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N7+M+675Qd0BTRqACjcz0X65yrV7wou7VRu7g7oPqw=;
	b=ctsVzP+P14uR9xTfldHyyzbWJ+puf57fpIz+XlA0c7g6YM+a3M8jvs5RgIT7oJt0Nofygp
	IpwypPzC8j4EjIDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787910106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N7+M+675Qd0BTRqACjcz0X65yrV7wou7VRu7g7oPqw=;
	b=aG8T1nM8KTvqEyaK0MKumn4J4wUQO9IDKIhwsuAffvjC65T3Q0FoZClh/uz43sXy4XZRRK
	32NimP/CQwu0IHABY/VAf+Uo5KYoDc/EuthQW1RG0mmA7A99+GWd4ibCNubzheCUlab1ej
	m69zLUYE4qzsRh6I0pPX5PizR6yndTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787910106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2N7+M+675Qd0BTRqACjcz0X65yrV7wou7VRu7g7oPqw=;
	b=v5gmQsaFN6I+oZf5sKVBIOdC2UfMEs+FDzV4n6deMAWKDxy42zr9SfGe70rNVuCzvVgAi1
	24WerJ7NnbvvI1AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CD6D13515;
	Fri, 28 Aug 2026 09:41:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VciJGtpXkWohBwAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 28 Aug 2026 09:41:46 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 0306DA1324; Fri, 28 Aug 2026 11:41:45 +0200 (CEST)
Date: Fri, 28 Aug 2026 11:41:45 +0200
From: Jan Kara <jack@suse.cz>
To: Tao Cui <cui.tao@linux.dev>
Cc: brauner@kernel.org, jack@suse.cz, kees@kernel.org, cyphar@cyphar.com, 
	containers@vger.kernel.org, linux-kernel@vger.kernel.org, cuitao@kylinos.cn, 
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 1/2] userns: remove dead key_put() on the
 create_user_ns() error path
Message-ID: <co4ipyiux4vlqlwzgkxysinguvsz5j6wp5rslqpjuykw3d6ze5@jbhxzpn7hy4x>
References: <20260828091659.358700-1-cui.tao@linux.dev>
 <20260828091659.358700-2-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828091659.358700-2-cui.tao@linux.dev>
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.com:email]
X-Spam-Flag: NO

On Fri 28-08-26 17:16:58, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> create_user_ns() jumps to fail_keyring when setup_userns_sysctls()
> fails.  At that point ns was freshly allocated with
> kmem_cache_zalloc() and ns->persistent_keyring_register is only ever
> assigned later, lazily, from key_get_persistent()
> (security/keys/persistent.c).  The key_put() therefore always
> receives NULL.
> 
> Remove the dead call.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>

Adding Eric to CC for verification but yes, that code seems to be dead
since its introduction by Eric 10 years ago. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  kernel/user_namespace.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> index 0bed462e9b2a..e9e04ce167df 100644
> --- a/kernel/user_namespace.c
> +++ b/kernel/user_namespace.c
> @@ -162,9 +162,6 @@ int create_user_ns(struct cred *new)
>  	ns_tree_add(ns);
>  	return 0;
>  fail_keyring:
> -#ifdef CONFIG_PERSISTENT_KEYRINGS
> -	key_put(ns->persistent_keyring_register);
> -#endif
>  	ns_common_free(ns);
>  fail_free:
>  	kmem_cache_free(user_ns_cachep, ns);
> -- 
> 2.43.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
