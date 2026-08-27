Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893627FD43
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815572; cv=none; b=fEJ2Ur4SD84AF4opwNThawHMRhbW9PnCeQBprh3tTaQr5qpv2URaJs0OL+E8ueS5HtMAbwEk5FzAM0nB1En5zEG/oceal3vaq+pdiBG+/cjam7QoQbdFOK3OzXJgE/xAJqndzQOmReezbYzcKnCskBCXTDgdAwa8Mv5cL7zMHIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815572; c=relaxed/simple;
	bh=R2dVOVWitlq41IciP+E53pKe80rKTqLsCfZdLehVWlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwDHuuvvfjnvkqnLLYxNeTZB2MXAzqGAbzqMYCTGhEHhTJKW1FSF1duXb9ZU+52SBuW98vMCF8xxrHuFkH23D15skGLLgvHkpcyZ48nUAC04EpK3NKawqPsA3VdgoSdqnAqLc4/03ejo4Qez2hYoZQtnFm0t3r+DRVPs2zW8sBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbUL8dye; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbUL8dye"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso12725725e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815569; x=1788420369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2dVOVWitlq41IciP+E53pKe80rKTqLsCfZdLehVWlw=;
        b=rbUL8dyeMPltQAD910TezoAj/VhEe0Fj2xvluwmA5VuccU3Pt5FJtn47/chfxWYAdt
         nqvmdHznarHdObJaEYJ8sR/l5NsXqvxo+Zo+UpkZP3M2+kNt8/6EW6a26igCl9uXLn0Y
         KfOGHMc6V+xpKkw0kKl2sH1ENYHw8OwZe2jOsgkseJarV6CGWnq7VFk8XgM99sndvAnb
         /NiPqM4KoBT7tZ5ioNIfarRMQlgHVh8ORDfYh/iF4FBaNF4U8VesRV4vc1ACAFplGof/
         pFqFBrNkqVu8eDuN6Vp1EAX/Nrpxo/lrOY3W93lco40awWsZeOXgPP4O61c8aeV7UFKF
         /AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815569; x=1788420369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2dVOVWitlq41IciP+E53pKe80rKTqLsCfZdLehVWlw=;
        b=VByvnS9Suc0C+VnLOzAEZiPeFion90lcs5ZF1ZNKrGrFrL9W3WVKQlmpUC29PVlm2f
         yNC/5/rDDVJV0eh0T4LKYcopByX5bo8oYt3NosJcqSLvh9hK8seOSdJzNuv1oI2N4nLO
         JoIpMiRWQLbXvzSuu5BxPOCSZWMm3bdTcKVWZU+z9eu1x9jDkOG56ZJvxcilJtnuCDMs
         X4Xld+6jwJqCh52QyhygXotHVmkBUillCjxUvR9vctxIjLHk6EybaVg0B6zd4RS9Q9d0
         qK0F1ynjCr8DTu6x2e85dbi8my3ajxDp19CJ1uNKkGRvJdY/ktOQ5QrOs57RgZWa+f0+
         FdCA==
X-Forwarded-Encrypted: i=1; AHgh+RpJn8/S8Jk/9NpiBAI2VuwB6XqeGWENwlE4nga2J+x5iA7wo2ZzC0bDrd9DQBQBQbu8nVsn/PCfSQ1sUOE=@vger.kernel.org
X-Gm-Message-State: AFuF++noHmR/ZBjkpcC82d2VY1zK/Y3eTy+uJ5C1aCfbeWpNJ3C9H0E3
	vUkW1E+hdngR4So8ljCWygHpYQ3XoBnQwzh7YY0Dxq8Nn42ap4s0IyPd
X-Gm-Gg: AR+sD11ClDL0bAzMf8kigT5gtMNdT12afX6N0sztW83bMvsirMrxMP/KNwM3Q+ZuDMl
	aH94LzdX+pHKS2DGQ7IaJ9eGsEt3Y2UhqBOtRQvOSN2EKXfylX2ugGjtEiW+awRs2+ezjYmGyLy
	C2KtmH6QHIWtLcBvO4PPsDGiTw9+VCZ2Kw8jGa84ns2P4R6GirWAqWXAXYG+6zGiAHYXd/GIJ6F
	//Bgldx/ilXRsTHQq62VAy0zsJ89z/ANYlzpuRkbPnbqEXI7kvaNVAUS9WJ2HXTyZsrgl5zt6YB
	mSX8tb94GfaEQ2VBpEhjlKJhxTIPZ6m93HMv8l5WLTMY75PCsoeBq7PG0WSaj7T4QlrzzYg9CXy
	GlGK8Xfg9AqXRKJMmTQxo8cQcmSxUH+SdTwXMkU+j++TYh/ghUVGTHw2nYnf0IElm5k4dHantMm
	HOz0YHULlfzj7hWGdfa6nklMjQSNqP3iNBAHLuZpy9M8dyNKcwDRWU2eraocf+kAXAB174ghe4I
	1CHnEH3GH6Bl82OzpAeoQcKmhQKsUlx0CSIQjBiprhQ
X-Received: by 2002:a05:600c:4692:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-499dc8306f2mr126425545e9.14.1787815569279;
        Thu, 27 Aug 2026 00:26:09 -0700 (PDT)
Received: from 1Z10 ([78.211.107.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e4f0c8f7sm6695911f8f.27.2026.08.27.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:26:08 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 09:26:07 +0200
Message-ID: <20260827072607.1402351-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
References: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Cezary,

Thank you for the review. I addressed your feedback and sent the revised
v4 series here:

https://lore.kernel.org/linux-sound/20260827072517.1401173-1-mauriziocasciano7@gmail.com/

The driver is now named generically for Cherry Trail RT5677 systems,
uses per-device card, DAI-link and component copies, allocates the jack
separately with the device lifetime, and unwinds MCLK on the PLL and
sysclk error paths. I also documented the ASRC clock selections and
combined the complete SST/SOF machine entry into the series.

The v4 sources passed sparse and a clean kernel package build. They were
also tested on the Yoga Book YB1-X91L; playback and capture passed, and
the GNOME Settings speaker and microphone tests passed physical
verification.

Thanks,
Maurizio
