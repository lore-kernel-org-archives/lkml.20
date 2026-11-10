Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342854;
	b=jW13D4hrwKkpw8MCrTmhwbJm1auPA9Kp+f2fG02WGFp2WYZHrdaDLtDyrC15dggIrsaz
	 8KrCaDCvGbhkOUkTUyozZSLCtz2rmcCUjGBSVYHng34ojfm0c+tIgB81rvsAhPZqvtPNc
	 2zs8rrcz/Vu4p8aoAMoZat24mEeru9BO1Mgudh3ORHjLKYznqXy9PwImN+P5KYASNYxyo
	 BTQNzka/K7Lmgm5ONrVkdC6/iS3kSU0HLQNdu2jSavbgH7oNtOh3xVMTyHngwR/UIJMcJ
	 3xbAfZRU67PkKKFV5yH4Jy8zJu4Y7LBSFExEta5tGoNKqGmRcrioQVAe5bSFcjawWYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
	b=5jJjnk5vCaZBwlkc8BfLX2M2N9rqBbv9IedN5B6QauYsefHMpZ4HVgFxdHvcBfs6M9mC
	 Zw3lhUD3n2ih65D/uBm2p+dfUs9ABCnselCZSjkIHTJcXSyTSpnPC6YmizWex+wG6lJt9
	 MZJsqMyrcMqQ79VfCFWmIUjfUGJlwh4A6UPKIqlxUAshtC4E6L1jXLYjrQkF1rWeYAv+D
	 NgqmKZwBSgiffyQcKgfrDztNeRGrzqBk7bi5LjjckD4EkmD18f2SKKw2nP/dwhzeap+np
	 u4XtBDKTW2vadzNDHlnrpWo95+hzDOG8tbuZ6VSNGDTym++sY3vvvGa86e/ypgzuGCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rh+jOjak;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F270606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F270606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rh+jOjak
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so4260295c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342853; cv=none;
        d=google.com; s=arc-20260327;
        b=Pa+v/ECpleKCgiI/lxJ+yRh6HaSk/yp/8OLRQh1KY0c6hWT8rWVapQuaO5QCvClZNx
         PvlC1wEwZ/rIi5/Kx53bzn1G9mgjyd6KUGLcjj40eN4Jvmtwm7d743GyFajE3xk3bLDT
         KK/d2VGvI+FgA86sag8WL6pVjK8F35nnpv2gaGeNNLMQFhwH2eI4EnE1pItYCFT09+Nh
         pinW112HslsJMskb4mFGtCBK2Pxi8SfdY0BdYCllVG7DHppc8i6/S7K0EmqWEvQCtrvZ
         4cyctSDpNRWPZs3Wcv2Ova9pcIAZ5RcBmx/K04iJkFqX6TWbX+BjgncaUFr2T92j+RXX
         bOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
        fh=9JkW/L8AnHvio49F7CBlOcQJQZl8LGICUBTRf+JGepk=;
        b=pkavcMyoF2e8KdcR5hDC1Mz07mRMXw33aKIwnepuauap5XTghuVPQkTB0zCH+OUSY/
         v+Y2eAKsWHYJAPHFEPixRxxUe1RA2Y1kl591iXQlnlKhcvoY+Nh1H/fZ8hnT/SUnlIxi
         soPLVuvxNxEvw++dMC+01CPwpOOq1rEDEW5qEXoPgjrt66O0S4Dec3iDiF/ZwbAjRuUG
         cQNHR94OaR+9zHwl6NHu55R+058erPAx4nD+/bSTwkQQyEgyyEe0FRAhHh8PhAiYWkU8
         uNt5msB865Zkm0hFbkPVFEX2Yhn0B5uBSa7dbvP7hxT60563Wg1USfYfhQgDN31s3D88
         7jqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342853; x=1794947653; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
        b=rh+jOjakz1G2mhKn7qUhYjA2f/PgbfhMztkjhsL7VKNEErg7iKclTlsgl3qQW1kwfh
         /3vViQlVc3y9xHIaX1bp4vH3xLFW1sZXtLNWciRXBfBPAsuqPLVc7XfnHyPD47R0wk+3
         HCkYrHGw53UOuL5i1hpGyVEL3qLps5eKTGbiSNulzmeW5/64EaZt1cjbas3YaO/IqkcB
         +mhUjHTZJKbLu22kIFMrIT4rCmLI8v283sXOh2zhWVeYqQz/z7X3UedPxvVsCzmb562f
         eBbM4JymaUo/ibQGFrYZAdEA0Ia+yWq2D3wQdzg3Do0MMnl3btYVVi7cp+2Rf8VL49ze
         E70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342853; x=1794947653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S3yevQWR0QP2Mx5vcqLjpBrtJN6Cj5pb6mimG15JBzw=;
        b=K/CDx7+CZ8da2hu3LPIAutg4Aymm23OWbKKWVA1Sm0Sn7eB9TSZTwbBfMpCUxk2Ww7
         wTC8umqTUA5jzIOxp57JbhAx1VR6ONqU29G8QKNVPjtaR/6hotzr76xyagNqRDlBWFQ9
         OwlW2p51yuZytDpQ2AlkWeERlTSU7KFPUnwOXjkKs5gcuay5BvFMU1yH8U4EZ9B4bnHW
         3XCCWXn3ppTxGfdnMG0t9fDvWKKjjUek2iQuCm0NLANPaKn5ugIu1msSa74DCgP7hb9C
         iK2mTfXn7QWeATrUIjrH6S6EfBJKGOzntat6j27RxpR72j7II2qXrjFcFHexzq/+aXfU
         tBkA==
