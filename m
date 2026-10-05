Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F091A704B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791168461; cv=none; b=OghWJNSxhXU/EOtkGLqLyLwoE82thVkZRpXmCmHkukaM4WjD7M0apV9oRCfO3X5wL09UvVQI7hNJsiTDJ2+GtE0x9m6HAYjHh7esbIuM85LkSurVP7xB0CEd8DxlxKT+u5nFMiK0gsTKEI35coOEWthL1nQpr8tXNPajGRZrFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791168461; c=relaxed/simple;
	bh=ZgvtJM/DUHMnHszNUGeuhEtSEbOa/wydpZaLbhEugRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNP1A2bpsxGOezL/G5aO8bMb3xpUURCeHAyYBblQniDzd9fqme0IqVR+kjrbsy2z/AXC/QF82jbL2xc6ZYPiyf/O48jZj/i2LBQ9SKUbkv9AvgflRF6ILJtcu/o+iO2Kx8vAPJwCdjwsVILJCYKOs5E/KnVuV8JZ54u98n4kdHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwCEx8N2; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwCEx8N2"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2db9f927cso4677225ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791168459; x=1791773259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fPN+9NWOFucdGixkLZfdt14fhztpKr2pAx7CYx5nGY=;
        b=qwCEx8N24if+xWkPq68GJKkKtl9s60/nbKvwaUX2wbOwRBayypmyc1KZdpnNltelEI
         z3jLKgRVzal74WKXy3R679RxS8cVQI5XCYe6tsSZu47ukr2GhBmJ38uPsVD+3ns+hqoY
         j4y5444l5+sJNRYec2IhVNBrRTSxgd/6zwtBL2qp1Yzsr916lfnIRx88vx6MGrJIZGHq
         Pcgv9o2gbXAQzFbOn2cx2jwNNvnycjML6GI77DBDJqrUnrUXjLXSWu05VEvmxUSz/y2A
         9gCprrmvAsoBgeRbscyjmVpeVdpEznSEhrL7GOxUnJY8TwwSmIz2nqRoYC9Ix7mW91/L
         U/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791168459; x=1791773259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fPN+9NWOFucdGixkLZfdt14fhztpKr2pAx7CYx5nGY=;
        b=228lUlk0uBjCgJq9x/ZuBs7MP4tZbU0700AhCM6tt2q0x57mYWIAE8WZJDSrHuhPTO
         zKaJ4fPWKEACmZuRuRORI9E+qHWNkjz2t9vz6k09j5gQb19Tm0Q95KDgQQLrdUVZ6u2S
         tuSDR1SOmpnCNn1c2w7ohsBHT4HQ2v7+MwpLNNFW9qVFg5VO3tvsNM3tZHR6ZCH/Tt/H
         jF8t0CULuRNgGvP09r9FFu3lLmIELVWRoF8dDgH1mkdwdLyqg5bqoSdy6qbHlUYKjth5
         Q0BFfgqGw1PaT+lmC80L7KukaLkG6EbYd4G+uDOrU0eCQyZswsCn42g0m+GFmu99/7Re
         kyvg==
X-Forwarded-Encrypted: i=1; AKwUvBzyhHUrADJ1dcZVAseqpBrLyeAIUKi0dLCHv/xGGf6hIRscPCJR7tJnoOUZoGKHBhboGzKevwx5QWBd/80=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsFWS6j2eK2GjJHOOGA646c4gNSnkOrheICH/JAFElnxRVjYfu
	6qYtHqhzVoUVkLuZipq3C0hOGWuCi2/b3veoI8Jn+kppXGXr+0Ertz70
