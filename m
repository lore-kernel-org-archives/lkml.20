Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA103AAF50
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271576; cv=none; b=Wthm0cO2VOE/pX3Sy8kbSxe230icyH06X/LbHj9QWqXOldracDN+FupVH4KnIDDn3jWSzlRU9B2+6Kx6vlfLeCKHTFQBIcvz86Lv9pXkZza94tD/Z2pMLo1JfnqKt/5pHiiGDybsWeCkCgGTSc/2XH+e53bH9jEIyDQARX70rYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271576; c=relaxed/simple;
	bh=Ay/fZHYjGdbDCr8vOe8dvJbQunP445iHJfS9K/uXrjw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=quQBa9PvmWbQsF7p89HENQh2bpX3ZRYAVftGEX1pJ2KLjWcWu9mOJ5EhuEtyx3UC351339efXIpGopEGa3rlUpy41/ZLL1Jd88s9MEyfdygqMw5bOjTgRycqPRfO1Ij1KchfVztx/naVNL2jImAw46gNrdgx5gSF/2k5F9D2Rcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZXPMu5V; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZXPMu5V"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso24694335e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791271573; x=1791876373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XpqVovb+d1ZXBKXEK7/8benV81UO23MTvl1ryC8HO3I=;
        b=MZXPMu5Vs3D91UMiimc3j+grG7OfKbFWJnOEkcroFFlsygdcIozYUb1OCT9nXab+19
         u43UmejZ+MCTK2LqseIkBXxpklTmjgEzwcdIbTi1nuJhxKJZKiAofZ4U9i4UGHiSWnR1
         yezOSsWoYbfEGugURfvFasKVcs2H14RNjal86heIeWtzPhY0DyJVMnl4f8G3NhOHPeto
         NkuxBIJ6vZkZS84LF4HSW7K7wYeaqsRqbNuVuOsIBTZqZC1QAisPWXS00hpXftYA/jiv
         GpkyJNOcCKXKe0dKyBnJTWECTfj3lY9eJUCY9l1/xGkl3cny7IRRrtPENe4QTfkrj2yO
         3l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791271573; x=1791876373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpqVovb+d1ZXBKXEK7/8benV81UO23MTvl1ryC8HO3I=;
        b=vpsjTpAWCsWrpao5dvRHct29DksfQh+DD6o95m7ePx/glFF7d94XuDPrJRFsOZMSf7
         g8Tm9HABo5S5bmwCUSLvXbiEi/fKyD/OYhPgIcSttHd0eq6FvqGix2b52ikz1JkwLJYn
         bF4KfbnqlRYSDx2Ohuslc/miplOlI5gwxdZrI6w5xox+4Hj9tjnPlauJWYhH/4Nzx3SU
         dkXrjvQep4nhnwdqlLDQp++IZo3F/ZdlCdPoMTwDtfQXtKynodMSgzd+fyNW7tRNRH6D
         zhD26BbL8+Wa2BISPFCWSOMAXF40ZeZyA4Zz4H56NHVqzgbHjV+2oeCCV5C3qjXob0KY
         A5Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwkBlXhvF3emZHXPvtvNeZ3g2Ocy0qNImuVOQtZtU3R4BSsJyclqbEstwAgLE3QOX5KtOs/MoTTj7lE26o=@vger.kernel.org
X-Gm-Message-State: AFuF++nMLEuT6eWuQABB55lrfBr55foA55isDxUe0BA4kF1pNTuQ1B9L
	c6CJ50A6K9GVdJzzCkqhAvbA3W3X4Owtzt16BT6OAYe9WySZfy0U2dFu
X-Gm-Gg: AYBFou2ziri7MLFmZuvZ6qnWScIlpMu6cLiOautPfR33IMjAA9N1BRntCwEsJHCszyp
	Y98QYjcngMTeseM8yv+R3Suv/NKWhJ4agRk2MPh9KIT5xLAZsOQijR7N4OaMLFuRdw2ft6Mab2a
	4OU3iEXtAGUbHhvhKyyrawlV4lFJCXYOI+UStdqTVoe/WK+BypfrDJnxiZWKU6LQzWagRKo79hk
	l1xwzBbm6LD5zGdhMELcXm6pnMIcouciRhdJ8V/JVh5nzRDTgV2bRGeFzGYvZ1mu4ZaJccprLTm
	UhAUlJ/oSjFxUhLllS2Iawnl7rjhy7PJSJL94X5G8jy/k1E0cSxSWZ2hrH/n3qMM2M2+Pd36F90
	3arK2tklWPOx1dEK4Q3d6SZDrJT7UssOpcX5SOrrQgfFqOBWFLWSJm1ff+rfGJQabiXNQzq0nOb
	JqEeOTsK2BwtRZkgZI8O9CHnHveKkrMbVNZrKwv/zNtMT4fFiZ5xI2tZ02Ho9lYdM+3hiIK0MJG
	b1moJ9IMr2SF/mLQMcIex1a8QZvoBAb/2DAOj2ZL/iqA8EUM4kKtNuDm0quKKHhmMIqTiCMThg/
	Ok7bYEldQ9cpWjMQbva7xy7T3YUsdOKfWL6cEpZd3+o3xEUwNKcRialbTZHTgMpjAf3SN3+U5X5
	puSDHSme1w+qk50UIIb8B+34GjZmmfE29t3ht/iXA5y29wV4eYA/sfO/L80SRXk6WBxjEV1s5Nx
	Zk6Vyp
X-Received: by 2002:a05:600c:3b0c:b0:4a1:7733:5102 with SMTP id 5b1f17b1804b1-4a17b541311mr8420715e9.15.1791271573266;
        Tue, 06 Oct 2026 00:26:13 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17bfeb65bsm6305735e9.5.2026.10.06.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:26:13 -0700 (PDT)
Date: Tue, 6 Oct 2026 09:26:11 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, Eddie James
 <eajames@linux.ibm.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Petre
 Rodan <petre.rodan@subdimension.ro>, Matteo Martelli
 <matteomartelli3@gmail.com>, Marius Cristea <marius.cristea@microchip.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>, linux@analog.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] iio: use designated initializers for
 acpi_device_id
Message-ID: <20261006092611.00003462@gmail.com>
In-Reply-To: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
References: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 05 Oct 2026 15:01:56 +0100
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk> wrote:

> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member
> 
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
> 
> Tested builds on x86-64 and a64 in Yocto using 7.3-rc6.
> 
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---

So I guess that's IIO done when it comes to C99 initializers.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
