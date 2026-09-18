Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F538D3FE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745168; cv=pass; b=nT3UBgPEuFtfJ0LfMNIbHhET9yfIXK3AyqVlAASoIoGPWXbq5KIfHHrVZqPlTP77k6L2s6or8LKLLLmSkLReJiOT/5V5VTLXuCzdbNfShu7+oVEXL4KKLyX2/GQPmrcUoJlsov4xHdxkNEpHmKbifjhv9eMpjs/thUDfE7LVoNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745168; c=relaxed/simple;
	bh=p+d9uQJYoKT6Gm3nV0Bd4xTjYIaei4gX72cUVpvlu1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+c4OGshy3dIxOhyzsuH5cbN5YJc8me+qTRGrlXnZOQf8ttLjKpNbyMKHjaIYHbUJ6yLcZ9kiNhDLTZMFqpRqMJ8XdyK4jmOtlQX0X0cJr1mLALSR9AOls9em7IdqIuBsMSXeKJbAUqG4mJB935Z0yS1f8jC+ZMI2DtoKsMhU9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N/xY60Tu; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N/xY60Tu"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so1207443e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745164; cv=none;
        d=google.com; s=arc-20260327;
        b=VaKHKl/2xHv8zMqeix8EOFquZH8/yDoMGt/HuxnblwevX0frjaLlKu0+j4Dx1WLyOF
         YmA/oq824qRPxLeoDeMUvjraaDjPZ6BItnnx163gyn9lJyMkHrf0/sSRtSJYmopkVDOV
         eJeAHXy2bBG2gJrwVRTvxq7rmH/gBJUPVgLr6U5vyrg46ThJ26OaoGjR2iVbH9Wati4t
         GZXAuIfeCAT4aI3akK9s4xM7vQ9sWlEWJwbzztYmPNEoMXQy5AwdfaU5OYzpIaNonw9P
         KM6MSK7om6sVmOAItWZCMyC6MSWgBAWRQikM5u6Y1RMROXKVuUiP4H6K5aS0dm75Og6U
         g2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uXlFumkwKpb2vNyO6JMeA2hS6nnt/1SxvmwQxKcpKo=;
        fh=Zzdx9cPWYlooiRGoIPt+bp0Z1CIWvA+ikUBqI79aHyI=;
        b=i2DUSfdJIKRsSZGbQEtndLzGpmMcvZHTgu6Eq5cvv0kvMN+1nzEWzfFLi+1ysmOXle
         nS/FrAX1WDiHv6bKtGxlB7Y7wlIbhI213z/szc5+TVCAHtrD012ogqttOLh8P/yTLl1l
         OAhWuz73Pqh8ocRQXWuL8j0f+hp53OzeyKFZkJNZZLy0RXG+5+0L3pnIVcdhza03NL8g
         hAwsFIW9vK9JdMAUDDS/Fl0/TylXAmZo0bU6YGUSB5tEjMPMhJrAqhnpt03MurhY6jaE
         onmtsSQtF/h/+KIVSLKSqL4VGOPEhd8PCzszHPiUeOacSNISqQrAY1RHgrKIypnAqXW4
         L1lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789745164; x=1790349964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uXlFumkwKpb2vNyO6JMeA2hS6nnt/1SxvmwQxKcpKo=;
        b=N/xY60TuFU6um/Qb71gyx/kgFioyqvwnOA48E2NWyrjN4i2RWA7fXl2kKjjQjTL+By
         rjD5z13Palx19Nc4I7BtB/b6Gdt5q+NLAKi7fYKhD4NnJAD0JafD+YJdKP8T6anA/8iP
         k0yWG6Ct+SV6sUU6uXWcLYpY1S6FlAvOkpV1lpDPNw4oRms/7AHiCPIZAoDH0QGTH+mD
         tziFgABLBI66IV/r22iwoFnUtN/1cxx+D9FPR+xnwTjV0dub2qsajafdLU1Hu+9stMi1
         wl2P5lA2XzVmm1budbzrejo0E4QRoTCsngZWyDSUHXswpg274yBxCsZJjHNtVt/b14XB
         fAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745164; x=1790349964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uXlFumkwKpb2vNyO6JMeA2hS6nnt/1SxvmwQxKcpKo=;
        b=OEF9mHbfhU4adNP6X41CtZpmfixVlVDk+x6Hb9iIqai3UJBk9Jp9DsPIE4zLbjpugX
         dxtBopjbA+uRxpCD3z4zik0yRLMNiJrdzO73WS1eUeVBHw7kDtnwQAHQDNowPhJ9TXK1
         Y0o23BvKuEwcX7shATM/9yqNhMBZ8na9Qzw3IbcTADXENO0FVlztw7Lvz/x2sU/33WGC
         mgebhYvDKddnjXN1T35w4YdFY+K7X8ChRbmGa8V+CwupynC0nelTZLZ5DTKCLqM58YZr
         aP97/1rDmOycwNiqRF9zXSNNU0OxKNBCasLjPSL+IuFsc9Yf5vYVmwPOILSbbNoRuq+j
         p/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzkFRGV5O0F3O3gIskpcNx3Buivm2I2xSzr1XVeLP16/VpcZ9T1/WX33DyrAk8aKKBi6OGg43b3+dRw5ZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mzmxLN3xRZjgaIlI5A5mRN4rdyZxlhMwXxyoTEWcgdock5Z5KP
	yVWTv8bbcymoczaWC1aPs4aARQKC6gaVgooeahnwELaExjcK4o+pic7b3Ru8S9/q99oZ/XakkGL
	RIsmA5uTUnoJedA1gCg1l2kjGiydtA3WtQKqo5hu0Mw==
