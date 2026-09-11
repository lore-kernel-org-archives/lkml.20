Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1A73C0633
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167431; cv=none; b=el6XkZI/wXL7yvH4YG8nmuZlmUOkf03PMNOrPbZx8cw5INcRhyvUA2EmfwbQ3NSbP+9YwPdKYpL3icOwoN97NID0BqESff6sxBQ2T4B7sOD8HBkSA0EbPyBFksm2r8xP4+67L9uZNir2M31uYXXALvMFiGAXXk7QsQf88o3m9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167431; c=relaxed/simple;
	bh=nPSFGPK4qUyT27Vl4UYL/XqaMQuwHQmHFbfvctmtSxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWK1sUsKYj/GXFFzpgT2WPXcY9VMaCEzVlMUb4QrBNjbzQgHyIDlaGnGeesPYX/WXOPHt1YEA7Kq8g4vKJFLOnN6vM+h/vSDZle7K8t/qD0G1pVoWR9yDhOMxTETEYIf+iUppUDmLRz6KAwg3buH8qq+zCle82MXs40ADLDZfAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SptDik7a; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SptDik7a"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso2832065e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789167427; x=1789772227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nPSFGPK4qUyT27Vl4UYL/XqaMQuwHQmHFbfvctmtSxY=;
        b=SptDik7aG1uaaAndSaXEdBhIZqFFiZ10UpxSSCCfTRWZ3peBfyJgUSfcCnfLXbvGuQ
         A2hJbir6QuLIq7tsHXr6Oh8BCqph6MIYu+WPtdjSHq9WEVIt0etq6NXbUYyUT+C2KkOE
         mGjM35WIT6n3ERhERPB7tGbRSBB37GgnrBAnvIAYpk682cmjAjSzwaTdQh6Y91WF0KmL
         2s9GWGgEtTfFUNb2h/XD3NBoEIgBlOPDqIhy3wWJiUtmolXsOyQvUDr2/GrO8OcnE1Rr
         p6IaH9br8fzt1++UIqRThzVx4jmRixaDfRxLmNmS4Sr6RCVo3Me0NGJsShbNUXOFVLsD
         jJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167427; x=1789772227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPSFGPK4qUyT27Vl4UYL/XqaMQuwHQmHFbfvctmtSxY=;
        b=My/spO3XnFLGTnpSgkMIvoW5o5WSlCbNEV8hqDByBvNN69Y5lpih6p/IZRGNqp8DAx
         pdTT+ohvOX8/o8p1tXQegKZzS3gtKB5lMQQxfnlQhoRv1Z7k7CoN3mGl4Vibd2XOzLql
         ggFBFoSdvN+9HI0mJ5fWmVyh/dOczJUEy+7pUfUdaicjzyxeE6Udnqe3ky+XSW5FeLJg
         gKvMzmNGpvj6xoSEb/fqyqzlSaorboJ+Do5xk5JoZszQbxGYrh0ediUNWSG/liGqtHT3
         KXcD0Bf4QjlucDZbAcdrWNG01Y9j4i34hcfRARDop1n9uSg/LcwFf59Hj1EaO/mHJL9x
         adgg==
X-Forwarded-Encrypted: i=1; AKwUvBxWoN+UYUIVaDpatDoQZjVC9yr3jubRQgGjy5q6E0rZ1luDSjrIwKDSn8TN+w1l/PECvIA+kJCgDDpJ7Ic=@vger.kernel.org
X-Gm-Message-State: AFuF++m5OU2SR180yi7Sj/Ujkvhkkx2OzuT8LXCeSBz8PtSzUSbh1Zqz
	IY8xKXtrafvcyRUKLifWycTMHELruW8FHCNScUiXd2/4Sn0d1qCFi8kq+MS5v2DL1Jc=
