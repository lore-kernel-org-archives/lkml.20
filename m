Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153994;
	b=uQRAZmYEPrPiOyACSGnVgZvmqhMgeJ4UayvVjtWBZjco5yz7MfgjkyPSt096Nd4Qw++k
	 Ib63p1Ha0pCzwNcUO67tMLYyYXIB8Q1HHA0JUbG4PxjpYsjjJGaxXIkRn98+F12Vmh78N
	 FvMSRZjT/0etp17xCx6x6K7mDPKXDXgxpludbIrhtbx2wX2ZBrGsi4wTbAXdina96VI5b
	 QSqtswig7A/LGIB3O6Kpa+nS1lCiF41Z+O7wlVQFmpKFnwh1BegM8y/HdNm/ZMdvJFh4E
	 DUhPFvK7sKqNhk4pPBKDRGzn85E3gxJikuam2cwNDnxYApDzwsYg82NtVUah4SafI7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ll9NzBFV0AYwGYRot8ioCuniDijkW2mX9UPa4oGfP3Y=;
	b=e6+WyBuHja6ZdjRP6jxR/C8Ki6lNTBB0j/jQH/XgR/dO4Duw1RSQKAxA/dAcJx7Ym/mB
	 136Nk0v98RjAFElOcgR/QPSyVD+8bVq8g/ADhC5vHc1qT2kmUl/oK7C8AmkExEDvsUKml
	 Fa9GAmMw8ozdXSjCRLnJMnpDxK9fY3twvwBxsZNFxdrAfHhBkJpwL7rniVlrvdGWrmD7U
	 Otjndq2Lt9M1MZBTYHwWzqzbpPksBxHO7h+KQBxyV15RLuuWx4y+6ej7NRXn39lRgTKTb
	 d9tEMU0hcH6dWXOztbODav1p7vI1nRSdBEQFY4/onEIPOLEWvncuNrL6pN1KvCOhv4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWBIHSsE;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6412F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWBIHSsE
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso314749137.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153993; x=1793758793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ll9NzBFV0AYwGYRot8ioCuniDijkW2mX9UPa4oGfP3Y=;
        b=oWBIHSsEZV3Kytyp+sDKojVHfHeiz3N+K7zF0XXNsjkLsLuXCOpg0UFpiVFKtFjqfD
         c5fQQdlVLtFwxWBOqFfCcwyLN5eeeceB+4qcgkQurhmG3DBdgKLgn2xVVojApePswQo6
         K49lLpF+aKm64vbkSbTHbgdLjVPeVrmXWmU3kLMzGiAwovLayHJexaLfbAzI5tdUsidQ
         7kNuMlLqLqXnEUxvCzOHpNQ0tFr77shWiSn29AqnkaCGqrzWGxGtQgfifME0qu62SubW
         zWpT/5h+ulVBnhTUlC1uGsc5KGUmKajYwfYu1Qjpw4aiaFB5+otr/YrYK5OGDVF0zSe7
         2orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153993; x=1793758793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ll9NzBFV0AYwGYRot8ioCuniDijkW2mX9UPa4oGfP3Y=;
        b=Q2xLE1CU9D6kMNGVCI0OYW/i0wu3RVQk6uibCGpIsn5ClQeAEg0IqSfZfqXtDl6m4Z
         1jzBvSzLdIyTWYQH9x/tB3zXVoWe4x8/ccex1qebNr++Snou6y9Bfxdr4+OL4gvHnFLF
         p2mtVsJbnVLNzeGJJinV4Ge71h1dkwGVj85EXhkdfCwzZSaTy7gN2lRbiNRyiifGy6pn
         tJn7o+Xzzn2XkJ1A14GO9bu/Wl97i8Kok8qp+RS8Jl1v+BB2TJathbK4eLc8chbajpy2
         AOrFXdfu0VxkiwEVQUDwnZnB20kAvt6N1BNjII8H63nD+IxharwDmptQdMFCMdp94luu
         BBkg==
X-Forwarded-Encrypted: i=1; AKwUvByyMMYKHeT/EOQ4WquPh7fd+7fWG+kAxcIB2/pK7+XmUw2pGklGWKiOxrtlSWy99FENJxJ3PLMVxKJYCfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYId7OqaUibyQCYZOn6MrhcVgxRb2QWNHdOTldfZokLBmSQLhPXh
	FV7kMy+ZNSiIhDE32LKwm3IRumLW30bWWw+3utGDV3PdNTDiJ2IRAe9q
