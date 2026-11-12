Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519625;
	b=JizQu/q2WDfrTuhakUAvbaaadcpwQcgAjlUkKIkgBH+vXRQNorA3Z5HS94GXH3d2FVQE
	 C7p40hYCga3Sau1yfCTmthV0SGAeHiyrsh6pz4ehYG6r7OrRh9kIioytiaLx3WxD7kg0O
	 +hKR5MXmMtQJeMUEkf1SDTzcs17d+gXbO+Xa0lRrClSl54I5wtDw4l9CbJUv7KbEAToGZ
	 Nwkg4lJA0S2TetiM3Q6gge3k+zlDzHMTtOic/45Kd92KsgF6GtTkERApiLt5ewlL1Fofy
	 9SLBzuCLqvrns25coKV9v7uvkueJtCC4eVqId7elf3GzT27kR3NAZT+fwLTcnbeTZ4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=r7tUMESnGuHT04Vkq8tfouLXmNvcHODCZ4NpjFvO4WY=;
	b=fxz2iQAyrCAGc2I7d5lag1CUH1jHJKXJ8w0hc3hHFN2RdZqeH98Bz8LVYQggoYYmcpef
	 Cs80JhT4tDozMciXUV+g22U10Vx9BV6Dg8L7Bgmo7v7E6E5sqjxCrOlR6+6JmlpcUbXNe
	 bvisELjPHaWdbzkL6auIBRL5SdFNovCklecLkAImGL45/IlUC5V+0thXZnSVwTTV8/MgT
	 Ggp2Mvj2qZ410PTreLsueMyB0uddD0z2UHTUv2hjxHRDaPdv5wjQ0tmgI3OID0gj2rdnr
	 IU3BGzfx9H4HE0XYETksPAs3X2y2E2wePSTeqHlbu7RcWzQKAEE8qLKUuKGqi83KYPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lwKKxJ/J";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA2D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lwKKxJ/J
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df160bb9cso11546f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519623; x=1795124423; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r7tUMESnGuHT04Vkq8tfouLXmNvcHODCZ4NpjFvO4WY=;
        b=lwKKxJ/J9/7p2JXGfMiXSJxz20fys6eBBo8AFa2LIDeMBxpFiDBrs6g4UvyDxi51q3
         VnscTkd4nGY/6Fm4lA1hqeVSd9RfMPZK1uNSaRBvv6tQuiveQHsu0lZym718WQkD4mpK
         ItpHzn8eIu9MfLddvRb3yoQTtUXZDWjWx+VyfkUsPqVRJmItPEwYsgs4yJ5274Sosbui
         jpF4+RxIVAnIKoo+FkGyMINQrJUIyPXkJEjikOS/n7J6GYtxeTlnotfXJ80HjbMJ5Eyf
         3VbzX8PCUJkNvgtLOn1HG8WuxgED/uka07orXiNRulBwHWjMWvH/bVCNh6WMBya9nJdF
         +XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519623; x=1795124423;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7tUMESnGuHT04Vkq8tfouLXmNvcHODCZ4NpjFvO4WY=;
        b=Eehvd3ou2z9YNcaYwag6hlT8bjOupEt2WFUDKyg9hY++l79jYirVxCSIJbXXWFKm1G
         +7LxJu0RjnTn+4O8WUDYR/0I301U6WwY34xaHRWjD0WhiBIedFkjvl92e33KjGRrUQwY
         Srquz523oE6kS9Bo4XIWD2F0lG0NVeJIdVvSKo6rtNKKeycsAZLb8+WFI4V0WVzECnau
         71CNoRypv/1A4WkMicJZdCP51d1n4WFb13vL11+8/QPTmwQoG6NWKAhQdkXDbHkoMDLu
         XzSMqtWH2UjmDDcUFQxroH2tjQS336lO4Cd1zozc7mtA/cWY1j5bp3NWlFNDYtdlUk1n
         /xIg==
X-Forwarded-Encrypted: i=1; AL+hErGSde4xt7ZvD3R3mBrdHD5P5WuKhffDqlqMzw8BMonPDJROB4PwdMrSfYQ6d/jsqIKJLjVqRRFxIbQ8qIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/hO7uga3KbmD26dY2V0UNKitOIQxOxZbSXBVwfGmYENzAvb7E
	z4aRBWmnd6ejokrNH6k2C07YP0v9bbQyM4ZEvxbamGjKOThBzObg822G