X-Forwarded-Encrypted: i=1; AL+hErGDnwvmz6bYYWDmPhNgkE1XjCIpCKJng8IsZU8PVtNHarLYXXarb1TvmSDJP7Gw0W8Q+YrwcOX7f5HmoSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rsMELktliF91SOpxwEXogDtL9IQGc9DQXdt/TAQygmThxM9pY
	vS7HHQDu8nt0U+RmLGScUyLtSTUoRGy2ezDFHZqOoTOe22vJN5t8zva403/axaikOJWRNRqzBNj
	sw7cQrH2FGYZQleSm1vmJIEkcgzFLTv4=
X-Gm-Gg: AYBFou3bHTZT4H987SecCuJcLPejariN9z/giEs+Ar04zmioJ3ZrBJN9D8329OKj8py
	eLMQO4a4m6DRtOybgiTG2usPWQG7Odo7jI9rvzpuUt1W9rVUVxzVd+MOW3bISILTBfWPgSm8wFZ
	agBK2nasDIAOB3PtYSILyZhl7HCu4oNiJf2xF9eSOkDrq5pDoJRhKw1IK888MDToMUGQVnKbXQG
	CPmRzmM1BKSDzPc5V7LIPyXlL1Qdk7YlL0q8Q2T3Zhw9YysH/wqpP2gJN3WjyyqD60ZPByN1aUv
	o4DQpt5lYxXcQj/Foc+BUGLKS6/g7VXjZUw6OgBaXT6CEjG82rutD1lcW93owueshXIeTXeqx7t
	+RsbvXEt3CvaXOfYz5XTTvQ==
X-Received: by 2002:a05:701b:4354:b0:1b2:4b42:1870 with SMTP id
 a92af1059eb24-1b3b60122e6mr5192830c88.31.1794342852985; Tue, 10 Nov 2026
 12:34:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-legion-lighting-rfc-v1-0-a87e1db8c5e3@gmail.com> <71ecff766a91670d509b1286efd995b71efc21f4.camel@rong.moe>
In-Reply-To: <71ecff766a91670d509b1286efd995b71efc21f4.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Tue, 10 Nov 2026 17:34:01 -0300
X-Gm-Features: AclHuK-300J_C-DWjExk6OeF5Jmrb_TP8ZwYUDbSNJSRs61knDywMdBKoecE0iQ
Message-ID: <CAPKD0HduW_atYsz47Nv-9A_88K1B33xENUnZgQAKcH4VHqV9PA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Keyboard lighting for the Lenovo Legion Pro 7 Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

On Tue, 2026-11-10 at 22:56 +0800, Rong Zhang wrote:
> Thanks for working on this.

Thanks for looking at it (and for the clear direction, it helped a lot).

[...]

> Let's take it step by step, and submit a driver for 048d:c197 first. As
> far as I understood, the driver should be able to handle "hardware
> brightness (0..9, stored), the controller's own effects (stored
> profiles)," and "Fn+Up/Down/Space" by its own. (Please correct me if I
> misunderstood your words.)

Makes sense. v2 only does c197, and it doesn't depend on any LampArray
work:
https://lore.kernel.org/r/20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com

About your question: yes, the firmware does all of that by itself.
Fn+Up/Down change the brightness (in steps of 3, and it's stored) and
the controller sends the new level on a vendor input report. The driver
only exposes the brightness as kbd_backlight and forwards the hotkey
changes as brightness_hw_changed. Fn+Space switches between the stored
effects (6 states counting off). The controller can also read and set
the active effect, but I left that out of v2.

> I am also working on a independent hid-lamparray implementation that is
> far more generic than Aaron and Werner's series.

Something you may want to know for your driver: on this laptop c193
doesn't show anything on its own. c197 has to hand the LEDs over first,
with its vendor command 0xAA (07 AA 02 00 00 00 gives them to the
LampArray, 07 AA 02 00 01 00 gives them back). The controller remembers
it after power-off, but it only matters while the LampArray is in host
mode. In autonomous mode you see the controller's effects anyway. So a
generic driver on c193 alone would register lamps that do nothing until
c197 is switched.

v2 doesn't touch 0xAA. How would you like to handle it with your
driver? A sysfs attribute on c197, something with your autonomous mode
trigger, the component framework? Once your series is out I'm happy to
write that part and test it here.

> Please use the component framework (not in your next revision, it should
> only add support for 048d:c197).

OK, noted.

Thanks,
Ciro
