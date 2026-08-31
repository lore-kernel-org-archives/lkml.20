Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DEF31D372
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181766; cv=none; b=gCsXpLP/J69A/DqP9ZnpTzgzGDNR9DjTcZtErbp22YU4+t6xDDthRwiNZASynm0Dyq6pIMjivGuV/1USx2csXXInkRR+Y8f+rU8NFaPkccRmI8euEjZ9i5E3ltza7nbvd5A8bvZfewrU7jQVcQoGx2NHmu2TBRvkYAKqjMXPqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181766; c=relaxed/simple;
	bh=wEk/CSduIDy3y77BOhVW/7T7N3x8NruFyaCJSoC/otQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIzup/LEKVsBOmJtO9IsNXmZfSG4PCwV157k3Phk9nV7fKG94A/MJrGHbsa4ulq7Ir+2k2RhiTErLM0zsCb0ZgQ2WxyntTshRZF5x1N3xYZxouYyUZdSiLio/0tbkaNYCN7ltWxJxpVqJvxlRTYfuW/3cMwp5jrqz1KunxCbOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1lS+LTN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1lS+LTN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so25056085e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181763; x=1788786563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMImnaz5ozXUWY8puoivAmaKF1Q7q8KDEeU/7MhVTEE=;
        b=l1lS+LTNsFDonqNbTGDKjYk4QZMzAuRXQWM4G1flipAOiMQhzkXUphzj2fu1E/vj36
         ar1Vi2xwGaogpdY5tDzRCaqL0hjv3rZxCFpp9MOhQGLE58fGpFIrx6AQSnFzEGhzk3IF
         k7a0gN2dWvtpse4JHSRNLuTnspQ33EpyOSuCA+CWKdZvSTfc3ADQ/Q7GUiO+ishSW5/+
         zSAvFHDLFwzgH5FFfGIvHhpHIET1dlcNwgkvMbu6ccHXjjwwhGDm5puVkat1xxOfvNGz
         TpQ+EIY0ntVt7FoFrSW40oPng5nBvHKKbChQPckjxfJ807RiG6lplufxQlUY2FPyoMWl
         wtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181763; x=1788786563;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMImnaz5ozXUWY8puoivAmaKF1Q7q8KDEeU/7MhVTEE=;
        b=jL8Hk90Df3uIgSGG2BLIo+cBhHOuiRCrAvC5K7WW3qM5scWqrMww2N+xYqX/PfDhOC
         xg3SYjCcpXToGS2XukLFUeM/qxmgX3nQuQc1YzgsxwyIJP6rN3y4Gbw31OzyrjPvidWw
         AZtDz49MU1Q+GCH5wSXFZZV5N6dZR37d01fkTzkFkoynJP7+U+NPXDap9vyQObd9bQij
         ym4UDQtloPrM9Ivp3NWEC8Q0P2IJKf6jaD3SWv355/E7+NpQMDgBYx9tLjjVM2xlFRrc
         uminAOMylXWgsYqXnE21BxZueLzmFZgzrjvC/J3ZgJv7M97HpPvZidD4jCcmX32/V3QQ
         HLRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwgOvpAAZzRqsPGbdlws7kzKA2ivrgsEyPTFiNASybwNEktVgcx0mRKrMNBgS13O1sMWfr2byIqOB695Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lM6vY1BiJi3oVRcDbXYPdeDHGTsvkWvmMhPnkYbTTeoepf1JYk
	q+RV43mVcwNN4XzC6Ix4mf2pLp5zZGFbFZMad7XjHJd8O6C0k99SGdSq
X-Gm-Gg: AR+sD126v0huDWRn4R+n+Bkk5ECIJvKaVyjZLriLD02mMD6/97EbYhS9/TysaILOn6C
	QyH74OV9yLaQk74koy/+gviyMe+uoks+1YNOTPqIeocgaxrM6MBHVSRFVex74AemE4Uftm+RpMZ
	ov9dbPyxvHfwNrNKqqKFBEz5bRHszMSaBkQgnRnKZof53ziJgKpKFlI9nSHGNpHfWSI5RbLzvwD
	XadlLzEbTobLI9DPfSV8GU6EwG3hhzvhxU6YqgtJMJbvcm6WFB7CMc6iv04dJ5OQpUdPldbwQDz
	O7sniQPIv3AweP4JSzb8eIuiM5gR98O/mEsgtZQqWIGWrgwuK4naM+CXn7lrHagp8lJzN/pCA6Q
	mfj6Yf1ziMlUj6fpoCzltN4K/iEwkD63zRfErXG6H2ywzc9if8I5KB5hDaxCUToqz++awcX4wOC
	lCdcaKJvzfca+QSvMb5/pZfu/Uu/TKlzUFBvKogvPSiBaxhT2gmKJa6g5pdFOK92bKdctCrnI/E
	Vf0zcmr/W9r2wrDBMgTnOdsaHAeFnRbZ5if27FZfhCfgeKtin06VzWOEJQu1kRCpNvKBzrKtHfH
	uAGzXqNL+ILN2oqI+PxSoKyVGYv2CfeaRqs2I0qQYtnQ+R68oZB98uAQ1+QpU9SwLTaPgCHxmBF
	zdmIFLnCFW66yezPhdFojO60W2JBNMTr8WJEn2GucA+Mei1CmMJjfE/AgKEIiQhT9MYpVJQ==
X-Received: by 2002:a05:600c:3542:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cdc422c19mr9272375e9.3.1788181762855;
        Mon, 31 Aug 2026 06:09:22 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm318698485e9.2.2026.08.31.06.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:09:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:09:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger
 <martink@posteo.de>, Sean Nyekjaer <sean@geanix.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Martin Kepplinger
 <martin.kepplinger@theobroma-systems.com>, Christoph Muellner
 <christoph.muellner@theobroma-systems.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 7/8] iio: accel: mma8452: Fix use-after-free bug in
 error error path
Message-ID: <20260831150919.000048d7@gmail.com>
In-Reply-To: <20260831-mma8452-open-drain-v7-7-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
	<20260831-mma8452-open-drain-v7-7-22946812c928@geanix.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 14:17:10 +0200
Esben Haabendal <esben@geanix.com> wrote:

> If mma8452_probe() fails in iio_device_register() or later, we could end up
> with runtime suspend callback being called with a now freed device pointer.
> 
> Fixes: 96c0cb2bbfe0 ("iio: mma8452: add support for runtime power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
