Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536466;
	b=VKcegE/dTvCbItziLoqP9jg67Y7hUNiMjFhxuSBe8Wu9Hje+9skt6XXNW6o0nUilVcIF
	 6fZzM0WSwgaSlxEGDysywRPpAeNBn+xmP7+7pUbKSGzHCPWB/o6GQWByI6LJ+rGX9CliY
	 7EpfWZpip8pZaGpuoumT+M0M4wXQbUmWiX63l7+SBuc0Li3DlBnsWi3kKzyY1pqiosZeb
	 8//SlAKrniqKEtA4/A65g7+yDmqpe8qi3NOY2FNKmUFfybd+sPJOT+YUxTvicH4j8Xt+t
	 O2Z5M4rgk8rh9II6vccx/U91SHW6vBxvGyI4p4ZEqkR6krrFKxj3fGNQRMGT+Tmj3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536466;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uei3X7eaYXoUGpiETn67YwHGgpXCnW4kjNL27gbEkSI=;
	b=LnM4GKnUwujA9C2VPBEe40JJlTlNBeaGNx38UxYVPFE6hZBoKBKpHnnDrXKK5kAVR/dJ
	 +fVZ/Z5gZ9Kw5JDULGQvmdUcFpmldtsBOFdOYDdqeDN9E6WA5luvn2/6mX9suqgAPhcbB
	 mda3Ue3X2iDXBAjlQ2mX4pPGAuFUKyLaFbkVLfwTv2cMf5BofNbLowLJZpeIfi11BZVzY
	 ZE9ZjBRAK4Y96yoritOvdRijn7mmt2tQv9oa/UifqN4l2ti9NS0KRXRV8DS70hnGYw9pf
	 98DJ0kyJhH7M8YsjXMDaq24XCuGhundstKvampi1cq5wC8Nq/Jx9E4fcyyWZB5f0OPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D0606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677af43eed4so413870d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536464; x=1795141264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uei3X7eaYXoUGpiETn67YwHGgpXCnW4kjNL27gbEkSI=;
        b=d38XNWgn6Mw4Nq/JOAW0daYKRnb+Wvqen+amjwOQiePGTcbDe//dH/I6Dg22UJdDnS
         xraIOVkmkHCVeS5v1jtupdu9RnM9PuakMSaFNO10cEYK+b8UMlF//c8K4sJHgXU49IHb
         6MRxUECemmiKWHStqdcNR58TLRLVK956h7OGSKOtyCKCArjvlXu/m81KTYLOgpOsPSqw
         xEbDg0VcmhyqZpisC/+LUSPISeM8MskNE+kwzV3rxyk/NQKRKLJR7EOOYXNv/276pT9G
         X3np8d+Nz3dtDe2FJT40RBeqf7vxb9uR117LLp4WWqMbsWXLJIIbq5V24MEgpxzjb7hu
         c3bA==
X-Forwarded-Encrypted: i=1; AL+hErF2kmmMKd6h6MjpCLkJiJt/ocIKUw0ukblpkb3IEImps02HVR1iBakSFvQyYXp/4f85/Rwlt4Gt7CbNIOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9hLCy83/5W7gHR8sMxVTGZZ6xNI+kYhX6iipGDzvtAC1qMH01
	1hL0Djd2ZI8Rd2RUhVHlvtc2C3yl7VhHzeGeTGNFC9MjNNW+otA1qvkp
X-Gm-Gg: AYBFou1wZCAdtw0/Mr8w5InT0+LiaQLa3iRMXYk3hh0fl+ngMHPwfIXAzPfLiI7s7u5
	EL6TZstrtGL6x5AGdsVQonRG9hp8V+vZD28OgCmWbtSKUVgLnKoCSkd9uEWgu1JEHnq2EoKKDi8
	BmzutV7GfwaCQRnnZ+/wtj9aJgK4p84ZDti+WPnCanqFxX9rq0Hvf8bTN1em8oXxa5xADqWSO99
	iGUWodFR2Kk075BKTCLGAAeDMcPU0kpDkY5B6iA/SD2u3BeW2I1qQWCmHd73OtQf5zIA1zBxrfm
	BwyFGoaSTxmrjpbQzNGFLtcV3d0geeiuL5WOtQYToS6yNfGIpkqSUnzstJtKw22etL7ms5Vjymp
	IzRWQmIDoOI024HfVZhC/Zi94p9S4GPLA8E3oYVtP4oie4RFmtbP6xtt9hF1OQTouCaDal9ravm
	5jg+SdsZ2KUR88rTS/dv/auHfvJfD24kr+CxY+6z6yfhCWQP8/IHsKMDX84AUgBSy2xHBphCXoh
	QyLc0NqYM2uTRbngwCisqPE5O3NLudSfQAIVk60MejU4FCmmcwDMRxYN1P2/7883eVouQ6HOq+Z
	W49MNEzrEvttw5ujqx+L0k9txCmCMb6688M/D6P9EdbCH+Yn8xYK+Pwv7RKmVamc9Ar/4+Wy7Hk
	ONLmELb2JptBBdDQNjcWLXRJWEKCD39Kz
X-Received: by 2002:a05:690e:168d:b0:67b:ffed:e1c9 with SMTP id 956f58d0204a3-67d896a37b2mr912238d50.37.1794536464486;
        Thu, 12 Nov 2026 18:21:04 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a4339c3sm890660d50.3.2026.11.12.18.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 18:21:04 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: operatingsystemsdepression@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joseph Telaak <joseph@telaak.dev>
Subject: Re: [PATCH RFC 02/13] drm/gma500: Publish the Cedarview SGX as an auxiliary device
Date: Thu, 12 Nov 2026 21:20:41 -0500
Message-ID: <20261113022041.74295-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
References: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
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

On Thu, Nov 12, 2026 at 11:08 PM Gabriel Gama wrote:
> Hi Joseph, I noticed that gma_sgx_set_irq_handler() updates sgx_data
> before publishing the new handler pointer.
> During unregister, could an in-flight IRQ still be using the previous
> handler while sgx_data is being changed?
> Would it make sense to clear the handler first, call
> synchronize_irq(), and only then clear sgx_data?

Yes, good catch. On unregister the data was cleared before the handler,
so a handler already running on another CPU could see NULL. For v2 it
does what you describe: the handler is cleared first, then
synchronize_irq(), and only then sgx_data. On register, sgx_data is set
before the handler is published, with a release/acquire pair against
the IRQ handler.

> Otherwise, the auxiliary-device approach looks interesting, especially
> for keeping the display and render responsibilities separate

Thanks, that was the main reason for it: gma500 keeps the display, and
the GPU driver doesn't need to know anything about it. The same SGX
cores sit next to quite different display hardware (gma500 on
Cedarview, simpledrm on the CE5300, omapdrm on OMAP3), so keeping the
render driver independent of the display side lets one driver cover
all of them.

Joseph
