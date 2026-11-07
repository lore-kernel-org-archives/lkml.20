Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059770;
	b=No86dvnUrGsHtY86myU6ahYY7Sge8X9xhDpZAOSyxC4hyqQh4SZeF4cxl4d1J+h4u5EC
	 akpTzHywQFW0Fd23yrL3cIlC5ZSklhQI0AOWHgphzLmkuIzpDiKWfXBV2OxvTHn80nWWg
	 f1A5a/nbpiEAgav6cKpwp+YrakpwEdnOVEzHz3TM8iSlanOtHSCZrAyax/FQzVKHFDrj1
	 sPL80Q/BZzw7LzJhTQogrI/JQxOOA8QPXC76/n2/ugnN9UdAY3kmfpwBE7VC4dVFlJrFg
	 LlWkYuEs563vg2DMl2paMssknD2d8HrSis+3cBXL6E6NcT+wGlsduA7s5eTdeKCScsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vXwIUjXp77hYc2R/kc6J/JRFYx1vYu9yjBnWkWwz1xo=;
	b=UQxlSNSy5IQXab3KbHlIPce5CRg7BJifG2ns/nZ9IpvhjaIZ2TMrZi+bjwnz0pYm8j8p
	 2Pxy+q5cjygEuhPe9I6vV/PIwyuoR0w1BalVAnhTtch4Yl2DLdReQgCxeEGLG/vhjINzF
	 G/8iL9k4Wtkdlcl64H65ayvCYXkofJYMzlnR5buNshUMO64nVcz39B7hTZ3qLAUp1CZnB
	 BpeNKpuJQ4UyQ0VaOv7bAWG+jvq3Hr7Feh3H8+yow5zXNrJUI0UXRCXs1YwKNC9dF+o1G
	 qHG1zzRlgHzAOuXIYIStQ/bPQENljpckRGnci+LVqhOoA5pQs/0fitx2viX5XRt7mBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QPQYMWy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F257606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F257606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QPQYMWy7
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6798af41644so1254471d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:56:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059769; cv=none;
        d=google.com; s=arc-20260327;
        b=LH6yEaX2YwI/JMfuRevvJkE/6/h3C3cpaDslJN9o4vIEMiQUuj2C2CDYaMkgKb6B+P
         1d6wz/rXUdstdNJjlPGnqINskU73Dmc4IgB7UKFL8LRC1YJOfcwaUFoVI7wVcBUPJhq6
         AoS51sZXVKhvnKgVIs9kLc02NcMJ3YwiM9dmFNqAsWNsh+zoAR5UcEm2HSjcUouvbuZa
         SQOrQdMxA9ZKYQSegTzM0IY7Ibv/FGIrJjFt+PnE1RObdLWhCCZ8nBtnpM0mfwaQu0IH
         u+mJWfJ2+etqg6baw3st8RIbB09zRkToKXQFITQp083WhiyGFG+J+DmPmJVnEuDSFjFB
         e6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXwIUjXp77hYc2R/kc6J/JRFYx1vYu9yjBnWkWwz1xo=;
        fh=uFiMs6PRbFlWpUIFK1AzgWyFBAdNyVMESefraA7HmKs=;
        b=sXmz+mQTxmJrAIM2LRo5MGgz5DmZkbJZkPpNmGLSzwcxeo0lMsaF09blAJRFlzTFpR
         melyIrSDcYBXKAdmqNIOIAEbk+xGA/YhRcPgpRVDx3SMIc6YN7uilLe2I1MQA1iLqN2T
         Wx6RFHsm2lJzfgx9EeLv8nYo+VBP3X3H+p6VLjXTMchjVff5x2xeTojhAxnybDasn8Ug
         +hTNcBAaPglTKMR1zVn7Zlt9Bm3C4VhQ//hfylc2F6y0gbU20OQIjU7hcpadeo3v9PtO
         Ez+vB2bRPap3eB3o3mCJcs2Hpll9bBI5lLtIQEwBk0/WNNdm8ZXGsBwUXtUaDCqt4U0p
         e+0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059769; x=1794664569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vXwIUjXp77hYc2R/kc6J/JRFYx1vYu9yjBnWkWwz1xo=;
        b=QPQYMWy72eNto4tQUnulLnMpxOQQX/+irw8cRocDOhl9IH9rYeIx/4gvYRebRtiWGA
         am8rG7QGBYIl8M+fFafPUSfBe847J4JVotpdxuzP7k5CTx8Ckt8NQyqFZVDHGtIpcglC
         Vx45lLt6uPvcvYGKX4UTuRNlKxAaKfWsvWeZqliydSHa4eKNP8mYJY1UsTO+hRy48+BE
         GQ/SBw++WEXgNykb8D9QbUxKn1wKQXac1b6c9g4+xbB0gWWFmsrWObgMQfrSsM3tx4L/
         5vz0HzqgZROT4/9FxvrUIuOkQelqER9GbwrLUzpa+J2vEFWu0zTB96J75JXz3r9SdApq
         m/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059769; x=1794664569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXwIUjXp77hYc2R/kc6J/JRFYx1vYu9yjBnWkWwz1xo=;
        b=YuNol9/GLIF8Q77PGmB9JuFiYClthlR3hi9bZ0hPqjx4ObMUa1fAVORd6pZYnJYCx+
         lKhA+p4D0po4bSIL6w5o+AkIFXXHPMbuHWt+ln7GmYoWMrGStx5dm/NtkwfK38cykfEx
         8ltdxk6zigUUaAHTTcDiUotgA2wKGYG6M8rgWmqU9t4sKmYoEEDJZEWEOFfkriqlshPy
         EGlhR6YcJsflTU3yZtxF8e656L/JXe9ksZjIyxylyb2fWSYpQRChmcr5lSh3XRJeLAwx
         TTpatqCrxkkJBZa7aEfYUM18EOvRp3HJtl1E08vBpcoac7m/Mw2f3z4T2VrVwwalT0lS
         BqGw==
