Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4936E2F8EA5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788679948; cv=pass; b=X7cMd3ggyvnK/2b6mRHiMQivR4oTmJq42TkKBMHqDZjAhoQbwBGqfupHnbnlMXMbS78nV50cpfdFQHebJ5FPZ3XxtxpbBUZdvpmxnwA1USCrDmkIdpbfKIp1CH2MvB3+Wj5CxNSn3piT+keqS4nsOslCe4U38F/8aietD7HTjdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788679948; c=relaxed/simple;
	bh=38xxFyuvZIF+Mcb0oDEHyyIdM03D64/gUGg0xDZ+DkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgJurYVsuseGMVWjNdRAYqfIhpaVHcd0mPRqEImqEVloEDB4dsA97PdQQ4FcPaOMkcO5HcOB64wydktR2gpQIkxZJnYzzmVaakPownuiMLkHwgZ56j/j5Nrlh85P//poBdDom4IY3UWpILT3dIqtfx7dwJIfp/+ndxHKa9XWTdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZorRkd5m; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZorRkd5m"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c250f28f1cdso381553466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788679945; cv=none;
        d=google.com; s=arc-20260327;
        b=QIrIwwZzFNC6Uhm4UcTWXECiP0LNj7uXpS2PEyguHaz9+GB0cS1CmLYA+7jQMyy7An
         /REV0RF1G6pbQBNoWcEkVN1fHDSSHhh+4kIFFk9ZlgT1la9pBwKsdgSZ4/5ikr3K6qM/
         QAsngkxxdw3DvLw2qRMRTWz9tHCs1NdSNYnx68AQfMpx4AzP3jEq8i0XwMxErOGlVr+4
         BebAoQp5AKA0dtY06hzj5I4v5/U4QSlVmqi4Z/V0sf2p7pZ4Jfd7Iaox46BjPwcI+nsW
         5ro/zGITGErE3Ku3mj85lc7G/b2Nt+Xp/iWUGyyiWzTMIr1n/5XGk4zBkeCM/cB9TGax
         oWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        fh=yWH5x2nIMxbcq7aZaVFjoVPPBsoJ8+dKCQmv7vBAW8E=;
        b=bdXfc+QevzdLB4Q5vDetRlnV0JWL0bvFEegxbr3inZF5xxJ2I+lHJmbGbX1q5NHw5T
         eauLbNsijq1g48Bk35PC3ttsCnFYZm+BQ4oR8YP9oj8TGYNELqJ/IJU1n75CtrsEWyLm
         fQQBd27jJM0CrSwlfE8MJQXlF1lj+AtrMvwGxPzjmqtAU2nFOpSbCBmcMRAuIt/2UxSL
         BNAbQSgZde7Bmrz05AZ6aXpSKNXGs1ps6gU10AGpGWBlH1Gbhwk2addIxrawcjzBWWGQ
         ZwxKNjHk9P+lqnFhli6VgTPcn5Gj5kqIzD5oOnSqtBNy0iPKtk0wPlT1ZfWzP2u8qrWa
         CEuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788679945; x=1789284745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        b=ZorRkd5mEmFhkouKQ7TPbC/pdIw+Sxqwd5l1lXfuRXFbipBs7HUYAMo+kWYda/lBvg
         Y0zZkuweKaYWjna36kiQ8DLVgL7VEeyGkmt/Z6E0Wapj5lPD3M4ZPVSrFOS7oTVGwZyi
         zPN4oHaKSVXuE5rftUCYDEzBwhxPKj5qOGfn/G9qs9kO9CGESU1AmcKxVvEhpvfF/uIQ
         avMpFEaQx/ILUTnhYFd233/fTWh7s8kMuPlovKlfGpitOfUkG3ZIyUKOnOLoM62oB4Ta
         kfxfMqjJtYAl0L2MN4nUMO1KMtJRPs2dLk1I4OMIUSfJVdU7d4igmtR6j012FOQWbfe3
         GZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788679945; x=1789284745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKgOc2l+vVuFNJXwxuWo3OsxtXY42+muaiQdmV0l+QI=;
        b=CCcvipt1CWansunpWq3Yf7v5Ox2qIPr4OyOzq8J4+qkYb1p4wOYcvGxmJyct5Dg/sG
         dwSVyIIT3vkIZL8koKw76+vehAQGPZh293iHzKrqfmEBUk9C2TqqkSMxXTWQW/3ptD8J
         URiP775kpJerNwENF1L+b2u+PlYxnNc44Nt1oo/25kAyJbqJSXvdzg2be5Up2Vti9BnY
         bopFdKCBJJnUbYGSTTjxuNhqIh9BJs8ZCiG1MG1zwy2Nh9W/RINC4ikLa+KoOXeJkVNp
         pDQAO4HjFdL6FS1sw5veqrpzK9djqamNLPRngthRVEY3JrR5UfRXw4zrmPyC4PlQUf+H
         QxyA==