X-Gm-Gg: AYBFou0dueFaGuCMddS0REsHBt4/hkUzlOW4O623ERH+ccbhHsQ8SWbNB0sg8hD87OK
	AWssevIHfrVV8ngbgySBiAodMCJKOCq1Ygs2QZVWjdpkx30z9gRvYEGEt7kkSeAkObqu94RVrQz
	diM7e1mm70LLE+mf1FtGcTYxQzY7syL1QAP8oePZdtVoBI9I3zW43mSFLnXu4DIMSkQQ3O4qctx
	rhIBlLuvGVIcvJBT5g5X2+rn801tcfCf59tQQHA51MLpvAHQYISfIYSNK7JUyZ4raS/X4Y4T+Gg
	4iKt2xGq3W36asf+6BAuMQJlSGIOcQKChzR9IrpXbkVmvAAuYVxtcv05wLZQ9tFEBCaejf/c3wA
	ntKt4dqhhV6vQyrEMV1DftC5csXFb4XuL56SQcr0FdXjhmCSqkhisnZx6dALgUIk3J5ceCshFua
	OV+y1wsFduGy1crST9NIzI048N7RHl96Y54uLpqcHlvYuBF+VCElC1eEblSkAwV+T6HAkf4GQnZ
	vfAQyO2S4YmSo7ef4Wld3jV5z2ufKd1xL+bh0SE9hHpJIZ+YbTnWmBGNN5roD7cUu+SkLRTGah8
	vTE5JcwVsQ54EVMBJeNWDCNepxwFknTxABQS2I1yZ7BE5kJwB2htBWJsk30PaObt78YcTVEOnfk
	BVmholAI=
X-Received: by 2002:a05:6000:40cd:b0:492:b1c5:6dc3 with SMTP id ffacd0b85a97d-49c723fc6f9mr1514901f8f.6.1794519623235;
        Thu, 12 Nov 2026 13:40:23 -0800 (PST)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm1279890f8f.29.2026.11.12.13.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:40:22 -0800 (PST)
From: Marek Czernohous <mczernohous@gmail.com>
To: Beomseok Kim <dilddream31@gmail.com>
Cc: nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Fab Stz <fabstz-it@yahoo.fr>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
Date: Thu, 12 Nov 2026 22:40:21 +0100
Message-ID: <179451962164.1494544.10983579250194846394@gmail.com>
In-Reply-To: <20260928081450.19340-1-dilddream31@gmail.com>
References: <20260928081450.19340-1-dilddream31@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 28 Sep 2026 17:14:50 +0900, Beomseok Kim <dilddream31@gmail.com> wrote:
> nouveau_fence_signal() clears fence->channel before dropping its
> reference.  nouveau_fence_no_signaling(), however, removes an already
> signaled fence from fctx->pending without clearing the pointer.

[...]

> @@ -488,6 +488,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
>  	 */
>  	if (nouveau_fence_is_signaled(f)) {
>  		list_del(&fence->head);
> +		rcu_assign_pointer(fence->channel, NULL);

I think this patch fixes drm/nouveau#443 [1]. The nouveau_fence_sync()
oopses there and in the reporter's thread [2] (MCP79, Debian 6.12.43,
6.12.90 and 7.0.10) all fault at CR2 0x40 on the prev->cli->drm load,
with prev taken from f->channel and prev->cli NULL. A channel's cli is
never cleared, so prev most likely points to a freed channel. That is
the stale pointer described above: the no-signaling path is the only
way off fctx->pending that leaves fence->channel set, and
nouveau_fence_context_kill() only walks fctx->pending.

The fix looks right to me. enable_signaling runs under the fence lock
(&fctx->lock) while the fence is still on fctx->pending, so the new
store happens before nouveau_fence_context_kill() takes that lock, and
thus before the synchronize_rcu() in nouveau_fence_context_del(). With
fence->channel NULL, nouveau_fence_sync() falls back to dma_fence_wait()
on an already signaled fence.

Emmanuel Fleury's prev->cli check for the same oops [3] only helps when
the freed memory reads back as zero, so I prefer this patch.

The patch applies to 6.12.y with an offset; compile-tested there with
W=1 only. I have asked the reporter (Cc'd) to test it.

I did this review with help from Claude (claude-opus-5-5).

Reviewed-by: Marek Czernohous <marek@czernohous.de>

[1] https://gitlab.freedesktop.org/drm/nouveau/-/issues/443
[2] https://lore.freedesktop.org/nouveau/b7f523dc-fe41-4514-a1a5-747005311cbe@yahoo.fr/
[3] https://lore.freedesktop.org/nouveau/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr/
