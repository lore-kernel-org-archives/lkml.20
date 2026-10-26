Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993878;
	b=GbBjJOyGUCIESHC1zQchLMWn74+eV+72osMxc3in1717zdtDhXN6RPfGpGF+3BDfhgfW
	 AljSJS+S8YWj+0xOT4Gs/5eNroFONEOHRh005mYl1LtMpQvtV9oT9L6t6O9cCV8cr1To4
	 kYjNKJI7VEnWGhmroxGTJEdz1YFMbekxs27NNhjXCu8FPmyZM7SC+5yKQyksBFKJQSl37
	 gA5puzXvrDmSOezwgqaQCqNZMVTiV+ZtE4KpO1os2HdDQsSwPeKsjcy26wzxJoprGmf6/
	 NAYulJwF2Ktnww3eSk+q3CF4QOSIF4KAEOqNkIsWEZTycB5SSm5O+1glDsgAAO/KFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pIYmeiFuvjcdTNw5HWM6jYGl5dGLFIjavdG7cGYxLu4=;
	b=lUtRkRNSj1C1Pei7IvFSvAP+8ANXKrWZYBrZAMsgXJGlseOZLgLEV5CYRhcP3s9jwtum
	 5kPSqCtYCjxmZOpubUt+mwiz5eDupj3u+oBoFzhmlel18RLTMNn4xeu7xgDAjLIsERDOL
	 A4MZTty9/kCUSKfxKkc9RGzePjbx6cmHOiqIO7AWdsed/E1EvM01IthCzxe1OYylXDQ0c
	 wCzbK9VTypz6J7kwy4nkLH+8+xuz0TlCNaCCp2F4vHcLktsS4HbkjqGgg5bgUAMqm0Rjn
	 z0QM9Mlw9g4rTyujo8jQuPmjYNYRJKEZrR1gaVaGHCch2MgaLVKadlBCoo+nNTDxGaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L1RY5X3O;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C87B606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C87B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L1RY5X3O
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20292015e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993876; x=1793598676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIYmeiFuvjcdTNw5HWM6jYGl5dGLFIjavdG7cGYxLu4=;
        b=L1RY5X3OEu/ECGw/km+1vHQJOw9GyiOk+368VjlgLjqvCd1Uul1o9+T3KpR39CUcz6
         eOzyv7yDZgnAahPejnM5CMs4NVVzgfJ4rhKYuQEImNVXDT3heDdWoslgf2QJKrQ6y/hd
         ndugS/lJQGhKDKPa5SqfrEeDnU1HBSinY6JPN0CNkcMnvNRRPJPmTPXE1wfDbLzyORkC
         Hn2ZCPPegcME0t9bfWOQw9qIxBjK23WJ3mcCxpfxL6QgTFd9vBQRrHaY4B5666Yrmd6L
         iYwJGA8nY5WqJhGvV/jOxvpKSZKL36PJsSyjv7Zh8C8DWdwpHwRmghWi9clC3GCSvweC
         zT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993876; x=1793598676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIYmeiFuvjcdTNw5HWM6jYGl5dGLFIjavdG7cGYxLu4=;
        b=qRZdBf9UTQk/RxbPbqjcv1gBvX9qAQR6/244e9xHl7ySSqvhJz6miKyy9BbFejKMwk
         1uLJHextBqVC/wIJaqOu0j+KYI3zEARcVkpNmVucNXcUVWAfQU/BN+3vHWg/n77cYLAy
         KiVUlNRUj/UZcoU6W6OC6LHLel63QLUMPPI80RT/UVmdCG/VHeX24+NMfL+5OOY9XQFK
         MopxAhneXFazsTRj/m9nBxxlu5A45G/bIUjPCPB8thbin8DX/Gk4ZIeHRTtrzDCR9sP+
         DRw4pGhaR11wUjN/NQGVCxhmouZ45dK5VYwZBbLCDoRyz2G5eoIkOil/hpoEr3Fh14/Y
         7IBw==
