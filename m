Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819218;
	b=YOjU9neY8bwyYTa9VTZLJHPg7tUiHdg6TR6tuUGZLMNNlydqqc5At/YHB5IpwW5aW/6t
	 uzyg24dFvmbOCpVI+zl9Jduw1bwqUB8tkeMfuYbKXK7tz1UPp5HDcYpxZPbw0pBA3f2Kc
	 xCqG3Y/8IffFPHnzlsaaLcw6CyfKZ2N0UotlMDZmqEq3YjUmvZLr5KVJmMLWcQ/TTjoWX
	 ss+YbrBZTNka4NIpIiUj0iMY5ZLR+cZyjTcXVYU6XMZ8D7cUlC36OWx9vDbKysRC+kyzY
	 dP7fSIe1l5c8XdYQVxSSGY3IgP6Iv1M07pV6AFuoTWJ7gQTmNjzXPCVXVNP1UwWkiUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4GLuOUeqEK6qd9I17ORJDYTZ4CpL0kgFtBJTA57pHhw=;
	b=R2+Ad2JDMTQDaZIEpjcK3Fe8InuWwIKbJv01s4KN0b/nENB/rZXxFgX1z0MHStzni9qs
	 H5m/87SV4KXFXNRr5XtVIZ8slxxFNAogxe+KvKXqQ5qQfIjeJlObbfWfqkOwzE1FyzfCJ
	 iTONuj/BLnIDJJgbZRnr8lj0+rkEp3rHX5yZQ4IRfJh/LGbxZ/metLXGvZrFvDMLIuYyb
	 6SFSx0V7s0zewe8iv3cGSSC1FMu0vjnm8dZ7J7R0fM1GRgYbtvocikSJTFCScOKadH/mY
	 Y5YgwLZ65U1AQUV+hMNcd9001xcFPAlvrZvCkOzXqsnBId+rs+MqFGU2cNu2d6tGzzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h5EO+r4a;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C2606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h5EO+r4a
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd76b1361dso8322315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792819217; x=1793424017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GLuOUeqEK6qd9I17ORJDYTZ4CpL0kgFtBJTA57pHhw=;
        b=h5EO+r4aTYV6LkwAIdLngJEdFdLKmT/auixAldCoc7KanbcF/Ey0bChyjTMe/NphfM
         OnRz3JSulI45FAW0zMXVtLthka9wKo195UsjguQHIDqkX64IJ1IovSLTnAX2+6gy0QcH
         SBA/x3eaMMda1Z+/vNKNsG/1loR9uXLa5dmtPSoTRbdB2VxtXwb8MFHwRJ1NSLUrC2Gb
         C9tIdGL1eOiZ3ueCBtB2BdpyqBBSMjk0VPqkrVepi3AAErAgc0+AFnY+ToPV0LNuoP8u
         vjofGrldZc06N7UXsZ9xnQiDbzLjJvkjvBaMsB+By/Uw+0wCcsdiEoIhak7xHzlJP7Bj
         khkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819217; x=1793424017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GLuOUeqEK6qd9I17ORJDYTZ4CpL0kgFtBJTA57pHhw=;
        b=AcDesjsNFGP+a7LKOOR0E8pBJf6K6tn+5aYkzGFHKXmNDV64XlkCHA1ZkrVjwbBdMX
         cW1eQm7ZLRWqFzdiihOZQjuGjSetYlDjMb186BlFS1ZskdXCuwWrWlYC31Svo2YRFT7p
         KsEoSmM0Z7Ff9mhAYXqK7ITYgi/MuvScxmeRvmWywAVfHWP6K4Xa6Zyr1ftbFcu6RIoT
         5OWXkyu1Hfm0WdPPAQtyxd0Z/+3WbXNXLXR5FVU+f2K8tkUiCJS+ObyOGdsWZbabYpIw
         nz3WbEQqKyGg7cWGAcpoGrHwCzqet/ziToMgZtfOixSIxNuSO6XNqTSwmO7jM5bJjnij
         Psfw==
X-Forwarded-Encrypted: i=1; AKwUvBzUkocb7Onmz9+Lo/pOTN5sycbUse1HfhRUtdRKI8z3z8GJ+dzGWGl/DsZQBmqh9uwSNmPgtpgzYQtGFog=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMTVTgFUiRA0gujj5u3U99Jlr975dPMS7L1y36MRW7Rk8f/FO7
	LRPn0+Mg0Rb8ckgOA2E1Yzlfo89yY040ojEiJ59O3TdiiXptChMCG1dp
X-Gm-Gg: AYBFou1rIjHTyoPkF/vBUbpuWt5WuMbDTcUQi9X+eoIH3u9IawMXQzHFgMNISxc97WV
	sZoyEduDnascYqwshlic3NUnkRehCw3Lf6xkZCW/8da9JdebyJLBCh6O5ckoRwoDivOx9BxS5qD
	n1KbTb7g6aEOPepCTW4GWa9Gsme89sMZWmSuYtVejxvEXfYhUyKB52VPkveJw3/EZPZP4agOZ2C
	ep9BIl8hLYdlTjWdoAR5o80cDvLJAfuQoJx1qHnING9zov6lrrXGE8gm9P/ETp3ou08LG/Dq7+P
	evdd/Z7jvtTz/TpW+CQecNBj1m0bTXMsB4tDaCwn0KkTCQREfxVXs78japJxHhDTNbQe2fZh5Ku
	oyHm0BYOoFpPSwMubGw9gskpqnaHYndowt5BDjMohKRGx/5OIGa7fpyVIovOdvwBw33wpQd1yPa
	eduA4UYd3/pVcKHq+rXKJD2wG43RgXzVeSW5UrahmxuevzqKX6VkcQ1zQ1qLMrbNXAgxAKKyFIq
	RaH4/3k+0lsIPavHD1xLtrdEe1AwvjD2LDc0OSm0JdlWDqeK+R0Wuh50WXoQKr1lgXTCo0=
X-Received: by 2002:a17:902:d50a:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ea9c66bb6emr9292565ad.20.1792819217100;
        Fri, 23 Oct 2026 22:20:17 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c30asm2701535ad.36.2026.10.23.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:20:15 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Sat, 24 Oct 2026 14:20:11 +0900
Message-ID: <20261024052011.1358-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <c1f5b813-4228-42ff-94ac-2ea6533328f2@packett.cool>
References: <20261007155848.106-1-26rote@gmail.com> <c1f5b813-4228-42ff-94ac-2ea6533328f2@packett.cool>
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

On Sat, Oct 24, 2026 at 02:58:25AM +0000, Val Packett wrote:
> This part (msm_dp_hpd_plug_handle) is now also handled by the IRQ_HPD
> series:

Yes. v3 is on top of that series and keeps only the detect() part.

> * if we "find no change while unplugged" (!was_plugged &&
> !priv->plugged): no drop, is this intended or a leak still?

It does not leak: the existing put in the "if (!priv->plugged)" block
drops the function's own reference in that case, and only the second
put depends on was_plugged. Agreed that this is hard to see from the
code, though.

> * use a guard (probably PM_RUNTIME_ACQUIRE_IF_ENABLED to keep the error
> check) for this function's own reference;
> * and use a plain get an extra time when setting priv->plugged = true..?

Done in v3: the plugged state takes its reference with
pm_runtime_get_noresume() when detect() sets priv->plugged and drops
it when detect() clears it:

https://lore.kernel.org/all/20261024051952.2006-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
