Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422181;
	b=Vw74TcW2yYvtFNvce3yv+nvs7ZEZ1rmnkZn3Ax+w2L9R0E52uM7E3YFrYLsKI3HKsBMN
	 AZ9YS0QblXjlT0C23U/T7+9JhUNO8pJfQ8RVrncerwCnf3o+p7zxyP6zmH5e7Ccg2sZ/I
	 jJ34ADAVu2Ptc0GOIPGs3+IMriqvNTL/1eFJrGswsIny50nOV3auVgphCz/tbhYhAGhOg
	 n8Xf8CtZzv+ApJHKVYVg5sXi6lDwqqnJ65yl6nr008E7/i3DNXw0hPbkNd8hdC8PWY1f3
	 vphBVSxxjN/oxbc3az3JFMDNeQmAlS4F/E0WdXd/r9BRZKMKMLJ/shU5ksUCHhqwXsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422181;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:In-Reply-To:
	 References:To:Cc:Subject:MIME-Version:Content-Type:Content-ID:
	 Content-Transfer-Encoding:Date:Message-ID:X-Scanned-By;
	bh=ePfx8hCB21CUPflsrVIbtqMdLOLqMseprJFxmf9l//o=;
	b=nWOcbb3nvfrBloEynpn0Mp4LGVhKIvhjPiaZfRtU7Uof6rnmDvCxAhbTwJgkCHi4yTgQ
	 LpCMu08o5/Mg+OV/CzBWNj4W7s2E+qcpJIfTizEnwRth+nEBKZ2Qp+33aCOcoQR/PGJAf
	 YGSr66Vfj87gADZcA8EfGKWWrXXdT3lanGTijVqvEoGK8OVvYinnVwXaXAML8WK6VVGiZ
	 N+ZTx2YNdL4G4beYDtuwwh6V2ICzB/NBk/YJljos5AoufEG7xLPFGjxOYmnjP/YDo2W6K
	 AOWTif+OHSK5ACazWhzznrgpXcHnNya/xp6A87u783UrK6nrl22/bsmQz2Qr3JuW9lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+MExHAF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD85D607D341
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD85D607D341
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+MExHAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792422179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePfx8hCB21CUPflsrVIbtqMdLOLqMseprJFxmf9l//o=;
	b=A+MExHAFEGA6kXDyIYivayMKpc3ldQ+5C9WBka6rEgIjFdWhUJBbe6d2Tja+L2GjbOQQGK
	OJ37C4UepEeEITzgboKZ9PCAUDvbJd3fEaPah7w4V/CHOiAzlMVirzQnw0dKa3SkCBKgT1
	pEua46iObJwjqeYPsVXQxja7oIMoXQ8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-zTfVQHItOKawKXPO1Yy_uA-1; Mon,
 19 Oct 2026 15:02:54 +0000
X-MC-Unique: zTfVQHItOKawKXPO1Yy_uA-1
X-Mimecast-MFC-AGG-ID: zTfVQHItOKawKXPO1Yy_uA_1792422172
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41CE01954AD3;
	Mon, 19 Oct 2026 15:02:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.48.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 653A030001A2;
	Mon, 19 Oct 2026 15:02:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20261016215326.4110064-6-jarkko@kernel.org>
References: <20261016215326.4110064-6-jarkko@kernel.org> <20261016215326.4110064-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Linus Torvalds <torvalds@linux-foundation.org>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>,
    linux-kernel@vger.kernel.org (open list),
    linux-security-module@vger.kernel.org (open
                         list:SECURITY SUBSYSTEM)
Subject: Re: [RFC PATCH 5/6] KEYS: Replace assoc_array with struct keyring_index
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2608629.1792422168.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:02:48 +0100
Message-ID: <2608630.1792422168@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Maintain two linked lists in the index:
> =

> - all: enumerate committed links without retrying hash table walks when
>   the table resizes.
> - keyrings: visit nested keyrings during recursive search without scanni=
ng
>   links to other key types.

Do you actually need two lists?  Can you just "sort" the list to put all t=
he
keyrings first?

> +			struct keyring_index __rcu *links;

Does that actually need an __rcu mark?  Is it going to get replaced once
allocated?

> +struct keyring_link;
> +

Somewhere near the top of internal.h, please, not sandwiched in the middle=
 of
some func declarations.

> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -14,12 +14,12 @@
>  #include <linux/err.h>
>  #include <linux/user_namespace.h>
>  #include <linux/nsproxy.h>
> +#include <keys/keyring-type.h>
> +#include <keys/user-type.h>

Why #include user-type.h here?

> +struct keyring_index {
> +	struct rhashtable	ht;
> +	struct list_head	all;
> +	struct list_head	keyrings;
> +	unsigned long		nr;		/* Number of committed links */

Given key->serial is 1-INT_MAX, nr probably doesn't need to be unsigned lo=
ng -
otoh, it's not likely to leave a hole, I guess.

> +struct keyring_link {

I wonder if keyring_entry would be a better name, but the docs do mention
making and removing links.

> +	unsigned long		hash;
> ...
> +	struct rcu_head		rcu;

Can they be in a union?  And I would put rcu first as I think there are (o=
r
maybe used to be) some things that required it to be first.

> +	struct list_head	keyrings_link;	/* in keyring_index::keyrings */

This may be unnecessary if you can put keyrings at the front of the list.

> +	struct keyring_link	*replaces;	/* Link this one replaces, or NULL */

Please don't put this in keyring_link.  It's only needed by __key_link() a=
nd
friends and could be passed around in a context struct as the edit script =
is
done now:

	struct keyring_link_context {
		struct keyring_link *spare;	/* Spare link block */
		struct keyring_link *replace;	/* Link being replaced */
	};

then:

	 int __key_link_begin(struct key *keyring,
			     const struct keyring_index_key *index_key,
	-		     struct assoc_array_edit **_edit)
	+		     struct keyring_link_context **_edit)

> +/*
> + * Remove every link from a keyring.  The caller holds keyring->sem
> + * write-locked.  A concurrent RCU reader can see some of the links gon=
e and
> + * others not yet.
> + */
> +static void keyring_remove_all_links(struct key *keyring)
> +{
> +	struct keyring_index *links =3D keyring_index_locked(keyring);
> +	struct keyring_link *link, *tmp;
> +
> +	if (!links)
> +		return;
> +	list_for_each_entry_safe(link, tmp, &links->all, all_link)
> +		keyring_remove_link(links, link);
>  }
> ...
>  int keyring_clear(struct key *keyring)
>  {
> ...
> +	keyring_remove_all_links(keyring);

This can be made atomic by replacing the key->links pointer value with NUL=
L
(since key->links is marked __rcu), then destroying the content afterwards=
.

David

