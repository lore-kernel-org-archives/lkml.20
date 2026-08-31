Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC8456E00
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188214; cv=pass; b=Ixoq0VOzq9H1oj1o61iAeovaMBSRZYaRUFm6Movv9mULRJXM95+OA/ERf1IsOBcjO0kBOCssZqgpBiAZ2ziPUk/fa+BVSPGV1xTz9ILhlosCbT+G5W/hmHXzo3QdiOJnQG+7tQ5xWg6CvjSewHMAQA/BLeWezyO21nGFsPXb/3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188214; c=relaxed/simple;
	bh=fQ1KczgVjn2OLco7PJvTjX7kIErM4YB9Db2mGLKYUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wrov4L9IYlqZeo9E9RvqSFnlDHaIVPHzj45BSiA4z00mSJ4kPLjkvbnqQG2jKx9yI2QJyT8EtmzQD7HbIuBOdfEHr+unRchSyoJj88y5DJDKqHfoaYUIa6hY3t7BIYb3LIW0/twlSLgmB21YoNuJe6exaTcIVD6b0H1C3rjNeRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im3B8kB/; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im3B8kB/"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ed2a06b9eso25982937b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788188212; cv=none;
        d=google.com; s=arc-20260327;
        b=em5/ZMYnziys/TPt2BsFrqNJDhVFOpfGgJ1p09BQ3e9B/uCpPrp7dDjLUm9gjcDkBq
         YwEzQVly/1TMGzJOXHyVRO2PrcXHQ6dMMQsGhvJdE7Ep1KWMSfx3LEHRwuFiegq8q7qI
         BtDiRfLk4fPqJgL6g2wiCot61TAQ3UODU9C93F7PClLGa+j4fXgbg+nn0HEG8pOjfEHS
         F5miVvP9CIZkw8d6GuFFbOOGjRsEHxMGJG0c1m+AKPfThZ3X+14U7DRMwM4AFKoNXS4U
         lZnIhm0GZi2RDxiEniuQinPsXoNtKHvHkd8heNoSBGKSTQ83JQw3TCtmE9BhW4n4BUes
         zHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5+zq9GHEAhd7KerkGfPIO/cZTORFxbM5JF3XjkEQQ4=;
        fh=Mb4LHmCFE3RbePu3/c/gCNhp1DPwklV/n3lYkdsNFtY=;
        b=HmZkeoPxT3tk/WOUaE7TPp3YizJsGZNbVsHJh8mEOevqgLVQ/3EKYsHzlLrsln/XpX
         310qb0CTUjwFmghpQF8l8tz+9cqZUWkScdE5RPV/+u+k/d7IoYFS39o9p1GHV3Q/SLR/
         8zRrFRZGwxFZLzP8/gyg5hXfkN526Q4WeHDlEa6FQFHBz93WH0V8Lc0ZP/aMikPoXrOP
         aYmWrWJMpfh5ji+C2KOlRmo1d6U7k6rQ/S6k5T13p3v+iE1CgZmG6Et3Y5vGr5IzZYIb
         Eu4KSdrYezTzDyAzJxe1s5h4zKQUuTZx/Fny5wHr3B8PVdRUw0sqsdiubG2Xr3KDC6FJ
         VhTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188212; x=1788793012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5+zq9GHEAhd7KerkGfPIO/cZTORFxbM5JF3XjkEQQ4=;
        b=Im3B8kB/Ifs+Tz201oTm/uMCFtCMcCgQ4zVysAKGTaH/Nyy1xARwAd7IrXh49ChG3v
         hqN7XlShKQ/uHhbNLa/Yh4Qm6Sa71gzrcgH0c9niQlbAOWxxW4GdOGOFzLG7gtb/58Ue
         eUrUG3HAAYsc+DCQbTEBQPItjtAkV9ppDd2L7O7qwNoQeAfr7nyRy9iYkoWGKvUIOqxo
         FilZWW+e4Hb352N0rehIwp4jaaMcWneuUuGzqWieJQXPix7Dg2ziLvAQyWIVgfKLnhAM
         5d08UnEPzdz0GHPb/vzivE+Bom0hKGfGwuqju5Bf/244Yy5zUTwNpq0u9m5lxt9ss5Ud
         ELGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188212; x=1788793012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5+zq9GHEAhd7KerkGfPIO/cZTORFxbM5JF3XjkEQQ4=;
        b=JkJq3n6SQOZUj3K3XLP0Ty2PPbjSH0cvEtEqlHj3ZI5yWty8uvws1lcfcWIcJYxFR9
         /Hr6jU3rYVFxz/EsvIQOcZno/w8rJHmtugEKZ8mkkYBUGB4kgWXGScLxeG2oQDFnU8gO
         Hcoy2p2roJGaUATM9mYnv52gBKMMmPuvLdMOHeiV8nq6kEBwl7WCOQi9nJWrtVXESPYk
         b583qBp7ODdlPGIDwIWJ0PPalqYUC+ZSs+Mi0JOhGZoHmJTq4pLp+gYCUwlvd0Dmggjp
         iFXozZE1tiUzLgYMdEoB+2tSjDrqtiRzbnFji/K/Zn7s7psxBT5LOwy6pi0A0+q9AYfm
         wOzA==
