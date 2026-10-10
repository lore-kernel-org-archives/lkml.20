Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7C356748
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646322; cv=none; b=H96VXpjrGauVHGAKEwxoDv5sCbz5BwhtHXfzHxXlPLHqqtWx2JmyWEsIMFeCN8zW4D1i8h3LalaCHS6Saie0U5XxgDP8RO60ndEU3fBun0K5fsoGzd1A2IgbMuvU/3S1vJSeH9oLNlHNnbUC/SkVpYYZU6H0pu2QrgsjycV0dXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646322; c=relaxed/simple;
	bh=IFk2q649cu/PhVrg1od6c/7YLks3tCMxKZa/NwUX4d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLPUxR4oYw4tC7Xhp9ZIpfrpkKyNRH6LfVd9Nrs4MXysS5HAZ8A8ZpX9YtYkZO7zVtIm7iDpJdWcxd9u2eUlNPHBmYJz3nKhLXQ+sfbGVK50BA8pYZVwg1GkMdKXa/OPkqkR8MFi+CMKqHQMWr93ipMgHbHIsYGOnT/bO8xKiVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nTjNT5Ah; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nTjNT5Ah"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so3342765e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791646318; x=1792251118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7ZREsLREVDpQnvra4LONvWSwvb8MxjaKo3Bp3VEqQI=;
        b=nTjNT5AhYZigXM+kcx/dJO2LklGEv8bhbp/fcm0pAPDwtTC+dTTWVbwM3JSjtZyFMn
         KG0jK4F8FtISTZMJeYJ7TMJK9vztpkrpy7Rm0ffrGJlymuPIRb3iIgzTRWCLv0eOTgcp
         pFSPmMfOHJyxTs6Tj4uERifUWUI4wVwi7lvZSvLzaXTgrzmGePibcesuAXitYuEtTyjw
         x+KtDetcS3BnnQfRKMrjQ2S3c+SrAbyl7MXa5GFjEo1UExZ6Tq1E2+4ZcMsziojrGEek
         JH4dnJ5UMX++mdWPV/e0vZ8ch3jWJyaMC3UT3cw2PXru4ieH2aaGasTNESp0gSuU73XF
         6DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646318; x=1792251118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7ZREsLREVDpQnvra4LONvWSwvb8MxjaKo3Bp3VEqQI=;
        b=GbRW9md76iHspbqw5XmlUTNIX8Cn35FykFsDaP2kU1/F+jbExqbZkQqZU1Apxlf6ou
         yZKlFwlMmVAylLdv+KY/ecFtchTKhdJYooiD5K62VSEGKDHo6ZFYpQJNINosVO1XAD04
         hOEF2JHBDjIxATCcuuvbJjgbZlPp84ssEYLrxJJMVdPJyXaoHZ4Rw6J9VD5Ow/WS7xFJ
         UG6s1Nrz2bGzXGMzwSUDK1vE4eUR0pSWEt3u6a4LhAZIaDHF84fG6fQ3zwaEPpcYFyrv
         kQBF/GUclz+YHFfi+C0KBz0MqR4qO9Msxh/V7WB8QBPs/VmH/LO5D74U16f+KY9TZhR4
         d46w==
X-Forwarded-Encrypted: i=1; AKwUvBwIpHz3Y5TyEZG16OlaYHps67IJ6KZ2qzXlTsYgzq6hMpG1jrIqOf1uJoUhZQXguRVeKPe2xzJBXseSBvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYILS6N8s6BjuJDR7wWPN7Xux1CcGBsyhjLPYUftfDw/RGNuFGpv
	mlteZ5wG3u8e9x63bwYBXfqBQoGvXjGEHjs3ztqd6M14wwE1yrnNUYvqYxo4XTiQYaM=