X-Gm-Gg: AYBFou2lw9yW7zDjALdRxlkyZH8PEnQFDUNDEWmscOSEtSne/0X4rma+SVY1l1WHOFq
	yHQiduDBrHho/FiYdclrSW4FUw9y/3fVYNbezmWq9TnisaGVTveTG9Nrur9m7ARyEyneDHxf/Du
	XM1EpsKoOFhyYxVVL28lSEj+AqP8KLf3sqGWgXyxe4TG4niUBC6UanAlRAXAo/bs5LOSDyimNjV
	njEG62UWrx1KNf2ccdN1dRqbewQdIk3E0IxduvM/C8aK9y0UCOip9lijDPXvfBXqNjWX21fqIEk
	X1lI6yXbK0HdhCGXk+JqOvnppFK1lr50hZH3rBBf3tiJvCjJ7UGD/qaXYswhUnbCNqnPOkd8M0P
	0iZgvgWqostcZkXqxH3PRPHB9TuNIgNmsOiHRZVUJbdzjqJoB+RYxThsPZdPAKI1CxLBUFbfwbw
	n6csnfc7+yvRyzwQlxRnnMu7xUfpcfxMqFVWHHJIz8Jb5YwZRSplAvUbrafIvTFfNzKt217hBHD
	9MeolBpFAGSsgEdQarE6t/nKd7Xr4KIWCY0oVya6WIDqp3Ayg3tJKSPPubWzIdeqW5nM96ULkN7
	gPkKKVTZlzumj6wJch+WQX/byh7Un/Ep2v3HW7i9hnjKO5FCUjoKeQ==
X-Received: by 2002:a05:6102:448d:b0:7cc:1967:5e3a with SMTP id ada2fe7eead31-7d03a5e4ca7mr537509137.32.1793153993457;
        Tue, 27 Oct 2026 19:19:53 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f6ffce4sm428432e0c.1.2026.10.27.19.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:19:52 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] iio: adc: ti-ads1298: fix the data read path
Date: Tue, 27 Oct 2026 23:19:45 -0300
Message-ID: <20261028021946.29877-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025230601.6a2eae34@jic23-hlaptop>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-2-stephanbrrs8@gmail.com> <20261025230601.6a2eae34@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 25 Oct 2026 23:06:01 +0000, Jonathan Cameron wrote:
> This is a lot in one patch.  Can we break some of this
> up into smaller changes?  The whole thing is probably
> to complex for a stable tag, so focus on the most broken
> aspects.

Will do: one patch per fix in v3, the most broken first.

> This I'd like in a patch that does just this and allows the commit
> message to say why simply using a single lock for the data buffers
> would not be cleaner.

OK. To check the argument before I write it: a driver mutex around
write_cmd() and the regmap accessors would also stop a register access
from rewriting a command. It does not help with rx_buffer, which an
spi_async() started from the hard IRQ writes, so it cannot be under a
sleeping lock and still needs its own cacheline. Separate buffers fix
both without a new lock. If you would still rather have the mutex for
the command path, I'll do that.

> Complicated sounding solution. Can we claim buffered mode instead?
> That would ensure the update_scan_mode and this don't race and mostly
> would be taking an uncontended lock.

I don't see how to do it where the race is. The sample is pushed from
ads1298_rdata_complete(), the completion of that spi_async(), which the
SPI core "invokes in a context which can't sleep".
iio_device_try_claim_buffer_mode() takes mlock, and the core holds mlock
while it calls predisable, so the completion would also wait on the
teardown it races with.

The driver starts the read from the hard IRQ, and I'd rather not change 
that in a fix. Did you mean claiming it somewhere else? If not, I'll 
keep the flag, as small as I can make it, and explain it in the commit 
message. (The automated review found three ordering bugs in this code 
in v2; they are fixed for v3.)

> If we get a timeout, we'd not normally worry too much on old data
> on the next read. It's an error case that isn't supposed to happen so
> if we are talking stale data that is often considered fine. The
> second part may make sense - break that out as a separate patch
> so we can easily analyse it on its own.

Agreed. I'll drop the stale data part, and the unbind wait becomes its
own patch.

> > - The return value of spi_async() and the status of the RDATA message
> >   are ignored: a failure leaves the transfer counter stuck, and a failed
> >   transfer is reported as a sample. Handle both.
>
> This is fine but not burred in this giant fix patch.
>
> > - read_raw takes the sample out of rx_buffer after releasing direct
> >   mode, so a buffer enabled in between can overwrite it. Take it while
> >   direct mode is still held.
>
> This one seems valid.

Both become their own patches.

Thanks,
Stephan
