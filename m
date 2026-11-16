Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802741;
	b=jIFHkNWn0wj4MfBIcy0o7GRaQG3xzvV3J8ZSLsJ1oGXoYej/3zkhsrKvdJSWvnHDV/eN
	 EUfcjRRjRuNXmgBceLeUEVKrNpZTswcHpCeoC9ASCozbwLb3Pj1hIUwbNtOk3gsVXkIqe
	 lgV48nRb5t34q2HalxOcjDTHRz3QDkt9MPg1OV89u97bMzRgXJbf8X3WcNqMnUQ/mbmWx
	 aJcDcAdCChVxIjUZN9M0jpGXniT9Ck98+xAkPAIPzaJtQz/541c6uRJGwq9h0ydh2RCHd
	 qRcMxD8ev1Epksx/kSJEs4TpDwLs+yvERGgP4kWIifFL3IlMb4dY/6kDkE/IIUiVH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802741;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=MmbkgJ5vXuWc0jp3fmFhO9MVV9Eu5cJFU3YArPkwGlc=;
	b=KleC4SoPcYZy4m3bplbPHjDtTlGSKYWZws+0KZ/hCCN9+MACJHihqztZdPiykC6v7aci
	 Zi7v0tmlkEM+0EGDvo9HrbL8UtsIEESwD7L/2n0TERXy/PJSQY7/RMpEFjUaMTQ+4w8LG
	 vmnFaTORZ0i8wwxva0kXjRBZL6S1fPj6u3tUW3nYMY+nus7HvQrVsgXPycGf8vmW0sWDJ
	 sW0cC8TPTVHvQH4FsI3f6FvA5i7JIJChmpQNff4CfXSEhMEKEQBeMdgXzypq0/0H6Vbfc
	 sHAnP8xFsEbDCRFdf5HkXRYlOyWejq8y7Yy6uLDU3GN7G0FbGrjpMxtsuq8YsnSnnOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEBE606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEBE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 27D94A01BD;
	Mon, 16 Nov 2026 04:18:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id D918633;
	Mon, 16 Nov 2026 04:18:51 +0000 (UTC)
Message-ID: <6e18f4dfbe3187e7ea35f61c4fb9d27443fd892d.camel@perches.com>
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
From: Joe Perches <joe@perches.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: apw@canonical.com, akpm@linux-foundation.org, elver@google.com, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Date: Sun, 15 Nov 2026 20:18:50 -0800
In-Reply-To: <avngL4BZlQTv2OHO@google.com>
References: <20261112151203.3129005-1-vdonnefort@google.com>
	 <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>
	 <avhgY9t0KVkDfEZw@google.com>
	 <61e4f8997861a1188935435e78682c575552d2a3.camel@perches.com>
	 <03c1afd39a3f167b960a982d1a933619855a975c.camel@perches.com>
	 <avngL4BZlQTv2OHO@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: D918633
X-Stat-Signature: b48dsdymzxcfdebhfo39bg81hzimmcib
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19+9BnPo5mCbPUWSdtA0kmwfpnFCrjfoag=
X-HE-Tag: 1794802731-282894
X-HE-Meta: U2FsdGVkX185TMur5jl6YqlKlm5ljWdHZbToAB1yx9gyPO62d7UFQBtIEfYMtToY5XsyhvLO+d8awmM7+yjctF5gg+k2LKo3rwqNLgVA7LkmM0CZtLsBSBkk6TiGQVQSlDnvMiZe5/l2GolHnfljqFCQ3G0hVGFh4jTffoHseMBMvYTE3UL3kxBaAiUdkw3XNm2Wyktom2rLy1lsiKNLz+Bq/aTFJ45Gp2c8IvAFNu/GhE7PTHTc+XVh6jqDjPEbxjoDRHEIE8V2ey2oT1wbMjvGdMSDG0FsB6ikzebreNBrxzDaCWWeoz2lXn1FlB8k

On Sun, 2026-11-15 at 16:39 +0000, Vincent Donnefort wrote:
> On Sat, Nov 14, 2026 at 06:57:39AM -0800, Joe Perches wrote:
> > On Sat, 2026-11-14 at 06:26 -0800, Joe Perches wrote:
> > > > How about matching one internal () pair?
> > > >=20
> > > > __guarded_by\s*\(
> > > > 	(?:
> > > > 		[^()]++ |
> > > > 		\([^()]*+\)
> > > > 	)*+
> > > > \)
> > >=20
> > > Sure.
> > > Please add and use another variable so it's not repeated everywhere.
> >=20
> > Reading a bit about balanced parentheses in perl '(?R)'
> > non capturing recursion works since 5.10.0
> >=20
> > Maybe instead use
> >=20
> > /\((?:[^()]++|(?R))*\)/
>=20
> Somehow it doesn't work. I have tried the following:
>=20
>   my $p =3D qr/\((?:[^()]++|(?R))*\)/;
>   my $a =3D qr/__guarded_by\s*$p/;
>   for my $s ("__guarded_by(&mutex)", "__guarded_by(foobar())") {
>   	print "$s:", ($s =3D~ /^$a$/ ? "ok" : "nope"), "\n";
>   }'
>=20
>   __guarded_by(&mutex): ok
>   __guarded_by(foobar()): nope
>=20
> Did I miss something?

Dunno.

The only thing I got to work was using a capture group
in the additional string.

  my $balanced_parens =3D qr{\s*((?x: \( (?: [^()]++ | (?-1) )* \) ))};
 =20
  for my $s ("__guarded_by  (&mutex)", "__guarded_by(foobar(qux(baz())))") =
{
      if ($s =3D~ /__guarded_by$balanced_parens/) {
	  print("ok: $s: <$1>\n");
      } else {
	  print("nope: $s: <$1>\n");
      }
  }