X-Gm-Gg: AYBFou2Bw/ld15BNm7l+TlJnffXrsZu/h64b2laM+ngOXnAo8wfkz8WPWDruAxYyUfX
	pF8uOMvwAxHKV3qe5Nj4m1RSLTXriGpjYksexeEb+cx4B6Wr3MIQ5q1jR1XL8dPjJTWddsxG/Cs
	zSxxDZzu8i3xQrrwx7BhFKvxxxrhEl3MbGxL/aF9XWEi7LIIbOnpON81BB6wU6HxWDUyGHtGqcc
	J1+96dO5j6HKLnIqCxFRkbPwIKrfQasK4UBByFttW+vO5vIldzpz83i/LaRWMEUo49aZI4GYV7o
	L4Q/rSyr9J6sIgVKDEw+q8tkYP8FOIDOH0hSMmwTMqug9CzmtzRHsD8z3kJe7RWncTzJgh8q3B3
	yaQ5ErsS5E1vnD0rrvoJ5tB5GnxVmKRKl8QSgUEWPGYSDLyJn5Q7TqvjTCBcXVDxfsg9q1pwXg8
	IG6eLawKvClyo/OVLLtgQNm9yLQqyii79K8hIFa1yS/Uv4pMcaWTHyLlszpY7N7KTmSPYZ69X3n
	+lNqT4Q48j8E9w=
X-Received: by 2002:a05:600c:8b74:b0:4a0:2847:b6ee with SMTP id 5b1f17b1804b1-4a18e4fb8c1mr90334775e9.35.1791646318271;
        Sat, 10 Oct 2026 08:31:58 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a199e5db12sm75235e9.2.2026.10.10.08.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:31:57 -0700 (PDT)
Date: Sat, 10 Oct 2026 17:31:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Albert Esteve <aesteve@redhat.com>, Brian Masney <bmasney@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, David Gow <david@davidgow.net>, 
	David Gstir <david@sigma-star.at>, Eric Biggers <ebiggers@kernel.org>, 
	Eric Chanudet <echanude@redhat.com>, Francois Dugast <francois.dugast@intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Johannes Thumshirn <morbidrsa@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, 
	Julian Braha <julianbraha@gmail.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas Schier <nsc@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Waqar Hameed <whame@whame.dev>
Cc: lpcosse-keysigning@baylibre.com, users@linux.kernel.org, 
	linux-kernel@vger.kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PGP keysigning at LPC/OSSE 2026
Message-ID: <aspYFzgcxfOvOUrZ@monoceros>
References: <lpcosse2026-keysigning@baylibre.com>
 <lpcosse2026-keysigning-list@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jicpq67hco6pmefb"
Content-Disposition: inline
In-Reply-To: <lpcosse2026-keysigning-list@baylibre.com>


--jicpq67hco6pmefb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PGP keysigning at LPC/OSSE 2026
MIME-Version: 1.0

Hello,

the first few signatures appeared in my inbox and on the keyservers,
that's great! Please continue.

On Sun, Sep 27, 2026 at 02:33:22PM +0200, Uwe Kleine-K=F6nig wrote:
> For the procedure to actually sign the certificates, see
> https://baylibre.com/blog/pgp-keysigning-2/. A bundle of all
> certificates on the list is available at
>=20
> 	https://openpgpkey.baylibre.com/Fei9keem/keysigning-lpcosse26.pgp

I added a few "latecomers" who distributed paper slips to that keyring
to simplify signing for you. These are also on the signature graph[1]
that I'll continue to update from time to time.

I also intend to send the certificates that are already tracked in the
kernel pgpkeyring to the keys mailinglist in a single mail to make the
new signatures available there with minimal overhead for Konstantin.
I'll do that end of October.

> If questions arise, don't hesitate to ask.

That's still true.

Best regards
Uwe

[1] https://openpgpkey.baylibre.com/Fei9keem/signature.svg

--jicpq67hco6pmefb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrKWmgACgkQj4D7WH0S
/k6LLAf9FI6v+BejNkqOVlby7573o9lm6Pni9pBVCtgmOJLFUM1V4nhqAP28ZpFI
n8W3i1Swge6LAfmPL9K38Uwk2zwEe1w8i2intPh7o7qcAvc5Svn4sCH3JVREd9TN
N5bX7s17Npc1ft55Q6ClWagpfq1yRG+9kehRf1dxlgKRYcM1fm9oRW6MhtgdXiRx
nSC+1isHNCk3euE3GjKl5Za3av5oDvBnz0Smi21+K3LLHQTo84FHNVpI8S/PZcr9
zETl2pi5zKEKLx00Tf82UhdfBCV6b5F6iVSOTz2bcYHmyEL2TzKIINQLmGDBTcF4
O1WNLMuwlSm+eoFai/A+oGR1D5ZeAA==
=tR77
-----END PGP SIGNATURE-----

--jicpq67hco6pmefb--
