Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424539;
	b=scGveMHGYY4Tw+gv9eW5gcRDW/B8DITVlQGl2HATBAnwjxkTj9MesW+z7RWhKWXMCj+Y
	 Yl/1oWCBysbrvu+o9TQIv/vYuya5iYqE8tUJTbITBcA6EFa5Q8cqmN+iZzhkHw2MdPDI9
	 99OJa/RfNsEKdI6WBh6SFkqMdiGl5k8t1Wa+fFAuVduTWeNhQPWHnpjJZ7gUxauGY3QNd
	 H+ywOm4vJFg+u0QGduR6h2kDmMFHaxAnizxNAUrPNr41N4UxVxBxWJyY9cmy9mBCRuX6l
	 8Evk0omP0nzI8assh0ZnWoogsJPEf6HW9PPolEIcRbxSs3tET8KwCE+7Emryu12rK0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMgrhjGDM6hEQh8Aw9yzZbHzALMwxiGfaVEBL4NiDa0=;
	b=DKGUBdeVoMWoUyMmNy7w2UAKBP2KMDba875A6jh5mSbBrgsRW+jr4vMwiO0DdaIHpQ7A
	 hlUSlBC3Edt+lhmCBu/wx7/BN60Ndg3b+Hll7KSdGGhiyM2rVcQSIQHCM8GfYB4jhGI+R
	 Eio2y2eHN0EcjGZUib7HvaNVkhB302NZaHDIXKNu9K3RlFs/cWgFtw2TwXKirIowdCejY
	 9/Y4XGBuFjYDu7Y4DdmaRHQP1FLP1s7iA4z2h2Iaw+ehHohmHA0abdAwuTew6MSVIYa6p
	 9u8ZptG53dOGQv0QO2aTQjqFGETwWu+U+NxlAB3qi2we1gny+9KRoSU/vN+LbIJ9P8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtrAjbZ7;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B7607408E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564B7607408E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtrAjbZ7
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1517827a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424539; x=1793029339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMgrhjGDM6hEQh8Aw9yzZbHzALMwxiGfaVEBL4NiDa0=;
        b=mtrAjbZ7SAOmcOlZpgZxkhF3asxHxfJiQO3A09sNBNjc7sZcnqZ8/tI8OPhNsV76aL
         icwHtvXRU8zBKnGPZBb8g8/atROCdBAspRO3AOnTaGDloW5UL1AOKpaCJgfFA0w61vUt
         Wb6OWovFSxtr/1+hN3+q3+/ImDqABvueQrSaunej4SdbfvoDodpzUp3Osj1Qw9PdvBY3
         Fd1GKV2p+YYThzzjPGaZ+cjSiaCCN9iUM+Yz95vkA71FreJNIZ1JM+VsZ1kT44ehlZy2
         hgfjd37pjAxY6+EaGK0TzqFpaiZIvSdFGjXfbDIrCMGIkDkngyQji0Dmd7OkpBImGojh
         pUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424539; x=1793029339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMgrhjGDM6hEQh8Aw9yzZbHzALMwxiGfaVEBL4NiDa0=;
        b=gOlCT/qpZeHoDGBNqkICZrTBFxYwjVdyfnhorUBlZgPjRApZ2s549e1hfTVJlbBmry
         BfuSKSvt1NtL8gido0GSU9Obcfc7+HB6tr/O+mWJSFcRpI7hhNqY3GZef4+lTjF1GYjS
         dm76g0WQD5AoOyANGG3q3MdKz+SefHNlYzlRJ+libtEULHTqryEd+M8KIgeZ+9aURSFr
         RZAQJ7fLwU7KA6bv2FgGvMl9/6MetprlU4Xsw8W+bSW1K6TiSbk1Vhfmgsa/8ZIvoX1U
         sn4CabUB8OGb0sQ4ga25JFFWe9XQhqCalZ9wm9vvuRbkJqtkAmpP6XbUuj+he9YABpw0
         bbtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtBLvxTqZAGO3RCLBlCp54plzp0pdYV5SczgUiRIMLNtVC3aVI/SFeAUtkvkksJ+V1DCP+BN9xQbO8v84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnsFh1aBRhwXlrglSjl0vJyNDQewjgsVbPgoY8vKpPYIR8ZraZ
	o6PZSzWeny51glK/sVNurYP5dJ/yGrvf3VqWdDMb9SqG8YtTZGTHSAQV