X-Forwarded-Encrypted: i=1; AKwUvBwc0DdiYarKKbEX2v1ONgv3JmO/dFLSbINPg7IAx79S7oFqYSicceIe688jOyykVHWGR2pkrKSybkvm1sM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTFCYXRSDPV+hzQOO/8S92OdYdMrqCGAkdFFs4mKOym23Qg+sQ
	wzaJB0xiome3LF5aQO/gJqaJe1cuWvogANeiemPicACv+FGRlE+SWDfl
X-Gm-Gg: AYBFou0qu6v0SPBY5YJjsXnNtG24V0kKDaYsFs37Qvn17aQjtANd+jzS/BiCDZR2gce
	4t7SWGpATcqepsq/aO2grpbBMrbWMudZRl3igMsrJYxHCzNFfhPrwxsee3zQl3FSyrCZQ8R2a4c
	fVto+GBuASKx6M5sjw+PIa0QA/sHMvQlP7dzCnXNBGl3LcsrKqectTu9Dej6qMSsLu5sZOUvKVh
	sDGmMW1DcE995/nkefYKf6CE7wV5gtaEVl7jwaD2Z05Nl2yOSaky5EzT90Y0pqk1URKhBKv8ZKy
	RxiW8t5YwhKXOOAwRsOFd+Fu2RJY2cy0elJGm91rjZcCxBtAWrQnQ1j0h84kXjsxSyFasEuxlEy
	SFKFZEQSyBPl6UbkUt+wrkcO7wRaiBGLo24kCeLW9qPgHaS/jdD1mBoM2foZOeQGcDIu9VWB6Bd
	mh3P+LDdPQC35AowM6bQAKQybpHq00PLJKOTiCMMZoU9+Enle0fYHNJhFwa4Vv1K/Xrj1VKkEnJ
	BZQgs1lt65j2Mgxup0IbJStwmlv50zRBNIcGqg9GURBigFG6b+zlD0JuxPH9SOrpnfEh3TCMM1K
	Qh28WA5m3MdYr9pe/lFTm30jJoqwDaRlvQ==
X-Received: by 2002:a05:600d:82e5:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a35aae3e29mr133995505e9.0.1792993876421;
        Sun, 25 Oct 2026 22:51:16 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.250.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm13877419f8f.34.2026.10.25.22.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:51:15 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: iio: add documentation for ti-ads1015 driver
Date: Mon, 26 Oct 2026 07:51:11 +0200
Message-ID: <20261026055111.4572-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021202210.7d70429b@jic23-hlaptop>
References: <20261021202210.7d70429b@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:22 PM, Jonathan Cameron wrote:=0D
>On Wed, 21 Oct 2026 09:33:50 +0300=0D
>Flaviu Nistor <flaviu.nistor@gmail.com> wrote:=0D
>=0D
>> Add documentation for the ADS1015 ADC IIO driver, which describes channe=
ls,=0D
>> IIO attributes, threshold events and ABI usage examples.=0D
>> =0D
>Hi Flaviu=0D
>This is missing the 'why'?=0D
>=0D
=0D
Hello Jonathan,=0D
=0D
the "why" seems to be a misunderstanding on my side. I had the impression t=
hat is it a=0D
good practice (even expected) that each driver also has a documentation (as=
 I see a much=0D
higher driver doc coverage in hwmon subsystem for example). When I have sen=
d a patch for=0D
this driver adding label support I observed that it has no documentation.=0D
Now is clear that this is no the case (at least for IIO subsystem), so plea=
se ignore=0D
this patch. Sorry for the noise.=0D
=0D
Best regards,=0D
Flaviu=0D
=0D
>We don't tend to add per driver documentation unless there are some=0D
>oddities or unique aspects that aren't described by more generic=0D
>documentation.  The actual features are all discoverable so documenting=0D
>those rarely makes sense.=0D
>=0D
>If you have a reason that it makes sense to document this specific=0D
>driver then state that clearly in this patch description.=0D
>=0D
>Thanks,=0D
>Jonathan=0D
>=0D
>=0D
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>=0D
