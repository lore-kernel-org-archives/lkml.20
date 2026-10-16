Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDB4AAC5D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162534; cv=none; b=NAsGrAUWdt/CYM1VTkZ7Xhec0I6JhwD84fADS4wzhIMS/XFMwqFFPAsMnTjum1Jvlz6P6J5nHo91pKjVSKIXoO5WGuJRx3yHvHFy51ktvjotY8bfyC698CSb84L7foiuZZHzaEW4cm5EfeA09qnc7cKWJ1MtlrrQw0ywtWk8VOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162534; c=relaxed/simple;
	bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYpeHMeYP5+VUK0EZscJGajmaIonGtHoQU7BFoVemPnNoi96jnhzj/3ZwvS1s8ccWWatAUqUus1SF0T9BHCJJXvS2iCCAh7y3y9yKcVvc/zoDysypVd0jei6BN6738xfdIH5p2z1ilAg/OSifCUsLrSAsM256zmzCVBhAL6Vtlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azeUESbq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azeUESbq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16c399641so332805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162531; x=1792767331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=azeUESbqOBkDCpB8Ky0uytp01D9QkVAe6Ab4e/Ah1T+BBUuzuQ8UQkJFiztpQcR6b2
         U4UQ8giy2ElHxqgO5vQ9/GUyQY34xHj/TgsIzPMMGnH5yoZi9zCqLYqHQFdFgGRQhhUn
         bKurq1chu3Bo9AwGSxRGgmalbZT47XBG1k5LkfVPuK+mtv2vAcyamAb/kaYDY3pzkdZ7
         en+w6JNs9SL1T4f7cgoKprq23cyP9Tfn+AqOp9ShkeVWaJuxQaxmBf1yO8uO7yZTpvGZ
         Rd+7bvdiWdK/iURLnTYkhm9mrzYWp/DwutewQK6ldVGpif/5IhSgYDliFekEcm0knlVa
         356g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162531; x=1792767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3d45SEYh6OWjaKY76Wdm/h0py2ZzLBTvjB7clZ6LC0=;
        b=vs+DuqQ/avLRQ694PIid4D2ZB9Vbn4mB/oswVU+91DBWvEKOnKP4D5Yqzqx61aNJRy
         2rUeETggr8TgrDLiILg8Wzqco6lndCm6f/Bo0F91NDStImIyabJGl5Djv56HKSdBGj6f
         Hd/zak2MBmA6Ab+Rrk8LebFW/5TKoaqZxDKglHeU7ESWIcqHgQdv36Sd0g1S9azQGkuW
         bQolqryl2c3g9+Q2Kcf9wJd5mrC4UBhZTLd2juIUIxK9+CsfMxi8Nw4frqNu+4k23RI7
         /yjAJTAC/2KdB9xNORHamjhYRaOvcm/2wR0WN5JNpTxLAKFa9ly5L7LR2gNh1ALuUocH
         KqPg==
X-Forwarded-Encrypted: i=1; AKwUvBxLnzepUz/mgepR2AHOsIBlA6tl5EmF0/JkhgfKOXmKhYYdgS5Dc+wk9F6ESY3mIY2P9qjpgbdH4xW8UAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtr03OiFJC70LWWATfmEs2DtPlepxtnK7fIndtFB/8+ixVwyoX
	x+8ixAbAxvBBUbZ7pgUe9S0NnVOondmn+h1kf956G5gfROqE8T3VDOPf
X-Gm-Gg: AYBFou3r4YEjbrXi61TeqZllWyPK45MddsGwdCWiKPrjh6ekWL3lNrd8af2pHJVBz6b
	Z8nWckXzaEuEjv4MXHphBGA/u1NDjQH7XsUyZ8HQjGMQo7eRkTqKBlBvNydajJt77/CC44MyeJu
	Gvis+hkiwps506rHRH1bEi9ixddt4mELinbsByMRgYVMm0AAtEIRDWsJhylwsjOI3XUKuKru8Lf
	U46Y3c9DApdUWed4Uwb3KcPjEz3qlTndgueTmZ00Z2ZbfK+NBgV78WCfgwIWLkBUyiz2Eb9X+Py
	YbdLKSujMmI7xCS+oCNLRDWt1hx13qu32YlgJnKWWSM0wZx6pblcWNJABxHVqkfrkRTlCuFIHUL
	zrNnHMj19gfN7ahFSmBQuHdbWDmDe7zVaKAdtzwXzhGluUC38OAay/fiNhBqi7loELZk6j/fi3y
	47RbwNlfP8Xc/wST8Ax5pKDeesI5NRyj7vJ/vofYoOy0L88Y1d6mbPjMUa8mVQvHwvt8cNsj0cl
	YEiYaAjJ/BhgbhBFlcASXdr9u1rCoR1+KPa+iB+RrXNqOdeDwGJ66SdGVX4CSVkuhSfd7plr+Q9
	D5GicaI=
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr1162945e9.23.1792162530858;
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm6324206f8f.5.2026.10.16.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Fri, 16 Oct 2026 15:55:29 +0100
Message-ID: <20261016145529.36811-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016070018.11932-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261016070018.11932-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 08:01, Sergey Lebedev wrote:
> Through the media device
> one test fails, Active VIDIOC_SUBDEV_S_FMT, because
> ov13858_update_pad_format() never sets the colorspace. That is in media
> next's driver already, not in these patches.

Thank you for testing. That failure is fixed by "media: i2c: ov13858:
Set the colorspace in the pad format", which you have since tested
separately.

Thanks,
George
