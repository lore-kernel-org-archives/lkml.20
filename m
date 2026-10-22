Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658618;
	b=0dcJCzhUxSP9+m8l70/f36H9oWrrz4tnzAkk2l6Az7JNOsKDHZejAc5qSn/NxWwOnTC+
	 lf2s1cnkRqkkYf2Mj+DjzAFvqu1hGHujlr1y9rqKmEazVREigwuw+NfDBcDRgtLjMXzaw
	 18RUYf58h2MA7UrDvS2meTyvGoMxa5535Ng66uKLvja4vZoYijKtxhw+TU+CfxCNksq4N
	 /rShc67C8xPu0B3Tb/lcUd7rA2ieGJQEQceB1p3W1mdY6AF/ogtBTjzv0hQ7mnZegNaD9
	 yzmH1W/WRlDRdO6eiVU+xNRCFbeGWPnu+pf2wmn3o8goku7JQR3fnjiXdQ6ADjuQS5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658618;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=KkSwwAGW7bSa7CAddKjsk/PhMiB8SZPp1DiWuNFu1PM=;
	b=cMuemlE7R4N8NDGAorD96BEs/kG2q8GsGqq3RNT4ESM4EBPtNIi0CN29US9n65ufa5WF
	 byHw6rGVN/YRFTzu/Xcih1cMFST7f6kbiTQYQpWYFDsOKQItvTyvifmPGR5tHjojrRFAo
	 PiUVfzKLsXiGdRvUa48lU7/QaIg+txpblyGysastpma082r1I9UV2VCK1df0943onpkm+
	 cNrS0U71QXD5HIG1xiPnguBWV6abobm5t4mXHpUCMCFikhZdKOaNv6jQo5m+ZzqJJMy3j
	 LAXyHzxuMlhm6tsrxnhusQn3jqWUH7azLu5L0rGL+arlzEPomeeonx8hCCQkzDVp9Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="TZv/3e0a";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EC606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091EC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=TZv/3e0a
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 324A02009B1;
	Thu, 22 Oct 2026 10:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792658615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KkSwwAGW7bSa7CAddKjsk/PhMiB8SZPp1DiWuNFu1PM=;
	b=TZv/3e0aud15HS2g+0Ri7uG2VJn93G+qMsxsWmOgLKzQamPLKM1298UWXKYo5/mx21cYaK
	LAFFlcKq0RpKhZlYz7xpUaoo1NsqSpbOVoM+7SpajXkU72GROQ1Pe9R5q6ZICrnmkcI7dB
	sua2DDtcmam/ukkLtqRwQm4nycbxiv5WhVIV3jAmhfoWPQOm0F0u3tZ8rI9ytMjBr+5cAx
	+b98DEoMjg+Vv7WpdexSWKLmMg4/UVrFBUCwVJDxN6cEDQyUU2fxX68Ctru3BpYOk9TeSn
	Oy3Owdysa1aMK7rlG9jwYsGC+pZeRjRxfFmsqA4VlL+QSWrVruWfMN8FC6YJ6w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792658615; a=rsa-sha256;
	cv=none;
	b=WsNpO+0XW/FpvE//VYM3VnM8kwg38A7aiDepA8VXuTZwcCEzhgo/Nb898dTMVM68/dsU9s
	lk7Q7idCHQ2cENaZMyk4xCCEvAVD2vSxgBr5nWrN3BJIP7Em7y7bJl6j3yLqzOmN0cM/OS
	MUUaga3GVKsn03JEhUOwM+WtRYkuIESVzafLhb25BZNMhcZgUN9/HyWD38J87Ggc1dGmum
	Ich1e2I32X3mWGbDS4WLVBk/g5bod7P17QFN+ff6BIAEvKPJK65ouvkNGKYOdS7Ro2uEcB
	MLyXyBnG6DbxaNUSqiheU+xmWe6/Cg9GHfvBGoGUeNgN0fCzvv0f7GGZH7T1RQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792658615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KkSwwAGW7bSa7CAddKjsk/PhMiB8SZPp1DiWuNFu1PM=;
	b=HJtOWQ9SdOTYOj2QdPHJOQs/qLdDun6YGQJiN99V3ySh0iJYDTXrO7RpDvWbuntxneAfjN
	O1Wm8gyYLlGisAuStZ+cWARFQQrhRLqNNrHAqD1L4iIj+d6tfQoOZRjdKQCURcoxk3qPX3
	C/QHJBhRfYomun3AZeozyWcONJL93L5dzNbEykx7pXSXOKeuvfEhV23DvjGPJuC4Uz8x1X
	HIccE4wWbGZe79CKYi7Naj0B7dzlnW9ZWr7SxwTFE+e4SxJNZwEq/A50lZS+ZX+uGomAhA
	1vHlPIyp03EQ5ysylprxv7rA1oVgEsOpu2L8OeUa+WAPWhBSG0GPnJSi/iAC8g==
Message-ID: <ee622e48006681f9a25e556e3db360378213a5ce.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alvin =?UTF-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org
Date: Thu, 22 Oct 2026 10:43:35 +0200
In-Reply-To: <atjA6l3H5kdrC6SN@analog.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
	 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
	 <atjA6l3H5kdrC6SN@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-10-21 at 16:16 +0200, Alvin =C5=A0ipraga wrote:
[...]
> Looking forward a bit to the second phase where we have everything
> serialized, maybe it will make sense to also lock around the call to the
> .status driver op too? Not suggesting we do it here (as this is just a
> bugfix), but in general I like when subsystems offer a guarantee that
> driver ops can't be called concurrently. Also the status is kind of
> undefined if you're currently in the process of manipulating the reset
> line.

That doesn't change with locking if you can't act on the result of the
status return value under the lock.

A concurrent assert/deassert may lose the race against status and
toggle the reset line right after status unlocks, before it returns.

> What I had in mind later on was to rename what Shengjiu has called
> shared_lock to ops_lock instead.

We could also combine this with the exclusive reset control's acquire
"lock" if we move that inside the SRCU section.

> With the following primitives:
>=20
>   can_sleep?    CONTROL TYPE       LOCKING PRIMITIVE
>   --------------------------------------------------
>   no            shared             spin_lock_irqsave
>   yes           shared             mutex
>   no            exclusive          none? see [*]
>   yes           exclusive          none? see [*]

Yes.

> Where all reset control operation functions look like:
>=20
>   reset_control_op() {
>     ...
>  =20
>     lock(ops_lock);
>  =20
>     __reset_control_op(); /* inc/dec, ->op() call, etc. here */
>  =20
>     unlock(ops_lock);
>   }

It might make sense to split these into _exclusive and _shared
variants.

> [*] I'm not sure if it makes sense to add any locking here? I can only
> see it as API misuse if somebody is manipulating an exclusive reset
> control from two places at once.

Right.


regards
Philipp
