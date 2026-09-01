Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23C39B4A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256227; cv=pass; b=TcQDsOHGLRjhL4eIKO4bBx0nBYH48nuMgefUUd7ooLvZDi66E6i5BbHzdqrnSgtRgdSC7+/v47SrWcKEJQpwpkHx9xmNNx6p+IfmfScJG5v/48PWX9GMn0P4o2llBMupBxGypouvsaZYvcaYBkVkiRtsYxMxdiQtWFww+1WWvzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256227; c=relaxed/simple;
	bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuI6FcD6QPum7HX6tZzwQdZkbMHjRmeTTJy+AnMBsW+e/yblBVNoOekWpfEPY0aSKQJX10Dz2DIWNiZUfw5MBSivAHuPShDJNDcK861G9cmDKz0Lzcnr59uARTQEvBhnE+f8KD6FbnMB3VADpzCWaYlgrWZHTzX2g9RfHXDYtco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCO0uy8d; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCO0uy8d"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8588583a7c3so8121577b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788256225; cv=none;
        d=google.com; s=arc-20260327;
        b=qW0ii0nxEQGANUk0CCqkcAK4xImOzEWQl24ZefNSjZwTlGfzXSDCW8lOdw/qRZNmzf
         SPkNnwTHJAa18juH54MCZjnI11NCrnUUvHI91NPz3wF5XE47zqovu1sSvpCWTF8NQikS
         NIxUub1SGuuY3zuTGo0tpHvXnNTL4nG431DTuWmbeInk3yonWfn3GyuMRbBV4RBQwYcO
         sbQG0SDh8uGI48MKAWqQqKCg/enCLNWGSQ8vhcSATyVAOdviV+gIP7iEfl8TkF+uiZf0
         RNeTYjyBX7gT2vXQqPqI/ULPSF7eRSnljUP5KKfFTvKrbtwriTBQA61j8k6/5KUFKVgV
         Qovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
        fh=o1faLZWn2M1xg+im6D4iQ0C0MaPZVIfb1sDTnRNtTBE=;
        b=CyJdYLd216zkItFKCRu4lYKAbZkDkR9yVDcJ9BStELH64+K2/0L++m979OgTt6nq1W
         fuAmtg2RXQXBGBg2zbT4oCXh7P5DraD4Rp2dmXhWLd8YBSN0hzqfxBWjBlDVPQpdpAgo
         90DgrBja5ghqr/zT2cEdzTBbrnNmE8fbmKH8k+Sp5SL7JgLUzh/sDuwRRbFRNO9bGSRy
         IkXBYkmBIQmfwe5rwJl1JJ+iAjUb5fSfa43AV4rKgVOt/6M1E0xp5e1AD4m6EEEyykUh
         fsdAHsImfKn0F5rAyLEE+RajDKftagilrkpRkDAanIa6uo2T2xI0SAnygwzehA5UbIVU
         IzGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256225; x=1788861025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
        b=QCO0uy8dBA3WaR0ZWi1yB/gk8l9ZbWC3mz2CFsWJ/CxrTmgfUPCwZ7XA0gTjWyBjvk
         2CYbS6ZmC8b+Ba+8owXRGxHFFfP06LHNGxmtlvttPDB5Rlvrextb5VFAsKLoyO/y9EQN
         KMgk7ZnOLA3weKAeJl7lTU4ZIw35JJ7mNSHtQ/wrNaLoeGvrwf2F7aeVDA84AFfgSIAk
         HQQfdLsomAt0ITrXMAlaYm+pNk2IlxZ5t33+AClAgt83FN8rz4nYV0blRgQ+eJWe62eT
         3258X5wK99lJ3No2+kdcNzVy6ldcE6US1MrI6cM2cB2ZBfy7SoQvZehfycv6dI3ejKvt
         wdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256225; x=1788861025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjvQEqG4mjQskhvnJnnScQWukkkGA2Zuecy1m5TWvhE=;
        b=CAjQJ9/vwgKJp/mcg9pJSvANQGAeyYfa0/MZqaXMpFMGctWzXC8n9DtLfLL4eb6MHJ
         NmaPELaTvnndLqqWF1Z0jdZ6N9OPNcdovsPJnkMfatWDsf59pEcSRVYWT0d8kUyw9Ci9
         VyANBpGJ7zMoNPYGC7HNEuVlkdU0tqRDE0PpY9lnJ0w207MXdvKUhwjt/s/JHggIJB7b
         FXXV76B7G10/pNBrCjWknJtBYwmWyWmGiDDkXPWhsj/6A+oBEeUwiT2s92fzjbO4yVfr
         DHwfn/+qAaOy1O3oiRiIOxn9juAnkKHvlMoYBr/nLswUCb9d81Gm1PM7nERbJnd2NQ0s
         Dx/w==
