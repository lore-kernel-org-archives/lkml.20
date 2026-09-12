Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33FB202F71
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217041; cv=pass; b=RbuxJYKas5TfkTNIABEVSCUQ6t0ws1lwRogSk86sXXFN9aYacOx8KVySCmQQHAJSzVkWvOpxg4a2nUsqIVhCsIo7WD7J9AQ6SGvRcNsIoIWfhyB/Kb6tQKfJEp7Zkh2SFDf65NHanF7joP9r0gsvAFtETYBaSwFPha0yqsZH2lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217041; c=relaxed/simple;
	bh=QXsVuVkPzMKH+I5YkN2qjShs4J2XXpG8B8OCmd8V0is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geE7bGNxaLTBwAIrRQfqtLmVG0aTwEwmD6os4Y6XLG/tqMgZdux9/cBeFE/lEU9O7D5Hp7uFcddNBXXD2HhwgemX5bIxUtNuOYtEeS7xNUiZwhHhp7pUyW/ChxVQfFXU1+U8kzYMxWzr76NpnnVcD5l6/R2po38B2u/2RycDkU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJdqE8fj; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJdqE8fj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so119545966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789217038; cv=none;
        d=google.com; s=arc-20260327;
        b=I7lg4clqNPjj3dHH/Tua8tLYjVdmNtWNQNQD3TDATx/jDNEy9O3sg9Va3ZaIyvLh+r
         DrHgqdbiifkYKbkxe3lRSMF4Op/Eq9GLX8qQ/A5yDu1jvdKJXBdOAvvPSPBYxviUamuP
         1Rwozslw2JvbTFKRI+5BRn/TGB6rF7i9fMEZFQ9sEHV66abwQWjdZef9kKU9u+mRp5Nj
         jLAMmrgEZ67q0Q38UIMHg1/DKZf4NCwrGtZC3n0OPoGg2r1VUUQGERrCV92QOPgGMmtm
         G9kFFydXU2Vb2SHO8V8nTwXD9OnLCebihj0fHPdpFBsiYgYBg+jasKqBRWOCfkbNI9Xe
         +1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TcOTsszcSOMIWXzyK8gIUe4Zda3Ax6ifkDqKWguPPDU=;
        fh=Pm0f6ePfxUothqgr+osIPb9wSxZfrLqtlQnNsdmLizA=;
        b=Rp1Sf1NVWpvuRBgT0PxXtTiUDVHdGoL4YNtGjBIKRKAyZc6JZv54KQAfBx6K41irLK
         P2+GSIhSb5J/2k3IE+xstOy7HG+61bY8sLq7/8Jvx0f8jPSYBCkYBirVDCmGQe4qiBVp
         9tjV3hR4mKfdvpEsVzAxRTDTNsZ298XieKJNPQTcxF6zg69cO2vJQoWzS+PRPgNm7y3w
         awIdru9U3Ly4/UlOWK4iFaj5kewm3Dy3LU8Wsq2KoktNJ1H+P8Ib9EV3SKeNmeaA3Cit
         UqQYhrQWRET0wMSJY7CCCTScNYAQSSVYkiTENzWEW9BtMqaA7ds0cnn9iVGrcWc+x6zA
         OmSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789217038; x=1789821838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TcOTsszcSOMIWXzyK8gIUe4Zda3Ax6ifkDqKWguPPDU=;
        b=OJdqE8fjdMhQeEy9faLKuXMoxzhJcGtQRPbVAiWJI9jSKRJt9pdvwep15rADeuvJeM
         D8Rtc2c3xq0xQRautThSA25jtl5mgTdy2u6PWvmmXNWgvQSvdUp0yHhzAlF4mNSaxxvc
         GZ3cAfJNVzrtf/ly1B2/21S5+elx3WYamjxqKdNYsNZubs7R7X/AcXA6wxhJHHcW7pB0
         fXPpAb1urLcTzrMOLSfbqdbPLDntpZIc+vI9hvzflVfsJsy6B7RpoS3QqYWyaYNMoKgm
         HX3HpR8sUFDtOj2i5hB65K/khLBhDp8zVkoR8i469QbLSj/o/0NTLFOsoH/1AYput9pi
         I/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217038; x=1789821838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcOTsszcSOMIWXzyK8gIUe4Zda3Ax6ifkDqKWguPPDU=;
        b=N1vbT9bWx4Ho3nqqWD2y7qWPVJcBc1M4n7WOLe1vzi4zBWFcT9CyLRXIJaZ6Hat48K
         kBwbWmg1vE3uSimGNhiepTNLNIxzNWZ/keXnd1GJfDLj2V1cbOJuwTs4PorXWOOAmBjY
         /cvL0biPtVq7fDnhsXutkccWnBwc+SiD9TLn01uPHWOFQ78YlPJ5d2BfLZvRymZ6uXI4
         V93X/WAYy2yxuJkQOM+vuw/BqwA5/ioJ1Ko0IzZRonNuo3vlFwB52BCoypoJAPSjBQpO
         tGG1in3+8xntk0t6aRps0FXkyBbYMUItivvV7wd9exXAX99pf1aHTY3uefCYk4d8LSDK
         mmeA==
