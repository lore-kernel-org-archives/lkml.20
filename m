Received: from mail-oa2-f13.google.com (mail-oa2-f13.google.com [74.125.231.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF828315D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789806054; cv=pass; b=WaO1qkvpy4Pb28SuV3nEIjz+qJadb3qBhADftP2dwj/rt6lOH7IUtEb+UvPwws4xASnjQcHos00rpdvCGyxlDBrH0BoteNdrdWBEa8vMA9mYdY2UJeaJSfq1fbvocltMQCDjS2pK5W72ycGl9tGuKiXBQ/BshgbWLtIsiSUfulk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789806054; c=relaxed/simple;
	bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyIA2NDuHcLRAD8fxjWFkFb6CtAPvyi3ppvysV/0EzMbsmztdHztOg0iC83TB5Sk4edqFgonG40V0Nxxw3MCHDr1DintHSuX1MjX44OGpEz29n/3evWY9VgTyY5ODF5WAFv+msSNLv85YaEwD2S3fesVMsDAqjH9nBuzIQ76QEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIdsEQr2; arc=pass smtp.client-ip=74.125.231.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIdsEQr2"
Received: by mail-oa2-f13.google.com with SMTP id 586e51a60fabf-466cc88a9baso1188880fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789806052; cv=none;
        d=google.com; s=arc-20260327;
        b=eYKSM6ygJRML+P3VR4Sxn4vJddoMCVk08NwtouNLUP9cUrkU7UX8URVFZGHaVZUuON
         NbBeyYuH9E071RgIdEEjm3euiLt62EreI3GpcvQGrBUpAuMyp4tSf1Agzhk/55wKu8My
         1GyiSpXoKEl4kFvIu28jNY3i/Ehp40FYX4TzJrnVfVtq/tHMbCHHyKPGByZ7ujQqxlz+
         koYadMxDYLyehRR8J1pipOTmBLkyZzOxKujgf0AYaOoghk7oD6zyorbYK5T3VLXmdBUg
         lD+dpGx7HUnuSDQww3RXvXZsMvX53gD0MS2qmPk6adZN0rYsQ0wwVvMx3Yzem2tjw7kg
         axdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
        fh=TMxmQx41QGzwmBg+ryRfMx1a77KroUMSoBwrnnn9feQ=;
        b=NCQqI5W/tDGfX3KUTAA3v6AZmT7uQAXPG1t//yqs8/CyH9SLvexU2IaeV0xuuDPgKh
         k5l8SDHOfshkhZOOsVeyzGvqDR7YrVrgydhianvo0iC3xWB4IvNTTm0MMWZTMgm7OoFk
         hNyGGO/36nQHD79Oz/mkGDN5nQ07k6aLUutI72+sw3xwL6Y2fwTH89hEU0uua1Awb2QF
         l3t5yPj55LdhCuQO8BCciRMDVZeyySfxmqKbB94nwdJn+Zz4yvJ4MRgeRbQQqV+mnG39
         ULo6zJ1xMDsOuR9yAiKTkIp2TIg70VUS4uxVTFr1YYl8JwUOwa4uIcmAG7sXGyXwDsVZ
         mEAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789806052; x=1790410852; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
        b=JIdsEQr2+HyjoZ0oPGP2aMTpKw+GsmtKueKvDgD80W3YTJFSPZEoRBq97hPZnMKcu8
         6vxD371330rf336cep/H4qm16j3utPzaci0DSjaFIDyyOpzYIstkAJ2E84ZyHJ+0xpJZ
         oKwm7TsyKfcMKRPu33zvomh8o+92AxUfNCxonxgGn6HsAD+1llNpOZpAzbUz8FaFEnpP
         60OF75WN1Pygq9rFB/mdphwW8rXB3z9ElBHFJcZKMd91AqI9ClaoK0tyIvTKDPFEnAjC
         +r6R2Fq/QN17DwOQnKe2qh874paTO0p19kxsG7E5o9J8Dt3XWhZxjmSdkmRJ91WSHjL6
         qjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789806052; x=1790410852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
        b=cLrtd+qT2LlqtDgO6iTs/Mp98qUhf+tNJDDkcMWCfm2bqrDSowvwz8/Jg4APew+//g
         YmtPsZ58tTyHftAUyIEPnTX3bKbNLztsO6ZCOGWOcKJbGDMXjXyslh/UUPMAan8gxK9u
         Scmy9J82LvF83OLRJE1nqzh3lVC3ZBpoDO0a/k7+45Bn6DK1wGsnR0Cz/NhQmJvsr9Ue
         DB+RQDlSAV4RYGll+QR5Oyk82QListrPNF+QWNn6gq0Plymcs1YWln2Sbw5cAXR78slF
         qOnmuZQz1aD5jmdd+5UxhWMytHlOU9y2PaAeX5ecWBS/7tATtl2P5Gt1pq9kLyIC7LlN
         52Zw==
X-Forwarded-Encrypted: i=1; AKwUvBw8YUi1RinegB3531BhHUYEMfrZcM+tEFd6EQu1QVoohf4kbk9W0V0xwKsg6wkQESuYz+GHu7vG4v2uSZU=@vger.kernel.org
X-Gm-Message-State: AFuF++mVYggwRkIh2Bl2T0fTFmx8R7lO+ymYBmL+bR9uhoJa53Y0bAkM
	g3MnV+gf3GlIcOIZBilBJhcWCwJujixvmCgSn1p1qI8qORIRCTUGhH4sCFArBQSizP7r4NGA5Uw
	0yT8Ux3LAoigQ+mjpn9ztIEtYn8zZbrk=
X-Gm-Gg: AYBFou0nD9O9wKbX8SsxpRq+mPGDocKImTtQxPqr8TVJfxgu3cCiUBHpSdwG6GwkKkK
	vVz1pcFCL+B2vxsOVTcLoch38VEXC2rtH9sSIt9kWe6QzKQtfiEQRULwirbgU2pVsTk9HKT8bDA
	0NQQc3OzSMHBoyGvRusIwBJKFpIr5Q24ViT5LO0Dq/9/KRWnVFfY7aBbPTh97+Y6j8cn6WRGJAW
	wYyHAWIY6u09mr7SD/B6lC2A4K/hH6Kf7seScCMzqVrs1R4UJ2xBsU8Dq0LhIn2mORcqspCvN3Y
	m+69lX4UsxKEhBF3QxGWa3DFxVsNieK5QOlEALqQClZ+HyxVb54kGcT7lA==
X-Received: by 2002:a05:6870:af94:b0:475:e235:904 with SMTP id
 586e51a60fabf-486e7d8d784mr5164669fac.34.1789806051717; Sat, 19 Sep 2026
 01:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
 <20260915075939.18180-4-abdelnasserhussein11@gmail.com> <20260917042241.05bc81a7@jic23-hlaptop>
In-Reply-To: <20260917042241.05bc81a7@jic23-hlaptop>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sat, 19 Sep 2026 11:20:40 +0300
X-Gm-Features: AcwNN1VPFhT8_U74Se6tKxB-Bhi_wWnDBf7t9r-mJewyfUCjrFEfyYR3Twb_qsA
Message-ID: <CANpqX3ZUL4qhjKEx2DN8YOYrMMxe78w1O0E+aDGSR1NE3oprhg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] staging: iio: adc: ad7816: Fix DMA safety issues
 in SPI transfers
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Yes, it was indeed a clumsy copy-paste error on my end. my apologies for that

Thank you very much for fixing it up and for applying the series. I
really appreciate your time and guidance throughout this process.

Best regards,
Abdelnasser
