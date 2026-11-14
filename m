Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697343;
	b=0CRJlnYrANBJ2EqRjP1XCK1+XDsePnKB0bUdrW3jmqeKlc8Sb5Ehq1Jd7D7JlARpH6+H
	 K/IeQao1BaKvsr01PhVeJQj8bs7pl7O1vTgDp0pVanHEy9aUquB1A2il/YrG/En12mWAM
	 iUknm8jFFElmrNrcGPq6X+KldCXZlLNKJkFbO3J4LfB3s/sxfPybLcf286AB4sD4PlJIX
	 yq6gnFXQfIPixM4Gnd34BWtQhURwWD1JSog+6Hb4PwqWshCM+TPGT1ya8Ioq6zFFmeigo
	 S9dIGSbhGYsq29NTMTi2DpAFP24TkqJnLk1a/WvgBXu+ExADYbZ60+OWdAgMMopEzpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=ogoLg/UrKn4w2HbWGHqWFTtUp7LAKklTdIxHd1gOThQ=;
	b=tmPlK5zFQ0pQwAUJTt9WV2B6/lurF8NsPVJPZwie+Hvgpv0SActv5yVOmmeDtHJrsH6s
	 8IkWXFl2JH/FV7VwuE2XC57PS/KIe+DcEcn/exbLZjnKHvWuUS3db/wUVg0TcWJLcdUys
	 RuK2t8+cdXQmlvsUqHfxBrh6btd/+6tmTULnHu8QPlwEC4iGAahkzpfiUeOTw4mg6QpEF
	 DeR9FcraR19YXFQrZo3M2s9rbSy6+sZKDw4e0X9NVOhHj/GWSlydGMqT+mqV4aIehfuO6
	 oW7gNk0GEpXZ92LoIDOl2d5JMJnexpAe7GnOoQDi0XbyIUKol+157kKgM5AbF/Y9+vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MXuwAjHK;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7E606A8B0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B7E606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MXuwAjHK
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so2703681c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794697342; x=1795302142; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ogoLg/UrKn4w2HbWGHqWFTtUp7LAKklTdIxHd1gOThQ=;
        b=MXuwAjHK3ryzzU4k/6N08wyMpBVAPV32D+CcCmN0rlUTaMDWUPzvLQ44/3LeLXDVWO
         rx9Xe+dlKZo+KGL05nuM+m0vH/8d8L5wcr/8+J6ub5UL7V/kpCI1EyOufNKb6t5H8QQx
         A0lVM1yUsLbvqpj/M6n5jiGzeYgdAEAJzNA0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697342; x=1795302142;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogoLg/UrKn4w2HbWGHqWFTtUp7LAKklTdIxHd1gOThQ=;
        b=ejw9+IVhA+O3vp69GzqGKJhcEHpNQp39keGLy+GZeLmf5OKMC3Pnl2W50RefGouNNf
         KaAkA/60XHazLLyrJh/qnuLfhEzce77GjwoWFJmGwYrm8TosOz1QlP0bezqRhX/ZPggt
         Ft2bBZippqiI+nTZ/zwzTANAtcQPuox3s486gh1pDWu+CXZOK7Q3AynMPRen6P8RLAaY
         VA1/txtVviJApTfE10Ug4iapPjm5+P5hFkwHJHC1BvhpDRgR92y0ZK6dRB5r3IqWx1z4
         vA9YEKmSh/ItSFD4EN6vy0+RyA2FtcjI7Imwrwf5xunC2biKdP0Asg6lpsFBRh9+Uw9W
         6xfA==
X-Forwarded-Encrypted: i=1; AL+hErGb5vUAf+XKz7GEs7dnMegh7lri/qb7EPAYa4CLmmbG3x2xtOzwKFO0h9PJApoWMLmXmniAv+c9hIxCR1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z861Yne/XmZAxfJqSLIt5duX+ht0AUP3vt+wnaQMToMfWL1tOAd
	IwV6SDnH6iDDO63HLY+CTe1gfXNLuBe0Ga/2MbFt+JNlMMgruZmP038KIcPfB15Pc8Q=
