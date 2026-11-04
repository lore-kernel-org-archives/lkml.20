Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805241;
	b=UNg47riTXsOOUWviDwLjfwwVcOOWfuzRXrABODUSNbG+XJzj/XJwC20Tmdd5o8+8yctJ
	 IIJaTgW7eMvJyKVVRm+TsKT+GteaMVEqvV+lOZg/gMhst/mK/C83LcQcccNQ+LFgOnWjZ
	 IlJSk3IwW9KBAQvrBt9nK5Wcv2hvqgCBgoXxVHusVwCsn8idfplfjqllZ1Y8ctKQRofDO
	 WSy2gCkYnsY44CgIVJ0eYGpxcnYs6xQAhQX/hq04kDK7/tcZqr4LrP6SMGcpj/ihifhrL
	 Ot2Ce4GzMsYKWPD3ZBJgxfdrYLUEqnuYX14dDPnm1ygl3VqWQZ6hteKcK2En+vJqVYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
	b=DOex9L8Scuv5FtKY7yNE6iaGz+bIvMaS4Y6k30aVuOhHu/QW0ttJScuTxrxfqA+DZEbr
	 INwfwzkH2iTRqnYds/D3TKt4BZNd6XVD8SbVBOvrwzEhUt/jDuNJr6Q1Bns5/3kbz7iRs
	 AlSe0g1MedARAQDWMAvuQPtp8ESsQ8NEBlAximsQa0TyidEX560OBlOGuf99CZEeFK1ra
	 zsfvEWNHpY5S2IyZZgeNkHZ8OW32pnP8bSAT0WysCWqmhzxeReXkH1IAORKH7Sowa5d2j
	 B2HASIJGjavTuwFulq5hkJ08Ys2EUD9GQABlEKYsNwxzuU6w8DtwyjTLVj4IsfXYQig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtJh+cIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A791606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A791606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VtJh+cIV
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea7987517aso4761105ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805240; cv=none;
        d=google.com; s=arc-20260327;
        b=WtYhVVbOtLgglFE5ECdm8aYvE4QmDcBkTfR++Y1u9mrBNPHPK80kuOmoOvqh3q3Csh
         sTIQXbdFJ46czArAzEgaHNuM5JxCMc2YJ9inB3SPu+cn7O1YynU8D2sENLeQpEPeD/5b
         K9DKhAUM1J/sCeKvBfGYqtrmMLgP7r2f0PkuaIegbD09RsukPLPAzx2Wxz0cOHtuct5D
         oodEmFIyGD/b+PBLD6slmjkbtnBkDq/+kCU2nVKwjGqftZxbPy0N9Y+fJ9eI4d8FhnGn
         ii48MgsDpksgZvn1dh2cWxxqa+uAwXXD8GtwvJKrFtwAHsHcXDpeuLnp6xssz6G1lhW9
         gUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        fh=DtCLlKj+4bb61IktEQlHaSJpPvYpxlbZsbLvQzSp1E0=;
        b=Re/T6wy3EwUuE2FR7YXdrLFSBjrJHjkWBrBMWIRn/sVtV3sOZsdW6m3n2KdIBUlh7s
         yTxWIOP8OfBUkyWvVF8mspo4UyUIycAEzyVRHvlMlUjZNMS5owkxY8w+PFC8l3TBTWMq
         8vQDmURG0fxFq4CuyxZ33r0IAdLAynyw1Q6CZCvtlcIuDevzBp2X790VIsJJzY0/SbAQ
         5/K/yAao2dGXGnhbpRLYBi73Lpuc2JcNrpaTNj2c4TZnCdrZhel4raOkzdKTYHWmfHJT
         a/ShI0eNHduwvXxXEvtvxtCnKKQfPF21jDekK7fmbpVmj7EqTCK0Lf9BJ9TgdbEeLUmK
         nvMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805240; x=1794410040; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        b=VtJh+cIVINZ2MEkevn7WmaVLFyNqkYyFIlTjBabgCax68zscjXmpFt5Y7E1GOEb49l
         pDOUbJBi0y+xmNJdzmbHtQA2TFQPErpEVtwgj0CtnEh2reAllsNP4W9y8xkt6LapFBzp
         gxu+t5ur1lKG0trClOunZczrodyKLqK1AFA1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805240; x=1794410040;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g9YM8zm/dWu62h/iQllU2IDBggnX7RoorSZH28+ZKk=;
        b=jWRATmNaXesLZuFCbJ3TOR67/tHSUAfhgYPM2wbd6zayOPQua5LZ4EwACAqotmYygW
         KA+/Ok190bKRjWDAubhbtbCp2wCZad9AZorA3a/1ERD+uBa0zoTKEGluE5MIajJBGwx7
         lZBVNK0juYX60xLf6+vJjqge9vz48kjW4cad3funYo4FlH0w+D5hzkYfGoITj+VL1wqg
         TcDUiWK51EkpEo0XRRqp9C+Hv7weVIaF8CHAHzd9JVJDBkrYWmxsFHef3rsJCGhqI2Ys
         dJX4s4o5ayHvWyBqMPto/GcJwls75vudYQS8QgagVzejI/PjkkC8BasaMVTvCgzyoD5l
         hzcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0hI2jGBeDyP2ErQwA30eia6Qthe/mB+tIBJUIfN3a+ak4DcdCkWozj2OLXtW2Ckunmc/necXibEZd55s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ibck9DSYJjKIX8hDcv5d87Mj9kzRblb0moqBgWtlw/IIOMlOJ
	6cw1PaLo1Vhn/5ZtiuiBwTszwLH9A6QMZHQESPiiJ9HzMIPg/kdc2EBWx+Ysr8S09VAYIdkveeL
	XIyQx1z6q+HWF4HDUXHx36kRw4cccLnfPkXUWnY6h
