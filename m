Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204427;
	b=0ofKbcOolOO/Ssu4Y77GXUlJqDtF1wUPFk7QYISP8rYxEVW1vmGX32razPWP5dYiaLFx
	 QpYhpwEHvAgIOdIHh3p2BG0i72jWiXynTHNqCxl9U1ahM/kxuj2UAhBgUOwALZY2i0oJ9
	 oj7oodU5VIEn2++IaaLDkH6KpnHM2LSou3TYPhcDEVccHgW7e92YcRKhP6aJdcaTZh9gB
	 mqCv9Dl4Lh3HBChmy8Fifti8lrMeYbApQQITTrLr70LhhHtNHDHpl4iGgiK9bfkCh7mdZ
	 beV6bOrlG0WsEcymPFABzFbLJJ6XWwy78NJZ+36wOlwlcI5uZ93PyLk35wRL1+bMMsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FZdcGTA+h9AzAtOd+lzkuRzpxRIrjwh4ypxudX3fFDw=;
	b=fj2bPCUFEreXOxWCMT1LTzI7cDAHKLTNQ82zQvFWwz5hkNZfKTL8UrouadFQfQk0Gt3X
	 aUHmxZ2PWnpJi8L1ufn0nU4iTNWVJiKzrSKR6DePAaLuJlPNtUU9rsKt1wqKXdf6BtXmz
	 udyGFLSpl7YBlKmOzlTL6O4OG4zVOtLXI3+9w6K3np6wPYnqcpCP7LcpLFwg/J11MPXQx
	 /fjzxTrUWp3dp2+dDdmEalv4lJNNkTZ+OlHKy9BKo2MYreKkdD8Jl3gUfrrZVhT2LFiyD
	 fOPJGGh/mWjd8AatfgCZGK2BkAZ9MyJdLdFnJtoEVBUjcvwNJQ0Cth/4scs4yCox2iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkJOWe9L;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1FA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkJOWe9L
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so728161a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793204427; x=1793809227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZdcGTA+h9AzAtOd+lzkuRzpxRIrjwh4ypxudX3fFDw=;
        b=IkJOWe9LXiYi6YrZWYxZvByX69tYEA/DXQLsTgxvpkUztYbWU2F9Sc1srt8hZperJY
         +hQ1N5s/eqYMRffh18Gz7oL5caxYc+/ohalRNG/KR179e8czPzyO/Zi/cz6gdaEshlw1
         fmH6wyShcHNqF2gj/2ZFYgb9OL+OBeWjUe1EHGXrsX9AesZ/9rDPoweVF70aGIy1PlfZ
         xzypz6E2+fLrrCGpuSRjjkIFzhIogfVTJQqZHKZXjsMAleWvc1jKnD7GjarrQw0Nat8m
         vsNld7X9rug5nYpAHC4oPewkVF6V63YAI42cVp2QT5xR+pDUUxe5udhEoQQjtWctSeXY
         HGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204427; x=1793809227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZdcGTA+h9AzAtOd+lzkuRzpxRIrjwh4ypxudX3fFDw=;
        b=dnjEf/t3Z7s1oY1QY08EAIdZpRSChGfUQvfJY3nQBffVaic/OVgUAPoHjS/s98rBer
         R7FJfuc2JCOyKfCY6lRkoL9eyqVe8cE/ozwN0uJWGpvJ3gPvjyQMEjurbTufFo4uyei/
         OpUnVXWQnUwSpDKSb8Qkjwf8oiQ7ruDUKjD5QTh84bPfwcJ4YrBiVLy2z5bVQ9t1t8zF
         u00ZvimgMSe9V/hi1uGkwSGVjHLiGlLrIwbnHTwzg8R2AVZp7vvpHgJvugcn9fgWzWI2
         uauJlSZEjUzfM4GsnID7H60YaWUuF5RVnY1bt3xmmsqcpZmu+pi/Xyzb0lcebkZ8Lq9W
         jpbA==
X-Forwarded-Encrypted: i=1; AKwUvBxxEAAWEuJabXg/BzFQp0OAsPaQ0IgGRVDj9eqJE5+lGX/A3F794s7oaRwYz9K1sq6QXRcp1qyRx6t/k/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLmUhelPxZHejAm7sE7y9abh2Ti4wnCeKcfxSF7QS5TMCSPHIf
	uxyu1TwgB7M/XqMk6w+o2N7UBLKhYRutDw/aT9zFhHelniKjgNL70QDzavyifOGezf9P5ZspSK+
	t4/jT6w==
