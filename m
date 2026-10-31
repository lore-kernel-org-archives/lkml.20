Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436003;
	b=XmnEkpp2IkzSBu5YNr1nUTHkLpyhXvqsUybZVhX6GlWEO8n+bi4CulwDhTVLmI/yKrOS
	 KIzVwh5MlNXTS19IuiPJv03S3v1bfQo9LZRn92TqdwCJ7GRTqCEcRinED67NJtjzdd7Bm
	 Z7FG2nEcSgrj6YSEnyAi5uSrG7IoLDwGeezprxI9clsw80tNIcfYrRN4GOrr6A7RoyytL
	 jnvmEX+LCBfxTtOGhFSjHBEY2z46s8Izo9qR8KkN/eLDSm1wxN0MmXfVwpKhVKqGX+537
	 JFB6hju0yjiyUAamefQjxZa+hoBRhVGvY4sdAFLE5jbvGFwi+Lqpdvr02bCGdqEGaFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436003;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=kwrG7ecg7Gkp8O666QzFszH8flNQHF5uvmmzMHWSzqQ=;
	b=tB/FjRMkA5cc4jMZXQlitfc76+9hr8Rbnz78pXqi3T1yRJhcCDNvoF8QDpZaVTUXFYOq
	 zUDTn+FHXxcpaUxnvALrzIgILjKQW4oZbwS4KPBtFk+5oQ8sn5C6UpsSH58Um/Q0WQfSF
	 h536U9X8FbIFG9fHbnN/kuD3M4cXlfJMHqRJcgwWfXx/RYkMeyHyr0BBfFA581VznNmCY
	 tlaJGpCAHcUZ6w0igM14wy8prVzb6riHezA56+RknUDg5A7Vo/YVlWGEhCAhmMGaYfVJB
	 GQkAGnw1Y4JywU+BQE0SaAznyyGPE6UVRbpUsOoUR7piw6GP3S2qX23dQdHHf654Ehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=INeMIc2m;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87200606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87200606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=INeMIc2m
Received: by dvalin.narfation.org (Postfix) id 97DC91FE5D;
	Sat, 31 Oct 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1793435993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwrG7ecg7Gkp8O666QzFszH8flNQHF5uvmmzMHWSzqQ=;
	b=INeMIc2mMwCYJKlMqL9ngrN8QI2abI5KTiRpS1SrgWV4osUDIdY7K5I2kIxnqfO1l+nZyW
	4MVuYIcjTlqvubnwO6+WebdnhAVQCvWurzG/DxeiNX99qknvCL+F0rDzRuYbUUUfLMc52O
	6cqZPBaZCoAPpJhCnLsPJwzfctLejE4=
From: Sven Eckelmann <sven@narfation.org>
To: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com,
 =?UTF-8?B?w5ZtZXI=?= Mete Kaya <omermetekaya0@gmail.com>
Cc: davem@davemloft.net, b.a.t.m.a.n@lists.open-mesh.org,
 linux-kernel@vger.kernel.org,
 syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com
Subject: Re: [PATCH net] batman-adv: reduce softirq drain in tt_purge loops
Date: Sat, 31 Oct 2026 09:39:49 +0100
Message-ID: <2282819.irdbgypaU6@sven-desktop>
In-Reply-To: <48b23995-4f67-4f3b-8988-78546cc23ecd@gmail.com>
References:
 <20261030000222.286935-1-omermetekaya0@gmail.com> <5221322.cEBGB3zze1@ripper>
 <48b23995-4f67-4f3b-8988-78546cc23ecd@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14125537.uLZWGnKmhe";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart14125537.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 31 Oct 2026 09:39:49 +0100
Message-ID: <2282819.irdbgypaU6@sven-desktop>
In-Reply-To: <48b23995-4f67-4f3b-8988-78546cc23ecd@gmail.com>
MIME-Version: 1.0

On Saturday, 31 October 2026 01:02:27 CET =C3=96mer Mete Kaya wrote:
> I think keeping the batching approach is the better option since
> cond_resched() alone does not reduce the number of inline softirq
> drains. But if you prefer the simpler per-bucket spin_lock_bh()
> with only cond_resched(), I will go that route for v2.

My understanding seems to be completely different. There is are two major=20
changes - one is the actual optimization and then a second one which only=20
applied in some situations:

I need an explanation in the commit message which tells us what the=20
problematic situation is and why the approach of an outer local_bh_disable(=
)=20
is the correct one.

But since you have also an cond_resched() in the middle, I need also an=20
explanation why this is required/good idea. And why it is not a problem to =
not=20
have cond_resched in some contexts. I am not talking about the technical=20
problem (commit_lock - which still needs to be mentioned) but why it doesn't
cause problems that there is no cond_resched there.

Not to forget about an explanation why the time for the worker doesn't stay=
=20
stable when it has a lot of softirq work which is done anyway on the BH re-
enable points. The number of these BH re-enable points is lower but the tot=
al=20
amount of work it needs to do stays the same - (without this explanation) y=
ou=20
could therefore argue that just more softirq work is done per BH re-enable=
=20
point and therefore the total amount of time spend by the worker (with the=
=20
softirq time) stays the same. As result, we would still see the splat (see
syzkaller report).


> > This looks like a workaround for a problem which isn't described very w=
ell.=20
> > Are there any precedents in the Linux kernel?
> >=20
> > I know of things like ctnetlink_dump_table() with the large local_bh_di=
sable()=20
> > and inner spinlocks. But I know of nothing with the cond_resched. But s=
ince I=20
> > don't know why it was added in the first place, I would a better explan=
ation=20
> > of the problem and the reasoning why it was tried to be fixed like you =
did.
>=20
> ctnetlink_dump_table() in net/netfilter/nf_conntrack_netlink.c uses
> an outer local_bh_disable() with inner spin_lock()/
> spin_unlock() calls on per-bucket locks.

As said in my message: no cond_resched in ctnetlink_dump_table()

> nf_ct_iterate_cleanup() also uses cond_resched() while walking the
> conntrack hash, although it re-enables BHs at a different granularity.

No outer local_bh_disable() and only a mutex around the main loop.

Kind regards,
	Sven
--nextPart14125537.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCauWpVQAKCRBND3cr0xT1
y3M4AQC4HuRmgMaEOHiBQSb+c4kJXxuvfdfKthXIWGMWOHKLXgD+PiHiiINFLstF
BHqG0nhUOmNTdRqHwqfH9Y8giOLATAg=
=PXMY
-----END PGP SIGNATURE-----

--nextPart14125537.uLZWGnKmhe--



