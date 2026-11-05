Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839397;
	b=qV42rQmJRxdvc3bf+i4bwKgQyVf0o00nttQdYCcWYhl1P9o49RyQ+ATwg4YhAqUHyyuQ
	 TJf+3PeIgWmx5g+WzqXDmWlgRxrbIyUOSVMTJJO7sfGcmDJrkvrOlX6uRSptWE1/HSf0T
	 xkGgzSVrOGxEQzbyWPwlCPCwWzWQ+Jw6NGgabDCcSw+VXb2FBpxKzQQhz86ISt7in4VL+
	 qaGOvY1o/BVFeEl7COf0xaim7q0Uet+QloAqU/GBsQpU9JKiII5Mp1BDlFXoBkqOICsT3
	 R38wftmJSzrJgunzK9GBiPUQKc2eyzlP5gaYv59JqjrhdhZfVcIwXf9N641Ai7g4hjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
	b=T3vJJ6QMfz5oODZevlgIXQtMcywKojdbTBhSi7Ndt5GRFugzqBThDy5psf0LcUQy+5oS
	 1sIXh40LOM8cYXyuhbNJr4HNOs29cHX/a4YMcLKtwdEH+JVaNxHLhQu1t34abGLtIdUBi
	 939Em8NbRoRFZRMN/SA/LwDlZpDzZcWVrBonPlbgb1kpL3DzCKz184dXPhoeyJ0i9VF0A
	 GW+xeqk3q/IJl9jrEoLy/HOHXTXwjUPTy6IB4IXOk2+GVyxExXp5xY+c1aYXuTcw7S3Hs
	 ypGAiuv6LB6m/U6Ug3BIdg8aBlxvqzb/z66g90l9N0HBwH4lYGYfdzxEuFYQnkmAR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHBe0KMV;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0415A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHBe0KMV
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so14040845e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839395; x=1794444195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
        b=VHBe0KMV+u5jMRSkLnXNHnK0mTosWLIroj2ejLHi5ZRnZUiscTEHSsspxPZulOp8Gn
         twYUDF3uIMUTxDhmLF1w6238je3baH01ZhSyQDC6ZmRr4vyT+AB/GjGQg+akFB9mxQio
         RD6blvWxlg260yKErdKEoqZXyXooOcTCGpAV1Fv2hYh0A1WlqsItwIv5OwI1pjC5B6jn
         jfczZTroBf0+gHZxte1FnTzXjIiaDirC9Xx9ex0EFXvZVl2crZUSX1XJYZ2cWDaJWRaf
         oYokvnvRrbkIY0Srp+Kxnsx5LrxlPvUbftXS6lyO4VevEQqFLnFlERvZozojCI3rvulY
         fKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839395; x=1794444195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
        b=HGHSdgLAbF7ux4jkdeF0z+eZ2zUKJ/WGISfvzB/IwY7dxVMBGWVmIHqNLLiN3cJKoX
         OPMyCGBTaNeyaJHrcsfTI9s9QeMipLLBEBTf7mfHOWnJMVbi3PPZ3Zs8bXz1vo8UXe5f
         RGQrUJAdrHtFEsWQAp+EANBf+Ee1077AlgvuIOviNOEs4r9/Z8/ZdrvfPK5Qb/rpPq/u
         wmsGFOpOMoMePi0zWZjUkGQ03hjo3qOPM3D0lYhKVch6rbyGXSHYqyg6Zoe/mOR+aKtW
         cQmYdubEmH9c0XDMf9z0ZdA8Bj2UoyK0gp38LJvkzAFp+S8DkisgXYhBJex5PIAQDydq
         Zc6g==
X-Forwarded-Encrypted: i=1; AKwUvBykCMyGWVNkhtS0tfLxyezolZuBBjCdOdHwnNNuaJ9LhhsctwAR6md/YnqSxT6KZNtZvvCH1cjrEGBre5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PLELPSNg9sov/NmRcTseGZHGYiFTATGiGfHqVqHdw5xKT+Qgw
	jtvaIn3mJd4pAnKK4imDaNC24ZffnYEMMgVbuh8ksVNkrqPCu8StgZJH
X-Gm-Gg: AYBFou1sxMohA7V1cJSdav1f25YLQcKMxznkg6X7drCN2DWNU2uEeiusYTEmqP5iIDC
	7CyfVo73YtFlpT+LeGr1dnB9IHKSj7ZDJADdME1AujFlQdRoDKpAGCPh+a49eHPC2/8D5KrTHNA
	My70Vxomb2bUJbb47sHIH0ipUEwzM3SvISpGeFgHq+14CjtydDPPQN4vx++pE3RJiQ/TOH5JL/i
	JjUzO3uPdBXTfYaDHIsb1dIMyVIsA9u3kLT09Pklna+Z1P0Zza6sfyxCqhsRjeO63mwkpj9K3OT
	bf9d+iRusFSfaPZqpPdPeRxXzaOx/z9GO03i1YsWQKcddsQIclbYTUWhsAE+ICnxQc3FFjZAbCf
	aqzfsd+j6hs5BFyjaf0TiZZDFIMsulhHSO0Jj90/SAy5b4gqcbsNYXcNQWtVWbqRHHVZiT3cazL
	ugrDaIHpRvwaOaaIfdNfLMD/wlCz+onX0dFbSJIupmbRNmAk5gGPD8Vh7MddVDFGlye5tcz7FS9
	jfYnamZAQ4+JYWmn/5pSO+Ktkxi1DxiegHyMZLT6dEkpudj861eo7kuYfxpT4HuttGTbp+UQUFw
	7TNe098zwaoaDPhfchoCbA2MYM9sza3cPRO0M4rU3pYJWjvLrFefxRqXySEJWmldPF5OQJQv1ml
	i6ofT67HH
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr415678795e9.3.1793839395161;
        Wed, 04 Nov 2026 16:43:15 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm62276595e9.1.2026.11.04.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:43:14 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>,
	Hao Yao <hao.yao@intel.com>,
	"D. Manresa" <dmanresa@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] media: Add the ST VD55G0 global shutter sensor
Date: Thu,  5 Nov 2026 00:43:10 +0000
Message-ID: <20261105004311.144035-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103103235.94397-1-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me>
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

Hi Sergey,

On the Surface Pro 9 (Alder Lake, IPU6 8086:465d), on a 6.19-based
kernel, with 3/4 and 4/4 in the bridge and 2/4 adapted only for 6.19 (no
v4l2_subdev_client_info argument, and the "dvdd" supply name this tree's
int3472 uses), plus an int3472 that passes 0 to the clock _DSM as on
Hao's thread:

 - 4/4 gives the sensor st,leds: led_mode appears without the GPIO 1
   fallback I used for v1, and at manual exposure 600 and analogue gain
   8 the frame mean goes from 15.9 with it off to 32.7 with flash;
 - with the clock now at a real 24 MHz and the link at 396 MHz, R8, R10
   and R10_CSI2P at all four sizes run at 59.14 fps, as the controls
   give, except R8 at 320x240, which now delivers no frames rather than
   the third it gave with v1: the IPU6 limit on narrow packed lines from
   my v1 report;
 - v4l2-compliance 1.26.1 on the subdev passes 44 of 44 in both exposure
   modes.

This covers 2/4 to 4/4. I did not test unloading ipu-bridge, since a
warm reload of the IPU6 needs a cold boot to recover on this machine. If
v3 changes 2/4 only as in your reply to Sashiko's review, feel free to
keep the tag.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6

Fernando
