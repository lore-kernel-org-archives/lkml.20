Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C54CDDDF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832084; cv=pass; b=PaNnaPFU9b8Eo2e3CCCJJPFPSEXy7HCsIAa2bBCojcZvmRGAW0/mNIBM7GSIln7pXUvDadbhff2bRdMfy7sQ+p1unanEnWfobuI8D/pSMUWlDmCH52Dp6HEi8vytaRPgJA9kmjLgNuaae1TAKu8Goo1X9q0Glw0ywhUyWoo2HZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832084; c=relaxed/simple;
	bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gihhO6AHIxm0oPVPl/kjK8zwqoUmK9IEklmVok58+92EJazEHQUCELEpbFCYYhlTS8D2OJ89gzBEUXM9/fAf6g0bObo4Fjxu88XxIC0MJJL7lw1mn/Q2/oKkIBaiTR2GBVvFIdHjDCLNnG8+A2gBB6gm/dXTJIytqFFh4o8uRkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hutN58lT; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hutN58lT"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so23042741fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791832080; cv=none;
        d=google.com; s=arc-20260327;
        b=jotGYuvSJ6huhVFK46LaE0c1EEaMJlcnJuhv0MLRLrJp0E5/D2iphj99A+FNOjBB0P
         9vE5cEivOQFB1SeCHRWcXi6TJ3rj6pHh9toW6z7zKUlTBkWlr3mnVz+3iTj8SbQopd2W
         zvX0CBO3waNz9mM073hjMGoW/4ZZnTC8V4qNm7WLuBlWP8vLQYKrxXFdQ8u7uwlhm2FF
         M4jTizhIkE8DvVSMWzajyEqqXAwbw9Y/Zdb0iOmYQ0LyqNIP1DALFPYYpi/gUwlk1fyd
         vsIR/ALC3HXySacqyux2rcXwdT8nLiMIrmFqe4wx67xmhVINtNP5V0MOYJfcC71fWZof
         V+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        fh=ehjscXv+STohFGvvufjGuAaKYkcYGMspAa198jASC1w=;
        b=TPv0e2ej52w4JS4ZuS8zCkorrf8Hr7VcXpsfDLsvCHifSTy9aSvA9AXCE5404zMSRG
         9zb3Cbf1JmRHWBnomWbOQiO6opQTL4MuKhkqCNy/+M+moTm/5CxmvyDONsoibhiXgosa
         gdGB1o3+ssn6I42BZ9o1Yom0jBQ5gXbIGmX/lfnI2YgYHQVcySnutyGh5Aod6BnWmzQS
         L+3QVIx0x3qGpNQEaQy66JKePQy+Z7VoRpIA0mBnWhsf21ss+84atSXEVLfcW68vdbnf
         O8+gTL+vxswJJTx75wrfXuW2q4kAlxlYq9db36lZY+UpK2E8/xZlt4yiluBNyQUzA/HL
         w5+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832080; x=1792436880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        b=hutN58lT0m+SCrzxLEDY1yvGXQ6kGUvY5rSFRFj1EYIkxc30DbIS21BLOt9Ev/o1Zn
         ToHHllGXlK1uMb0seeYH9quN/a7JVYCgpFxMVYrEOfqHZqO4YOvpDB2lkuNvdTVcXLWB
         ibFFdl1hrcFiZxJIJleURYmmNTTRZFvRi+oAEmLJK4BHsF0gL7YmnMEHqry/9L+rxhjl
         iKdlU8qhPmvAFX5s9f1oedVYpMEa/zdRN0WgQJwS5pwHGB7j1b71uMu8R3Ju12nihVRR
         YglNh5khAIEA5b4E0mgCBRUmmrqZS+MbSJv32JmX/2hN2t1EzsG5QI/zwJcUjX1jD+PG
         OyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832080; x=1792436880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        b=ikYy7wjXoaLyU8Wstd3eBZMjBK/MCi00hXIN1q/w79PWNbo9o6Q9oLcsz6RYI8lVwY
         Ngnd+BFQXo8A3AmeyCOU01Weq4w2YVDvEPvyTriO2jbl4zN4r/IfsomcFFdlELO/Yrq7
         hiCmvV+0qM9rYkeLkQvVFjPOihXhP75yqU+dxO3TmJ1CfNXTqmvebXH6YDVz8eTLs2OE
         fsTOdHNp/lXsFroiTRCMSKonX8tr5Hutr5s2r/0XyTrrixyqMOUVBmlAHwenreKo+Qmq
         2BTP5bMb+C1zYKCVWw77pa8zLGBoiSBFaqEmXM1TRs3eLnYJ8W7GNbWISi6hRP2f70el
         /ZVA==
X-Forwarded-Encrypted: i=1; AKwUvBwXT7Cwk+dFlZM1ZuyhLL1QFs+aKYurAg8ttJroLysS/UPGLh8ClMJ1iDIeS34FPoIDuWF7xIMaGVFOM6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8LlJMHNMRj+Ql+98AUPN7ChZUDZwiQU22qGs//Gh/4lYmRByZ
	ZpfU1BdeRovRrtmZTSsxgYTVb9kIBrNvpLbzjjkJ2CljgZWkPVy8WBUV8QCmFq7RShsvlPpmuXQ
	jVfPeAjg24XhZr/hL+MKhdE+5jeqeOVs=
X-Gm-Gg: AYBFou0mGK5S1uJtL6Bm/l1NQzsKadTLK3kt/1xCpN0GQpdyf7IbSh0BuoQqu3ebcnv
	UbdkZXUIphY7ez4XBxLDhHszo12pDI1+tpTQlBn5Wz6n0NTUuXQ5klFCR0DbfyUBoMHALHowb19
	sHwoXB69ftx/Fg3GZFLB4TFiTPPK2xG52ahZ6S4kXHnVfLgF3rdCT9FsGD1Eyw+vnmkCjiUeUHZ
	m3Alie4tzpfIdpshWylwRa96/qIDp2JrIV9v2h1+aYxZgA/Iwl/JURdz7czUPrtNe+CT+6KFuTy
	aCcOehd02/L0kqZjeon9fHW0nHaLwxbm0HvQj/3LdLXLzifkzbzbi68zsm1LQqY8z/7V8mEIRmS
	HtbqYrJy83ml/HWS7LDeUhPhQYnPZ1B2jwgXjM+1ZNAR5TYMMxjIX+9C4fT1+/OGBBV6h5qEZw0
	4s0vpzcxvlf/5YBrV44syrH+W7fsSUwasQZ9FaVsX3p8Hy7chFxd8=
X-Received: by 2002:a2e:be0d:0:b0:3a9:d756:bfed with SMTP id
 38308e7fff4ca-3a9d756c4a4mr13154101fa.10.1791832080463; Mon, 12 Oct 2026
 12:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-1-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:07:23 +0300
X-Gm-Features: AclHuK8iM1Olv3dEWQjQsTVTum34F4zSHmBcCl-HukPLYcMHj5uyNgbV89OICy4
Message-ID: <CAHp75VdvH7T9qLE1e5w2PL+mkNS+ArAC_1E6uQgAE_XvRToiaw@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: media: atomisp: Make pmic_name array const
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Add const to pmic_name[] as advised by checkpatch to ensure the
> pointer itself remains unmodified. The array is read and never
> modified, so this change safe.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