X-Forwarded-Encrypted: i=1; AL+hErHT7mRcO/dDT8QDSV48YhQCpjot/NVIDZ4gW/GLyH+9DdYMkkjgjWUYH2Y14R9Praq/YW4Vjt+7xHsHYv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mll38YhxIR0cMgUQeHQI74g0LzH9kEw3EmEZ45dEXlzdzhICA
	3DYMFzxdtWgJqFVRvunQftyvdDvGXalMP3hvo8VpM5L3cArJUgqr4t4vEezR5hPccngDG3Vneco
	gWXVC6Sv1CamH4+z/zBOce07hYoOeEDg=
X-Gm-Gg: AYBFou2mn+TBW0CnftVBcuctkBWmwYreeE432sM8btPC5Ckw+HLOJzY5f+nYFPMV/Mk
	4Jn5Xtkm7PxT1ssNVQ1kIyEFTIxUcuTNv1RmClSwnpFUTLIZK6yqOcYlgPOemwKMZwY086wg6La
	TTaLDvVotCtf2XQimmdevIcE3x4TNykcXWd+4MzwaGq3XtvO0ijFnomq6k+FVXa+SJOdpYoUSEg
	ms47m2zZbzWUpKxnUAD0K/2FW5ZnjUJtkwHryCJOidQg9pdkoq4m9+LulaS4+mL0jZtpoT9F/9U
	JXkJdmornXuMAiwLsc8UbbOuX4CzBaNqHs+XEyO9ZvrV0GqAdzN6Gn36SgGgNDAayDWsyqnfw6u
	+r6DBDn3IRng/I70KjC43TLwuY8C4f5AnF0yqB/Vos24q5ztOp/FsK2clELpTDV60sadOtGX315
	LTzIsMOR/VftoaabGTClxOWO6mhPpW457/gkxy+CM6oRCnKziT/3AmDKOyVJ1iYjr5ydfDeATBn
	rEjAewtjvfb+OxMgDQ+4LaDA9MnWUa02q2yp6poS6Lt0iaPJx1GbBRGfhxv6Q==
X-Received: by 2002:a05:690e:4144:b0:67c:1d44:7887 with SMTP id
 956f58d0204a3-67c1d4484eamr2616415d50.13.1794059769189; Sat, 07 Nov 2026
 05:56:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107210058841pJqeakmrIVxw9Uu1aqCHK@zte.com.cn>
In-Reply-To: <20261107210058841pJqeakmrIVxw9Uu1aqCHK@zte.com.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 15:55:32 +0200
X-Gm-Features: AclHuK-iIbre76arm7YsKKgk9O4j5Q4N4M52GRLIKhagF0WUvCqb_aZvfwDucCA
Message-ID: <CAHp75Vcv03fUWx1ebtZtGsURL6s7DvnKPq4K_Zr=DT6OTjc=PQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: lpat: Avoid division by zero on degenerate LPAT tables
To: shao.mingyin@zte.com.cn
Cc: rafael@kernel.org, linux-acpi@vger.kernel.org, lenb@kernel.org, 
	andy@kernel.org, westeri@kernel.org, srinivas.pandruvada@linux.intel.com, 
	rui.zhang@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 3:01=E2=80=AFPM <shao.mingyin@zte.com.cn> wrote:
>
> acpi_lpat_raw_to_temp() and acpi_lpat_temp_to_raw() linearly interpolate
> between consecutive LPAT table entries by dividing the difference of the
> other coordinate by delta_raw or delta_temp.  The table is provided by
> the firmware through the LPAT control method and
> acpi_lpat_get_conversion_table() only checks the package shape and the
> element types, so nothing guarantees that two adjacent entries have
> distinct raw (or temperature) values.
>
> If the queried value lies between two consecutive entries that share the
> same raw value, delta_raw is zero and acpi_lpat_raw_to_temp() traps with
> a #DE exception and oopses the kernel.  The same happens in
> acpi_lpat_temp_to_raw() when two adjacent entries share the same
> temperature.  Callers such as int340x thermal zones and the Intel PMIC
> opregion handlers pass firmware-controlled values straight into these
> functions, so a malformed LPAT object is enough to trigger the trap.
>
> Return the endpoint value instead of dividing when the delta is zero.  In
> that case the query value necessarily equals the shared endpoint, so the
> other coordinate of that entry is the natural fallback and no interpolati=
on
> is possible.

> Fixes: c55d62820efe ("ACPI / LPAT: Common table processing functions")

I'm not objecting to the code, but this is not a fix, it's hardening
for sure, otherwise your expectation is that we have such a table IRL.
If so, this commit message should have a pointer.

--=20
With Best Regards,
Andy Shevchenko
