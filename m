Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566157;
	b=2gfwM07wh/sRI2m/oM7fmRo7v4/zmOuekWLr77Ed5VjZ5CXQIJn6p40GlMb/SdYkPdjA
	 BJmnlbqjJRin+acUmHILKYnZ+CAKxb2IDb/cy4piekXHWuRVX4u1u8Av88Wq8gdujZMOy
	 XxurWDRXgYUQ1YeAvG+b259iQOMXnbSKknu+QVvkua3m3HtNYxNCc/31KAxuop11fDrKG
	 f4/RdecCq/TfBXiWZZWfU0hn2ypBenvaVYFXp/+gmDT+ippA5BeetwCMuYX+siXnOcyGM
	 xlQ5h2gEiqySG5uqxdeGx8cpSQ5dmULUBHdfiX6OA89YlWhTb+uHHz3bcGFhmOoFy+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
	b=MFhiNuJTc/hrUeEefP588skGHxC/zOZGOy01azLC5KSvD5GlgPAMI2Y+Vq1RM1YkExLa
	 3NbSJVetJXt1ZgYreb/6iasQKBdy4BcplVaW0GjWjeYH9LpejRLldK+nvI1kHhtYBHt7u
	 xS0MvqJcPg9BuObnNeLbVRckHgk/wRxmnQ7ULSV7HOh+e+xqHJr4osW39tuYwTJx6EUjQ
	 3FPGe+OV/CoS+9UYzWLiKZYpK/IqZP9AQ4ygiKmhn5u1NuMgzsL+EGR46w/qL7cw5znfR
	 oZWTNlhSicPHRdseBrt9QoGNSMZZKpE4cby4GVVSqK2Cav6wCH2ZFry2JMK+AFc0UoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dydAQVFD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FB606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dydAQVFD
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so4123231fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566155; cv=none;
        d=google.com; s=arc-20260327;
        b=pRB9m2crjH/Ac084eptZQo5btfng5NJ4S1XBquMxH1TQp90BEOdlVm7SqJgXv5ws4g
         SNl3LNRFpQxGbwYOqSRJmliftp6sKbk23H+oaDLnbslmkoLLEPAUAsFa99wOMzR67HIV
         sJVRfEdFUNoPzpg3yjFTQSTKy6yh+UaQDVbsqvzl/ZgIdgwSI0cvUkg2FH4HQnaraENN
         dw/aL0dv1QntWM8COy+ts1oa1yQWyk8aiPNpGwyAGjM4UDJXrOJfERf9lEpNdi/kLwFh
         NUI49h0/8Vd2bLo5m4Mx+YnRyHeUV+MYHftiWH+QcM1k2R9pnVRLQE6aGS8NUNFEWqqO
         jXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
        fh=DJRhZUKvPjwgLxwiMjn4TJ4VclMFDNYvpEVmvuwZjZI=;
        b=VwKI/O0fxTX0PfESWbSJ2+aQQRBFLKFNCCjcU7g0g09VpZ58L2Hr9OUtWVEy4zFqkU
         D4bK+twssNvqMZ1VPf7S7SrRll4Cf+gTVxl/FEBeIo2A0pkUPwCEY1hG+7Kw8qMKjXI8
         LjN+iUcufgmFh03ymL1TUYXxf5XXt8h+/33jnTp7oEouz1+avr9YgK0lm3/2mrtIZusR
         emFF1g84iv4R0kImsL4nAaXxJ7GuhPOh6cahJUTYpUInxJzhYBn+Gq+MH1WWjxZ5a2Ci
         PQwyH/0dCiyq1GT7czuUcvEwnbkksSLYED3x9hL/nJ+dmo98dX2T13p/Tt29/poDq51S
         GDqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566155; x=1793170955; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
        b=dydAQVFDCmszIweiK1I6g87TOuPuZr7IuJihgHtNx0uWoscuIm8HOVg80pHAaTauwB
         CiiGRfFqiFjx3r006HaN4o5QxN5ZhQ/QQz8SROfF5ZDR2JJgvjEXT0wPAtnWOoI2AlFu
         Ibe/HNRzdOzEEE/MZVg3SN0OR72vkjm6xHP/riv3Lw9ZoTzITob7RCGU71xFhbnVu/AT
         t31z6K7bsRPKQM2FWOMRd6y5yQOxspK7YY0fjenhhPd3/EkCet2IHS8MWGGVi4lbPvcq
         DsFzyrQgP2xLJ4G5LaVEaq1CNRsvfvv2luqBqonUd+2ySIzSHNFwfxNY4yPZ0w93EJtC
         amCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566155; x=1793170955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScI2PR6LLaTrA1CijXDQyJr+PpnB33pyJUIbjOPXVkE=;
        b=PeV3EUQzf21bjI5b6Dbh7HW7+uNuPUjk00BgK3f1/7P868rgcv3KGfNNu0bfwdXCv0
         k1mPELfpqo/dOjHuNFpmmjXX2kZ+VPwfb3V2h+C1Y+j8daTVaWfaSK0KzEABgn6cSuD4
         Gf9V1Zbb6Fc8h9tP6a2qhAiDm7QxV1sduFKBdJt3AxWOvbiAdr1ayOM0O3ByG9gNpFlS
         3I3RfQ7S/x6y6xivN9iWiqakrQYpZiqqfmgbdwp7PRcNA5IDAkDAOfvqnGpSq2e/Ga+M
         RxtJo7Wu9xlohQOWEVQ9zS5NuPeKuU8peESZEez5wEWYZjKYQvxly/Zc9rJhlzK8DThj
         8puQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6O48pON4YZy2DjZxswl9s+LdCU+M9zYRQNiPj1Ru5k0EMNtE3MNocm5AH2ZZp8vqqou+djOT2e5UWbaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU/48np7tog9SfT3IgpRFZZbOEcz1MCPqPomZqL7FI2p86jmLK
	cZNTkmpLkQhI5Uou2niSAITbqWq6B5ZEx+krn2RFch0EyJM1kXCvNMgy/pww+defj8uFd64/XmJ
	6ll4xRwOjBFa6stQKubvSuW08tmFEwdg=