X-Gm-Gg: AYBFou0kJybK5m5cQ0/l/vLZSvmLtl9pCz75AUrEOgAYFpH6qQBWUK0l9ETzSaCCfiY
	O7fPcaxlGcTei8rr4ovMJyPmMUiyV1Y3OuNK9z/eGaMwLVDVIJRTfCBzyRxtWzaSYqiVuG0RbGN
	5aN13e9A3zNgPoMXY6L+NYiwwqPchxC8XlkXTiNGd5acIGtCYaiuPGhm+vn2bhtV3Xz+Qn3j7Zm
	vNGsYtsZ5Wqe2vAH0HvTan8uvlGegtgMec9fHoUKr2nPxVbaYawHU3EbcKLvAzOmssM/h2fyLaT
	Lbhtqib0ZYoZmxd0FC3YCtjk/7lGB7+t6nZtKDx7PKsFUbbd+B3ixmEN+mGkfqETzlnop4vBwH7
	6vfWxMd0l97Wty800KjDeUwUPFK8sdERVxQ/9IZfMUAL1Pm5Dgt7uQcuxCDPTkn6dQvVMpIM/Ev
	hd5DJCNJrFsZUNvxXefqZZX+fUw0aSyJ+iSYWwKh96jx/Q5UbBqPtlj8wlEi6oqVhOXiMqUgCqe
	6N3BEbkrbsNhwm8hmX1yzSb53rcK7SS67VDBKIyxtbRS8sFolKepekTmi479xZwEeIiXszx3OOM
	07GYJjFNZLv24oiIvU4OXHM242+Lz+8lymjpPbg7wKalo5NOA1USl4GoczcXY/JaB3iO2+hYrm/
	jX44m4g+HyLBxQSWO1mMaGRb5YfLVbXlhd2F0U2UJG8zt+kc1HJunolLIrUNJIgLKGNPw9iisRD
	Hig8b0kvT4PkqfN6eNEmAjA7fGu1QabRhDL2oXeD1aPJ/xc2kdiDW4cXy6rNcrByfOa7oFey/w0
	vb6tP/syb4c8OxTjXpX7P/Tdes6c2rDMA==
X-Received: by 2002:a05:701b:2810:b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b503124f1amr5429567c88.33.1794697342110;
        Sat, 14 Nov 2026 15:02:22 -0800 (PST)
Received: from [172.18.0.3] ([216.139.163.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm15078205c88.10.2026.11.14.15.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:02:20 -0800 (PST)
Date: Sat, 14 Nov 2026 15:02:01 -0800
From: Chris Down <chris@chrisdown.name>
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kfence: Allow selecting static keys mode at boot
In-Reply-To: <CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
References: <auA7FdubFEDVPB7v@chrisdown.name>
	<CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114150201.d428c3847d573be1@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Marco,

Marco Elver writes:
>On which systems have you found static keys to provide a significant
>improvement? Can you share benchmarks?

I don't have numbers that show a significant improvement. To be clear,
the hosts that use static keys have had it set that way since long
before I started looking at this, so it may well just be cargo culted
by now :-) Given that, I had a go at measuring the saving on its own.
It's there, but it's small.

 From a quick check I did in an 8 CPU x86 VM, a
kmem_cache_alloc()/kmem_cache_free() pair takes 8.0ns in static keys
mode, which is the same as with KFENCE off. With the dynamic branch it
takes 8.4ns. A kmalloc()/kfree() pair takes 13.3ns in all three. Both
are the same with either branch layout.

So static keys saves about half a nanosecond per allocation at best, in
a loop that does nothing else. At a million allocations a second on a
CPU, that accounts for 0.05% of it.

>IMHO, I was thinking of deleting the CONFIG_KFENCE_STATIC_KEYS mode,
>because on most systems, it's not worth the complexity for the small
>(if any) performance improvement anymore.

I agree, and I think the numbers above are enough evidence for that.
Deleting it is better than this patch, because all we want is one kernel
across the fleet, and that gets us there with less code. I'm happy to
send the removal, if you'd like.

Thanks!

Chris