X-Forwarded-Encrypted: i=1; AKwUvBzhoyxD1py6SISTWYaX4uto3sOh+608cmSzy2/05ppAKtqw7Bbg7fkpLTyVbfXFCfTpNR8WH7pBMge+41A=@vger.kernel.org
X-Gm-Message-State: AFuF++m8JPi2YrMixsmTK1b7y6VdFvVmoPlL4KeUJi3XdYuPbtE3/Tx2
	1zv4XqlwYPRxTOclUdJy0hvc9cq+6Hf9d5/KMNTzK+6pad1M4shFBvWMUShkXEOHO4dBlobeDKb
	WXuR2y3bd68GI/NcnDgVlGyIkCU8jBho=
X-Gm-Gg: AYBFou1gsq5ya8Ew6rtauMBytLAAVb8YFr4tWrS7TzEpqqHbcoYF2lI0fErzWHUVIiG
	3D3O7VoQYNMMNK5eh0Yqr0y5VRp1Cm2XGOppe5m4rYbQmleBpxKyWKwgdKmU15jgZmOCqsAYw4v
	Ba+zt73+TfYZ6ldvCNBmREg5oCaE3qUbCQTL5aT9pw+whvu12DOxYg7TtS3zG8MUrP4BzgYSjU1
	8114AtVqpOV+yfBa91bwnHIZlxy6KJWH4YhVdyZLJzIxr4Mp8a2uvI45rUkK284PjUHKM1fXbqw
	Aq+Bkg2r2UK58QaiVnhlAHzDLO6D3OP31xAnJJfVC2Ii3jPJOTX65lkoDiMgAz4cFdK/UQyw4WY
	4Np0UeYf+1xpkjj/5esPgOnO14YSWK+XKkKLIQYgWu6+8gC+IA5F23Gm9tm/g7xJATkMgsxuxof
	pcKPM7UlhWx3ZmrBK4YZkWYMZR7J18ZA==
X-Received: by 2002:a17:907:c28:b0:c26:19de:9acf with SMTP id
 a640c23a62f3a-c2619dea6efmr444606966b.39.1788679945279; Sun, 06 Sep 2026
 00:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906004958.26041-1-lalitshankarch@gmail.com>
In-Reply-To: <20260906004958.26041-1-lalitshankarch@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 6 Sep 2026 10:31:48 +0300
X-Gm-Features: AcwNN1WzAwLmobc8VQofp4aTL04X2XACY-eMvYBwNFs_k975zra_jqGeD3A71Bk
Message-ID: <CAHp75VcRYL4idPvU3tC1nPO+HbRAoO63SXh_oqATShLZsommiA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Use C99 initializers for ACPI IDs
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:53=E2=80=AFAM Lalit Shankar Chowdhury
<lalitshankarch@gmail.com> wrote:
>
> Use designated initializers for the ACPI ID tables.

...

>  static const struct acpi_device_id gc2235_acpi_match[] =3D {
> -       { "INT33F8" },
> -       {},
> +       { .id =3D "INT33F8" },
> +       { },

Follow the agreed style for the terminator entry. See Uwe's patches as
an example.

>  };

...

>  static const struct acpi_device_id ov2722_acpi_match[] =3D {
> -       { "INT33FB" },
> -       {},
> +       { .id =3D "INT33FB" },
> +       { },

Ditto.

>  };

--=20
With Best Regards,
Andy Shevchenko
