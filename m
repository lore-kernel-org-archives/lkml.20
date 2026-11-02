Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632528;
	b=Z3VUu8JlH1H7+wzqQ1IqD8hJALkLaDeK98ud6kpSndR1autZLeTlLtgm9CwoGVrsCihx
	 U2fO9kkWPQXmK0zI1ARCo8DgLl04jyLA/O/Mm6H2HBFoivemzL0YcBeEsGu1UJULxxo9C
	 gB8Gj6xgYdjPov9P+SgVi8EYbRAkmxgpXapKTjYKPmYuTRxt+Ovt5igP6Fz2Cndbdgand
	 a72VxjNYs+9p/90brawVIjrb4ARDhS1JyLJ9tjLtOOHduyDsUSjyb1pFmT3EcVwDoZohT
	 Wkra7mKUuA8RvXe34ZjMMPYgCzDyO5uiVYpax0f+MaP6o4SGAwTF2Vp5iKRHapA7AKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
	b=cJAXAF+yVCnWAyF9rib6D1t+sVvD6FdbPXEn1b3rOHGJrd2H49VoY5SCKkYDNtOpI7+k
	 oOqDx7TpqCsy8zlsBtKQjYtNxxwFgnmd4zbRbVknm1XPnv1UjV/+/BqF+YAt9fnoQXM7O
	 2xO+9xWySx/LMrFL/KIS1GdTVwDX+vvHgCpSAdNqdUaYjclaRNvr3kf+tsNuo8shmtvub
	 hM53GZKvpPvCYWiqIBR4FK9Lj2FwOaztkS7pbA7wo1AjIe7hlpqp8Rz6ZZnBTvZKJU+fe
	 glZl93K44PEy5UYxP53VqoGB5evegbmT60PM8+qzprPqVoHYXiC+K7zo1pdjQMEPXXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YDpliHPl;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58E60B4D1D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C58E60B4D1D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YDpliHPl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1906655f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632526; x=1794237326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
        b=YDpliHPlzfMOH7DTeVoAUubrnY1nqghB8suVIzq+Qng8vGXwBCDqxcDQcCZ3lvyaI7
         WL6QW0UlHxlN2AHvZd3enIPtJkFFy44HhFuJEvlVbtwTpO9szNInf+EUj7IKyjgtvU6C
         /EVgGrNefqpVu96YcwVxwqSoyMH92zXNM7fONzikSumIabvsguMwFE2YKJ42GNRZMz7R
         3E7I3kzLVeVPrXGZyyfG3rKHu046jXu575Mv5Z5SwbGeVc8oa1ChDiYsMpcjQThYaitN
         5QgC4/2OpaS64FtcYPfOT/YT1XJPOADQt+1T7nct7jYKCvQcYEWc8B2sfPjeqCGcWgM/
         SoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632526; x=1794237326;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
        b=lfWyo9KAS/0O6D5btY8ifgBgOvQ+GOUI8yYWfOd0Vh7VWtatPFp0SdtWFg+yfLsuSj
         kUoRx1VK/ekz6jCSprqLEcjlcdRRlGjVtigQJeAvJItajMHNwCeeJfg0FhizPViu3gVv
         GUO0nD4VovEXUm9l7rIG4WK7Q5OBezKhCDrCdHExayIlHvrmD/ADcQfKuacZG+oSz2uc
         n6D0gtIbzgEOrCKa2efwXRMFsKVCSk46ER7L+1B4LL/zVsHFS7IAbR1/k4iSm/mUkqmr
         ygaC+A9eO2jugFjEGfrtSIRx8RH9Nc5+hnRTUsQDq+ygJaXp5Zd/ztraKX4EdBmDW77Z
         buzQ==
X-Forwarded-Encrypted: i=1; AKwUvByOnFvIYO9D8lI3dn+/PD9QH7n1ssr6vLsNOklsTfWJJ7+4eS/IZocRP87wq/OnSDUTmIe8aSL31UpOEEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bTzZ+Cajfe4RFIVuj2KbJl17oSlq1sUS1wRR8WENtY6c20rBu
	MRAYrw8Xq0pv4uViFsnXrIwZdkjPQVTkOaEPeKylb0ZOJoKdEvcHuMyKFVso505OWd8=
X-Gm-Gg: AYBFou3FR+m3zyppnyLJ9e1CxE45HMuPUG4DYaczxjsGBaPR0tEopmPuQ45xEGA3r2O
	sTuJT9z11JbrKraHr5ZNwEJKl1Wz2pAKjNZ9BtXP6EnmEDTZu0qua0AxzdwrHM9ykul5rF7yrw2
	iJoPnIhp956VwOQOOXcV7bVE+bl6NhpbQhPVC++UeJivP8U6R/Q8643mAikbL6YhgDHAi0VHdtg
	cLH+Iyzk/etHiArlYqYg6aweV+g7OHYf/TKmwUpbd0DwnJkaJHzbKI3BtwRkuwxXRkpnq7549WC
	HBfV2apfRQAQsJ2GnVZ/IXcC42RO/mC3uF5WVx0JRTuzwgJBRNIAdciZl7iwidh4hWl3KgFFBK/
	QOaHHQhirrOt8fdwxouttcYjSXoyaVhun+SObSgeXOL4a8+sbgBBycjEWgTJW7j+tsvHMPF2kKc
	lMJO5zkOuP3yGKBWp70yivTuU/jkgksdMwDPH+/ByRk97yY2SGClq8C28/wY/CTn/Lcwb7m1Ptn
	V0R7A6MVJOHFblimsHATGXN96T1N7euZn+97mGTyv/GJgiA51D9I7RSSG/9fapLHsQVcDLu+eD8
	37zttg+/iWUsyP1we+JM2pLOGknn61aN/MmyNVe0WjceXdYHf7Jy+Y/CPlfMQ/QBZoWM0Q==
X-Received: by 2002:a5d:5f07:0:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e6e4f8c4dmr24016067f8f.44.1793632525630;
        Mon, 02 Nov 2026 07:15:25 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm20278422f8f.46.2026.11.02.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:15:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic
 Meson SoC CLOCK FRAMEWORK
Message-Id: <179363251235.2870673.14649605942242408938.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:15:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=218; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cdtF+IoyulNvDDWLsBzOlK8XDHbQ0yPEZoN3CHTIrY8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvJ8sVbYu2HF+9xn65XDM1Jd43QWq/2zZOfkVywKe
 OHy52NuRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZi943hf9oOm6dcXHLN/DMf
 PZRJyvlv6rpr2aSsORcCbLstlvzxmM3IcEsluDdb6sybjOPF3/9PyTK768OXKZxZ6ukkVDPlo6Y
 9HwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/1] MAINTAINERS: cover all the headers in ARM/Amlogic Meson SoC CLOCK FRAMEWORK
      https://git.kernel.org/clk/linux/c/493e4ff653e5

Best regards,
--
Jerome

