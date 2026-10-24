Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829826;
	b=RCPu6QocFgjq6X3/I/PGo7BwEDSQD37kHZcc61mNZwBwz9O7ZxLe2JeYxCHhT8Fvwoww
	 ArS0s3HB9UCKQvedo8ryIv5pUCGnJNtVOPgdVZ5D/Wo3TlmWfvKqm+FLwdQyxHgBHek7i
	 MrX0eGTOJFTkSZXS6Qjguow0tBZcnoqGUEx9CXc/YmMmYMrIZ6JKZmIocZOMZaeo4INNk
	 v1IC9vimIyNin9oUeO3Hxz9wozUpFvp9GYP9YmscR1Pr8kF1nKMkd1q8zgKvvSHy0gzIR
	 dbq7SW0wdBQIEaEz02xVRI8iZNB9OyzT/4DLxQGm45H7P3hezFHZ71dE0oPAVq500ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
	b=A2hfQlK4fjPGmRuVs2whD6o/53PYUQtB2TLiqxN+xKYuAGT3VZMUT9a7jIpl41bxMyHt
	 HCcM6HzjmdOm8zNpwSZvRjtycvseY0205Ks0MHXNqgavmDJWDt9nDek7c1hLy0x+6UOtY
	 l4o/UhHe7KS9Fydxau9O+AfjAZKTa7HTpHCodh76kxl0OsE0F4bZb+ZujJmUvbh+ZingL
	 8zGnTY4i6YrBrF6MrfE2/Uc8CYWY6BJ2nsEhgi+qO8DKkppTlNC36KYC00anCyJbsHFi4
	 dtD846Ciaa0p9A0F6GvCHQysEkPRTBcRKACB5e1cKkzIxPD+E4rEEsZMLrE38SoIEjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602FF606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2118376a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829824; cv=none;
        d=google.com; s=arc-20260327;
        b=DAIQcYIjr9BBcgqPYcMe73bHkDbhD+oGNYqWLpFTlXhwSJkpsgHBXfLPi2I5wLmnim
         bApbjTu7cMw0DzZ3c8VAJejyWT/TeIzrlhTO66FL7bPEl2f9ER146jHAmbeZd0nSEa9I
         NSyYAeBHTqcA0aoa4psd8i0I6fWoMaETluNqNgowbK14sGoTRmeoMH8EQeeNeGTrCHV0
         nkeAoYLI94iHebVkGzclaSNQuRxE2iVNo1tlvElhgJf65j0Tos/9i4KLntsajO0WcLPw
         T3a1wfszjSxuIrgC0Mvl3+suZqc0I2XqKOKz4RXfXv29V81poC8nVQaB40pJyvCLOgVe
         usDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        fh=wTwlL5PKFOB8rcEX4a3CLRrkQcU6YUGkUna4QFISHFE=;
        b=WO0IufoCQ5e0jykKFdC/dBez6gt3jdJzCm2IbvOZosb2ghOSoPsqjnAh3Gmlhv/TD1
         0HKBLsa/TP5BUdpFJuj8O7iVbEkpCB356zY9QvpYk4R+pp/pPSpEz7UNqWoum3DznEAo
         dmMCAeMAUSzG6mBXAq8x3TmFQZ9C/nhCgptrcoGES1GsVnzwXVqGYtNsm0WRzS6q9jh4
         mgA4P9jxSyuOY8hoAuwmsOGhg+s6f1gIgN7B+v+XkGPDTTpHOA7qZE//Dv1XLHjeNeEy
         KIUuEjH9i9y14jkir88ZeDC+wDXclDi5mn+ezSVS2v1nsvQsDWsV80gXfG/ibHqCcXsJ
         LTtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829824; x=1793434624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=W+U+I4vJebkEFb5QNBPTCYwC9ApUfixleuac2ENZaWXkwOuFj6DuA3cnaW3c8yPds0
         tHi/WvTYjGDVefxbMVw1K5IsCkrCxG4VepnxhsGx9ZqGiq0iU8X6iCkgER//dJugJW3r
         0D51CHQEWQQOefESyNTnu/XmmwlHjQ+dwEs2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829824; x=1793434624;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=HgjgZJkRDaYv8hKAviXpeG0Ks2IUO1ab3hebAU9LrGdLYKt49DO2bCDfl/l61CPAcc
         4Eqd8PBFiHgcIKpwc0yXj8xz9gy9PS8gWIsTmfv9lYYKMyidgFq89glRgTinERt3AInU
         ElBWEo03QUAT+QJsWxJ76gPwR8mbxvuInePLmE2iV6D63S7BWPpun4o75BbHTPUiQEvV
         0XBou+lpt1uya+8m0vhqjqLS1hJGnSTh/IyG2aaAG00+KDndhvSdBfQqBI7YfzUFwCiT
         0gLS5yhLmkEvMOYWCtaq+rkPBhjYwJTiBYv/ociZwBz3Q/jFu2PYzqDiI2ZoRr2qXBVB
         PUJA==
X-Forwarded-Encrypted: i=1; AKwUvBwGJW01CClGCv1ogzDcS3MxcIDX5/yp5EfcLspAU8a6ozkqSLBZhTy5wFYW8ZeBjTVVtDroVUZ+M7o5jQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzygyEvQytTtCl0JHqoXyXq4G9bKowvN9DzYnXKW7vRJRERrKB
	lvjL2zCmo97pjs//LetloGlfNMQiG6d0mNi5EycotO8wqu7JfixU6x8Q0bUfIYfDCiIaFVECRs8
	r0V2OIr8a0jpu/b3MfE4EYgvJ79VGz8xVSI6bSfng
X-Gm-Gg: AYBFou20nJlU2OWcZz5pSOOrsAmcWzhQGy7X7FKzFUcr8B1+Vg2cFJabjIc8B2mlcCS
	sCHEATpOo4iUn8wA69kneHPPykykzuZ7cr5WTLhlUkWix5EEpo1FVrvGP/S8zplU/2mbyg8QFkf
	dtxROmrAgqgqOPM/l/G+XIzu0/LNmCwblvOoHO5xJrAVfL2y7pZAcFa4Ga7LIjZ2n/nvA9nIQAu
	+RVjMOtPY0CyZOff5Czbs48+vKksWMukICIB47tfmbxK6RwYyHn9vj2u83aDUrAJJguYmVsJuE1
	izH4sq54lHv4zVr4SdRZlgp13bUwoq/Lz2dFIv/qFXcHtRLwRZLKw+Q5GUvo5K22GRhrfBvZfh0
	/Oy7rN8uT1zhTCZ5GIdydVDok3BIfONsZkd8=
X-Received: by 2002:a05:6402:1344:b0:6b1:d9fe:88e3 with SMTP id
 4fb4d7f45d1cf-6b442fe4a1dmr1113081a12.25.1792829823688; Sat, 24 Oct 2026
 01:17:03 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:02 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:32 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:02 -0700
X-Gm-Features: AclHuK-hmUOppF09H1eQU74y6c4oDjFc2inDxQbdayDVgWED5bCCmINGnHLl7Qo
Message-ID: <CAFLszTjATXFecK3ryfO=yVY=C9yt9nc52acFZvxfdu5kqGNvZg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Build fdtget and fdtput host tools
>
> Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
> `CONFIG_DTC` is enabled so Kbuild rules can query and update properties
> in compiled device tree / FIT blobs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/.gitignore | 2 ++
>  scripts/dtc/Makefile   | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
