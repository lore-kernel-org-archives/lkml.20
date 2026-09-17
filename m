Received: from mail-ej2-f29.google.com (mail-ej2-f29.google.com [74.125.228.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A483EA955
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669136; cv=pass; b=FBvHr/UxgDqaEtvaRpEXcurHpF1Nf8z1JxLi1Rcl1TKZgAS5H4m8YU8X5/3171UezWdwQU+kDQQE0a1nUfkhAiqklNJKO3UW8i7SjoklNZPn4//emogdKeLwcbUQePwQUaQCwKkADOTLX4yZPBPDdLYxzAZbtOojbDgIH4AxKHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669136; c=relaxed/simple;
	bh=TOT1meVSqfblGDrdqsFf6MzcvOlETVrJmJLU2ZhnqmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmIkr/pdqbM2XjMiFYCgRi5ffYXmxg6ey171iiDJluZFiUzZZN7uXOFi+IgSW1gyaKMgp2eDdu/ZbAOQeib3mBQbrpZipEw8MAZJ1nqL0eKKnGWVkVx94OBLPc919rDEPJ3Om1grh2WFNEnQa/ARbLo3G2NEOfnLI/5WXXqzN+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eymp/YJL; arc=pass smtp.client-ip=74.125.228.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eymp/YJL"
Received: by mail-ej2-f29.google.com with SMTP id a640c23a62f3a-c294496989aso184427966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669133; cv=none;
        d=google.com; s=arc-20260327;
        b=TkOzpuARYH+4i9ujUfBNl2J/5nPLCSfElAXQLJkI2mk4b3V6hIL5G3J5Dpoh8U5b5S
         D+TH3puOMIW7hVJmubqROuUMyaGbyfF/mtR2A4e9H8PhzhS/Q6IZ4jfukFIxBeINR8A5
         P1cxt8m2f6vWNIPBokvBCG7d0x9fB3/Sukq9qjyJCVJw2EWrq0umQgBBjev37aG5ke9P
         ztmhc7CW2lfKHRUVrYoJjZ1Nc0qbpVRmWDcbOA4xdWq/kY8sEWzcwFuhuDRc73pJGz0P
         udyLCFtbiWNBs61WMcu7UpK5FZ9JLV3tl/k0z0em6kZn1ANYQ2gAzaYH3cQCoSPDAdLZ
         OPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l20clSa/FKU397EhPwh18Xmkk9Ag+DiAxpnayaLKjKc=;
        fh=1D8lE1lrmt6IVAptJApeFD5nHHEkAfkFt0IpcQc0KqQ=;
        b=Ki6fxX/gdD5WXOvWphL3xaQci+0nrDVsN03EqwL7aVrD49CyHwEfCp1+2RS7gnAoKQ
         heLNU0+JYdUe/Gu0xCWGSs6pUDS3Lwmju6T/R7uhkBanypBuq9G7TyH/YI8EO1L7aKMf
         RXSx5W47m8/KxdVGftAsE26w7sZByKoMDr2EFAy3VaFM+Md6ZIqyWfjH67e77sZS2kfO
         72dDlpYCOKGIWX/VkuxOiFwDvckb7H5eoW34YqZ/qvqsnbGufKk/p2+Cy8rYUgm/pLy1
         suy1QoH8UrpGLn6YdsWjvwj2jPMqY+ud5VRaZ4YZl9CfEsqiGp/lvGIJyxGM8rEbdZim
         Np7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669133; x=1790273933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l20clSa/FKU397EhPwh18Xmkk9Ag+DiAxpnayaLKjKc=;
        b=Eymp/YJL/5kDsNlGBeFZP+xB5GX/1wPjs4PMA0frT41jOFom5zx9NrfOIT2Y4jPDdQ
         dG7FdmVQZAGHZh/B2LyloFJqjteQwQMZm7ez3e2ssKYbZ2r6Ks0ZZ6PtLTnPw+g5fhHk
         xJBCtENVDWYTLdNV/2eYGMqkjiAJISvYEgssbo/Eg/hyVL71ciRgh9bdtjkOWTV/TPw3
         07+kmmso/ujJRT3iO44sXIR06oyxCPiF96tZ7Xo6fQz6i/JMdmjGm8qYjjWsc4oWrclI
         G+GHwd58UUe55bRXjhevXnYXsQ0L88rFt3YXnKLmT0BMFdJQBofSjjMcftNfQlhb+ckg
         ULrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669133; x=1790273933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l20clSa/FKU397EhPwh18Xmkk9Ag+DiAxpnayaLKjKc=;
        b=ryQQPv/NFk7UmLJSQBX0TxuYCiIa5sTUoWX5Qgyna3Z9hD0kB/aMV4WBAJMK1ijFbP
         sXwVo+Tnb3AmpLr7cc2MrSPL69QueJRJlS7/Sx+/yZtE3VoppbfdPX1YQaRx0dwpKFv3
         YEtrQYwQn3qfjVnE0G+5SpDyGc8KudjYpMCf+EJPI12TuBE1Wim0qDeRElQ0Z9RAHLEF
         reSQFLtlq0O4Lpx8CdUeTLnRRp/y3wwxf+WIxpHu1sqYy42xGKETeJ0EvUMp5N5lAAyQ
         4ZcZPt8YI9YQJrv4rt2KCx6L4Vvvh/IAv4pM6lzpu0Wax0KLIw0QPCyLNgurN2cQK6aP
         RoIw==
X-Forwarded-Encrypted: i=1; AKwUvByboGnmdPVXQLjaWYmhoVAsMKbYGawesoYdLEPRbKNk/cGKDRHsGrBaeehw8HjeY+e1iQR0ZdIlOVGJBQI=@vger.kernel.org
X-Gm-Message-State: AFuF++mY41s/XUxNiAXe4Cpa3ysC6MuW2LV23UtC3OHp3t24lzcGo7jX
	ITxJuDGwDiTvCH3xmCQf8l9eILwaxWBDTMFXTz+9CmPEa1dpeqJbh6JjrohkLM5bjK7UCr9/Ans
	5VHVxfW7mbDVYD38XygRySutPjgdZGw==
X-Gm-Gg: AYBFou0pFTNyt2ZxvpFRr4sfgy3AZezn9wMmnKq38LFPRdTZIDIggnglxgCZWrcTzd+
	e5QFhZ61u0/OTIgxf8+3PcS+aD1aP0JxZ/VNgXZvMkRm1i6gR5mQivYULlUB+JG5EViB2F/FCh3
	x/81o8gDHA3vFKgKN/GMiMVL5ZxVhF8oQa0tP8tr3M8+/aXSLO+psvUb0KmVsyWOSPTYeGJUKZU
	iqU1aVK1hIN/x7c6x/UROnFEix8iyoBy3MfbBp1WSFPlWOyvjNT23leP6/45qxwrQagqpO2t47h
	oC17pur8kXn5llGFUj7I+INGZvvoWqnmR+wTSkRtyc4D4A6sXv3JHeu1tn8ZqFK6Q+4MIftUeOh
	SevLiUHynbrC+f5NnQt5M5C7zByvMz9BIH0GtBEFyAr3k95T8LfXD2TSAuR+aWKQpYVDM
X-Received: by 2002:a17:907:1ca4:b0:c28:599b:7782 with SMTP id
 a640c23a62f3a-c2a15b11ac5mr1428866b.21.1789669133187; Thu, 17 Sep 2026
 11:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913212500.60272-1-mhun512@gmail.com> <SJ1PR11MB6083885F54ECDC88B894EEDAFCBB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260915005334.GEaqiXDqDGVsYE_NXp@fat_crate.local>
In-Reply-To: <20260915005334.GEaqiXDqDGVsYE_NXp@fat_crate.local>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:18:39 -0400
X-Gm-Features: AcwNN1VlayQ9ktzuVqf3oQSFFUBVBchkxRwlj1BULSIKdsZ4RrkQ3EahK_ExkJM
Message-ID: <CAGEsz8EZhS_5sBDXo0KgmMAXh4JKaa2yjUg=rhL2KMkQddSvmw@mail.gmail.com>
Subject: Re: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Jason Baron <jbaron@akamai.com>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Tony and Boris, for applying the patch and fixing the tag.
I'll use "Assisted-by: LLM" in future submissions.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:53, B=
orislav Petkov <bp@alien8.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 14, 2026 at 04:51:07PM +0000, Luck, Tony wrote:
> > > Assisted-by: OpenAI:GPT-5.6
> >
> > I added "LLM" to this tag based on current guidance in Documentation/pr=
ocess/coding-assistants.rst
>
> Nah, it needs to be only LLM:
>
> "Assisted-by: LLM"
>
> because
>
> commit 816d9992d9ed434ec52cfbd63080d518e535a41b
> Author: Christian Brauner <brauner@kernel.org>
> Date:   Wed Jul 1 17:54:48 2026 +0200
>
>     coding-assistants: simplify attribution
>
>     The requirement to identify specific models used in the Assisted-by t=
ag
>     provides free advertising to proprietary software companies while add=
ing
>     little or no useful information.  Change the requirement to simply:
>
>       Assisted-by: LLM
>
>     to capture the fact that an LLM was used without tracking which one.
>
> Lemme fix it up.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
