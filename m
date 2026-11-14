Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662622;
	b=H27zaq+LLh0pOgQzGMYO6klVO4cX5txlioT/uOARcUYGJhOkccwRnsaZBL+2EDP4tZCd
	 C8tstVZMZTSWbYlV6+EucL27PZ0mPIDOFUYc9KeoQnK9J+SwNhcB7el05YWqpDNX0RYxZ
	 QGh0L30EK29IQMM5porSpYI/LBtar+tGsgcHTPBkZ0wlZaUsyjekebvLBUTaLgXzl1+j9
	 jzpU1QwlBq9aLw1fUwz7LHXD4zHS+MVRzcCigzf0Yyy4FY94z4La1mk8Vm2HenXyFdUXX
	 HabiTXZkjd7pKEKeTV3a9e45Dob2qy5u5LLY5WDqjTCK3v+ZnHiJ7Ytavcs/PCVTA7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
	b=ohuibJufBf5gPRodrYUKYu2LpkjyEBA0uPhMLXKsraZeqcnNrs083dn2XYAGBvEriUGf
	 2W1DnBQR+mxy540YSFxci968/Zs+g8BXPMJ8FT3PP9c9kn1UAI3iwjNSnLmJ2ewRVsju/
	 syefcqK0FipTv80iQGiEz5wTbjkYWwIwr8gyGVp0y7eDLIIkZSyT26F9EHGepu5v40Asp
	 s62lBRYNHxS2/bitMX3tqu/v71lUfj2DRFMWUKdtFKZyoQQy0mhScokr+6d1hWEvdvy/J
	 4S7npahl4Ob9hQoBB45U+wNPG6RVKIx0T6Ij0+HPjrVH1hKQ8aMecZ72NWFNcbgqrUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7EE606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7EE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso2465259a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662620; cv=none;
        d=google.com; s=arc-20260327;
        b=bCdv2aJPxAsbPuXMghxxT3A5YJH/WwPSnlr8dERhNHNAgzHKERprTQcRuI1X1WDZeN
         EeHg9dBDmdG9v+nqbsU4HinISfh+PUZG7QdkYUQFhWtXKfBJ6CIW9f3iGK1lgmXBrcWW
         IREGJeOk4q0q1SvyNCIKYmF59Vvwjk85rS9tjCkKUurWIeUiEeQWkE4TNXNCoarIkfH1
         dGqXFbHM+8/leLueR6StIUwyZZ4V6yMZeMznMwKXmlu/CMHRf3g7atg2qGXYD+/J9gxM
         kszMRDAbY9ZSPmS6UU5Ee9Ld0Tv3NawH6FleLY7Mh7U0wn67vb1+v2IIy1PrAArBLPJO
         GHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        fh=OZljnaMzpOYOmQmrjSUb8n+c8JqhcfxmuU0zWxdAZjo=;
        b=hPVyTP3lbEXJfCahv9/ascPHD7xxdfP07aN9Ch2wt44X1+0iiJ5Y8qXtB4RA32r03X
         I48e7Z7Zw8/RlRJZxgxxWlx9PUOk6RTdfAV1r5THgIMtpKR/+o0Eols+/HGDPr+dIgSS
         vEodYbPXQVGoSDCwxg1WWabULxDb1BZVJZuVsxwD0pk1ah7ib/8RxUaIAi7+l5ZWozak
         IQyyM0F9zQZOl50JBe15YQnHvOUE8kAou2eLdFjEvdH9ZcM7D1+8jFXawd6zeZz6c1H+
         eaJM8zDqkYM5U+DeWoxDpYS9x2fzvU7ra8dTyRiyyj5s5x0riPNO/HvMlzp4dj18lpsw
         klyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662620; x=1795267420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=Y78keFUubWHygKWEUEc6UgYOqe5S9M63jeE5/qIveIYQC81xCdJBju3d1NuDQCLQ9n
         JX98VPtOMlVf/EENKgM1dP58zZik9ySvZySD14sxBOExMOY1du8PLgko3TeffbAHnJQR
         +xI96m855VJsq7cu01UqgtUq3m9cLzNoE4eF4P50nTrsx44uY7mMJj6/WDJKtAE3JQSf
         EuffLEZRjfDTCcYjxHAbAZ2IiYGvD4VFouBRbWNj7i5xZPaW5HUQZ8J839jjP/qBPEu9
         gJ8rvo6Yfj9N47jrdNOca91CK18qybgh1ZIK1O2nP6wCnj7Wf96/D7VwD+KaAQNdMqHo
         UQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662620; x=1795267420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=eoJeF8+tNynH/iOSbbhAfdW/6sdjpW6JY9UuQgilDy+BFlIaWJqpz3ibtlkMD4ks+2
         xfo7xIkgiAN83bG0gta86BWLEukAypJ4AzwbAHIe86MrjrE423JqYeWRcH0DYxnvCImW
         5DnjIZof/WCQqbujjbYtG6teqHMAVaWbWKm6PhBVvxpso5gV6H8RUHps+ySZK1s/bRXD
         uurfOlYJ2mYLAZjCKbPy4yJKJDWTsnM5liacOdbZwzVoVwROjHEhCrj8Fq/Rd6QqukdS
         8J/CD0LTHtA4gFLpUbIWKloPd61W0UEFY2+cYrY4pt/wjPa1yUa6lZkNSFdUw6TTYJvE
         /5OA==