X-Gm-Gg: AYBFou17k8foGN8IT01qr3kVlHHJVN+M1Kyghz0gmkbY3h20B5lMOapYYcljCj7TZqY
	j5QDffTLbpUh5iq0O0KBwEs5YEHSmqXFCnfA227l3i2zw9ppMVcAyB7pVWcDX+tqrUarAP/Gp/8
	Ygou0/sxX9AeX6R8DukiWvlk5wSzqy8Dxn07XgvvOQLHAVhaGu3DJGL87Px4MUmK5qL3JqQLFQF
	roWDpUJDkWetBCQA6oqZnNgJ8XKT2koFNUD+NlTe9gu7GbVkBVZmONugLo3s5yzKMoFEY5BdHJ0
	knDr3AMSop1TNS+ZbpmXVcWskjGlAYCJPCxE32svHjHwpRzvQ7pfpm+y4xoz39XBUUOvo169n8S
	oZcA9JYdfropULSC8W23iVl8tP8yJcovQfjwyxiQW5IH/2nQtXVmwBasW
X-Received: by 2002:a2e:be90:0:b0:3a7:635c:d56c with SMTP id
 38308e7fff4ca-3ab4edf6d7dmr9603521fa.7.1792566155073; Wed, 21 Oct 2026
 00:02:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-adt7316-error-codes-v1-0-1970b7e242ac@gmail.com> <DM8FXLI78NYT.1211XFYSRH5P7@gmail.com>
In-Reply-To: <DM8FXLI78NYT.1211XFYSRH5P7@gmail.com>
From: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
Date: Wed, 21 Oct 2026 08:02:23 +0100
X-Gm-Features: AclHuK8t7geITgCelH7NvQN5uToH4QCPhBjI31ls-GZ-beJJ-UXA196JduQkipo
Message-ID: <CAJsKa+4+raxftmYPT5yyU6EnP=jEnngOy4PSGaztUgL-N+cXkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: iio: addac: adt7316: error code and probe cleanups
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 02:58, Ethan Tidmore <ethantidmore06@gmail.com> wrote:
>
> On Sun Oct 18, 2026 at 4:41 PM CDT, Raffaele Tranfaglia via B4 Relay wrote:
> > Two small cleanups for the adt7316 driver.
> >
> > Patch 1 makes the driver return the error codes reported by the bus
> > helpers instead of replacing them with -EIO, so callers see the
> > actual cause of a failure.
> >
> > Patch 2 removes the dev_info() printed on successful probe, as
> > drivers that are working properly should be quiet (see
> > Documentation/process/coding-style.rst).
> >
> > Tested on arm64 QEMU, with i2c-stub providing the device:
> >
> >   insmod i2c-stub.ko chip_addr=0x48
> >   i2cset -y 0 0x48 0x4d 0x01
> >   echo adt7316 0x48 > /sys/bus/i2c/devices/i2c-0/new_device
> >
> > - probe succeeds and no longer prints a message
> > - device_id reads back the stub register value
> > - writing 0/1 to "enabled" updates CONFIG1 (0x18)
> >
> > Error path, instantiating the device where no stub chip exists:
> >
> >   echo adt7316 0x49 > /sys/bus/i2c/devices/i2c-0/new_device
> >
> >   before: probe with driver adt7316 failed with error -5
> >   after:  probe with driver adt7316 rejects match -19
> >
> > Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
> >
> > Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
> > ---
>
> This is the current policy regarding AI and staging [1].
>
> Thanks,
> ET
>
> [1] https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

I see, thanks for sharing.

Thanks,
Raffaele