X-Forwarded-Encrypted: i=1; AKwUvBy0NkAObV2Jo6Mnu4r2s1YKRv7nUqUm9S7fvsUCovemJt6BT4JcC2/LtRm4CDhZPQMSfDQD9XZhKX6b3Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++lF92+w0klX+J7Sl9brZOBrZbbjxX+AdE3BlGWgVFgtogvC4LSS
	1C8RrUQW1fZM0wPPakFptyxGy1bfdh+sCQ0i5c/csjucrhfDHPtng3QHFOnoC6YkGXa2RVyd/P/
	vZ9a1zKDcaef+2pmeIkmZsxci58wU2zA=
X-Gm-Gg: AYBFou1S5N21WgrXeWInugx6oYKzRkBefsg9ly7cvt1rOTbqJTi0pXgNOKN63E0mrwQ
	QKChmBX02to1NSkiN4rN4Jm+Evwcc5gc8oXPDYxPf9aPDvXpBNCTv/Hj6M3yf2E3U0JHL9X6k6b
	bW/IdngafvOtKEVqJfln4ADX6NjQEIDPjZDlJeawpCJDNXxmy961/lIbBBNhspzw9ndmzIu0pw0
	pSZ/VxPOF2RIMJdbE3b7rBs1o+M7MUorlqHr6h7CTRWJOQZ8ivgReB81tVXOfUnvXkbml8kMEMz
	K/ufjw9NEAm6g6KU9wSoam8Ig6uQzM/RwsnD70OLS9k=
X-Received: by 2002:a05:690c:e0c6:20b0:851:5445:ad5b with SMTP id
 00721157ae682-85d68a8eb63mr94625947b3.1.1788256224722; Tue, 01 Sep 2026
 02:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828105018.2392383-1-congnt264@gmail.com> <20260830150508.1475105-1-congnt264@gmail.com>
 <4242501b-82b2-4ced-82e8-ef4022aa7175@roeck-us.net>
In-Reply-To: <4242501b-82b2-4ced-82e8-ef4022aa7175@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Tue, 1 Sep 2026 16:50:13 +0700
X-Gm-Features: AcwNN1VbEABi07UQC48N4BYIyXzERVS7AP_hVPbnQhjzgZZzvI7mv7_9sPq3u2Q
Message-ID: <CAJpJ=Gv8rnzDEpkp1X6jHojDQeQr1TEdbApJqdQzcz4SyN=QWQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 10:22=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 8/30/26 08:05, Cong Nguyen wrote:
> > pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
> > that calls pm_runtime_disable() is only registered when control GPIOs
> > are present. Alarm-only fans never get it, so unbind warns about the
> > missing disable.
> >
> > Switch to devm_pm_runtime_enable(), registered before gpio_fan_stop()'s
> > devm action so LIFO teardown runs gpio_fan_stop() first. gpio_fan_stop(=
)
> > calls set_fan_speed(0) -> pm_runtime_put_sync(), which needs PM still
> > enabled to reach gpio_fan_runtime_suspend() and turn the regulator off;
> > registering enable after gpio_fan_stop() (as v1 did) reverses that orde=
r
> > and leaves the regulator on.
> >
> > Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/r/b9792be3-fcd6-468c-9149-7e33640ee167@ro=
eck-us.net
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-4
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
>
> Another instance of a new patch version sent as reply to a previous
> version.
>
> It is against guidance in Documentation/process/submitting-patches.rst,
> yet it proliferates, and more and more people send new patch revisions
> this way. Where is this suggested ?

Fair, this was my mistake -- won't thread rerolls under the previous versio=
n
again. v3 just sent standalone.

>
> Thanks,
> Guenter
>
