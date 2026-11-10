Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328051;
	b=bLchhFEcTsoYImVthLcGUlDNz+2lqTwP2e0amANA/AHzUgfe1Geg4D9tYGppoHFhPRJD
	 ljI2tR7JjRerjR6DMweMtmKM9Hie1Sgs6WQEpiI8eYrBw4STagiV8zXj7t6CnSgMotPMB
	 HSDQ8A/btKgcuOMWJCTATUbnjKDGPA+ZCnXiL6qUF/FVo7a5FnyewXUGLsSqaAhNXihcF
	 /OzzXWCPg8AmNGJSnRdfs737LpY0MHFJPDOPq9k1ex5Bk26bF0MpV0wMbwp/eSnkQ5jP2
	 V47YSMUPtowNWpOSikUw2WbY4rxjfFErvuwqNETgKwd3dTeybTuVXhaizIi02e3atgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a1tYd398psi99x2zsisd/32A0Ti86/9u98Bkj+C2fdU=;
	b=mIgpVHeBDJuGbejTA47sMMwC/PXVTL1C3SNu3wIL9ySSWi+Pv0fKn2cGhfVw0jAfSowl
	 24APoiHQBcN7rNVTb8FkPWlVsybAdPQ+dxpXBx/LvBo8M/InKO7NZx/W3EueYYibqK+c3
	 +NLNPjYii9T+MspP3ykE45spot41Ximwbzx7yS0tQ6g2cyHlOcToSQqW5fEheZc+p+hf+
	 zAybyURqNYhYkSsqtlk7xVID1NLp+9Yy/E0xww6dx13c05jsqVq+cav/VOsx7tcAzvfbo
	 PfjtjO4q5eDircT2SdJj5I5Wtxsy7lqBS+IoHNiv5MNKegMD0lg+BctP3ldwjpGO5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=orYYIpiQ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA99606A23F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA99606A23F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=orYYIpiQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so26758965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794328047; x=1794932847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a1tYd398psi99x2zsisd/32A0Ti86/9u98Bkj+C2fdU=;
        b=orYYIpiQ1X8Lptg/esHZK0OTv0AQPJtOaeZJyI96CRLntgknEqluyPSp22eGvneDUm
         IzTgRChCad3e+ZFOAIvJu6T8MPZIKBMUZ8Hgf3Uf29y+mmUsmf7maqgb6W+Jg0zoigd6
         KI/vBcTh0rX+0gNfrkKAiuSyD3f3Q305focSyO+XpoFaQYJM+hYjcOeJyqn6zbrFDd9R
         Jllx7QDYpWYmGcvDB3ByYPcpe6CQHbeyCLJlv3lCMtyF12L5M/tf0HClwZ7mzIr1ukX8
         EBOzcJaNBbuVxrxh2l18qDvbltthISyspDDmGnolgvn5niAe0Dgz0KG5rBn8el02UO0/
         dLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328047; x=1794932847;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1tYd398psi99x2zsisd/32A0Ti86/9u98Bkj+C2fdU=;
        b=ZfhGVJi37R5r8a4GR5zOOLTKfn42cKQgtVVwaERq8wmmLRRhfE4MyE1lGV48DAnKrQ
         9Z40j/meabfDMwsLjfkOyX24aaZubAwNbA8yUhAXdjt2FhEs2io6jFaclyoHjSyuQCUj
         +H1OCZFMr2Cfk6p2IITZXVzaf3iUT/jBGXuLZg82LwuojtHqdADM8cUn9mnabwG6EmCo
         Fz7SQxxSo2zXVxWZiQ6l317AY3593+zJBgbDr3n0WPMOVVQFb5sD+WIFS/2zkcDxdCKN
         jHHAm6G2X5IxtzoVE6fbSQwKquo9bLbDd3tvZYHAmVrB+hr5uhAoZYwdZjhRXhvxiaJu
         ERsQ==
X-Forwarded-Encrypted: i=1; AL+hErFFpvE3BMQk0C8+ZsDWn0QV+HesBxNZG9waOw2LaNXyEYN4zjt546VZ7XkBPNgcKltOhEYp2D3RQvq7TSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JDI/9w0s0LAgwUXPWawFd2fmyz7b/cVpnvYYJQFogMi+z3Jrw
	u1aD6zV5WTvHGs1XRxlU5pxZ7/pqx6U7TYPlPG8Q1fIZ271wGZJTL2L7EclU5WRSGlg=
X-Gm-Gg: AYBFou1J5Q/2ig2+5xDtd6dsbpCNTyBaxfEfBR2LqWI68TiaUYmmBt1nEt3SSOwjA9o
	zByaYdXLp/uEGiBLKw0P7bTHiYsTlWKDKFNO591fc8pDqpZ0qegacrK5Nlnu3olcaDaLwr2APFz
	F6MsvxM318EKYfJonQsV0kZQ5uX3kY/OPeAxbXAc/GO3EtRLatBElF9gWsMJfznE/bwlAp9o2Ho
	k2uNoEIkjSYvp+KIyHT2T/ASgvKiussyXDGePZK8w2BShAETmXXRrZqiDftUbXwOfddqI5Xbg6G
	pPOsG8I5ypPiSQJxWQc4dOHgq6/dlnGYpk4VuGauo6a54oFRSuOPzW4tjYSRld4wBPGG1eUWlVa
	/k+FcerJdN4gFddGjVLgVz0qC+BuLoyjM+KipjF9uMUpt3pD0TvfjJdLBg2szAN5CF+QJDoPl2f
	pr1Xwk7kmh/mUK4AGy+FmfX352W75V0KRre9S/m9GXwg2nP+5OAZCLTThXOAN1N128YMogBSAI+
	Afdi3dITgY42B4WHTEpKgjOzchSzRu1/34icUJnbHsFfhguXzn05KbaKICxVub5HvILINnIQLh7
	gunfVYWeEDdf8SPHW3GEOjgrQjuOAPdl9Qd82TZvduM0fAzZHhFMTtWt410UNaINjrdy3ItM4A=
	=
X-Received: by 2002:a05:600c:3e85:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ba022c9b4bmr53849215e9.0.1794328047192;
        Tue, 10 Nov 2026 08:27:27 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm85050695e9.1.2026.11.10.08.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:27:26 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v3 20/20] drbd: remove BROKEN for DRBD
Date: Tue, 10 Nov 2026 17:26:45 +0100
Message-ID: <20261110162646.3028472-21-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
References: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the BROKEN dependency now that the DRBD 9 rework is complete
and the driver compiles cleanly again.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 261965d7b054..06be6ce164f5 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -9,7 +9,6 @@ comment "DRBD disabled because PROC_FS or INET not selected"
 config BLK_DEV_DRBD
 	tristate "DRBD Distributed Replicated Block Device support"
 	depends on PROC_FS && INET
-	depends on BROKEN
 	select LRU_CACHE
 	select CRC32
 	help
-- 
2.56.0

