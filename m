Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9263BBFD2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909527; cv=none; b=Ig2DLimrnAZW0m23xxy4jth8KD3BQXoN7Xb9M8zkQgB6RDXZdlpYIi2pQtHqGYGFviagqCU0qfBeSFm0M2kHi4WF+a7iOj4fluxHbDOnu2BBWAZRfeG7Fgyz5MIPkV7u0FWBMZZXB69iJ9UBQKwE0aNZ5H0fP0MmaWLOjUV2wO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909527; c=relaxed/simple;
	bh=ruT07PJP8S/L4ZZ8dWj/659Cz3C+7rEcZlyv3Gh4JGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cza3sphbzA1bxBpDez5pmk4KPzNYk5C5zEy2Hw2/f59JG4V54b2M/UX1WxAEmEAU5AxhzBCtuJWQ8spwijxuqqmLf14pavKkDWyKz38kXLt1MQyNcv2jzus9qz6w+zMJVsOuBMZZindarxSlsED/YlhDjYUWrE8ACLzaXCMdONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NwEc9ckP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NwEc9ckP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so19829935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791909523; x=1792514323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xL3+tU3AKQDvlPSrjs3FfSP9tHw+JaoM3c5ccvkwulM=;
        b=NwEc9ckPk0481iK+uhdB/ZcCO0ZxJ7/Bfcv1rG96YfkDb5YYrydZ7evAX/Uzr834ew
         P1syrdf3t0N17YG9LnocRmftVt2IzfgDFarlOXq3Us18bLiMcmoDSNgGF8OYLy4shEoY
         LlZSzDiMxEEeJoWjC2HJLX88usuz3d8zrNbAYOJ3gddsjU4GHxQ12Z2Geeww+2dFOwxs
         cejNBlunCBgd5fA9AP8jfmDXZU+9CDKTPTyJDHdweFk5S3CdrYcb9PV5trangC6Zt4N0
         z07sG1EreHgVQs5n8t2EojxjdXs32faqhqluvqxyWfQTkQlIo6ZIPw+lFUBdh83BhkI5
         DLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909523; x=1792514323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xL3+tU3AKQDvlPSrjs3FfSP9tHw+JaoM3c5ccvkwulM=;
        b=YAwQ1agnOznxlfo6UzVUtmZLXzNQNpI/lnog0qqKJEfo7T6Om8Z0Q5Dd6gOAaKKbWI
         bZqUedmyjHGFjZ8ECOH260dqL19XSoSBwfvmBfKVWIT1UrC7VyFjbJlmC36p6oslWuyV
         9r/p2wRZAPc5fJztnXGzY1Exyhb4EeGlNfDMfwoOa8md+l3gu1BSq07Tf26ej/ATECaw
         jChgMjDTOLGxSOmsPLSW4aS0eIMncXo2+g7d0frem1tsq8VEaMZChHKd3XjQppEUaMpG
         dNIc1akMGb5cSkkbqktUSr9A5sWT+qh995+1nGqF/nWHsbWIofyNp/iei70ZiuLvgYYl
         4r5w==
X-Forwarded-Encrypted: i=1; AKwUvBwI6TDVRZfwH4Zk1kA4mr8Dn3K4jSzGvHCV020iAr+Wbj/zyXzqZYLVCfkJMIJtr/aOnuNTIylqusAAbFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNgHSbH827lcxdQOTjYsBCHxcWqwUoPOtarEF/4Zzps7DoPPFP
	y6VqY+t6YDh7NOMi1UQ54b9STebw+RgZA21ln8UljvDIUjKplL50l2wrXxd5yStCXLM=
X-Gm-Gg: AYBFou19j2vAZoV2ENyCzM9W5/zdbK19HtdAac8TFKOe0TrXBdNZM/gIsmgU++C2Tyv
	V5MS4tg9VxjTEH2ym8saYGZaqidpBH7vuLCwpTRu+sE8qIcJmEmswr+Ci48i5WgkrpDTWRc6ZaL
	co3hXVOIShUBDjcH3Wd20SDksldeGhYlP0n2XhAWb9Bq5vS8PHVW7KClYLdjsS/dCBoaN5AsQK0
	ZDe1Am1tcP8YMS0/11Kqiw/wDoDgXC/pv2mPBOkSMb4/xy+SCiSf0WODrWo9KrlNvtYU88cCQmR
	TDQB1cDnDjs6QOBkC5PcXHn0ww7yTa9x98BxDAwhNwynUxcUkqol+N+kaA1Si8U010PDzosob4n
	IqLuim51qiPcD82DlO38ZDxlkVBAbdWMnJ5mG/7V4DWWQ9AJpMiSBYLQoYT8zQeB9i07Qm4lLzT
	h/pLM6IXoe8X7zkSmlB3e6z76PnSDCnIeUI6GvmOJk1IcJL63Rj8zr6JrGhW+izMCpdGs1i908b
	NvQFLaEh8+KnlQ=
X-Received: by 2002:a05:600c:6208:b0:4a1:698d:3042 with SMTP id 5b1f17b1804b1-4a18e493143mr238587165e9.6.1791909523029;
        Tue, 13 Oct 2026 09:38:43 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48de3f7f8b8sm4342783f8f.35.2026.10.13.09.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:38:42 -0700 (PDT)
