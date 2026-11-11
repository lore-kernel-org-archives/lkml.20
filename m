Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412976;
	b=J+c62lZTCj/T06cn0mfkKNcsH1Pl2cqajjbEPk/94B6LN7ZyL/oKgp0Pyor1GNfW3em2
	 KpVc7e/QnBCqGGAwqqYo8Xics390vD6Eh8pUNYE2k7YjNriklcYtcGhU7oqWv/xK4U91p
	 VRrTbkPMz5G6MvzFqInw/SrP4sYJUKbt/rIo193Ui4g+Ho9ATe26HG8QSDrAfmPNgDyCB
	 JlJ/uFRnajDyIfRU5ntWiaXO6CtU43FBn4C0yMvtCtl3AkAZw1F9kbTIvxM706P8zbD5g
	 2Gr2eOaYrF4zaTxIzhrnsTu4lpMeX3M2TPxCZ5iqZqb+Jt6E7wD9NdQXmjt0rg7qx+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
	b=Z7jFvfsbe+/BfkowsY/27qv+4IP6k6sw0racgnXdAnHCZKJjic0HbKFgGzrjbpNce0K6
	 lRsRa4U6krg1K9+jl3OOwQ2xBiI1AosEygJnEE6i5fdo1jyTSmkviBng71/Z2V68LX/ts
	 Gp+UTMFVbN1VcgwucTScxydD1+S5hLQbYaWpmixnpI/bUY6smqvd+ZWDD4mJbFq1bLT03
	 dWI+TxPCVaKJcT6HZGrMKmW8TSzuA2MqRyGiGwZHb58uBtnAWGXtTO1Il6iO+uhAupcSv
	 M2mlrTqwd5jyuhUwC/pR+ZSqOFztsXuWh437Y4PPMelmkWxyoezSU2znGCpFYY6tWyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKJ9UTQl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65FC606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65FC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKJ9UTQl
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679a2b5fe87so4022252d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412975; cv=none;
        d=google.com; s=arc-20260327;
        b=XkkiDlYBfOKdaK/OjIDG9/Aqrrb6D2YFNNPHWkkwzsG62YTzpWuFodLk7NZHH8H9H7
         jWt2tVPzAwsM6273X6K99HHx7DK0Ti3hlsioHRyAZwfekqz7Px8ftWv7XMmjCFYw/TNf
         RSZ0ck8tNdPo/GK784HjmUuI8En5vvAjhymwC8BQx+9Ac5WoeUYU6YrzwXPpyGcUS+Hr
         DB7tKsyiS3t+BUKypppWR+OyAhk6uTdtEPOwUL3SXN7pWD50Y/euYEAlZW7UgJgUAFkp
         5gAQ+gfYNMeFeY/JMndhxv35RNrmetKf15TfM3KUgc8V7nfIzGve3dTliCE9GkqvRJtl
         eb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        fh=bRcijLrXW1iuM9b5LV3q3Ntk6WU1SpS3dFShqNN2700=;
        b=pj50KAdCoR3Wc1zZ/Y9wUR1M7A7WyqXuGy72sQBpm1fbmWFfkMc2wahhFj0fXySfxk
         dN1wYjXeuI6Am0sSgCcLQUh12Fe3eLN7ixWuXxu1mshSy8Vw6ULPf2QIPt7bGVwQd3R/
         l+ecCD5Y2IOb87l5vRvENYKpojdpOvqPFnTV/h6sRAZfKJ6f6Xmy7ubkwE9ThghZDlzz
         AbJe0rZblKaSEBVP+5OLokYe1HAUqWOxqtIGmkExsuUL1OXcsL6cHkQEei7wkvbsDSwy
         7EvAY3fuAnmmWPvXICUu7yjCKU+I7Mt+82ES/fv/0ctA1W/xiF61k28woEHYZUL3AUWb
         p/+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412975; x=1795017775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        b=FKJ9UTQlkrpHd8aeGx0d+LfMWpdS3QS9TXfFNCiStn36JKFVzAHmMK4DgPyjQLCbxe
         4Yy85tuKfsUxjhpsot4j2CyPm3bwTG7QcrgIW9oNa+8BJQfCzFg5VnxmLS7y6oJvgBfn
         VaQKBuTMK21izUqJTD5060QhtlStG7L2P83NhZ6t3CLaktB0l0oYDHStXijKSIMgJ940
         5DTHy5VKDa181kLWtuC7tm//wjmNVhoLdo8diOMuOIxd4PSR83PPwqHIsOHuNfJ/VD9K
         IQDRdXrELU4dQZOw81p+yE3KAeHqlrCgocrjVYrPYM/pxE9xgbYVSFnE9YchtIdy4j17
         lnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412975; x=1795017775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MTb6+K+DiWbXH5syUxf48Q0aYKAf9KtSh4KBDlK36M=;
        b=hb60nRFBDgE+RXRDY9sB2eS483x+IK25N1nF6eZCN3zXHazImChzKOO5GVRvhwj4Xo
         GrYcgtTuhR5eQBnyO9QPYQ3P4WlZx0GJk8EFxY4Zs0DK+qKTHqg5wdWeuUS18l3OHsFu
         e4UfIq40mRRsnMo6ZLE2S1CR1933Vqew+kvNzaanmXa8yt0w5M5uwUrBgsKNqa2Y9Ur9
         15KIsBl3jmPaIFq3xru5fVqyWcKnrrabLbXzsKg80Jd/GyQv5cdqOotBSRAKXuTOZmau
         qazHbdRamVSOiNvkAm+2tK/0KSZOGUtP0FJItYetJhCk//qBoFHmpIB6p7THZm3HVw6g
         8OEg==
