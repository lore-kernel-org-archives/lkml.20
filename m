Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC74CDA36
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055515; cv=none; b=a+avdCQxsLT8IlMOJhIeCZJv6uCfroYBS/8bhzqRKhwQkpJmsolsf0oT+qt+yBJmIl9nUgZadry2QZDBxKEKyPq3XbY2qnvlX4RC/6GDg8R1Zbi6yvwN0QIQlXesRY6dOokIKnCeLqulOpzyXGKoSTcAV1TT/r9SPMjJCbDQzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055515; c=relaxed/simple;
	bh=wpQT+stmebXiL4mPACrNE8Fk+UMa7Okg3Oz2NpJ9XAE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqchEbt2H9/t9/n/1u8BG9dfrQracYUtkdwq+4Btq1gHOHvXBLm5PboZaGbuUXoD6QR0W910pVdBeHIp0IbXPAkjtxscM93l2G2uVhZpgdJNMbEojOiKNT89Y9iBuheyk3cMDIavJdZlQN0DOS6jMmphRftBBIO6QSTzRAtpSe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiD8dkO2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiD8dkO2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a17baef589so16304865e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055513; x=1792660313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37kUcIBmWaK8bzKMBQU/T3AglBZJLVILgXw3ivUKujU=;
        b=DiD8dkO2MPF4OxicuMtb4ck/BdVOSv+kAg1K83HlvQ7LqCa+k5BHCngM13sV3oYnZy
         OfUjAwgl8TnKdjOnyivsEJrFtiBhNSVAbidhVI9Ir6fagOpGU9ZJ/DrMDsX1I2soGQZq
         fF0jH+mZuPG8t+HrQp0VYtVaC1z8r5RtY+gGJYYD0Unqw3lh3Xp6tIoWAgr1QHpDxXld
         m6StTP+A9CPMYz60MUn7YvQ6xwxxfOk8H+35L+EvDQWKPaDJp6op4YFmzVtCJWpmz0Vy
         xPELA20XbfsEOBQHLKLioxHTtB41b8hlgNKs/ocEew2EGP+XcfO5yAbGjCrMGxBb6x6L
         MzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055513; x=1792660313;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37kUcIBmWaK8bzKMBQU/T3AglBZJLVILgXw3ivUKujU=;
        b=lXBk6iOlBuVQcBAvzCXyZFG8ly8pgCb44uPFTOuHoRbZoPSrnk8/lop+7BAuBtx1g7
         P4Mkp3ZbP05c9qC/zOONMso0jpsPRZWZhfsZJJFAhJBqCm69giEfVzQSABwD8J1Cz3+1
         PjfJ3hOf8V43PXijS0yPfF+aGtrGpt63jQ52UL3yH8IiazQw01UoQceGIWnN7NkihRbT
         WD1fTo8ctHLlTuQxd18nGKuuxAWfxgQM4Xfz2gczQnPMpG3p4p5IZiMl3QwrYfPvDZwU
         AR3h8GBSw8i4D6ZwYygGHYOQ0/RcIj2L77GALArW7ftQ+Jq7jlb9nhpnAPRQeNBdwKQ6
         lZug==
X-Forwarded-Encrypted: i=1; AKwUvBxK2eRwKUQF16vsAqsx1hRi3uBlbdJm7MwltzmQSpQzHxEyEuze5RGTAifOruLwOEvQrvVopdCyML8rovk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPY26ig+6NXWqxfFLbjfkPn31LJ+ksB2K4wg98M+tAzpGypTq+
	1yeaVhH6Sfc+CVJTLTRAqunMA3LTiJu19cvZIHgbPx+AthhEuenn9Jkg
X-Gm-Gg: AYBFou3Ban8Ak5htxbkU8vwHL2eALHoE4CEW+f4hZROwtFfUZXLOl3zjEUdGBZZVg2n
	B/YZsOJJzRO54f/cNWfJbFoGQm3dtN0pPTQY0BvoqzfPLpR3y7I07ZhI1ois0UU9Q3FV6TlmASi
	4HJcQ4/vrejP9XqFbSTmd3Nhw0HbHCmg0y0cx+QwxB0MvfJ9Cuw48LbKn9VTYJI6nOqcBNjLDJ+
	JWAqDhIoTSuUS9L5CnaMkREBvvDjPMHeq/uABEzKNjOXrU6Hql3QxsxeNvGXn2xOX7IbSC/CoA8
	SCdufP62RmYM5VttGnb7mpsew6rZJfT6zO7c2RpNXn/J/13MlURShnwgxJT/iAW8Ll2rCIBivnp
	YssuN46P+KIwSD26iAk6U+MasiCuhAlZmyvKkQl5h2uPRvGKwQv8Djed/seujxAoaOneOOViMqs
	8m3q85SBsG3So0exOrWheTEr/u8euds1Px0gmllIkhABEQS+/dQgVfw5GIhYM1ppWyqyxg+Q0y/
	c7uRf1ZMFanmK50dcBXSZIAP0ZpZqDFMsdGiPRXfwd7NFSEJURGGmW51O3EfwUXR3gpjfJeGoQw
	8BgjmHjf42rSI03GVZ36WI3AqDtKmLvXkFF9vZTMtscK1GGPV7YBne3cG8vcvMxfOm9hTgHAWOE
	uYGtD5Px4Om/vyz/FTi5QGvwR26nJHpjZdP27Vua2cYNMFaFFVXS1P28/5l2PIyQtNW3hV7f0IQ
	+4zOnh
X-Received: by 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr401130485e9.10.1792055512163;
        Thu, 15 Oct 2026 02:11:52 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67a080sm54179925e9.3.2026.10.15.02.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:11:51 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:11:45 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Nikhil Gautam <nikhilgtr@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org
Subject: Re: [PATCH] iio: ccs811: Deassert WAKE GPIO on error paths
Message-ID: <20261015111145.000065b3@gmail.com>
In-Reply-To: <20261014152250.8324-1-nikhilgtr@gmail.com>
References: <20261014152250.8324-1-nikhilgtr@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 20:52:50 +0530
Nikhil Gautam <nikhilgtr@gmail.com> wrote:

> Ensure the WAKE GPIO is deasserted when status polling fails or
> the data-ready timeout expires. Early returns could leave WAKE asserted,
> preventing the sensor from returning to its low-power state and
> potentially disrupting subsequent I2C transactions.
> 
> Route error paths through a common cleanup label to ensure WAKE is
> deasserted before returning.
> 
> Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>

Please add a Fixes tag.

...

>  	ret = i2c_smbus_read_i2c_block_data(data->client,
>  					    CCS811_ALG_RESULT_DATA, 8,
>  					    (char *)&data->buffer);
> +out:
>  	ccs811_set_wakeup(data, false);
> -

Keep the blank line.

>  	return ret;
>  }
>  


Otherwise,

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
