Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587034;
	b=s2a7IFgC2EZkHs8+3FD2IHlvnQuE6MevHqJSTGfQlT7MPr+sq1p17emPlFKYhYrtk+1c
	 QUsO2GUeHEq2/59ycdwdCLw+EDP7/TonoyiWGkUYXs3MOGUw46grQ0FTeEvLYf++a6/4A
	 oTJO4JKktNXyd2GLUScGQX9LC/gCepWACiAy4FM5cAjQMZMpWSAyirom1RCGO5Vt445sl
	 IKr1bQ7RvtGp5WEnfHrvH/HNepUXrOuWJTL7d/IkaePnZcFdMmT4O2OpvEBuj3fjezlVW
	 Xs8BCOBK0uF/sEBDWlMwaTMfZH8oMZszGk44x5xLytbfqAli8+HSsArr9vglD1gcY3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Uql1IwsaB/smSAybqhDdELR2T0MP/9M8xw/lDlV6oP4=;
	b=FRuAVfiq/LaIJPF7GUU0HBslhL1xvW5SGg73WjL8UHmaLJH6nKB8DWhx8t73ySThafTL
	 hw//OjKeGKLhztQ8XU545P+fTGcADeUDyLW2qc00eGqon8j7JyQ9dJfcy2s8GOUGRmRRR
	 VvyMud4mLR8XvtzwI0mRfotEpaR2/SDum4BYN9apbNCZBX6zYqsUoCqY/SklPLlyfet8s
	 3D2IfG/pifr4gh7k8mzI6a0bR6jnXKSreTTOgX2Ywhr7g4VCwFOwH4g+FARGk+C68lA6x
	 m+PdakjNOnmx+W6Db7KVP2fipyjqJGLUw78RgQsNUJVEhyORJq9jnfqUp/poQL8/eHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxBQmMr0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65AC606BAB4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65AC606BAB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxBQmMr0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so18721345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794587032; x=1795191832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uql1IwsaB/smSAybqhDdELR2T0MP/9M8xw/lDlV6oP4=;
        b=hxBQmMr0tP57bm8fa+eZI3vHzyrD10SjeZKtGgb/4cLOQNs04zYPzLvlFezEV1SBAm
         87C8HfyUhvJHBmBVAwujffVoDMw0Ov4lTbTxTpVjMJUnGG8WzEA8MN/M62866IsAA74a
         osGa+PAF286bRMcEKOKdpYm1g0w0nxnAh06ejcuJ0UJfnrVn+IX9rihwePthVAX3882x
         PsyhX0Bpo38t3u+hpI92U1cHWbmVuFMkKS7sutzsEfWb/xg6RMNCwov4cXdE50jLjMC7
         o3kr7k83DbUvpMll0JoLCmQ0hStNESDhH3Zu6Hbkg5qxOFawOjB2OHO7gH96mri03X3U
         LuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587032; x=1795191832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uql1IwsaB/smSAybqhDdELR2T0MP/9M8xw/lDlV6oP4=;
        b=BGpDRXHh7gMD2YcQ4+2Wyqb2w1mAdjD86Oim4gtfIdYA7xrMlLqqsH8+Nuj7KcNqsD
         F8e/MGKlg8B+DplcPG5buw/O8paT7aR/RXcPLtIwMZjNbBIGDHe6mG4BQUo5TqlXaIZC
         7mRJb/li+n49cbUsZx/XgTt/8h0K5YIF6yvTBwFbopUlqP/lkddHuGT2T3dIfQpcYYf4
         Gt91urAc7aLMHFGkAKC6z+/ycq2XGpSOOCKWX2IUfb6CBoy3l3itoWJNoqp8HMA+jzy3
         F4sE1Al68N4ZsaaX4CvJu2joMK56usUD3vxyHew1xohL1WpsfVq6PeyaQBbAZSM3ACzz
         WiSw==
X-Forwarded-Encrypted: i=1; AL+hErEttemdB1IL6W2ONtwWhYl4YZh8adcaH7Qk67nqNE6mHfttrcU4wz5vRoOLer4KXBfmzu6ou/6NZqNWF7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hYMW83xH/fnzD/+nZmTtyWlKpGubNjLAefJRnInOUu8wUsp81
	XW2ZunSNzD08JJpmOUiOoylnQ2Z72ubP9uKq5AU06ZiA29l91O+Vx4o0
X-Gm-Gg: AYBFou0uo0v2A6D0NyVWg7uwLI7QAf/UkriA3OaYfUCMC4vLiXt/LHuHPEL90xr06/1
	dt/hHeGCUFDPKa33kXzKORi3Fdc0/ETRd30ntKWQPxCi4sxFIr2+O13Wr6UZpsJu1ROjouZQGBb
	uAUWYb4gil44EwEjq6Sd6iFejH6OAH/gwBBeZtKK0BCgTtsevUp7ZBWKIIkjdu8+ezUzlIU38Ps
	0HwbUnYL+bwR2XIfnz1nTUB4zLewjB2nXIKYsFQ+hrDRvtTtaBOE9HMvAxF8a8Cr3Xr18dKZLeL
	hUO07TSTJLHjM1CqxaYE8XFHKLu6wbvIt+GiarE+5U4D76O/4OFUvjOov57PvFbF0FcjmMr/SF4
	E2cvJHKF4yIt/5NjtU4jyd749nXRAQO2UbkZhDgfEOmT0LLlQaU1mEO/H8eIuSykg+GCjO5Ou3r
	3A/DQ1nhGcnYax9twnDtLkM+z50MIadl0M1mjoxW5vQeJQ8hPNI3FBYNav4kdK3G3qxji7XlrDC
	L2l+It+MaxrdO+D0nFnvw+oGc1SQT8SLgbUrGIkyKFbsFz2tAXBuERcGhmpFRHc4IiBq4Y7tKk+
	6N40RIvjk1Hv6zItysxoqA==
X-Received: by 2002:a05:600c:4e15:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4bb55a4436cmr62229995e9.5.1794587031993;
        Fri, 13 Nov 2026 08:23:51 -0800 (PST)
Received: from fedora ([2a02:168:fe54:0:500c:846b:8abe:fa7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm65716205e9.4.2026.11.13.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:23:50 -0800 (PST)
From: Cinq Prairie <notprairie@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Stefan Roesch <shr@devkernel.io>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
Date: Fri, 13 Nov 2026 17:23:47 +0100
Message-ID: <20261113162347.5617-1-notprairie@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179426098226.155418.4382559329615606121.b4-ty@b4>
References: 
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

On Mon, 09 Nov 2026 14:49:42 -0700, Jens Axboe wrote:
> Applied, thanks!
>
> [1/1] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
>       commit: 39c7210e970200f8b17de3767c73efe64173a95f

Thanks.

On the cond_resched() follow-up: I no longer think it is worth sending.
Since 7dadeaa6e851 ("sched: Further restrict the preemption modes") in
v7.0, PREEMPT_NONE/PREEMPT_VOLUNTARY can't be selected on archs with
lazy preemption (x86, arm64, ...), so CONFIG_PREEMPTION is always set
there and cond_resched() compiles to a no-op. On those kernels the
need_resched() break in __napi_busy_loop() is already followed by a
preempt_enable() that reschedules, so a yield between laps wouldn't
add anything but a dead cond_resched() call while they are actively
being removed tree-wide.

Unless you'd like it for the few architectures still able to build
PREEMPT_VOLUNTARY, I'll leave it there.