X-Forwarded-Encrypted: i=1; AKwUvBxDwl0kp75T7BVlUfvgMyziykYREzfXsaxNrDAhQdM5cNEAbFdmNJ8xbcxZDsGuM7Gho5b5lChm3NcEKGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kID9RopUSSPOFVe8Llk9fCsfeXC4wgtqxRKcBIbycvZAM2FmRc
	X9Q3ixkuTElH4F+/+QxzzxtW2RCjtRFILEoKgiOLcSnTYbuNkISpPvCd3F1mC/Pm7W6IQ97/Fnd
	b1mm/vEiHBw+cg3duKdINRlQHc9L8gdw=
X-Gm-Gg: AYBFou2pVYso+FnWQLB6XAUitXnC+sr8YD7QzzgK4ZNxy0FgLSAsyR9gY/99dmkyYxM
	jVp9O9PRJiVtgq8Z7I5TPhRGp1uYkFqOVki0XdLnZ2vDthO4c3Ik5mJ2lmVohC6J1U+FqkSJif8
	p9f4Fv+99Y6DqKBrh7vDOArS4ix8OJ8d7jUB4jwSUJOfUaqwcVrUB7tUgYxMYlRhfgVd3Yz/y0Y
	wipebAF/w8e4fnn2Vx2jiimOFmtuQfk1X9oY6JX92InjceB5HULJlczPlfpQoa6GO9HYIcePpth
	oaoFgbPIaQR1Dsyc3Xy4YsFvJ7OjKjxt1lP51pPDA2WGlqftj645G+OBKUcN3SBqkyidFUYoZTg
	jyvzqCpJWqkE3gXfZvqB4XeAN5kQv1A3/l9rkTZn8/pskRWCNu28L/pk/EdZysqxn9SdlwUD+/Z
	dgEQI0B7+Vb1N8SVihKbkdVxmmYawKVqwpqmpuN0NG
X-Received: by 2002:a17:907:c14:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c2966514d2amr454872766b.8.1789217038165; Sat, 12 Sep 2026
 05:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912072718.50636-1-kmehltretter@gmail.com>
In-Reply-To: <20260912072718.50636-1-kmehltretter@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Sep 2026 15:43:22 +0300
X-Gm-Features: AcwNN1Xf8Q8vxBRZZKbYPDvge6p9E3QdV_MIMKTQ-L4mdjbEqTQv9VZr3tMnLsw
Message-ID: <CAHp75VdPKE-cLHi_SAUQofomwpo-CpebknvhUJ5WoUgVfjG9Tw@mail.gmail.com>
Subject: Re: [PATCH] media: v4l: cci: Fix devm_cci_regmap_init_i2c()
 kernel-doc return value
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 10:27=E2=80=AFAM Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>
> devm_cci_regmap_init_i2c() returns a struct regmap pointer (or an
> ERR_PTR() from devm_regmap_init_i2c()), but its kernel-doc says "%0 on
> success", which was never true. Describe the pointer.

...

>   * Note the memory for the created regmap is devm() managed, tied to the=
 client.
>   *
> - * Return: %0 on success or a negative error code on failure.
> + * Return: the regmap on success or an ERR_PTR() on failure.
>   */

What about

 * Return: An error pointer on failure or a valid pointer
 * to a struct regmap. The regmap will be automatically freed by the
 * device management code.
 */

?

The part of the proposed text is taken from other v4l2 header files.

--
With Best Regards,
Andy Shevchenko
