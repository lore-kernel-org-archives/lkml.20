Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D163D4908DC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352828; cv=pass; b=EuLkyUv6AyS8JZpyo4WDP9ygKg1vZ28XxUqRtiv1tgMvk+Fy3EOJx1UyyWFGqBk5jhpcImaNIkzDXgE9FV2kWvqLcJ+w2BmkpL/s44ZUN2qGrcFusuETQtODMX74IAvbRpOuRvC5uAGFsO8aPHCHAA/DM2+Wo5TbUqBSxVAYrmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352828; c=relaxed/simple;
	bh=2q7EoLKcgcwc7yUi5L5qFuNobRc+ktl9A+DSmF2mUEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZB9bg4YUXnTXaXkRhiFWBJMVVBtsuinUbQs9Yy7LUqFDxbYMljgywdmSXku6eOtnUSqrULAtVE/CAqa7RGsxJABPoVubYpSFUJmSZgA8E0Z3h0W1BWxib2a0lRDSbbj+eLP4/CyPxDe18h9TBcqxELY+6IFn59qfm6ipULS6aIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=TZHJOkcZ; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="TZHJOkcZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so120420966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788352824; cv=none;
        d=google.com; s=arc-20260327;
        b=LYtAjoIzwFyvI1vmFpIWgsW8HjtaZOipeAPnP2O+VgMJmWCCSZ17zgWQa930KSVoBQ
         SjchvYeeEPL7blx5ZwsradbZ4afCVFESnKKYPfzfz/etnPmtqtbd6BaJCs6eMPutI7qm
         7U9qwxG6g2NuxJoWpOwu4uIrg/lTwmhJmiMjsjFbBX3ZtLw9OiV+jccjaoWoQh4JZIem
         lEL1koizjCazi5Nrd1ZSOYr7U1ydFg+QhlUAFLZUIKxGakcCHGSbe4GU/AIsmnMEyvQx
         OlyIACfNxN3ltHpJcFtcTMERQgQyz1Abiz56noSgAGTJ09Wt2QAcHS2056UKFM+6foAo
         Zsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        fh=EWNO1QRh5ERWE6klL9Q6XM98noWhgHWeQfIP6Tveh6w=;
        b=nqugngMgcVdZca6pL5pwiHHVy8VsOVMKVuyOnhmpmaDLcADuUkBvEd2NeOKdghiqmG
         +eWip8iG861WeVdImHRuFNnUtBGqGG1Prpjq4xD4gxAcB32btiTG8gytYKHiGVx9Qu/I
         U4m5Hrnfb2KipFakRkmw1vd9X8626NHWr2xo0xB4vOg6VmmiSQtWyTMIkqaXLBpJp6/I
         NsZRP+wzC5yEkpB6bL3Sd2Lzn2pzV3Z4UDZN+Hynj1DAO4xQBhNREbpkMaI7DTkslnmT
         X5T5DkSEBqCwMBm+rKUeyQHEjS1sg0YrR3URiBHYb6mo2xA5rq6its3RwlXNOhoHn2v5
         jPGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788352824; x=1788957624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        b=TZHJOkcZJwTfPbRTlDs9/OBCM4woe1At57nBvb/eTQmvDHxftKZUTMOQD1Ccy9CrgV
         jWDbua7Do1wljDmCC3izGHnTK124dZTXl9HmuOHt+EaqPO2ffPdFZJI/16OSEC9roRWe
         /0ZQwrWCYGKmxrO8s6JsczCPhT8fv0IpNSlhQNGgEo18kCjLMNhogTTw7iVfuvWF5RHQ
         shIv1r4xj2/v+FmC/burOKcC9P+O14PFyDv2livPjEQ+rayx+RNf/xBbNXCYy6NZCYnL
         K6ZFlnjSx/6TIfbmhw0fdf4NlBo2R25cUuiAXtyjw/Q52P8hpdP5wLcCzzuV9qCcdcEF
         9Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352824; x=1788957624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bf+ehOmiL4umBAVvBrXKvt8N+WWJPKbeQnHod1e6bno=;
        b=euzNl95ElO7J8EtVUqERkCBFJQIgwaIw+SydsFEGnZ15tCktiTLxVyhb5TcOGzOfyj
         KTdO5SzAvVkym16FJ6Owr0m1Q9uSQ1nh7UsrYbJSHuCPpHudWCJJdP9FEXk09iW4AKHT
         npKABSxE8UDP8vMRs5qxC/x7ympfd0KR09EK73VzQQRST5VvlY+Xi33MhHqOubmo5l0K
         jjCxzuRpkyiX4hAezVH1yASNXiuXblufB9fKcmA25xZzwffVCICwZTElaG8/nbuzmt0j
         mlQYeZx0PQx2KsnnC9gztt4DWdE41OKWoOAtqH/s9UbKHaKlD0V4N619Alda/KgQvC5+
         qmRA==