X-Gm-Gg: AYBFou0KhrgeaHcUAmhZ+vDzl4lFbYKiIYfGyFu/as4vHm6v98lMlSAAXDvVh0xLclZ
	h1DUiYp78Q1PPoBIsm00Y3IiQrLpZI6UPtg3MT8gi51xOVsaztcUI062cwA1pwL+C3EapMBYYa/
	2PbR26ym3oHvTtuvsoZT6Hu5/5Ah/Zz7u3IKftAxqE/MhzEw437/Z0Q9s/1ykMts8tUATZMtN+Z
	9p/6+sawsXnCSTrH2baT4QQJx6/a060HbKt12NP0eH33xnQ5XazsaesWcDdJOXRu6zMRxa7YppM
	69SQxRLlItMWS1RSgzcnA7WqF5nQe1TF0+5M7BCCwA9DwOqnSRVg609sH316AwU/XP/TFBIlqpk
	fGAMvYfMv3TRMkFR6JhHzIsjaCjZ9kpyH/jomvuJa6JzG2As9OqRereWQYQv2qjNxaP2xPy0tC2
	HECEXHbkPl3udPVx0pZ2HpLRYYQ1LAQYd8cCan8pco46aNmVjGjcSd/tDlJp6ddU/V8d12
X-Received: by 2002:a17:90b:3d4e:b0:3ab:2c2b:1026 with SMTP id 98e67ed59e1d1-3acef0c8911mr6398917a91.34.1792424538542;
        Mon, 19 Oct 2026 08:42:18 -0700 (PDT)
Received: from hachimi ([101.5.170.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm3926364a12.20.2026.10.19.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:42:18 -0700 (PDT)
From: Lanfeng Wei <xlfylawarthur@gmail.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com,
	decui@microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longli@microsoft.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	regressions@lists.linux.dev,
	simona@ffwll.ch,
	ssengar@linux.microsoft.com,
	stable@vger.kernel.org,
	xlfylawarthur@gmail.com
Subject: Re: Re: [PATCH] drm/hyperv: add a parameter to disable the vblank timer
Date: Mon, 19 Oct 2026 23:40:43 +0800
Message-ID: <20261019154121.6257-1-xlfylawarthur@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c238f4ff-d5d8-4a9a-8773-793bd9056c9b@suse.de>
References: <c238f4ff-d5d8-4a9a-8773-793bd9056c9b@suse.de>
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

Hi Thomas, 

> Yeah, what's the cause of it? Switching off features does not fix any
> bugs or improve the status quo.

You are right that the module parameter is only a workaround for users
affected; it does not fix the underlying scheduling problem.

The cause is that the synthetic vblank timer is used to pace completion
of atomic updates triggered by dirtyfb, in addition to providing
synthetic vblank events. In Xorg's software-cursor path, pointer motion
damages the primary framebuffer and the damage is instantly submitted
via DRM_IOCTL_MODE_DIRTYFB. The Hyper-V dirtyfb path performs a
synchronous atomic commit, and with the vblank timer enabled that commit
can wait for the next simulated vblank. Under continuous pointer motion,
these commits dominate the update path and delay normal client updates,
resulting in sever frame-rate drops. 

This particular regression results from the combination of the blocking
dirtyfb path, synthetic vblank pacing, and the absence of a Linux DRM
cursor plane in Hyper-V. While the Hyper-V video protocol does have a
hardware-cursor command path, the upstream hyperv_drm driver currently
exposes only a primary plane. Cursor plane support was deferred during
the initial upstreaming [1]. Without a cursor plane, Xorg has to fall
back to software cursor-rendering path and it competes with periodic
graphical updates on the primary plane.

So the proper long-term fix could be adding cursor plane support in the
Hyper-V DRM driver, which may take some time. Providing that the stated
purpose of the offending commit is to rate-limit display updates, while
its current implementation regresses the existing software-cursor path,
I think adding a switch or reverting the commit until the requested
features in the driver is ready, is a reasonable short-term fix. 

> We had another fix for a problem with vblank timers:
>
> https://lore.kernel.org/dri-devel/20260914110004.211027-1-tzimmermann@suse.de/
>
> Did you validate that this fix is unrelated?

Yes I tested that fix and confirmed that it is irrelevant. It solves
issues with excessively long frame durations, however this problem is
found in normal frame updates (in my case 60Hz / 16.7 ms per frame, way
below INT_MAX).

Best regards,

Lanfeng Wei

[1] https://lore.kernel.org/dri-devel/20200622110623.113546-1-drawat.floss@gmail.com/ 