X-Gm-Gg: AYBFou0PpZDJHUB3GyIDam9SbgTi5+xbPA6AUgaHsHWRSx1WwNS7DjHR1AcQN4tCBaX
	zbswO/tHzGcZpKlJrGhRhJZnNJcUF9AEdbf7F1BRTJ7Z454kKtqtggjvzq2HYdZpi7O/PCrcjiY
	TM7C/NvXu7uySKt2YWpCoCDhhuiKZsajuV5POcgIPUcul6YmvFqn0Uuh5bh2G/naJ9w6P7xBPp2
	JEd4OYEKnYZEFjnYEdqZ9BTHgIiZGMOmtZ5xUyrAEcuwYTB71a1aBbKh9FfBukk3W2kSf8vg+kt
	/7hnSRebFWQqLbIWyEMhAVJvhzrpROmTE8OpvoJ12OV8SrFh7CASyP6T3FWc9grJktc3bet82MA
	yv8TAIqIFCIQb
X-Received: by 2002:a05:6512:3b98:b0:5b6:183b:d204 with SMTP id
 2adb3069b0e04-5b8c1848ffbmr1030110e87.43.1789745163882; Fri, 18 Sep 2026
 08:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org> <20260918-wq_final-v1-2-5c43c08a26bc@debian.org>
In-Reply-To: <20260918-wq_final-v1-2-5c43c08a26bc@debian.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 18 Sep 2026 17:25:53 +0200
X-Gm-Features: AcwNN1W-i5tEp94cueNiWucCvxRAb2LU8a_h58p5kBBZi4sBOk4sbLn2JXATBnA
Message-ID: <CAAofZF6fPE9Q1ta+=wb-0jP8-2OiQ9FzhSpZ9_nC0_nyfW28gA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] workqueue: Add a concurrency_managed workqueue attribute
To: Breno Leitao <leitao@debian.org>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 4:25=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
> [...]
>   * concurrency_managed
>         - CM enabled or now.

Just noticed you typed "now" instead of "not". :-)

--=20

Marco Crivellari

SUSE Labs