X-Gm-Gg: AYBFou2/NeyASBGmsYcYqDWW12BXciB4JCx6oXPMKmPa/gYhLNUDb02b+knLEd7ZU5T
	cYkNpSO5sEEco7b7hpelv72dDZ7Gxp86busU3Uv/owV9ZcX5xwiOd0aTUCmVLSkciqKbC+Wbfi5
	AoAzU2TklhQW2RrRncWxXQfN79AbN5l+v51TT15sD82kTrGa+JOyFi2oI39ystnqwN76djtlP+2
	0XkgihA6UrmAT6KHSCRQoY8wa7PJsudGZu84juCSPdoVY6Wcy8TXSrTmA+oMei4DnKkxnAksWWw
	+urh3SHNYBMCFAYN838Arya+nIlHIK06DaTH8MEqfmNpKSFZJnb/lfBGKrU9LuKFElMgnIPjnlN
	fBiH3EGbGwNFWnFBz0bNVcwB9Tn+rkYNxP9KVxNaiTmp+hHEQuRcEOO4AiQV1VJyHdOXp4VXflr
	RcSWB0PIf/yh0ClrOd
X-Received: by 2002:a17:902:db01:b0:2e9:a16b:c251 with SMTP id
 d9443c01a7336-2eb36415052mr159360075ad.3.1793805240352; Wed, 04 Nov 2026
 07:14:00 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:13:56 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:06:30 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:13:56 -0800
X-Gm-Features: AclHuK8bgHY5g2vquuY3HnPyoGGgOhTHoSnTSctVzT9j5B7g5SwdvJLxwGfXVIg
Message-ID: <CAFLszThgCnOx=M0655rjro0wShSm9oix+PKP=pM4fhmrLYUObg@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:

> Before introducing `fdtfactor` itself, the series starts with a few
> preparatory patches: adding a `DeviceTree` live-tree abstraction in
> `devicetree.py`, and teaching `libfdt`'s `fdt_overlay_apply()` to update
> `/__local_fixups__` on the base tree so overlays can be applied in
> multiple stages.

Just to check, is this still the motivation? Stacked overlays work
without it, since fdt_overlay_apply() does not read the base tree's
/__local_fixups__ when resolving an overlay, and the stacked_overlay
tests pass in a -Doverlay-local-fixups=0 build. The commit message
gives a different reason (keeping phandle metadata in merged trees).

Regards,
Simon
