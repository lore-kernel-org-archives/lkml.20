Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657492;
	b=N1c40mXTrwAveAvYAo7gWis6AUcvCL7ATYQ/1jeEoPojYvF7pAhyLxZvGXL6DNQW+IEJ
	 2CxAV4Ok2hMyf0CihyVptj6Q//CEppNrv1uhcJg7v4u55+0m7L+k67zHT4bzcEpEfB+VI
	 DAQHMI2B7K33h+TfFMDJ9jENMaEG9U5A4tP/0m8FYwizW+lsGgyHq1niOFja9IRO952D3
	 vJWhwemlBs7IpZ9SpUEL3GwUCnHDUNqW4nNq8aN73auUFX+Hud7sRsQnFpMmjK72FybGq
	 U20rF6caia8ZsOR24Nv9uZljlyMcIpXwDjBTtdyxyT6vmTIyJAu41B7hF5LG6RvOhpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
	b=FqQFzev0+aFANOY4lmrMNlL936TriIESpESfhZC8/nzB7bzRONOXDMcugKmJIB1fHFav
	 AQ2wzcQiZquRLofx4lpP5ImkSxEM4pgs7G5jmCwveG8UoqecmtCLtQrH6KCeKsbFlbm30
	 h/wtT5c9siFdGOv0uH8gFvtmyBevf8/KpfLfT1emyyYPDthuEoWzUW7D6N4hxFhmFUAD7
	 V+UZRjjjf7zELZcwvMBlBCUrFuWbFk/eLeUpbZcl/RO8KYF/v0choSwwXodKrcIOKf4Rb
	 gw6PY/bG/3v0LYjvzTPme7qiTS9vTL2eznEGpIdmeml2htD6EP9zwVvVPlzcGZs41PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKHVAcOC;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A93606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A93606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKHVAcOC
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2738064e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657490; x=1795262290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
        b=jKHVAcOCtl0g3TbME2TVA8rBXQlEpflGEVNVnIu8kkRI5VOx8kaxiHhfwPDIO6LDSN
         8PliQDEjRwUhhPY9pLFLX1VJCV+dZra1+K56u+DxkRa+PG4pvRAIcQMeR4mL7K2TF8/r
         d2dHkwnRQEfHTw2mD/w8VsBULvHZ0MP1M/2IzPLfj3Z5SyIlVvLW4xz6ilftQu8yVdBZ
         JLc6cTJsOHmku+brJT0yxgp2PJJ4bKk6NT2MCQgZmYBIf6XbxGOXIDERe6V8nkIhKOO9
         VgmyAZd4C1NTszBkb6wphO5xC/8wPMS8WjD3NKLHj8nTim2zvxbOnjJKBjei2qxK8wHs
         leew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657490; x=1795262290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=biJ9EAFLEA1rR//T+aJGjeK6yGVa5a+nAsg2mX8Jh6g=;
        b=tJtuBawmkWDnN/Hccf+iGJWSwQmd8rauZWPL894aaIMaCfau0sTk8yjYDU+A9SDBAC
         /d7FK06XTiLd8ky9RMa/wx8YEIMI1xjvxvB2kNFwHH/WTkezG0zMCoNw9hqQ/uvlmLV7
         Q0E8XZans4za4HU8uNg0wG8yK1pKF/wDcZTrg8p3+qmc8ie3DkXjogKiHXBuBO11NAsh
         1RXJ1Bk6wgXy0qXAXDl2kNx4bDJVKlUIlv2yHcv+3xKkZBvP/MMBTMzJQk+qOzFUUltX
         YEr/rpP4c1E+skFcFy1xewFAEuj9fm1notrREgWDapwN9CP69hS8yP6bNWbkyIBijjBR
         kCEA==
X-Forwarded-Encrypted: i=1; AL+hErGkh4MZqw5Gjj/HZrRE7qzAeIQAi+UrKLoVeG9pq8heeg7gVnujy/Dn2iPTBb/FsCuTHVPUmnO7YumcXzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/isY6jzH6Id8+85FHOBbV2Bn1rLaK/owr6nInF5/sjdEEnO9M
	CZr5HeirlHhq1N+aKt+C6EzXOs7btNGFZNB8h4O2P5MOin0AaLnwxc1R
X-Gm-Gg: AYBFou09fuNi0qcUTDSAEsFv0lezgSviwAntPgqZHfshBpkKh7YRJCSX0ouBCwOiy1z
	+mnToI/4tQAjgjQH/c+/uYwUpZMa9+KmeIPHEHpTeGhaI9ymjuS58JjsrgiiwHgAqDHdSz/noch
	Z/Zvcp1oJQxSHd9YMi1d0fP4AsaV9y/8zklvE7fXGnSJdvKifFCFZB6YxnFBwQ5EZPumXIwW5g5
	tK3myODm3cX6vFH+8ETWUv1pXjsR/btWw5uVuT8iLbE/+oRUFb3UI1FGL4cPVfXStYXnV81VKjz
	iDAAgMN5nH+DGU+ZQ2WcFF8kYABVCoiyeBNR2E4DQd5Chc7tE5GPGqwMbHfOxUYiURVZL1R9wNo
	d4KLo537ZcolviPh8mODA4+BTnlubDJ8hp+2SpzO664mBy4P2VXJAK9mx15t7hVuLzNAilqF2S4
	BRIFzK4okkZDkd1oOR6iiXvnSyrtL/jHPVZeHNOpj5OH2pUd5TYK8S/GRjjD2hrc2iGx/E5Kp21
	FeLejG5EDAOuE8F7HFXTnuyZul/lj8qO8GHgW9L0YGlR6myvuCIqpp/BuMFOj0TUMSfySZx6A2X
	whBtC/TNe6myktT3Pc24Usxn3K+08yAIVgtIoHwEKf2x9+og8KVFHStXeG4cGzG5jsLXM6uXI6c
	/s0Rr8IwZFE6pKleJtf+pd8TDs5OrEDtNOVhmL+c=
X-Received: by 2002:a05:6512:1048:b0:5c1:5958:a7e4 with SMTP id 2adb3069b0e04-5c17077eaaemr1886702e87.15.1794657489552;
        Sat, 14 Nov 2026 03:58:09 -0800 (PST)
Received: from yantra.. (nekmmqusxj170dz200l-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:b551:8edb:536d:8395])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133c9d3sm1606436e87.38.2026.11.14.03.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:58:09 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Sat, 14 Nov 2026 13:58:01 +0200
Message-ID: <20261114115801.57701-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-214316@kernel.org>
References: <20261114083828.18059-1-zoone.rupert@gmail.com> <20261114083828.18059-3-zoone.rupert@gmail.com> <sashiko-outbox-214316@kernel.org>
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

On Sat, 14 Nov 2026 08:59:52 +0000
sashiko-bot@kernel.org wrote:

> Does triggering on DPS310_INT_PRS block in dps310_fill_channels() waiting
> for DPS310_TMP_RDY whenever the pressure rate exceeds the temperature rate?

Yes, without the trigger handler fix the cover letter points to:

https://lore.kernel.org/linux-iio/20261113230241.82046-1-zoone.rupert@gmail.com/

It is against the fixes branch, so this base does not have it. With it
applied the handler does not wait: 32 scans in 4 s with pressure at
8 Hz and temperature at 1 Hz, 5 without.

Rupesh