X-Forwarded-Encrypted: i=1; AKwUvBwXWYy1UT6EKFp76LGDc513FgC/IZwZptdXOFPC1YQsi902ljrk7cgtLfsfNYJbBbr76aEEhH8HKTm9LF8=@vger.kernel.org
X-Gm-Message-State: AFuF++k2/xDqrvJY/Gd6CAE+OFg05gRZcBF8ZMqijCMtsVz67Xrze9Gg
	nyi3aoyeuWPz11Yynihf5G6QGQVtYXuqBXE+1cPadAmb5cDzjP0o4rcwLJk6GAZFd+ov/TsYjAB
	RdwFuheIcRaZt3IC3bqQhD83ugRQr+YQ=
X-Gm-Gg: AYBFou3yUbM9gFpUgQqKltPNTQYD4TfNCq2j5BIucEdBQUYMJxnT0mpLFRLV7Cge6kA
	EXuzYaEvMtYef0wUX72MIcWYXBE9b5JUQ2XYHqdSYPPDVMyLm27TPdfCG8QhrQErLJ/slWAB69k
	lmUQj2B85I4UFzH1eGvS3G/vOaEx+3zYga++0HPPalNWnDU81YEE9vcWJiDG7Fnfh4jJ3HpmNZM
	XeuYCY8ogFLbyVW5qu0hs0wUCkEhoime7t1e6YajJ+bznQd+S5XD43gEhFlBcYpEAckXzH2oM6f
	vJYimnjxLrBClfmrJf2qXuVZ7RMvUv0ckSvxIFj2yPpzH6a9yPMOaI1Zn6L4GHL99u9txjjc6qC
	rt6ZA0pe/ny0jo9cMzyTJhj5/TSSKlQ==
X-Received: by 2002:a05:690c:38b:b0:866:4769:d59a with SMTP id
 00721157ae682-8664769db91mr24745417b3.2.1788188207079; Mon, 31 Aug 2026
 07:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829100205.113655-1-paul@crapouillou.net>
In-Reply-To: <20260829100205.113655-1-paul@crapouillou.net>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 31 Aug 2026 10:56:36 -0400
X-Gm-Features: AcwNN1UGwPwFC7jqs3bkEilU0Bk-oM2hKNvPUBlkzQ7uK2iT30q9xmjCCkBzrPU
Message-ID: <CABBYNZKNSbc7CNsJG3W2AgU_JLng7+Y2Jh4KUbKZQXOMGJ8ALw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_bcm: Default to 4 Mbps
To: Paul Cercueil <paul@crapouillou.net>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sat, Aug 29, 2026 at 6:02=E2=80=AFAM Paul Cercueil <paul@crapouillou.net=
> wrote:
>
> The ACPI path already did default to 4000000 baud, while the OF path did
> not, for some reason. This meant that unless overridden with the
> 'max-speed' OF property, the serial port would stay at the init speed of
> 115200 bps, making it unsuitable with high-speed Bluetooth devices like
> audio equipment.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/bluetooth/hci_bcm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
> index 9a103db7e355..c44d552f9ad5 100644
> --- a/drivers/bluetooth/hci_bcm.c
> +++ b/drivers/bluetooth/hci_bcm.c
> @@ -1224,6 +1224,7 @@ static int bcm_acpi_probe(struct bcm_device *dev)
>
>  static int bcm_of_probe(struct bcm_device *bdev)
>  {
> +       bdev->oper_speed =3D 4000000;
>         bdev->use_autobaud_mode =3D device_property_read_bool(bdev->dev,
>                                                             "brcm,require=
s-autobaud-mode");
>         device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_spee=
d);
> --
> 2.53.0

Sashiko flagged a problem with this:

https://sashiko.dev/#/patchset/20260829100205.113655-1-paul%40crapouillou.n=
et

--=20
Luiz Augusto von Dentz