X-Gm-Gg: AYBFou1SMN9Co7ZDiPUbISw2ZTx3IaxwNGwGW5dv77D9h/YTOnB/tEu6W8e9IvrJ5cO
	LzNRPoc9aA0WkgnL1rE9B6weX1nMLQ+nW56FzbfVIVTB7Oxk94BP6m4TefZWooXx9E/JSZTIo6e
	m4WWgLHshCSbD+EJMNNz0rLWCufuuA5/hSw3f9iMgyChvBL/C7Lwxp/2pcLU5iSlSKSCpOCkGoA
	2stNd/Jg40ubU62+fKe9yoXtgfuaem8o2Za0MmKqlP9JSeHQJVpKyDvAWlFJvIQsH/+g2VWYZ07
	YS2uZ+L7iY3h0tleQxJi5u1B8Q9baa6moWwbsXteFoh2QyqA1WCMGZd1JO7xnaMdCZWpb+OdMIk
	nIMwqPeOSbSLnodY9YdNsoL//WNrhXFePqC26KSwTYnDUm49+l8t8TDBgr1DKFSuOfcjpAzDIUU
	p+9nddJdZs3sma+0g+yVXdZa85gfUfIYOTuJN2ixOT5l8KrW/8+A8WRePy/KL1PKc+I6HEMZK1s
	u+gP5/6lk4G7ZMYHUz3fFm9/heZmjskgkuhOAlkXOOc8vDVNQ==
X-Received: by 2002:a17:902:d511:b0:2dd:c100:4b85 with SMTP id d9443c01a7336-2e49b6ea3b8mr89037265ad.60.1791168459101;
        Sun, 04 Oct 2026 19:47:39 -0700 (PDT)
Received: from lenovo-thinkbook.lan ([112.2.158.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ef5576sm744665ad.72.2026.10.04.19.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 19:47:38 -0700 (PDT)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: acpi: Add ELAN0662 to i2c_acpi_force_100khz_device_ids
Date: Mon,  5 Oct 2026 10:46:54 +0800
Message-ID: <20261005024654.26888-1-xuyuqiabc@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918055653.GD106095@black.igk.intel.com>
References: <20260918054109.23550-1-xuyuqiabc@gmail.com> <20260918055653.GD106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andi,

I just wanted to gently ping on this patch. It has been a little over
two weeks, and Mika acked it on Sep 18.

Please let me know if there is anything else you would like changed.
Otherwise, I would appreciate it if you could take a look when you
have a moment.

Thanks for your time,
Yuqi

On Fri, Sep 18, 2026 at 07:56:53 +0200, Mika Westerberg wrote:
> On Fri, Sep 18, 2026 at 01:41:09PM +0800, Yuqi Xu wrote:
> > The ELAN0662 touchpad (04F3:317C) in the Lenovo ThinkBook 14 G4+ ARA
> > (21D0) intermittently stutters and drops touches. libinput discards
> > invalid touch coordinates and logs (rate limited to five messages per
> > 24 hours):
> >
> >   libinput error: event6 - ELAN0662:00 04F3:317C Touchpad: kernel
> >   bug: Touch jump detected and discarded.
> >
> > The ACPI DSDT describes the touchpad's I2cSerialBus resource on an
> > AMDI0010 controller with a connection speed of 0x00061A80 (400 kHz),
> > and the kernel does not lower it for this device, so the touchpad runs
> > at 400 kHz. This is the same issue previously fixed for ELAN06FA and
> > ELAN0678.
> >
> > Forcing the bus to 100 kHz was tested with a DSDT override on the
> > affected machine, and the kernel confirmed the override:
> >
> >   ACPI: Table Upgrade: override [DSDT-LENOVO-CB-01]
> >
> > Before the change libinput discarded three touch jumps within about a
> > minute of touchpad use; after the change no touch jumps were logged
> > during more than an hour of normal use. The patch itself was not build
> > tested; the behaviour was validated through the ACPI table override
> > above.
> >
> > Assisted-by: DeepSeek:deepseek-v4.1-flash
> > Signed-off-by: Yuqi Xu <xuyuqiabc@gmail.com>
>
> Acked-by: Mika Westerberg (Intel) <westeri@kernel.org>
