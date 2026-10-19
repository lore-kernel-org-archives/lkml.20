Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0C4FFA3B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419411; cv=none; b=pNP+uv0UwIG+oqPfOch7UcLPHCM8Q9JumHvVjc+woWhNwNnMZRKkKlTvDUYK5xJF+oiGnaXDFlJiw12yymIRAyF81Da+ToI0dzsbl8pyQyR66/uy87rmmJCKePJK1m/v8hxNqsCBflsq4vx39pToSgPSndT3TY+1NmreqEm3bU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419411; c=relaxed/simple;
	bh=fla1bg5rcRUTQWm9+7n3cZD9NexmAMaAbCKTBZoJQIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Taj89oUe3tLKgfEVdkZbzCABVq5E07F+4hYwIim4c3TpVU3S1Xl18WPZHO1GE9vzbQWGTGDYfktegohZBVltBjELIkTCb0aRcj0Zwlz39w0dvrHn8y+uV1GGYyuS0NLR4gaFUjCGxcT2GgxhhOECjcrbi0dJ7UfjTsphThYGhYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOZPcbit; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOZPcbit"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bce4e278baso991228e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419408; x=1793024208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fla1bg5rcRUTQWm9+7n3cZD9NexmAMaAbCKTBZoJQIo=;
        b=NOZPcbitfI/gRFl44pTbWnKVzKx1aTnKaNXsXTm5yxVJ1/MPYRps8CMCfZ5GaC17vB
         4fqDlTY1xAvyxrLAr6KpUIWhYy6OX4M6gSik7KQcXphS6dHQWVlEwcI/lTXpTVtRfdDU
         9C3mX9DrhTMRFc9HhfNtYS6TkxeAV5a7Ozz6wYjV1JkOx/gCUWItB7nrTwHqyKSptJBv
         LbpsdzMFZOjkF0dxeBJCJMUaezvD7b2PcotCA9HgHgc4G1qZL46+FyAX4aMzlTydqWlA
         MHB+HrJjSONhmXQ5bmvoY97UzFwEv8QOcaO+YDVntW2IKlcHWnPEU+Hq0qOoR8m7v8+t
         jnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419408; x=1793024208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fla1bg5rcRUTQWm9+7n3cZD9NexmAMaAbCKTBZoJQIo=;
        b=XTazLzQwRHIjQD4/mTgSB2dRZzAZStAavy5oSBCfA9KeBLXGACMX6dTGRoLdWayVDt
         XwYjtHxifkYfni7uFKLGFs+u5XUFaj4Bc29g9cVqnImuca28RLFqlZcQHamGyhaDWHtb
         P/390Whu9R9wYGdRE3uBXrDB31MYpWp29lBPgEYoQaEWwn9KxuNrPqTUHsyqyGEFPH6z
         4VtUkO/k4VAjFuF5HaMVeHz7bh857Bhc0aWnXmzN2Q0feuN3MKUsFKehcc4q5p5AtEQ+
         ekVfQDhMGQsRF3mTcQuAOyfIui5oUOKyVS+u0sdirMAPe6beEmQ42MtKJo9KJeNhmqxM
         X9Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzbUEY/smuour4B6YrEik0jm50X6Zos7QfcRZfzcowSpK59I1uPnB5IEE7rq6ra85mJhf5ANh+GME+zu/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpPEFjz6cm2fWzr3NZECRWBzbbVdD7SYQKh6xcZspa0RKK46sp
	1MukqqtHwsh5FAM+vT6wYwaVi+sE6uNj0EgHkqe3hYyOQ0ewFp2A1i5j
X-Gm-Gg: AYBFou1VT088NHe9TMrZ4TfOarZvJo9eqN4iUCkHuEBotr/P9/+u756WEmLq5K7nE0x
	L/vjeA0vHgOOnDnLMQBu2/mVsBQOSDUO72uEM+QiJRnp1JlPKeko9QTmczeRPt+yZog+k5qBZEP
	McC8LPyl/gCr9BnmCEhcyalU7buVDMZRHaQxuhky+IFbOalOnEdPA4qOcYhzTjOC0UqA19BmXZ9
	9UkWVIl0T72mVahETSLJk9jsGrNVcRpE62m7J8YDuhuvN70fS9bXKcigzrXwccA6942Bl4PtOZ9
	p1Ha8Eor2zTlaOgVolAXy82lW/EZquDY+2uBBTsmOfvsiRIg6UGuxA5rDq4TLESI8gRvnkGDe7t
	wtIjeZmnoXMkI1Q7vUCl3aNb9/kv9S2ql8lQ/8uhTLCiVChzXU8dX7xAn1ASw89q1T+VzphwZz1
	eyeTS7+0ETQBWFMuyMV1nEn28PXBm+KLY5rWBK7Jft5AmBRhGf/LHuAvQpyQ+asNEZwl4dpJCo8
	NbWjEy2mAOwINNE5GneDzGa6EXVrH9rInOdUNzyTv8rrJ+y4mY5GPmUSelDlgi3Qxk2t3YBNtlM
	6rrkAiA=
X-Received: by 2002:a05:6512:3b99:b0:5bc:f2fb:f4be with SMTP id 2adb3069b0e04-5be475aff00mr3545839e87.6.1792419407901;
        Mon, 19 Oct 2026 07:16:47 -0700 (PDT)
Received: from yantra.. (nekmmqvd1y84bxeinum-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:da13:4805:c131:eb3e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a4347fdsm2097591e87.35.2026.10.19.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:16:47 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: paulius.zaleckas@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: Re: [PATCH v5 0/5] iio: pressure: dps310: add Zilltek ZTS8032
Date: Mon, 19 Oct 2026 17:16:46 +0300
Message-ID: <20261019141646.49599-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 11:36:15AM +0300, Paulius Zaleckas wrote:
> I have no DPS310, so patches 3-4 are untested on one.

Tested on a DPS310 on a BeagleBone Black, against iio/testing without
the series (dps310.c as a module on the board's 7.3-rc1 kernel). TMP_CFG
still reads 0x80 after probe, pressure is within 1 Pa of the datasheet
formula at every oversampling rate, and the buffer tests pass as before.

The board adds the sensor through sysfs, so for the OF table I also
booted each patch on QEMU rainier-bmc, which has an infineon,dps310
node. Same output as without the series.

Tested-by: Rupesh Majhi <zoone.rupert@gmail.com>