X-Gm-Gg: AYBFou0HIC5eRRTAIX33DOWk+t9juup6WPtBns+KqNjEq/MrjI6Rn7N4x3CASG1nnlM
	lW/Ka0/9A6a3bkCtUpHvuwCxYlPRDGc8fQWL4CJyO1PZcp0A/cDHXgNK3sD4OxLw2cqQf6coD1t
	ilzmQu1MCp5ul44KQbG4dKnQ7zW0NzXLxdWNoU4pjsU6G7TKJRl6yAGJIXaMMWtNtuT0kwr1Bh3
	ILA5OgheCSJmJRrq5dGawAQDe+A8kwPgM/C4TUpD2gq9CDWXz1cu3CahiOjWcGua92bQz1Osoe1
	WHsDcDBh6THZcjYjQLRwhSBrvF+nG+xMANJDcu6NmHk/pGpE/N9lYgNEtFpzhtamFVFkguZNWDE
	DkD+NhRF0oAh4Y0W/Mp5C72uFcl9C/Laggv86iBGAimzxzqFmiqUPAMUdcv+UqMOB1xWACghea/
	dcK/DrmW/Pr9OKsP5pIbQh4DePw/TyUQQHQP2FtykyoxsCPWneOGi0onJhd2BZKIujI51VT3ZvF
	hdHQkp87HX4xcRBPoxxiBmwMirCGH3XE4qaaOhg2L1WPwt5Hz8YB9lbMOM2f3StYWkO+DqM951Z
	PBlndvu3LnLuRh4wTk9zjQeCyZxE8+tyndwPWzESEtJKubb4XUgwXK/Gx5PK2KyUDwEJKM5gFdr
	CATCHdgqVWrZ3KE1MgUJQHwgF0kv2n9NSYZl84nf17+VPDZJmY8mRnzbme/+VkD9n3KPeayTzFD
	3WM4+nBk+deQ==
X-Received: by 2002:a17:90b:5348:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae5822fc89mr2136829a91.31.1793204425804;
        Wed, 28 Oct 2026 09:20:25 -0700 (PDT)
Received: from google.com (129.119.127.34.bc.googleusercontent.com. [34.127.119.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm148140a91.7.2026.10.28.09.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:20:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 16:20:18 +0000
From: Benson Leung <bleung@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>, akuchynski@chromium.org,
	abhishekpandit@google.com
Subject: Re: [PATCH 13/19] usb: typec: anx7411: zero on-stack alt mode
 descriptors
Message-ID: <auIgwsOrGy21YpEV@google.com>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prbgZGmxhdo1sNWP"
Content-Disposition: inline
In-Reply-To: <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>


--prbgZGmxhdo1sNWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 03:57:53PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
>=20
> typec_port_register_altmodes() and anx7411_typec_register_altmode() fill a
> struct typec_altmode_desc on the stack member by member: svid, vdo, mode.
> typec_register_altmode() reads three more members:
>=20
>  - inactive: a port alternate mode is registered with active =3D !inactiv=
e.
>    If the byte of stack garbage is not 0, the mode starts disabled and
>    typec_altmode_enter() refuses it with -EPERM until somebody writes to
>    the "active" attribute of the port;
>  - mode_selection: the DisplayPort and Thunderbolt drivers enter the mode
>    on their own only if it is false. For the partner alternate modes of
>    anx7411, garbage there means that the mode is never entered;
>  - roles: decides what supported_roles of the port alternate mode shows.
>=20
> typec_port_register_altmodes() is what tcpm and anx7411 register the
> alternate modes of their ports with.
> CONFIG_INIT_STACK_ALL_ZERO=3Dy hides the problem.
>=20
> Fixes: 183b194d8fb6 ("usb: typec: Make active on port altmode writable")
> Fixes: be727d400066 ("usb: typec: Introduce mode_selection bit")
> Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

Adding abhishekpandit@google.com and abhishekpandit@google.com as a FYI.
I think we've run into this class of failure before when we were developing
mode selection.


> ---
>  drivers/usb/typec/anx7411.c | 2 +-
>  drivers/usb/typec/class.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 06c25af094b3..ac122ab3175a 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -552,7 +552,7 @@ static int anx7411_typec_register_altmode(struct anx7=
411_data *ctx,
>  					  int svid, int vdo)
>  {
>  	struct device *dev =3D &ctx->spi_client->dev;
> -	struct typec_altmode_desc desc;
> +	struct typec_altmode_desc desc =3D {};
>  	int err;
>  	int i;
> =20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 54c7810b563b..9d9703c70820 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2684,7 +2684,7 @@ void typec_port_register_altmodes(struct typec_port=
 *port,
>  	struct typec_altmode **altmodes, size_t n)
>  {
>  	struct fwnode_handle *child;
> -	struct typec_altmode_desc desc;
> +	struct typec_altmode_desc desc =3D {};
>  	struct typec_altmode *alt;
>  	size_t index =3D 0;
>  	u16 svid;
>=20
> --=20
> 2.56.0
>=20

--prbgZGmxhdo1sNWP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCauIgwQAKCRBzbaomhzOw
wvDXAQCijNyaOvUNYvxjFwj4hTq8dNFCv3FIfnTaPq1BCKalkgEAoOTH5PljgX6F
XKdrI7ljHCJrJ1XGW7uTurd6OGKHMw0=
=SMJA
-----END PGP SIGNATURE-----

--prbgZGmxhdo1sNWP--