X-Gm-Gg: AYBFou1t2BlA9LcK1OIiP/C5qdJ4mXuAGT37xqlM1+zDpsXYNelp6O9e7SnZYFNQE5i
	I0LjHw3Br56gn9O/aJX0DZVfSkOR1UEAbHoQAdG+hUbAZWH8bqSN+6bdMFgbSKe+ftvI/Nszv/z
	Y39f7vzr/J7s+ZFt2kWQwVzemvUztpgMc2OdKbId3QqdiPW3+XJZd6Xy+bj28VhRccboPOruclu
	qumxaY87J40ifX+uaOZ/iW1KfYINljQy6yBveNbQbjZPELcvyWKuks3oe4taBjZ3+wHepZCIks9
	XzkGYyR/j7mnIHaycA9kQUskDZdi5ns31q5L/FB5uR0NftMQtfh1TNPN5SbtHsc6Eb6oHxdRWQW
	RpQcZoUH78iQ6Ksh8DHMGYWo834k7kH1rQBX9AmkuaS+CicNOJM/cDTdkifi7/QPw3imTpbMXaS
	+x7Eqli45b0ArRJW16GoCpVg5ng30XPdMH5OA+/TL4/YuR/jrUG9mNjcNyOWtosTbEHV/efeq5G
	evK
X-Received: by 2002:a05:600c:19c8:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e619f3ae1mr135996395e9.10.1789167426450;
        Fri, 11 Sep 2026 15:57:06 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-486eb2ecf23sm9215894f8f.5.2026.09.11.15.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:57:05 -0700 (PDT)
Date: Sat, 12 Sep 2026 00:57:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ping Cheng <pinglinux@gmail.com>
Cc: Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] HID: wacom: #include <linux/device-id/hid.h> instead
 of <linux/mod_devicetable.h>
Message-ID: <aqSGjE1NCAQuRhi8@monoceros>
References: <c8efa35aeff7b6ee4f66f1d48d4392976dbde128.1783329551.git.u.kleine-koenig@baylibre.com>
 <CAF8JNhJa3hOqt06XYNvhRa-QYz1LyzczPCdWbzs0Oin5DN+euw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ildf3yo3bibyzv52"
Content-Disposition: inline
In-Reply-To: <CAF8JNhJa3hOqt06XYNvhRa-QYz1LyzczPCdWbzs0Oin5DN+euw@mail.gmail.com>


--ildf3yo3bibyzv52
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] HID: wacom: #include <linux/device-id/hid.h> instead
 of <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Ping,

On Fri, Sep 11, 2026 at 12:53:29PM -0700, Ping Cheng wrote:
> On Mon, Jul 6, 2026 at 4:39=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > The single device-id structure that is used by drivers/hid/wacom.h and
> > its users (drivers/hid/wacom_sys.c + drivers/hid/wacom_wac.c) is struct
> > hid_device_id. So #include the much more lightweight
> > <linux/device-id/hid.h> instead the full <linux/mod_devicetable.h>.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> > ---
> > Hello,
> >
> > there is no coordination needed, just make sure to apply it to v7.2-rc2=
 or
> > later. So please take it via the hid tree for the next merge window.
>=20
> What's the status of this patch? I don't see it merged into 7.2 or 7.3-rc.

It wasn't merged yet. The procedure I'd expect is that the designated
maintainers of the HID Wacom driver (i.e. you and Jason Gerecke) send an
ack and then it get's picked up by Jiri or Benjamin (as HID
maintainers).

Best regards
Uwe

--ildf3yo3bibyzv52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqkhzwACgkQj4D7WH0S
/k4/SAf/f0RDXDR/wO9s+zJM8mesKTNn34sySP4Cdv9FevyTmGddrokZSQTBeNzL
kezYoP+cqValVHCEmcdgrQanlTldMxQsMWNGrEEpB8HPX3JKhWP48517VJJoY32m
n117pPxbseeDwuocQ5PzPln15jLrRU8DVnNsUHCDJ+DlNALYscurwTGfjPhryi8x
9WCMRhdDfStrsZb71+DBsMXISMVWIArJmcYLUc53ZVEygfjxHsQYeOpsZngUTzM2
FQ3sdBwulBi5eVDHmOf7wU22zTEB7a0v3R5Ihgxnf2ixBQk8T2zJlwW59XecE18L
njrRilgzWhN/gnjt4wkvbZYLBIgcDg==
=qlg2
-----END PGP SIGNATURE-----

--ildf3yo3bibyzv52--
