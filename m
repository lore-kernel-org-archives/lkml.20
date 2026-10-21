Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536619;
	b=b8YWd6bmjUGh49F+lXbH21eU226abvo6tJbC7rHe0vphWSQ20e62FeCUE9SJeEevi+cT
	 PI0MKwUeZ7On0PPk4K3rPDHKYe91KJ+J7OWtXlQ4rOmONs1uojije7rA4TuXQRiaxvYGD
	 yyfDYEjPmSFhZQ0U/ZtItSLpyNVX14dziT+6fI1LCIlSNCL1Gvh3TQSdJs303QlTW07yz
	 iUuaj9b8gHfA62mfv/gABpWdY8Uuv7WQlb7mhnk45dALO45Miu2K+fcDFXWqEK7lsT2tR
	 /AKTNPGJVifTGRhHYUGnBMn//GNlSpKNQsvAqVh6pF63FwsK8+kFCK1XVLEfvKeNORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
	b=EH5owTmf/+Gi65BBVIDUGtrehx2GobMggHNvu21X1nMmwGfmNW9M3+z3zDVMK7hO+h41
	 JrIXxrCyg18q+AfRXN6TAz/XMDhA/BexVGTLdB2FDi0FixHYYRf8WHwODGuIABY8DHx6K
	 77PFOoKcmxrVClb2nibu62f05C9T5oiA/LoAfCL02ieNsNV2kksx5YCDo1JGtqI32/7A8
	 A++F8LqOlz3PeBHfeUvgEXVKE/Y5fxHoY93tIG+/WnlyVxn3YEadKfzBSg0Kdc7Ovya+n
	 W3bUJlxJJcInKz5aYktNoUjghxzK6R3gZjkNs8kOydHaz4sp3c/Kn2ohLg7L95jTH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC39606A338
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC39606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1347045e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536618; x=1793141418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=Y9FIbqDRFsiHCh6wCMx/lGXYMzbEMpcYPExHRKo8kxmfRwSdsbHKcVN6b2o3fsfWmS
         EMfNStvVEXtwQlwGFhTspCN6Iy8LsIslmTQJZArs9croRUFFsg9a0R2Wmowm78fCGk+p
         qoMRAjWrlWyjvmo/cv+QOkjio/QCUym29eIrZxNWbZgTO868C5tZQiYnBcrDy/y+qYxV
         AxXCy+jIbfVSYNWbB6SaV+1+cus75rqPWlO2twcCFTqCAqrzmVEb5SQPuQ0TN5KrYxQd
         MNdNYIr9ltemS55NjRHUaTPPPJnI8hAvgtgmCV7T01bNB3UVCcpT2l7+0a9cI5hk20GK
         EuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536618; x=1793141418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=gkbYU1xObqOYFyMY3NaepXGie++AEP7ilVlHt0IIkWZHbNGfWuOUiqgMqFHcSs/J4P
         qYsvmDDyhoBpD1q9Co/Bgb4cIqpMA2bbWIWAZ2fUYzKtoxlPsN69I7pGZBC6Tdx748iv
         jeY0fLg1pA2mBl4+WFqhadzD8urKNKHwkPFymwvxMtSTRFDnJVvRxax6avwJoURdJ9IA
         u2lGRDiKxuCRIUSZIu6Aq+iWrsg6/yi/jeYRBO5aUvAZ3A0SnNKZi2xAfglY78FknXZx
         kIbIiyZHI9V9RnukuApp9mRHjVfITq6k2M9roYMxM8PI2i4mC84akDxgl9wHZmlBPbpk
         hklA==
X-Forwarded-Encrypted: i=1; AKwUvBwndM5B2wDn9Pj+LU69npCeHcinZcCceK88dugAy72hycbwBM/WOv7PinmVxiS3Q29P/P5U7IFD/wOeHS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRjhns3H31D74sxfBiKtKYSBuBZEUqO/7Lh9HX1DkkxnIe8iU+
	8U6fcLJshw0S7hs96yy/2fSi3ILtN9AfG4iar/Buw10DVMw49du9rQKm
X-Gm-Gg: AYBFou3U0H+oT5Kg6L5T3Fr/FGiTn2J+rxzKFjpz6rd+RRYyNjoAwFxOhZtRntW+dqB
	Umg3ZIvHI8SUUMxi5Uwtr3UrCNO3xYpa6bvKofBc3mBbzljkrM3IQDkuOQn3Y+FBAdRNyLhqp4D
	wTsl8f5RwXNKOeTwCFb1OY7ZNQV9oeZ/QbP4Pf9k8t3mlRHyCRJMOel6/N3ZCZ5NSR01Ddi+4OL
	OTyteB0fY1uNy95GhoWCY2AchQAel5wK0W24FICy09oINjqSnvjZgprDWCC0dNNpXJQKBFwfUYG
	3/xeujU/1B+A3GH793J1ZiAlP2picfgFs/Dc9S10GEgzLPpSiQtPrAoD5kcl0MAy6po/KdMQnW9
	Pp/JL4HAbjx5AKr7P/Eu6o1F/v6DDMwQqZ5wluFCEJg0e3/btSlgj5EP3FchbboAiWa7J1TIR74
	B+CQPQI5QjvqV8foKgsp6Q+H5FGAiMelHZdAr3Cp+tjKKEFAprjFVTCqfE6fNDBGQQehkLgkYX3
	HmYmrxdPcfjBrWyk+OiqnD/
X-Received: by 2002:a05:600c:b8d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1fdb165d8mr2576335e9.5.1792536618009;
        Tue, 20 Oct 2026 15:50:18 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/13] drm/client: splash: turn the device tree image as it asks
Date: Wed, 21 Oct 2026 02:50:04 +0200
Message-Id: <20261021005006.2341200-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-10-maximpedraza@gmail.com> <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
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

Hi Thomas,

Am 20.10.26 um 13:16 schrieb Thomas Zimmermann:
> Reading the code below, may I suggest to do this in two steps: first
> read the image data into a temporary buffer, invert height and rotate as
> needed.  Second, copy the temporary image into the graphics buffer and
> adjust the color format.
>
> Eventually we want to have a useful and flexible drawing/blitting API
> for the DRM clients. Keeping drawing steps separate will help a lot in
> the long run.

Makes sense. v6 will do it that way: the first step turns and flips
the BMP into an XRGB8888 buffer, and the second converts that into the
framebuffer's format. The buffer is as large as the image in
XRGB8888, up to 8 MB for a full screen 1080p splash, and it goes once
the image is drawn. If there is a helper you would like the second
step to go through, or a shape you have in mind for the API, I am happy
to follow it.

Best regards,
Màxim