X-Forwarded-Encrypted: i=1; AKwUvBx+bpEBHhPVNoJRTyySKT/e7UT38Iq/5hqPsWh0nRHHi+A6qdPgyfLV4CDa+FVR+CxcjS0czhzA+a8dsmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mNfYxTOx8e1B6Nz2q9bkjBQK/pSjhjDisZtSJVJMoPxsr7bsyj
	3S7QvNx6apuzFLU9526FkPx7YnlJf/LKzekaEUt81AP90aXZMm7psTh1fCw3j4qjZQvfnRC3PAd
	JdTIzkQdGVcPeY/97ovFvGZI518GgfCVQaNPuP7hDng==
X-Gm-Gg: AYBFou0MfC1XCr1UMDon5kbBJjcbafEk6eoTdXsabbN3jZBJvhJm4Z8Y0jxYiXE+Nnx
	rQUs1CrJnTsUQKcWqgFia3Q9qrkN6w/RtXpJab0zZj+DAI5z1hhdtkj2ALk6EHCEwmXwN+Ht8A+
	Sb/gZta4BHTyPSEPQQStAeAqpmqws2Hy0ToTAkH2zxnqWVrYMh49NALfryvdtPBSHEPwDCCZj0y
	48m7gJyBl4CXWp3O7aRxEsNX/4JjEZJvEFPqWJOeAisO9DO4JnpYIcyoXpGYq+1Wv8kkB7vwg55
	9Lwewx2w/DVQsl/xSYnwoOZbOdpcOedOZQb1sDtBypN3nJGBVVeq2wKGAbLVBYXcBGIUfo2mzEz
	M
X-Received: by 2002:a17:906:6a05:b0:c16:6a42:c7d6 with SMTP id
 a640c23a62f3a-c25d52b8474mr330582766b.9.1788352823968; Wed, 02 Sep 2026
 05:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
 <87ecfc81e9.fsf@bootlin.com> <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
 <87y0dk6jpn.fsf@bootlin.com>
In-Reply-To: <87y0dk6jpn.fsf@bootlin.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 16:40:16 +0400
X-Gm-Features: AcwNN1VSY-7_RTZXfxYPRP1gcisezSlmJy8fnVW71SAjcha9KevXuu7BcSLrowE
Message-ID: <CAKTNdwF_wY8JSoQs=auK_9YNGT+hwQ=dAhcRVsf1E1CVvFs-XA@mail.gmail.com>
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:17=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 02/09/2026 at 13:24:00 +04, Alexey Charkov <alchark@flipper.net> wrote=
:
>
> > On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> >>
> >> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wr=
ote:
> >>
> >> > The OTP controller is driven through a single set of registers holdi=
ng a
> >> > state machine which has to be stepped through for every word read, y=
et
> >> > nothing keeps two readers out of each other's way. Concurrent reads
> >> > interleave, and the outcome is either a reader bailing out:
> >> >
> >> >   rockchip-otp 2a580000.otp: timeout during read setup
> >> >
> >> > or, worse, one of them silently taking delivery of the other's data.
> >> >
> >> > Reading two cells in parallel from userspace on RK3576 reproduces bo=
th
> >> > within 150 iterations - 53 read errors and 9 corrupted results, the =
latter
> >> > either losing their first word or, in one case, ending in the two by=
tes
> >> > which belong to the other reader's cell - whereas the same reads iss=
ued
> >> > sequentially never fail. Concurrency is not hypothetical here, as si=
x
> >> > thermal sensors source their trim values from the OTP and reach the =
driver
> >> > straight from asynchronous driver probing.
> >> >
> >> > Guard the read path with a mutex. Reads are the only way into the ha=
rdware,
> >> > as the driver registers no write callback, and they always run in pr=
ocess
> >> > context, so a plain mutex spanning the whole clock-enable, read,
> >> > clock-disable sequence is enough.
> >> >
> >> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> >> > Cc: stable@vger.kernel.org
> >> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>
> >> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > Thanks for your review Miquel!
> >
> > Sashiko complained about mixing a scope-based guard into a function
> > with goto-based error handling, so I am replacing the guard(mutex)
> > with explicit lock and unlock calls for v2. There won't be any
> > semantic change though, so if you don't mind I'd like to carry your
> > tag into the v2 version.
>
> Of course.

Thank you!

> I haven't seen Sashiko's answer but isn't the goal of guards to just be
> released whatever the actual return path?

I believe it's based on the guidance in [1]. In this particular case,
gotos don't jump outside the scope where I put the guard, so the
scope-based guard is still correct. However, stylistically, it is
indeed uncommon to see scope-based guards in functions using gotos.
Explicit lock/unlock is easy in this case, anyway.

[1] https://elixir.bootlin.com/linux/v7.2.2/source/include/linux/cleanup.h#=
L148-L153

Best regards,
Alexey