X-Forwarded-Encrypted: i=1; AL+hErHVE5P4RaK0Kt1pss3juRhW/0r2BmHjgdf5bhJDMO0DrxoHqjMx5oyc8++DTVbxFT9nLIc0GxkKkoxB258=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zUP+v3970FJ3TQtx2Yg320h3+++6wv2K3RhR+Z3o3m5WumMzB
	bDSTyBdlo8CaHJ7LHDxFWeKTKNyAG9p5Tgxx26gfyqIeam03bdzxiUhXbhmAT8IedqZ0E2cMUgc
	6KiDL/hFU68JqfPZ3qhMOnympdhzV3w8=
X-Gm-Gg: AYBFou2vLZoJ4g6UFvI3Ji6H6UX9Ac4fgn7ld8iu9uOGs4sMapyqVatMKjjH1a+64vu
	hb150MmTJYmyqzMuwAdHASx3tMuyZIG9F807FcMPrEmmEBve1/8RGgHh5hBJAAHLqxcAN5ZKYyo
	cjXSgRngeB1ieUGDcV3x7a89lWW1yTGgCYies+7P8mAya9WvasgEft0w3R7ZB5ciL95vr50h4oU
	fmXmFDu3n1h2JColxnm9QFPPetBBYZTv+JX3MMZ/DGQ1QjfkryHpIOxR/lUIEs8uT19CFnDd69U
	DW6fFfHXepkbYgiUNZiuYULaOl6Xn6iFvkhRgue9GcIZ/AodIdOdh3ZfczDO9FE0Nj5MrJoKJ4b
	UdWJrMvNjWugwxRy6arm1cIRPojUIs63TV3FenPGbbBJgczLmqC55Ay4Xpqfwcx/V812M5g==
X-Received: by 2002:a05:690e:169b:b0:67c:33d9:7927 with SMTP id
 956f58d0204a3-67c67cb7cd5mr1503453d50.12.1794412974424; Wed, 11 Nov 2026
 08:02:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-lm3630a-led-max-microamp-v1-0-ec9e441d9b2c@gmail.com>
 <20261107-lm3630a-led-max-microamp-v1-1-ec9e441d9b2c@gmail.com> <20261111-cute-impetuous-otter-0d70c2@quoll>
In-Reply-To: <20261111-cute-impetuous-otter-0d70c2@quoll>
From: Michiel van Beers <michielvanbeers@gmail.com>
Date: Wed, 11 Nov 2026 17:02:42 +0100
X-Gm-Features: AclHuK-qKY6zTrJn_1i0uQfpLRmaZpJ8hHHbOyKs16JHL3o_cT2giJuDjxuxfRc
Message-ID: <CALcvxfH8N554Pn3uN+cms5zuq+LPGj4rnV39-5G3G9yzhXTfgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: lm3630a: Add led-max-microamp
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Sat, Nov 07, 2026 at 01:13:54PM +0100, Michiel van Beers wrote:
> > [...]
> > @@ -77,6 +77,14 @@ patternProperties:
> >          minimum: 0
> >          maximum: 255
> >
>
> I do not see in this node reference to LEDs common.yaml. You need it for
> any common properties.

Thanks, I'll add the reference to leds/common.yaml in v2.

Warm regards,
Michiel
