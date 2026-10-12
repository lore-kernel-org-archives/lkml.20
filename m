Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB43033E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813438; cv=none; b=KD2FuirOIEDXfH1MiM0SYOdMVtAGifah5n9EAdU01ODJTP+F+hKCgXWZs/Mx9iQ6ycEGm97FUd71ogtswcWOvL2eTWNZ/eXrDpIywUo8a/QzidL2ud1WxDbRirfjGBaHutmk/R0fj8nzDoVHQFGQRIFBnllIWJfeS86C5J9aYME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813438; c=relaxed/simple;
	bh=/iY5j2p4b5QwDQlKEMYgEYpvGS9pC1Ctd69uP/eW8Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHRwBh5/5MfMttcCzAdZMmgNdqWS0R7JsJkoRF47o/HNBM1zWC6Sqwn2zMFPDakGL/pybkosjfUFnR0XsTdkfOY0hbqMRxKRoTx/Dme1RZ2eof/e7eGBRYzsvvm/SXkRyY+2l1hT9wZNvZg5ame4t5wWch1d/1NnfXZJYx0Mv/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leArUqYg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leArUqYg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16c399641so19727025e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813436; x=1792418236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=34EJoNLsVra8nCHZLNhyhOI+5/614M9XjyOHIoY4piw=;
        b=leArUqYgKp6Zd79qG6MdtrHyxPewrSZjNC85UQSCUIvHmdNa4v2XkiKGyU9fWcusc8
         2+S/Bw9tm8LviyF+HLFf1yAA9F/VRweoQxLUWwEHqybMTKygMbvwLziu6lI+ryOoNcA2
         OEAL7DrsDrtn3WrXuD5hoWIfnHraHhBYy4agYxTutQzfV3pYmy6IhdGflq/1Q01LgJT0
         R9hiKPsNxIuQn27E6qN9oiLxt1lQZy6c70/32UBRLkfFpLKd3W35F9g1ElPAPTQ8wGyA
         IfwdPwbsCsGz5Tza8jNBFfvGwQiAz/z2f1tYZV4xyMNU5jPc5qYFDZq/dbwF8M2RuFmV
         jDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813436; x=1792418236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34EJoNLsVra8nCHZLNhyhOI+5/614M9XjyOHIoY4piw=;
        b=IXwCVSo0W2ger1WZpvvAAr3FkwiKNik98EiLANf86Yj6ywTB/GDyxUB7gCBpabJx2r
         C7sT23P+8JQUyAAlmsYiqOwKiqU36xQIIsaISa08ouvvSiusvHiyI+g/eLnJwuuQWDC5
         +SNH/rqbWsYPhllMBKbyur1Ug6w7bVJNREG4C3P9HpEalj+wxVK1d3PNLCoSFPc9U/Oh
         1Ky/hvSIIOzQ92uWxydKoSJGAqVio6pUIYjsCyHRF8omg8CAwlFRKc76xaURS1LlSbpQ
         Iy4DOk5zO4aIYMyz7sA38yk5HeuhUpB4jIwlOsXPozDTRiQ4HHyxcXdw/L1TIKGEe905
         yeMw==
X-Forwarded-Encrypted: i=1; AKwUvByNthUT1OAdaYvITUlmZYhZ1zbh9ItlPb20bLwT39V3DFYmkqNv7xA5nEMZtVU5ZOYULQLEmoXL70sihr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsBTkmdY7BKUyxlaDATin0Z4ghJVh6Dp3ai6pX9CS/0moHRVYa
	OBHEhsFXoSc5Urkvwd62MiNBlMeBzwtznWJPUdn6Jh0MeEDHTR9pWwSS
X-Gm-Gg: AYBFou3pj7/npX0F6qJbcI6/rZTEOQr0fSs4VwiuZF2nM0iFno1Yz4dOrIYUxt77APj
	wLxMJlb/8ffA8seRy85onhGIW6/bcOGjUXHG4fgw8lWFmwzirTsPceYoO4YGMCXC1dHU9ggFCoa
	AQsuclI9lyPf22bD8d0fGgtmfxYY+rCquvgQ50CvUSsGkFvMJtuenv/ieeq4JPWdX1LH0Y4dV+g
	YJk4JHw8yq05tnNiS7lx7ql0E0IwM7qAfK0j+gXkb7s16g82SBIzbTIhXv3eAu8m25VbVQlidjT
	sIyQsjE81AYVOsAed0qWIkwJ6x0Z2s9GzTzb73+k4OUT6uBhgF/7MV0KMhsIR92VX9aH6GW6nN3
	aMv2Lgey3R1upQ0eOJLElJma1fnc9dco3zSLLaMfdOd8DcDiYNl+QSNCVpjZMQYlWeRzX/VuCZ2
	fR6kFPHulvU1wGom7TiCjemQmpodLPvw8e0n+gL/e5FU3CF2YSDDikyuIMgAmSayfAH/rNC8Ge4
	kAwTsUzpS94Ve83iUZe+fwngZ2E23znP9nLhkmfY/GPxWXZyivmvSitiTsCtfeiOb2ump/3oRt+
	NTNBaQDfIzrT9b/CJPlIPFTvZL0431Tr4jkdFvQ8QhfYxPH/cmnPIFxqTsZomNOalsa/sQINN/H
	o0p8qu1kgSfMyLsWbvYkg0f2OtMsGO215/oyZsTvYZCJMh5aJqobeNnBg+9UnwXXpB415iFRyFe
	mGmMjwucZQT6KcjDE=
X-Received: by 2002:a05:600c:3b99:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a18e48eeb6mr236849945e9.17.1791813435810;
        Mon, 12 Oct 2026 06:57:15 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm539977905e9.9.2026.10.12.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:57:15 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:57:13 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Nikhil Gautam <nikhilgtr@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org
Subject: Re: [PATCH 0/1] iio: atlas-ezo: Fix humidity channel read support
Message-ID: <20261012155713.00003254@gmail.com>
In-Reply-To: <20261012114553.3327-1-nikhilgtr@gmail.com>
References: <20261012114553.3327-1-nikhilgtr@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 17:15:52 +0530
Nikhil Gautam <nikhilgtr@gmail.com> wrote:

> The atlas_ezo_read_raw() function currently rejects channels whose
> type is not IIO_CONCENTRATION. As a result, the relative humidity channel
> cannot access the raw or scale values, even though the driver defines support
> for IIO_HUMIDITYRELATIVE.
> 
> Remove the early channel type check so that both concentration and
> relative humidity channels can be handled by the existing mask-specific logic.
> 
> Nikhil Gautam (1):
>   iio: atlas-ezo: Fix humidity channel read support
> 
>  drivers/iio/chemical/atlas-ezo-sensor.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

No need to add a cover letter if you're just sending one patch.

Thanks.

-- 
Kind regards,
Joshua Crofts