X-Forwarded-Encrypted: i=1; AL+hErEDOxiBMZpvwZG7wEIMHe6UyEcAC/v5wDTch0/hABjeIuCnwTpZF9NtrMKJqq/K54Hv9QOMPRDHgWa7Asg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kFBZR3fht3ZsJptHFBtskkFDVPQGmqzke+kVsEYFMJUhl1WqM
	Bec5RcPQ4h6BkVKaxSwqH0vj+/vARG75/1y2fgQGwMo6gqeIWuc2v4DP6yh6raitKzdkcsSJJjS
	O432GqqaAxhPz7XRE1X+5iMkxrXUNJwM=
X-Gm-Gg: AYBFou3dL7IxgyHQ2tzrDTcriLT3pGtn1zGkk8LFChL56P9EIEzXXPOIsmz4Wvlgzyh
	ay/9oMk/rSVoWh9HauILIwzjhk8VSwhpgP+dpDC1cz4bKUhrJgs6DWJhlw0KH8c+wLBeJuBwRtI
	AaYdM4GmjSOKkRXPHv9xvt0UwOv2YUSYTrtwElE7nQJpd+USZ2F0ar7aregVfG+a0LcjEle+VUM
	e23VRcBRX3eipdEKCFR+mCiOEkAyubjXQIRpn0tnXsmuq2gHoprgWWafKov9/3u5046oCel7mLk
	QHp5sXOJX/hAMWTve0QCZWiaYqkdGzp3setEngnOM9wQWAK8AQtsjQF9S2ReWeYYYzJuhxv8jqt
	cRlReOqYc4IUrnQQ4hrbsXwImXfM6/Ehg5p1z8Q==
X-Received: by 2002:a17:907:8e08:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c50961d1e39mr552099666b.7.1794662620446; Sat, 14 Nov 2026
 05:23:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-3-a.shimko.dev@gmail.com> <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
In-Reply-To: <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:23:29 +0300
X-Gm-Features: AclHuK9xmSYcy3iosLF70NipwjdWhG3wzCm_VjkuxjxD_XFGqVVFRCg6Padg4g0
Message-ID: <CAOPX746ENd5eSAAdhAy6fFdesZ=REU-T+CgcKtwpNJHY0Z9m=w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: phy: dap8211r: add extended register
 write helper
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > + * The caller must hold the MDIO bus lock.
> > + *
> > + * Return: 0 on success, or negative error code
> > + */
> > +static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 =
data)
> > +{
> > +     int ret;
> > +
> > +     phy_lock_mdio_bus(phydev);
>
> How does this not deadlock, if the caller is already holding the MDIO
> bus lock, as commented on above?

The comment is wrong, my bad, all three helpers (read_ext, write_ext,
modify_ext) take the MDIO bus lock internally.
There is the same mistake in the comments of read_ext() and
modify_ext(), so I will fix all three in v2.

Thank you.

Best regards,
artem
