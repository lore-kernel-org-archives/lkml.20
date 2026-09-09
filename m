Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240B580398
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970875; cv=none; b=tV5DSeEyTSlCNJbyH+mV0Xt73XERz3ZGZP67Y4Cp3nmuO9eTxxH7txUVYigUSgVF/XPmW2j87y2IsXgCwkElLwt2cWlRAJ2COdKnuP7UoRSdqoie9h37cCXcJJMTbCJfYlhVRINsDCNuWSDnsKafQPSHyHvP9KjqQeQAg1jofJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970875; c=relaxed/simple;
	bh=S0UWoaX2vzA5f4S5nnP29NGTAhTrLsvfkLzTwM37uq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmDGx2txzlR1YMuPvS+h7fKXx20TVZVkMbjxhSbO4lFXj7RcQRNIfI+C5fL3whKBgxpfFBm1t6/pgr5ycS6M+IJf07gHS1sEUfmW4Dz6HJjTVtG3ePOm81k6xXmOPfAL5PGTAiedD9XmGXRd+B23CM5Tpq7lL6KjzwHF1oAm3oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lm3+4TZG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lm3+4TZG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so25621055e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788970872; x=1789575672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shGFvWN8Lz0mV1DV5AN0zM10G20yvkKxhMse0B/zkow=;
        b=lm3+4TZGURTgQLXnTBEbOyLynt17ur0mmNve1aA9N2S+hbkpHicxyy170rTroI3aFC
         WYT+Ky0xLzUGwJ2BpQFNhfOG8e3HxT1ieiVqXFMz6R5TjJAG7tKgklMnxi2xvCONZOxx
         75O8r6/G0Uv6df58TgqFTAcpEh44dg34+wp30V5jRcbUf5Bxohe1iqCUjfaD6iKmqoWZ
         O2hGKt6Dm/6yke1OHZLvDHIDPWvqHAqJCs4ReZ4Bks5ShWLBtLhyQFpBRwiSMrhVs7KP
         NPwweocBigMjlHwQjtaSIaL17RQ0ND4o/FXGD0XOpFr1mMEdKuirzku9ZrARxbn+h9Ou
         PTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970872; x=1789575672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shGFvWN8Lz0mV1DV5AN0zM10G20yvkKxhMse0B/zkow=;
        b=F4Hh2ec/4n04fostj7YPrFV7NNW7GusagAnRFb/cTU9owPZWprHaFN+hB5Qr++XuUa
         jS42e12aiZim8SfQ4gk/3JTNUyp/zYvYLVBJSbKKnn7DVv5lLO8d3P+wHuLSqRhg2Gxc
         CLHTJOQyfUI6twvxQDqMffpiNGZ3cJRxIG3NuW56rRazbzDuwEGoGzgDJEyFKcb+GPHb
         JtUDtxBMsQp8OOuuTblFTXvalMCzJNR3PM26qgfONRQ03gOXAoDoBZIn5YVHnvUpW7B9
         elvTslvIqLOsyiY+8SIhiRdHzPfplU7H21gkCiWjpcT12cb9J+S3rcqx+1MPeoMe9S6R
         mOKQ==
X-Forwarded-Encrypted: i=1; AKwUvByKguyBZoPP1K0Mj+8HoW1f3Din+HPXalF47VJw3QGc3veYLjYQw7LWUCNtUL9Vcci7eypNDYJcmUWSSZc=@vger.kernel.org
X-Gm-Message-State: AFuF++n7ecAHz6fmYNZ2GgX4lEU1cp7sxb8fJiBduOlYywbyxMxa5jbS
	6y/zsxcYXpzvPewIGb5n2cVnb+Q8H7usuQySMJtNbLKiDregd+IwyzP+
X-Gm-Gg: AYBFou0ktjacaGpxMTnFLcIBpiVv8LdSCr2lcOx5lEj+AdNH49LM619Kk8Heqe5ktj7
	NRI7Qcr9VkKHIVzvmcP1aXU983Ey89rzrmJ7pNeIHnNyzgTTBb9LwTYcsOQ6hlB71zJemUA5/Of
	PieZAKjIaUukAftG4g22e0Y9Uwbl9qreliI/gp1ThOZOMsYRhQO3S90Y2xJ6xm/K0n3YDscqN52
	28vy9YEKIWodDPsa9D7e5IP7FCNb5oIacv14RR3IDCcSaayogIZZwMPSKmW69D98EiKWTB5opgY
	BThAKLWE3GkMUWmY+GsTLeyX/Mk5K/jkkRMilaQDeorxxPCrtdqd+miQ3M04K+Ny5Z83hP3rmdu
	aES0qwa+BojggyGOIJUcu0f5a7IB4bbGggNrOjsbdH84DqMyY+yib+jr2Qw1+Z4Cv9PR0lxswKa
	XRQihkpZiK8SxbNkStC19RJG40aqFvdoiYO86+T3TaNDrBD7jyFYc4CGRJV7Nc8IAYqhU74/jqy
	fKDH3uul6aa33IIDaTIn751BdY4d0b8yLjbBGk6I58TuWliHgqwtY1aWjp9+kRQvvRIonVpgseB
	2cDk9n9O9izObeDVBgcX
X-Received: by 2002:a05:600c:3550:b0:49d:7fc:5dc5 with SMTP id 5b1f17b1804b1-49d07fc61bdmr241345435e9.1.1788970871624;
        Wed, 09 Sep 2026 09:21:11 -0700 (PDT)
Received: from kdev ([81.56.8.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm1893145e9.3.2026.09.09.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:21:11 -0700 (PDT)
From: Fabio Cesari <fabio.cesari@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: isl29028: fix runtime PM reference leak on error paths
Date: Wed,  9 Sep 2026 18:21:07 +0200
Message-ID: <20260909162107.306528-1-fabio.cesari@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907092924.00000e80@gmail.com>
References: <20260906131203.125407-1-fabio.cesari@gmail.com> <20260906184358.398f3f1d@jic23-huawei> <20260906221517.201877-1-fabio.cesari@gmail.com> <20260907030751.3da628d4@jic23-huawei> <20260907092924.00000e80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonathan, Joshua,

On Mon, 7 Sep 2026 09:29:24 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Mon, 7 Sep 2026 03:07:51 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > Why the if enabled variant?  I think that only makes sense in places that can
> > be hit prior to runtime pm being up and running. Maybe that's true here.

It isn't true here: isl29028_probe() calls pm_runtime_enable() before
iio_device_register(), so neither callback can run before runtime PM is
up.

> The regular PM_RUNTIME_ACQUIRE_AUTOSUSPEND() is adequate.

Agreed, and it was on me to check.
v3 will use PM_RUNTIME_ACQUIRE_AUTOSUSPEND() in both functions.

Thanks,

Fabio