Date: Tue, 13 Oct 2026 18:38:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nicolas Schier <nsc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, David Gow <david@davidgow.net>, 
	David Gstir <david@sigma-star.at>, Eric Biggers <ebiggers@kernel.org>, 
	Eric Chanudet <echanude@redhat.com>, Francois Dugast <francois.dugast@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Johannes Thumshirn <morbidrsa@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	Julian Braha <julianbraha@gmail.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Waqar Hameed <whame@whame.dev>, lpcosse-keysigning@baylibre.com, users@linux.kernel.org, 
	linux-kernel@vger.kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <as5Xs2CgIP3826iC@monoceros>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
 <aspYFzgcxfOvOUrZ@monoceros>
 <asyw827yeYmzQflV@redhat.com>
 <as0HujW2cskdsHqd@levanger>
 <70c0e971-d76e-4aed-b672-faa0863b07e6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjriokcsrln3qrtd"
Content-Disposition: inline
In-Reply-To: <70c0e971-d76e-4aed-b672-faa0863b07e6@kernel.org>


--bjriokcsrln3qrtd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PGP keysigning at LPC/OSSE 2026
MIME-Version: 1.0

Hello,

On Mon, Oct 12, 2026 at 06:55:43PM +0200, Krzysztof Kozlowski wrote:
> On 12/10/2026 18:15, Nicolas Schier wrote:
> > On Mon, Oct 12, 2026 at 06:05:46AM -0400, Brian Masney wrote:
> >> On Sat, Oct 10, 2026 at 05:31:55PM +0200, Uwe Kleine-K=F6nig wrote:
> >>> On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-K=F6nig wrote:
> >>>> For the procedure to actually sign the certificates, see
> >>>> https://baylibre.com/blog/pgp-keysigning-2/. A bundle of all
> >=20
> > before too many of you are struggling with uploading the own key with
> > the new signatures as I did, here is what worked for me on Debian:
> >=20
> >   gpg --keyserver keyserver.ubuntu.com --keyserver-options no-self-sigs=
-only --send-key KEYID

For sending you don't need `--keyserver-options no-self-sigs-only`, it's
only needed for importing. (If after sending the newly added signatures
don't appear immediately when you do=20

	gpg --recv-keys --keyserver keyserver.ubuntu.com --keyserver-options no-se=
lf-sigs-only $keyid

or check the webif that's because there is some delay until sent
certificates are available for fetching, and because there are (at least)
two servers behind that DNS name and you might hit different ones for
sending and receiving. Eventually they sync up, but that takes a bit.)

> No one syncs (and no one should) with ubuntu keyserver, so this solves
> nothing.

That's where I get the updated keys from to update the signature
graph[1] and the strong set statistic[2]. However I don't fetch into my
private keyring, but a temporary one and review the changes before
feeding them back into my local data source.

> I know Konstantin sometimes polls from them, but that's rather
> workaround not a solution.

Konstantin doesn't use `--keyserver-options no-self-sigs-only` and so
doesn't suffer from the problems that (some) keyservers create.

IMHO the best option you have to distribute 3rd party signatures is a
WKD[3]. It's not that hard to setup, and for the @kernel.org UIDs
Konstantin handles that (fed from the kernel keyring repo).
You can fetch updates from it using e.g.

	gpg --locate-external-key gregkh@kernel.org

=2E

To create a WKD the following is enough:

	gpg --list-options show-only-fpr-mbox -k | awk "\$2 ~ /@example.com/" | /u=
sr/lib/gnupg/gpg-wks-client -C "$docroot/.well-known/openpgpkey/" -v --inst=
all-key

with $docroot then being served at https://openpgpkey.example.com/ .

> For people within the keyring, please send the update to the keyring (or
> Uwe will do it for you).

Uwe will do it with the updates he fetches from keyserver.ubuntu.com :-D

Best regards
Uwe

[1] https://openpgpkey.baylibre.com/Fei9keem/signature.svg
[2] https://openpgpkey.baylibre.com/Fei9keem/stat.txt
[3] https://wiki.gnupg.org/WKD

--bjriokcsrln3qrtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrOXo0ACgkQj4D7WH0S
/k7h7wgAnUuub7QG1OjkvSS+ZiQa/P5oSQNpexjvz9yjUSoWH0FcSYJuLjZBi8KJ
ETNsyOT1PbWTL6/Xkr0OPKSyDo40cCPKdoib3jTt5WMk4BrBxiBMF1ZAuWEAZ7eB
5swmY7nGultn8h2qyyIwAmMlJRuaM+4lbvT371BrlyX7xIIJJV3u82JB4Hv+sdPV
ZRox16NqdqertW+0E0eJ84AfsZPUXseg/n4D5zLwT+iVh+kmRck9U3wfoZ4q+m/N
iL62PJBR6rEJrdcRKMd4IuNr1IMlGkSI9MXcBbW9A7jyVuejAWY2s9wHlcfVwZph
zxqdawduQUnv5K9eJUTMs3g1N1IGCA==
=xxyi
-----END PGP SIGNATURE-----

--bjriokcsrln3qrtd--
