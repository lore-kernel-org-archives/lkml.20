Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97B53ED04
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079177; cv=none; b=Q68OJIu6bMzezbdBnv3gPLkrvbgVkZuAehZreu5WE8a7S2usIg3IjYvQJWG/hqiwGeR/qKgY7A1tqthZ1Jkt7fIyh/eJCdGDzGPEOt5A7mtpDVGmnuX6VY8yVxi+NxDjfBha/YyomcGwiTBZCkQNuFIjoIFAyawUixhzuMvUjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079177; c=relaxed/simple;
	bh=rFtM7Y/4hLz4QUzVQrWr8hZpi5xC8pCu87wXIa+Qv9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBL9ubnCC+kbEAVuXZhvYDwvRcOfVvQGXH0spMo6u51TNgxiaInLa72SVmave9VjCqUy6ShFf/Dg8EitHPk9LlMpjEvXeJW3M6WvPWP+5U8rcHVih535gjK9gMtyYAsntuXLmYZNQobRJ6PQ4q9LzW8y5POJHCIe0o+V+xIeus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKwgBvV/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKwgBvV/"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39da614ab21so310467a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790079175; x=1790683975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFtM7Y/4hLz4QUzVQrWr8hZpi5xC8pCu87wXIa+Qv9U=;
        b=PKwgBvV/eCibDTYKGd/9k780slqUN1qZ2/60FDez3ZAiiv94EFoR11P/kv1y7w7wCb
         vwNwkwYgXj3noI1MWXCDFcM+NdOgBRbJsgDaSyMbr/vVtNZ8Nsy76MBucpYi8vwG5AGW
         6vhkgfOw6/5o7C+LHSwD4AdKHgIZPtGzay1rP6OIYs8UK4as1bzKqFnr8t5wP6+8Br58
         Wd5hQoyj4ME+6fiWS4qMr5K03zzbtEgzKQg05EN402BH05BQ70HIWu96Tmv+JJxsw/fW
         Ov6uny3LeWmy/w2N63icdRQEagL8In46hV636msMDV/CqCS79MQuGYhar/woQZj3fliq
         0Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079175; x=1790683975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFtM7Y/4hLz4QUzVQrWr8hZpi5xC8pCu87wXIa+Qv9U=;
        b=QtpWcuxCZqRnQ2bspzNA4GcwYfKoDm2coPqPVdjzZnOasOv/d6LATIf+8inPKAsS8z
         I3Gs7C4Kx+BLGiDcSvB4tvMHuOPM47HDID4XPVuh/rzMmJ0U46bLnfVLeJUImCWcXeID
         zAaUkFI6QRzHLDBo6wY1rSAINwqyZCyGAUyaHXv5F0vJxH15OtdOUkLigqWi5KUYTg03
         P3o+lm5q+cO+JNJoSpf4ZuBqddBVSn1pw9TJVD2fOr38dDGc6Oa2mtGmsS32Kvr4034X
         kOvEqjfq2I88JXN3ah1wEOK+gFPbhNS3KkbvcIPEzfKZQGCdFfn3GglHdusHFlwNhTxS
         fCzA==
X-Forwarded-Encrypted: i=1; AKwUvBw7HNphTERVdGne6YN1AP2T8OWiMC3m4uyICka1pTzZM2dTHJiHmQS6E8Erg9g7oqEjen+Le05ga+Y+5rc=@vger.kernel.org
X-Gm-Message-State: AFuF++lH6AeijBVe8h5YGGDRJGrui8wHnssVFgTqh/S3Zm4DguTtZ4ak
	2btZrdey5vWxuGmnElTfIr50ssbQEzFmslnQjWMEXCY0IaUIsUVdmzDJxpzFJA==
X-Gm-Gg: AYBFou33KUIFGA+cgGgzz3kgaN7FUBx2cNtPmBsV0G25MMQ5R8nXceRRcotTvWjl4jT
	JKM1qxdu9Cq261AtwhHC8TDd9ZZlKK43bn03iybiS0LGlEcNT+TqgifE7KiZHXKF1PbAC0+ABu7
	AtOoBw3/ay1QyPQUlyQXh0ASDmBAOaRHEzZLTjMM7n7s5XSEXDeHwEzp1RABJqJYrvZGLztFzub
	2yYpDnRZ9djkJdTYMuMtQUB0pDkPDaQosx8A5tPyGdhRYp9ZguVy4Yp1qQH+4qnNcSCeEo1ANB7
	yUI9F3DyfjIQdgUYMWQnfWwfNoReGjf6GH5JahciRraQevU80a3ErBoDoQXx+I0VZfYmFqnYkp3
	YuKlDNUnC2co+1re/BaM2zO2LOWvrD2Muvqt3UdwiFpQAQknJxUoxXxkaTsCI1cb1fPdZRIHnvI
	1AjXzYly+7MlN/o8BEVLP5XOawmyjRdvSjjs9j4+yXaAC1qKrBtItrefnHez4+m7jjRig/0qnoV
	ktEhvQNd37g7hV7VULiqdIHLX/oSNlAnV1lfmQac8dRr23QHVjVq6x85sxfwOUvcrNrhvitsI7k
	Z62todTCQn/g1bXw7/F3kHzxBYzXgw==
X-Received: by 2002:a17:90b:4e8e:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-3a0732ba084mr1605467a91.3.1790079175243;
        Tue, 22 Sep 2026 05:12:55 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129a33esm5771625eec.14.2026.09.22.05.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:12:54 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: size the RX FIFO threshold to the queued transfer
Date: Tue, 22 Sep 2026 17:42:49 +0530
Message-ID: <20260922121249.46057-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arJRC4Ou1LSAMGTs@ashevche-desk.local>
References: <20260919232647.448748-1-navonjohnlukose@gmail.com> <arJRC4Ou1LSAMGTs@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 22, 2026 at 12:57:31PM +0300, Andy Shevchenko wrote:
> Nobody will go with 0 in cpu_dma_latency. It basically kills the idea of CPU
> power states.

Agreed, and the patch does not ask anyone to. Holding it at 0 was how I
measured where the added latency comes from. Mika raised the same point and
there is more detail in that subthread:

https://lore.kernel.org/all/20260921170456.53354-1-navonjohnlukose@gmail.com/

> If you need a dynamic run-time PM QoS, patch the HID subsystem to
> make those when they want to heavily communicate with the HW.

A QoS request would bound the latency, AFAIK. It would not change that the
controller raises RX_FULL once per received byte, which is what this patch
is about, so I do not think one blocks the other.

> There is also the issue of the interrupt locality.

I am not sure what the i2c driver can do about that. What did you have in
mind?

Worth noting i2c_dw_configure_mode() sets TX_TL to half the FIFO and
RX_TL to 0 on adjacent lines, so a transmit interrupt moves up to half a
FIFO and a receive interrupt moves one byte, which is what this patch
changes.
