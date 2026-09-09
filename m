Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576E2C3757
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961535; cv=none; b=Tb9TuRfoYXNjM7JCTKlFqMxnaRz6qL3kaY38PLF3leOpM0WhO+/fiNTzSwfWmd7GREzSd2nbBoXxv9aAb/bq1XwKB7Z6LmksiEdxLFt02Vszfo0YO3c72bPoimkXFyoTuO++qEQYoWVqPyA/vU36CHpbCKnWOV/MT2jf4s28w0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961535; c=relaxed/simple;
	bh=i0VT1OqBwdS71Uf2IVo6PfkEcn4RaE4yYClA5DJrApM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TR1GsOfWg/uRS2L+rwRIBRnD8ZQCLxHJ+xPq6D4TInrf83kHkfNeKpy/lzg7Be9rHTsdjlAlLVnjjJKqtTTqi8c4raUZizvasowaQQNsMJ7cXrQc5Sgbo8Xa2dfgMDDXgvWqmLK6toR8VQoywQv6aXmOm8bpvOoqBSdPztjyzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3CzoA5s; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3CzoA5s"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso48377765e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961531; x=1789566331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8YKB3/dJvd9GLizbpdWgBqtE5BIptbKHlbLLtYjluU=;
        b=f3CzoA5sQghKNhyeFM0SByTb417WCMUIosqI9SPLPTaFsENGmWVMlyNfajctG1FJOA
         gjqLXKsybDbQzNB3v3siu4ydu1oEz/QMeHcQoZgOK1I+RkNkMidEB9v9CfwA/6Y/ze6b
         uR+Go3acgcl7gw7GjmpEHyN3GVXOh2SKLtd0LZBunrzsbvkVEaY25llAzbdChYHzyJCG
         oOfPvu7QrBeZ2/HepX/0mrWPXUCEl3ZMOnRrl2peLFtNIvt8F3fmhE+0rtQdftTMMhCb
         BcanwuhEyQkzLaQeF6rzgp4yalzfMV+Iqo6qAlNV0v6T6Bby0RrM+2sFc5Dyb5K8P2kM
         7NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961531; x=1789566331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8YKB3/dJvd9GLizbpdWgBqtE5BIptbKHlbLLtYjluU=;
        b=n644EMyABlGHgJT57MtqB38plLalJ6RtLE23nTeDOlPpWAU2NMuRkBQd+8WPw7VzYq
         RK9d3Ur8z3GzbJfeNKfkd/8uMUP8bBqp4kIf9jn8e3jQgtOSbn1sf+p9BgvboPe7y1iN
         P0xs2i8UYQCQh91jkFyLD74HOjNZZubw/+OiHax7qpWE3C3+u2TXcwayvwQOzV1+y5g+
         cW7tfkyDYRRZQXIp9ppjmwpUE1yEzeUhn4HPpL9uhxSFfy27lTuUm0Bjy3DM+M7eWYS7
         Okw9f4lUDCwSigQVkzFMDwblKhOzyK188fAJOkq1Us42Th4hafSxPq8yYU6KAiumuC3i
         W1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxT0Myu7ewttlr/86XFeNJO5BJTf+d57miCbXwm/IZ3HAL1A0yVuoX7adhwU7HmAdpnjYeWoZPvsl0ycmc=@vger.kernel.org
X-Gm-Message-State: AFuF++ntJdK019l4lR6klBRQog+qW6ZH+L2XnYv0yt0O8IzikFXfD7WH
	Hg1PnKbuZQNR/ds9SO1w+F/2ELcilynHcAX8nvLjw0m/MesLy5w+RlqK
X-Gm-Gg: AYBFou2x7MD6NdAQRvgmS7s6HtwE6d1o/Dve4DerOF2myuXQbAFdJKdUYVN4Nix+xtV
	qUnPnDaVzULyEhby7J4v2uWDnnNWpOz3SouolEkb1vBN4nPWeTt82CqZ1omChqNJiKh/k5g3lfH
	oblTcjcWCFT0O6J62V1YhRM831iRcn2SCpBnd/SL0UN1mcyH/bXP5PFWWrHjOBemu5TgaZPefM3
	+OcK8zDt8TjzzukZwY7tTiJEjWhGCeXJ9jg56+Rmvpb2YJ1cdOfunYUlnH9e/GquKWuGba2gr7R
	q9qvjiq9VZqyc4J2T8I9aR6Y01NLJxHtiHgrwfMOT/C7AnyFM9N340TOJay9S94/obLhmXC6vio
	sOr+jnJFrR072KDpeDGnc/EIZ8jwpgJGMt2ORP1OKtDllQ3RKT/C3sKESYu2x6zkSVw8aS64Zja
	cdu3nTp0i1X66qIMn4PnYTXu75Qn8W0vWNVhfMs+33spSq8Ptn0olXftfvB0TAw3A9qDA+mcVs0
	8x+d+e5xPh2EMqC/YKQiOWcFiOcPgEq+IZoyOkpxpAozP+l320bgdCw333a7RJUCML0EBtF1p6z
	WSGiTnMX5cUgHwma81XmU3app1CrRcXVpAxb/SkA4ZbzJbaWkGVF0s0J5TA5eH9nojD71fcD+9v
	+EUksHUKPWfqZn2sSY55jYVhgg2VbInn9kYGTFNW0jlEbRHoq/6FpQN8/Tls16/tZhAh0mAP6m7
	/GBR45
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49cffde8d95mr318555215e9.23.1788961531014;
        Wed, 09 Sep 2026 06:45:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm36848889f8f.13.2026.09.09.06.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:45:30 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:45:26 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kim Seer Paller <kimseer.paller@analog.com>, Marilene Andrade Garcia
 <marilene.agarcia@gmail.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: max14001: add missing MODULE_DEVICE_TABLE
 macro
Message-ID: <20260909154526.00002640@gmail.com>
In-Reply-To: <aqFhagdhM4Z57eqh@ashevche-desk.local>
References: <20260909130304.1395-1-joshua.crofts1@gmail.com>
	<aqFhagdhM4Z57eqh@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 16:38:50 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Sep 09, 2026 at 01:03:04PM +0000, Joshua Crofts wrote:
> > The MAX14001 has an SPI ID table, but does not export it with the
> > MODULE_DEVICE_TABLE(spi, ...) macro. Because of this, SPI-based module
> > autoloading fails on systems that don't use devicetree (e.g. via
> > spi_board_info).
> > 
> > Add the missing macro to export the alias information.
> > 
> > Fixes: 59795109fa67 ("iio: adc: max14001: New driver")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---  
> 
> Changelog?

God, I should start using AI to check my patches before sending.
Appending below.

Changes in v2:
- edit commit message (expand on module autoloading and SPI)

-- 
Kind regards,
Joshua Crofts
