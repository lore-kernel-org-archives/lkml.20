Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F75463B9A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756655; cv=none; b=aC6i6Y9Sa171B3Z3V2ZLDVIuSPwsyNg8o9CazGfX1DNN6w5LCobXU77QU80BBLSqgtzaFRxhcSYPzWlR24957QO1eNOSyMHF4dtKxdEDi4sa20d5PPPP0BICAGvTxxwY5/hCQfssYyaAdyCRau97nectNgjS1gemKjX1WySzhys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756655; c=relaxed/simple;
	bh=ipGQ97f7MUkelnfRrS7W0DNwckkxAJ/D9GjaelK6Pms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+ZR4oJzC74xdowiHjaDsTBzcLp6ydI3tKiBpXHGPTQdMIFTpC+JmssQJSL+PR2GogfbcZWv7Ebkm1RXrJo458aGlKSbiykky5Y9R9JuFZQL0sMh0NQ6NdLyUy5rRlf1UYAIKrTgFIrD6b1zUtcRWzABe2pF3lC1L1kWmituYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRoGKwR5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRoGKwR5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so29458095e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756651; x=1791361451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O/vpu6nOACLN1GW1gZlQkN6/DVvLR93ljsvBEfccVh4=;
        b=pRoGKwR55/XDsZT+XJlovQU7LhMuIxeOye+WtxKF5BB/1Y3+p0LU7K/jD+7uQwAH3g
         conNn+NZiavStVhU4Fhx0BCODGaLoDIEu24YOyOx8+V4e+zP6vAYnWaWP0fwAKXx4s15
         cMH4Ny//dvocLzYYjIa1WEdAHMD4l/PK8Tp96dOpVPNAJwQxGvxpYWiKI9QkefqUQLpo
         z/okCCnRpUiuR1PnqQcSWwnkV+c0EdlkZ/DUWWphSSpuHePneG1dPLzBmrmm8U3UisXr
         NaJgY/k1OyiYVaUOM3euOsIc6EEe71wmXa1XJnBS9Q1VZ1rW+r8xWE0B+I7QD+c5/Hl6
         FQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756651; x=1791361451;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/vpu6nOACLN1GW1gZlQkN6/DVvLR93ljsvBEfccVh4=;
        b=Lhkhbw3gFKyGQWDCdRTNpllnH+zhWlvwCuBfu7BbFvobJhOh052TES8kqpQv14CirR
         WHmBpKeRTKWGOpWWY/eEN4nfQwplwQSHQWQhQjbFi+2y86DJrKHetz9uXfuWQy/t2CWj
         D3NcAtBK3g2qH5pSkbMJEqyhv24NjDRatiDAavgKE+eO1sUtIJeKI6Koc5d3ph16mfcy
         nBaWBHKvt0Djf7LiESnnyefuSyo92sCeu5GcGIAkS7TTd0h5SEI51T1UEWyvBsBS+nwT
         ttl5kjkkX2rDdlk7xGRaLo1llSqB5PTfaKH7JBCFN6wKud958sF+xVO+VqDRELCoxRm0
         NViA==
X-Forwarded-Encrypted: i=1; AKwUvByVIzJ7MkNuM8WynBw11xKlocHuVKUrVViqJkqtwedAGePL6+CcDuTX1/XWkDEXKOOAJQTHZ8+Pv6rQI1I=@vger.kernel.org
X-Gm-Message-State: AFuF++llwMMcr08Kc6pFxsIsU+4F/VPkYT7ggr0VrNFLRgtcygR+4qDr
	yy73b9EpLvfNOKab8XGwE4TuwaJmvUhhNH98Ct4XBRIMWoFsMjoctmac
X-Gm-Gg: AYBFou3dRLcae6BOWECQcJKS3ab6bIR/uh38hp5SAvek3ROfwJHmmroqRJxjVp41kz9
	vfXHjfoRG9NhA2XcmH8I9scBPqF6DzJrVtx9QfLzuj2iYwSWCv1JBPs7nwX4V5CMOHUgtxdGmii
	PXmESE8IRef6ptSRkIKWYGcH/MwZ5mfEHPrxwQCczh472KZDxHX6Cjb58tkTeZa3MS6K5vVc8zv
	ImUp6phr56qgw8AVAfynM3K9I9pm4ASxJcO3+OMXWJYdNSNegOlATMeQ4GdC79te2Cw+CBLmGCA
	q3SHbVkPJ50A3OuByOinJ6/oZ/GO441BLqzcEihV9uwhUd44MBH9VfH6K+yZilC92piQkQiUqJz
	WFXZlpvfub+dpFc24GAJvl5hW0BJ5fbDlrdPAK/vUT7VEPZXSEZGJ89oYiS2pLemxbRIfYKg37w
	kgF3w5B1H8nVzy4GTgyxmxxciSUGOMRTPfXeoAWGsDFasjiYelOKHt/u/l0j+j0pv7HRjAjbrKr
	d6oZWIx+Spgi5LxVu5/08ADP6EvTP/zjveLatzDKZFRw9Pjv6+Zje9nB7ukS5hs8MLa133C27WD
	pKuunsUOv/+3okOqIAf3TG0y8ykkKmo1mNDuSyghxBYca4J0RY/wgMn8Bqz+v4xf/962s9lEhnZ
	bzWNYQZXCDSNvW2zrxXjttneA1mYZBcH81HPnX2xVt2tOfmSnHS6DsZW7JDK4P4Q52wxUOX8s5B
	NhIqSH
X-Received: by 2002:a05:600c:3b9f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a01b212757mr10135465e9.23.1790756651411;
        Wed, 30 Sep 2026 01:24:11 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174fb909sm40727985e9.12.2026.09.30.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:24:11 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:24:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, error27@gmail.com,
 narcisaanamaria12@gmail.com
Subject: Re: [PATCH 1/3] staging: iio: accel: adis16203: fix inclination
 naming and remove unsupported Y-axis
Message-ID: <20260930102409.00003055@gmail.com>
In-Reply-To: <20260929184900.39515-2-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
	<20260929184900.39515-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 21:48:58 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> The ADIS16203 measures inclination around a single axis. As per the
> datasheet, register 0x0C gives a 360-degree output, and 0x0E gives a
> +/- 180-degree output of the exact same measurement.
> 
> The current driver incorrectly maps 0x0E as a separate Y-axis. This patch
> removes the phantom Y-axis, updates the naming, and adjusts the timestamp
> channel index.
> 
> Note: The ADIS_INCLI_CHAN(X, ...) modifier is intentionally kept to
> preserve the existing userspace ABI (incli_x_raw). Furthermore, removing
> the phantom Y-axis inherently shifts the scan indexes of subsequent
> channels down by one, which is expected to correct the hardware
> representation.
> 
> Fixes: 2df79e1bddc4 ("staging: iio: accel: Rename source files and update Makefile")
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
