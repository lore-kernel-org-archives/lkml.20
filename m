Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450143E51EF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938704; cv=none; b=gk+0BQo0ndBT1zEGKi9FWZ9JykYz0unbVfDYhoKqsOsdlMUCNGBuzaPvJL2wuOFzWxXtZ8HhGLCj9p+aeDOjxNhsh53Rkq1hjlLPpfNDu7wMlHijVYwKBninFeX+069VbsYYzerQqcB3I5xziqxL+p69SM5bJ2JGH39GHivE7ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938704; c=relaxed/simple;
	bh=6IpihIKg7y7X2cwXfcmqkmOxJCzJb7Ke/fCjIixrgYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVqIf8/SvxA0G6HiTgrSAVHqjsubt0qXP9eoIV9sVegUBcAtGALzr3jc1EGNPRTuCfXYOorMjJxgf7bImjGKIgtlVykDjSHDzJyHqzv90mWi6Lg3UReiiwzwSaLns/4lItmrtgT+ZT72NHm5OeskEQxrAp4/ovW4wDnA7DqFkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctdGs+8w; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctdGs+8w"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so4063566f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788938700; x=1789543500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IpihIKg7y7X2cwXfcmqkmOxJCzJb7Ke/fCjIixrgYE=;
        b=ctdGs+8wEAYbTbCeAp8ELG1CwjP3pXcBGVSoduIKr0ldo2r+KDJZGduZCG/BpoY6pg
         yecUBlmUEataUjdPUK3qzadO6JcJ13qjR8ig80joGcxStO7bEP8WDMXCTDJ4pxP8B0Ti
         TyElTkg2UcV1eKHzLQ8BMPfDqtPfWyvim3+uTNGMDn7Uasiq+9IBKRPHJmJc1bbH3t7Z
         vF9xWYAsNTOroKZSDWiW4cKfAkNBiFHbjIebIuRj7OgoSUWtz3pWHYREm/PzUdsceGJL
         nGWbtmKvMCq6C/6uljQNpUVE/J9xvBrQ3hz/5Z2kKgdyIB1nyUXnnTEO3oASsiSzZRqO
         b51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938700; x=1789543500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IpihIKg7y7X2cwXfcmqkmOxJCzJb7Ke/fCjIixrgYE=;
        b=B4ZzSw6OkAMb/zdI5y5OuvGW+MUj4G/9ab0MmetP8P4rzer7swe3SSICb6vDGOJvC0
         OeYsWe5EMc1AMdFIgVUmcSzJgWpFBQTjMS16lL+S4reKuLB4r4kTEqn9P66EJxc/0bjq
         gVH1/yX8PxibGWR5zP5pIwHNIlq3042TldvTvUe5gTedmCEfKQSCP+G4e77Qhw9FYcHF
         ET2Kbks4dGHrjwHtH10Z+SsYs8MlO+shK5pUoPT3c8dwGgROINkz3EWizQXpNsB21AWo
         uJJANnmXMnnV2C87Hz4pCUW7Ozx1VreQeCaQI32st5UPzaOhWVaDJ60hUchp9Bn3mL31
         GkgA==
X-Forwarded-Encrypted: i=1; AKwUvBw8NF3/h7i8jOxrORJQkd3xsMgCx0nWiy3O42fB+y1PeumcxVMmVy7+gWPRRT9bNglNQCZVLQbqyuQaew0=@vger.kernel.org
X-Gm-Message-State: AFuF++m6+EGB4BF0yFbCuQSmhGtVws5bXVF1UOUYBpFdWAhmorFne4lk
	1h2Rv9k5is6kWA69whFsHvrTk0Hw5m9jjeymj1E/E1IWtADEdCKVcXMg
X-Gm-Gg: AYBFou28+g04Mrfe7oEI8/xoDVO7db9zEfsiJQ/stB87UE6JgrrKCHYKBehXdV6kUKs
	QXobVUVkZMkA6NBK6P4a5wfvYio+5RclJOpR0CnJV7GpA7EJNqG/kH8UYXzw2JaMd4GdE2k5hwb
	pAHQRoSnZL4ew5+veCmiUA5HBBZXzmGlXHXlsMG4D5/ugG5bYHrxpAOhitXblZQhUulKKEy1Ytc
	zeK4RllYtigEgYtq9mpyqyNW5pVP5St6aIU6iNfkj2pvOtJyWaiElbf3ukriKhchS4jRPAK/ZzC
	egeo2yZF2ZhYTJedWshlqjhJMmzvakoAjTGzdN1xKdet72r5EeL1Uok3157eUy7SUS+Q3sJ9Twv
	p0tQIUQI0p4Fo/nRt2LrEh1nhqDmYsHQ7KYJo9AqI3vSgm4KsU4aIqy30hYEXMF0tTNa9jVKlGg
	rSRw6d7EYExhSfMhBlp6RgX15eYPpPyPkLfmV7JxtgbCHoQdG2/dMHDJCU88j5SpkSgOqcfvZXL
	WtpOn80o1bP
X-Received: by 2002:a05:6000:4909:b0:485:8c17:9764 with SMTP id ffacd0b85a97d-4858c179966mr30927449f8f.38.1788938700220;
        Wed, 09 Sep 2026 00:25:00 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm41527265f8f.18.2026.09.09.00.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:24:59 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	david@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	kpsingh@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	martin.lau@kernel.org,
	mason@kernel.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	tasos.papagiannnis@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk,
	yonghong.song@linux.dev
Subject: Re: [PATCH bpf-next v6 3/5] bpf: Add user memory access kfuncs for mm_struct
Date: Wed,  9 Sep 2026 10:24:34 +0300
Message-ID: <20260909072434.66868-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4ef240a5bea36ff84df9589671367832860795159386a4c8fba546a0fa8b786f@mail.kernel.org>
References: <4ef240a5bea36ff84df9589671367832860795159386a4c8fba546a0fa8b786f@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this drop the address-wrap guard on !CONFIG_MMU builds?

This is fixed in https://lore.kernel.org/bpf/20260909064231.18693-1-tasos.papagiannnis@gmail.com/
