Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767996;
	b=vDiV/g1LXry1915dsz57qszMVjttsXcMDkLthky8tO7vTRSSGMSQ9L7jG3PdBWKRXhJq
	 GW7eOj+0pOLai43J/0HO5KyJh8raBbWQWmGY6xzN1TddRnA9QXIhmhpnefRNMQt3ZRlIa
	 RgDAfN+XTbfbtO4O0Z6SEckBJDjmlDXgFUXPJYEu/8NB+CN6ck6nLLtW3aGLb/F61o6gH
	 qVkhWLZlukKDauv65HVq9mAvLEf3LL/suP2dj3arNZI+TKU8XLWP0TBW/vxXIi4AigaF9
	 0sx2L0ObeigeY+eTESciWYjCKxhwG0ABu+cyH7I1ZkCcZhjFMCtd/AeWr3TbL3psxLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dlZpADIpQe7KCMb/+6RlQ2VbIrVPTUiha7CxAd+TEZ8=;
	b=31drE7u6LnypqezKiVpV9cR1ujic4uQVqBtSzSVJPSjsW7j17huTYai6JsbfpZpfGNfP
	 M9BUAcfCLurBZ94DT3kpAdzSG1MzPDDGEwjYjtv5wR0x+PL4gMKJN/G2e/CfqZxbc8us+
	 MDuwEGV3nrun6yrWuG8mcWfmtGDCevciiljADYLo5CM9UKcbmQX1b4u2T0kx0PLwmYpbg
	 GXsAwBiHruHmjCtfp4ijvx3xWQLPquw6ixunbTykRtnyBScgjFlrFPzCnzmag1LG2NjwB
	 PGQqIAikVoLy7qiLte4+gPnVLn+igHKGI86C48UvgUm+svHVerA7ShXiYkZURo1Jhew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlJps22F;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAB606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBAB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlJps22F
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso2943597e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794767994; x=1795372794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlZpADIpQe7KCMb/+6RlQ2VbIrVPTUiha7CxAd+TEZ8=;
        b=VlJps22FPn47sddPz17DzkkRJRee5hZY1O7X22u8+0EcgI5CnnvVRxSakufd/WoG2H
         R8WscVnazSdfoSPaKXgY2frrGTQczJ7TJX9G6NOFKhxRjpfYeTwSNymp6h2DLrKhu3ku
         pKuLZJTtpEEBLeilit4PtYDtflgYqkA+xxGqygF//R7oSSJx0+Csv1kGi0AchKXktmcM
         UaU7EyHR08uSCNV3l+o+kFImPfPYHICXivwG8NmMQLN9K0+czNEETaDHKr+7IbA2oafT
         F6F3kw8gZmBHjaNF1aqA4ltciHIBjY+aEER0Y07OTWJkfR61OAoJ694GKj2ILCfkFCDR
         EnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794767994; x=1795372794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlZpADIpQe7KCMb/+6RlQ2VbIrVPTUiha7CxAd+TEZ8=;
        b=ynkrtMcUO1idMvZxdw1xLF+B9zHP0zILPdEPg5boI1v6Ychi3LouYzVxWLnsqKA6E2
         WW26mTktnUsCzJc11kSqEa4ov+c1BLGDUDI74nbBh5Ts+7v5jWF7v3WLJbw9IyMYBVWU
         yXBRN4M/2NZ1qlxCYf1CXMZUgr1HHoSeeR30JVxbRXBXuxYpucIhjlyOecwAU7NRIn3G
         OLT160G9MUonX8tyaJ7dJeWlYFRDSrzRVAuguqaP2r2rF6aaAI4YSuAh5S4F4O6Lb1KJ
         VzZIt5B5QWHanld3OFAMMyGabzEaBd7swp0izg1ZbnOyfzx/EUr7n/yVM7VC2zcqmQlS
         712w==
X-Forwarded-Encrypted: i=1; AL+hErGC5uu9MlalnN+kMYCc9rCs+aQ0GXOPtIS2amv3nQUcL1UgHepO0lZ/s7r6YPJD7RQVSYAepGihenUYKiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hqR3F13SUEBl0gqC9WrG3+XEhFHQPq5nOWw+vmeu3IMVrRvmZ
	g5fUlO9D7HmfHXM/RjYQBAw5O3Ranrw3jAJP/l08iUtp9b1Aos5Ua7wi
X-Gm-Gg: AYBFou0SQ49qFAHo/YuD58ZXmL5wLhHH/ZqdNcD4lk3anguH79DFyyqT1PB5incRpiS
	arSZj8c3wUztplRhOW5ICeLAwSiHHFiY5BnZBULYF1KyCdEjJjHSNdji63z5+dc1PQ81A+spTW8
	i3veLF1c7nY1enrvqEE2k2t6r4SCVEDoznqh5vqyUDyf9FUQSS+LwADvIC7nKg0pBWxNN/gVbMl
	Z/fUaiQ/RnvaXbJVu+rg1GrPT8rnq+KlqZZncEYx4q5sEjLHkr7swbXZL1N5lKpRwjuYFCWY79C
	g1HROQnhTv7LDs3wmEgpQAcHT8EKy9BXWs9+IOayy/+U/sh90PIzUTbc+/OMNrXa3AlYmo0mFMD
	bf+NoNqEylmxZe4EVl1wzw66I3qwQGWjJ//Mjx7/soBYgAQ3zsoOl7uyD6xv7U/WuaEECIu8hlS
	JTxGn/XFM/IAurxXOQ/VVoiHrrF/M1IKzpgQU1pPz+tNXbqJZvLkdY7voXABcOu8SxnC6dfkpmI
	ddv/AQG7K0t7mQu078lMhxnjZA2cyUVB00snWFvLTdvknvFPChNA8i75MUP/ooculHWhkoNdw5m
	Klf2FcqlVwQhcFgg9beMRWbCAC/qpv9gq+xxTAoRX/wejA0vVdP8qkf/PJiFHMah7tjW6ndOJBk
	k0KxZMWRHFEAAeqdRGs1BlkO2DsMIZbkNnIN3AlDaiYcUxghzq8eHbmJTq/U=
X-Received: by 2002:a05:6512:15a6:b0:5bf:b22f:19af with SMTP id 2adb3069b0e04-5c1709991d4mr3424142e87.18.1794767993422;
        Sun, 15 Nov 2026 10:39:53 -0800 (PST)
Received: from yantra.. (nekmmqug99g6ubyegcg-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:9e2a:fc94:8694:1840])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713571aasm2532348e87.73.2026.11.15.10.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:39:52 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: Re: [PATCH v2] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Sun, 15 Nov 2026 20:39:49 +0200
Message-ID: <20261115183949.11591-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115010203.2a939bd6@jic23-hlaptop>
References: <20261113230241.82046-1-zoone.rupert@gmail.com> <20261114013817.476f8fb9@jic23-hlaptop> <20261114083525.11972-1-zoone.rupert@gmail.com> <20261115010203.2a939bd6@jic23-hlaptop>
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

On Sun, 15 Nov 2026 01:02:03 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> > Probe value only lasts until the next temperature result. By the
> > time the buffer starts TMP_RDY is set, so first scan takes a new
> > temperature anyway (checked on the board, buffer enabled 5 s after
> > probe). The probe read also covers direct pressure reads.
> I'm a bit lost.  So how stale can it be in the direct pressure read case?

One temperature period, so 1 s at the default 1 Hz. A direct pressure
read takes new temperature result whenever TMP_RDY is set.

Probe read is for a pressure read that comes before first
temperature result after probe. That one would use temp_raw = 0.

Thanks,
Rupesh
