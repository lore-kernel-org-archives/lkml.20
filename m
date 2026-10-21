Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536617;
	b=hoqEiuSX2YEFCGxTD8vRf79E0B1tUxbD4LFn2yrwjpJRSu8l6cEfddiOdmt10CndZzmm
	 AOQ35HqJBVKPbBfkjrA4fvVQuPSHIPfFAr/XCW2nBYPxvHDx/0pejQMBJfxOGHta2j5Eg
	 EvZg9nbRUytCpp28QsjfNEC26+biWGcE6tTp3kIwOSalG4Fy1sLaAKRlYYhqY5XaldL/o
	 bnvdjj7e3Vd9PDuPD19IJ8ba8z5e1uPiTxrahno+MR+d0qUutoKQw47j8xpwdzWBZHXnx
	 Q42GmZwfAYqHEJlwBomyvazjNOYwhaa23zXVM0JCjVVx3kPKU7co2hOGBB51cFla1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
	b=gmQOJeKVauP46bAzBppf3TuJnuFRQAtEu0br9ZmNO21nfnm+kEnSd9xl3CWMnbwF/Oyi
	 s+QSx0Q8y9S4ljD00osP765dOFi3UQq4GTnAmhX15WVjaG4cq4m/k5H8qiTX7BKoN7d3L
	 DVVDp7C6NQaf0XsLj73dx7+RaHr1gDpw0goZGZZZlor77b+gbHmAiyq5PfwBkUtoLBAsk
	 f1oQLy2c55zQsQrVr+H14lIVQhF7vWLMgLTadJWuAIl/Pn7eHBb0b4inxFkMOngFhT1hB
	 K+5jL1cbhp1pFJnTFxDCImND9/OGW571sZa64NGdtGokVtgaKEd1oc7mZPYBAWhvEHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF3260A2636
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF3260A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xgg4e8g9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so467605e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536616; x=1793141416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=Xgg4e8g9l9wuL+uMK94dlj39wYD58bkokWU6IXHDrEqFjEn1wX0v4SrdzIFkhDzWZS
         8ouLkCKjKUZhm8g3VXnnGB3Etyxv8xCqkfAeJDb0dGKAZP9yAXPMjkQx3/FaJgfIyIOL
         qd5cIi57sU8hx5/MQRqevp6bGulBcsGqthmrkWG2GnRAec+eZ8oaYylyX89FagTpVYMf
         i5XxQ886ba8N3uWHz2nMLm7yRybHqEdszfjY7kRWiInnMb5VAUR3sg/ovWvtn/Ke37lG
         xdVqDCJkXAiksSuvlFGP4vkc3RX2FntaW9vBtB9eEDJQGH/8iYUwbx74DfSSLvJ4SD99
         MFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536616; x=1793141416;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux8U6EoVJ4/TwWYPZhWrag3dDFgz75/l4fo+qRdZwqQ=;
        b=gO8g2ItXPuE0XwNu8yo+OTySsdmCcVlkcycw3m6QxKLOm3jejmcqHw11naPuOB4f2J
         uec12MHrxQ9ROmbgzMUl/pfOubBBNQgHb/pDbZZjwB3qt/ZpIEM3it0GiWxb9G4W+xSh
         17AQoQJgVuHYKtEJSNHiMTg2xsgTJk2X28jzS1EdNLbnSEx+s3JYcUKJzUzFzfKI7fNv
         pvoU+Q9N/zUoH21xXkqXGio52A+4oVG8TNfxQA5+gMqF/m+Dv5EwqNGJE1GQSD9OqUe2
         YMWvxaU3fAXgk9fXWy4skt7l2jPhed2V9n/du4Q/GSK9W+2wkuwwsZEsA/vP8s66S0vs
         Y5Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzF4kkySrsIm4TQEAkWHSOGIs7Ht0TsukQdMB0yRJ3eB2MVWrliyVf9wO5UWv09LIFS5SqYpE/pB/315tM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzopt5zefGkzgYXzsaoCc9ZnpMGakCs+CRqHBeQydyYqa9xQ6m
	jd8liQTfds8UHMbhhKY4ql98xHvRj06rWSG+Fg7aDzqCgfhPIHasOEWI
X-Gm-Gg: AYBFou2EYtlF3ZHznC+XB79MUPtHe8KQfy59lwIk66sJh1HiHLbdfHz3aI6pgc/9x6p
	bfWx6zm8RPZO0ASbaOetkgpc0K2s3wgzK0A36kXjS9RXZDNV1oq18JUZRSFb3tsXm+7z28Eq1Ee
	Yiu+CDrgy99TsbFi67b7LHMHx5xu/96n1lcn6LgYFL4lLPlo6Ngx7PZGGxc+Qf4c1r9gA7lfyBu
	4wEWjw7+d4rWV3FKr2WNQelv7GJLBuEPAUJiQoJOZ+ztKCJfY69WYNPmCnWz6K8cwmugmw86276
	BjfcfqGXR46Mp9D0GfZBysRCNyiKKzEyYpW9ElRI7bN0DgmYUnjiyMeSckN9nfNi13hIxLDN+PS
	rswiLhrtriJgEyF138OcTB/Z5/UCjWp7cbOz1FxJSnJQdfEuMGvNl5op0Q9RPKyQQUb8Z4DK74C
	2GZOYrvO7//qwJJg+B04s322Udnm1GFpFHvMovbuMyBQbSzL4BVQfc0DmXQnM9/SYNPrivAjjSF
	X9BWo8qq2KYQrpl3tMI80cv
X-Received: by 2002:a05:600c:3d92:b0:4a1:c646:3edc with SMTP id 5b1f17b1804b1-4a1fdd0b082mr2686075e9.11.1792536615591;
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:15 -0700 (PDT)
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
Subject: Re: [PATCH v5 07/13] drm/client: splash: add a device tree image source
Date: Wed, 21 Oct 2026 02:50:03 +0200
Message-Id: <20261021005006.2341200-4-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <9834b569-935c-484b-befb-b913acead9c1@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-8-maximpedraza@gmail.com> <9834b569-935c-484b-befb-b913acead9c1@suse.de>
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

Am 20.10.26 um 13:04 schrieb Thomas Zimmermann:
>> +/* Where the image comes from, in order of preference */
>> +enum drm_splash_source {
> The logic behind this enum deserves a separate patch, I think.

Agreed. In v6 a patch of its own will bring in the enum and the choice
of source for the two the client already has, the BGRT and the BMP
loaded as firmware, and the device tree patch will then only add its
entry.

Best regards,
Màxim
